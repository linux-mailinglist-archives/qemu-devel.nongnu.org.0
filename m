Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C008525BE2
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 09:01:26 +0200 (CEST)
Received: from localhost ([::1]:53398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npPIi-0001AO-42
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 03:01:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1npOno-0007R5-Rg
 for qemu-devel@nongnu.org; Fri, 13 May 2022 02:29:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1npOnm-0000ZU-MM
 for qemu-devel@nongnu.org; Fri, 13 May 2022 02:29:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652423365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kK74bLmPjFGLG0kt8kzRmoqFJAHDvB5cYkKxXSWbg1U=;
 b=PnoQxcGQTUpkm7nQwZtr9NpnCcDUM1CM+fZV4WDIQTbY9gOPefXm7CRQ0m2i2t/kKGCUJR
 ml5iV39fdJT9LFNY9zm6Rirue9/VkNGD63adJyNvS17J21itf3hTu/54V9MqLuf0cATWIs
 IWVZOKCis2HvPDW/Lvf1G29eHJFiaEc=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-qdP3JjiLOCqOkqP0oygZxw-1; Fri, 13 May 2022 02:29:24 -0400
X-MC-Unique: qdP3JjiLOCqOkqP0oygZxw-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-e653506dd0so4418543fac.14
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 23:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kK74bLmPjFGLG0kt8kzRmoqFJAHDvB5cYkKxXSWbg1U=;
 b=a/HQrnzwd5qpvGcd6ZRB+AfQzWsoSECChEm9gW8kJTj7mUYINuGN8Zijt+85HZnsJX
 MZ1lp8I9hPQQboJPjdaDs37XEvLfFXe3JZgW0WarMosAtUq9XC9nI+fVo6aJ5aNbAK1b
 QXebYYHl3ZzOi0fUqdwp5VTY7bdBmWFlWbjoDxTw7GGiPOImJ2tOzPjZljCiNyqULBM5
 O/c16bwI7qRm3naoUO6gY1on9ngLa7rlS00yLlzcmSWMVWPBGYAgZ1ih2CYP50iAhR0t
 YFzUvgqsRJVH5rQchYc8KCTp52IDQam/wTrTwvDnj6CEPI0vC1RBEEP25miPc8GZomFP
 dWIA==
X-Gm-Message-State: AOAM531AsZJ354T+j0bo12QeSuvLJ1naZ7004D1tQMiXBB6CBNhZrzNs
 7vWqBAQDSmBMHeknX9VPnLis5LGZ7NacSZtDksw5WFJA0qXbvTj9w2D1OL+sSP9ilGGjlj9xuN+
 2G79P7qLmoSSuO9s=
X-Received: by 2002:a05:6870:602a:b0:f1:42cf:8296 with SMTP id
 t42-20020a056870602a00b000f142cf8296mr1230076oaa.111.1652423363692; 
 Thu, 12 May 2022 23:29:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8us6WSnAEa2cEwTy0yNLxu1UcP6pO/pKTmEDeislob/awfOYAmWS6f6U0xn8cGQq4EeW3MQ==
X-Received: by 2002:a05:6870:602a:b0:f1:42cf:8296 with SMTP id
 t42-20020a056870602a00b000f142cf8296mr1230066oaa.111.1652423363456; 
 Thu, 12 May 2022 23:29:23 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f0:55e:b3e6:9ebe:4b75:fe72])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a05680804ce00b00325cda1ffbasm678341oie.57.2022.05.12.23.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 23:29:22 -0700 (PDT)
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Subject: [PATCH v13 4/8] migration: Add zero-copy-send parameter for QMP/HMP
 for Linux
Date: Fri, 13 May 2022 03:28:33 -0300
Message-Id: <20220513062836.965425-5-leobras@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220513062836.965425-1-leobras@redhat.com>
References: <20220513062836.965425-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Acked-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/migration.json   | 24 ++++++++++++++++++++++++
 migration/migration.h |  5 +++++
 migration/migration.c | 32 ++++++++++++++++++++++++++++++++
 migration/socket.c    | 11 +++++++++--
 monitor/hmp-cmds.c    |  6 ++++++
 5 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 409eb086a2..2222f44250 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -741,6 +741,13 @@
 #                      will consume more CPU.
 #                      Defaults to 1. (Since 5.0)
 #
+# @zero-copy-send: Controls behavior on sending memory pages on migration.
+#                  When true, enables a zero-copy mechanism for sending
+#                  memory pages, if host supports it.
+#                  Requires that QEMU be permitted to use locked memory
+#                  for guest RAM pages.
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
+#                  When true, enables a zero-copy mechanism for sending
+#                  memory pages, if host supports it.
+#                  Requires that QEMU be permitted to use locked memory
+#                  for guest RAM pages.
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
+#                  When true, enables a zero-copy mechanism for sending
+#                  memory pages, if host supports it.
+#                  Requires that QEMU be permitted to use locked memory
+#                  for guest RAM pages.
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
index 93061a11af..622c783c32 100644
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
2.36.1


