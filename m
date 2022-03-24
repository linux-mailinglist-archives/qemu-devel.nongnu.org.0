Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D70B4E6930
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 20:18:27 +0100 (CET)
Received: from localhost ([::1]:48632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXSyX-0003xn-T2
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 15:18:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1nXSpZ-0000SO-9c; Thu, 24 Mar 2022 15:09:10 -0400
Received: from [187.72.171.209] (port=22421 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1nXSpX-00053C-Hr; Thu, 24 Mar 2022 15:09:08 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 24 Mar 2022 16:09:06 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 94D3A8001D4;
 Thu, 24 Mar 2022 16:09:05 -0300 (-03)
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH 1/6] target/ppc: Add support for the Processor Attention
 instruction
Date: Thu, 24 Mar 2022 16:08:49 -0300
Message-Id: <20220324190854.156898-2-leandro.lupori@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220324190854.156898-1-leandro.lupori@eldorado.org.br>
References: <20220324190854.156898-1-leandro.lupori@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 24 Mar 2022 19:09:06.0030 (UTC)
 FILETIME=[A1E508E0:01D83FB2]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Leandro Lupori <leandro.lupori@eldorado.org.br>, danielhb413@gmail.com,
 richard.henderson@linaro.org, groug@kaod.org, clg@kaod.org,
 pbonzini@redhat.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

Check the HID0 bit to send signal, currently modeled as a checkstop.
The QEMU implementation adds an exit using the GPR[3] value (that's a
hack for tests)

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
---
 target/ppc/cpu.h         |  8 ++++++++
 target/ppc/excp_helper.c | 27 +++++++++++++++++++++++++++
 target/ppc/helper.h      |  1 +
 target/ppc/translate.c   | 14 ++++++++++++++
 4 files changed, 50 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 047b24ba50..12f9f3a880 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -173,6 +173,12 @@ enum {
     POWERPC_EXCP_PRIV_REG      = 0x02,  /* Privileged register exception     */
     /* Trap                                                                  */
     POWERPC_EXCP_TRAP          = 0x40,
+    /* Processor Attention                                                   */
+    POWERPC_EXCP_ATTN          = 0x100,
+    /*
+     * NOTE: POWERPC_EXCP_ATTN uses values from 0x100 to 0x1ff to return
+     *       error codes.
+     */
 };
 
 #define PPC_INPUT(env) ((env)->bus_model)
@@ -2089,6 +2095,8 @@ void ppc_compat_add_property(Object *obj, const char *name,
 #define HID0_DOZE           (1 << 23)           /* pre-2.06 */
 #define HID0_NAP            (1 << 22)           /* pre-2.06 */
 #define HID0_HILE           PPC_BIT(19) /* POWER8 */
+#define HID0_ATTN           PPC_BIT(31) /* Processor Attention */
+#define HID0_POWER9_ATTN    PPC_BIT(3)
 #define HID0_POWER9_HILE    PPC_BIT(4)
 
 /*****************************************************************************/
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index d3e2cfcd71..b0c629905c 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1379,6 +1379,9 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
             }
             cs->halted = 1;
             cpu_interrupt_exittb(cs);
+            if ((env->error_code & ~0xff) == POWERPC_EXCP_ATTN) {
+                exit(env->error_code & 0xff);
+            }
         }
         if (env->msr_mask & MSR_HVB) {
             /*
@@ -1971,6 +1974,30 @@ void helper_pminsn(CPUPPCState *env, powerpc_pm_insn_t insn)
     env->resume_as_sreset = (insn != PPC_PM_STOP) ||
         (env->spr[SPR_PSSCR] & PSSCR_EC);
 }
+
+/*
+ * Processor Attention instruction (Implementation dependent)
+ */
+void helper_attn(CPUPPCState *env, target_ulong r3)
+{
+    bool attn = false;
+
+    if (env->excp_model == POWERPC_EXCP_POWER8) {
+        attn = !!(env->spr[SPR_HID0] & HID0_ATTN);
+    } else if (env->excp_model == POWERPC_EXCP_POWER9 ||
+               env->excp_model == POWERPC_EXCP_POWER10) {
+        attn = !!(env->spr[SPR_HID0] & HID0_POWER9_ATTN);
+    }
+
+    if (attn) {
+        raise_exception_err(env, POWERPC_EXCP_MCHECK,
+                            POWERPC_EXCP_ATTN | (r3 & 0xff));
+    } else {
+        raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
+                               POWERPC_EXCP_INVAL |
+                               POWERPC_EXCP_INVAL_INVAL, GETPC());
+    }
+}
 #endif /* defined(TARGET_PPC64) */
 
 static void do_rfi(CPUPPCState *env, target_ulong nip, target_ulong msr)
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 57da11c77e..9a2497569b 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -14,6 +14,7 @@ DEF_HELPER_1(rfmci, void, env)
 #if defined(TARGET_PPC64)
 DEF_HELPER_2(scv, noreturn, env, i32)
 DEF_HELPER_2(pminsn, void, env, i32)
+DEF_HELPER_2(attn, void, env, tl)
 DEF_HELPER_1(rfid, void, env)
 DEF_HELPER_1(rfscv, void, env)
 DEF_HELPER_1(hrfid, void, env)
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 408ae26173..5ace6f3a29 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4123,6 +4123,19 @@ static void gen_rvwinkle(DisasContext *ctx)
     gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
+
+static void gen_attn(DisasContext *ctx)
+{
+ #if defined(CONFIG_USER_ONLY)
+    GEN_PRIV;
+#else
+    CHK_SV;
+
+    gen_helper_attn(cpu_env, cpu_gpr[3]);
+    ctx->base.is_jmp = DISAS_NORETURN;
+#endif
+}
+
 #endif /* #if defined(TARGET_PPC64) */
 
 static inline void gen_update_cfar(DisasContext *ctx, target_ulong nip)
@@ -6844,6 +6857,7 @@ GEN_HANDLER_E(nap, 0x13, 0x12, 0x0d, 0x03FFF801, PPC_NONE, PPC2_PM_ISA206),
 GEN_HANDLER_E(sleep, 0x13, 0x12, 0x0e, 0x03FFF801, PPC_NONE, PPC2_PM_ISA206),
 GEN_HANDLER_E(rvwinkle, 0x13, 0x12, 0x0f, 0x03FFF801, PPC_NONE, PPC2_PM_ISA206),
 GEN_HANDLER(hrfid, 0x13, 0x12, 0x08, 0x03FF8001, PPC_64H),
+GEN_HANDLER(attn, 0x0, 0x00, 0x8, 0xfffffdff, PPC_FLOW),
 #endif
 /* Top bit of opc2 corresponds with low bit of LEV, so use two handlers */
 GEN_HANDLER(sc, 0x11, 0x11, 0xFF, 0x03FFF01D, PPC_FLOW),
-- 
2.25.1


