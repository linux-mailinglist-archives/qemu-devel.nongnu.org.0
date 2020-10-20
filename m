Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F70293D68
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 15:36:20 +0200 (CEST)
Received: from localhost ([::1]:48202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUroJ-0008FX-9v
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 09:36:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kUrUA-0000Qk-MD; Tue, 20 Oct 2020 09:15:30 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5269 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kUrU0-00077T-Pa; Tue, 20 Oct 2020 09:15:30 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 5A4B42D3DE87B59C9C38;
 Tue, 20 Oct 2020 21:15:13 +0800 (CST)
Received: from localhost (10.174.186.67) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Tue, 20 Oct 2020
 21:15:06 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH v2 13/13] hw/arm/virt-acpi-build: Enable CPU cache topology
Date: Tue, 20 Oct 2020 21:14:40 +0800
Message-ID: <20201020131440.1090-14-fangying1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20201020131440.1090-1-fangying1@huawei.com>
References: <20201020131440.1090-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 09:15:07
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, alex.chen@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, alistair.francis@wdc.com,
 Ying Fang <fangying1@huawei.com>, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A helper struct AcpiCacheOffset is introduced to describe the offset
of three level caches. The cache hierarchy is built according to
ACPI spec v6.3 5.2.29.2. Let's enable CPU cache topology now.

Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 hw/acpi/aml-build.c         | 19 +++++++++-----
 hw/arm/virt-acpi-build.c    | 52 ++++++++++++++++++++++++++++++++-----
 include/hw/acpi/acpi-defs.h |  6 +++++
 include/hw/acpi/aml-build.h |  7 ++---
 4 files changed, 68 insertions(+), 16 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 6f0e8df49b..f449fa27e7 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1799,27 +1799,32 @@ void build_cache_hierarchy(GArray *tbl,
 /*
  * ACPI 6.3: 5.2.29.1 Processor hierarchy node structure (Type 0)
  */
-void build_socket_hierarchy(GArray *tbl, uint32_t parent, uint32_t id)
+void build_socket_hierarchy(GArray *tbl, uint32_t parent,
+                            uint32_t offset, uint32_t id)
 {
     build_append_byte(tbl, 0);          /* Type 0 - processor */
-    build_append_byte(tbl, 20);         /* Length, no private resources */
+    build_append_byte(tbl, 24);         /* Length, no private resources */
     build_append_int_noprefix(tbl, 0, 2);  /* Reserved */
     build_append_int_noprefix(tbl, 1, 4);  /* Flags: Physical package */
     build_append_int_noprefix(tbl, parent, 4);  /* Parent */
     build_append_int_noprefix(tbl, id, 4);     /* ACPI processor ID */
-    build_append_int_noprefix(tbl, 0, 4);  /* Number of private resources */
+    build_append_int_noprefix(tbl, 1, 4);  /*  Number of private resources */
+    build_append_int_noprefix(tbl, offset, 4);  /* Private resources */
 }
 
-void build_processor_hierarchy(GArray *tbl, uint32_t flags,
-                               uint32_t parent, uint32_t id)
+void build_processor_hierarchy(GArray *tbl, uint32_t flags, uint32_t parent,
+                               AcpiCacheOffset offset, uint32_t id)
 {
     build_append_byte(tbl, 0);          /* Type 0 - processor */
-    build_append_byte(tbl, 20);         /* Length, no private resources */
+    build_append_byte(tbl, 32);         /* Length, no private resources */
     build_append_int_noprefix(tbl, 0, 2);      /* Reserved */
     build_append_int_noprefix(tbl, flags, 4);  /* Flags */
     build_append_int_noprefix(tbl, parent, 4); /* Parent */
     build_append_int_noprefix(tbl, id, 4);     /* ACPI processor ID */
-    build_append_int_noprefix(tbl, 0, 4);  /* Number of private resources */
+    build_append_int_noprefix(tbl, 3, 4);  /* Number of private resources */
+    build_append_int_noprefix(tbl, offset.l1d_offset, 4);/* Private resources */
+    build_append_int_noprefix(tbl, offset.l1i_offset, 4);/* Private resources */
+    build_append_int_noprefix(tbl, offset.l2_offset, 4); /* Private resources */
 }
 
 void build_smt_hierarchy(GArray *tbl, uint32_t parent, uint32_t id)
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index e1f3ea50ad..8a026ba24e 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -429,29 +429,69 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                  "SRAT", table_data->len - srat_start, 3, NULL, NULL);
 }
 
-static void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms)
+static inline void arm_acpi_cache_info(CPUCacheInfo *cpu_cache,
+                                       AcpiCacheInfo *acpi_cache)
 {
+    acpi_cache->size = cpu_cache->size;
+    acpi_cache->sets = cpu_cache->sets;
+    acpi_cache->associativity = cpu_cache->associativity;
+    acpi_cache->attributes = cpu_cache->attributes;
+    acpi_cache->line_size = cpu_cache->line_size;
+}
+
+static void build_pptt(GArray *table_data, BIOSLinker *linker,
+                       VirtMachineState *vms)
+{
+    MachineState *ms = MACHINE(vms);
     int pptt_start = table_data->len;
     int uid = 0, cpus = 0, socket;
     unsigned int smp_cores = ms->smp.cores;
     unsigned int smp_threads = ms->smp.threads;
+    AcpiCacheOffset offset;
+    ARMCPU *cpu = ARM_CPU(qemu_get_cpu(cpus));
+    AcpiCacheInfo cache_info;
 
     acpi_data_push(table_data, sizeof(AcpiTableHeader));
 
     for (socket = 0; cpus < ms->possible_cpus->len; socket++) {
-        uint32_t socket_offset = table_data->len - pptt_start;
+        uint32_t l3_offset = table_data->len - pptt_start;
+        uint32_t socket_offset;
         int core;
 
-        build_socket_hierarchy(table_data, 0, socket);
+        /* L3 cache type structure */
+        arm_acpi_cache_info(cpu->caches.l3_cache, &cache_info);
+        build_cache_hierarchy(table_data, 0, &cache_info);
+
+        socket_offset = table_data->len - pptt_start;
+        build_socket_hierarchy(table_data, 0, l3_offset, socket);
 
         for (core = 0; core < smp_cores; core++) {
             uint32_t core_offset = table_data->len - pptt_start;
             int thread;
 
+            /* L2 cache tpe structure */
+            offset.l2_offset = table_data->len - pptt_start;
+            arm_acpi_cache_info(cpu->caches.l2_cache, &cache_info);
+            build_cache_hierarchy(table_data, 0, &cache_info);
+
+            /* L1d cache type structure */
+            offset.l1d_offset = table_data->len - pptt_start;
+            arm_acpi_cache_info(cpu->caches.l1d_cache, &cache_info);
+            build_cache_hierarchy(table_data, offset.l2_offset, &cache_info);
+
+            /* L1i cache type structure */
+            offset.l1i_offset = table_data->len - pptt_start;
+            arm_acpi_cache_info(cpu->caches.l1i_cache, &cache_info);
+            build_cache_hierarchy(table_data, offset.l2_offset, &cache_info);
+
+            core_offset = table_data->len - pptt_start;
             if (smp_threads <= 1) {
-                build_processor_hierarchy(table_data, 2, socket_offset, uid++);
+                build_processor_hierarchy(table_data, 2, socket_offset,
+                                          offset, uid++);
              } else {
-                build_processor_hierarchy(table_data, 0, socket_offset, core);
+
+                build_processor_hierarchy(table_data, 0, socket_offset,
+                                          offset, core);
                 for (thread = 0; thread < smp_threads; thread++) {
                     build_smt_hierarchy(table_data, core_offset, uid++);
                 }
@@ -727,7 +767,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 
     if (cpu_topology_enabled) {
         acpi_add_table(table_offsets, tables_blob);
-        build_pptt(tables_blob, tables->linker, ms);
+        build_pptt(tables_blob, tables->linker, vms);
     }
 
     acpi_add_table(table_offsets, tables_blob);
diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 3df38ab449..e48b7fa506 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -626,4 +626,10 @@ typedef struct AcpiCacheInfo {
     uint16_t line_size;
 } AcpiCacheInfo;
 
+typedef struct AcpiCacheOffset {
+    uint32_t l1d_offset;
+    uint32_t l1i_offset;
+    uint32_t l2_offset;
+} AcpiCacheOffset;
+
 #endif
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 01078753a8..a15ccb2c91 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -440,10 +440,11 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms);
 void build_cache_hierarchy(GArray *tbl,
               uint32_t next_level, AcpiCacheInfo *cache_info);
 
-void build_socket_hierarchy(GArray *tbl, uint32_t parent, uint32_t id);
+void build_socket_hierarchy(GArray *tbl, uint32_t parent,
+                            uint32_t offset, uint32_t id);
 
-void build_processor_hierarchy(GArray *tbl, uint32_t flags,
-                               uint32_t parent, uint32_t id);
+void build_processor_hierarchy(GArray *tbl, uint32_t flags, uint32_t parent,
+                               AcpiCacheOffset offset, uint32_t id);
 
 void build_smt_hierarchy(GArray *tbl, uint32_t parent, uint32_t id);
 
-- 
2.23.0


