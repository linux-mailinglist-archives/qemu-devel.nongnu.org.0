Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA11374D0C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 03:49:26 +0200 (CEST)
Received: from localhost ([::1]:35940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leT8n-0002Ii-6z
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 21:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@linux.intel.com>)
 id 1leT17-00030X-L2
 for qemu-devel@nongnu.org; Wed, 05 May 2021 21:41:30 -0400
Received: from mga17.intel.com ([192.55.52.151]:23057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@linux.intel.com>)
 id 1leT14-0007bf-Ad
 for qemu-devel@nongnu.org; Wed, 05 May 2021 21:41:29 -0400
IronPort-SDR: O919ObSvpDXeM612eme98i/foJSoLH70ruwaVpKWkVTUPMvoJ7A8FucEgvXkBz/3vYf9Y2NTHg
 oHmBNJYRyPVQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="178579164"
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="178579164"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 18:41:25 -0700
IronPort-SDR: NnjfrUoogJTAGWJu7U7kjySmrhJEElxTwLgCJjvDd8StIz+SRywXHL0URqBrXiySjym7YEz1gd
 d+WGAWivPPdw==
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="469220450"
Received: from yy-desk-7060.sh.intel.com ([10.239.159.38])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 18:41:22 -0700
From: Yuan Yao <yuan.yao@linux.intel.com>
To: pbonzini@redhat.com
Subject: [RFC][PATCH v1 08/10] Introduce debug version of physical memory
 read/write API
Date: Thu,  6 May 2021 09:40:35 +0800
Message-Id: <20210506014037.11982-9-yuan.yao@linux.intel.com>
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

From: Yuan Yao <yuan.yao@intel.com>

Add below APIs for reading/writing the physical memory, subsequent
patch will use them in monitor commands and gdbstub to support
encrypted guest debugging.

uint32_t x86_ldl_phys_debug(CPUState *cs, hwaddr addr);
uint64_t x86_ldq_phys_debug(CPUState *cs, hwaddr addr);
void cpu_physical_memory_rw_debug(hwaddr addr, void *buf,
                                  hwaddr len, bool is_write);
void cpu_physical_memory_read_debug(hwaddr addr,
                                    void *buf,
                                    hwaddr len);
void cpu_physical_memory_write_debug(hwaddr addr,
                                     const void *buf,
                                     hwaddr len);

Signed-off-by: Yuan Yao <yuan.yao@intel.com>

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 5a0a2d93e0..f77a9ecb60 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -69,6 +69,8 @@ size_t qemu_ram_pagesize_largest(void);
 
 void cpu_physical_memory_rw(hwaddr addr, void *buf,
                             hwaddr len, bool is_write);
+void cpu_physical_memory_rw_debug(hwaddr addr, void *buf,
+                                  hwaddr len, bool is_write);
 static inline void cpu_physical_memory_read(hwaddr addr,
                                             void *buf, hwaddr len)
 {
@@ -79,6 +81,18 @@ static inline void cpu_physical_memory_write(hwaddr addr,
 {
     cpu_physical_memory_rw(addr, (void *)buf, len, true);
 }
+
+static inline void cpu_physical_memory_read_debug(hwaddr addr,
+                                                  void *buf, hwaddr len)
+{
+    cpu_physical_memory_rw_debug(addr, buf, len, false);
+}
+static inline void cpu_physical_memory_write_debug(hwaddr addr,
+                                                   const void *buf, hwaddr len)
+{
+    cpu_physical_memory_rw_debug(addr, (void *)buf, len, true);
+}
+
 void *cpu_physical_memory_map(hwaddr addr,
                               hwaddr *plen,
                               bool is_write);
diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index c8b56389d6..6d223ea196 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -60,6 +60,9 @@ typedef struct MemTxAttrs {
  */
 #define MEMTXATTRS_UNSPECIFIED ((MemTxAttrs) { .unspecified = 1 })
 
+// Same as MEMTXATTRS_UNSPECIFIED but enable debug
+#define MEMTXATTRS_UNSPECIFIED_DEBUG ((MemTxAttrs) { .unspecified = 1, .debug = 1 })
+
 /* New-style MMIO accessors can indicate that the transaction failed.
  * A zero (MEMTX_OK) response means success; anything else is a failure
  * of some kind. The memory subsystem will bitwise-OR together results
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 0fde02d325..ff6e215a3a 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2910,6 +2910,19 @@ void cpu_physical_memory_rw(hwaddr addr, void *buf,
                      buf, len, is_write);
 }
 
+void cpu_physical_memory_rw_debug(hwaddr addr, void *buf,
+                            hwaddr len, bool is_write)
+{
+    if (is_write)
+        physical_memory_debug_ops->write(&address_space_memory,
+                                         addr, MEMTXATTRS_UNSPECIFIED_DEBUG,
+                                         buf, len);
+    else
+        physical_memory_debug_ops->read(&address_space_memory,
+                                        addr, MEMTXATTRS_UNSPECIFIED_DEBUG,
+                                        buf, len);
+}
+
 enum write_rom_type {
     WRITE_DATA,
     FLUSH_CACHE,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index e5dbe84d3a..7a8a1386fb 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1960,6 +1960,8 @@ void x86_stl_phys_notdirty(CPUState *cs, hwaddr addr, uint32_t val);
 void x86_stw_phys(CPUState *cs, hwaddr addr, uint32_t val);
 void x86_stl_phys(CPUState *cs, hwaddr addr, uint32_t val);
 void x86_stq_phys(CPUState *cs, hwaddr addr, uint64_t val);
+uint32_t x86_ldl_phys_debug(CPUState *cs, hwaddr addr);
+uint64_t x86_ldq_phys_debug(CPUState *cs, hwaddr addr);
 #endif
 
 /* will be suppressed */
diff --git a/target/i386/helper.c b/target/i386/helper.c
index 618ad1c409..21edcb9204 100644
--- a/target/i386/helper.c
+++ b/target/i386/helper.c
@@ -663,4 +663,30 @@ void x86_stq_phys(CPUState *cs, hwaddr addr, uint64_t val)
 
     address_space_stq(as, addr, val, attrs, NULL);
 }
+
+uint32_t x86_ldl_phys_debug(CPUState *cs, hwaddr addr)
+{
+    uint32_t ret;
+    MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED_DEBUG;
+    int as_id = cpu_asidx_from_attrs(cs, attrs);
+    struct AddressSpace *as = cpu_get_address_space(cs, as_id);
+
+    physical_memory_debug_ops->read(as, addr, attrs,
+                                    &ret, sizeof(ret));
+
+    return tswap32(ret);
+}
+
+uint64_t x86_ldq_phys_debug(CPUState *cs, hwaddr addr)
+{
+    uint64_t ret;
+    MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED_DEBUG;
+    int as_id = cpu_asidx_from_attrs(cs, attrs);
+    struct AddressSpace *as = cpu_get_address_space(cs, as_id);
+
+    physical_memory_debug_ops->read(as, addr, attrs,
+                                    &ret, sizeof(ret));
+
+    return tswap64(ret);
+}
 #endif
-- 
2.20.1


