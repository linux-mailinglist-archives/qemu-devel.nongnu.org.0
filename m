Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 137C71EC935
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jun 2020 08:00:04 +0200 (CEST)
Received: from localhost ([::1]:59474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgMRX-0000yo-24
	for lists+qemu-devel@lfdr.de; Wed, 03 Jun 2020 02:00:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Pavel.Dovgaluk@gmail.com>)
 id 1jgMQk-0008WA-2s
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 01:59:14 -0400
Received: from mail.ispras.ru ([83.149.199.45]:48020)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Pavel.Dovgaluk@gmail.com>) id 1jgMQj-0000g6-9h
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 01:59:13 -0400
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 2ACE1CD465;
 Wed,  3 Jun 2020 08:59:11 +0300 (MSK)
Subject: [PATCH v3] icount: make dma reads deterministic
From: Pavel Dovgalyuk <Pavel.Dovgaluk@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 03 Jun 2020 08:59:10 +0300
Message-ID: <159116395091.22816.13419928650373077476.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: softfail client-ip=83.149.199.45;
 envelope-from=Pavel.Dovgaluk@gmail.com; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/03 01:57:57
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: 7
X-Spam_score: 0.7
X-Spam_bar: /
X-Spam_report: (0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FROM=0.001, NML_ADSP_CUSTOM_MED=0.9,
 SPF_SOFTFAIL=0.665, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, mreitz@redhat.com,
 dovgaluk@ispras.ru, pavel.dovgaluk@ispras.ru, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgaluk@gmail.com>

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
v3:
 - Added dma_memory_unmap for skipped requests (suggested by Kevin Wolf)
---
 0 files changed

diff --git a/dma-helpers.c b/dma-helpers.c
index e8a26e81e1..f7a0bb8a85 100644
--- a/dma-helpers.c
+++ b/dma-helpers.c
@@ -13,6 +13,8 @@
 #include "trace-root.h"
 #include "qemu/thread.h"
 #include "qemu/main-loop.h"
+#include "sysemu/cpus.h"
+#include "qemu/range.h"
 
 /* #define DEBUG_IOMMU */
 
@@ -142,6 +144,26 @@ static void dma_blk_cb(void *opaque, int ret)
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
+                if (ranges_overlap((intptr_t)dbs->iov.iov[i].iov_base,
+                                   dbs->iov.iov[i].iov_len, (intptr_t)mem,
+                                   cur_len)) {
+                    dma_memory_unmap(dbs->sg->as, mem, cur_len,
+                                     dbs->dir, cur_len);
+                    mem = NULL;
+                    break;
+                }
+            }
+        }
         if (!mem)
             break;
         qemu_iovec_add(&dbs->iov, mem, cur_len);


