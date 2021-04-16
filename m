Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F513626E6
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 19:34:14 +0200 (CEST)
Received: from localhost ([::1]:38828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXSMA-00084V-3H
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 13:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lXRLZ-0005Bn-DK
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:29:33 -0400
Received: from mx2.suse.de ([195.135.220.15]:46782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lXRLP-0001dL-AX
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:29:33 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 743E8B2FB;
 Fri, 16 Apr 2021 16:28:58 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v14 71/80] cpu-sve: rename sve_zcr_len_for_el to
 cpu_sve_get_zcr_len_for_el
Date: Fri, 16 Apr 2021 18:28:15 +0200
Message-Id: <20210416162824.25131-72-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210416162824.25131-1-cfontana@suse.de>
References: <20210416162824.25131-1-cfontana@suse.de>
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

use a canonical module prefix followed by the get_zcr_len_for_el()
method name. Also rename the static internal auxiliary function,
where the module prefix is not necessary.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-sve.h     | 2 +-
 target/arm/arch_dump.c   | 2 +-
 target/arm/cpu-sve.c     | 6 +++---
 target/arm/cpu64.c       | 2 +-
 target/arm/tcg/cpregs.c  | 4 ++--
 target/arm/tcg/helper.c  | 4 ++--
 target/arm/tcg/tcg-sve.c | 4 ++--
 7 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/arm/cpu-sve.h b/target/arm/cpu-sve.h
index 1512c56a6b..c83508ea0a 100644
--- a/target/arm/cpu-sve.h
+++ b/target/arm/cpu-sve.h
@@ -35,6 +35,6 @@ void cpu_sve_add_props(Object *obj);
 void cpu_sve_add_props_max(Object *obj);
 
 /* return the vector length for EL */
-uint32_t sve_zcr_len_for_el(CPUARMState *env, int el);
+uint32_t cpu_sve_get_zcr_len_for_el(CPUARMState *env, int el);
 
 #endif /* CPU_SVE_H */
diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
index 9b2e76f5a7..f192c8df97 100644
--- a/target/arm/arch_dump.c
+++ b/target/arm/arch_dump.c
@@ -168,7 +168,7 @@ static off_t sve_fpcr_offset(uint32_t vq)
 
 static uint32_t sve_current_vq(CPUARMState *env)
 {
-    return sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
+    return cpu_sve_get_zcr_len_for_el(env, arm_current_el(env)) + 1;
 }
 
 static size_t sve_size_vq(uint32_t vq)
diff --git a/target/arm/cpu-sve.c b/target/arm/cpu-sve.c
index e8e817e110..1bc8c0bdb0 100644
--- a/target/arm/cpu-sve.c
+++ b/target/arm/cpu-sve.c
@@ -289,7 +289,7 @@ void cpu_sve_add_props_max(Object *obj)
     object_property_add(obj, "sve-max-vq", "uint32", get_prop_max_vq, set_prop_max_vq, NULL, NULL);
 }
 
-static uint32_t sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len)
+static uint32_t get_valid_len(ARMCPU *cpu, uint32_t start_len)
 {
     uint32_t end_len;
 
@@ -304,7 +304,7 @@ static uint32_t sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len)
 /*
  * Given that SVE is enabled, return the vector length for EL.
  */
-uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
+uint32_t cpu_sve_get_zcr_len_for_el(CPUARMState *env, int el)
 {
     ARMCPU *cpu = env_archcpu(env);
     uint32_t zcr_len = cpu->sve_max_vq - 1;
@@ -319,5 +319,5 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
         zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
     }
 
-    return sve_zcr_get_valid_len(cpu, zcr_len);
+    return get_valid_len(cpu, zcr_len);
 }
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 8c96a108fc..b1b5cf5cc9 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -535,7 +535,7 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                  vfp_get_fpcr(env), vfp_get_fpsr(env));
 
     if (cpu_isar_feature(aa64_sve, cpu) && sve_exception_el(env, el) == 0) {
-        int j, zcr_len = sve_zcr_len_for_el(env, el);
+        int j, zcr_len = cpu_sve_get_zcr_len_for_el(env, el);
 
         for (i = 0; i <= FFR_PRED_NUM; i++) {
             bool eol;
diff --git a/target/arm/tcg/cpregs.c b/target/arm/tcg/cpregs.c
index 0f4460e28a..c4117b68f5 100644
--- a/target/arm/tcg/cpregs.c
+++ b/target/arm/tcg/cpregs.c
@@ -5802,7 +5802,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                       uint64_t value)
 {
     int cur_el = arm_current_el(env);
-    int old_len = sve_zcr_len_for_el(env, cur_el);
+    int old_len = cpu_sve_get_zcr_len_for_el(env, cur_el);
     int new_len;
 
     /* Bits other than [3:0] are RAZ/WI.  */
@@ -5813,7 +5813,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
      * Because we arrived here, we know both FP and SVE are enabled;
      * otherwise we would have trapped access to the ZCR_ELn register.
      */
-    new_len = sve_zcr_len_for_el(env, cur_el);
+    new_len = cpu_sve_get_zcr_len_for_el(env, cur_el);
     if (new_len < old_len) {
         tcg_sve_narrow_vq(env, new_len + 1);
     }
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index 04ea37e101..a10b8a62dc 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -186,7 +186,7 @@ static int arm_gdb_get_svereg(CPUARMState *env, GByteArray *buf, int reg)
          * We report in Vector Granules (VG) which is 64bit in a Z reg
          * while the ZCR works in Vector Quads (VQ) which is 128bit chunks.
          */
-        int vq = sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
+        int vq = cpu_sve_get_zcr_len_for_el(env, arm_current_el(env)) + 1;
         return gdb_get_reg64(buf, vq * 2);
     }
     default:
@@ -1023,7 +1023,7 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         if (sve_el != 0 && fp_el == 0) {
             zcr_len = 0;
         } else {
-            zcr_len = sve_zcr_len_for_el(env, el);
+            zcr_len = cpu_sve_get_zcr_len_for_el(env, el);
         }
         flags = FIELD_DP32(flags, TBFLAG_A64, SVEEXC_EL, sve_el);
         flags = FIELD_DP32(flags, TBFLAG_A64, ZCR_LEN, zcr_len);
diff --git a/target/arm/tcg/tcg-sve.c b/target/arm/tcg/tcg-sve.c
index 25d5a5867c..80a37caf6e 100644
--- a/target/arm/tcg/tcg-sve.c
+++ b/target/arm/tcg/tcg-sve.c
@@ -155,10 +155,10 @@ void tcg_sve_change_el(CPUARMState *env, int old_el,
      */
     old_a64 = old_el ? arm_el_is_aa64(env, old_el) : el0_a64;
     old_len = (old_a64 && !sve_exception_el(env, old_el)
-               ? sve_zcr_len_for_el(env, old_el) : 0);
+               ? cpu_sve_get_zcr_len_for_el(env, old_el) : 0);
     new_a64 = new_el ? arm_el_is_aa64(env, new_el) : el0_a64;
     new_len = (new_a64 && !sve_exception_el(env, new_el)
-               ? sve_zcr_len_for_el(env, new_el) : 0);
+               ? cpu_sve_get_zcr_len_for_el(env, new_el) : 0);
 
     /* When changing vector length, clear inaccessible state.  */
     if (new_len < old_len) {
-- 
2.26.2


