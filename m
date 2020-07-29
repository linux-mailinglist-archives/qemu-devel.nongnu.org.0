Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D47E323275B
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 00:08:57 +0200 (CEST)
Received: from localhost ([::1]:45970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0uFs-0000dR-RS
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 18:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1k0uDp-0006pb-QJ; Wed, 29 Jul 2020 18:06:49 -0400
Received: from charlie.dont.surf ([128.199.63.193]:34652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1k0uDl-0008Uo-LN; Wed, 29 Jul 2020 18:06:49 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id B38D8BFB1B;
 Wed, 29 Jul 2020 22:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=irrelevant.dk;
 s=default; t=1596060404;
 bh=gaSXug6OTT5lsGtaZf6tpFvYStUuN+R0OklGaDtBDtA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rgPI/R2It/AZpZ5VlpIhA2IGY86IwErbfdWz7a2ZkUoqy5UJKZTN8DglE/uFxFSMg
 CQXzKQ2hH7bBH4++KlcN1SfZdE9Z/mQOS/CxZFgNt8cHadIyiBRgmA3/Pxt6an9swI
 TjxJDoOwq6v3JmfpLu0WZkDatcZt9mGBzR9ZsZH6ahlkqfXQBwQ4HN0gYojG1nCIY4
 YF6YylvsVbZYnpdkxE6UrucQ4LEWZazrLrjlTspbiO+2NztCmV2jhhDzbZOT0C98pu
 HWQl3k/eGv+CdaElXMwPh5CMRjDotbvIMRiGzaUvnfuViiea5Om1mwWfGBxK1epAZU
 655Kn9t7+UaQA==
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/16] hw/block/nvme: replace dma_acct with blk_acct
 equivalent
Date: Thu, 30 Jul 2020 00:06:25 +0200
Message-Id: <20200729220638.344477-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200729220638.344477-1-its@irrelevant.dk>
References: <20200729220638.344477-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 14:23:15
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Andrzej Jakowski <andrzej.jakowski@linux.intel.com>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Keith Busch <kbusch@kernel.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The QSG isn't always initialized, so accounting could be wrong. Issue a
call to blk_acct_start instead with the size taken from the QSG or IOV
depending on the kind of I/O.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 0422d4397d76..d60b19e1840f 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -622,9 +622,10 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeNamespace *ns, NvmeCmd *cmd,
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
-    dma_acct_start(n->conf.blk, &req->acct, &req->qsg, acct);
     if (req->qsg.nsg > 0) {
         req->has_sg = true;
+        block_acct_start(blk_get_stats(n->conf.blk), &req->acct, req->qsg.size,
+                         acct);
         req->aiocb = is_write ?
             dma_blk_write(n->conf.blk, &req->qsg, data_offset, BDRV_SECTOR_SIZE,
                           nvme_rw_cb, req) :
@@ -632,6 +633,8 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeNamespace *ns, NvmeCmd *cmd,
                          nvme_rw_cb, req);
     } else {
         req->has_sg = false;
+        block_acct_start(blk_get_stats(n->conf.blk), &req->acct, req->iov.size,
+                         acct);
         req->aiocb = is_write ?
             blk_aio_pwritev(n->conf.blk, data_offset, &req->iov, 0, nvme_rw_cb,
                             req) :
-- 
2.27.0


