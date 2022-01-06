Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 133CD486D21
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 23:20:03 +0100 (CET)
Received: from localhost ([::1]:49626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5b74-0006Qx-5d
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 17:20:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1n5b1W-0005Ie-4K
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 17:14:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1n5b1T-0006GO-6n
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 17:14:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641507254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0NDzPeIVUudN25zaS3Wto140+IMZy5l5AkFrdwEcCok=;
 b=ATCZssT6P5os6mk0PHOQDZtIsG4F2GI8XlrLJj6LSlzb4r2YdzOXy91e/yJZJrnbGifUhl
 LQs0Bil15qZyGfaeSmHhrKsEgcEwYTyvDicYHLDaafeMfdZEDAoh8ktmyT6eInXB0ady+i
 x1yUkW5kh9qG50HKSy/FkRBT+L/0qdk=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-An53h6KaPjeRGTqoyX0TKQ-1; Thu, 06 Jan 2022 17:14:13 -0500
X-MC-Unique: An53h6KaPjeRGTqoyX0TKQ-1
Received: by mail-vk1-f197.google.com with SMTP id
 r15-20020a1fa80f000000b003133230d1e1so1070821vke.7
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 14:14:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0NDzPeIVUudN25zaS3Wto140+IMZy5l5AkFrdwEcCok=;
 b=vQ8WmqlLDr321R7XptsrBifnlVWdCWm9To/ou+7whVM2GAmDlJskngjUkbQ4bZtknO
 Ls9YWpDZomDlRRYFrjeYS0AYLemwYh5PgBE0B+nPg5kA2doRlTSy+VqBDsVsOI4YDz4x
 eiZr6QtGumtM+u9wONaQsDEn+fAbWV2FxXKSrVkq93uTGZf/ipT5rakPs8BkkZmd0SHC
 ydtkfJVE6x3QW6u2iPu+gMyvOOtqX5Mgq8zLlX6kUBwU2cQ2MBBHEVWpMCT800CM7MGv
 qCftSG/DmjUkooXa2AmeaYhsJQz4tvBzqW3KgicYsBnG7EeK75ABkXyuLAf4Nh7UyyN0
 Pkxg==
X-Gm-Message-State: AOAM530KvPYrYXAuksUznkX2fRHYJEsC0CaqLvetOPUH8CRHB69KgH1G
 7QFav09Jtxhs2Qevn/fHCQfMYf9LDKE/Wfe9bvKFtasdh/5l9NFKuCON1zOQPCVOMRDuyScScbf
 IXgQALnu2EHEPpkc=
X-Received: by 2002:a9f:3802:: with SMTP id p2mr3834788uad.35.1641507252508;
 Thu, 06 Jan 2022 14:14:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwktjmZRMBJLZGwpM+HEWaIGOMIR6LT04Tpr1G9e3U1ZH68oQ0rfBrTba1ZKghnlpJ6HZi7NA==
X-Received: by 2002:a9f:3802:: with SMTP id p2mr3834778uad.35.1641507252297;
 Thu, 06 Jan 2022 14:14:12 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:431:c7f1:cc01:fae1:7982:b010:d91])
 by smtp.gmail.com with ESMTPSA id c15sm2098831uaj.13.2022.01.06.14.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 14:14:11 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH v7 3/5] migration: Add zero-copy parameter for QMP/HMP for
 Linux
Date: Thu,  6 Jan 2022 19:13:40 -0300
Message-Id: <20220106221341.8779-4-leobras@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220106221341.8779-1-leobras@redhat.com>
References: <20220106221341.8779-1-leobras@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add property that allows zero-copy migration of memory pages,
and also includes a helper function migrate_use_zero_copy() to check
if it's enabled.

No code is introduced to actually do the migration, but it allow
future implementations to enable/disable this feature.

On non-Linux builds this parameter is compiled-out.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 qapi/migration.json   | 24 ++++++++++++++++++++++++
 migration/migration.h |  5 +++++
 migration/migration.c | 32 ++++++++++++++++++++++++++++++++
 migration/socket.c    |  5 +++++
 monitor/hmp-cmds.c    |  6 ++++++
 5 files changed, 72 insertions(+)

diff --git a/qapi/migration.json b/qapi/migration.json
index bbfd48cf0b..2e62ea6ebd 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -730,6 +730,13 @@
 #                      will consume more CPU.
 #                      Defaults to 1. (Since 5.0)
 #
+# @zero-copy: Controls behavior on sending memory pages on migration.
+#             When true, enables a zero-copy mechanism for sending memory
+#             pages, if host supports it.
+#             Requires that QEMU be permitted to use locked memory for guest
+#             RAM pages.
+#             Defaults to false. (Since 7.0)
+#
 # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
 #                        aliases for the purpose of dirty bitmap migration.  Such
 #                        aliases may for example be the corresponding names on the
@@ -769,6 +776,7 @@
            'xbzrle-cache-size', 'max-postcopy-bandwidth',
            'max-cpu-throttle', 'multifd-compression',
            'multifd-zlib-level' ,'multifd-zstd-level',
+           { 'name': 'zero-copy', 'if' : 'CONFIG_LINUX'},
            'block-bitmap-mapping' ] }
 
 ##
@@ -895,6 +903,13 @@
 #                      will consume more CPU.
 #                      Defaults to 1. (Since 5.0)
 #
+# @zero-copy: Controls behavior on sending memory pages on migration.
+#             When true, enables a zero-copy mechanism for sending memory
+#             pages, if host supports it.
+#             Requires that QEMU be permitted to use locked memory for guest
+#             RAM pages.
+#             Defaults to false. (Since 7.0)
+#
 # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
 #                        aliases for the purpose of dirty bitmap migration.  Such
 #                        aliases may for example be the corresponding names on the
@@ -949,6 +964,7 @@
             '*multifd-compression': 'MultiFDCompression',
             '*multifd-zlib-level': 'uint8',
             '*multifd-zstd-level': 'uint8',
+            '*zero-copy': { 'type': 'bool', 'if': 'CONFIG_LINUX' },
             '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
 
 ##
@@ -1095,6 +1111,13 @@
 #                      will consume more CPU.
 #                      Defaults to 1. (Since 5.0)
 #
+# @zero-copy: Controls behavior on sending memory pages on migration.
+#             When true, enables a zero-copy mechanism for sending memory
+#             pages, if host supports it.
+#             Requires that QEMU be permitted to use locked memory for guest
+#             RAM pages.
+#             Defaults to false. (Since 7.0)
+#
 # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
 #                        aliases for the purpose of dirty bitmap migration.  Such
 #                        aliases may for example be the corresponding names on the
@@ -1147,6 +1170,7 @@
             '*multifd-compression': 'MultiFDCompression',
             '*multifd-zlib-level': 'uint8',
             '*multifd-zstd-level': 'uint8',
+            '*zero-copy': { 'type': 'bool', 'if': 'CONFIG_LINUX' },
             '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
 
 ##
diff --git a/migration/migration.h b/migration/migration.h
index 8130b703eb..1489eeb165 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -339,6 +339,11 @@ MultiFDCompression migrate_multifd_compression(void);
 int migrate_multifd_zlib_level(void);
 int migrate_multifd_zstd_level(void);
 
+#ifdef CONFIG_LINUX
+bool migrate_use_zero_copy(void);
+#else
+#define migrate_use_zero_copy() (false)
+#endif
 int migrate_use_xbzrle(void);
 uint64_t migrate_xbzrle_cache_size(void);
 bool migrate_colo_enabled(void);
diff --git a/migration/migration.c b/migration/migration.c
index 0652165610..aa8f1dc835 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -893,6 +893,10 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
     params->multifd_zlib_level = s->parameters.multifd_zlib_level;
     params->has_multifd_zstd_level = true;
     params->multifd_zstd_level = s->parameters.multifd_zstd_level;
+#ifdef CONFIG_LINUX
+    params->has_zero_copy = true;
+    params->zero_copy = s->parameters.zero_copy;
+#endif
     params->has_xbzrle_cache_size = true;
     params->xbzrle_cache_size = s->parameters.xbzrle_cache_size;
     params->has_max_postcopy_bandwidth = true;
@@ -1546,6 +1550,11 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
     if (params->has_multifd_compression) {
         dest->multifd_compression = params->multifd_compression;
     }
+#ifdef CONFIG_LINUX
+    if (params->has_zero_copy) {
+        dest->zero_copy = params->zero_copy;
+    }
+#endif
     if (params->has_xbzrle_cache_size) {
         dest->xbzrle_cache_size = params->xbzrle_cache_size;
     }
@@ -1658,6 +1667,11 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
     if (params->has_multifd_compression) {
         s->parameters.multifd_compression = params->multifd_compression;
     }
+#ifdef CONFIG_LINUX
+    if (params->has_zero_copy) {
+        s->parameters.zero_copy = params->zero_copy;
+    }
+#endif
     if (params->has_xbzrle_cache_size) {
         s->parameters.xbzrle_cache_size = params->xbzrle_cache_size;
         xbzrle_cache_resize(params->xbzrle_cache_size, errp);
@@ -2548,6 +2562,17 @@ int migrate_multifd_zstd_level(void)
     return s->parameters.multifd_zstd_level;
 }
 
+#ifdef CONFIG_LINUX
+bool migrate_use_zero_copy(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->parameters.zero_copy;
+}
+#endif
+
 int migrate_use_xbzrle(void)
 {
     MigrationState *s;
@@ -4200,6 +4225,10 @@ static Property migration_properties[] = {
     DEFINE_PROP_UINT8("multifd-zstd-level", MigrationState,
                       parameters.multifd_zstd_level,
                       DEFAULT_MIGRATE_MULTIFD_ZSTD_LEVEL),
+#ifdef CONFIG_LINUX
+    DEFINE_PROP_BOOL("zero_copy", MigrationState,
+                      parameters.zero_copy, false),
+#endif
     DEFINE_PROP_SIZE("xbzrle-cache-size", MigrationState,
                       parameters.xbzrle_cache_size,
                       DEFAULT_MIGRATE_XBZRLE_CACHE_SIZE),
@@ -4297,6 +4326,9 @@ static void migration_instance_init(Object *obj)
     params->has_multifd_compression = true;
     params->has_multifd_zlib_level = true;
     params->has_multifd_zstd_level = true;
+#ifdef CONFIG_LINUX
+    params->has_zero_copy = true;
+#endif
     params->has_xbzrle_cache_size = true;
     params->has_max_postcopy_bandwidth = true;
     params->has_max_cpu_throttle = true;
diff --git a/migration/socket.c b/migration/socket.c
index 05705a32d8..f7a77aafd3 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -77,6 +77,11 @@ static void socket_outgoing_migration(QIOTask *task,
     } else {
         trace_migration_socket_outgoing_connected(data->hostname);
     }
+
+    if (migrate_use_zero_copy()) {
+        error_setg(&err, "Zero copy not available in migration");
+    }
+
     migration_channel_connect(data->s, sioc, data->hostname, err);
     object_unref(OBJECT(sioc));
 }
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 2669156b28..35d47e250d 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1297,6 +1297,12 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
         p->has_multifd_zstd_level = true;
         visit_type_uint8(v, param, &p->multifd_zstd_level, &err);
         break;
+#ifdef CONFIG_LINUX
+    case MIGRATION_PARAMETER_ZERO_COPY:
+        p->has_zero_copy = true;
+        visit_type_bool(v, param, &p->zero_copy, &err);
+        break;
+#endif
     case MIGRATION_PARAMETER_XBZRLE_CACHE_SIZE:
         p->has_xbzrle_cache_size = true;
         if (!visit_type_size(v, param, &cache_size, &err)) {
-- 
2.34.1


