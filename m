Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73277225DB3
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jul 2020 13:46:07 +0200 (CEST)
Received: from localhost ([::1]:42128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxUFC-0001lo-Ef
	for lists+qemu-devel@lfdr.de; Mon, 20 Jul 2020 07:46:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jxU7l-00082d-E2; Mon, 20 Jul 2020 07:38:25 -0400
Received: from charlie.dont.surf ([128.199.63.193]:46908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jxU7j-0005BX-My; Mon, 20 Jul 2020 07:38:25 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 7A549BF7BC;
 Mon, 20 Jul 2020 11:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=irrelevant.dk;
 s=default; t=1595245081;
 bh=NdHcDEjfx0CpKEm33zR5lsluKrc/d76xJefhFOLOPxs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mlLH82CEwjJ3Q+N4NqG03+EPGBU44CYNHE4zidMGBOBcz5daEN6mjKOjqzCoNI6lQ
 7nu/M0llPysVNyzVC7T9IVm5lZDbh7M8ofVc9YKCN8BoWdV18VWQcS4+4eck8Ggppv
 RhiCNM0gZ+Glv4WtavW4mXBfH6jjHvcH6baruM6jL9HgocURh2Oh09Xpvt4z3D9iZq
 w1lwhq/9kcHPFEC2DSI8w6e1iqDxqgLg2UrCnVeb7gRp6d9oI49atLL/PyxXkErlvK
 PrK7yPR4kWBbZy1ypipwlrqSruLfJPmjuHdLeGXyNwyCl83TmSl0zBVUowdINNq5hX
 NDsDzUYUIYKMw==
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/16] hw/block/nvme: refactor NvmeRequest clearing
Date: Mon, 20 Jul 2020 13:37:44 +0200
Message-Id: <20200720113748.322965-13-its@irrelevant.dk>
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
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Move clearing of the structure from "clear before use" to "clear
after use".

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index e2932239c661..431f26c2f589 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -209,6 +209,11 @@ static void nvme_irq_deassert(NvmeCtrl *n, NvmeCQueue *cq)
     }
 }
 
+static void nvme_req_clear(NvmeRequest *req)
+{
+    memset(&req->cqe, 0x0, sizeof(req->cqe));
+}
+
 static uint16_t nvme_map_addr_cmb(NvmeCtrl *n, QEMUIOVector *iov, hwaddr addr,
                                   size_t len)
 {
@@ -458,6 +463,7 @@ static void nvme_post_cqes(void *opaque)
         nvme_inc_cq_tail(cq);
         pci_dma_write(&n->parent_obj, addr, (void *)&req->cqe,
             sizeof(req->cqe));
+        nvme_req_clear(req);
         QTAILQ_INSERT_TAIL(&sq->req_list, req, entry);
     }
     if (cq->tail != cq->head) {
@@ -1601,7 +1607,6 @@ static void nvme_process_sq(void *opaque)
         req = QTAILQ_FIRST(&sq->req_list);
         QTAILQ_REMOVE(&sq->req_list, req, entry);
         QTAILQ_INSERT_TAIL(&sq->out_req_list, req, entry);
-        memset(&req->cqe, 0, sizeof(req->cqe));
         req->cqe.cid = cmd.cid;
 
         status = sq->sqid ? nvme_io_cmd(n, &cmd, req) :
-- 
2.27.0


