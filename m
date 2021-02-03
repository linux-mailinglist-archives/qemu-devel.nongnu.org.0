Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A77030D433
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 08:46:54 +0100 (CET)
Received: from localhost ([::1]:58264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7CsG-0004f0-G6
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 02:46:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1l7Cpa-0002xJ-BQ
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 02:44:07 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1l7CpO-0008ER-Ef
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 02:44:02 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DVttr3n6xz163l7;
 Wed,  3 Feb 2021 15:42:28 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Wed, 3 Feb 2021
 15:43:38 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>, <berrange@redhat.com>
Subject: [PATCH v4 04/18] migration/rdma: add multifd_setup_ops for rdma
Date: Wed, 3 Feb 2021 16:01:37 +0800
Message-ID: <1612339311-114805-5-git-send-email-zhengchuan@huawei.com>
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

Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
---
 migration/multifd.c |  6 +++++
 migration/multifd.h |  5 ++++
 migration/rdma.c    | 71 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 82 insertions(+)

diff --git a/migration/multifd.c b/migration/multifd.c
index cb1fc01..4820702 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1232,6 +1232,12 @@ MultiFDSetup *multifd_setup_ops_init(void)
 {
     MultiFDSetup *ops;
 
+#ifdef CONFIG_RDMA
+    if (migrate_use_rdma()) {
+        ops = &multifd_rdma_ops;
+        return ops;
+    }
+#endif
     ops = &multifd_socket_ops;
     return ops;
 }
diff --git a/migration/multifd.h b/migration/multifd.h
index 1d2dc90..e3ab4b0 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -173,6 +173,11 @@ typedef struct {
     void (*recv_channel_setup)(QIOChannel *ioc, MultiFDRecvParams *p);
 } MultiFDSetup;
 
+#ifdef CONFIG_RDMA
+extern MultiFDSetup multifd_rdma_ops;
+#endif
+MultiFDSetup *multifd_setup_ops_init(void);
+
 void multifd_register_ops(int method, MultiFDMethods *ops);
 
 #endif
diff --git a/migration/rdma.c b/migration/rdma.c
index 00eac34..e0ea86d 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -19,6 +19,7 @@
 #include "qemu/cutils.h"
 #include "rdma.h"
 #include "migration.h"
+#include "multifd.h"
 #include "qemu-file.h"
 #include "ram.h"
 #include "qemu-file-channel.h"
@@ -4139,3 +4140,73 @@ err:
     g_free(rdma);
     g_free(rdma_return_path);
 }
+
+static void *multifd_rdma_send_thread(void *opaque)
+{
+    MultiFDSendParams *p = opaque;
+
+    while (true) {
+        WITH_QEMU_LOCK_GUARD(&p->mutex) {
+            if (p->quit) {
+                break;
+            }
+        }
+        qemu_sem_wait(&p->sem);
+    }
+
+    WITH_QEMU_LOCK_GUARD(&p->mutex) {
+        p->running = false;
+    }
+
+    return NULL;
+}
+
+static void multifd_rdma_send_channel_setup(MultiFDSendParams *p)
+{
+    Error *local_err = NULL;
+
+    if (p->quit) {
+        error_setg(&local_err, "multifd: send id %d already quit", p->id);
+        return ;
+    }
+    p->running = true;
+
+    qemu_thread_create(&p->thread, p->name, multifd_rdma_send_thread, p,
+                       QEMU_THREAD_JOINABLE);
+}
+
+static void *multifd_rdma_recv_thread(void *opaque)
+{
+    MultiFDRecvParams *p = opaque;
+
+    while (true) {
+        WITH_QEMU_LOCK_GUARD(&p->mutex) {
+            if (p->quit) {
+                break;
+            }
+        }
+        qemu_sem_wait(&p->sem_sync);
+    }
+
+    WITH_QEMU_LOCK_GUARD(&p->mutex) {
+        p->running = false;
+    }
+
+    return NULL;
+}
+
+static void multifd_rdma_recv_channel_setup(QIOChannel *ioc,
+                                            MultiFDRecvParams *p)
+{
+    QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(ioc);
+
+    p->file = rioc->file;
+    return;
+}
+
+MultiFDSetup multifd_rdma_ops = {
+    .send_thread = multifd_rdma_send_thread,
+    .recv_thread = multifd_rdma_recv_thread,
+    .send_channel_setup = multifd_rdma_send_channel_setup,
+    .recv_channel_setup = multifd_rdma_recv_channel_setup
+};
-- 
1.8.3.1


