Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B4534B035
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 21:35:49 +0100 (CET)
Received: from localhost ([::1]:37838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPtBM-00066I-E8
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 16:35:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsHp-0007Rl-0A
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:38:26 -0400
Received: from mx2.suse.de ([195.135.220.15]:46248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPsHl-0001Kr-VU
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:38:24 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B34AFAF45;
 Fri, 26 Mar 2021 19:38:10 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v12 58/65] target/arm: tcg-sve: rename the narrow_vq and
 change_el functions
Date: Fri, 26 Mar 2021 20:36:54 +0100
Message-Id: <20210326193701.5981-59-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210326193701.5981-1-cfontana@suse.de>
References: <20210326193701.5981-1-cfontana@suse.de>
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

make them canonical for the module name.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/tcg/tcg-sve.h         | 4 ++--
 linux-user/syscall.c             | 2 +-
 target/arm/cpu-exceptions-aa64.c | 2 +-
 target/arm/tcg/cpregs.c          | 2 +-
 target/arm/tcg/helper-a64.c      | 2 +-
 target/arm/tcg/tcg-sve.c         | 6 +++---
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/arm/tcg/tcg-sve.h b/target/arm/tcg/tcg-sve.h
index 289c1936e1..7ae52fe65e 100644
--- a/target/arm/tcg/tcg-sve.h
+++ b/target/arm/tcg/tcg-sve.h
@@ -23,9 +23,9 @@ bool tcg_sve_validate_lens(unsigned long *sve_vq_map, uint32_t max_vq,
 
 /* tcg/helper.c */
 
-void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
+void tcg_sve_narrow_vq(CPUARMState *env, unsigned vq);
 
-void aarch64_sve_change_el(CPUARMState *env, int old_el,
+void tcg_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64);
 
 #endif /* TCG_SVE_H */
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index a271a81d34..e8bd8e1e0f 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -10927,7 +10927,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 vq = MIN(vq, cpu->sve_max_vq);
 
                 if (vq < old_vq) {
-                    aarch64_sve_narrow_vq(env, vq);
+                    tcg_sve_narrow_vq(env, vq);
                 }
                 env->vfp.zcr_el[1] = vq - 1;
                 arm_rebuild_hflags(env);
diff --git a/target/arm/cpu-exceptions-aa64.c b/target/arm/cpu-exceptions-aa64.c
index b80f5a99de..13e4c75fd8 100644
--- a/target/arm/cpu-exceptions-aa64.c
+++ b/target/arm/cpu-exceptions-aa64.c
@@ -396,7 +396,7 @@ void arm_cpu_do_interrupt_aarch64(CPUState *cs)
          * Note that new_el can never be 0.  If cur_el is 0, then
          * el0_a64 is is_a64(), else el0_a64 is ignored.
          */
-        aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
+        tcg_sve_change_el(env, cur_el, new_el, is_a64(env));
     }
 
     if (cur_el < new_el) {
diff --git a/target/arm/tcg/cpregs.c b/target/arm/tcg/cpregs.c
index 0a99490a50..a451e0aaef 100644
--- a/target/arm/tcg/cpregs.c
+++ b/target/arm/tcg/cpregs.c
@@ -5815,7 +5815,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
      */
     new_len = sve_zcr_len_for_el(env, cur_el);
     if (new_len < old_len) {
-        aarch64_sve_narrow_vq(env, new_len + 1);
+        tcg_sve_narrow_vq(env, new_len + 1);
     }
 }
 
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 65d7c24578..c1c04b979d 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -1043,7 +1043,7 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
      * Note that cur_el can never be 0.  If new_el is 0, then
      * el0_a64 is return_to_aa64, else el0_a64 is ignored.
      */
-    aarch64_sve_change_el(env, cur_el, new_el, return_to_aa64);
+    tcg_sve_change_el(env, cur_el, new_el, return_to_aa64);
 
     qemu_mutex_lock_iothread();
     arm_call_el_change_hook(env_archcpu(env));
diff --git a/target/arm/tcg/tcg-sve.c b/target/arm/tcg/tcg-sve.c
index 908d2c2f2c..25d5a5867c 100644
--- a/target/arm/tcg/tcg-sve.c
+++ b/target/arm/tcg/tcg-sve.c
@@ -95,7 +95,7 @@ bool tcg_sve_validate_lens(unsigned long *sve_vq_map, uint32_t max_vq,
  * may well be cheaper than conditionals to restrict the operation
  * to the relevant portion of a uint16_t[16].
  */
-void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq)
+void tcg_sve_narrow_vq(CPUARMState *env, unsigned vq)
 {
     int i, j;
     uint64_t pmask;
@@ -124,7 +124,7 @@ void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq)
 /*
  * Notice a change in SVE vector size when changing EL.
  */
-void aarch64_sve_change_el(CPUARMState *env, int old_el,
+void tcg_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -162,6 +162,6 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
 
     /* When changing vector length, clear inaccessible state.  */
     if (new_len < old_len) {
-        aarch64_sve_narrow_vq(env, new_len + 1);
+        tcg_sve_narrow_vq(env, new_len + 1);
     }
 }
-- 
2.26.2


