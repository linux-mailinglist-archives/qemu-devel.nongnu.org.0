Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFF330D441
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 08:48:53 +0100 (CET)
Received: from localhost ([::1]:38614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7CuC-0008Gf-JM
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 02:48:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1l7Cph-00030Q-IC
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 02:44:13 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1l7CpZ-0008JH-VU
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 02:44:12 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DVtvK4qkCzjHYD;
 Wed,  3 Feb 2021 15:42:53 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Wed, 3 Feb 2021
 15:43:46 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>, <berrange@redhat.com>
Subject: [PATCH v4 18/18] migration/rdma: RDMA cleanup for multifd migration
Date: Wed, 3 Feb 2021 16:01:51 +0800
Message-ID: <1612339311-114805-19-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=zhengchuan@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yubihong@huawei.com, zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
---
 migration/multifd.c |  6 ++++++
 migration/multifd.h |  1 +
 migration/rdma.c    | 16 +++++++++++++++-
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 1186246..4031648 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -577,6 +577,9 @@ void multifd_save_cleanup(void)
         p->packet_len = 0;
         g_free(p->packet);
         p->packet = NULL;
+#ifdef CONFIG_RDMA
+        multifd_rdma_cleanup(p->rdma);
+#endif
         multifd_send_state->ops->send_cleanup(p, &local_err);
         if (local_err) {
             migrate_set_error(migrate_get_current(), local_err);
@@ -1039,6 +1042,9 @@ int multifd_load_cleanup(Error **errp)
         p->packet_len = 0;
         g_free(p->packet);
         p->packet = NULL;
+#ifdef CONFIG_RDMA
+        multifd_rdma_cleanup(p->rdma);
+#endif
         multifd_recv_state->ops->recv_cleanup(p);
     }
     qemu_sem_destroy(&multifd_recv_state->sem_sync);
diff --git a/migration/multifd.h b/migration/multifd.h
index 26d4489..0ecec5e 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -183,6 +183,7 @@ typedef struct {
 
 #ifdef CONFIG_RDMA
 extern MultiFDSetup multifd_rdma_ops;
+void multifd_rdma_cleanup(void *opaque);
 #endif
 void multifd_send_terminate_threads(Error *err);
 int multifd_send_initial_packet(MultiFDSendParams *p, Error **errp);
diff --git a/migration/rdma.c b/migration/rdma.c
index c19a91f..f14357f 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -2369,7 +2369,7 @@ static void qemu_rdma_cleanup(RDMAContext *rdma)
 {
     int idx;
 
-    if (rdma->cm_id && rdma->connected) {
+    if (rdma->channel && rdma->cm_id && rdma->connected) {
         if ((rdma->error_state ||
              migrate_get_current()->state == MIGRATION_STATUS_CANCELLING) &&
             !rdma->received_error) {
@@ -4599,6 +4599,20 @@ static void multifd_rdma_recv_channel_setup(QIOChannel *ioc,
     return;
 }
 
+void multifd_rdma_cleanup(void *opaque)
+{
+    RDMAContext *rdma = (RDMAContext *)opaque;
+
+    if (!migrate_use_rdma()) {
+        return;
+    }
+
+    rdma->listen_id = NULL;
+    rdma->channel = NULL;
+    qemu_rdma_cleanup(rdma);
+    g_free(rdma);
+}
+
 MultiFDSetup multifd_rdma_ops = {
     .send_thread = multifd_rdma_send_thread,
     .recv_thread = multifd_rdma_recv_thread,
-- 
1.8.3.1


