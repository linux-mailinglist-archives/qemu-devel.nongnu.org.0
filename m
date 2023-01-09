Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5528468DF18
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 18:38:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPRut-0004W4-Oz; Tue, 07 Feb 2023 12:38:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pPRur-0004VB-SH; Tue, 07 Feb 2023 12:38:01 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pPRup-0004Ky-Ah; Tue, 07 Feb 2023 12:38:01 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id C45F711EF37;
 Tue,  7 Feb 2023 17:37:57 +0000 (UTC)
From: ~dreiss-meta <dreiss-meta@git.sr.ht>
Date: Mon, 09 Jan 2023 15:05:24 -0800
Subject: [PATCH qemu v4 2/2] target/arm/gdbstub: Support reading M security
 extension registers from GDB
Message-ID: <167579147730.28776.7263330829354840538-2@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <167579147730.28776.7263330829354840538-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 15
X-Spam_score: 1.5
X-Spam_bar: +
X-Spam_report: (1.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: ~dreiss-meta <dreiss@meta.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: David Reiss <dreiss@meta.com>

Follows a fairly similar pattern to the existing special register debug
support.  Only reading is implemented, but it should be possible to
implement writes.

Signed-off-by: David Reiss <dreiss@meta.com>
---
 target/arm/cpu.h      |  15 +++++-
 target/arm/gdbstub.c  | 116 ++++++++++++++++++++++++++++++++++++++++++
 target/arm/m_helper.c |  81 ++++++++++++++---------------
 3 files changed, 168 insertions(+), 44 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2ba64811a0..788eb31286 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -868,6 +868,7 @@ struct ArchCPU {
     DynamicGDBXMLInfo dyn_sysreg_xml;
     DynamicGDBXMLInfo dyn_svereg_xml;
     DynamicGDBXMLInfo dyn_m_systemreg_xml;
+    DynamicGDBXMLInfo dyn_m_securereg_xml;
=20
     /* Timers used by the generic (architected) timer */
     QEMUTimer *gt_timer[NUM_GTIMERS];
@@ -1113,12 +1114,13 @@ int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t=
 *buf, int reg);
=20
 /*
  * Helpers to dynamically generate XML descriptions of the sysregs,
- * SVE registers, and M-profile system registers.
+ * SVE registers, M-profile system, and M-profile secure extension registers.
  * Returns the number of registers in each set.
  */
 int arm_gen_dynamic_sysreg_xml(CPUState *cpu, int base_reg);
 int arm_gen_dynamic_svereg_xml(CPUState *cpu, int base_reg);
 int arm_gen_dynamic_m_systemreg_xml(CPUState *cpu, int base_reg);
+int arm_gen_dynamic_m_securereg_xml(CPUState *cpu, int base_reg);
=20
 /* Returns the dynamically generated XML for the gdb stub.
  * Returns a pointer to the XML contents for the specified XML file or NULL
@@ -1618,6 +1620,17 @@ static inline void xpsr_write(CPUARMState *env, uint32=
_t val, uint32_t mask)
 #endif
 }
=20
+/*
+ * Return a pointer to the location where we currently store the
+ * stack pointer for the requested security state and thread mode.
+ * This pointer will become invalid if the CPU state is updated
+ * such that the stack pointers are switched around (eg changing
+ * the SPSEL control bit).
+ */
+uint32_t *arm_v7m_get_sp_ptr(CPUARMState *env, bool secure, bool threadmode,
+                             bool spsel);
+
+
 #define HCR_VM        (1ULL << 0)
 #define HCR_SWIO      (1ULL << 1)
 #define HCR_PTW       (1ULL << 2)
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 2780a089ec..3d4ca8a008 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -437,6 +437,110 @@ int arm_gen_dynamic_m_systemreg_xml(CPUState *cs, int b=
ase_reg)
     return info->num;
 }
=20
+static int arm_gdb_get_m_secextreg(CPUARMState *env, GByteArray *buf, int re=
g)
+{
+    switch (reg) {
+    case  0:  /* MSP_S */
+        return gdb_get_reg32(buf, *arm_v7m_get_sp_ptr(env, true, false, true=
));
+    case  1:  /* PSP_S */
+        return gdb_get_reg32(buf, *arm_v7m_get_sp_ptr(env, true, true, true)=
);
+    case  2:  /* MSPLIM_S */
+        return gdb_get_reg32(buf, env->v7m.msplim[M_REG_S]);
+    case  3:  /* PSPLIM_S */
+        return gdb_get_reg32(buf, env->v7m.psplim[M_REG_S]);
+    case  4:  /* PRIMASK_S */
+        return gdb_get_reg32(buf, env->v7m.primask[M_REG_S]);
+    case  5:  /* BASEPRI_S */
+        if (!arm_feature(env, ARM_FEATURE_M_MAIN)) {
+            return 0;
+        }
+        return gdb_get_reg32(buf, env->v7m.basepri[M_REG_S]);
+    case  6:  /* FAULTMASK_S */
+        if (!arm_feature(env, ARM_FEATURE_M_MAIN)) {
+            return 0;
+        }
+        return gdb_get_reg32(buf, env->v7m.faultmask[M_REG_S]);
+    case  7:  /* CONTROL_S */
+        return gdb_get_reg32(buf, env->v7m.control[M_REG_S]);
+    case  8:  /* MSP_NS */
+        return gdb_get_reg32(buf, *arm_v7m_get_sp_ptr(env, false, false, tru=
e));
+    case  9:  /* PSP_NS */
+        return gdb_get_reg32(buf, *arm_v7m_get_sp_ptr(env, false, true, true=
));
+    case 10:  /* MSPLIM_NS */
+        return gdb_get_reg32(buf, env->v7m.msplim[M_REG_NS]);
+    case 11:  /* PSPLIM_NS */
+        return gdb_get_reg32(buf, env->v7m.psplim[M_REG_NS]);
+    case 12:  /* PRIMASK_NS */
+        return gdb_get_reg32(buf, env->v7m.primask[M_REG_NS]);
+    case 13:  /* BASEPRI_NS */
+        if (!arm_feature(env, ARM_FEATURE_M_MAIN)) {
+            return 0;
+        }
+        return gdb_get_reg32(buf, env->v7m.basepri[M_REG_NS]);
+    case 14:  /* FAULTMASK_NS */
+        if (!arm_feature(env, ARM_FEATURE_M_MAIN)) {
+            return 0;
+        }
+        return gdb_get_reg32(buf, env->v7m.faultmask[M_REG_NS]);
+    case 15:  /* CONTROL_NS */
+        return gdb_get_reg32(buf, env->v7m.control[M_REG_NS]);
+    }
+
+    return 0;
+}
+
+static int arm_gdb_set_m_secextreg(CPUARMState *env, uint8_t *buf, int reg)
+{
+    /* TODO: Implement. */
+    return 0;
+}
+
+int arm_gen_dynamic_m_securereg_xml(CPUState *cs, int base_reg)
+{
+    ARMCPU *cpu =3D ARM_CPU(cs);
+    CPUARMState *env =3D &cpu->env;
+    GString *s =3D g_string_new(NULL);
+    DynamicGDBXMLInfo *info =3D &cpu->dyn_m_securereg_xml;
+    bool is_main =3D arm_feature(env, ARM_FEATURE_M_MAIN);
+
+    g_string_printf(s, "<?xml version=3D\"1.0\"?>");
+    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
+    g_string_append_printf(s, "<feature name=3D\"org.gnu.gdb.arm.secext\">\n=
");
+
+    g_autoptr(GArray) regs =3D g_array_new(false, true, sizeof(const char *)=
);
+    /*  0 */ g_array_append_str_literal(regs, "msp_s");
+    /*  1 */ g_array_append_str_literal(regs, "psp_s");
+    /*  2 */ g_array_append_str_literal(regs, "msplim_s");
+    /*  3 */ g_array_append_str_literal(regs, "psplim_s");
+    /*  4 */ g_array_append_str_literal(regs, "primask_s");
+    /*  5 */ g_array_append_str_literal(regs, is_main ? "basepri_s" : NULL);
+    /*  6 */ g_array_append_str_literal(regs, is_main ? "faultmask_s" : NULL=
);
+    /*  7 */ g_array_append_str_literal(regs, "control_s");
+    /*  8 */ g_array_append_str_literal(regs, "msp_ns");
+    /*  9 */ g_array_append_str_literal(regs, "psp_ns");
+    /* 10 */ g_array_append_str_literal(regs, "msplim_ns");
+    /* 11 */ g_array_append_str_literal(regs, "psplim_ns");
+    /* 12 */ g_array_append_str_literal(regs, "primask_ns");
+    /* 13 */ g_array_append_str_literal(regs, is_main ? "basepri_ns" : NULL);
+    /* 14 */ g_array_append_str_literal(regs, is_main ? "faultmask_ns" : NUL=
L);
+    /* 15 */ g_array_append_str_literal(regs, "control_ns");
+
+    for (int idx =3D 0; idx < regs->len; idx++) {
+        const char *name =3D g_array_index(regs, const char *, idx);
+        if (name) {
+            g_string_append_printf(s,
+                        "<reg name=3D\"%s\" bitsize=3D\"32\" regnum=3D\"%d\"=
/>\n",
+                        name, base_reg);
+        }
+        base_reg++;
+    }
+    info->num =3D regs->len;
+
+    g_string_append_printf(s, "</feature>");
+    info->desc =3D g_string_free(s, false);
+    return info->num;
+}
+
 struct TypeSize {
     const char *gdb_type;
     int  size;
@@ -567,6 +671,8 @@ const char *arm_gdb_get_dynamic_xml(CPUState *cs, const c=
har *xmlname)
         return cpu->dyn_svereg_xml.desc;
     } else if (strcmp(xmlname, "arm-m-system.xml") =3D=3D 0) {
         return cpu->dyn_m_systemreg_xml.desc;
+    } else if (strcmp(xmlname, "arm-m-secext.xml") =3D=3D 0) {
+        return cpu->dyn_m_securereg_xml.desc;
     }
     return NULL;
 }
@@ -618,6 +724,16 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                                      arm_gen_dynamic_m_systemreg_xml(
                                          cs, cs->gdb_num_regs),
                                      "arm-m-system.xml", 0);
+            if (arm_feature(env, ARM_FEATURE_V8) &&
+                    arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+                gdb_register_coprocessor(cs,
+                                         arm_gdb_get_m_secextreg,
+                                         arm_gdb_set_m_secextreg,
+                                         arm_gen_dynamic_m_securereg_xml(
+                                             cs, cs->gdb_num_regs),
+                                         "arm-m-secext.xml", 0);
+
+            }
         }
     }
     if (cpu_isar_feature(aa32_mve, cpu)) {
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index c20bcac977..5cbe2dc92e 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -605,42 +605,6 @@ void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
     arm_rebuild_hflags(env);
 }
=20
-static uint32_t *get_v7m_sp_ptr(CPUARMState *env, bool secure, bool threadmo=
de,
-                                bool spsel)
-{
-    /*
-     * Return a pointer to the location where we currently store the
-     * stack pointer for the requested security state and thread mode.
-     * This pointer will become invalid if the CPU state is updated
-     * such that the stack pointers are switched around (eg changing
-     * the SPSEL control bit).
-     * Compare the v8M ARM ARM pseudocode LookUpSP_with_security_mode().
-     * Unlike that pseudocode, we require the caller to pass us in the
-     * SPSEL control bit value; this is because we also use this
-     * function in handling of pushing of the callee-saves registers
-     * part of the v8M stack frame (pseudocode PushCalleeStack()),
-     * and in the tailchain codepath the SPSEL bit comes from the exception
-     * return magic LR value from the previous exception. The pseudocode
-     * opencodes the stack-selection in PushCalleeStack(), but we prefer
-     * to make this utility function generic enough to do the job.
-     */
-    bool want_psp =3D threadmode && spsel;
-
-    if (secure =3D=3D env->v7m.secure) {
-        if (want_psp =3D=3D v7m_using_psp(env)) {
-            return &env->regs[13];
-        } else {
-            return &env->v7m.other_sp;
-        }
-    } else {
-        if (want_psp) {
-            return &env->v7m.other_ss_psp;
-        } else {
-            return &env->v7m.other_ss_msp;
-        }
-    }
-}
-
 static bool arm_v7m_load_vector(ARMCPU *cpu, int exc, bool targets_secure,
                                 uint32_t *pvec)
 {
@@ -765,8 +729,8 @@ static bool v7m_push_callee_stack(ARMCPU *cpu, uint32_t l=
r, bool dotailchain,
             !mode;
=20
         mmu_idx =3D arm_v7m_mmu_idx_for_secstate_and_priv(env, M_REG_S, priv=
);
-        frame_sp_p =3D get_v7m_sp_ptr(env, M_REG_S, mode,
-                                    lr & R_V7M_EXCRET_SPSEL_MASK);
+        frame_sp_p =3D arm_v7m_get_sp_ptr(env, M_REG_S, mode,
+                                        lr & R_V7M_EXCRET_SPSEL_MASK);
         want_psp =3D mode && (lr & R_V7M_EXCRET_SPSEL_MASK);
         if (want_psp) {
             limit =3D env->v7m.psplim[M_REG_S];
@@ -1611,10 +1575,10 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
          * use 'frame_sp_p' after we do something that makes it invalid.
          */
         bool spsel =3D env->v7m.control[return_to_secure] & R_V7M_CONTROL_SP=
SEL_MASK;
-        uint32_t *frame_sp_p =3D get_v7m_sp_ptr(env,
-                                              return_to_secure,
-                                              !return_to_handler,
-                                              spsel);
+        uint32_t *frame_sp_p =3D arm_v7m_get_sp_ptr(env,
+                                                  return_to_secure,
+                                                  !return_to_handler,
+                                                  spsel);
         uint32_t frameptr =3D *frame_sp_p;
         bool pop_ok =3D true;
         ARMMMUIdx mmu_idx;
@@ -1920,7 +1884,7 @@ static bool do_v7m_function_return(ARMCPU *cpu)
         threadmode =3D !arm_v7m_is_handler_mode(env);
         spsel =3D env->v7m.control[M_REG_S] & R_V7M_CONTROL_SPSEL_MASK;
=20
-        frame_sp_p =3D get_v7m_sp_ptr(env, true, threadmode, spsel);
+        frame_sp_p =3D arm_v7m_get_sp_ptr(env, true, threadmode, spsel);
         frameptr =3D *frame_sp_p;
=20
         /*
@@ -2856,6 +2820,37 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t add=
r, uint32_t op)
=20
 #endif /* !CONFIG_USER_ONLY */
=20
+uint32_t *arm_v7m_get_sp_ptr(CPUARMState *env, bool secure, bool threadmode,
+                             bool spsel)
+{
+    /*
+     * Compare the v8M ARM ARM pseudocode LookUpSP_with_security_mode().
+     * Unlike that pseudocode, we require the caller to pass us in the
+     * SPSEL control bit value; this is because we also use this
+     * function in handling of pushing of the callee-saves registers
+     * part of the v8M stack frame (pseudocode PushCalleeStack()),
+     * and in the tailchain codepath the SPSEL bit comes from the exception
+     * return magic LR value from the previous exception. The pseudocode
+     * opencodes the stack-selection in PushCalleeStack(), but we prefer
+     * to make this utility function generic enough to do the job.
+     */
+    bool want_psp =3D threadmode && spsel;
+
+    if (secure =3D=3D env->v7m.secure) {
+        if (want_psp =3D=3D v7m_using_psp(env)) {
+            return &env->regs[13];
+        } else {
+            return &env->v7m.other_sp;
+        }
+    } else {
+        if (want_psp) {
+            return &env->v7m.other_ss_psp;
+        } else {
+            return &env->v7m.other_ss_msp;
+        }
+    }
+}
+
 ARMMMUIdx arm_v7m_mmu_idx_all(CPUARMState *env,
                               bool secstate, bool priv, bool negpri)
 {
--=20
2.34.5

