Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF42412054
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 19:52:59 +0200 (CEST)
Received: from localhost ([::1]:51052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSNTO-00056B-U9
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 13:52:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mSNQd-0001rf-NM; Mon, 20 Sep 2021 13:50:07 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:39697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mSNQb-0008Tj-Hx; Mon, 20 Sep 2021 13:50:07 -0400
Received: by mail-qk1-x731.google.com with SMTP id f130so6106642qke.6;
 Mon, 20 Sep 2021 10:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yrQu5YA34ScqAepu2aL8vTSPkZWNV/nz4wuSWFBkepg=;
 b=C4WW48nrkG5MHSQXkUaLcK6yWG1lKtYf6XTuwVT5MAuw4e20j4fsImAvlNi3AY5kw1
 pJBCPzFYRoJJRgcsD8kRewm+9S+xZe0pKpVEi0rtYcO1NM/iYPeh2Bv00BZs4CtWJTtU
 ZiQoj8W6be+snTv3nQ2xEfDJtA6OaxHSvcYMR+deGSJNogmcrrJ2Rn+GKoHPSxXRwCxs
 u09Q1pFGHCGO5C08Ejp/Y1qkMni6q1o/3TmvcNS2FuARgKEIvtHXYtafFu1vlml8DYxk
 S3xj1YwEkYm4gDrtNQVwe6rZbORTwSeSXNko5Y1DYOnUx4X/umNH8CLo8mTiARWMgg+D
 g4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yrQu5YA34ScqAepu2aL8vTSPkZWNV/nz4wuSWFBkepg=;
 b=4/NtLzk2tH6VzzhWRpuaIxThGsmJZYSFxSQFYU1XA4WjSlfwANhXMvB43AZoB/dr+O
 31hEt7jQmy9A4rCyX/p/ZI58OQ2srmft2sbm4vQkBECqhFyikdQq4A6zXvODwOc0kdgt
 Y0vDZ3qBqjJ69sPtoe6+qpiVpMLZcDyzQHzj4BYO/lgzT5hAZKh5xvt39uhaKeF77een
 gyjXt+YmCOysgbVis/bTq2Y25cfMo0CI9KvD71u6Xpcq0MFaKxtYBFqgGDOfqMdVMYfV
 J9Odou7uehfRwCuURm6Hvajoelvhq8BZjYRqxY56oWRqLNlyDrDXiPAnhVmuOj9VtUA1
 E3sw==
X-Gm-Message-State: AOAM530+zvpbdNl+u7fTLlqJIQo5UdqcX1LoARRxgw8AoDM6fLmNDCj1
 2fe3O5EleWBRphvPQrlAJOyobR6j9rI=
X-Google-Smtp-Source: ABdhPJzPy+vN3UyHGZuI3rX0pC/H8ZfrJmnAzj6SY5V6mIb1qhersk/ud4JYaCY/LDo0cCPoqx0rHw==
X-Received: by 2002:a37:f613:: with SMTP id y19mr24995656qkj.524.1632160203687; 
 Mon, 20 Sep 2021 10:50:03 -0700 (PDT)
Received: from rekt.COMFAST ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id l28sm6073614qkl.127.2021.09.20.10.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 10:50:03 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 3/7] spapr_numa.c: parametrize FORM1 macros
Date: Mon, 20 Sep 2021 14:49:43 -0300
Message-Id: <20210920174947.556324-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920174947.556324-1-danielhb413@gmail.com>
References: <20210920174947.556324-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x731.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The next preliminary step to introduce NUMA FORM2 affinity is to make
the existing code independent of FORM1 macros and values, i.e.
MAX_DISTANCE_REF_POINTS, NUMA_ASSOC_SIZE and VCPU_ASSOC_SIZE. This patch
accomplishes that by doing the following:

- move the NUMA related macros from spapr.h to spapr_numa.c where they
are used. spapr.h gets instead a 'NUMA_NODES_MAX_NUM' macro that is used
to refer to the maximum number of NUMA nodes, including GPU nodes, that
the machine can support;

- MAX_DISTANCE_REF_POINTS and NUMA_ASSOC_SIZE are renamed to
FORM1_DIST_REF_POINTS and FORM1_NUMA_ASSOC_SIZE. These FORM1 specific
macros are used in FORM1 init functions;

- code that uses MAX_DISTANCE_REF_POINTS now retrieves the
max_dist_ref_points value using get_max_dist_ref_points().
NUMA_ASSOC_SIZE is replaced by get_numa_assoc_size() and VCPU_ASSOC_SIZE
is replaced by get_vcpu_assoc_size(). These functions are used by the
generic device tree functions and h_home_node_associativity() and will
allow them to switch between FORM1 and FORM2 without changing their core
logic.

Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_numa.c    | 74 ++++++++++++++++++++++++++++++------------
 include/hw/ppc/spapr.h | 28 ++++++++--------
 2 files changed, 67 insertions(+), 35 deletions(-)

diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index bf520d42b2..08e2d6aed8 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -19,6 +19,33 @@
 /* Moved from hw/ppc/spapr_pci_nvlink2.c */
 #define SPAPR_GPU_NUMA_ID           (cpu_to_be32(1))
 
+/*
+ * Retrieves max_dist_ref_points of the current NUMA affinity.
+ */
+static int get_max_dist_ref_points(SpaprMachineState *spapr)
+{
+    return FORM1_DIST_REF_POINTS;
+}
+
+/*
+ * Retrieves numa_assoc_size of the current NUMA affinity.
+ */
+static int get_numa_assoc_size(SpaprMachineState *spapr)
+{
+    return FORM1_NUMA_ASSOC_SIZE;
+}
+
+/*
+ * Retrieves vcpu_assoc_size of the current NUMA affinity.
+ *
+ * vcpu_assoc_size is the size of ibm,associativity array
+ * for CPUs, which has an extra element (vcpu_id) in the end.
+ */
+static int get_vcpu_assoc_size(SpaprMachineState *spapr)
+{
+    return get_numa_assoc_size(spapr) + 1;
+}
+
 static bool spapr_numa_is_symmetrical(MachineState *ms)
 {
     int src, dst;
@@ -96,7 +123,7 @@ static void spapr_numa_define_FORM1_domains(SpaprMachineState *spapr)
      * considered a match with associativity domains of node 0.
      */
     for (i = 1; i < nb_numa_nodes; i++) {
-        for (j = 1; j < MAX_DISTANCE_REF_POINTS; j++) {
+        for (j = 1; j < FORM1_DIST_REF_POINTS; j++) {
             spapr->numa_assoc_array[i][j] = cpu_to_be32(i);
         }
     }
@@ -134,7 +161,7 @@ static void spapr_numa_define_FORM1_domains(SpaprMachineState *spapr)
              *
              * The Linux kernel will assume that the distance between src and
              * dst, in this case of no match, is 10 (local distance) doubled
-             * for each NUMA it didn't match. We have MAX_DISTANCE_REF_POINTS
+             * for each NUMA it didn't match. We have FORM1_DIST_REF_POINTS
              * levels (4), so this gives us 10*2*2*2*2 = 160.
              *
              * This logic can be seen in the Linux kernel source code, as of
@@ -169,7 +196,7 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
 
     /*
      * For all associativity arrays: first position is the size,
-     * position MAX_DISTANCE_REF_POINTS is always the numa_id,
+     * position FORM1_DIST_REF_POINTS is always the numa_id,
      * represented by the index 'i'.
      *
      * This will break on sparse NUMA setups, when/if QEMU starts
@@ -177,8 +204,8 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
      * 'i' will be a valid node_id set by the user.
      */
     for (i = 0; i < nb_numa_nodes; i++) {
-        spapr->numa_assoc_array[i][0] = cpu_to_be32(MAX_DISTANCE_REF_POINTS);
-        spapr->numa_assoc_array[i][MAX_DISTANCE_REF_POINTS] = cpu_to_be32(i);
+        spapr->numa_assoc_array[i][0] = cpu_to_be32(FORM1_DIST_REF_POINTS);
+        spapr->numa_assoc_array[i][FORM1_DIST_REF_POINTS] = cpu_to_be32(i);
     }
 
     /*
@@ -192,15 +219,15 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
     max_nodes_with_gpus = nb_numa_nodes + NVGPU_MAX_NUM;
 
     for (i = nb_numa_nodes; i < max_nodes_with_gpus; i++) {
-        spapr->numa_assoc_array[i][0] = cpu_to_be32(MAX_DISTANCE_REF_POINTS);
+        spapr->numa_assoc_array[i][0] = cpu_to_be32(FORM1_DIST_REF_POINTS);
 
-        for (j = 1; j < MAX_DISTANCE_REF_POINTS; j++) {
+        for (j = 1; j < FORM1_DIST_REF_POINTS; j++) {
             uint32_t gpu_assoc = smc->pre_5_1_assoc_refpoints ?
                                  SPAPR_GPU_NUMA_ID : cpu_to_be32(i);
             spapr->numa_assoc_array[i][j] = gpu_assoc;
         }
 
-        spapr->numa_assoc_array[i][MAX_DISTANCE_REF_POINTS] = cpu_to_be32(i);
+        spapr->numa_assoc_array[i][FORM1_DIST_REF_POINTS] = cpu_to_be32(i);
     }
 
     /*
@@ -234,13 +261,15 @@ void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *fdt,
 {
     _FDT((fdt_setprop(fdt, offset, "ibm,associativity",
                       spapr->numa_assoc_array[nodeid],
-                      sizeof(spapr->numa_assoc_array[nodeid]))));
+                      get_numa_assoc_size(spapr) * sizeof(uint32_t))));
 }
 
 static uint32_t *spapr_numa_get_vcpu_assoc(SpaprMachineState *spapr,
                                            PowerPCCPU *cpu)
 {
-    uint32_t *vcpu_assoc = g_new(uint32_t, VCPU_ASSOC_SIZE);
+    int max_distance_ref_points = get_max_dist_ref_points(spapr);
+    int vcpu_assoc_size = get_vcpu_assoc_size(spapr);
+    uint32_t *vcpu_assoc = g_new(uint32_t, vcpu_assoc_size);
     int index = spapr_get_vcpu_id(cpu);
 
     /*
@@ -249,10 +278,10 @@ static uint32_t *spapr_numa_get_vcpu_assoc(SpaprMachineState *spapr,
      * 0, put cpu_id last, then copy the remaining associativity
      * domains.
      */
-    vcpu_assoc[0] = cpu_to_be32(MAX_DISTANCE_REF_POINTS + 1);
-    vcpu_assoc[VCPU_ASSOC_SIZE - 1] = cpu_to_be32(index);
+    vcpu_assoc[0] = cpu_to_be32(max_distance_ref_points + 1);
+    vcpu_assoc[vcpu_assoc_size - 1] = cpu_to_be32(index);
     memcpy(vcpu_assoc + 1, spapr->numa_assoc_array[cpu->node_id] + 1,
-           (VCPU_ASSOC_SIZE - 2) * sizeof(uint32_t));
+           (vcpu_assoc_size - 2) * sizeof(uint32_t));
 
     return vcpu_assoc;
 }
@@ -261,12 +290,13 @@ int spapr_numa_fixup_cpu_dt(SpaprMachineState *spapr, void *fdt,
                             int offset, PowerPCCPU *cpu)
 {
     g_autofree uint32_t *vcpu_assoc = NULL;
+    int vcpu_assoc_size = get_vcpu_assoc_size(spapr);
 
     vcpu_assoc = spapr_numa_get_vcpu_assoc(spapr, cpu);
 
     /* Advertise NUMA via ibm,associativity */
     return fdt_setprop(fdt, offset, "ibm,associativity", vcpu_assoc,
-                       VCPU_ASSOC_SIZE * sizeof(uint32_t));
+                       vcpu_assoc_size * sizeof(uint32_t));
 }
 
 
@@ -274,17 +304,18 @@ int spapr_numa_write_assoc_lookup_arrays(SpaprMachineState *spapr, void *fdt,
                                          int offset)
 {
     MachineState *machine = MACHINE(spapr);
+    int max_distance_ref_points = get_max_dist_ref_points(spapr);
     int nb_numa_nodes = machine->numa_state->num_nodes;
     int nr_nodes = nb_numa_nodes ? nb_numa_nodes : 1;
     uint32_t *int_buf, *cur_index, buf_len;
     int ret, i;
 
     /* ibm,associativity-lookup-arrays */
-    buf_len = (nr_nodes * MAX_DISTANCE_REF_POINTS + 2) * sizeof(uint32_t);
+    buf_len = (nr_nodes * max_distance_ref_points + 2) * sizeof(uint32_t);
     cur_index = int_buf = g_malloc0(buf_len);
     int_buf[0] = cpu_to_be32(nr_nodes);
      /* Number of entries per associativity list */
-    int_buf[1] = cpu_to_be32(MAX_DISTANCE_REF_POINTS);
+    int_buf[1] = cpu_to_be32(max_distance_ref_points);
     cur_index += 2;
     for (i = 0; i < nr_nodes; i++) {
         /*
@@ -293,8 +324,8 @@ int spapr_numa_write_assoc_lookup_arrays(SpaprMachineState *spapr, void *fdt,
          */
         uint32_t *associativity = spapr->numa_assoc_array[i];
         memcpy(cur_index, ++associativity,
-               sizeof(uint32_t) * MAX_DISTANCE_REF_POINTS);
-        cur_index += MAX_DISTANCE_REF_POINTS;
+               sizeof(uint32_t) * max_distance_ref_points);
+        cur_index += max_distance_ref_points;
     }
     ret = fdt_setprop(fdt, offset, "ibm,associativity-lookup-arrays", int_buf,
                       (cur_index - int_buf) * sizeof(uint32_t));
@@ -383,6 +414,7 @@ static target_ulong h_home_node_associativity(PowerPCCPU *cpu,
     target_ulong procno = args[1];
     PowerPCCPU *tcpu;
     int idx, assoc_idx;
+    int vcpu_assoc_size = get_vcpu_assoc_size(spapr);
 
     /* only support procno from H_REGISTER_VPA */
     if (flags != 0x1) {
@@ -401,7 +433,7 @@ static target_ulong h_home_node_associativity(PowerPCCPU *cpu,
      * 12 associativity domains for vcpus. Assert and bail if that's
      * not the case.
      */
-    G_STATIC_ASSERT((VCPU_ASSOC_SIZE - 1) <= 12);
+    g_assert((vcpu_assoc_size - 1) <= 12);
 
     vcpu_assoc = spapr_numa_get_vcpu_assoc(spapr, tcpu);
     /* assoc_idx starts at 1 to skip associativity size */
@@ -422,9 +454,9 @@ static target_ulong h_home_node_associativity(PowerPCCPU *cpu,
          * macro. The ternary will fill the remaining registers with -1
          * after we went through vcpu_assoc[].
          */
-        a = assoc_idx < VCPU_ASSOC_SIZE ?
+        a = assoc_idx < vcpu_assoc_size ?
             be32_to_cpu(vcpu_assoc[assoc_idx++]) : -1;
-        b = assoc_idx < VCPU_ASSOC_SIZE ?
+        b = assoc_idx < vcpu_assoc_size ?
             be32_to_cpu(vcpu_assoc[assoc_idx++]) : -1;
 
         args[idx] = ASSOCIATIVITY(a, b);
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 637652ad16..814e087e98 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -100,23 +100,23 @@ typedef enum {
 
 #define FDT_MAX_SIZE                    0x200000
 
+/* Max number of GPUs per system */
+#define NVGPU_MAX_NUM              6
+
+/* Max number of NUMA nodes */
+#define NUMA_NODES_MAX_NUM         (MAX_NODES + NVGPU_MAX_NUM)
+
 /*
- * NUMA related macros. MAX_DISTANCE_REF_POINTS was taken
- * from Linux kernel arch/powerpc/mm/numa.h. It represents the
- * amount of associativity domains for non-CPU resources.
+ * NUMA FORM1 macros. FORM1_DIST_REF_POINTS was taken from
+ * MAX_DISTANCE_REF_POINTS in arch/powerpc/mm/numa.h from Linux
+ * kernel source. It represents the amount of associativity domains
+ * for non-CPU resources.
  *
- * NUMA_ASSOC_SIZE is the base array size of an ibm,associativity
+ * FORM1_NUMA_ASSOC_SIZE is the base array size of an ibm,associativity
  * array for any non-CPU resource.
- *
- * VCPU_ASSOC_SIZE represents the size of ibm,associativity array
- * for CPUs, which has an extra element (vcpu_id) in the end.
  */
-#define MAX_DISTANCE_REF_POINTS    4
-#define NUMA_ASSOC_SIZE            (MAX_DISTANCE_REF_POINTS + 1)
-#define VCPU_ASSOC_SIZE            (NUMA_ASSOC_SIZE + 1)
-
-/* Max number of these GPUsper a physical box */
-#define NVGPU_MAX_NUM                6
+#define FORM1_DIST_REF_POINTS            4
+#define FORM1_NUMA_ASSOC_SIZE            (FORM1_DIST_REF_POINTS + 1)
 
 typedef struct SpaprCapabilities SpaprCapabilities;
 struct SpaprCapabilities {
@@ -249,7 +249,7 @@ struct SpaprMachineState {
     unsigned gpu_numa_id;
     SpaprTpmProxy *tpm_proxy;
 
-    uint32_t numa_assoc_array[MAX_NODES + NVGPU_MAX_NUM][NUMA_ASSOC_SIZE];
+    uint32_t numa_assoc_array[NUMA_NODES_MAX_NUM][FORM1_NUMA_ASSOC_SIZE];
 
     Error *fwnmi_migration_blocker;
 };
-- 
2.31.1


