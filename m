Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B14914B184
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 10:09:37 +0100 (CET)
Received: from localhost ([::1]:55702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwMsK-00034T-AK
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 04:09:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56664)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1iwMow-0005pC-Bn
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 04:06:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1iwMou-0002tR-Sf
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 04:06:06 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:24911
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1iwMou-0002tL-P9
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 04:06:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580202364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bh/FIRwBnOtySDetKn7Tt0sK/mF/BVwJ/xp7qo9LFwE=;
 b=CaTTdeQyAZyC/zl3tkpaZoKpI5kZjkVQ/t5fv7Vf6CKkrjWEApqE3fPEH7DVgzhav7GPPN
 AHwLvg1OLs+dySftWMdDrctjzLQqT5YyPKONy+Dm1od10xgHl005u2rab+1i5C4B3IkOpl
 cafRKF5ozb1AjP5yt4j7uNTLAk3JwPU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-kuSJhIyrM4K-sVjNvEZBHA-1; Tue, 28 Jan 2020 04:06:02 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E71CC189F762
 for <qemu-devel@nongnu.org>; Tue, 28 Jan 2020 09:06:01 +0000 (UTC)
Received: from secure.mitica (ovpn-116-64.ams2.redhat.com [10.36.116.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E72F1001B39;
 Tue, 28 Jan 2020 09:05:59 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/7] multifd: Add multifd-zlib-level parameter
Date: Tue, 28 Jan 2020 10:05:46 +0100
Message-Id: <20200128090550.5112-4-quintela@redhat.com>
In-Reply-To: <20200128090550.5112-1-quintela@redhat.com>
References: <20200128090550.5112-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: kuSJhIyrM4K-sVjNvEZBHA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.81
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It will indicate which level use for compression.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c | 15 +++++++++++++++
 monitor/hmp-cmds.c    |  4 ++++
 qapi/migration.json   | 30 +++++++++++++++++++++++++++---
 3 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 06f6c2d529..4f88f8e958 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -89,6 +89,8 @@
 #define DEFAULT_MIGRATE_X_CHECKPOINT_DELAY (200 * 100)
 #define DEFAULT_MIGRATE_MULTIFD_CHANNELS 2
 #define DEFAULT_MIGRATE_MULTIFD_METHOD MULTIFD_METHOD_NONE
+/*0: means nocompress, 1: best speed, ... 9: best compress ratio */
+#define DEFAULT_MIGRATE_MULTIFD_ZLIB_LEVEL 1
=20
 /* Background transfer rate for postcopy, 0 means unlimited, note
  * that page requests can still exceed this limit.
@@ -801,6 +803,8 @@ MigrationParameters *qmp_query_migrate_parameters(Error=
 **errp)
     params->multifd_channels =3D s->parameters.multifd_channels;
     params->has_multifd_method =3D true;
     params->multifd_method =3D s->parameters.multifd_method;
+    params->has_multifd_zlib_level =3D true;
+    params->multifd_zlib_level =3D s->parameters.multifd_zlib_level;
     params->has_xbzrle_cache_size =3D true;
     params->xbzrle_cache_size =3D s->parameters.xbzrle_cache_size;
     params->has_max_postcopy_bandwidth =3D true;
@@ -1208,6 +1212,13 @@ static bool migrate_params_check(MigrationParameters=
 *params, Error **errp)
         return false;
     }
=20
+    if (params->has_multifd_zlib_level &&
+        (params->multifd_zlib_level > 9)) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "multifd_zlib_level=
",
+                   "is invalid, it should be in the range of 0 to 9");
+        return false;
+    }
+
     if (params->has_xbzrle_cache_size &&
         (params->xbzrle_cache_size < qemu_target_page_size() ||
          !is_power_of_2(params->xbzrle_cache_size))) {
@@ -3536,6 +3547,9 @@ static Property migration_properties[] =3D {
     DEFINE_PROP_MULTIFD_METHOD("multifd-method", MigrationState,
                       parameters.multifd_method,
                       DEFAULT_MIGRATE_MULTIFD_METHOD),
+    DEFINE_PROP_UINT8("multifd-zlib-level", MigrationState,
+                      parameters.multifd_zlib_level,
+                      DEFAULT_MIGRATE_MULTIFD_ZLIB_LEVEL),
     DEFINE_PROP_SIZE("xbzrle-cache-size", MigrationState,
                       parameters.xbzrle_cache_size,
                       DEFAULT_MIGRATE_XBZRLE_CACHE_SIZE),
@@ -3627,6 +3641,7 @@ static void migration_instance_init(Object *obj)
     params->has_block_incremental =3D true;
     params->has_multifd_channels =3D true;
     params->has_multifd_method =3D true;
+    params->has_multifd_zlib_level =3D true;
     params->has_xbzrle_cache_size =3D true;
     params->has_max_postcopy_bandwidth =3D true;
     params->has_max_cpu_throttle =3D true;
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 16f01d4244..7f11866446 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1836,6 +1836,10 @@ void hmp_migrate_set_parameter(Monitor *mon, const Q=
Dict *qdict)
         }
         p->multifd_method =3D compress_type;
         break;
+    case MIGRATION_PARAMETER_MULTIFD_ZLIB_LEVEL:
+        p->has_multifd_zlib_level =3D true;
+        visit_type_int(v, param, &p->multifd_zlib_level, &err);
+        break;
     case MIGRATION_PARAMETER_XBZRLE_CACHE_SIZE:
         p->has_xbzrle_cache_size =3D true;
         visit_type_size(v, param, &cache_size, &err);
diff --git a/qapi/migration.json b/qapi/migration.json
index 96a126751c..289dce0da7 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -602,6 +602,13 @@
 # @multifd-method: Which compression method to use.
 #                  Defaults to none. (Since 5.0)
 #
+# @multifd-zlib-level: Set the compression level to be used in live
+#          migration, the compression level is an integer between 0
+#          and 9, where 0 means no compression, 1 means the best
+#          compression speed, and 9 means best compression ratio which
+#          will consume more CPU.
+#          Defaults to 1. (Since 5.0)
+#
 # Since: 2.4
 ##
 { 'enum': 'MigrationParameter',
@@ -614,7 +621,8 @@
            'downtime-limit', 'x-checkpoint-delay', 'block-incremental',
            'multifd-channels',
            'xbzrle-cache-size', 'max-postcopy-bandwidth',
-           'max-cpu-throttle', 'multifd-method' ] }
+           'max-cpu-throttle', 'multifd-method',
+           'multifd-zlib-level' ] }
=20
 ##
 # @MigrateSetParameters:
@@ -707,6 +715,13 @@
 # @multifd-method: Which compression method to use.
 #                  Defaults to none. (Since 5.0)
 #
+# @multifd-zlib-level: Set the compression level to be used in live
+#          migration, the compression level is an integer between 0
+#          and 9, where 0 means no compression, 1 means the best
+#          compression speed, and 9 means best compression ratio which
+#          will consume more CPU.
+#          Defaults to 1. (Since 5.0)
+#
 # Since: 2.4
 ##
 # TODO either fuse back into MigrationParameters, or make
@@ -733,7 +748,8 @@
             '*xbzrle-cache-size': 'size',
             '*max-postcopy-bandwidth': 'size',
             '*max-cpu-throttle': 'int',
-            '*multifd-method': 'MultiFDMethod' } }
+            '*multifd-method': 'MultiFDMethod',
+            '*multifd-zlib-level': 'int' } }
=20
 ##
 # @migrate-set-parameters:
@@ -846,6 +862,13 @@
 # @multifd-method: Which compression method to use.
 #                  Defaults to none. (Since 5.0)
 #
+# @multifd-zlib-level: Set the compression level to be used in live
+#          migration, the compression level is an integer between 0
+#          and 9, where 0 means no compression, 1 means the best
+#          compression speed, and 9 means best compression ratio which
+#          will consume more CPU.
+#          Defaults to 1. (Since 5.0)
+#
 # Since: 2.4
 ##
 { 'struct': 'MigrationParameters',
@@ -870,7 +893,8 @@
             '*xbzrle-cache-size': 'size',
 =09    '*max-postcopy-bandwidth': 'size',
             '*max-cpu-throttle': 'uint8',
-            '*multifd-method': 'MultiFDMethod' } }
+            '*multifd-method': 'MultiFDMethod',
+            '*multifd-zlib-level': 'uint8' } }
=20
 ##
 # @query-migrate-parameters:
--=20
2.24.1


