Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F3E2D2C9C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 15:07:12 +0100 (CET)
Received: from localhost ([::1]:37370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmde3-00018y-5Z
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 09:07:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kmdaF-0007zs-E0; Tue, 08 Dec 2020 09:03:15 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kmdaB-00072Q-Rq; Tue, 08 Dec 2020 09:03:15 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cr21R3XDRzklwb;
 Tue,  8 Dec 2020 22:02:19 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Tue, 8 Dec 2020
 22:02:53 +0800
From: Alex Chen <alex.chen@huawei.com>
To: <eblake@redhat.com>, <vsementsov@virtuozzo.com>
Subject: [PATCH v3] qemu-nbd: Fix a memleak in nbd_client_thread()
Date: Tue, 8 Dec 2020 13:49:44 +0000
Message-ID: <20201208134944.27962-1-alex.chen@huawei.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=alex.chen@huawei.com;
 helo=szxga04-in.huawei.com
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
Cc: alex.chen@huawei.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the qio_channel_socket_connect_sync() fails
we should goto 'out_socket' label to free the 'sioc' instead of
goto 'out' label.
In addition, there's a lot of redundant code in the successful branch
and the error branch, optimize it.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qemu-nbd.c | 40 +++++++++++++++++-----------------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/qemu-nbd.c b/qemu-nbd.c
index a7075c5419..ee2fbc4cdb 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -265,8 +265,8 @@ static void *nbd_client_thread(void *arg)
     char *device = arg;
     NBDExportInfo info = { .request_sizes = false, .name = g_strdup("") };
     QIOChannelSocket *sioc;
-    int fd;
-    int ret;
+    int fd = -1;
+    int ret = EXIT_FAILURE;
     pthread_t show_parts_thread;
     Error *local_error = NULL;
 
@@ -278,26 +278,24 @@ static void *nbd_client_thread(void *arg)
         goto out;
     }
 
-    ret = nbd_receive_negotiate(NULL, QIO_CHANNEL(sioc),
-                                NULL, NULL, NULL, &info, &local_error);
-    if (ret < 0) {
+    if (nbd_receive_negotiate(NULL, QIO_CHANNEL(sioc),
+                              NULL, NULL, NULL, &info, &local_error) < 0) {
         if (local_error) {
             error_report_err(local_error);
         }
-        goto out_socket;
+        goto out;
     }
 
     fd = open(device, O_RDWR);
     if (fd < 0) {
         /* Linux-only, we can use %m in printf.  */
         error_report("Failed to open %s: %m", device);
-        goto out_socket;
+        goto out;
     }
 
-    ret = nbd_init(fd, sioc, &info, &local_error);
-    if (ret < 0) {
+    if (nbd_init(fd, sioc, &info, &local_error) < 0) {
         error_report_err(local_error);
-        goto out_fd;
+        goto out;
     }
 
     /* update partition table */
@@ -311,24 +309,20 @@ static void *nbd_client_thread(void *arg)
         dup2(STDOUT_FILENO, STDERR_FILENO);
     }
 
-    ret = nbd_client(fd);
-    if (ret) {
-        goto out_fd;
+    if (nbd_client(fd) < 0) {
+        goto out;
     }
-    close(fd);
-    object_unref(OBJECT(sioc));
-    g_free(info.name);
-    kill(getpid(), SIGTERM);
-    return (void *) EXIT_SUCCESS;
 
-out_fd:
-    close(fd);
-out_socket:
+    ret = EXIT_SUCCESS;
+
+ out:
+    if (fd >= 0) {
+        close(fd);
+    }
     object_unref(OBJECT(sioc));
-out:
     g_free(info.name);
     kill(getpid(), SIGTERM);
-    return (void *) EXIT_FAILURE;
+    return (void *) (intptr_t) ret;
 }
 #endif /* HAVE_NBD_DEVICE */
 
-- 
2.19.1


