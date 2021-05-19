Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB7E3888D5
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 09:58:16 +0200 (CEST)
Received: from localhost ([::1]:57178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljH5s-0004qD-2T
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 03:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1ljH4L-0003aS-9h
 for qemu-devel@nongnu.org; Wed, 19 May 2021 03:56:41 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:5559
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1ljH4J-0004xD-2k
 for qemu-devel@nongnu.org; Wed, 19 May 2021 03:56:41 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AqZO0CammnlQiijRlzBysBjd2oZbpDfIQ3DAb?=
 =?us-ascii?q?v31ZSRFFG/Fw9vre+MjzsCWYtN9/Yh8dcK+7UpVoLUm8yXcX2/h1AV7BZniEhI?=
 =?us-ascii?q?LAFugLgrcKqAeQeREWmNQ86Y5QN4B6CPDVSWNxlNvG5mCDeOoI8Z2q97+JiI7l?=
 =?us-ascii?q?o0tQcQ=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.82,312,1613404800"; d="scan'208";a="108461986"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 19 May 2021 15:56:34 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 5DE3E4D0BA81;
 Wed, 19 May 2021 15:56:28 +0800 (CST)
Received: from G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 19 May 2021 15:56:22 +0800
Received: from G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) by
 G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 19 May 2021 15:56:21 +0800
Received: from FNSTPC.g08.fujitsu.local (10.167.226.45) by
 G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Wed, 19 May 2021 15:56:23 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH v2] migration/rdma: Fix cm_event used before being initialized
Date: Wed, 19 May 2021 14:47:40 +0800
Message-ID: <20210519064740.10828-1-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: 5DE3E4D0BA81.AE56B
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

since rdma_ack_cm_event releases a uninitialized cm_event in these case.

like below:
2496     ret = rdma_get_cm_event(rdma->channel, &cm_event);
2497     if (ret) {
2498         perror("rdma_get_cm_event after rdma_connect");
2499         ERROR(errp, "connecting to destination!");
2500         rdma_ack_cm_event(cm_event); <<<< cause segmentation fault
2501         goto err_rdma_source_connect;
2502     }

Refer to the rdma_get_cm_event() code, cm_event will be
updated/changed only if rdma_get_cm_event() returns 0. So it's okey to
remove the ack in error patch.

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>

---
V2: remove ack from the error patch (Dave)
---
 migration/rdma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 00eac34232..41726cc74a 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -2497,7 +2497,6 @@ static int qemu_rdma_connect(RDMAContext *rdma, Error **errp)
     if (ret) {
         perror("rdma_get_cm_event after rdma_connect");
         ERROR(errp, "connecting to destination!");
-        rdma_ack_cm_event(cm_event);
         goto err_rdma_source_connect;
     }
 
-- 
2.30.2




