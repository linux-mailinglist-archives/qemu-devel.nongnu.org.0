Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2BB47D67A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 19:23:03 +0100 (CET)
Received: from localhost ([::1]:42338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n06GU-000462-Vg
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 13:23:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <bounces+23648303-31c4-qemu-devel=nongnu.org@em7421.svin.in>)
 id 1n04p7-0005xa-5F
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 11:50:42 -0500
Received: from wrqvvpzp.outbound-mail.sendgrid.net ([149.72.131.227]:46874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <bounces+23648303-31c4-qemu-devel=nongnu.org@em7421.svin.in>)
 id 1n04p4-0002Oe-DQ
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 11:50:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svin.in;
 h=from:subject:in-reply-to:references:mime-version:
 content-transfer-encoding:to:cc:content-type;
 s=s1; bh=FXENmzTHnL4upknR6F3XzX7uQUkLg5eNw0RMOaRIRAA=;
 b=GMs6HrV5S+8iNzvgAzqx2v/Tj885cDBZAn85dohHv6t92Y+UXC81maYf6TUY3Zkz/92A
 xA+6EVJDGgrd12EL8aHxTtTylIxzAfMnMGETHd8xlaXHHMU8iFcNSYGGKkkgcqR2K6qizc
 PgcfMeAshmtm5vGk/NdlyeDJvNxerHTX4EbFgzr5W0K2FlAvbDcQHmCncd6jAwgZIvw9cu
 MYu5/DEROwWV/ca1rdIhXWY3dl7jxpkOSxX9JvJTCgNqiWgYyeHSmYILsMcUv3yCwwsOOb
 RdTdq+DyKUlbxbuV0AZv6Z2Af1ucj2NJSwLbnCmGi2MRAlk1KxmPcwuU5/m8CJXQ==
Received: by filterdrecv-75ff7b5ffb-vb7mv with SMTP id
 filterdrecv-75ff7b5ffb-vb7mv-1-61C3575C-2F
 2021-12-22 16:50:36.518409824 +0000 UTC m=+9657045.064782949
Received: from ne2.svin.in (unknown) by geopod-ismtpd-2-2 (SG) with ESMTP
 id 1KK0uW8XTfC3raOSsLL2VQ Wed, 22 Dec 2021 16:50:36.089 +0000 (UTC)
Received: from authenticated-user (ne2.svin.in [152.70.50.15])
 by ne2.svin.in (Postfix) with ESMTPA id 8E96817C09C;
 Wed, 22 Dec 2021 16:50:31 +0000 (UTC)
From: Oleg Vasilev <me@svin.in>
Subject: [RFC PATCH 2/2] accel/tcg: replace phys_pc with asid in TB htable key
Date: Wed, 22 Dec 2021 16:50:36 +0000 (UTC)
Message-Id: <20211222164947.634759-3-me@svin.in>
In-Reply-To: <20211222164947.634759-1-me@svin.in>
References: <20211222164947.634759-1-me@svin.in>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Authentication-Results: ne2.svin.in;
 auth=pass smtp.auth=admin@svin.in smtp.mailfrom=me@svin.in
X-Spamd-Bar: ++
X-SG-EID: =?us-ascii?Q?vuv4bBSMv+s+sLXfbA0TX5eOZYkSPfNDFag09+IwHa3cTVRX1snJTadgqJKv5P?=
 =?us-ascii?Q?2zsOSzU2SL4Idi94fk7Qu=2FBKR92Js4oexFOBWkW?=
 =?us-ascii?Q?y=2Fa2rfHh8pDzUzeiVJNSGuSPrDfURvm4FLQP4gx?=
 =?us-ascii?Q?8pLcBKmNcOWM+QSvlFe36MOtr6nyQwpSpCr7ZEY?=
 =?us-ascii?Q?Fg4y6mD7f=2FlBpk9RUL2MdbL3sGU5VHgUKKBuPPf?=
 =?us-ascii?Q?1POQFEL1DFxYXfJJtrHL8Mmaut4JZCoIVEmDbD?=
To: qemu-devel@nongnu.org
Cc: Oleg Vasilev <vasilev.oleg@huawei.com>, Alex =?iso-8859-1?q?Benn=E9e?=
 <alex.bennee@linaro.org>, qemu-arm@nongnu.org, Oleg Vasilev <me@svin.in>,
 Richard Henderson <richard.henderson@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?q?Mathieu-Daud=E9?= <philmd@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>
X-Entity-ID: R60PFX0ZT2z0LR3J/oF4GQ==
Content-Type: text/plain; charset=us-ascii
Received-SPF: pass client-ip=149.72.131.227;
 envelope-from=bounces+23648303-31c4-qemu-devel=nongnu.org@em7421.svin.in;
 helo=wrqvvpzp.outbound-mail.sendgrid.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 22 Dec 2021 13:16:15 -0500
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Oleg Vasilev <vasilev.oleg@huawei.com>

Using a physical pc requires to translate address every time next block
needs to be found and executed. This also contaminates TLB with code-related
records.

Instead, I suggest we introduce an architecture-specific address space
identifier, and use it to distinguish between different AS's
translation blocks.

CC: qemu-arm@nongnu.org
Signed-off-by: Oleg Vasilev <vasilev.oleg@huawei.com>
Signed-off-by: Oleg Vasilev <me@svin.in>
---
 accel/tcg/cpu-exec.c             | 38 ++++++++------------------------
 accel/tcg/tb-hash.h              |  4 ++--
 accel/tcg/translate-all.c        |  7 +++---
 hw/core/cpu-sysemu.c             |  6 +++++
 include/exec/exec-all.h          |  1 +
 include/hw/core/cpu.h            |  8 +++++++
 include/hw/core/sysemu-cpu-ops.h |  6 +++++
 target/arm/cpu.c                 | 13 +++++++++++
 8 files changed, 48 insertions(+), 35 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 409ec8c38c..01b0e67d9c 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -490,7 +490,7 @@ struct tb_desc {
     target_ulong pc;
     target_ulong cs_base;
     CPUArchState *env;
-    tb_page_addr_t phys_page1;
+    uint64_t asid;
     uint32_t flags;
     uint32_t cflags;
     uint32_t trace_vcpu_dstate;
@@ -501,34 +501,18 @@ static bool tb_lookup_cmp(const void *p, const void *d)
     const TranslationBlock *tb = p;
     const struct tb_desc *desc = d;
 
-    if (tb->pc == desc->pc &&
-        tb->page_addr[0] == desc->phys_page1 &&
-        tb->cs_base == desc->cs_base &&
-        tb->flags == desc->flags &&
-        tb->trace_vcpu_dstate == desc->trace_vcpu_dstate &&
-        tb_cflags(tb) == desc->cflags) {
-        /* check next page if needed */
-        if (tb->page_addr[1] == -1) {
-            return true;
-        } else {
-            tb_page_addr_t phys_page2;
-            target_ulong virt_page2;
-
-            virt_page2 = (desc->pc & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
-            phys_page2 = get_page_addr_code(desc->env, virt_page2);
-            if (tb->page_addr[1] == phys_page2) {
-                return true;
-            }
-        }
-    }
-    return false;
+    return (tb->pc == desc->pc &&
+            tb->asid == desc->asid &&
+            tb->cs_base == desc->cs_base &&
+            tb->flags == desc->flags &&
+            tb->trace_vcpu_dstate == desc->trace_vcpu_dstate &&
+            tb_cflags(tb) == desc->cflags);
 }
 
 TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
                                    target_ulong cs_base, uint32_t flags,
                                    uint32_t cflags)
 {
-    tb_page_addr_t phys_pc;
     struct tb_desc desc;
     uint32_t h;
 
@@ -538,12 +522,8 @@ TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
     desc.cflags = cflags;
     desc.trace_vcpu_dstate = *cpu->trace_dstate;
     desc.pc = pc;
-    phys_pc = get_page_addr_code(desc.env, pc);
-    if (phys_pc == -1) {
-        return NULL;
-    }
-    desc.phys_page1 = phys_pc & TARGET_PAGE_MASK;
-    h = tb_hash_func(phys_pc, pc, flags, cflags, *cpu->trace_dstate);
+    desc.asid = cpu_get_asid(cpu);
+    h = tb_hash_func(desc.asid, pc, flags, cflags, *cpu->trace_dstate);
     return qht_lookup_custom(&tb_ctx.htable, &desc, h, tb_lookup_cmp);
 }
 
diff --git a/accel/tcg/tb-hash.h b/accel/tcg/tb-hash.h
index 0a273d9605..b5c6f87711 100644
--- a/accel/tcg/tb-hash.h
+++ b/accel/tcg/tb-hash.h
@@ -60,10 +60,10 @@ static inline unsigned int tb_jmp_cache_hash_func(target_ulong pc)
 #endif /* CONFIG_SOFTMMU */
 
 static inline
-uint32_t tb_hash_func(tb_page_addr_t phys_pc, target_ulong pc, uint32_t flags,
+uint32_t tb_hash_func(uint64_t asid, target_ulong pc, uint32_t flags,
                       uint32_t cf_mask, uint32_t trace_vcpu_dstate)
 {
-    return qemu_xxhash7(phys_pc, pc, flags, cf_mask, trace_vcpu_dstate);
+    return qemu_xxhash7(asid, pc, flags, cf_mask, trace_vcpu_dstate);
 }
 
 #endif
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index bd71db59a9..8565691bfd 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1174,7 +1174,6 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
     CPUState *cpu;
     PageDesc *p;
     uint32_t h;
-    tb_page_addr_t phys_pc;
     uint32_t orig_cflags = tb_cflags(tb);
 
     assert_memory_lock();
@@ -1185,8 +1184,7 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
     qemu_spin_unlock(&tb->jmp_lock);
 
     /* remove the TB from the hash list */
-    phys_pc = tb->page_addr[0] + (tb->pc & ~TARGET_PAGE_MASK);
-    h = tb_hash_func(phys_pc, tb->pc, tb->flags, orig_cflags,
+    h = tb_hash_func(tb->asid, tb->pc, tb->flags, orig_cflags,
                      tb->trace_vcpu_dstate);
     if (!qht_remove(&tb_ctx.htable, tb, h)) {
         return;
@@ -1349,7 +1347,7 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
     }
 
     /* add in the hash table */
-    h = tb_hash_func(phys_pc, tb->pc, tb->flags, tb->cflags,
+    h = tb_hash_func(tb->asid, tb->pc, tb->flags, tb->cflags,
                      tb->trace_vcpu_dstate);
     qht_insert(&tb_ctx.htable, tb, h, &existing_tb);
 
@@ -1427,6 +1425,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     tb->flags = flags;
     tb->cflags = cflags;
     tb->trace_vcpu_dstate = *cpu->trace_dstate;
+    tb->asid = cpu_get_asid(cpu);
     tcg_ctx->tb_cflags = cflags;
  tb_overflow:
 
diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index 00253f8929..915874ea7b 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -79,6 +79,12 @@ int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
     return ret;
 }
 
+uint64_t cpu_get_asid(CPUState *cpu) {
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    return cc->sysemu_ops->get_asid(cpu);
+}
+
 int cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
                              void *opaque)
 {
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 35d8e93976..5554ab133d 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -560,6 +560,7 @@ struct TranslationBlock {
     uintptr_t jmp_list_head;
     uintptr_t jmp_list_next[2];
     uintptr_t jmp_dest[2];
+    uint64_t asid;
 };
 
 /* Hide the qatomic_read to make code a little easier on the eyes */
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index e948e81f1a..c935160153 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -579,6 +579,14 @@ hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
  */
 int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs);
 
+
+/** cpu_get_asid:
+ * @cpu: CPU
+ *
+ * Returns the identifier for a current address space.
+ */
+uint64_t cpu_get_asid(CPUState *cpu);
+
 /**
  * cpu_virtio_is_big_endian:
  * @cpu: CPU
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index a9ba39e5f2..919f941265 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -43,6 +43,12 @@ typedef struct SysemuCPUOps {
      *       a memory access with the specified memory transaction attributes.
      */
     int (*asidx_from_attrs)(CPUState *cpu, MemTxAttrs attrs);
+
+    /**
+     * @get_asid: Callback to return the identifier for a current address space.
+     */
+    uint64_t (*get_asid)(CPUState *cpu);
+
     /**
      * @get_crash_info: Callback for reporting guest crash information in
      * GUEST_PANICKED events.
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a211804fd3..aa5440d960 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2017,9 +2017,22 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
 #ifndef CONFIG_USER_ONLY
 #include "hw/core/sysemu-cpu-ops.h"
 
+/* Returns the identifier for a current address space. */
+static uint64_t arm_get_asid(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
+    uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
+
+#define TCR_A1     (1U << 22)
+    return regime_ttbr(env, mmu_idx, (tcr&TCR_A1)>0);
+}
+
 static const struct SysemuCPUOps arm_sysemu_ops = {
     .get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug,
     .asidx_from_attrs = arm_asidx_from_attrs,
+    .get_asid = arm_get_asid,
     .write_elf32_note = arm_cpu_write_elf32_note,
     .write_elf64_note = arm_cpu_write_elf64_note,
     .virtio_is_big_endian = arm_cpu_virtio_is_big_endian,
-- 
2.33.1


