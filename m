Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78063225D99
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jul 2020 13:42:23 +0200 (CEST)
Received: from localhost ([::1]:56124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxUBa-0004RP-47
	for lists+qemu-devel@lfdr.de; Mon, 20 Jul 2020 07:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jxU7P-0007HX-36; Mon, 20 Jul 2020 07:38:03 -0400
Received: from charlie.dont.surf ([128.199.63.193]:46836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jxU7L-00059n-La; Mon, 20 Jul 2020 07:38:02 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 3F276BF879;
 Mon, 20 Jul 2020 11:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=irrelevant.dk;
 s=default; t=1595245078;
 bh=HAqpOGJaC/4LpZxDWEbsK51qKSV7qbQfTK+L8lPlsK4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a+FfypxfdElEyEGbDltl5Ivema5RdrhXWiXXa891KoqrfITc4GdPuBOeqJsWdrP1P
 JW6ePqOXHvj0A76crypnkjwLwdlLGBQFmsODvFSWoF/tovS1ZWSdek6JsH6NBOG/yI
 nuF5XvmMqqTdrrbAAb9+hDiw06D61z2KR+WSjS4kiVNWSn0B1b3LI68dDM5nbHvIvp
 EhPakUDhzWR6tQm4ezkKtRu0dyufNxX3qTsKlB0SUSwLh+oCbpzJzx5+rBNMTZz/pK
 v55d1kGlBG3hG+x63RVhCYsnD0PMFWUVqU3uVzTG1vrrX/DjgFQRAZr0sI2oIwFJxM
 HSPXriYo09TiA==
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/16] hw/block/nvme: remove redundant has_sg member
Date: Mon, 20 Jul 2020 13:37:36 +0200
Message-Id: <20200720113748.322965-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200720113748.322965-1-its@irrelevant.dk>
References: <20200720113748.322965-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/20 07:37:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Remove the has_sg member from NvmeRequest since it's redundant.

Also, make sure the request iov is destroyed at completion time.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 hw/block/nvme.c | 11 ++++++-----
 hw/block/nvme.h |  1 -
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index cb236d1c8c46..6a1a1626b87b 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -548,16 +548,20 @@ static void nvme_rw_cb(void *opaque, int ret)
         block_acct_failed(blk_get_stats(n->conf.blk), &req->acct);
         req->status = NVME_INTERNAL_DEV_ERROR;
     }
-    if (req->has_sg) {
+
+    if (req->qsg.nalloc) {
         qemu_sglist_destroy(&req->qsg);
     }
+    if (req->iov.nalloc) {
+        qemu_iovec_destroy(&req->iov);
+    }
+
     nvme_enqueue_req_completion(cq, req);
 }
 
 static uint16_t nvme_flush(NvmeCtrl *n, NvmeNamespace *ns, NvmeCmd *cmd,
     NvmeRequest *req)
 {
-    req->has_sg = false;
     block_acct_start(blk_get_stats(n->conf.blk), &req->acct, 0,
          BLOCK_ACCT_FLUSH);
     req->aiocb = blk_aio_flush(n->conf.blk, nvme_rw_cb, req);
@@ -583,7 +587,6 @@ static uint16_t nvme_write_zeros(NvmeCtrl *n, NvmeNamespace *ns, NvmeCmd *cmd,
         return NVME_LBA_RANGE | NVME_DNR;
     }
 
-    req->has_sg = false;
     block_acct_start(blk_get_stats(n->conf.blk), &req->acct, 0,
                      BLOCK_ACCT_WRITE);
     req->aiocb = blk_aio_pwrite_zeroes(n->conf.blk, offset, count,
@@ -621,7 +624,6 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeNamespace *ns, NvmeCmd *cmd,
     }
 
     if (req->qsg.nsg > 0) {
-        req->has_sg = true;
         block_acct_start(blk_get_stats(n->conf.blk), &req->acct, req->qsg.size,
                          acct);
         req->aiocb = is_write ?
@@ -630,7 +632,6 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeNamespace *ns, NvmeCmd *cmd,
             dma_blk_read(n->conf.blk, &req->qsg, data_offset, BDRV_SECTOR_SIZE,
                          nvme_rw_cb, req);
     } else {
-        req->has_sg = false;
         block_acct_start(blk_get_stats(n->conf.blk), &req->acct, req->iov.size,
                          acct);
         req->aiocb = is_write ?
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 0b6a8ae66559..5519b5cc7686 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -22,7 +22,6 @@ typedef struct NvmeRequest {
     struct NvmeSQueue       *sq;
     BlockAIOCB              *aiocb;
     uint16_t                status;
-    bool                    has_sg;
     NvmeCqe                 cqe;
     BlockAcctCookie         acct;
     QEMUSGList              qsg;
-- 
2.27.0


