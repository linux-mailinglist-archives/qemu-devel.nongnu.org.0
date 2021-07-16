Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFDF3CB3A2
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 09:56:01 +0200 (CEST)
Received: from localhost ([::1]:32978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4IhT-0001AG-RG
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 03:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1m4IgH-0008Ht-Mo
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 03:54:45 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:29679
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1m4IgF-0007R7-JB
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 03:54:45 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3Azib3m6gXKc6FJ+weGTwKYp8vEHBQXuYji2hC?=
 =?us-ascii?q?6mlwRA09TyX4rbHLoB1/73LJYVkqNk3I5urrBEDtexLhHP1OkOws1NWZLWrbUQ?=
 =?us-ascii?q?KTRekM0WKI+UyDJ8SRzI5g/JYlW61/Jfm1NlJikPv9iTPSL/8QhPWB74Ck7N2z?=
 =?us-ascii?q?80tQ?=
X-IronPort-AV: E=Sophos;i="5.84,244,1620662400"; d="scan'208";a="111301866"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 16 Jul 2021 15:54:37 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 8FE2C4D0D4BB;
 Fri, 16 Jul 2021 15:54:36 +0800 (CST)
Received: from G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 16 Jul 2021 15:54:37 +0800
Received: from localhost.localdomain (10.167.225.141) by
 G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Fri, 16 Jul 2021 15:54:36 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH 1/2] migration: allow multifd for socket protocol only
Date: Fri, 16 Jul 2021 15:59:08 +0800
Message-ID: <20210716075909.50575-1-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: 8FE2C4D0D4BB.AFB08
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

multifd with unsupported protocal will cause a segment fault.
(gdb) bt
 #0  0x0000563b4a93faf8 in socket_connect (addr=0x0, errp=0x7f7f02675410) at ../util/qemu-sockets.c:1190
 #1  0x0000563b4a797a03 in qio_channel_socket_connect_sync (ioc=0x563b4d16e8c0, addr=0x0, errp=0x7f7f02675410) at ../io/channel-socket.c:145
 #2  0x0000563b4a797abf in qio_channel_socket_connect_worker (task=0x563b4cd86c30, opaque=0x0) at ../io/channel-socket.c:168
 #3  0x0000563b4a792631 in qio_task_thread_worker (opaque=0x563b4cd86c30) at ../io/task.c:124
 #4  0x0000563b4a91da69 in qemu_thread_start (args=0x563b4c44bb80) at ../util/qemu-thread-posix.c:541
 #5  0x00007f7fe9b5b3f9 in ?? ()
 #6  0x0000000000000000 in ?? ()

It's enough to check migrate_multifd_is_allowed() in multifd cleanup() and
multifd setup() though there are so many other places using migrate_use_multifd().

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 migration/migration.c |  4 ++++
 migration/multifd.c   | 24 ++++++++++++++++++++++--
 migration/multifd.h   |  2 ++
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 2d306582ebf..d6d48f6999b 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -456,10 +456,12 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
 {
     const char *p = NULL;
 
+    migrate_protocal_allow_multifd(false); /* reset it anyway */
     qapi_event_send_migration(MIGRATION_STATUS_SETUP);
     if (strstart(uri, "tcp:", &p) ||
         strstart(uri, "unix:", NULL) ||
         strstart(uri, "vsock:", NULL)) {
+        migrate_protocal_allow_multifd(true);
         socket_start_incoming_migration(p ? p : uri, errp);
 #ifdef CONFIG_RDMA
     } else if (strstart(uri, "rdma:", &p)) {
@@ -2289,9 +2291,11 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
         }
     }
 
+    migrate_protocal_allow_multifd(false);
     if (strstart(uri, "tcp:", &p) ||
         strstart(uri, "unix:", NULL) ||
         strstart(uri, "vsock:", NULL)) {
+        migrate_protocal_allow_multifd(true);
         socket_start_outgoing_migration(s, p ? p : uri, &local_err);
 #ifdef CONFIG_RDMA
     } else if (strstart(uri, "rdma:", &p)) {
diff --git a/migration/multifd.c b/migration/multifd.c
index ab41590e714..b3d99c79d83 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -531,7 +531,7 @@ void multifd_save_cleanup(void)
 {
     int i;
 
-    if (!migrate_use_multifd()) {
+    if (!migrate_use_multifd() || !migrate_multifd_is_allowed()) {
         return;
     }
     multifd_send_terminate_threads(NULL);
@@ -864,6 +864,17 @@ cleanup:
     multifd_new_send_channel_cleanup(p, sioc, local_err);
 }
 
+static bool migrate_allow_multifd;
+void migrate_protocal_allow_multifd(bool allow)
+{
+    migrate_allow_multifd = allow;
+}
+
+bool migrate_multifd_is_allowed(void)
+{
+    return migrate_allow_multifd;
+}
+
 int multifd_save_setup(Error **errp)
 {
     int thread_count;
@@ -874,6 +885,11 @@ int multifd_save_setup(Error **errp)
     if (!migrate_use_multifd()) {
         return 0;
     }
+    if (!migrate_multifd_is_allowed()) {
+        error_setg(errp, "multifd is not supported by current protocol");
+        return -1;
+    }
+
     s = migrate_get_current();
     thread_count = migrate_multifd_channels();
     multifd_send_state = g_malloc0(sizeof(*multifd_send_state));
@@ -967,7 +983,7 @@ int multifd_load_cleanup(Error **errp)
 {
     int i;
 
-    if (!migrate_use_multifd()) {
+    if (!migrate_use_multifd() || !migrate_multifd_is_allowed()) {
         return 0;
     }
     multifd_recv_terminate_threads(NULL);
@@ -1123,6 +1139,10 @@ int multifd_load_setup(Error **errp)
     if (!migrate_use_multifd()) {
         return 0;
     }
+    if (!migrate_multifd_is_allowed()) {
+        error_setg(errp, "multifd is not supported by current protocol");
+        return -1;
+    }
     thread_count = migrate_multifd_channels();
     multifd_recv_state = g_malloc0(sizeof(*multifd_recv_state));
     multifd_recv_state->params = g_new0(MultiFDRecvParams, thread_count);
diff --git a/migration/multifd.h b/migration/multifd.h
index 8d6751f5ed8..9d968d63831 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -13,6 +13,8 @@
 #ifndef QEMU_MIGRATION_MULTIFD_H
 #define QEMU_MIGRATION_MULTIFD_H
 
+bool migrate_multifd_is_allowed(void);
+void migrate_protocal_allow_multifd(bool allow);
 int multifd_save_setup(Error **errp);
 void multifd_save_cleanup(void);
 int multifd_load_setup(Error **errp);
-- 
2.31.1




