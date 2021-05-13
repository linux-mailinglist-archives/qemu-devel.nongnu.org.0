Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C79B37F6EF
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 13:42:18 +0200 (CEST)
Received: from localhost ([::1]:51008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh9jN-0003Cs-46
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 07:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1lh9fl-0001be-L7
 for qemu-devel@nongnu.org; Thu, 13 May 2021 07:38:34 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:22876
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1lh9fj-0001Om-0s
 for qemu-devel@nongnu.org; Thu, 13 May 2021 07:38:33 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3Ab+o7NqEjfSaCMwmFpLqEjceALOsnbusQ8zAX?=
 =?us-ascii?q?PiFKKSC9Hfb0qynDpp4mPHzP6Qr5OktOpTnoAsDpKk80naQFgrX5Vo3PYOCJgg?=
 =?us-ascii?q?WVEL0=3D?=
X-IronPort-AV: E=Sophos;i="5.82,296,1613404800"; d="scan'208";a="108248986"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 May 2021 19:38:23 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id DF3B04D0B8AB;
 Thu, 13 May 2021 19:38:22 +0800 (CST)
Received: from G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 13 May 2021 19:38:17 +0800
Received: from G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) by
 G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 13 May 2021 19:38:16 +0800
Received: from FNSTPC.g08.fujitsu.local (10.167.226.45) by
 G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Thu, 13 May 2021 19:38:16 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH] migration/rdma: Fix cm_event used before being initialized
Date: Thu, 13 May 2021 19:37:50 +0800
Message-ID: <20210513113750.22970-1-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: DF3B04D0B8AB.AE16F
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

A segmentation fault was triggered when i try to abort a postcopy + rdma
migration.

since rdma_ack_cm_event releases a uninitialized cm_event in thise case.

like below:
2496     ret = rdma_get_cm_event(rdma->channel, &cm_event);
2497     if (ret) {
2498         perror("rdma_get_cm_event after rdma_connect");
2499         ERROR(errp, "connecting to destination!");
2500         rdma_ack_cm_event(cm_event); <<<< cause segmentation fault
2501         goto err_rdma_source_connect;
2502     }

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 migration/rdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 00eac34232..2dadb62aed 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -2466,7 +2466,7 @@ static int qemu_rdma_connect(RDMAContext *rdma, Error **errp)
                                           .private_data = &cap,
                                           .private_data_len = sizeof(cap),
                                         };
-    struct rdma_cm_event *cm_event;
+    struct rdma_cm_event *cm_event = NULL;
     int ret;
 
     /*
-- 
2.30.2




