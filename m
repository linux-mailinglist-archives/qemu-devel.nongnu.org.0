Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0F914B185
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 10:09:45 +0100 (CET)
Received: from localhost ([::1]:55704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwMsS-0003aZ-M9
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 04:09:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56706)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1iwMp5-0005zO-Up
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 04:06:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1iwMp4-00037d-3g
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 04:06:15 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26174
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1iwMp3-00034x-D0
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 04:06:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580202372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yx6NVrkH5zxu4je3L/Hh3hmQyfdqMN/BdJ5eDYZYxNM=;
 b=KceTiJTS1fTYSJxJFijGSgSBT2Eyv2aG7+Tw2UkwHwqhR99kahfJvgpmO11mDfSag0dzhb
 HtuuaPdsk4vlcbf/TlVs+IdEQY3vAppAS09Kt/hQiewHzbnQrC62BE229+egVDi0wy7/vf
 NK35DeUopCbsBAe83SJlWWitcOvjoP8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-YXbgzbLcOWOf8fTq__w1Ew-1; Tue, 28 Jan 2020 04:06:10 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6576800EBB
 for <qemu-devel@nongnu.org>; Tue, 28 Jan 2020 09:06:09 +0000 (UTC)
Received: from secure.mitica (ovpn-116-64.ams2.redhat.com [10.36.116.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82A731084192;
 Tue, 28 Jan 2020 09:06:07 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 6/7] multifd: Add multifd-zstd-level parameter
Date: Tue, 28 Jan 2020 10:05:49 +0100
Message-Id: <20200128090550.5112-7-quintela@redhat.com>
In-Reply-To: <20200128090550.5112-1-quintela@redhat.com>
References: <20200128090550.5112-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: YXbgzbLcOWOf8fTq__w1Ew-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c | 15 +++++++++++++++
 monitor/hmp-cmds.c    |  4 ++++
 qapi/migration.json   | 29 ++++++++++++++++++++++++++---
 3 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 3b081e8147..b690500545 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -91,6 +91,8 @@
 #define DEFAULT_MIGRATE_MULTIFD_METHOD MULTIFD_METHOD_NONE
 /*0: means nocompress, 1: best speed, ... 9: best compress ratio */
 #define DEFAULT_MIGRATE_MULTIFD_ZLIB_LEVEL 1
+/* 0: means nocompress, 1: best speed, ... 20: best compress ratio */
+#define DEFAULT_MIGRATE_MULTIFD_ZSTD_LEVEL 1
=20
 /* Background transfer rate for postcopy, 0 means unlimited, note
  * that page requests can still exceed this limit.
@@ -805,6 +807,8 @@ MigrationParameters *qmp_query_migrate_parameters(Error=
 **errp)
     params->multifd_method =3D s->parameters.multifd_method;
     params->has_multifd_zlib_level =3D true;
     params->multifd_zlib_level =3D s->parameters.multifd_zlib_level;
+    params->has_multifd_zstd_level =3D true;
+    params->multifd_zstd_level =3D s->parameters.multifd_zstd_level;
     params->has_xbzrle_cache_size =3D true;
     params->xbzrle_cache_size =3D s->parameters.xbzrle_cache_size;
     params->has_max_postcopy_bandwidth =3D true;
@@ -1219,6 +1223,13 @@ static bool migrate_params_check(MigrationParameters=
 *params, Error **errp)
         return false;
     }
=20
+    if (params->has_multifd_zstd_level &&
+        (params->multifd_zstd_level > 20)) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "multifd_zstd_level=
",
+                   "is invalid, it should be in the range of 0 to 20");
+        return false;
+    }
+
     if (params->has_xbzrle_cache_size &&
         (params->xbzrle_cache_size < qemu_target_page_size() ||
          !is_power_of_2(params->xbzrle_cache_size))) {
@@ -3559,6 +3570,9 @@ static Property migration_properties[] =3D {
     DEFINE_PROP_UINT8("multifd-zlib-level", MigrationState,
                       parameters.multifd_zlib_level,
                       DEFAULT_MIGRATE_MULTIFD_ZLIB_LEVEL),
+    DEFINE_PROP_UINT8("multifd-zstd-level", MigrationState,
+                      parameters.multifd_zstd_level,
+                      DEFAULT_MIGRATE_MULTIFD_ZSTD_LEVEL),
     DEFINE_PROP_SIZE("xbzrle-cache-size", MigrationState,
                       parameters.xbzrle_cache_size,
                       DEFAULT_MIGRATE_XBZRLE_CACHE_SIZE),
@@ -3651,6 +3665,7 @@ static void migration_instance_init(Object *obj)
     params->has_multifd_channels =3D true;
     params->has_multifd_method =3D true;
     params->has_multifd_zlib_level =3D true;
+    params->has_multifd_zstd_level =3D true;
     params->has_xbzrle_cache_size =3D true;
     params->has_max_postcopy_bandwidth =3D true;
     params->has_max_cpu_throttle =3D true;
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 7f11866446..87db07694b 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1840,6 +1840,10 @@ void hmp_migrate_set_parameter(Monitor *mon, const Q=
Dict *qdict)
         p->has_multifd_zlib_level =3D true;
         visit_type_int(v, param, &p->multifd_zlib_level, &err);
         break;
+    case MIGRATION_PARAMETER_MULTIFD_ZSTD_LEVEL:
+        p->has_multifd_zstd_level =3D true;
+        visit_type_int(v, param, &p->multifd_zstd_level, &err);
+        break;
     case MIGRATION_PARAMETER_XBZRLE_CACHE_SIZE:
         p->has_xbzrle_cache_size =3D true;
         visit_type_size(v, param, &cache_size, &err);
diff --git a/qapi/migration.json b/qapi/migration.json
index 032ee7d3e6..bb5cb6b4f4 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -610,6 +610,13 @@
 #          will consume more CPU.
 #          Defaults to 1. (Since 5.0)
 #
+# @multifd-zstd-level: Set the compression level to be used in live
+#          migration, the compression level is an integer between 0
+#          and 20, where 0 means no compression, 1 means the best
+#          compression speed, and 20 means best compression ratio which
+#          will consume more CPU.
+#          Defaults to 1. (Since 5.0)
+#
 # Since: 2.4
 ##
 { 'enum': 'MigrationParameter',
@@ -623,7 +630,7 @@
            'multifd-channels',
            'xbzrle-cache-size', 'max-postcopy-bandwidth',
            'max-cpu-throttle', 'multifd-method',
-           'multifd-zlib-level' ] }
+           'multifd-zlib-level' ,'multifd-zstd-level' ] }
=20
 ##
 # @MigrateSetParameters:
@@ -723,6 +730,13 @@
 #          will consume more CPU.
 #          Defaults to 1. (Since 5.0)
 #
+# @multifd-zstd-level: Set the compression level to be used in live
+#          migration, the compression level is an integer between 0
+#          and 20, where 0 means no compression, 1 means the best
+#          compression speed, and 20 means best compression ratio which
+#          will consume more CPU.
+#          Defaults to 1. (Since 5.0)
+#
 # Since: 2.4
 ##
 # TODO either fuse back into MigrationParameters, or make
@@ -750,7 +764,8 @@
             '*max-postcopy-bandwidth': 'size',
             '*max-cpu-throttle': 'int',
             '*multifd-method': 'MultiFDMethod',
-            '*multifd-zlib-level': 'int' } }
+            '*multifd-zlib-level': 'int',
+            '*multifd-zstd-level': 'int' } }
=20
 ##
 # @migrate-set-parameters:
@@ -870,6 +885,13 @@
 #          will consume more CPU.
 #          Defaults to 1. (Since 5.0)
 #
+# @multifd-zstd-level: Set the compression level to be used in live
+#          migration, the compression level is an integer between 0
+#          and 20, where 0 means no compression, 1 means the best
+#          compression speed, and 20 means best compression ratio which
+#          will consume more CPU.
+#          Defaults to 1. (Since 5.0)
+#
 # Since: 2.4
 ##
 { 'struct': 'MigrationParameters',
@@ -895,7 +917,8 @@
 =09    '*max-postcopy-bandwidth': 'size',
             '*max-cpu-throttle': 'uint8',
             '*multifd-method': 'MultiFDMethod',
-            '*multifd-zlib-level': 'uint8' } }
+            '*multifd-zlib-level': 'uint8',
+            '*multifd-zstd-level': 'uint8' } }
=20
 ##
 # @query-migrate-parameters:
--=20
2.24.1


