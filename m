Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED666374D15
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 03:52:05 +0200 (CEST)
Received: from localhost ([::1]:39090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leTBN-0003ga-2P
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 21:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@linux.intel.com>)
 id 1leT1F-0003GE-Bi
 for qemu-devel@nongnu.org; Wed, 05 May 2021 21:41:37 -0400
Received: from mga17.intel.com ([192.55.52.151]:23088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@linux.intel.com>)
 id 1leT1D-0007vI-1y
 for qemu-devel@nongnu.org; Wed, 05 May 2021 21:41:37 -0400
IronPort-SDR: 026kKOQWrJrkK7MWDaPsUMQgFBK/smQndtbkedi82HJATSvKyt7Wwvb4gJwDIIXzfosOSjaNXd
 FuztyyvQwvtg==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="178579179"
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="178579179"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 18:41:32 -0700
IronPort-SDR: s0Mtm9jpzon4ZF3wCxKoFToTGOCQ6RIRtSBUqcpKrtr/mU2A7L82P41mTr/hrHoq80TpemUdvo
 +tzUJ0xhpL+A==
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="469220482"
Received: from yy-desk-7060.sh.intel.com ([10.239.159.38])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 18:41:29 -0700
From: Yuan Yao <yuan.yao@linux.intel.com>
To: pbonzini@redhat.com
Subject: [RFC][PATCH v1 10/10] Introduce new
 CPUClass::get_phys_page_attrs_debug implementation for encrypted guests
Date: Thu,  6 May 2021 09:40:37 +0800
Message-Id: <20210506014037.11982-11-yuan.yao@linux.intel.com>
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

Add new function x86_cpu_get_phys_page_attrs_encrypted_debug() to walking guset
page tables to do VA -> PA translation for encrypted guests.

Now install this to cc->get_phys_page_attrs_debug for INTEL TD guests only.

Signed-off-by: Yuan Yao <yuan.yao@intel.com>

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 7a8a1386fb..9ce81bb21c 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1807,6 +1807,8 @@ void x86_cpu_dump_state(CPUState *cs, FILE *f, int flags);
 
 hwaddr x86_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
                                          MemTxAttrs *attrs);
+hwaddr x86_cpu_get_phys_page_attrs_encrypted_debug(CPUState *cs, vaddr addr,
+                                                   MemTxAttrs *attrs);
 
 int x86_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int x86_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/i386/helper.c b/target/i386/helper.c
index 21edcb9204..a9a0467b50 100644
--- a/target/i386/helper.c
+++ b/target/i386/helper.c
@@ -205,8 +205,10 @@ void cpu_x86_update_cr4(CPUX86State *env, uint32_t new_cr4)
 }
 
 #if !defined(CONFIG_USER_ONLY)
-hwaddr x86_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
-                                         MemTxAttrs *attrs)
+static hwaddr x86_cpu_get_phys_page_attrs_debug_internal(CPUState *cs, vaddr addr,
+                                                         MemTxAttrs *attrs,
+                                                         uint64_t (*ldq_phys)(CPUState *, hwaddr),
+                                                         uint32_t (*ldl_phys)(CPUState *, hwaddr))
 {
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
@@ -242,7 +244,7 @@ hwaddr x86_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
             if (la57) {
                 pml5e_addr = ((env->cr[3] & ~0xfff) +
                         (((addr >> 48) & 0x1ff) << 3)) & a20_mask;
-                pml5e = x86_ldq_phys(cs, pml5e_addr);
+                pml5e = ldq_phys(cs, pml5e_addr);
                 if (!(pml5e & PG_PRESENT_MASK)) {
                     return -1;
                 }
@@ -252,13 +254,13 @@ hwaddr x86_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
 
             pml4e_addr = ((pml5e & PG_ADDRESS_MASK) +
                     (((addr >> 39) & 0x1ff) << 3)) & a20_mask;
-            pml4e = x86_ldq_phys(cs, pml4e_addr);
+            pml4e = ldq_phys(cs, pml4e_addr);
             if (!(pml4e & PG_PRESENT_MASK)) {
                 return -1;
             }
             pdpe_addr = ((pml4e & PG_ADDRESS_MASK) +
                          (((addr >> 30) & 0x1ff) << 3)) & a20_mask;
-            pdpe = x86_ldq_phys(cs, pdpe_addr);
+            pdpe = ldq_phys(cs, pdpe_addr);
             if (!(pdpe & PG_PRESENT_MASK)) {
                 return -1;
             }
@@ -273,14 +275,14 @@ hwaddr x86_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
         {
             pdpe_addr = ((env->cr[3] & ~0x1f) + ((addr >> 27) & 0x18)) &
                 a20_mask;
-            pdpe = x86_ldq_phys(cs, pdpe_addr);
+            pdpe = ldq_phys(cs, pdpe_addr);
             if (!(pdpe & PG_PRESENT_MASK))
                 return -1;
         }
 
         pde_addr = ((pdpe & PG_ADDRESS_MASK) +
                     (((addr >> 21) & 0x1ff) << 3)) & a20_mask;
-        pde = x86_ldq_phys(cs, pde_addr);
+        pde = ldq_phys(cs, pde_addr);
         if (!(pde & PG_PRESENT_MASK)) {
             return -1;
         }
@@ -293,7 +295,7 @@ hwaddr x86_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
             pte_addr = ((pde & PG_ADDRESS_MASK) +
                         (((addr >> 12) & 0x1ff) << 3)) & a20_mask;
             page_size = 4096;
-            pte = x86_ldq_phys(cs, pte_addr);
+            pte = ldq_phys(cs, pte_addr);
         }
         if (!(pte & PG_PRESENT_MASK)) {
             return -1;
@@ -303,7 +305,7 @@ hwaddr x86_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
 
         /* page directory entry */
         pde_addr = ((env->cr[3] & ~0xfff) + ((addr >> 20) & 0xffc)) & a20_mask;
-        pde = x86_ldl_phys(cs, pde_addr);
+        pde = ldl_phys(cs, pde_addr);
         if (!(pde & PG_PRESENT_MASK))
             return -1;
         if ((pde & PG_PSE_MASK) && (env->cr[4] & CR4_PSE_MASK)) {
@@ -312,7 +314,7 @@ hwaddr x86_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
         } else {
             /* page directory entry */
             pte_addr = ((pde & ~0xfff) + ((addr >> 10) & 0xffc)) & a20_mask;
-            pte = x86_ldl_phys(cs, pte_addr);
+            pte = ldl_phys(cs, pte_addr);
             if (!(pte & PG_PRESENT_MASK)) {
                 return -1;
             }
@@ -329,6 +331,22 @@ out:
     return pte | page_offset;
 }
 
+hwaddr x86_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
+                                         MemTxAttrs *attrs)
+{
+    return x86_cpu_get_phys_page_attrs_debug_internal(cs, addr, attrs,
+                                                      x86_ldq_phys,
+                                                      x86_ldl_phys);
+}
+
+hwaddr x86_cpu_get_phys_page_attrs_encrypted_debug(CPUState *cs, vaddr addr,
+                                                   MemTxAttrs *attrs)
+{
+    return x86_cpu_get_phys_page_attrs_debug_internal(cs, addr, attrs,
+                                                      x86_ldq_phys_debug,
+                                                      x86_ldl_phys_debug);
+}
+
 typedef struct MCEInjectionParams {
     Monitor *mon;
     int bank;
diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
index d13d4c8487..b1e089f73f 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -273,6 +273,7 @@ void tdx_pre_create_vcpu(CPUState *cpu)
 
     MachineState *ms = MACHINE(qdev_get_machine());
     X86CPU *x86cpu = X86_CPU(cpu);
+    CPUClass *cc = CPU_GET_CLASS(cpu);
     CPUX86State *env = &x86cpu->env;
     TdxGuest *tdx = (TdxGuest *)object_dynamic_cast(OBJECT(ms->cgs),
                                                     TYPE_TDX_GUEST);
@@ -320,6 +321,11 @@ void tdx_pre_create_vcpu(CPUState *cpu)
 
     init_vm.cpuid = (__u64)(&cpuid_data);
     tdx_ioctl(KVM_TDX_INIT_VM, 0, &init_vm);
+
+    if (tdx->debug) {
+        cc->get_phys_page_attrs_debug
+            = x86_cpu_get_phys_page_attrs_encrypted_debug;
+    }
 out:
     qemu_mutex_unlock(&tdx->lock);
 }
-- 
2.20.1


