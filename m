Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EE414C9FF
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 12:59:27 +0100 (CET)
Received: from localhost ([::1]:45108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwm0D-0000gq-Rr
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 06:59:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46915)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1iwlxz-0004nB-0c
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 06:57:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1iwlxx-0005z7-51
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 06:57:06 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40816
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1iwlxx-0005y3-0v
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 06:57:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580299024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sz2ErEjETxM9vvYjf4vQKALEKkDjlVXzMEsK10uaj/0=;
 b=PeyF4ESOahPSoQstmawEgStG92uqrumyGeqql5Pzhd+IEeShDHCwTuLtWtGW0hgM9X9eet
 KPBKaXaZ61nWQFWMbG+j+FYBsv5zSEx1+NtqqNtumtgA6CKLRtEFREEZChTlW2CqH/gMsY
 QaVrYnbHIAVVfhjPVACu0QfTcDu61Ro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-dAOopKyKO4OtDSlOXibcHg-1; Wed, 29 Jan 2020 06:57:02 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15250477
 for <qemu-devel@nongnu.org>; Wed, 29 Jan 2020 11:57:01 +0000 (UTC)
Received: from secure.mitica (ovpn-116-64.ams2.redhat.com [10.36.116.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F8A18578F;
 Wed, 29 Jan 2020 11:56:58 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/8] multifd: Add multifd-method parameter
Date: Wed, 29 Jan 2020 12:56:48 +0100
Message-Id: <20200129115655.10414-2-quintela@redhat.com>
In-Reply-To: <20200129115655.10414-1-quintela@redhat.com>
References: <20200129115655.10414-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: dAOopKyKO4OtDSlOXibcHg-1
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will store the compression method to use.  We start with none.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hw/core/qdev-properties.c    | 13 +++++++++++++
 include/hw/qdev-properties.h |  3 +++
 migration/migration.c        | 13 +++++++++++++
 monitor/hmp-cmds.c           | 13 +++++++++++++
 qapi/migration.json          | 30 +++++++++++++++++++++++++++---
 tests/qtest/migration-test.c | 14 ++++++++++----
 6 files changed, 79 insertions(+), 7 deletions(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 7f93bfeb88..4442844d37 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -8,6 +8,7 @@
 #include "qapi/qmp/qerror.h"
 #include "qemu/ctype.h"
 #include "qemu/error-report.h"
+#include "qapi/qapi-types-migration.h"
 #include "hw/block/block.h"
 #include "net/hub.h"
 #include "qapi/visitor.h"
@@ -639,6 +640,18 @@ const PropertyInfo qdev_prop_fdc_drive_type =3D {
     .set_default_value =3D set_default_value_enum,
 };
=20
+/* --- MultiFDMethod --- */
+
+const PropertyInfo qdev_prop_multifd_method =3D {
+    .name =3D "MultiFDMethod",
+    .description =3D "multifd_method values, "
+                   "none",
+    .enum_table =3D &MultiFDMethod_lookup,
+    .get =3D get_enum,
+    .set =3D set_enum,
+    .set_default_value =3D set_default_value_enum,
+};
+
 /* --- pci address --- */
=20
 /*
diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 906e697c58..6871b075a6 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -20,6 +20,7 @@ extern const PropertyInfo qdev_prop_chr;
 extern const PropertyInfo qdev_prop_tpm;
 extern const PropertyInfo qdev_prop_macaddr;
 extern const PropertyInfo qdev_prop_on_off_auto;
+extern const PropertyInfo qdev_prop_multifd_method;
 extern const PropertyInfo qdev_prop_losttickpolicy;
 extern const PropertyInfo qdev_prop_blockdev_on_error;
 extern const PropertyInfo qdev_prop_bios_chs_trans;
@@ -184,6 +185,8 @@ extern const PropertyInfo qdev_prop_pcie_link_width;
     DEFINE_PROP(_n, _s, _f, qdev_prop_macaddr, MACAddr)
 #define DEFINE_PROP_ON_OFF_AUTO(_n, _s, _f, _d) \
     DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_on_off_auto, OnOffAuto)
+#define DEFINE_PROP_MULTIFD_METHOD(_n, _s, _f, _d) \
+    DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_multifd_method, MultiFDMe=
thod)
 #define DEFINE_PROP_LOSTTICKPOLICY(_n, _s, _f, _d) \
     DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_losttickpolicy, \
                         LostTickPolicy)
diff --git a/migration/migration.c b/migration/migration.c
index 3a21a4686c..cd72bb6e9a 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -88,6 +88,7 @@
 /* The delay time (in ms) between two COLO checkpoints */
 #define DEFAULT_MIGRATE_X_CHECKPOINT_DELAY (200 * 100)
 #define DEFAULT_MIGRATE_MULTIFD_CHANNELS 2
+#define DEFAULT_MIGRATE_MULTIFD_METHOD MULTIFD_METHOD_NONE
=20
 /* Background transfer rate for postcopy, 0 means unlimited, note
  * that page requests can still exceed this limit.
@@ -798,6 +799,8 @@ MigrationParameters *qmp_query_migrate_parameters(Error=
 **errp)
     params->block_incremental =3D s->parameters.block_incremental;
     params->has_multifd_channels =3D true;
     params->multifd_channels =3D s->parameters.multifd_channels;
+    params->has_multifd_method =3D true;
+    params->multifd_method =3D s->parameters.multifd_method;
     params->has_xbzrle_cache_size =3D true;
     params->xbzrle_cache_size =3D s->parameters.xbzrle_cache_size;
     params->has_max_postcopy_bandwidth =3D true;
@@ -1315,6 +1318,9 @@ static void migrate_params_test_apply(MigrateSetParam=
eters *params,
     if (params->has_multifd_channels) {
         dest->multifd_channels =3D params->multifd_channels;
     }
+    if (params->has_multifd_method) {
+        dest->multifd_method =3D params->multifd_method;
+    }
     if (params->has_xbzrle_cache_size) {
         dest->xbzrle_cache_size =3D params->xbzrle_cache_size;
     }
@@ -1411,6 +1417,9 @@ static void migrate_params_apply(MigrateSetParameters=
 *params, Error **errp)
     if (params->has_multifd_channels) {
         s->parameters.multifd_channels =3D params->multifd_channels;
     }
+    if (params->has_multifd_method) {
+        s->parameters.multifd_method =3D params->multifd_method;
+    }
     if (params->has_xbzrle_cache_size) {
         s->parameters.xbzrle_cache_size =3D params->xbzrle_cache_size;
         xbzrle_cache_resize(params->xbzrle_cache_size, errp);
@@ -3515,6 +3524,9 @@ static Property migration_properties[] =3D {
     DEFINE_PROP_UINT8("multifd-channels", MigrationState,
                       parameters.multifd_channels,
                       DEFAULT_MIGRATE_MULTIFD_CHANNELS),
+    DEFINE_PROP_MULTIFD_METHOD("multifd-method", MigrationState,
+                      parameters.multifd_method,
+                      DEFAULT_MIGRATE_MULTIFD_METHOD),
     DEFINE_PROP_SIZE("xbzrle-cache-size", MigrationState,
                       parameters.xbzrle_cache_size,
                       DEFAULT_MIGRATE_XBZRLE_CACHE_SIZE),
@@ -3605,6 +3617,7 @@ static void migration_instance_init(Object *obj)
     params->has_x_checkpoint_delay =3D true;
     params->has_block_incremental =3D true;
     params->has_multifd_channels =3D true;
+    params->has_multifd_method =3D true;
     params->has_xbzrle_cache_size =3D true;
     params->has_max_postcopy_bandwidth =3D true;
     params->has_max_cpu_throttle =3D true;
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index d0e0af893a..16f01d4244 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -39,6 +39,7 @@
 #include "qapi/qapi-commands-tpm.h"
 #include "qapi/qapi-commands-ui.h"
 #include "qapi/qapi-visit-net.h"
+#include "qapi/qapi-visit-migration.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
 #include "qapi/string-input-visitor.h"
@@ -447,6 +448,9 @@ void hmp_info_migrate_parameters(Monitor *mon, const QD=
ict *qdict)
         monitor_printf(mon, "%s: %u\n",
             MigrationParameter_str(MIGRATION_PARAMETER_MULTIFD_CHANNELS),
             params->multifd_channels);
+        monitor_printf(mon, "%s: %s\n",
+            MigrationParameter_str(MIGRATION_PARAMETER_MULTIFD_METHOD),
+            MultiFDMethod_str(params->multifd_method));
         monitor_printf(mon, "%s: %" PRIu64 "\n",
             MigrationParameter_str(MIGRATION_PARAMETER_XBZRLE_CACHE_SIZE),
             params->xbzrle_cache_size);
@@ -1738,6 +1742,7 @@ void hmp_migrate_set_parameter(Monitor *mon, const QD=
ict *qdict)
     MigrateSetParameters *p =3D g_new0(MigrateSetParameters, 1);
     uint64_t valuebw =3D 0;
     uint64_t cache_size;
+    MultiFDMethod compress_type;
     Error *err =3D NULL;
     int val, ret;
=20
@@ -1823,6 +1828,14 @@ void hmp_migrate_set_parameter(Monitor *mon, const Q=
Dict *qdict)
         p->has_multifd_channels =3D true;
         visit_type_int(v, param, &p->multifd_channels, &err);
         break;
+    case MIGRATION_PARAMETER_MULTIFD_METHOD:
+        p->has_multifd_method =3D true;
+        visit_type_MultiFDMethod(v, param, &compress_type, &err);
+        if (err) {
+            break;
+        }
+        p->multifd_method =3D compress_type;
+        break;
     case MIGRATION_PARAMETER_XBZRLE_CACHE_SIZE:
         p->has_xbzrle_cache_size =3D true;
         visit_type_size(v, param, &cache_size, &err);
diff --git a/qapi/migration.json b/qapi/migration.json
index b7348d0c8b..96a126751c 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -488,6 +488,19 @@
 ##
 { 'command': 'query-migrate-capabilities', 'returns':   ['MigrationCapabil=
ityStatus']}
=20
+##
+# @MultiFDMethod:
+#
+# An enumeration of multifd compression.
+#
+# @none: no compression.
+#
+# Since: 5.0
+#
+##
+{ 'enum': 'MultiFDMethod',
+  'data': [ 'none' ] }
+
 ##
 # @MigrationParameter:
 #
@@ -586,6 +599,9 @@
 # @max-cpu-throttle: maximum cpu throttle percentage.
 #                    Defaults to 99. (Since 3.1)
 #
+# @multifd-method: Which compression method to use.
+#                  Defaults to none. (Since 5.0)
+#
 # Since: 2.4
 ##
 { 'enum': 'MigrationParameter',
@@ -598,7 +614,7 @@
            'downtime-limit', 'x-checkpoint-delay', 'block-incremental',
            'multifd-channels',
            'xbzrle-cache-size', 'max-postcopy-bandwidth',
-           'max-cpu-throttle' ] }
+           'max-cpu-throttle', 'multifd-method' ] }
=20
 ##
 # @MigrateSetParameters:
@@ -688,6 +704,9 @@
 # @max-cpu-throttle: maximum cpu throttle percentage.
 #                    The default value is 99. (Since 3.1)
 #
+# @multifd-method: Which compression method to use.
+#                  Defaults to none. (Since 5.0)
+#
 # Since: 2.4
 ##
 # TODO either fuse back into MigrationParameters, or make
@@ -713,7 +732,8 @@
             '*multifd-channels': 'int',
             '*xbzrle-cache-size': 'size',
             '*max-postcopy-bandwidth': 'size',
-=09    '*max-cpu-throttle': 'int' } }
+            '*max-cpu-throttle': 'int',
+            '*multifd-method': 'MultiFDMethod' } }
=20
 ##
 # @migrate-set-parameters:
@@ -823,6 +843,9 @@
 #                    Defaults to 99.
 #                     (Since 3.1)
 #
+# @multifd-method: Which compression method to use.
+#                  Defaults to none. (Since 5.0)
+#
 # Since: 2.4
 ##
 { 'struct': 'MigrationParameters',
@@ -846,7 +869,8 @@
             '*multifd-channels': 'uint8',
             '*xbzrle-cache-size': 'size',
 =09    '*max-postcopy-bandwidth': 'size',
-            '*max-cpu-throttle':'uint8'} }
+            '*max-cpu-throttle': 'uint8',
+            '*multifd-method': 'MultiFDMethod' } }
=20
 ##
 # @query-migrate-parameters:
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index cf27ebbc9d..d2f9ef38f5 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -378,7 +378,6 @@ static void migrate_check_parameter_str(QTestState *who=
, const char *parameter,
     g_free(result);
 }
=20
-__attribute__((unused))
 static void migrate_set_parameter_str(QTestState *who, const char *paramet=
er,
                                       const char *value)
 {
@@ -1251,7 +1250,7 @@ static void test_migrate_auto_converge(void)
     test_migrate_end(from, to, true);
 }
=20
-static void test_multifd_tcp(void)
+static void test_multifd_tcp(const char *method)
 {
     MigrateStart *args =3D migrate_start_new();
     QTestState *from, *to;
@@ -1275,6 +1274,9 @@ static void test_multifd_tcp(void)
     migrate_set_parameter_int(from, "multifd-channels", 16);
     migrate_set_parameter_int(to, "multifd-channels", 16);
=20
+    migrate_set_parameter_str(from, "multifd-method", method);
+    migrate_set_parameter_str(to, "multifd-method", method);
+
     migrate_set_capability(from, "multifd", "true");
     migrate_set_capability(to, "multifd", "true");
=20
@@ -1306,6 +1308,11 @@ static void test_multifd_tcp(void)
     g_free(uri);
 }
=20
+static void test_multifd_tcp_none(void)
+{
+    test_multifd_tcp("none");
+}
+
 /*
  * This test does:
  *  source               target
@@ -1317,7 +1324,6 @@ static void test_multifd_tcp(void)
  *
  *  And see that it works
  */
-
 static void test_multifd_tcp_cancel(void)
 {
     MigrateStart *args =3D migrate_start_new();
@@ -1467,7 +1473,7 @@ int main(int argc, char **argv)
                    test_validate_uuid_dst_not_set);
=20
     qtest_add_func("/migration/auto_converge", test_migrate_auto_converge)=
;
-    qtest_add_func("/migration/multifd/tcp", test_multifd_tcp);
+    qtest_add_func("/migration/multifd/tcp/none", test_multifd_tcp_none);
     qtest_add_func("/migration/multifd/tcp/cancel", test_multifd_tcp_cance=
l);
=20
     ret =3D g_test_run();
--=20
2.24.1


