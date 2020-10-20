Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72057290EB9
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Oct 2020 06:19:29 +0200 (CEST)
Received: from localhost ([::1]:53182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTdgm-00005P-GN
	for lists+qemu-devel@lfdr.de; Sat, 17 Oct 2020 00:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kTdXv-0006HD-J5
 for qemu-devel@nongnu.org; Sat, 17 Oct 2020 00:10:19 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5245 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kTdXr-0007Ij-5e
 for qemu-devel@nongnu.org; Sat, 17 Oct 2020 00:10:19 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 7F60251D1C4A51D745D8;
 Sat, 17 Oct 2020 12:09:56 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Sat, 17 Oct 2020
 12:09:47 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH v3 12/18] migration/rdma: Create the multifd send channels for
 RDMA
Date: Sat, 17 Oct 2020 12:25:42 +0800
Message-ID: <1602908748-43335-13-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1602908748-43335-1-git-send-email-zhengchuan@huawei.com>
References: <1602908748-43335-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhengchuan@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/17 00:09:47
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: yubihong@huawei.com, zhang.zhanghailiang@huawei.com, fengzhimin1@huawei.com,
 qemu-devel@nongnu.org, xiexiangyou@huawei.com, alex.chen@huawei.com,
 wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
---
 migration/multifd.c |  4 ++--
 migration/multifd.h |  2 ++
 migration/rdma.c    | 56 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+), 2 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 03f3a1e..9439b3c 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -173,7 +173,7 @@ void multifd_register_ops(int method, MultiFDMethods *ops)
     multifd_ops[method] = ops;
 }
 
-static int multifd_send_initial_packet(MultiFDSendParams *p, Error **errp)
+int multifd_send_initial_packet(MultiFDSendParams *p, Error **errp)
 {
     MultiFDInit_t msg = {};
     int ret;
@@ -500,7 +500,7 @@ int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset)
     return 1;
 }
 
-static void multifd_send_terminate_threads(Error *err)
+void multifd_send_terminate_threads(Error *err)
 {
     int i;
 
diff --git a/migration/multifd.h b/migration/multifd.h
index ff80bd5..ec9e897 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -184,6 +184,8 @@ typedef struct {
 #ifdef CONFIG_RDMA
 MultiFDSetup *multifd_rdma_setup(void);
 #endif
+void multifd_send_terminate_threads(Error *err);
+int multifd_send_initial_packet(MultiFDSendParams *p, Error **errp);
 int get_multifd_send_param(int id, MultiFDSendParams **param);
 int get_multifd_recv_param(int id, MultiFDRecvParams **param);
 MultiFDSetup *multifd_setup_ops_init(void);
diff --git a/migration/rdma.c b/migration/rdma.c
index dd9f705..1af81f5 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -4261,9 +4261,54 @@ err:
     g_free(rdma_return_path);
 }
 
+static int multifd_channel_rdma_connect(void *opaque)
+{
+    MultiFDSendParams *p = opaque;
+    Error *local_err = NULL;
+    int ret = 0;
+    MigrationState *s = migrate_get_current();
+
+    p->rdma = qemu_rdma_data_init(s->host_port, &local_err);
+    if (p->rdma == NULL) {
+        goto out;
+    }
+
+    ret = qemu_rdma_source_init(p->rdma,
+                                migrate_use_rdma_pin_all(),
+                                &local_err);
+    if (ret) {
+        goto out;
+    }
+
+    ret = qemu_rdma_connect(p->rdma, &local_err);
+    if (ret) {
+        goto out;
+    }
+
+    p->file = qemu_fopen_rdma(p->rdma, "wb");
+    if (p->file == NULL) {
+        goto out;
+    }
+
+    p->c = QIO_CHANNEL(getQIOChannel(p->file));
+
+out:
+    if (local_err) {
+        trace_multifd_send_error(p->id);
+    }
+
+    return ret;
+}
+
 static void *multifd_rdma_send_thread(void *opaque)
 {
     MultiFDSendParams *p = opaque;
+    Error *local_err = NULL;
+
+    trace_multifd_send_thread_start(p->id);
+    if (multifd_send_initial_packet(p, &local_err) < 0) {
+        goto out;
+    }
 
     while (true) {
         qemu_mutex_lock(&p->mutex);
@@ -4275,6 +4320,11 @@ static void *multifd_rdma_send_thread(void *opaque)
         qemu_sem_wait(&p->sem);
     }
 
+out:
+    if (local_err) {
+        trace_multifd_send_error(p->id);
+        multifd_send_terminate_threads(local_err);
+    }
     qemu_mutex_lock(&p->mutex);
     p->running = false;
     qemu_mutex_unlock(&p->mutex);
@@ -4286,6 +4336,12 @@ static void multifd_rdma_send_channel_setup(MultiFDSendParams *p)
 {
     Error *local_err = NULL;
 
+    if (multifd_channel_rdma_connect(p)) {
+        error_setg(&local_err, "multifd: rdma channel %d not established",
+                   p->id);
+        return ;
+    }
+
     if (p->quit) {
         error_setg(&local_err, "multifd: send id %d already quit", p->id);
         return ;
-- 
1.8.3.1


