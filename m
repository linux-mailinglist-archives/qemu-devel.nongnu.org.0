Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C8F510C78
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 01:13:13 +0200 (CEST)
Received: from localhost ([::1]:48294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njUMq-00034h-C3
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 19:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1njUHZ-00024S-3k
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 19:07:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1njUHX-0000At-7L
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 19:07:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651014462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nukln1m3F357YvTDPENXPAFylyoyrfes2qpG25R7VCs=;
 b=aZ1/5+jHpnWZXvlWTue4kFtdcmH4SeqxJiRGUjJ0UEHvLan/arhTudZxwL1d46S9wCbY43
 gjS1uF8F/fmvmpGQFRh4gBI6Hs9F9ZGHFrV3ehcxDWIFQQCZYORmZ5gkFETWoG7KtK7I8L
 65tcRcprQktBOMOtyyJbghBNJTj4YbI=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-y7zMl1IOPO6UUEzYgV2Iug-1; Tue, 26 Apr 2022 19:07:41 -0400
X-MC-Unique: y7zMl1IOPO6UUEzYgV2Iug-1
Received: by mail-ot1-f72.google.com with SMTP id
 e90-20020a9d01e3000000b0060579b0abe3so2081068ote.10
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 16:07:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nukln1m3F357YvTDPENXPAFylyoyrfes2qpG25R7VCs=;
 b=rfm15ycXqXz13rnba6y0WDQ7REyAw6iRGuhNV/NXQWk1bg1qV6tbPKxSh8II1QrRbL
 CjOlWrOk2XlfdCQikvUxnjVWiv97cGAXZbeNndHsCQwN2oKmmoklQX8DAenAQ3n7lnth
 TNcUm91t/57H+HEi7+1v2MQp5tdUIi6ydh+0OWXq49Nfy5FJrPoL/fXMcLceR+VG4DCe
 +j2wEKeg4exEaQOWaBvjG6CriF0d+/MpWWOESk3KRJ1ub3ghNl1D0MkL6j4El94glZpc
 ySywVjwhPgOimhkLxr1QBIExZ5tGhEsrW52mCaPSn/aGwgEGehdo5LriIZ5t7umkeplg
 H7Tw==
X-Gm-Message-State: AOAM5315mjWNELJQJ50zcnA/YH2Hf5ftE5ixR2/4IVeOVcC2D8la0IHo
 bSYBeEJ2UfhaowMfN9dNnBrvZ/m7wlJxrEcb4VSXfvWk+GvYs3CV4cjqxIhx0Hkvh/PJkQ20bLV
 XLIQRdByrL20rynM=
X-Received: by 2002:a05:6870:24a1:b0:e9:2282:614d with SMTP id
 s33-20020a05687024a100b000e92282614dmr6782965oaq.250.1651014460913; 
 Tue, 26 Apr 2022 16:07:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvz6Z+h8td3fdDsXGvV2OT5CgB8IUZLY3/CvyZpHpX4utvHyg7tMgzGFEzGtnLBC9fuJqGdw==
X-Received: by 2002:a05:6870:24a1:b0:e9:2282:614d with SMTP id
 s33-20020a05687024a100b000e92282614dmr6782942oaq.250.1651014460615; 
 Tue, 26 Apr 2022 16:07:40 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f0:2ba0:92e8:26c9:ce7e:f03e])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a4a3004000000b0035e974ec923sm419855oof.2.2022.04.26.16.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 16:07:40 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Fam Zheng <fam@euphon.net>, Peter Xu <peterx@redhat.com>
Subject: [PATCH v10 3/7] migration: Add zero-copy-send parameter for QMP/HMP
 for Linux
Date: Tue, 26 Apr 2022 20:06:50 -0300
Message-Id: <20220426230654.637939-4-leobras@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220426230654.637939-1-leobras@redhat.com>
References: <20220426230654.637939-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add property that allows zero-copy migration of memory pages
on the sending side, and also includes a helper function
migrate_use_zero_copy_send() to check if it's enabled.

No code is introduced to actually do the migration, but it allow
future implementations to enable/disable this feature.

On non-Linux builds this parameter is compiled-out.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 qapi/migration.json   | 24 ++++++++++++++++++++++++
 migration/migration.h |  5 +++++
 migration/migration.c | 32 ++++++++++++++++++++++++++++++++
 migration/socket.c    | 11 +++++++++--
 monitor/hmp-cmds.c    |  6 ++++++
 5 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 409eb086a2..04246481ce 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -741,6 +741,13 @@
 #                      will consume more CPU.
 #                      Defaults to 1. (Since 5.0)
 #
+# @zero-copy-send: Controls behavior on sending memory pages on migration.
+#                  When true, enables a zero-copy mechanism for sending memory
+#                  pages, if host supports it.
+#                  Requires that QEMU be permitted to use locked memory for guest
+#                  RAM pages.
+#                  Defaults to false. (Since 7.1)
+#
 # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
 #                        aliases for the purpose of dirty bitmap migration.  Such
 #                        aliases may for example be the corresponding names on the
@@ -780,6 +787,7 @@
            'xbzrle-cache-size', 'max-postcopy-bandwidth',
            'max-cpu-throttle', 'multifd-compression',
            'multifd-zlib-level' ,'multifd-zstd-level',
+           { 'name': 'zero-copy-send', 'if' : 'CONFIG_LINUX'},
            'block-bitmap-mapping' ] }
 
 ##
@@ -906,6 +914,13 @@
 #                      will consume more CPU.
 #                      Defaults to 1. (Since 5.0)
 #
+# @zero-copy-send: Controls behavior on sending memory pages on migration.
+#                  When true, enables a zero-copy mechanism for sending memory
+#                  pages, if host supports it.
+#                  Requires that QEMU be permitted to use locked memory for guest
+#                  RAM pages.
+#                  Defaults to false. (Since 7.1)
+#
 # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
 #                        aliases for the purpose of dirty bitmap migration.  Such
 #                        aliases may for example be the corresponding names on the
@@ -960,6 +975,7 @@
             '*multifd-compression': 'MultiFDCompression',
             '*multifd-zlib-level': 'uint8',
             '*multifd-zstd-level': 'uint8',
+            '*zero-copy-send': { 'type': 'bool', 'if': 'CONFIG_LINUX' },
             '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
 
 ##
@@ -1106,6 +1122,13 @@
 #                      will consume more CPU.
 #                      Defaults to 1. (Since 5.0)
 #
+# @zero-copy-send: Controls behavior on sending memory pages on migration.
+#                  When true, enables a zero-copy mechanism for sending memory
+#                  pages, if host supports it.
+#                  Requires that QEMU be permitted to use locked memory for guest
+#                  RAM pages.
+#                  Defaults to false. (Since 7.1)
+#
 # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
 #                        aliases for the purpose of dirty bitmap migration.  Such
 #                        aliases may for example be the corresponding names on the
@@ -1158,6 +1181,7 @@
             '*multifd-compression': 'MultiFDCompression',
             '*multifd-zlib-level': 'uint8',
             '*multifd-zstd-level': 'uint8',
+            '*zero-copy-send': { 'type': 'bool', 'if': 'CONFIG_LINUX' },
             '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
 
 ##
diff --git a/migration/migration.h b/migration/migration.h
index a863032b71..e8f2941a55 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -375,6 +375,11 @@ MultiFDCompression migrate_multifd_compression(void);
 int migrate_multifd_zlib_level(void);
 int migrate_multifd_zstd_level(void);
 
+#ifdef CONFIG_LINUX
+bool migrate_use_zero_copy_send(void);
+#else
+#define migrate_use_zero_copy_send() (false)
+#endif
 int migrate_use_xbzrle(void);
 uint64_t migrate_xbzrle_cache_size(void);
 bool migrate_colo_enabled(void);
diff --git a/migration/migration.c b/migration/migration.c
index 5a31b23bd6..3e91f4b5e2 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -910,6 +910,10 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
     params->multifd_zlib_level = s->parameters.multifd_zlib_level;
     params->has_multifd_zstd_level = true;
     params->multifd_zstd_level = s->parameters.multifd_zstd_level;
+#ifdef CONFIG_LINUX
+    params->has_zero_copy_send = true;
+    params->zero_copy_send = s->parameters.zero_copy_send;
+#endif
     params->has_xbzrle_cache_size = true;
     params->xbzrle_cache_size = s->parameters.xbzrle_cache_size;
     params->has_max_postcopy_bandwidth = true;
@@ -1567,6 +1571,11 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
     if (params->has_multifd_compression) {
         dest->multifd_compression = params->multifd_compression;
     }
+#ifdef CONFIG_LINUX
+    if (params->has_zero_copy_send) {
+        dest->zero_copy_send = params->zero_copy_send;
+    }
+#endif
     if (params->has_xbzrle_cache_size) {
         dest->xbzrle_cache_size = params->xbzrle_cache_size;
     }
@@ -1679,6 +1688,11 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
     if (params->has_multifd_compression) {
         s->parameters.multifd_compression = params->multifd_compression;
     }
+#ifdef CONFIG_LINUX
+    if (params->has_zero_copy_send) {
+        s->parameters.zero_copy_send = params->zero_copy_send;
+    }
+#endif
     if (params->has_xbzrle_cache_size) {
         s->parameters.xbzrle_cache_size = params->xbzrle_cache_size;
         xbzrle_cache_resize(params->xbzrle_cache_size, errp);
@@ -2563,6 +2577,17 @@ int migrate_multifd_zstd_level(void)
     return s->parameters.multifd_zstd_level;
 }
 
+#ifdef CONFIG_LINUX
+bool migrate_use_zero_copy_send(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->parameters.zero_copy_send;
+}
+#endif
+
 int migrate_use_xbzrle(void)
 {
     MigrationState *s;
@@ -4206,6 +4231,10 @@ static Property migration_properties[] = {
     DEFINE_PROP_UINT8("multifd-zstd-level", MigrationState,
                       parameters.multifd_zstd_level,
                       DEFAULT_MIGRATE_MULTIFD_ZSTD_LEVEL),
+#ifdef CONFIG_LINUX
+    DEFINE_PROP_BOOL("zero_copy_send", MigrationState,
+                      parameters.zero_copy_send, false),
+#endif
     DEFINE_PROP_SIZE("xbzrle-cache-size", MigrationState,
                       parameters.xbzrle_cache_size,
                       DEFAULT_MIGRATE_XBZRLE_CACHE_SIZE),
@@ -4303,6 +4332,9 @@ static void migration_instance_init(Object *obj)
     params->has_multifd_compression = true;
     params->has_multifd_zlib_level = true;
     params->has_multifd_zstd_level = true;
+#ifdef CONFIG_LINUX
+    params->has_zero_copy_send = true;
+#endif
     params->has_xbzrle_cache_size = true;
     params->has_max_postcopy_bandwidth = true;
     params->has_max_cpu_throttle = true;
diff --git a/migration/socket.c b/migration/socket.c
index 05705a32d8..3754d8f72c 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -74,9 +74,16 @@ static void socket_outgoing_migration(QIOTask *task,
 
     if (qio_task_propagate_error(task, &err)) {
         trace_migration_socket_outgoing_error(error_get_pretty(err));
-    } else {
-        trace_migration_socket_outgoing_connected(data->hostname);
+           goto out;
     }
+
+    trace_migration_socket_outgoing_connected(data->hostname);
+
+    if (migrate_use_zero_copy_send()) {
+        error_setg(&err, "Zero copy send not available in migration");
+    }
+
+out:
     migration_channel_connect(data->s, sioc, data->hostname, err);
     object_unref(OBJECT(sioc));
 }
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 634968498b..55b48d3733 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1309,6 +1309,12 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
         p->has_multifd_zstd_level = true;
         visit_type_uint8(v, param, &p->multifd_zstd_level, &err);
         break;
+#ifdef CONFIG_LINUX
+    case MIGRATION_PARAMETER_ZERO_COPY_SEND:
+        p->has_zero_copy_send = true;
+        visit_type_bool(v, param, &p->zero_copy_send, &err);
+        break;
+#endif
     case MIGRATION_PARAMETER_XBZRLE_CACHE_SIZE:
         p->has_xbzrle_cache_size = true;
         if (!visit_type_size(v, param, &cache_size, &err)) {
-- 
2.36.0


