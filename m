Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C44267985
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Sep 2020 12:28:55 +0200 (CEST)
Received: from localhost ([::1]:37062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kH2m6-0001oU-Ps
	for lists+qemu-devel@lfdr.de; Sat, 12 Sep 2020 06:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kH2jL-0005Hq-3x
 for qemu-devel@nongnu.org; Sat, 12 Sep 2020 06:26:03 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4742 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kH2jG-000885-Hr
 for qemu-devel@nongnu.org; Sat, 12 Sep 2020 06:26:02 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 993CDF2BAEEE4E7F31E7;
 Sat, 12 Sep 2020 18:25:51 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Sat, 12 Sep 2020
 18:25:42 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <eblake@redhat.com>, <dgilbert@redhat.com>,
 <berrange@redhat.com>
Subject: [PATCH v2 4/6] migration/tls: extract cleanup function for common-use
Date: Sat, 12 Sep 2020 18:36:17 +0800
Message-ID: <1599906979-17240-5-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1599906979-17240-1-git-send-email-zhengchuan@huawei.com>
References: <1599906979-17240-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhengchuan@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/12 06:25:47
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
Cc: zhengchuan@huawei.com, zhang.zhanghailiang@huawei.com, yuxiating@huawei.com,
 qemu-devel@nongnu.org, xiexiangyou@huawei.com, alex.chen@huawei.com,
 jinyan12@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

multifd channel cleanup is need if multifd handshake failed,
let's extract it.

Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
Signed-off-by: Yan Jin <jinyan12@huawei.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/multifd.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 3e41d9e..fe08911 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -720,6 +720,23 @@ out:
     return NULL;
 }
 
+static void multifd_new_send_channel_cleanup(MultiFDSendParams *p,
+                                             QIOChannel *ioc, Error *err)
+{
+     migrate_set_error(migrate_get_current(), err);
+     /* Error happen, we need to tell who pay attention to me */
+     qemu_sem_post(&multifd_send_state->channels_ready);
+     qemu_sem_post(&p->sem_sync);
+     /*
+      * Although multifd_send_thread is not created, but main migration
+      * thread neet to judge whether it is running, so we need to mark
+      * its status.
+      */
+     p->quit = true;
+     object_unref(OBJECT(ioc));
+     error_free(err);
+}
+
 static void multifd_new_send_channel_async(QIOTask *task, gpointer opaque)
 {
     MultiFDSendParams *p = opaque;
@@ -728,25 +745,18 @@ static void multifd_new_send_channel_async(QIOTask *task, gpointer opaque)
 
     trace_multifd_new_send_channel_async(p->id);
     if (qio_task_propagate_error(task, &local_err)) {
-        migrate_set_error(migrate_get_current(), local_err);
-        /* Error happen, we need to tell who pay attention to me */
-        qemu_sem_post(&multifd_send_state->channels_ready);
-        qemu_sem_post(&p->sem_sync);
-        /*
-         * Although multifd_send_thread is not created, but main migration
-         * thread neet to judge whether it is running, so we need to mark
-         * its status.
-         */
-        p->quit = true;
-        object_unref(OBJECT(sioc));
-        error_free(local_err);
+        goto cleanup;
     } else {
         p->c = QIO_CHANNEL(sioc);
         qio_channel_set_delay(p->c, false);
         p->running = true;
         qemu_thread_create(&p->thread, p->name, multifd_send_thread, p,
                            QEMU_THREAD_JOINABLE);
+        return;
     }
+
+cleanup:
+    multifd_new_send_channel_cleanup(p, sioc, local_err);
 }
 
 int multifd_save_setup(Error **errp)
-- 
1.8.3.1


