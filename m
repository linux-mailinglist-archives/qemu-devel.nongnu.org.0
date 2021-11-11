Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE0444D856
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:32:57 +0100 (CET)
Received: from localhost ([::1]:57690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlB8K-0005Ym-Fn
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:32:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mlAt0-0003nC-9v
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:17:06 -0500
Received: from mga17.intel.com ([192.55.52.151]:19320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mlAsx-0006q9-2C
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:17:06 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="213642500"
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="213642500"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 06:17:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="492556270"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga007.jf.intel.com with ESMTP; 11 Nov 2021 06:16:50 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [RFC PATCH 12/13] kvm: handle private to shared memory conversion
Date: Thu, 11 Nov 2021 22:13:51 +0800
Message-Id: <20211111141352.26311-13-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211111141352.26311-1-chao.p.peng@linux.intel.com>
References: <20211111141352.26311-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 david@redhat.com, "J . Bruce Fields" <bfields@fieldses.org>,
 dave.hansen@intel.com, "H . Peter Anvin" <hpa@zytor.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 Sean Christopherson <seanjc@google.com>, susie.li@intel.com,
 Jeff Layton <jlayton@kernel.org>, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 accel/kvm/kvm-all.c    | 49 ++++++++++++++++++++++++++++++++++++++++++
 include/sysemu/kvm.h   |  1 +
 target/arm/kvm.c       |  5 +++++
 target/i386/kvm/kvm.c  | 27 +++++++++++++++++++++++
 target/mips/kvm.c      |  5 +++++
 target/ppc/kvm.c       |  5 +++++
 target/s390x/kvm/kvm.c |  5 +++++
 7 files changed, 97 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index d336458e9e..6feda9c89b 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1445,6 +1445,38 @@ out:
     kvm_slots_unlock();
 }
 
+static int kvm_map_private_memory(hwaddr start, hwaddr size)
+{
+    return 0;
+}
+
+static int kvm_map_shared_memory(hwaddr start, hwaddr size)
+{
+    MemoryRegionSection section;
+    void *addr;
+    RAMBlock *rb;
+    ram_addr_t offset;
+
+    /* Punch a hole in private memory. */
+    section = memory_region_find(get_system_private_memory(), start, size);
+    if (section.mr) {
+        addr = memory_region_get_ram_ptr(section.mr) +
+               section.offset_within_region;
+        rb = qemu_ram_block_from_host(addr, false, &offset);
+        ram_block_discard_range(rb, offset, size);
+        memory_region_unref(section.mr);
+    }
+
+    /* Create new shared memory. */
+    section = memory_region_find(get_system_memory(), start, size);
+    if (section.mr) {
+        memory_region_unref(section.mr);
+        return -1; /*Already existed. */
+    }
+
+    return kvm_arch_map_shared_memory(start, size);
+}
+
 static void *kvm_dirty_ring_reaper_thread(void *data)
 {
     KVMState *s = data;
@@ -2957,6 +2989,23 @@ int kvm_cpu_exec(CPUState *cpu)
                 break;
             }
             break;
+	case KVM_EXIT_MEMORY_ERROR:
+            switch (run->mem.type) {
+            case KVM_EXIT_MEM_MAP_PRIVATE:
+                ret = kvm_map_private_memory(run->mem.u.map.gpa,
+                                             run->mem.u.map.size);
+                break;
+            case KVM_EXIT_MEM_MAP_SHARE:
+                ret = kvm_map_shared_memory(run->mem.u.map.gpa,
+                                            run->mem.u.map.size);
+                break;
+            default:
+                DPRINTF("kvm_arch_handle_exit\n");
+                ret = kvm_arch_handle_exit(cpu, run);
+                break;
+            }
+            break;
+
         default:
             DPRINTF("kvm_arch_handle_exit\n");
             ret = kvm_arch_handle_exit(cpu, run);
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index a1ab1ee12d..5f00aa0ee0 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -547,4 +547,5 @@ bool kvm_cpu_check_are_resettable(void);
 
 bool kvm_arch_cpu_check_are_resettable(void);
 
+int kvm_arch_map_shared_memory(hwaddr start, hwaddr size);
 #endif
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 5d55de1a49..97e51b8b88 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1051,3 +1051,8 @@ bool kvm_arch_cpu_check_are_resettable(void)
 {
     return true;
 }
+
+int kvm_arch_map_shared_memory(hwaddr start, hwaddr size)
+{
+    return 0;
+}
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 500d2e0e68..b3209402bc 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -4925,3 +4925,30 @@ bool kvm_arch_cpu_check_are_resettable(void)
 {
     return !sev_es_enabled();
 }
+
+int kvm_arch_map_shared_memory(hwaddr start, hwaddr size)
+{
+    MachineState *pcms = current_machine;
+    X86MachineState *x86ms = X86_MACHINE(pcms);
+    MemoryRegion *system_memory = get_system_memory();
+    MemoryRegion *region;
+    char name[134];
+    hwaddr offset;
+
+    if (start + size < x86ms->below_4g_mem_size) {
+       sprintf(name, "0x%lx@0x%lx", size, start);
+       region = g_malloc(sizeof(*region));
+       memory_region_init_alias(region, NULL, name, pcms->ram, start, size);
+       memory_region_add_subregion(system_memory, start, region);
+       return 0;
+    } else if (start > 0x100000000ULL){
+       sprintf(name, "0x%lx@0x%lx", size, start);
+       offset = start - 0x100000000ULL + x86ms->below_4g_mem_size;
+       region = g_malloc(sizeof(*region));
+       memory_region_init_alias(region, NULL, name, pcms->ram, offset, size);
+       memory_region_add_subregion(system_memory, start, region);
+       return 0;
+    }
+
+    return -1;
+}
diff --git a/target/mips/kvm.c b/target/mips/kvm.c
index 086debd9f0..4aed54aa9f 100644
--- a/target/mips/kvm.c
+++ b/target/mips/kvm.c
@@ -1295,3 +1295,8 @@ bool kvm_arch_cpu_check_are_resettable(void)
 {
     return true;
 }
+
+int kvm_arch_map_shared_memory(hwaddr start, hwaddr size)
+{
+    return 0;
+}
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index dc93b99189..cc31a7c38d 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -2959,3 +2959,8 @@ bool kvm_arch_cpu_check_are_resettable(void)
 {
     return true;
 }
+
+int kvm_arch_map_shared_memory(hwaddr start, hwaddr size)
+{
+    return 0;
+}
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 5b1fdb55c4..4a9161ba3a 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -2562,3 +2562,8 @@ bool kvm_arch_cpu_check_are_resettable(void)
 {
     return true;
 }
+
+int kvm_arch_map_shared_memory(hwaddr start, hwaddr size)
+{
+    return 0;
+}
-- 
2.17.1


