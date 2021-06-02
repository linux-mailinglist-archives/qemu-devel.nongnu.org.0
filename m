Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D8F397F26
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 04:36:37 +0200 (CEST)
Received: from localhost ([::1]:41182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loGkG-00013T-KN
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 22:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1loGjS-0000Lt-Uc
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 22:35:46 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:32618
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1loGjP-0005an-10
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 22:35:46 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AAJPIs6D7pLoSGMrlHemQ55DYdb4zR+YMi2TD?=
 =?us-ascii?q?tnoBLSC9F/b0qynAppomPGDP4gr5NEtApTniAtjkfZq/z+8X3WB5B97LMzUO01?=
 =?us-ascii?q?HYTr2Kg7GD/xTQXwX69sN4kZxrarVCDrTLZmRSvILX5xaZHr8brOW6zA=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.83,241,1616428800"; d="scan'208";a="109117211"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 02 Jun 2021 10:35:36 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id B18654C369F4;
 Wed,  2 Jun 2021 10:35:32 +0800 (CST)
Received: from G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 2 Jun 2021 10:35:32 +0800
Received: from FNSTPC.g08.fujitsu.local (10.167.226.45) by
 G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Wed, 2 Jun 2021 10:35:31 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH] migration/rdma: Fix cm event use after free
Date: Wed, 2 Jun 2021 10:35:06 +0800
Message-ID: <20210602023506.3821293-1-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: B18654C369F4.AAC7C
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

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 migration/rdma.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 1cdb4561f32..d90b29a4b51 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -1539,16 +1539,20 @@ static int qemu_rdma_wait_comp_channel(RDMAContext *rdma)
 
                 if (pfds[1].revents) {
                     ret = rdma_get_cm_event(rdma->channel, &cm_event);
-                    if (!ret) {
-                        rdma_ack_cm_event(cm_event);
+                    if (ret) {
+                        error_report("failed to get cm event while wait "
+                                     "completion channel");
+                        return -EPIPE;
                     }
 
                     error_report("receive cm event while wait comp channel,"
                                  "cm event is %d", cm_event->event);
                     if (cm_event->event == RDMA_CM_EVENT_DISCONNECTED ||
                         cm_event->event == RDMA_CM_EVENT_DEVICE_REMOVAL) {
+                        rdma_ack_cm_event(cm_event);
                         return -EPIPE;
                     }
+                    rdma_ack_cm_event(cm_event);
                 }
                 break;
 
@@ -3285,7 +3289,6 @@ static void rdma_cm_poll_handler(void *opaque)
         error_report("get_cm_event failed %d", errno);
         return;
     }
-    rdma_ack_cm_event(cm_event);
 
     if (cm_event->event == RDMA_CM_EVENT_DISCONNECTED ||
         cm_event->event == RDMA_CM_EVENT_DEVICE_REMOVAL) {
@@ -3298,12 +3301,14 @@ static void rdma_cm_poll_handler(void *opaque)
                 rdma->return_path->error_state = -EPIPE;
             }
         }
+        rdma_ack_cm_event(cm_event);
 
         if (mis->migration_incoming_co) {
             qemu_coroutine_enter(mis->migration_incoming_co);
         }
         return;
     }
+    rdma_ack_cm_event(cm_event);
 }
 
 static int qemu_rdma_accept(RDMAContext *rdma)
-- 
2.30.2




