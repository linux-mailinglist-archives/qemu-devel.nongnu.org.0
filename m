Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6535313C881
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 16:56:19 +0100 (CET)
Received: from localhost ([::1]:56170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irl1l-0006X7-T8
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 10:56:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50135)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkLN-0001fM-GH
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:12:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkLL-0000h6-OM
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:12:29 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:46002
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkLL-0000gl-JZ
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:12:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PJlCD2JradsghflyEMq7rSMnpFDz8KzEvNJhvIgn0qw=;
 b=fxI8ltNKwc83lsW85akfmhAnGVi4NALb/j4DX//tKiY2ZW3ZI+VjkHa5Cv/yrUYL1ilIh1
 dpMYeaM4OFhitwriNUJ8mpMZ8mm32mnQzO91bMWaLYEPg2+v4ia2k+H5JpkEgjPMRV7C1/
 czaBQ1q3ZT+GSZ/41CHTP+3H7T6PeMQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-PX7tDXq-Mrm36JZDvXVhgg-1; Wed, 15 Jan 2020 10:12:25 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 112471005527;
 Wed, 15 Jan 2020 15:12:24 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 197F4194B2;
 Wed, 15 Jan 2020 15:12:16 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 82/86] numa: forbid '-numa node,
 mem' for 5.0 and newer machine types
Date: Wed, 15 Jan 2020 16:07:37 +0100
Message-Id: <1579100861-73692-83-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: PX7tDXq-Mrm36JZDvXVhgg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 libvir-list@redhat.com, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 pbonzini@redhat.com, david@gibson.dropbear.id.au, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Deprecation period is ran out and it's a time to flip the switch
introduced by cd5ff8333a.
Disable legacy option for new machine types and amend documentation.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: peter.maydell@linaro.org
CC: ehabkost@redhat.com
CC: marcel.apfelbaum@gmail.com
CC: mst@redhat.com
CC: pbonzini@redhat.com
CC: rth@twiddle.net
CC: david@gibson.dropbear.id.au
CC: libvir-list@redhat.com
CC: qemu-arm@nongnu.org
CC: qemu-ppc@nongnu.org
---
 hw/arm/virt.c        |  2 +-
 hw/core/numa.c       |  6 ++++++
 hw/i386/pc.c         |  1 -
 hw/i386/pc_piix.c    |  1 +
 hw/i386/pc_q35.c     |  1 +
 hw/ppc/spapr.c       |  2 +-
 qemu-deprecated.texi | 16 ----------------
 qemu-options.hx      |  8 ++++----
 8 files changed, 14 insertions(+), 23 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index e2fbca3..49de0d8 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2049,7 +2049,6 @@ static void virt_machine_class_init(ObjectClass *oc, =
void *data)
     hc->pre_plug =3D virt_machine_device_pre_plug_cb;
     hc->plug =3D virt_machine_device_plug_cb;
     hc->unplug_request =3D virt_machine_device_unplug_request_cb;
-    mc->numa_mem_supported =3D true;
     mc->auto_enable_numa_with_memhp =3D true;
     mc->default_ram_id =3D "mach-virt.ram";
 }
@@ -2153,6 +2152,7 @@ DEFINE_VIRT_MACHINE_AS_LATEST(5, 0)
 static void virt_machine_4_2_options(MachineClass *mc)
 {
     compat_props_add(mc->compat_props, hw_compat_4_2, hw_compat_4_2_len);
+    mc->numa_mem_supported =3D true;
 }
 DEFINE_VIRT_MACHINE(4, 2)
=20
diff --git a/hw/core/numa.c b/hw/core/numa.c
index 0970a30..3177066 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -117,6 +117,12 @@ static void parse_numa_node(MachineState *ms, NumaNode=
Options *node,
     }
=20
     if (node->has_mem) {
+        if (!mc->numa_mem_supported) {
+            error_setg(errp, "Parameter -numa node,mem is not supported by=
 this"
+                      " machine type. Use -numa node,memdev instead");
+            return;
+        }
+
         numa_info[nodenr].node_mem =3D node->mem;
         if (!qtest_enabled()) {
             warn_report("Parameter -numa node,mem is deprecated,"
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 21b8290..fa8d024 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1947,7 +1947,6 @@ static void pc_machine_class_init(ObjectClass *oc, vo=
id *data)
     hc->unplug =3D pc_machine_device_unplug_cb;
     mc->default_cpu_type =3D TARGET_DEFAULT_CPU_TYPE;
     mc->nvdimm_supported =3D true;
-    mc->numa_mem_supported =3D true;
     mc->default_ram_id =3D "pc.ram";
=20
     object_class_property_add(oc, PC_MACHINE_DEVMEM_REGION_SIZE, "int",
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index fa12203..0a9b9e0 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -435,6 +435,7 @@ static void pc_i440fx_4_2_machine_options(MachineClass =
*m)
     pc_i440fx_5_0_machine_options(m);
     m->alias =3D NULL;
     m->is_default =3D 0;
+    m->numa_mem_supported =3D true;
     compat_props_add(m->compat_props, hw_compat_4_2, hw_compat_4_2_len);
     compat_props_add(m->compat_props, pc_compat_4_2, pc_compat_4_2_len);
 }
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 84cf925..4d6e2be 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -363,6 +363,7 @@ static void pc_q35_4_2_machine_options(MachineClass *m)
 {
     pc_q35_5_0_machine_options(m);
     m->alias =3D NULL;
+    m->numa_mem_supported =3D true;
     compat_props_add(m->compat_props, hw_compat_4_2, hw_compat_4_2_len);
     compat_props_add(m->compat_props, pc_compat_4_2, pc_compat_4_2_len);
 }
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index bcbe1f1..2686b73 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4383,7 +4383,6 @@ static void spapr_machine_class_init(ObjectClass *oc,=
 void *data)
      * in which LMBs are represented and hot-added
      */
     mc->numa_mem_align_shift =3D 28;
-    mc->numa_mem_supported =3D true;
     mc->auto_enable_numa =3D true;
=20
     smc->default_caps.caps[SPAPR_CAP_HTM] =3D SPAPR_CAP_OFF;
@@ -4465,6 +4464,7 @@ static void spapr_machine_4_2_class_options(MachineCl=
ass *mc)
 {
     spapr_machine_5_0_class_options(mc);
     compat_props_add(mc->compat_props, hw_compat_4_2, hw_compat_4_2_len);
+    mc->numa_mem_supported =3D true;
 }
=20
 DEFINE_SPAPR_MACHINE(4_2, "4.2", false);
diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index 982af95..17a0e1d 100644
--- a/qemu-deprecated.texi
+++ b/qemu-deprecated.texi
@@ -89,22 +89,6 @@ error in the future.
 The @code{-realtime mlock=3Don|off} argument has been replaced by the
 @code{-overcommit mem-lock=3Don|off} argument.
=20
-@subsection -numa node,mem=3D@var{size} (since 4.1)
-
-The parameter @option{mem} of @option{-numa node} is used to assign a part=
 of
-guest RAM to a NUMA node. But when using it, it's impossible to manage spe=
cified
-RAM chunk on the host side (like bind it to a host node, setting bind poli=
cy, ...),
-so guest end-ups with the fake NUMA configuration with suboptiomal perform=
ance.
-However since 2014 there is an alternative way to assign RAM to a NUMA nod=
e
-using parameter @option{memdev}, which does the same as @option{mem} and a=
dds
-means to actualy manage node RAM on the host side. Use parameter @option{m=
emdev}
-with @var{memory-backend-ram} backend as an replacement for parameter @opt=
ion{mem}
-to achieve the same fake NUMA effect or a properly configured
-@var{memory-backend-file} backend to actually benefit from NUMA configurat=
ion.
-In future new machine versions will not accept the option but it will stil=
l
-work with old machine types. User can check QAPI schema to see if the lega=
cy
-option is supported by looking at MachineInfo::numa-mem-supported property=
.
-
 @subsection -numa node (without memory specified) (since 4.1)
=20
 Splitting RAM by default between NUMA nodes has the same issues as @option=
{mem}
diff --git a/qemu-options.hx b/qemu-options.hx
index 709162c..55500bd 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -223,10 +223,10 @@ For example:
 -numa cpu,node-id=3D0,socket-id=3D0 -numa cpu,node-id=3D1,socket-id=3D1
 @end example
=20
-@samp{mem} assigns a given RAM amount to a node. @samp{memdev}
-assigns RAM from a given memory backend device to a node. If
-@samp{mem} and @samp{memdev} are omitted in all nodes, RAM is
-split equally between them.
+Legacy @samp{mem} assigns a given RAM amount to a node (not supported for =
5.0
+and newer machine types). @samp{memdev} assigns RAM from a given memory ba=
ckend
+device to a node. If @samp{mem} and @samp{memdev} are omitted in all nodes=
, RAM
+is split equally between them.
=20
 @samp{mem} and @samp{memdev} are mutually exclusive. Furthermore,
 if one node uses @samp{memdev}, all of them have to use it.
--=20
2.7.4


