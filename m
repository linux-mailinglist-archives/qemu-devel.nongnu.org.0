Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A95E417A
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 04:28:36 +0200 (CEST)
Received: from localhost ([::1]:54564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNpL9-00055w-7K
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 22:28:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39589)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iNpIz-0002VQ-D3
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 22:26:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iNpIx-0007dY-NJ
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 22:26:21 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:28152
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1iNpIx-0007dJ-Ie
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 22:26:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571970379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s4Vx6o5A+aCOtwYxTcn/YHkF+JyMjbufP9FhFqhT+cc=;
 b=cctgRqoK88+5fWwNFwbx3TFQDTTzEZeTRh5M9nHCP+72A/6kDF7GVmxS0OLiyjlS8WhGWu
 ILAt90oESVn743WtTKiQTFNjY+P4Fu8PGslRkxF5dBKRHSsyKFbnv6XyXZ6njhbXaxl5MW
 QPfiXwTdtMrd0eLl/J5KKoYtb2PVTgw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-pWuI0ASOPj-Jm0Zxy2bIvg-1; Thu, 24 Oct 2019 22:26:15 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50CDF1800DC7;
 Fri, 25 Oct 2019 02:26:13 +0000 (UTC)
Received: from localhost (ovpn-116-62.gru2.redhat.com [10.97.116.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC4C64129;
 Fri, 25 Oct 2019 02:26:09 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/7] cpu: Add `machine` parameter to query-cpu-definitions
Date: Thu, 24 Oct 2019 23:25:53 -0300
Message-Id: <20191025022553.25298-8-ehabkost@redhat.com>
In-Reply-To: <20191025022553.25298-1-ehabkost@redhat.com>
References: <20191025022553.25298-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: pWuI0ASOPj-Jm0Zxy2bIvg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 David Hildenbrand <david@redhat.com>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jiri Denemark <jdenemar@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The new parameter can be used by management software to query for
CPU model alias information for multiple machines without
restarting QEMU.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 qapi/machine-target.json                   | 14 +++++++-
 target/arm/helper.c                        |  4 ++-
 target/i386/cpu.c                          | 16 +++++++--
 target/mips/helper.c                       |  4 ++-
 target/ppc/translate_init.inc.c            |  4 ++-
 target/s390x/cpu_models.c                  |  4 ++-
 tests/acceptance/x86_cpu_model_versions.py | 42 ++++++++++++++++++++++
 7 files changed, 81 insertions(+), 7 deletions(-)

diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index 55310a6aa2..7bff3811fe 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -281,6 +281,10 @@
 #
 # @alias-of: Name of CPU model this model is an alias for.  The target of =
the
 #            CPU model alias may change depending on the machine type.
+#            If the @machine argument was provided to query-cpu-definition=
s,
+#            alias information that machine type will be returned.
+#            If @machine is not provided, alias information for
+#            the current machine will be returned.
 #            Management software is supposed to translate CPU model aliase=
s
 #            in the VM configuration, because aliases may stop being
 #            migration-safe in the future (since 4.1)
@@ -317,9 +321,17 @@
 #
 # Return a list of supported virtual CPU definitions
 #
+# @machine: Name of machine type.  The command returns some data
+#           that machine-specific.  This overrides the machine type
+#           used to look up that information.  This can be used,
+#           for example, to query machine-specific CPU model aliases
+#           without restarting QEMU (since 4.2)
+#
 # Returns: a list of CpuDefInfo
 #
 # Since: 1.2.0
 ##
-{ 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'],
+{ 'command': 'query-cpu-definitions',
+  'data': { '*machine': 'str' },
+  'returns': ['CpuDefinitionInfo'],
   'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_I386=
) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0d9a2d2ab7..96f9fe7fff 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6965,7 +6965,9 @@ static void arm_cpu_add_definition(gpointer data, gpo=
inter user_data)
     *cpu_list =3D entry;
 }
=20
-CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
+CpuDefinitionInfoList *qmp_query_cpu_definitions(bool has_machine,
+                                                 const char *machine,
+                                                 Error **errp)
 {
     CpuDefinitionInfoList *cpu_list =3D NULL;
     GSList *list;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 67d1eca4ed..ae633793ed 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4078,11 +4078,23 @@ static void x86_cpu_definition_entry(gpointer data,=
 gpointer user_data)
     args->cpu_list =3D entry;
 }
=20
-CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
+CpuDefinitionInfoList *qmp_query_cpu_definitions(bool has_machine,
+                                                 const char *machine,
+                                                 Error **errp)
 {
     X86CPUDefinitionArgs args =3D { .cpu_list =3D NULL };
     GSList *list;
-    MachineClass *mc =3D MACHINE_GET_CLASS(qdev_get_machine());
+    MachineClass *mc;
+
+    if (!has_machine) {
+        mc =3D MACHINE_GET_CLASS(qdev_get_machine());
+    } else {
+        mc =3D machine_find_class(machine);
+        if (!mc) {
+            error_setg(errp, "Machine type '%s' not found", machine);
+            return NULL;
+        }
+    }
=20
     args.default_version =3D default_cpu_version_for_machine(mc);
     list =3D get_sorted_cpu_model_list();
diff --git a/target/mips/helper.c b/target/mips/helper.c
index a2b6459b05..a73c767462 100644
--- a/target/mips/helper.c
+++ b/target/mips/helper.c
@@ -1481,7 +1481,9 @@ static void mips_cpu_add_definition(gpointer data, gp=
ointer user_data)
     *cpu_list =3D entry;
 }
=20
-CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
+CpuDefinitionInfoList *qmp_query_cpu_definitions(bool has_machine,
+                                                 const char *machine,
+                                                 Error **errp)
 {
     CpuDefinitionInfoList *cpu_list =3D NULL;
     GSList *list;
diff --git a/target/ppc/translate_init.inc.c b/target/ppc/translate_init.in=
c.c
index ba726dec4d..4493309c4c 100644
--- a/target/ppc/translate_init.inc.c
+++ b/target/ppc/translate_init.inc.c
@@ -10350,7 +10350,9 @@ static void ppc_cpu_defs_entry(gpointer data, gpoin=
ter user_data)
     *first =3D entry;
 }
=20
-CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
+CpuDefinitionInfoList *qmp_query_cpu_definitions(bool has_machine,
+                                                 const char *machine,
+                                                 Error **errp)
 {
     CpuDefinitionInfoList *cpu_list =3D NULL;
     GSList *list;
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 7e92fb2e15..e40f1f6bec 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -456,7 +456,9 @@ static void create_cpu_model_list(ObjectClass *klass, v=
oid *opaque)
     *cpu_list =3D entry;
 }
=20
-CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
+CpuDefinitionInfoList *qmp_query_cpu_definitions(bool has_machine,
+                                                 const char *machine,
+                                                 Error **errp)
 {
     struct CpuDefinitionInfoListData list_data =3D {
         .list =3D NULL,
diff --git a/tests/acceptance/x86_cpu_model_versions.py b/tests/acceptance/=
x86_cpu_model_versions.py
index 5fc9ca4bc6..79c5250243 100644
--- a/tests/acceptance/x86_cpu_model_versions.py
+++ b/tests/acceptance/x86_cpu_model_versions.py
@@ -234,6 +234,48 @@ class X86CPUModelAliases(avocado_qemu.Test):
=20
         self.validate_aliases(cpus)
=20
+    def test_machine_arg_none(self):
+        """Check if unversioned CPU model is an alias pointing to right ve=
rsion"""
+        vm1 =3D self.get_vm()
+        vm1.add_args('-S')
+        vm1.set_machine('pc-i440fx-4.0')
+        vm1.launch()
+        cpus1 =3D dict((m['name'], m.get('alias-of')) for m in vm1.command=
('query-cpu-definitions', machine=3D'none'))
+        vm1.shutdown()
+
+        vm2 =3D self.get_vm()
+        vm2.add_args('-S')
+        vm2.set_machine('none')
+        vm2.launch()
+        cpus2 =3D dict((m['name'], m.get('alias-of')) for m in vm2.command=
('query-cpu-definitions'))
+        vm1.shutdown()
+
+        self.assertEquals(cpus1, cpus2)
+
+    def test_machine_arg_4_1(self):
+        """Check if unversioned CPU model is an alias pointing to right ve=
rsion"""
+        vm1 =3D self.get_vm()
+        vm1.add_args('-S')
+        vm1.set_machine('pc-i440fx-4.0')
+        vm1.launch()
+        cpus1 =3D dict((m['name'], m.get('alias-of')) for m in vm1.command=
('query-cpu-definitions', machine=3D'pc-i440fx-4.1'))
+        vm1.shutdown()
+
+        vm2 =3D self.get_vm()
+        vm2.add_args('-S')
+        vm2.set_machine('pc-i440fx-4.1')
+        vm2.launch()
+        cpus2 =3D dict((m['name'], m.get('alias-of')) for m in vm2.command=
('query-cpu-definitions'))
+        vm1.shutdown()
+
+        self.assertEquals(cpus1, cpus2)
+
+    def test_invalid_machine(self):
+        self.vm.add_args('-S')
+        self.vm.launch()
+        r =3D self.vm.qmp('query-cpu-definitions', machine=3D'invalid-mach=
ine-123')
+        self.assertIn('error', r)
+
=20
 class CascadelakeArchCapabilities(avocado_qemu.Test):
     """
--=20
2.21.0


