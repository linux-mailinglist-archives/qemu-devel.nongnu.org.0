Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2216636D5
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 02:42:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF3dG-0003oQ-O2; Mon, 09 Jan 2023 20:40:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pF1PH-0004hl-Sl; Mon, 09 Jan 2023 18:18:23 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pF1PA-0006NX-Iy; Mon, 09 Jan 2023 18:18:19 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 8CFC211EF97;
 Mon,  9 Jan 2023 23:18:05 +0000 (UTC)
From: ~dreiss-meta <dreiss-meta@git.sr.ht>
Date: Mon, 09 Jan 2023 15:05:24 -0800
Subject: [PATCH qemu 3/3] target/arm/gdbstub: Support reading M security
 extension registers from GDB
Message-ID: <167330628518.10497.13100425787268927786-2@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <167330628518.10497.13100425787268927786-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 09 Jan 2023 20:40:46 -0500
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
 target/arm/cpu.h     |   4 +-
 target/arm/gdbstub.c | 149 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 152 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5cf86cf2d7..b975c7d7db 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -853,6 +853,7 @@ struct ArchCPU {
     DynamicGDBXMLInfo dyn_sysreg_xml;
     DynamicGDBXMLInfo dyn_svereg_xml;
     DynamicGDBXMLInfo dyn_m_systemreg_xml;
+    DynamicGDBXMLInfo dyn_m_securereg_xml;
=20
     /* Timers used by the generic (architected) timer */
     QEMUTimer *gt_timer[NUM_GTIMERS];
@@ -1096,12 +1097,13 @@ int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t=
 *buf, int reg);
=20
 /*
  * Helpers to dynamically generates XML descriptions of the sysregs,
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
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 4456892e91..2bf5a63534 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -437,6 +437,143 @@ int arm_gen_dynamic_m_systemreg_xml(CPUState *cs, int b=
ase_reg)
     return info->num;
 }
=20
+struct v8m_stack_registers {
+    uint32_t msp_s;
+    uint32_t psp_s;
+    uint32_t msp_ns;
+    uint32_t psp_ns;
+};
+
+static struct v8m_stack_registers get_v8m_stack_registers(CPUARMState *env)
+{
+    uint32_t current_ss_msp;
+    uint32_t current_ss_psp;
+    if (v7m_using_psp(env)) {
+        current_ss_msp =3D env->v7m.other_sp;
+        current_ss_psp =3D env->regs[13];
+    } else {
+        current_ss_msp =3D env->regs[13];
+        current_ss_psp =3D env->v7m.other_sp;
+
+    }
+
+    struct v8m_stack_registers ret;
+    if (env->v7m.secure) {
+        ret.msp_s =3D current_ss_msp;
+        ret.psp_s =3D current_ss_psp;
+        ret.msp_ns =3D env->v7m.other_ss_msp;
+        ret.psp_ns =3D env->v7m.other_ss_psp;
+    } else {
+        ret.msp_s =3D env->v7m.other_ss_msp;
+        ret.psp_s =3D env->v7m.other_ss_psp;
+        ret.msp_ns =3D current_ss_msp;
+        ret.psp_ns =3D current_ss_psp;
+    }
+
+    return ret;
+}
+
+static int arm_gdb_get_m_secextreg(CPUARMState *env, GByteArray *buf, int re=
g)
+{
+    switch (reg) {
+    case  0:  /* MSP_S */
+        return gdb_get_reg32(buf, get_v8m_stack_registers(env).msp_s);
+    case  1:  /* PSP_S */
+        return gdb_get_reg32(buf, get_v8m_stack_registers(env).psp_s);
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
+        return gdb_get_reg32(buf, get_v8m_stack_registers(env).msp_ns);
+    case  9:  /* PSP_NS */
+        return gdb_get_reg32(buf, get_v8m_stack_registers(env).psp_ns);
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
+    GString *s =3D g_string_new(NULL);
+    DynamicGDBXMLInfo *info =3D &cpu->dyn_m_securereg_xml;
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
+    /*  5 */ g_array_append_str_literal(regs, "basepri_s");
+    /*  6 */ g_array_append_str_literal(regs, "faultmask_s");
+    /*  7 */ g_array_append_str_literal(regs, "control_s");
+    /*  8 */ g_array_append_str_literal(regs, "msp_ns");
+    /*  9 */ g_array_append_str_literal(regs, "psp_ns");
+    /* 10 */ g_array_append_str_literal(regs, "msplim_ns");
+    /* 11 */ g_array_append_str_literal(regs, "psplim_ns");
+    /* 12 */ g_array_append_str_literal(regs, "primask_ns");
+    /* 13 */ g_array_append_str_literal(regs, "basepri_ns");
+    /* 14 */ g_array_append_str_literal(regs, "faultmask_ns");
+    /* 15 */ g_array_append_str_literal(regs, "control_ns");
+
+    for (int idx =3D 0; idx < regs->len; idx++) {
+        const char *name =3D g_array_index(regs, const char *, idx);
+        if (*name !=3D '\0') {
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
@@ -567,6 +704,8 @@ const char *arm_gdb_get_dynamic_xml(CPUState *cs, const c=
har *xmlname)
         return cpu->dyn_svereg_xml.desc;
     } else if (strcmp(xmlname, "arm-m-system.xml") =3D=3D 0) {
         return cpu->dyn_m_systemreg_xml.desc;
+    } else if (strcmp(xmlname, "arm-m-secext.xml") =3D=3D 0) {
+        return cpu->dyn_m_securereg_xml.desc;
     }
     return NULL;
 }
@@ -618,6 +757,16 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
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
--=20
2.34.5

