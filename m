Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8DA374CF9
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 03:43:24 +0200 (CEST)
Received: from localhost ([::1]:48804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leT2x-0004QW-JY
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 21:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@linux.intel.com>)
 id 1leT0z-0002oV-Qt
 for qemu-devel@nongnu.org; Wed, 05 May 2021 21:41:21 -0400
Received: from mga17.intel.com ([192.55.52.151]:23057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@linux.intel.com>)
 id 1leT0x-0007bf-TZ
 for qemu-devel@nongnu.org; Wed, 05 May 2021 21:41:21 -0400
IronPort-SDR: y/qu3Npheo07ldBzuBwPh76ssPPjuZ3B4dzzb8EzZN3UYsQGz7/rcWP+JS+PNavn9yYF8bKqPl
 gAisC7CQ5EGQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="178579154"
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="178579154"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 18:41:19 -0700
IronPort-SDR: 8GT797jRE+K50ygb3hvoSuOakNu3PTiA1JIToz/G3hVFiDuXm40UqGyFcUYM/Oyp7CP/3hsAZ2
 mf4MBJwknD1w==
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="469220401"
Received: from yy-desk-7060.sh.intel.com ([10.239.159.38])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 18:41:15 -0700
From: Yuan Yao <yuan.yao@linux.intel.com>
To: pbonzini@redhat.com
Subject: [RFC][PATCH v1 06/10] Introduce new MemoryDebugOps which hook into
 guest virtual and physical memory debug interfaces such as
 cpu_memory_rw_debug,
 to allow vendor specific assist/hooks for debugging and delegating accessing
 the guest memory. This is required for example in case of AMD SEV platform
 where the guest memory is encrypted and a SEV specific debug assist/hook will
 be required to access the guest memory.
Date: Thu,  6 May 2021 09:40:33 +0800
Message-Id: <20210506014037.11982-7-yuan.yao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210506014037.11982-1-yuan.yao@linux.intel.com>
References: <20210506014037.11982-1-yuan.yao@linux.intel.com>
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=yuan.yao@linux.intel.com; helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: isaku.yamahata@intel.com, Thomas.Lendacky@amd.com, ashish.kalra@amd.com,
 brijesh.singh@amd.com, ehabkost@redhat.com, kvm@vger.kernel.org,
 mst@redhat.com, mtosatti@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 yuan.yao@intel.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ashish Kalra <ashish.kalra@amd.com>

The MemoryDebugOps are used by cpu_memory_rw_debug() and default to
address_space_read and address_space_write_rom.

Yuan Yao: Exports the physical_memory_debug_ops variable for functions
in target/i386/helper.c

Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
Signed-off-by: Yuan Yao <yuan.yao@intel.com>

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 7e6fdcb8e4..0250b50beb 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2498,6 +2498,20 @@ MemTxResult address_space_write_cached_slow(MemoryRegionCache *cache,
                                             hwaddr addr, const void *buf,
                                             hwaddr len);
 
+typedef struct MemoryDebugOps {
+    MemTxResult (*read)(AddressSpace *as, hwaddr phys_addr,
+                        MemTxAttrs attrs, void *buf,
+                        hwaddr len);
+    MemTxResult (*write)(AddressSpace *as, hwaddr phys_addr,
+                         MemTxAttrs attrs, const void *buf,
+                         hwaddr len);
+} MemoryDebugOps;
+
+// Export for functions in target/i386/helper.c
+extern const MemoryDebugOps *physical_memory_debug_ops;
+
+void address_space_set_debug_ops(const MemoryDebugOps *ops);
+
 static inline bool memory_access_is_direct(MemoryRegion *mr, bool is_write)
 {
     if (is_write) {
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 85034d9c11..c8029f69ad 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -171,6 +171,18 @@ struct DirtyBitmapSnapshot {
     unsigned long dirty[];
 };
 
+static const MemoryDebugOps default_debug_ops = {
+    .read = address_space_read,
+    .write = address_space_write_rom
+};
+
+const MemoryDebugOps *physical_memory_debug_ops = &default_debug_ops;
+
+void address_space_set_debug_ops(const MemoryDebugOps *ops)
+{
+    physical_memory_debug_ops = ops;
+}
+
 static void phys_map_node_reserve(PhysPageMap *map, unsigned nodes)
 {
     static unsigned alloc_hint = 16;
@@ -3396,6 +3408,10 @@ int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
         page = addr & TARGET_PAGE_MASK;
         phys_addr = cpu_get_phys_page_attrs_debug(cpu, page, &attrs);
         asidx = cpu_asidx_from_attrs(cpu, attrs);
+
+        /* set debug attrs to indicate memory access is from the debugger */
+        attrs.debug = 1;
+
         /* if no physical page mapped, return an error */
         if (phys_addr == -1)
             return -1;
@@ -3404,11 +3420,13 @@ int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
             l = len;
         phys_addr += (addr & ~TARGET_PAGE_MASK);
         if (is_write) {
-            res = address_space_write_rom(cpu->cpu_ases[asidx].as, phys_addr,
-                                          attrs, buf, l);
+            res = physical_memory_debug_ops->write(cpu->cpu_ases[asidx].as,
+                                                   phys_addr,
+                                                   attrs, buf, l);
         } else {
-            res = address_space_read(cpu->cpu_ases[asidx].as, phys_addr,
-                                     attrs, buf, l);
+            res = physical_memory_debug_ops->read(cpu->cpu_ases[asidx].as,
+                                                  phys_addr,
+                                                  attrs, buf, l);
         }
         if (res != MEMTX_OK) {
             return -1;
-- 
2.20.1


