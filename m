Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A8446E5CE
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 10:44:41 +0100 (CET)
Received: from localhost ([::1]:58222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvFyi-0006zO-0X
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 04:44:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mvFuT-0000hD-NE
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 04:40:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mvFuR-0008JV-GE
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 04:40:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639042814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F4NLDeIuuaxxceOZmivbo1XKjLJe4Xseu9LYJlJr5/M=;
 b=RKonH8PyGHD4VF7zAJqBeMp8lk3NYKIurOPySVOrBm8wc7A/MwxV4noFyHzZWTAogejBaR
 AHmTyOQFMTyqgdr1oKnXjtsgho9AN8CM7sYLFbpUOzMVylQGJYezCqkD/vCxPWYZw2ksBp
 x/3+J1p2Rof3vgmTLXoKZc1Oyjr2Hgo=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-109-g1goGKrYPre0VDZlG-bWqQ-1; Thu, 09 Dec 2021 04:40:13 -0500
X-MC-Unique: g1goGKrYPre0VDZlG-bWqQ-1
Received: by mail-vk1-f199.google.com with SMTP id
 t193-20020a1f78ca000000b002f7fbb56d22so2930927vkc.17
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 01:40:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F4NLDeIuuaxxceOZmivbo1XKjLJe4Xseu9LYJlJr5/M=;
 b=IMrPeJVZkqSmpi525yZihi1mk3P2M2efxdB2TF+fgeNexA0yi2VCoBrwGAKx6ybRoY
 FojD7t7iLMxDohzZ/ADLDerkx2VNmffZQNquI1Soe+ZeDWALf1rDnzrSmfWrr7bQpoMo
 Z85S/WcSGZNnWJy4+C240BoAtWEJobAzWtM63XGmVWe/Vg7rwoTr55/DmNycwDhpo8/Q
 HkIaMrvfXdETR5FiJprJ8sX8kXNxzyikjf+qIk3XeOCKbDHoagtrDCl6HsJSFF51v4jb
 43KuzY/t6vUKWrMz8+cQ02oERX/Xe9pWr8fSFOhbdtAb8Ry/lUzuwzMdFcRAZ6nDRLwK
 sUHA==
X-Gm-Message-State: AOAM531CH4nUflseL81vsCQ0SkgisGOKRWMTxQO9Md63V0ZOeQUduAxq
 3Lno8Ee6qaf41y0nBE/MidqRRqAPgsQM1O8PSd2zOP7ZPMJduwaSUASDM3K8gwYpBVYMBktEtFQ
 Zz0Sinzn8uoxh0nc=
X-Received: by 2002:a05:6122:548:: with SMTP id
 y8mr7315237vko.24.1639042813245; 
 Thu, 09 Dec 2021 01:40:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPtbYUW47MwnBSywo/z1lAdLVvICZYtBWSsGVy8dq1+jSH+vHKfcAoYHGTpvcrJUbAoxpeOQ==
X-Received: by 2002:a05:6122:548:: with SMTP id
 y8mr7315201vko.24.1639042812997; 
 Thu, 09 Dec 2021 01:40:12 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:431:c7f0:dadb:5bd9:f52:7a4a:a8af])
 by smtp.gmail.com with ESMTPSA id s22sm3460215vkm.28.2021.12.09.01.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 01:40:09 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v6 4/6] migration: Add zero-copy parameter for QMP/HMP for
 Linux
Date: Thu,  9 Dec 2021 06:39:22 -0300
Message-Id: <20211209093923.1293701-5-leobras@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211209093923.1293701-1-leobras@redhat.com>
References: <20211209093923.1293701-1-leobras@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
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
index abaf6f9e3d..109d11e4a1 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -886,6 +886,10 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
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
@@ -1538,6 +1542,11 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
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
@@ -1650,6 +1659,11 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
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
@@ -2540,6 +2554,17 @@ int migrate_multifd_zstd_level(void)
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
@@ -4190,6 +4215,10 @@ static Property migration_properties[] = {
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
@@ -4287,6 +4316,9 @@ static void migration_instance_init(Object *obj)
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
index 9c91bf93e9..71d16f86ac 100644
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
2.33.1


