Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F7B258EDA
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 15:04:32 +0200 (CEST)
Received: from localhost ([::1]:55428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD5xe-0004nK-2r
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 09:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1kD5qS-0001No-RF; Tue, 01 Sep 2020 08:57:04 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:35306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1kD5qP-0002mS-GB; Tue, 01 Sep 2020 08:57:04 -0400
Received: by mail-qk1-x741.google.com with SMTP id p25so783144qkp.2;
 Tue, 01 Sep 2020 05:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X4JeEPL4ZEeR7MtFOXVba+YwGV0pzjZM+YkE3+nJcS8=;
 b=obZH9ZadJbTGB4kEHJ2XxtsuDXllSlyRtupbFuAVXVyooNnD2q4rLhdBi1B5h63SYi
 /DkXNKL4SKvt4IcEoUeNwNxhOkPbABZDEKI+u5/VBs1HPikdWXB4EQZjRcWfZevthjt3
 wNgDDzFX7iWoOOLZgDSM/2MgAwZhkX0DiSrPev2Q7UyfBBrNVAneqDvZq1xxD9EiCt/e
 qcBHsd3Vg/hzLY56TuITSMRp/ScK9I1UpHcjZQOAmdG8pa9BUX3uf4LtfOybAoxnGknY
 fqYhOGt3pReTbJlwWD6Tvqdc2vAt8Ejo1GU15/b3LtNtpSuw/WO6f/Be1AIpUmggJV3H
 wyDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X4JeEPL4ZEeR7MtFOXVba+YwGV0pzjZM+YkE3+nJcS8=;
 b=QemLPOmSBgViC8wrffawaGyGUc07EsfrKjz1kSPviAImf7KfWCAkX054FPjkFZrNNw
 WJFF73QUSJ3cyKXCe+0ziVJOqTspQDxyyP0N6rx1di/HrajTbNg9MD4kFSi1FmDxPiVM
 Gm1Xd9xUksVOo5adMkawEDvsLNzVdJFWCqOBwaDpny7Ms9TbmNa8B3gzkBLZPDUbND5y
 R0rPMCsxBdu1q3u8ZId96sSzkkS/z6tWRrhm2Tqqx1Len4xPgRENV8FPNmI/pL8PNqAh
 ZXWsTvobYGRuicZbuE4cP/EDP3bniMKdCfrh/NJywCMkvMUZSX8kFLGJviJxlKaZXU5G
 P2EA==
X-Gm-Message-State: AOAM530ysbgBNAUuFk4CPP3/KbAZJnStJ3B919efgAS7mMuFKXmm4QeQ
 aP5ewKT8Qe90AQ2aqN26mpDMX3VfpUBHHQ==
X-Google-Smtp-Source: ABdhPJyU1AX9Jyxe44eQ4bNryAI2ElSOZCRbheBPE6roFRqlX3E04Naax59EQb+6MlFpcem6s7mnZQ==
X-Received: by 2002:a05:620a:141a:: with SMTP id
 d26mr1668288qkj.217.1598965019682; 
 Tue, 01 Sep 2020 05:56:59 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:6be:f6e3:c671:cefe:b943])
 by smtp.gmail.com with ESMTPSA id q7sm1430164qkf.35.2020.09.01.05.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 05:56:59 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/7] spapr: introduce SpaprMachineClass::numa_assoc_array
Date: Tue,  1 Sep 2020 09:56:41 -0300
Message-Id: <20200901125645.118026-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200901125645.118026-1-danielhb413@gmail.com>
References: <20200901125645.118026-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::741;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x741.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The next step to centralize all NUMA/associativity handling in
the spapr machine is to create a 'one stop place' for all
things ibm,associativity.

This patch introduces numa_assoc_array, a 2 dimensional array
that will store all ibm,associativity arrays of all NUMA nodes.
This array is initialized in a new spapr_numa_associativity_init()
function, called in spapr_machine_init(). It is being initialized
with the same values used in other ibm,associativity properties
around spapr files (i.e. all zeros, last value is node_id).
The idea is to remove all hardcoded definitions and FDT writes
of ibm,associativity arrays, doing instead a call to the new
helper spapr_numa_write_associativity_dt() helper, that will
be able to write the DT with the correct values.

We'll start small, handling the trivial cases first. The
remaining instances of ibm,associativity will be handled
next.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c                | 23 ++++++++++-------------
 hw/ppc/spapr_numa.c           | 32 ++++++++++++++++++++++++++++++++
 hw/ppc/spapr_nvdimm.c         | 19 +++++++------------
 hw/ppc/spapr_pci.c            |  9 ++-------
 include/hw/ppc/spapr.h        | 13 ++++++++++++-
 include/hw/ppc/spapr_numa.h   |  5 +++++
 include/hw/ppc/spapr_nvdimm.h |  2 +-
 7 files changed, 69 insertions(+), 34 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index a45912acac..fb9b2572fe 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -314,14 +314,9 @@ static void add_str(GString *s, const gchar *s1)
     g_string_append_len(s, s1, strlen(s1) + 1);
 }
 
-static int spapr_dt_memory_node(void *fdt, int nodeid, hwaddr start,
-                                hwaddr size)
+static int spapr_dt_memory_node(SpaprMachineState *spapr, void *fdt, int nodeid,
+                                hwaddr start, hwaddr size)
 {
-    uint32_t associativity[] = {
-        cpu_to_be32(0x4), /* length */
-        cpu_to_be32(0x0), cpu_to_be32(0x0),
-        cpu_to_be32(0x0), cpu_to_be32(nodeid)
-    };
     char mem_name[32];
     uint64_t mem_reg_property[2];
     int off;
@@ -335,8 +330,7 @@ static int spapr_dt_memory_node(void *fdt, int nodeid, hwaddr start,
     _FDT((fdt_setprop_string(fdt, off, "device_type", "memory")));
     _FDT((fdt_setprop(fdt, off, "reg", mem_reg_property,
                       sizeof(mem_reg_property))));
-    _FDT((fdt_setprop(fdt, off, "ibm,associativity", associativity,
-                      sizeof(associativity))));
+    spapr_numa_write_associativity_dt(spapr, fdt, off, nodeid);
     return off;
 }
 
@@ -649,7 +643,7 @@ static int spapr_dt_memory(SpaprMachineState *spapr, void *fdt)
         if (!mem_start) {
             /* spapr_machine_init() checks for rma_size <= node0_size
              * already */
-            spapr_dt_memory_node(fdt, i, 0, spapr->rma_size);
+            spapr_dt_memory_node(spapr, fdt, i, 0, spapr->rma_size);
             mem_start += spapr->rma_size;
             node_size -= spapr->rma_size;
         }
@@ -661,7 +655,7 @@ static int spapr_dt_memory(SpaprMachineState *spapr, void *fdt)
                 sizetmp = 1ULL << ctzl(mem_start);
             }
 
-            spapr_dt_memory_node(fdt, i, mem_start, sizetmp);
+            spapr_dt_memory_node(spapr, fdt, i, mem_start, sizetmp);
             node_size -= sizetmp;
             mem_start += sizetmp;
         }
@@ -1275,7 +1269,7 @@ void *spapr_build_fdt(SpaprMachineState *spapr, bool reset, size_t space)
 
     /* NVDIMM devices */
     if (mc->nvdimm_supported) {
-        spapr_dt_persistent_memory(fdt);
+        spapr_dt_persistent_memory(spapr, fdt);
     }
 
     return fdt;
@@ -2810,6 +2804,9 @@ static void spapr_machine_init(MachineState *machine)
      */
     spapr->gpu_numa_id = MAX(1, machine->numa_state->num_nodes);
 
+    /* Init numa_assoc_array */
+    spapr_numa_associativity_init(machine);
+
     if ((!kvm_enabled() || kvmppc_has_cap_mmu_radix()) &&
         ppc_type_check_compat(machine->cpu_type, CPU_POWERPC_LOGICAL_3_00, 0,
                               spapr->max_compat_pvr)) {
@@ -3394,7 +3391,7 @@ int spapr_lmb_dt_populate(SpaprDrc *drc, SpaprMachineState *spapr,
     addr = spapr_drc_index(drc) * SPAPR_MEMORY_BLOCK_SIZE;
     node = object_property_get_uint(OBJECT(drc->dev), PC_DIMM_NODE_PROP,
                                     &error_abort);
-    *fdt_start_offset = spapr_dt_memory_node(fdt, node, addr,
+    *fdt_start_offset = spapr_dt_memory_node(spapr, fdt, node, addr,
                                              SPAPR_MEMORY_BLOCK_SIZE);
     return 0;
 }
diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index cdf3288cbd..2cfe13eaed 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -15,6 +15,38 @@
 #include "hw/ppc/spapr_numa.h"
 #include "hw/ppc/fdt.h"
 
+
+void spapr_numa_associativity_init(MachineState *machine)
+{
+    SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(machine);
+    int nb_numa_nodes = machine->numa_state->num_nodes;
+    int i;
+
+    /*
+     * For all associativity arrays: first position is the size,
+     * position MAX_DISTANCE_REF_POINTS is always the numa_id,
+     * represented by the index 'i'.
+     *
+     * This will break on sparse NUMA setups, when/if QEMU starts
+     * to support it, because there will be no more guarantee that
+     * 'i' will be a valid node_id set by the user.
+     */
+    for (i = 0; i < nb_numa_nodes; i++) {
+        smc->numa_assoc_array[i][0] = cpu_to_be32(MAX_DISTANCE_REF_POINTS);
+        smc->numa_assoc_array[i][MAX_DISTANCE_REF_POINTS] = cpu_to_be32(i);
+    }
+}
+
+void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *fdt,
+                                       int offset, int nodeid)
+{
+    SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(spapr);
+
+    _FDT((fdt_setprop(fdt, offset, "ibm,associativity",
+                      smc->numa_assoc_array[nodeid],
+                      sizeof(smc->numa_assoc_array[nodeid]))));
+}
+
 /*
  * Helper that writes ibm,associativity-reference-points and
  * max-associativity-domains in the RTAS pointed by @rtas
diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
index 5188e2f503..63872054f3 100644
--- a/hw/ppc/spapr_nvdimm.c
+++ b/hw/ppc/spapr_nvdimm.c
@@ -31,6 +31,7 @@
 #include "hw/ppc/fdt.h"
 #include "qemu/range.h"
 #include "sysemu/sysemu.h"
+#include "hw/ppc/spapr_numa.h"
 
 void spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
                            uint64_t size, Error **errp)
@@ -117,8 +118,8 @@ void spapr_create_nvdimm_dr_connectors(SpaprMachineState *spapr)
 }
 
 
-static int spapr_dt_nvdimm(void *fdt, int parent_offset,
-                           NVDIMMDevice *nvdimm)
+static int spapr_dt_nvdimm(SpaprMachineState *spapr, void *fdt,
+                           int parent_offset, NVDIMMDevice *nvdimm)
 {
     int child_offset;
     char *buf;
@@ -128,11 +129,6 @@ static int spapr_dt_nvdimm(void *fdt, int parent_offset,
                                              &error_abort);
     uint64_t slot = object_property_get_uint(OBJECT(nvdimm), PC_DIMM_SLOT_PROP,
                                              &error_abort);
-    uint32_t associativity[] = {
-        cpu_to_be32(0x4), /* length */
-        cpu_to_be32(0x0), cpu_to_be32(0x0),
-        cpu_to_be32(0x0), cpu_to_be32(node)
-    };
     uint64_t lsize = nvdimm->label_size;
     uint64_t size = object_property_get_int(OBJECT(nvdimm), PC_DIMM_SIZE_PROP,
                                             NULL);
@@ -152,8 +148,7 @@ static int spapr_dt_nvdimm(void *fdt, int parent_offset,
     _FDT((fdt_setprop_string(fdt, child_offset, "compatible", "ibm,pmemory")));
     _FDT((fdt_setprop_string(fdt, child_offset, "device_type", "ibm,pmemory")));
 
-    _FDT((fdt_setprop(fdt, child_offset, "ibm,associativity", associativity,
-                      sizeof(associativity))));
+    spapr_numa_write_associativity_dt(spapr, fdt, child_offset, node);
 
     buf = qemu_uuid_unparse_strdup(&nvdimm->uuid);
     _FDT((fdt_setprop_string(fdt, child_offset, "ibm,unit-guid", buf)));
@@ -179,12 +174,12 @@ int spapr_pmem_dt_populate(SpaprDrc *drc, SpaprMachineState *spapr,
 {
     NVDIMMDevice *nvdimm = NVDIMM(drc->dev);
 
-    *fdt_start_offset = spapr_dt_nvdimm(fdt, 0, nvdimm);
+    *fdt_start_offset = spapr_dt_nvdimm(spapr, fdt, 0, nvdimm);
 
     return 0;
 }
 
-void spapr_dt_persistent_memory(void *fdt)
+void spapr_dt_persistent_memory(SpaprMachineState *spapr, void *fdt)
 {
     int offset = fdt_subnode_offset(fdt, 0, "persistent-memory");
     GSList *iter, *nvdimms = nvdimm_get_device_list();
@@ -202,7 +197,7 @@ void spapr_dt_persistent_memory(void *fdt)
     for (iter = nvdimms; iter; iter = iter->next) {
         NVDIMMDevice *nvdimm = iter->data;
 
-        spapr_dt_nvdimm(fdt, offset, nvdimm);
+        spapr_dt_nvdimm(spapr, fdt, offset, nvdimm);
     }
     g_slist_free(nvdimms);
 
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 0a418f1e67..4d97ff6c70 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -52,6 +52,7 @@
 #include "sysemu/kvm.h"
 #include "sysemu/hostmem.h"
 #include "sysemu/numa.h"
+#include "hw/ppc/spapr_numa.h"
 
 /* Copied from the kernel arch/powerpc/platforms/pseries/msi.c */
 #define RTAS_QUERY_FN           0
@@ -2321,11 +2322,6 @@ int spapr_dt_phb(SpaprMachineState *spapr, SpaprPhbState *phb,
         cpu_to_be32(1),
         cpu_to_be32(RTAS_IBM_RESET_PE_DMA_WINDOW)
     };
-    uint32_t associativity[] = {cpu_to_be32(0x4),
-                                cpu_to_be32(0x0),
-                                cpu_to_be32(0x0),
-                                cpu_to_be32(0x0),
-                                cpu_to_be32(phb->numa_node)};
     SpaprTceTable *tcet;
     SpaprDrc *drc;
     Error *err = NULL;
@@ -2358,8 +2354,7 @@ int spapr_dt_phb(SpaprMachineState *spapr, SpaprPhbState *phb,
 
     /* Advertise NUMA via ibm,associativity */
     if (phb->numa_node != -1) {
-        _FDT(fdt_setprop(fdt, bus_off, "ibm,associativity", associativity,
-                         sizeof(associativity)));
+        spapr_numa_write_associativity_dt(spapr, fdt, bus_off, phb->numa_node);
     }
 
     /* Build the interrupt-map, this must matches what is done
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index a1e230ad39..140914f9a1 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -105,6 +105,16 @@ typedef enum {
 
 #define FDT_MAX_SIZE                    0x100000
 
+/*
+ * NUMA related macros. MAX_DISTANCE_REF_POINTS was taken
+ * from Taken from Linux kernel arch/powerpc/mm/numa.h.
+ *
+ * NUMA_ASSOC_SIZE is the base array size of an ibm,associativity
+ * array for any non-CPU resource.
+ */
+#define MAX_DISTANCE_REF_POINTS    4
+#define NUMA_ASSOC_SIZE            (MAX_DISTANCE_REF_POINTS + 1)
+
 typedef struct SpaprCapabilities SpaprCapabilities;
 struct SpaprCapabilities {
     uint8_t caps[SPAPR_CAP_NUM];
@@ -131,9 +141,10 @@ struct SpaprMachineClass {
     bool smp_threads_vsmt; /* set VSMT to smp_threads by default */
     hwaddr rma_limit;          /* clamp the RMA to this size */
     bool pre_5_1_assoc_refpoints;
+    uint32_t numa_assoc_array[MAX_NODES][NUMA_ASSOC_SIZE];
 
     void (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
-                          uint64_t *buid, hwaddr *pio, 
+                          uint64_t *buid, hwaddr *pio,
                           hwaddr *mmio32, hwaddr *mmio64,
                           unsigned n_dma, uint32_t *liobns, hwaddr *nv2gpa,
                           hwaddr *nv2atsd, Error **errp);
diff --git a/include/hw/ppc/spapr_numa.h b/include/hw/ppc/spapr_numa.h
index 7a370a8768..2625e3db67 100644
--- a/include/hw/ppc/spapr_numa.h
+++ b/include/hw/ppc/spapr_numa.h
@@ -13,8 +13,13 @@
 #ifndef HW_SPAPR_NUMA_H
 #define HW_SPAPR_NUMA_H
 
+#include "hw/boards.h"
 #include "hw/ppc/spapr.h"
 
+void spapr_numa_associativity_init(MachineState *machine);
 void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int rtas);
+void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *fdt,
+                                       int offset, int nodeid);
+
 
 #endif /* HW_SPAPR_NUMA_H */
diff --git a/include/hw/ppc/spapr_nvdimm.h b/include/hw/ppc/spapr_nvdimm.h
index 10a6d9dbbc..3eb344e8e9 100644
--- a/include/hw/ppc/spapr_nvdimm.h
+++ b/include/hw/ppc/spapr_nvdimm.h
@@ -27,7 +27,7 @@ QEMU_BUILD_BUG_ON(SPAPR_MINIMUM_SCM_BLOCK_SIZE % SPAPR_MEMORY_BLOCK_SIZE);
 
 int spapr_pmem_dt_populate(SpaprDrc *drc, SpaprMachineState *spapr,
                            void *fdt, int *fdt_start_offset, Error **errp);
-void spapr_dt_persistent_memory(void *fdt);
+void spapr_dt_persistent_memory(SpaprMachineState *spapr, void *fdt);
 void spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
                            uint64_t size, Error **errp);
 void spapr_add_nvdimm(DeviceState *dev, uint64_t slot, Error **errp);
-- 
2.26.2


