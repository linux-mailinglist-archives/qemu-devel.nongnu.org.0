Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B464350A88C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 20:55:49 +0200 (CEST)
Received: from localhost ([::1]:42680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhby0-0002fT-Qq
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 14:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhbjw-0001ir-LB
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:41:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhbju-00061P-Rp
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:41:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650566474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VSJ+uVtjLpx0WolP/HLc4wS3V4GU312JhRq1aIQh6d8=;
 b=M0yPyKJDJpg2U2X01kBoa5bO0QvsBhLIHuMgkysprfMHtIBFtooFXrENZFnazz99p9vstM
 mRWj8VOTYIyG7V5aR3G1sqCJTUWCHD/1YVJFWLm4jmfGkEKd4VwwpZKIpzxbkmTGR9UKuY
 gmW4El905VhI0ZXruXLYFdRcaexKAwM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-6hS_u-adNie5bx3vvCmtKg-1; Thu, 21 Apr 2022 14:41:12 -0400
X-MC-Unique: 6hS_u-adNie5bx3vvCmtKg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D577803B22
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 18:41:12 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3968404D2EE;
 Thu, 21 Apr 2022 18:41:11 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	peterx@redhat.com,
	berrange@redhat.com
Subject: [PULL 13/18] migration: Move migrate_allow_multifd and helpers into
 migration.c
Date: Thu, 21 Apr 2022 19:40:47 +0100
Message-Id: <20220421184052.306581-14-dgilbert@redhat.com>
In-Reply-To: <20220421184052.306581-1-dgilbert@redhat.com>
References: <20220421184052.306581-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

This variable, along with its helpers, is used to detect whether multiple
channel will be supported for migration.  In follow up patches, there'll be
other capability that requires multi-channels.  Hence move it outside multifd
specific code and make it public.  Meanwhile rename it from "multifd" to
"multi_channels" to show its real meaning.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20220331150857.74406-5-peterx@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 22 +++++++++++++++++-----
 migration/migration.h |  3 +++
 migration/multifd.c   | 19 ++++---------------
 migration/multifd.h   |  2 --
 4 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 3f61a08752..d86fb0c332 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -180,6 +180,18 @@ static int migration_maybe_pause(MigrationState *s,
                                  int new_state);
 static void migrate_fd_cancel(MigrationState *s);
 
+static bool migrate_allow_multi_channels = true;
+
+void migrate_protocol_allow_multi_channels(bool allow)
+{
+    migrate_allow_multi_channels = allow;
+}
+
+bool migrate_multi_channels_is_allowed(void)
+{
+    return migrate_allow_multi_channels;
+}
+
 static gint page_request_addr_cmp(gconstpointer ap, gconstpointer bp)
 {
     uintptr_t a = (uintptr_t) ap, b = (uintptr_t) bp;
@@ -469,12 +481,12 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
 {
     const char *p = NULL;
 
-    migrate_protocol_allow_multifd(false); /* reset it anyway */
+    migrate_protocol_allow_multi_channels(false); /* reset it anyway */
     qapi_event_send_migration(MIGRATION_STATUS_SETUP);
     if (strstart(uri, "tcp:", &p) ||
         strstart(uri, "unix:", NULL) ||
         strstart(uri, "vsock:", NULL)) {
-        migrate_protocol_allow_multifd(true);
+        migrate_protocol_allow_multi_channels(true);
         socket_start_incoming_migration(p ? p : uri, errp);
 #ifdef CONFIG_RDMA
     } else if (strstart(uri, "rdma:", &p)) {
@@ -1261,7 +1273,7 @@ static bool migrate_caps_check(bool *cap_list,
 
     /* incoming side only */
     if (runstate_check(RUN_STATE_INMIGRATE) &&
-        !migrate_multifd_is_allowed() &&
+        !migrate_multi_channels_is_allowed() &&
         cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
         error_setg(errp, "multifd is not supported by current protocol");
         return false;
@@ -2322,11 +2334,11 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
         }
     }
 
-    migrate_protocol_allow_multifd(false);
+    migrate_protocol_allow_multi_channels(false);
     if (strstart(uri, "tcp:", &p) ||
         strstart(uri, "unix:", NULL) ||
         strstart(uri, "vsock:", NULL)) {
-        migrate_protocol_allow_multifd(true);
+        migrate_protocol_allow_multi_channels(true);
         socket_start_outgoing_migration(s, p ? p : uri, &local_err);
 #ifdef CONFIG_RDMA
     } else if (strstart(uri, "rdma:", &p)) {
diff --git a/migration/migration.h b/migration/migration.h
index 2de861df01..f17ccc657c 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -430,4 +430,7 @@ void migration_cancel(const Error *error);
 void populate_vfio_info(MigrationInfo *info);
 void postcopy_temp_page_reset(PostcopyTmpPage *tmp_page);
 
+bool migrate_multi_channels_is_allowed(void);
+void migrate_protocol_allow_multi_channels(bool allow);
+
 #endif
diff --git a/migration/multifd.c b/migration/multifd.c
index 1be4ab5d17..9ea4f581e2 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -517,7 +517,7 @@ void multifd_save_cleanup(void)
 {
     int i;
 
-    if (!migrate_use_multifd() || !migrate_multifd_is_allowed()) {
+    if (!migrate_use_multifd() || !migrate_multi_channels_is_allowed()) {
         return;
     }
     multifd_send_terminate_threads(NULL);
@@ -857,17 +857,6 @@ cleanup:
     multifd_new_send_channel_cleanup(p, sioc, local_err);
 }
 
-static bool migrate_allow_multifd = true;
-void migrate_protocol_allow_multifd(bool allow)
-{
-    migrate_allow_multifd = allow;
-}
-
-bool migrate_multifd_is_allowed(void)
-{
-    return migrate_allow_multifd;
-}
-
 int multifd_save_setup(Error **errp)
 {
     int thread_count;
@@ -877,7 +866,7 @@ int multifd_save_setup(Error **errp)
     if (!migrate_use_multifd()) {
         return 0;
     }
-    if (!migrate_multifd_is_allowed()) {
+    if (!migrate_multi_channels_is_allowed()) {
         error_setg(errp, "multifd is not supported by current protocol");
         return -1;
     }
@@ -976,7 +965,7 @@ int multifd_load_cleanup(Error **errp)
 {
     int i;
 
-    if (!migrate_use_multifd() || !migrate_multifd_is_allowed()) {
+    if (!migrate_use_multifd() || !migrate_multi_channels_is_allowed()) {
         return 0;
     }
     multifd_recv_terminate_threads(NULL);
@@ -1125,7 +1114,7 @@ int multifd_load_setup(Error **errp)
     if (!migrate_use_multifd()) {
         return 0;
     }
-    if (!migrate_multifd_is_allowed()) {
+    if (!migrate_multi_channels_is_allowed()) {
         error_setg(errp, "multifd is not supported by current protocol");
         return -1;
     }
diff --git a/migration/multifd.h b/migration/multifd.h
index 3d577b98b7..7d0effcb03 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -13,8 +13,6 @@
 #ifndef QEMU_MIGRATION_MULTIFD_H
 #define QEMU_MIGRATION_MULTIFD_H
 
-bool migrate_multifd_is_allowed(void);
-void migrate_protocol_allow_multifd(bool allow);
 int multifd_save_setup(Error **errp);
 void multifd_save_cleanup(void);
 int multifd_load_setup(Error **errp);
-- 
2.35.1


