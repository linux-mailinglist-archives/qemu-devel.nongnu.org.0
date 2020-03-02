Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC11175B15
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 14:01:32 +0100 (CET)
Received: from localhost ([::1]:60542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8khO-0002Jv-NY
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 08:01:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47385)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1j8kfr-0001ZR-Go
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 07:59:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1j8kfp-0008Vi-O1
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 07:59:55 -0500
Received: from mail.ispras.ru ([83.149.199.45]:37128)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1j8kfp-0008Uw-CB
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 07:59:53 -0500
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id C161FC0111;
 Mon,  2 Mar 2020 15:59:50 +0300 (MSK)
Subject: [PATCH] icount: make dma reads deterministic
From: Pavel Dovgalyuk <pavel.dovgaluk@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 02 Mar 2020 15:59:50 +0300
Message-ID: <158315399043.847.4021939910752786131.stgit@pasha-Precision-3630-Tower>
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
It skips SG parts that were already affected by prior reads
within the same request. Parts that are non identical, but are just
overlapped, are trimmed.

Examples for different SG part sequences:

1)
A1 1000
A1 1000
->
A1 1000

2)
A1 1000
A2 1000
A1 1000
A3 1000
->
Two requests with different offsets, because second A1/1000 should be skipped.
A1 1000
A2 1000
--
A3 1000

3)
A1 800
A2 1000
A1 1000
->
First 800 bytes of third SG are skipped.
A1 800
A2 1000
--
A1+800 800

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
---
 dma-helpers.c |   57 +++++++++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 53 insertions(+), 4 deletions(-)

diff --git a/dma-helpers.c b/dma-helpers.c
index e8a26e81e1..d71512f707 100644
--- a/dma-helpers.c
+++ b/dma-helpers.c
@@ -13,6 +13,7 @@
 #include "trace-root.h"
 #include "qemu/thread.h"
 #include "qemu/main-loop.h"
+#include "sysemu/cpus.h"
 
 /* #define DEBUG_IOMMU */
 
@@ -139,17 +140,65 @@ static void dma_blk_cb(void *opaque, int ret)
     dma_blk_unmap(dbs);
 
     while (dbs->sg_cur_index < dbs->sg->nsg) {
+        bool skip = false;
         cur_addr = dbs->sg->sg[dbs->sg_cur_index].base + dbs->sg_cur_byte;
         cur_len = dbs->sg->sg[dbs->sg_cur_index].len - dbs->sg_cur_byte;
-        mem = dma_memory_map(dbs->sg->as, cur_addr, &cur_len, dbs->dir);
-        if (!mem)
-            break;
-        qemu_iovec_add(&dbs->iov, mem, cur_len);
+
+        /*
+         * Make reads deterministic in icount mode.
+         * Windows sometimes issues disk read requests with
+         * overlapping SGs. It leads to non-determinism, because
+         * resulting buffer contents may be mixed from several
+         * sectors.
+         * This code crops SGs that were already read in this request.
+         */
+        if (use_icount
+            && dbs->dir == DMA_DIRECTION_FROM_DEVICE) {
+            int i;
+            for (i = 0 ; i < dbs->sg_cur_index ; ++i) {
+                if (dbs->sg->sg[i].base <= cur_addr
+                    && dbs->sg->sg[i].base + dbs->sg->sg[i].len > cur_addr) {
+                    cur_len = MIN(cur_len,
+                        dbs->sg->sg[i].base + dbs->sg->sg[i].len - cur_addr);
+                    skip = true;
+                    break;
+                } else if (cur_addr <= dbs->sg->sg[i].base
+                    && cur_addr + cur_len > dbs->sg->sg[i].base) {
+                    cur_len = dbs->sg->sg[i].base - cur_addr;
+                    break;
+                }
+            }
+        }
+
+        assert(cur_len);
+        if (!skip) {
+            mem = dma_memory_map(dbs->sg->as, cur_addr, &cur_len, dbs->dir);
+            if (!mem)
+                break;
+            qemu_iovec_add(&dbs->iov, mem, cur_len);
+        } else {
+            if (dbs->iov.size != 0) {
+                break;
+            }
+            /* skip this SG */
+            dbs->offset += cur_len;
+        }
+
         dbs->sg_cur_byte += cur_len;
         if (dbs->sg_cur_byte == dbs->sg->sg[dbs->sg_cur_index].len) {
             dbs->sg_cur_byte = 0;
             ++dbs->sg_cur_index;
         }
+
+        /*
+         * All remaining SGs were skipped.
+         * This is not reschedule case, because we already
+         * performed the reads, and the last SGs were skipped.
+         */
+        if (dbs->sg_cur_index == dbs->sg->nsg && dbs->iov.size == 0) {
+            dma_complete(dbs, ret);
+            return;
+        }
     }
 
     if (dbs->iov.size == 0) {


