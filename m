Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B06933F90E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 20:23:05 +0100 (CET)
Received: from localhost ([::1]:39610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMbl2-00070W-8L
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 15:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMax7-0004UP-Se
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 14:31:29 -0400
Received: from mx2.suse.de ([195.135.220.15]:48712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMawp-0007si-Vu
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 14:31:29 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A3638AF24;
 Wed, 17 Mar 2021 18:30:37 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v9 48/50] target/arm: tcg: restrict ZCR cpregs to TARGET_AARCH64
Date: Wed, 17 Mar 2021 19:30:11 +0100
Message-Id: <20210317183013.25772-49-cfontana@suse.de>
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

restrict zcr_el1, zcr_el2, zcr_no_el2, zcr_el3 reginfo,
as well as related SVE functions.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/cpu.h                 |  7 -------
 target/arm/tcg/cpu-sve.h         |  7 +++++++
 linux-user/syscall.c             |  4 ++++
 target/arm/cpu-exceptions-aa64.c |  1 +
 target/arm/tcg/cpregs.c          | 10 ++++++++--
 target/arm/tcg/helper-a64.c      |  1 +
 target/arm/tcg/helper.c          |  1 +
 7 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ba41053111..662ac5ee62 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1047,9 +1047,6 @@ int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
 #ifdef TARGET_AARCH64
 int aarch64_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
-void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
-void aarch64_sve_change_el(CPUARMState *env, int old_el,
-                           int new_el, bool el0_a64);
 
 static inline bool is_a64(CPUARMState *env)
 {
@@ -1081,10 +1078,6 @@ static inline uint64_t *sve_bswap64(uint64_t *dst, uint64_t *src, int nr)
 }
 
 #else
-static inline void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq) { }
-static inline void aarch64_sve_change_el(CPUARMState *env, int o,
-                                         int n, bool a)
-{ }
 
 #define is_a64(env) (false)
 
diff --git a/target/arm/tcg/cpu-sve.h b/target/arm/tcg/cpu-sve.h
index 49f6ad021b..fc53b26998 100644
--- a/target/arm/tcg/cpu-sve.h
+++ b/target/arm/tcg/cpu-sve.h
@@ -21,4 +21,11 @@ uint32_t tcg_cpu_sve_disable_lens(unsigned long *sve_vq_map,
 bool tcg_cpu_sve_validate_lens(unsigned long *sve_vq_map, uint32_t max_vq,
                                Error **errp);
 
+/* tcg/helper.c */
+
+void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
+
+void aarch64_sve_change_el(CPUARMState *env, int old_el,
+                           int new_el, bool el0_a64);
+
 #endif /* TCG_CPU_SVE_H */
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 1e508576c7..9dbfe6fdc0 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -134,6 +134,10 @@
 #include "fd-trans.h"
 #include "tcg/tcg.h"
 
+#ifdef TARGET_AARCH64
+#include "tcg/cpu-sve.h"
+#endif /* TARGET_AARCH64 */
+
 #ifndef CLONE_IO
 #define CLONE_IO                0x80000000      /* Clone io context */
 #endif
diff --git a/target/arm/cpu-exceptions-aa64.c b/target/arm/cpu-exceptions-aa64.c
index 5ac52d0a58..ac42cb8626 100644
--- a/target/arm/cpu-exceptions-aa64.c
+++ b/target/arm/cpu-exceptions-aa64.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "cpu.h"
+#include "tcg/cpu-sve.h"
 #include "internals.h"
 #include "sysemu/tcg.h"
 
diff --git a/target/arm/tcg/cpregs.c b/target/arm/tcg/cpregs.c
index a72c9378b2..7376fad2eb 100644
--- a/target/arm/tcg/cpregs.c
+++ b/target/arm/tcg/cpregs.c
@@ -5792,6 +5792,10 @@ static const ARMCPRegInfo debug_lpae_cp_reginfo[] = {
     REGINFO_SENTINEL
 };
 
+#ifdef TARGET_AARCH64
+
+#include "tcg/cpu-sve.h"
+
 static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                       uint64_t value)
 {
@@ -5844,6 +5848,8 @@ static const ARMCPRegInfo zcr_el3_reginfo = {
     .writefn = zcr_write, .raw_writefn = raw_write
 };
 
+#endif /* TARGET_AARCH64 */
+
 static void dbgwvr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                          uint64_t value)
 {
@@ -7573,6 +7579,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, vhe_reginfo);
     }
 
+#ifdef TARGET_AARCH64
     if (cpu_isar_feature(aa64_sve, cpu)) {
         define_one_arm_cp_reg(cpu, &zcr_el1_reginfo);
         if (arm_feature(env, ARM_FEATURE_EL2)) {
@@ -7585,7 +7592,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         }
     }
 
-#ifdef TARGET_AARCH64
     if (cpu_isar_feature(aa64_pauth, cpu)) {
         define_arm_cp_regs(cpu, pauth_reginfo);
     }
@@ -7615,7 +7621,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, mte_tco_ro_reginfo);
         define_arm_cp_regs(cpu, mte_el0_cacheop_reginfo);
     }
-#endif
+#endif /* TARGET_AARCH64 */
 
     if (cpu_isar_feature(any_predinv, cpu)) {
         define_arm_cp_regs(cpu, predinv_reginfo);
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index b75ce80473..157a5bb549 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "cpu.h"
+#include "tcg/cpu-sve.h"
 #include "cpu-exceptions-aa64.h"
 #include "exec/gdbstub.h"
 #include "exec/helper-proto.h"
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index 493f5b066d..2e8b122cc4 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -16,6 +16,7 @@
 #include <zlib.h> /* For crc32 */
 #include "arm_ldst.h"
 #include "cpu-mmu.h"
+#include "tcg/cpu-sve.h"
 #include "cpregs.h"
 #include "tcg-cpu.h"
 
-- 
2.26.2


