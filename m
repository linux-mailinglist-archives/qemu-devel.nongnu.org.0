Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7804B80D2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 07:54:06 +0100 (CET)
Received: from localhost ([::1]:49990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKECT-00022w-8j
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 01:54:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDot-0004V5-EY
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDoj-0006HO-41
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644992972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZXUvDOAZVCZx2PDK+m45rb6PvTxxwhcJ0/eKmX4lZqw=;
 b=hHgafPmp81815da5oDnxKrBNRbPTcjl/roKDbOn4X09hLvn9VBszH8epJDphk9NXQldPN0
 2ae1ZWq6cA2989bnLX5WmeKgiJ9361F0lU8Dzr63s0Y+HgPYLX7m7NeyLu7wA7kss2wXBx
 Fu7rYw9zl5plegN40WpOU5ezZK7RqNo=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-ZoImtIK2PNqawnGJ6LSuIw-1; Wed, 16 Feb 2022 01:29:31 -0500
X-MC-Unique: ZoImtIK2PNqawnGJ6LSuIw-1
Received: by mail-pl1-f198.google.com with SMTP id
 v20-20020a1709028d9400b0014ca63d0f10so694657plo.5
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:29:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZXUvDOAZVCZx2PDK+m45rb6PvTxxwhcJ0/eKmX4lZqw=;
 b=zT3lTx7VJrGq4pIa0KsGJBmoOrm5hg0tdhY7itCn5dk7HI6g6pYhEnztZerd1ghGB6
 pKl2LAGaAEZPn1rB3wEVnTm1IKMm0zOtE9i7RhCXyjScQpaxp4+ZQKygw4y4tXYym4rY
 TDV0Ch18M/rpNQ5k9GAUicyX+2w4oCNu4Cr4HWQrOUGD6Tn+TqqdmF+ty1eYRdjhmb6Q
 dbq7SxwOTusyBoRvFq3+ks5NVdYtuBZAEfinGSwreFrKRRsSrvIp6z8kID8pbSPhlvfZ
 Z7BEPCQ4yCoIEUXYJAa0hsZcVDQw4HUgVIhfom3ciE9VH4uF2lhZ+GD7HGvei80pTJ7l
 muRw==
X-Gm-Message-State: AOAM533+uDWUlAw3IZfQJcCGd7MFvwCunfxiir+pgqi0hcWw+Kcxb9Rv
 ugQklYtbnp/S8bZTqowxjo5VzJB3rdl9x7NdZVJAPr84IdqSOaq2LST0Y8LE/QhVMdT8CSY9UlZ
 TnbOwv9VbhVz0AK8IbhXqql1uhOIfa2OOc1B5z6ekYt7hjBaOyhK4Rvcy9uBQAqRz
X-Received: by 2002:a05:6a00:a8b:b0:4cd:6030:4df3 with SMTP id
 b11-20020a056a000a8b00b004cd60304df3mr1621430pfl.40.1644992969891; 
 Tue, 15 Feb 2022 22:29:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjUbM2ToiOaOt764b0VRyWBRyPC+Xb0s0RSEoBuGyj9Dtav2FJo6TRHrr5nSk2+IkwnH9cKw==
X-Received: by 2002:a05:6a00:a8b:b0:4cd:6030:4df3 with SMTP id
 b11-20020a056a000a8b00b004cd60304df3mr1621404pfl.40.1644992969423; 
 Tue, 15 Feb 2022 22:29:29 -0800 (PST)
Received: from localhost.localdomain ([64.64.123.81])
 by smtp.gmail.com with ESMTPSA id 17sm42104657pfl.175.2022.02.15.22.29.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 22:29:29 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/20] migration: Move migrate_allow_multifd and helpers into
 migration.c
Date: Wed, 16 Feb 2022 14:27:58 +0800
Message-Id: <20220216062809.57179-10-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220216062809.57179-1-peterx@redhat.com>
References: <20220216062809.57179-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This variable, along with its helpers, is used to detect whether multiple
channel will be supported for migration.  In follow up patches, there'll be
other capability that requires multi-channels.  Hence move it outside multifd
specific code and make it public.  Meanwhile rename it from "multifd" to
"multi_channels" to show its real meaning.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 22 +++++++++++++++++-----
 migration/migration.h |  3 +++
 migration/multifd.c   | 19 ++++---------------
 migration/multifd.h   |  2 --
 4 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index bcc385b94b..6e4cc9cc87 100644
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
@@ -463,12 +475,12 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
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
@@ -1255,7 +1267,7 @@ static bool migrate_caps_check(bool *cap_list,
 
     /* incoming side only */
     if (runstate_check(RUN_STATE_INMIGRATE) &&
-        !migrate_multifd_is_allowed() &&
+        !migrate_multi_channels_is_allowed() &&
         cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
         error_setg(errp, "multifd is not supported by current protocol");
         return false;
@@ -2313,11 +2325,11 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
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
index d8b9850eae..d677a750c9 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -429,4 +429,7 @@ void migration_cancel(const Error *error);
 void populate_vfio_info(MigrationInfo *info);
 void postcopy_temp_page_reset(PostcopyTmpPage *tmp_page);
 
+bool migrate_multi_channels_is_allowed(void);
+void migrate_protocol_allow_multi_channels(bool allow);
+
 #endif
diff --git a/migration/multifd.c b/migration/multifd.c
index 76b57a7177..180586dcde 100644
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
@@ -858,17 +858,6 @@ cleanup:
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
@@ -879,7 +868,7 @@ int multifd_save_setup(Error **errp)
     if (!migrate_use_multifd()) {
         return 0;
     }
-    if (!migrate_multifd_is_allowed()) {
+    if (!migrate_multi_channels_is_allowed()) {
         error_setg(errp, "multifd is not supported by current protocol");
         return -1;
     }
@@ -980,7 +969,7 @@ int multifd_load_cleanup(Error **errp)
 {
     int i;
 
-    if (!migrate_use_multifd() || !migrate_multifd_is_allowed()) {
+    if (!migrate_use_multifd() || !migrate_multi_channels_is_allowed()) {
         return 0;
     }
     multifd_recv_terminate_threads(NULL);
@@ -1129,7 +1118,7 @@ int multifd_load_setup(Error **errp)
     if (!migrate_use_multifd()) {
         return 0;
     }
-    if (!migrate_multifd_is_allowed()) {
+    if (!migrate_multi_channels_is_allowed()) {
         error_setg(errp, "multifd is not supported by current protocol");
         return -1;
     }
diff --git a/migration/multifd.h b/migration/multifd.h
index 4dda900a0b..636e599395 100644
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
2.32.0


