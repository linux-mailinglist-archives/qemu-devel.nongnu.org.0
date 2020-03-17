Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA98187E26
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 11:21:25 +0100 (CET)
Received: from localhost ([::1]:55800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jE9Lg-0005bH-Bj
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 06:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46115)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1jE96D-0001qk-3S
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 06:05:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1jE96A-000661-Fh
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 06:05:24 -0400
Received: from ozlabs.org ([203.11.71.1]:44903)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1jE96A-0005pc-0B; Tue, 17 Mar 2020 06:05:22 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48hTL14T90z9sTB; Tue, 17 Mar 2020 21:04:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1584439481;
 bh=9X+8xQKXdp9aA6GplPtlsf1pdhSBkl1CBAH7RG1EDMI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TSroW0ey0zqJgTqQguWkUxpAzmQ52/WPhxNqqkq1AKnqzLDkCqLif5UJqUlabGVpJ
 esWAxKjaOT1QDUqys7QkxsEWpHABAbY4Sd5+mMQtxzkiwRTzGsX/cOHLZFpr/ge0Vr
 ZHtaQjHUwQfCQAxUdmI0bMd63o95dYnf/5cKs2go=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 36/45] spapr: Rename DT functions to newer naming convention
Date: Tue, 17 Mar 2020 21:04:14 +1100
Message-Id: <20200317100423.622643-37-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200317100423.622643-1-david@gibson.dropbear.id.au>
References: <20200317100423.622643-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, mdroth@linux.vnet.ibm.com,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the spapr code we've been gradually moving towards a convention that
functions which create pieces of the device tree are called spapr_dt_*().
This patch speeds that along by renaming most of the things that don't ye=
t
match that so that they do.

For now we leave the *_dt_populate() functions which are actual methods
used in the DRCClass::dt_populate method.

While we're there we remove a few comments that don't really say anything
useful.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/spapr.c              | 62 +++++++++++++++++--------------------
 hw/ppc/spapr_ovec.c         |  4 +--
 include/hw/ppc/spapr_ovec.h |  4 +--
 3 files changed, 33 insertions(+), 37 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index aff8c87fad..878ed3f719 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -217,10 +217,9 @@ static int spapr_fixup_cpu_numa_dt(void *fdt, int of=
fset, PowerPCCPU *cpu)
                           sizeof(associativity));
 }
=20
-/* Populate the "ibm,pa-features" property */
-static void spapr_populate_pa_features(SpaprMachineState *spapr,
-                                       PowerPCCPU *cpu,
-                                       void *fdt, int offset)
+static void spapr_dt_pa_features(SpaprMachineState *spapr,
+                                 PowerPCCPU *cpu,
+                                 void *fdt, int offset)
 {
     uint8_t pa_features_206[] =3D { 6, 0,
         0xf6, 0x1f, 0xc7, 0x00, 0x80, 0xc0 };
@@ -315,8 +314,8 @@ static void add_str(GString *s, const gchar *s1)
     g_string_append_len(s, s1, strlen(s1) + 1);
 }
=20
-static int spapr_populate_memory_node(void *fdt, int nodeid, hwaddr star=
t,
-                                       hwaddr size)
+static int spapr_dt_memory_node(void *fdt, int nodeid, hwaddr start,
+                                hwaddr size)
 {
     uint32_t associativity[] =3D {
         cpu_to_be32(0x4), /* length */
@@ -391,9 +390,8 @@ spapr_get_drconf_cell(uint32_t seq_lmbs, uint64_t bas=
e_addr,
     return elem;
 }
=20
-/* ibm,dynamic-memory-v2 */
-static int spapr_populate_drmem_v2(SpaprMachineState *spapr, void *fdt,
-                                   int offset, MemoryDeviceInfoList *dim=
ms)
+static int spapr_dt_dynamic_memory_v2(SpaprMachineState *spapr, void *fd=
t,
+                                      int offset, MemoryDeviceInfoList *=
dimms)
 {
     MachineState *machine =3D MACHINE(spapr);
     uint8_t *int_buf, *cur_index;
@@ -484,8 +482,7 @@ static int spapr_populate_drmem_v2(SpaprMachineState =
*spapr, void *fdt,
     return 0;
 }
=20
-/* ibm,dynamic-memory */
-static int spapr_populate_drmem_v1(SpaprMachineState *spapr, void *fdt,
+static int spapr_dt_dynamic_memory(SpaprMachineState *spapr, void *fdt,
                                    int offset, MemoryDeviceInfoList *dim=
ms)
 {
     MachineState *machine =3D MACHINE(spapr);
@@ -554,7 +551,8 @@ static int spapr_populate_drmem_v1(SpaprMachineState =
*spapr, void *fdt,
  * Refer to docs/specs/ppc-spapr-hotplug.txt for the documentation
  * of this device tree node.
  */
-static int spapr_populate_drconf_memory(SpaprMachineState *spapr, void *=
fdt)
+static int spapr_dt_dynamic_reconfiguration_memory(SpaprMachineState *sp=
apr,
+                                                   void *fdt)
 {
     MachineState *machine =3D MACHINE(spapr);
     int nb_numa_nodes =3D machine->numa_state->num_nodes;
@@ -593,9 +591,9 @@ static int spapr_populate_drconf_memory(SpaprMachineS=
tate *spapr, void *fdt)
     /* ibm,dynamic-memory or ibm,dynamic-memory-v2 */
     dimms =3D qmp_memory_device_list();
     if (spapr_ovec_test(spapr->ov5_cas, OV5_DRMEM_V2)) {
-        ret =3D spapr_populate_drmem_v2(spapr, fdt, offset, dimms);
+        ret =3D spapr_dt_dynamic_memory_v2(spapr, fdt, offset, dimms);
     } else {
-        ret =3D spapr_populate_drmem_v1(spapr, fdt, offset, dimms);
+        ret =3D spapr_dt_dynamic_memory(spapr, fdt, offset, dimms);
     }
     qapi_free_MemoryDeviceInfoList(dimms);
=20
@@ -626,7 +624,7 @@ static int spapr_populate_drconf_memory(SpaprMachineS=
tate *spapr, void *fdt)
     return ret;
 }
=20
-static int spapr_populate_memory(SpaprMachineState *spapr, void *fdt)
+static int spapr_dt_memory(SpaprMachineState *spapr, void *fdt)
 {
     MachineState *machine =3D MACHINE(spapr);
     SpaprMachineClass *smc =3D SPAPR_MACHINE_GET_CLASS(spapr);
@@ -649,7 +647,7 @@ static int spapr_populate_memory(SpaprMachineState *s=
papr, void *fdt)
         if (!mem_start) {
             /* spapr_machine_init() checks for rma_size <=3D node0_size
              * already */
-            spapr_populate_memory_node(fdt, i, 0, spapr->rma_size);
+            spapr_dt_memory_node(fdt, i, 0, spapr->rma_size);
             mem_start +=3D spapr->rma_size;
             node_size -=3D spapr->rma_size;
         }
@@ -661,7 +659,7 @@ static int spapr_populate_memory(SpaprMachineState *s=
papr, void *fdt)
                 sizetmp =3D 1ULL << ctzl(mem_start);
             }
=20
-            spapr_populate_memory_node(fdt, i, mem_start, sizetmp);
+            spapr_dt_memory_node(fdt, i, mem_start, sizetmp);
             node_size -=3D sizetmp;
             mem_start +=3D sizetmp;
         }
@@ -672,7 +670,7 @@ static int spapr_populate_memory(SpaprMachineState *s=
papr, void *fdt)
         int ret;
=20
         g_assert(smc->dr_lmb_enabled);
-        ret =3D spapr_populate_drconf_memory(spapr, fdt);
+        ret =3D spapr_dt_dynamic_reconfiguration_memory(spapr, fdt);
         if (ret) {
             return ret;
         }
@@ -681,8 +679,8 @@ static int spapr_populate_memory(SpaprMachineState *s=
papr, void *fdt)
     return 0;
 }
=20
-static void spapr_populate_cpu_dt(CPUState *cs, void *fdt, int offset,
-                                  SpaprMachineState *spapr)
+static void spapr_dt_cpu(CPUState *cs, void *fdt, int offset,
+                         SpaprMachineState *spapr)
 {
     MachineState *ms =3D MACHINE(spapr);
     PowerPCCPU *cpu =3D POWERPC_CPU(cs);
@@ -782,7 +780,7 @@ static void spapr_populate_cpu_dt(CPUState *cs, void =
*fdt, int offset,
                           page_sizes_prop, page_sizes_prop_size)));
     }
=20
-    spapr_populate_pa_features(spapr, cpu, fdt, offset);
+    spapr_dt_pa_features(spapr, cpu, fdt, offset);
=20
     _FDT((fdt_setprop_cell(fdt, offset, "ibm,chip-id",
                            cs->cpu_index / vcpus_per_socket)));
@@ -816,7 +814,7 @@ static void spapr_populate_cpu_dt(CPUState *cs, void =
*fdt, int offset,
                               pcc->lrg_decr_bits)));
 }
=20
-static void spapr_populate_cpus_dt_node(void *fdt, SpaprMachineState *sp=
apr)
+static void spapr_dt_cpus(void *fdt, SpaprMachineState *spapr)
 {
     CPUState **rev;
     CPUState *cs;
@@ -860,13 +858,13 @@ static void spapr_populate_cpus_dt_node(void *fdt, =
SpaprMachineState *spapr)
         offset =3D fdt_add_subnode(fdt, cpus_offset, nodename);
         g_free(nodename);
         _FDT(offset);
-        spapr_populate_cpu_dt(cs, fdt, offset, spapr);
+        spapr_dt_cpu(cs, fdt, offset, spapr);
     }
=20
     g_free(rev);
 }
=20
-static int spapr_rng_populate_dt(void *fdt)
+static int spapr_dt_rng(void *fdt)
 {
     int node;
     int ret;
@@ -1111,8 +1109,7 @@ static void spapr_dt_chosen(SpaprMachineState *spap=
r, void *fdt, bool reset)
         g_free(bootlist);
     }
=20
-    _FDT(spapr_ovec_populate_dt(fdt, chosen, spapr->ov5_cas,
-                                "ibm,architecture-vec-5"));
+    _FDT(spapr_dt_ovec(fdt, chosen, spapr->ov5_cas, "ibm,architecture-ve=
c-5"));
 }
=20
 static void spapr_dt_hypervisor(SpaprMachineState *spapr, void *fdt)
@@ -1190,7 +1187,7 @@ void *spapr_build_fdt(SpaprMachineState *spapr, boo=
l reset, size_t space)
     /* /interrupt controller */
     spapr_irq_dt(spapr, spapr_max_server_number(spapr), fdt, PHANDLE_INT=
C);
=20
-    ret =3D spapr_populate_memory(spapr, fdt);
+    ret =3D spapr_dt_memory(spapr, fdt);
     if (ret < 0) {
         error_report("couldn't setup memory nodes in fdt");
         exit(1);
@@ -1200,7 +1197,7 @@ void *spapr_build_fdt(SpaprMachineState *spapr, boo=
l reset, size_t space)
     spapr_dt_vdevice(spapr->vio_bus, fdt);
=20
     if (object_resolve_path_type("", TYPE_SPAPR_RNG, NULL)) {
-        ret =3D spapr_rng_populate_dt(fdt);
+        ret =3D spapr_dt_rng(fdt);
         if (ret < 0) {
             error_report("could not set up rng device in the fdt");
             exit(1);
@@ -1215,8 +1212,7 @@ void *spapr_build_fdt(SpaprMachineState *spapr, boo=
l reset, size_t space)
         }
     }
=20
-    /* cpus */
-    spapr_populate_cpus_dt_node(fdt, spapr);
+    spapr_dt_cpus(fdt, spapr);
=20
     if (smc->dr_lmb_enabled) {
         _FDT(spapr_dt_drc(fdt, 0, NULL, SPAPR_DR_CONNECTOR_TYPE_LMB));
@@ -3408,8 +3404,8 @@ int spapr_lmb_dt_populate(SpaprDrc *drc, SpaprMachi=
neState *spapr,
     addr =3D spapr_drc_index(drc) * SPAPR_MEMORY_BLOCK_SIZE;
     node =3D object_property_get_uint(OBJECT(drc->dev), PC_DIMM_NODE_PRO=
P,
                                     &error_abort);
-    *fdt_start_offset =3D spapr_populate_memory_node(fdt, node, addr,
-                                                   SPAPR_MEMORY_BLOCK_SI=
ZE);
+    *fdt_start_offset =3D spapr_dt_memory_node(fdt, node, addr,
+                                             SPAPR_MEMORY_BLOCK_SIZE);
     return 0;
 }
=20
@@ -3810,7 +3806,7 @@ int spapr_core_dt_populate(SpaprDrc *drc, SpaprMach=
ineState *spapr,
     offset =3D fdt_add_subnode(fdt, 0, nodename);
     g_free(nodename);
=20
-    spapr_populate_cpu_dt(cs, fdt, offset, spapr);
+    spapr_dt_cpu(cs, fdt, offset, spapr);
=20
     *fdt_start_offset =3D offset;
     return 0;
diff --git a/hw/ppc/spapr_ovec.c b/hw/ppc/spapr_ovec.c
index 0ff6d1aeae..dd003f1763 100644
--- a/hw/ppc/spapr_ovec.c
+++ b/hw/ppc/spapr_ovec.c
@@ -200,8 +200,8 @@ SpaprOptionVector *spapr_ovec_parse_vector(target_ulo=
ng table_addr, int vector)
     return ov;
 }
=20
-int spapr_ovec_populate_dt(void *fdt, int fdt_offset,
-                           SpaprOptionVector *ov, const char *name)
+int spapr_dt_ovec(void *fdt, int fdt_offset,
+                  SpaprOptionVector *ov, const char *name)
 {
     uint8_t vec[OV_MAXBYTES + 1];
     uint16_t vec_len;
diff --git a/include/hw/ppc/spapr_ovec.h b/include/hw/ppc/spapr_ovec.h
index 2bed517a2b..d4dee9e06a 100644
--- a/include/hw/ppc/spapr_ovec.h
+++ b/include/hw/ppc/spapr_ovec.h
@@ -72,8 +72,8 @@ void spapr_ovec_set(SpaprOptionVector *ov, long bitnr);
 void spapr_ovec_clear(SpaprOptionVector *ov, long bitnr);
 bool spapr_ovec_test(SpaprOptionVector *ov, long bitnr);
 SpaprOptionVector *spapr_ovec_parse_vector(target_ulong table_addr, int =
vector);
-int spapr_ovec_populate_dt(void *fdt, int fdt_offset,
-                           SpaprOptionVector *ov, const char *name);
+int spapr_dt_ovec(void *fdt, int fdt_offset,
+                  SpaprOptionVector *ov, const char *name);
=20
 /* migration */
 extern const VMStateDescription vmstate_spapr_ovec;
--=20
2.24.1


