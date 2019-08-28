Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0F5A09D5
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 20:43:33 +0200 (CEST)
Received: from localhost ([::1]:39762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i32uq-0003wD-OR
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 14:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33277)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1i32sA-00024E-5t
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 14:40:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1i32s8-0003T0-Mt
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 14:40:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60034)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1i32s8-0003S9-F5
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 14:40:44 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B9747308FB82;
 Wed, 28 Aug 2019 18:40:43 +0000 (UTC)
Received: from localhost (ovpn-116-60.gru2.redhat.com [10.97.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 464B860BEC;
 Wed, 28 Aug 2019 18:40:40 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 28 Aug 2019 15:40:18 -0300
Message-Id: <20190828184026.5840-5-ehabkost@redhat.com>
In-Reply-To: <20190828184026.5840-1-ehabkost@redhat.com>
References: <20190828184026.5840-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Wed, 28 Aug 2019 18:40:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v6 04/12] numa: move numa global variable
 have_numa_distance into MachineState
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
Cc: Liu Jingqi <jingqi.liu@intel.com>, Tao Xu <tao3.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tao Xu <tao3.xu@intel.com>

Move existing numa global have_numa_distance into NumaState.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Liu Jingqi <jingqi.liu@intel.com>
Suggested-by: Igor Mammedov <imammedo@redhat.com>
Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Tao Xu <tao3.xu@intel.com>
Message-Id: <20190809065731.9097-4-tao3.xu@intel.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/sysemu/numa.h    | 4 ++--
 hw/arm/sbsa-ref.c        | 2 +-
 hw/arm/virt-acpi-build.c | 2 +-
 hw/arm/virt.c            | 2 +-
 hw/core/numa.c           | 5 ++---
 hw/i386/acpi-build.c     | 2 +-
 6 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
index 1786e861d0..bfe04b514c 100644
--- a/include/sysemu/numa.h
+++ b/include/sysemu/numa.h
@@ -14,8 +14,6 @@ struct CPUArchId;
 #define NUMA_DISTANCE_MAX         254
 #define NUMA_DISTANCE_UNREACHABLE 255
=20
-extern bool have_numa_distance;
-
 struct NodeInfo {
     uint64_t node_mem;
     struct HostMemoryBackend *node_memdev;
@@ -34,6 +32,8 @@ struct NumaState {
     /* Number of NUMA nodes */
     int num_nodes;
=20
+    /* Allow setting NUMA distance for different NUMA nodes */
+    bool have_numa_distance;
 };
 typedef struct NumaState NumaState;
=20
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index d15e5aebbd..7d7bb9fd96 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -160,7 +160,7 @@ static void create_fdt(SBSAMachineState *sms)
     qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
     qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
=20
-    if (have_numa_distance) {
+    if (ms->numa_state->have_numa_distance) {
         int size =3D nb_numa_nodes * nb_numa_nodes * 3 * sizeof(uint32_t=
);
         uint32_t *matrix =3D g_malloc0(size);
         int idx, i, j;
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 9e6cfe65b5..b1deb76a53 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -798,7 +798,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuild=
Tables *tables)
     if (ms->numa_state->num_nodes > 0) {
         acpi_add_table(table_offsets, tables_blob);
         build_srat(tables_blob, tables->linker, vms);
-        if (have_numa_distance) {
+        if (ms->numa_state->have_numa_distance) {
             acpi_add_table(table_offsets, tables_blob);
             build_slit(tables_blob, tables->linker, ms);
         }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 8d36b37f8e..414f7ecd02 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -236,7 +236,7 @@ static void create_fdt(VirtMachineState *vms)
                                 "clk24mhz");
     qemu_fdt_setprop_cell(fdt, "/apb-pclk", "phandle", vms->clock_phandl=
e);
=20
-    if (have_numa_distance) {
+    if (nb_numa_nodes > 0 && ms->numa_state->have_numa_distance) {
         int size =3D nb_numa_nodes * nb_numa_nodes * 3 * sizeof(uint32_t=
);
         uint32_t *matrix =3D g_malloc0(size);
         int idx, i, j;
diff --git a/hw/core/numa.c b/hw/core/numa.c
index 2712c78adb..4a7adc9b98 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -55,7 +55,6 @@ static int have_mem;
 static int max_numa_nodeid; /* Highest specified NUMA node ID, plus one.
                              * For all nodes, nodeid < max_numa_nodeid
                              */
-bool have_numa_distance;
 NodeInfo numa_info[MAX_NODES];
=20
=20
@@ -173,7 +172,7 @@ void parse_numa_distance(MachineState *ms, NumaDistOp=
tions *dist, Error **errp)
     }
=20
     numa_info[src].distance[dst] =3D val;
-    have_numa_distance =3D true;
+    ms->numa_state->have_numa_distance =3D true;
 }
=20
 void set_numa_options(MachineState *ms, NumaOptions *object, Error **err=
p)
@@ -446,7 +445,7 @@ void numa_complete_configuration(MachineState *ms)
          * asymmetric. In this case, the distances for both directions
          * of all node pairs are required.
          */
-        if (have_numa_distance) {
+        if (ms->numa_state->have_numa_distance) {
             /* Validate enough NUMA distance information was provided. *=
/
             validate_numa_distance(ms);
=20
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 3c5868322b..e54e571a75 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2694,7 +2694,7 @@ void acpi_build(AcpiBuildTables *tables, MachineSta=
te *machine)
     if (pcms->numa_nodes) {
         acpi_add_table(table_offsets, tables_blob);
         build_srat(tables_blob, tables->linker, machine);
-        if (have_numa_distance) {
+        if (machine->numa_state->have_numa_distance) {
             acpi_add_table(table_offsets, tables_blob);
             build_slit(tables_blob, tables->linker, machine);
         }
--=20
2.21.0


