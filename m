Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 528353B599B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 09:17:05 +0200 (CEST)
Received: from localhost ([::1]:57256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxlVw-0008VM-Dp
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 03:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1lxlUU-0007jP-JL
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 03:15:34 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:28460
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1lxlUS-0008BB-B4
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 03:15:34 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AjDgTS65g4PEWRBGHFAPXwCDXdLJyesId70hD?=
 =?us-ascii?q?6qhwISY6TiX+rbHLoB17726StN9/YhEdcLy7VJVoIkmskKKdg7NhXotKNTOO0A?=
 =?us-ascii?q?DDQb2KhrGC/9SPIULDH5ZmpMVdmrZFeabNJGk/ncDn+xO5Dtpl5NGG9ZqjjeDY?=
 =?us-ascii?q?w2wFd3ASV4hQqxd+Fh2AElB7AC1PBZ8CHpKa4cZd4xW6f3B/VLXCOlA1G/jEu8?=
 =?us-ascii?q?bQlI/rJToPBxsc4gGIij+yrJ7WeiLouCsjbw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.83,305,1616428800"; d="scan'208";a="110273889"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 28 Jun 2021 15:15:27 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 367664D0C4C2;
 Mon, 28 Jun 2021 15:15:25 +0800 (CST)
Received: from G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 28 Jun 2021 15:15:25 +0800
Received: from localhost.localdomain (10.167.225.141) by
 G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Mon, 28 Jun 2021 15:15:25 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH] migration/rdma: Use error_report to suppress errno message
Date: Mon, 28 Jun 2021 15:19:59 +0800
Message-ID: <20210628071959.23455-1-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: 367664D0C4C2.AB6C1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lizhijian@fujitsu.com
Received-SPF: neutral client-ip=183.91.158.132;
 envelope-from=lizhijian@fujitsu.com; helo=heian.cn.fujitsu.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.779 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since the prior calls are successful, in this case a errno doesn't
indicate a real error which would just make us confused.

before:
(qemu) migrate -d rdma:192.168.22.23:8888
source_resolve_host RDMA Device opened: kernel name rxe_eth0 uverbs device name uverbs2, infiniband_verbs class device path /sys/class/infiniband_verbs/uverbs2, infiniband class device path /sys/class/infiniband/rxe_eth0, transport: (2) Ethernet
rdma_get_cm_event != EVENT_ESTABLISHED after rdma_connect: No space left on device

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 migration/rdma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index d90b29a4b51..b6cc4bef4a8 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -1006,7 +1006,7 @@ route:
     if (cm_event->event != RDMA_CM_EVENT_ADDR_RESOLVED) {
         ERROR(errp, "result not equal to event_addr_resolved %s",
                 rdma_event_str(cm_event->event));
-        perror("rdma_resolve_addr");
+        error_report("rdma_resolve_addr");
         rdma_ack_cm_event(cm_event);
         ret = -EINVAL;
         goto err_resolve_get_addr;
@@ -2544,7 +2544,7 @@ static int qemu_rdma_connect(RDMAContext *rdma, Error **errp, bool return_path)
     }
 
     if (cm_event->event != RDMA_CM_EVENT_ESTABLISHED) {
-        perror("rdma_get_cm_event != EVENT_ESTABLISHED after rdma_connect");
+        error_report("rdma_get_cm_event != EVENT_ESTABLISHED after rdma_connect");
         ERROR(errp, "connecting to destination!");
         rdma_ack_cm_event(cm_event);
         goto err_rdma_source_connect;
-- 
2.31.1




