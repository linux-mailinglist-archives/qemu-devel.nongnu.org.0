Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC1333F8D7
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 20:12:10 +0100 (CET)
Received: from localhost ([::1]:43442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMbaS-00052A-SP
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 15:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMax9-0004WU-Pf
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 14:31:31 -0400
Received: from mx2.suse.de ([195.135.220.15]:48710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMawo-0007sT-Vk
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 14:31:31 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B8EF9AF0C;
 Wed, 17 Mar 2021 18:30:36 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v9 46/50] target/arm: arch_dump: restrict ELFCLASS64 to AArch64
Date: Wed, 17 Mar 2021 19:30:09 +0100
Message-Id: <20210317183013.25772-47-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210317183013.25772-1-cfontana@suse.de>
References: <20210317183013.25772-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

this will allow us to restrict more code to TARGET_AARCH64

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/helper-a64.h |  2 ++
 target/arm/helper.h     |  1 -
 target/arm/arch_dump.c  | 12 +++++++-----
 target/arm/cpu.c        |  1 -
 target/arm/cpu64.c      |  4 ++++
 target/arm/tcg/helper.c | 13 +++++++++++--
 6 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index c139fa81f9..342f55d577 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -119,3 +119,5 @@ DEF_HELPER_FLAGS_2(st2g_stub, TCG_CALL_NO_WG, void, env, i64)
 DEF_HELPER_FLAGS_2(ldgm, TCG_CALL_NO_WG, i64, env, i64)
 DEF_HELPER_FLAGS_3(stgm, TCG_CALL_NO_WG, void, env, i64, i64)
 DEF_HELPER_FLAGS_3(stzgm_tags, TCG_CALL_NO_WG, void, env, i64, i64)
+
+DEF_HELPER_FLAGS_2(rebuild_hflags_a64, TCG_CALL_NO_RWG, void, env, int)
diff --git a/target/arm/helper.h b/target/arm/helper.h
index ff8148ddc6..37dd9797a1 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -94,7 +94,6 @@ DEF_HELPER_FLAGS_1(rebuild_hflags_m32_newel, TCG_CALL_NO_RWG, void, env)
 DEF_HELPER_FLAGS_2(rebuild_hflags_m32, TCG_CALL_NO_RWG, void, env, int)
 DEF_HELPER_FLAGS_1(rebuild_hflags_a32_newel, TCG_CALL_NO_RWG, void, env)
 DEF_HELPER_FLAGS_2(rebuild_hflags_a32, TCG_CALL_NO_RWG, void, env, int)
-DEF_HELPER_FLAGS_2(rebuild_hflags_a64, TCG_CALL_NO_RWG, void, env, int)
 
 DEF_HELPER_FLAGS_5(probe_access, TCG_CALL_NO_WG, void, env, tl, i32, i32, i32)
 
diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
index 0184845310..9d1a7dae56 100644
--- a/target/arm/arch_dump.c
+++ b/target/arm/arch_dump.c
@@ -23,6 +23,8 @@
 #include "elf.h"
 #include "sysemu/dump.h"
 
+#ifdef TARGET_AARCH64
+
 /* struct user_pt_regs from arch/arm64/include/uapi/asm/ptrace.h */
 struct aarch64_user_regs {
     uint64_t regs[31];
@@ -141,7 +143,6 @@ static int aarch64_write_elf64_prfpreg(WriteCoreDumpFunction f,
     return 0;
 }
 
-#ifdef TARGET_AARCH64
 static off_t sve_zreg_offset(uint32_t vq, int n)
 {
     off_t off = sizeof(struct aarch64_user_sve_header);
@@ -229,7 +230,6 @@ static int aarch64_write_elf64_sve(WriteCoreDumpFunction f,
 
     return 0;
 }
-#endif
 
 int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
                              int cpuid, void *opaque)
@@ -272,15 +272,15 @@ int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
         return ret;
     }
 
-#ifdef TARGET_AARCH64
     if (cpu_isar_feature(aa64_sve, cpu)) {
         ret = aarch64_write_elf64_sve(f, env, cpuid, s);
     }
-#endif
 
     return ret;
 }
 
+#endif /* TARGET_AARCH64 */
+
 /* struct pt_regs from arch/arm/include/asm/ptrace.h */
 struct arm_user_regs {
     uint32_t regs[17];
@@ -449,12 +449,14 @@ ssize_t cpu_get_note_size(int class, int machine, int nr_cpus)
     size_t note_size;
 
     if (class == ELFCLASS64) {
+#ifdef TARGET_AARCH64
         note_size = AARCH64_PRSTATUS_NOTE_SIZE;
         note_size += AARCH64_PRFPREG_NOTE_SIZE;
-#ifdef TARGET_AARCH64
         if (cpu_isar_feature(aa64_sve, cpu)) {
             note_size += AARCH64_SVE_NOTE_SIZE(&cpu->env);
         }
+#else
+        g_assert(0);
 #endif
     } else {
         note_size = ARM_PRSTATUS_NOTE_SIZE;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index c5a4917035..6cf688d772 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1402,7 +1402,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->asidx_from_attrs = arm_asidx_from_attrs;
     cc->vmsd = &vmstate_arm_cpu;
     cc->virtio_is_big_endian = arm_cpu_virtio_is_big_endian;
-    cc->write_elf64_note = arm_cpu_write_elf64_note;
     cc->write_elf32_note = arm_cpu_write_elf32_note;
 #endif
 
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 971a4474b9..b0026e7ae9 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -623,6 +623,10 @@ static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_arch_name = aarch64_gdb_arch_name;
     cc->dump_state = aarch64_cpu_dump_state;
 
+#ifndef CONFIG_USER_ONLY
+    cc->write_elf64_note = arm_cpu_write_elf64_note;
+#endif /* !CONFIG_USER_ONLY */
+
     object_class_property_add_bool(oc, "aarch64", aarch64_cpu_get_aarch64,
                                    aarch64_cpu_set_aarch64);
     object_class_property_set_description(oc, "aarch64",
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index 548c94e057..05a8563cea 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -18,6 +18,9 @@
 #include "cpregs.h"
 #include "tcg-cpu.h"
 
+uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
+                            ARMMMUIdx mmu_idx);
+
 static int vfp_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -1152,8 +1155,10 @@ static uint32_t rebuild_hflags_a32(CPUARMState *env, int fp_el,
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
-static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
-                                   ARMMMUIdx mmu_idx)
+#ifdef TARGET_AARCH64
+
+uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
+                            ARMMMUIdx mmu_idx)
 {
     uint32_t flags = rebuild_hflags_aprofile(env);
     ARMMMUIdx stage1 = stage_1_mmu_idx(mmu_idx);
@@ -1272,6 +1277,8 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
     return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
 }
 
+#endif /* TARGET_AARCH64 */
+
 static uint32_t rebuild_hflags_internal(CPUARMState *env)
 {
     int el = arm_current_el(env);
@@ -1332,6 +1339,7 @@ void HELPER(rebuild_hflags_a32)(CPUARMState *env, int el)
     env->hflags = rebuild_hflags_a32(env, fp_el, mmu_idx);
 }
 
+#ifdef TARGET_AARCH64
 void HELPER(rebuild_hflags_a64)(CPUARMState *env, int el)
 {
     int fp_el = fp_exception_el(env, el);
@@ -1339,6 +1347,7 @@ void HELPER(rebuild_hflags_a64)(CPUARMState *env, int el)
 
     env->hflags = rebuild_hflags_a64(env, el, fp_el, mmu_idx);
 }
+#endif /* TARGET_AARCH64 */
 
 static inline void assert_hflags_rebuild_correctly(CPUARMState *env)
 {
-- 
2.26.2


