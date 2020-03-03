Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B875E1775DB
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 13:27:35 +0100 (CET)
Received: from localhost ([::1]:46380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j96e6-00025g-7K
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 07:27:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45873)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1j96dE-0001e8-JB
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 07:26:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1j96dD-00021S-5O
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 07:26:40 -0500
Received: from mail.ispras.ru ([83.149.199.45]:60138)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1j96dC-000210-UJ
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 07:26:39 -0500
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id E2257C010E;
 Tue,  3 Mar 2020 15:26:36 +0300 (MSK)
Subject: [PATCH v2] icount: make dma reads deterministic
From: Pavel Dovgalyuk <pavel.dovgaluk@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 03 Mar 2020 15:26:36 +0300
Message-ID: <158323839655.22833.2201521760155801620.stgit@pasha-Precision-3630-Tower>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 83.149.199.45
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, dovgaluk@ispras.ru, jsnow@redhat.com,
 pavel.dovgaluk@ispras.ru, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Windows guest sometimes makes DMA requests with overlapping
target addresses. This leads to the following structure of iov for
the block driver:

addr size1
addr size2
addr size3

It means that three adjacent disk blocks should be read into the same
memory buffer. Windows does not expects anything from these bytes
(should it be data from the first block, or the last one, or some mix),
but uses them somehow. It leads to non-determinism of the guest execution,
because block driver does not preserve any order of reading.

This situation was discusses in the mailing list at least twice:
https://lists.gnu.org/archive/html/qemu-devel/2010-09/msg01996.html
https://lists.gnu.org/archive/html/qemu-devel/2020-02/msg05185.html

This patch makes such disk reads deterministic in icount mode.
It splits the whole request into several parts. Parts may overlap,
but SGs inside one part do not overlap.
Parts that are processed later overwrite the prior ones in case
of overlapping.

Examples for different SG part sequences:

1)
A1 1000
A2 1000
A1 1000
A3 1000
->
One request is split into two.
A1 1000
A2 1000
--
A1 1000
A3 1000

2)
A1 800
A2 1000
A1 1000
->
A1 800
A2 1000
--
A1 1000

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>

--

v2:
 - Rewritten the loop to split the request instead of skipping the parts
   (suggested by Kevin Wolf)
---
 dma-helpers.c |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/dma-helpers.c b/dma-helpers.c
index e8a26e81e1..959e114595 100644
--- a/dma-helpers.c
+++ b/dma-helpers.c
@@ -13,6 +13,8 @@
 #include "trace-root.h"
 #include "qemu/thread.h"
 #include "qemu/main-loop.h"
+#include "sysemu/cpus.h"
+#include "qemu/range.h"
 
 /* #define DEBUG_IOMMU */
 
@@ -142,6 +144,23 @@ static void dma_blk_cb(void *opaque, int ret)
         cur_addr = dbs->sg->sg[dbs->sg_cur_index].base + dbs->sg_cur_byte;
         cur_len = dbs->sg->sg[dbs->sg_cur_index].len - dbs->sg_cur_byte;
         mem = dma_memory_map(dbs->sg->as, cur_addr, &cur_len, dbs->dir);
+        /*
+         * Make reads deterministic in icount mode. Windows sometimes issues
+         * disk read requests with overlapping SGs. It leads
+         * to non-determinism, because resulting buffer contents may be mixed
+         * from several sectors. This code splits all SGs into several
+         * groups. SGs in every group do not overlap.
+         */
+        if (use_icount && dbs->dir == DMA_DIRECTION_FROM_DEVICE) {
+            int i;
+            for (i = 0 ; i < dbs->iov.niov ; ++i) {
+                if (ranges_overlap((intptr_t)dbs->iov.iov[i].iov_base, dbs->iov.iov[i].iov_len,
+                                   (intptr_t)mem, cur_len)) {
+                    mem = NULL;
+                    break;
+                }
+            }
+        }
         if (!mem)
             break;
         qemu_iovec_add(&dbs->iov, mem, cur_len);


