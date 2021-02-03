Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E6E30D440
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 08:48:53 +0100 (CET)
Received: from localhost ([::1]:38564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7CuC-0008FI-73
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 02:48:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1l7Cpj-00034J-8K
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 02:44:15 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1l7Cpd-0008Lt-Hx
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 02:44:14 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DVttr4FD4z163wm;
 Wed,  3 Feb 2021 15:42:28 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Wed, 3 Feb 2021
 15:43:38 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>, <berrange@redhat.com>
Subject: [PATCH v4 03/18] migration/rdma: create multifd_setup_ops for Tx/Rx
 thread
Date: Wed, 3 Feb 2021 16:01:36 +0800
Message-ID: <1612339311-114805-4-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhengchuan@huawei.com; helo=szxga04-in.huawei.com
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

Create multifd_setup_ops for TxRx thread, no logic change.

Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
---
 migration/multifd.c | 44 +++++++++++++++++++++++++++++++++++++++-----
 migration/multifd.h |  7 +++++++
 2 files changed, 46 insertions(+), 5 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 1a1e589..cb1fc01 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -386,6 +386,8 @@ struct {
     int exiting;
     /* multifd ops */
     MultiFDMethods *ops;
+    /* multifd setup ops */
+    MultiFDSetup *setup_ops;
 } *multifd_send_state;
 
 /*
@@ -805,8 +807,9 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
         } else {
             /* update for tls qio channel */
             p->c = ioc;
-            qemu_thread_create(&p->thread, p->name, multifd_send_thread, p,
-                                   QEMU_THREAD_JOINABLE);
+            qemu_thread_create(&p->thread, p->name,
+                               multifd_send_state->setup_ops->send_thread,
+                               p, QEMU_THREAD_JOINABLE);
        }
        return false;
     }
@@ -854,6 +857,11 @@ cleanup:
     multifd_new_send_channel_cleanup(p, sioc, local_err);
 }
 
+static void multifd_send_channel_setup(MultiFDSendParams *p)
+{
+    socket_send_channel_create(multifd_new_send_channel_async, p);
+}
+
 int multifd_save_setup(Error **errp)
 {
     int thread_count;
@@ -871,6 +879,7 @@ int multifd_save_setup(Error **errp)
     multifd_send_state->pages = multifd_pages_init(page_count);
     qemu_sem_init(&multifd_send_state->channels_ready, 0);
     qatomic_set(&multifd_send_state->exiting, 0);
+    multifd_send_state->setup_ops = multifd_setup_ops_init();
     multifd_send_state->ops = multifd_ops[migrate_multifd_compression()];
 
     for (i = 0; i < thread_count; i++) {
@@ -890,7 +899,7 @@ int multifd_save_setup(Error **errp)
         p->packet->version = cpu_to_be32(MULTIFD_VERSION);
         p->name = g_strdup_printf("multifdsend_%d", i);
         p->tls_hostname = g_strdup(s->hostname);
-        socket_send_channel_create(multifd_new_send_channel_async, p);
+        multifd_send_state->setup_ops->send_channel_setup(p);
     }
 
     for (i = 0; i < thread_count; i++) {
@@ -917,6 +926,8 @@ struct {
     uint64_t packet_num;
     /* multifd ops */
     MultiFDMethods *ops;
+    /* multifd setup ops */
+    MultiFDSetup *setup_ops;
 } *multifd_recv_state;
 
 static void multifd_recv_terminate_threads(Error *err)
@@ -1117,6 +1128,7 @@ int multifd_load_setup(Error **errp)
     multifd_recv_state->params = g_new0(MultiFDRecvParams, thread_count);
     qatomic_set(&multifd_recv_state->count, 0);
     qemu_sem_init(&multifd_recv_state->sem_sync, 0);
+    multifd_recv_state->setup_ops = multifd_setup_ops_init();
     multifd_recv_state->ops = multifd_ops[migrate_multifd_compression()];
 
     for (i = 0; i < thread_count; i++) {
@@ -1195,9 +1207,31 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
     p->num_packets = 1;
 
     p->running = true;
-    qemu_thread_create(&p->thread, p->name, multifd_recv_thread, p,
-                       QEMU_THREAD_JOINABLE);
+    multifd_recv_state->setup_ops->recv_channel_setup(ioc, p);
+    qemu_thread_create(&p->thread, p->name,
+                       multifd_recv_state->setup_ops->recv_thread,
+                       p, QEMU_THREAD_JOINABLE);
     qatomic_inc(&multifd_recv_state->count);
     return qatomic_read(&multifd_recv_state->count) ==
            migrate_multifd_channels();
 }
+
+static void multifd_recv_channel_setup(QIOChannel *ioc, MultiFDRecvParams *p)
+{
+    return;
+}
+
+static MultiFDSetup multifd_socket_ops = {
+    .send_thread = multifd_send_thread,
+    .recv_thread = multifd_recv_thread,
+    .send_channel_setup = multifd_send_channel_setup,
+    .recv_channel_setup = multifd_recv_channel_setup
+};
+
+MultiFDSetup *multifd_setup_ops_init(void)
+{
+    MultiFDSetup *ops;
+
+    ops = &multifd_socket_ops;
+    return ops;
+}
diff --git a/migration/multifd.h b/migration/multifd.h
index 8d6751f..1d2dc90 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -166,6 +166,13 @@ typedef struct {
     int (*recv_pages)(MultiFDRecvParams *p, uint32_t used, Error **errp);
 } MultiFDMethods;
 
+typedef struct {
+    void *(*send_thread)(void *opaque);
+    void *(*recv_thread)(void *opaque);
+    void (*send_channel_setup)(MultiFDSendParams *p);
+    void (*recv_channel_setup)(QIOChannel *ioc, MultiFDRecvParams *p);
+} MultiFDSetup;
+
 void multifd_register_ops(int method, MultiFDMethods *ops);
 
 #endif
-- 
1.8.3.1


