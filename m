Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A72A1733F9
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Feb 2020 10:28:16 +0100 (CET)
Received: from localhost ([::1]:44114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7bwN-0002x6-3E
	for lists+qemu-devel@lfdr.de; Fri, 28 Feb 2020 04:28:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50431)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j7bt7-0006qi-IU
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 04:24:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j7bt6-0003ql-1R
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 04:24:53 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56833
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j7bt5-0003qc-Tp
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 04:24:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582881891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yF1LMEpJIdMZ7blgJtzj+Tg9WOUzFYriAA+w5XFB2nI=;
 b=dFu5gz/vvXqGNiVX5KiKIEhXYWVK+xmnNp50mzUdQAfJ266HdBK+kod6BicVGxE70Jm9Dk
 0DPseo74sUs3qxvNSDXZZ8z1OHrjp/xgaFNIV4lNR0cMBZidL7UVhFwjjINLGvB7otLRO2
 lW0X0OE3RpoFSz0UAHVx0QK/FFzhlWc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-8C5T1pJUOwWMH6HeEcxAWg-1; Fri, 28 Feb 2020 04:24:49 -0500
X-MC-Unique: 8C5T1pJUOwWMH6HeEcxAWg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F54C801E77;
 Fri, 28 Feb 2020 09:24:48 +0000 (UTC)
Received: from secure.mitica (ovpn-116-211.ams2.redhat.com [10.36.116.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5DC6D60BE0;
 Fri, 28 Feb 2020 09:24:42 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/15] multifd: Add multifd-zlib-level parameter
Date: Fri, 28 Feb 2020 10:24:09 +0100
Message-Id: <20200228092420.103757-5-quintela@redhat.com>
In-Reply-To: <20200228092420.103757-1-quintela@redhat.com>
References: <20200228092420.103757-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Laurent Vivier <lvivier@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This parameter specifies the zlib compression level. The next patch
will put it to use.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 24 ++++++++++++++++++++++++
 migration/migration.h |  1 +
 monitor/hmp-cmds.c    |  4 ++++
 qapi/migration.json   | 30 +++++++++++++++++++++++++++---
 4 files changed, 56 insertions(+), 3 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index eb7b0a2df0..a09726f679 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -89,6 +89,8 @@
 #define DEFAULT_MIGRATE_X_CHECKPOINT_DELAY (200 * 100)
 #define DEFAULT_MIGRATE_MULTIFD_CHANNELS 2
 #define DEFAULT_MIGRATE_MULTIFD_COMPRESSION MULTIFD_COMPRESSION_NONE
+/* 0: means nocompress, 1: best speed, ... 9: best compress ratio */
+#define DEFAULT_MIGRATE_MULTIFD_ZLIB_LEVEL 1
=20
 /* Background transfer rate for postcopy, 0 means unlimited, note
  * that page requests can still exceed this limit.
@@ -801,6 +803,8 @@ MigrationParameters *qmp_query_migrate_parameters(Error=
 **errp)
     params->multifd_channels =3D s->parameters.multifd_channels;
     params->has_multifd_compression =3D true;
     params->multifd_compression =3D s->parameters.multifd_compression;
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
@@ -2254,6 +2265,15 @@ MultiFDCompression migrate_multifd_compression(void)
     return s->parameters.multifd_compression;
 }
=20
+int migrate_multifd_zlib_level(void)
+{
+    MigrationState *s;
+
+    s =3D migrate_get_current();
+
+    return s->parameters.multifd_zlib_level;
+}
+
 int migrate_use_xbzrle(void)
 {
     MigrationState *s;
@@ -3544,6 +3564,9 @@ static Property migration_properties[] =3D {
     DEFINE_PROP_MULTIFD_COMPRESSION("multifd-compression", MigrationState,
                       parameters.multifd_compression,
                       DEFAULT_MIGRATE_MULTIFD_COMPRESSION),
+    DEFINE_PROP_UINT8("multifd-zlib-level", MigrationState,
+                      parameters.multifd_zlib_level,
+                      DEFAULT_MIGRATE_MULTIFD_ZLIB_LEVEL),
     DEFINE_PROP_SIZE("xbzrle-cache-size", MigrationState,
                       parameters.xbzrle_cache_size,
                       DEFAULT_MIGRATE_XBZRLE_CACHE_SIZE),
@@ -3635,6 +3658,7 @@ static void migration_instance_init(Object *obj)
     params->has_block_incremental =3D true;
     params->has_multifd_channels =3D true;
     params->has_multifd_compression =3D true;
+    params->has_multifd_zlib_level =3D true;
     params->has_xbzrle_cache_size =3D true;
     params->has_max_postcopy_bandwidth =3D true;
     params->has_max_cpu_throttle =3D true;
diff --git a/migration/migration.h b/migration/migration.h
index 59fea02482..c363ef9334 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -301,6 +301,7 @@ bool migrate_use_multifd(void);
 bool migrate_pause_before_switchover(void);
 int migrate_multifd_channels(void);
 MultiFDCompression migrate_multifd_compression(void);
+int migrate_multifd_zlib_level(void);
=20
 int migrate_use_xbzrle(void);
 int64_t migrate_xbzrle_cache_size(void);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index d9b4861f94..409ebb2b03 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1837,6 +1837,10 @@ void hmp_migrate_set_parameter(Monitor *mon, const Q=
Dict *qdict)
         }
         p->multifd_compression =3D compress_type;
         break;
+    case MIGRATION_PARAMETER_MULTIFD_ZLIB_LEVEL:
+        p->has_multifd_zlib_level =3D true;
+        visit_type_int(v, param, &p->multifd_zlib_level, &err);
+        break;
     case MIGRATION_PARAMETER_XBZRLE_CACHE_SIZE:
         p->has_xbzrle_cache_size =3D true;
         visit_type_size(v, param, &cache_size, &err);
diff --git a/qapi/migration.json b/qapi/migration.json
index 40950ef47e..468a9d92a4 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -602,6 +602,13 @@
 # @multifd-compression: Which compression method to use.
 #                       Defaults to none. (Since 5.0)
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
-           'max-cpu-throttle', 'multifd-compression' ] }
+           'max-cpu-throttle', 'multifd-compression',
+           'multifd-zlib-level' ] }
=20
 ##
 # @MigrateSetParameters:
@@ -707,6 +715,13 @@
 # @multifd-compression: Which compression method to use.
 #                       Defaults to none. (Since 5.0)
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
-            '*multifd-compression': 'MultiFDCompression' } }
+            '*multifd-compression': 'MultiFDCompression',
+            '*multifd-zlib-level': 'int' } }
=20
 ##
 # @migrate-set-parameters:
@@ -846,6 +862,13 @@
 # @multifd-compression: Which compression method to use.
 #                       Defaults to none. (Since 5.0)
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
             '*max-postcopy-bandwidth': 'size',
             '*max-cpu-throttle': 'uint8',
-            '*multifd-compression': 'MultiFDCompression' } }
+            '*multifd-compression': 'MultiFDCompression',
+            '*multifd-zlib-level': 'uint8' } }
=20
 ##
 # @query-migrate-parameters:
--=20
2.24.1


