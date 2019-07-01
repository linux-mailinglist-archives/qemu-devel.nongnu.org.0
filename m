Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 220794FD54
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Jun 2019 19:32:06 +0200 (CEST)
Received: from localhost ([::1]:45994 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hf6LV-0007tx-9B
	for lists+qemu-devel@lfdr.de; Sun, 23 Jun 2019 13:32:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34335)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hf5wk-0001o7-QM
 for qemu-devel@nongnu.org; Sun, 23 Jun 2019 13:06:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hf5wg-0004rA-Mx
 for qemu-devel@nongnu.org; Sun, 23 Jun 2019 13:06:28 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:41133 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hf5wZ-0004Ja-E1
 for qemu-devel@nongnu.org; Sun, 23 Jun 2019 13:06:22 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id B5C001A1E02;
 Sun, 23 Jun 2019 19:05:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 84D531A1D85;
 Sun, 23 Jun 2019 19:05:45 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Sun, 23 Jun 2019 19:04:45 +0200
Message-Id: <1561309489-16146-13-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561309489-16146-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1561309489-16146-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v5 12/16] tcg/ppc: Support vector multiply
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
Cc: richard.henderson@linaro.org,
 "David Gibson --cc=amarkovic @ wavecomp . com"
 <david@gibson.dropbear.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, hsp.cat7@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

For Altivec, this is always an expansion.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 tcg/ppc/tcg-target.h     |   2 +-
 tcg/ppc/tcg-target.inc.c | 112 ++++++++++++++++++++++++++++++++++++++++++++++-
 tcg/ppc/tcg-target.opc.h |   8 ++++
 3 files changed, 120 insertions(+), 2 deletions(-)

diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index 766706f..a130192 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -154,7 +154,7 @@ extern bool have_isa_3_00;
 #define TCG_TARGET_HAS_shs_vec          0
 #define TCG_TARGET_HAS_shv_vec          1
 #define TCG_TARGET_HAS_cmp_vec          1
-#define TCG_TARGET_HAS_mul_vec          0
+#define TCG_TARGET_HAS_mul_vec          1
 #define TCG_TARGET_HAS_sat_vec          1
 #define TCG_TARGET_HAS_minmax_vec       1
 #define TCG_TARGET_HAS_bitsel_vec       0
diff --git a/tcg/ppc/tcg-target.inc.c b/tcg/ppc/tcg-target.inc.c
index 3eb18cb..3005c51 100644
--- a/tcg/ppc/tcg-target.inc.c
+++ b/tcg/ppc/tcg-target.inc.c
@@ -526,6 +526,25 @@ static int tcg_target_const_match(tcg_target_long val, TCGType type,
 #define VSRAB      VX4(772)
 #define VSRAH      VX4(836)
 #define VSRAW      VX4(900)
+#define VRLB       VX4(4)
+#define VRLH       VX4(68)
+#define VRLW       VX4(132)
+
+#define VMULEUB    VX4(520)
+#define VMULEUH    VX4(584)
+#define VMULOUB    VX4(8)
+#define VMULOUH    VX4(72)
+#define VMSUMUHM   VX4(38)
+
+#define VMRGHB     VX4(12)
+#define VMRGHH     VX4(76)
+#define VMRGHW     VX4(140)
+#define VMRGLB     VX4(268)
+#define VMRGLH     VX4(332)
+#define VMRGLW     VX4(396)
+
+#define VPKUHUM    VX4(14)
+#define VPKUWUM    VX4(78)
 
 #define VAND       VX4(1028)
 #define VANDC      VX4(1092)
@@ -2876,6 +2895,7 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_sarv_vec:
         return vece <= MO_32;
     case INDEX_op_cmp_vec:
+    case INDEX_op_mul_vec:
     case INDEX_op_shli_vec:
     case INDEX_op_shri_vec:
     case INDEX_op_sari_vec:
@@ -2989,7 +3009,13 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         smax_op[4] = { VMAXSB, VMAXSH, VMAXSW, 0 },
         shlv_op[4] = { VSLB, VSLH, VSLW, 0 },
         shrv_op[4] = { VSRB, VSRH, VSRW, 0 },
-        sarv_op[4] = { VSRAB, VSRAH, VSRAW, 0 };
+        sarv_op[4] = { VSRAB, VSRAH, VSRAW, 0 },
+        mrgh_op[4] = { VMRGHB, VMRGHH, VMRGHW, 0 },
+        mrgl_op[4] = { VMRGLB, VMRGLH, VMRGLW, 0 },
+        muleu_op[4] = { VMULEUB, VMULEUH, 0, 0 },
+        mulou_op[4] = { VMULOUB, VMULOUH, 0, 0 },
+        pkum_op[4] = { VPKUHUM, VPKUWUM, 0, 0 },
+        rotl_op[4] = { VRLB, VRLH, VRLW, 0 };
 
     TCGType type = vecl + TCG_TYPE_V64;
     TCGArg a0 = args[0], a1 = args[1], a2 = args[2];
@@ -3078,6 +3104,29 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
+    case INDEX_op_ppc_mrgh_vec:
+        insn = mrgh_op[vece];
+        break;
+    case INDEX_op_ppc_mrgl_vec:
+        insn = mrgl_op[vece];
+        break;
+    case INDEX_op_ppc_muleu_vec:
+        insn = muleu_op[vece];
+        break;
+    case INDEX_op_ppc_mulou_vec:
+        insn = mulou_op[vece];
+        break;
+    case INDEX_op_ppc_pkum_vec:
+        insn = pkum_op[vece];
+        break;
+    case INDEX_op_ppc_rotl_vec:
+        insn = rotl_op[vece];
+        break;
+    case INDEX_op_ppc_msum_vec:
+        tcg_debug_assert(vece == MO_16);
+        tcg_out32(s, VMSUMUHM | VRT(a0) | VRA(a1) | VRB(a2) | VRC(args[3]));
+        return;
+
     case INDEX_op_mov_vec:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_dupi_vec: /* Always emitted via tcg_out_movi.  */
     case INDEX_op_dup_vec:  /* Always emitted via tcg_out_dup_vec.  */
@@ -3147,6 +3196,53 @@ static void expand_vec_cmp(TCGType type, unsigned vece, TCGv_vec v0,
     }
 }
 
+static void expand_vec_mul(TCGType type, unsigned vece, TCGv_vec v0,
+                           TCGv_vec v1, TCGv_vec v2)
+{
+    TCGv_vec t1 = tcg_temp_new_vec(type);
+    TCGv_vec t2 = tcg_temp_new_vec(type);
+    TCGv_vec t3, t4;
+
+    switch (vece) {
+    case MO_8:
+    case MO_16:
+        vec_gen_3(INDEX_op_ppc_muleu_vec, type, vece, tcgv_vec_arg(t1),
+                  tcgv_vec_arg(v1), tcgv_vec_arg(v2));
+        vec_gen_3(INDEX_op_ppc_mulou_vec, type, vece, tcgv_vec_arg(t2),
+                  tcgv_vec_arg(v1), tcgv_vec_arg(v2));
+        vec_gen_3(INDEX_op_ppc_mrgh_vec, type, vece + 1, tcgv_vec_arg(v0),
+                  tcgv_vec_arg(t1), tcgv_vec_arg(t2));
+        vec_gen_3(INDEX_op_ppc_mrgl_vec, type, vece + 1, tcgv_vec_arg(t1),
+                  tcgv_vec_arg(t1), tcgv_vec_arg(t2));
+        vec_gen_3(INDEX_op_ppc_pkum_vec, type, vece, tcgv_vec_arg(v0),
+                  tcgv_vec_arg(v0), tcgv_vec_arg(t1));
+	break;
+
+    case MO_32:
+        t3 = tcg_temp_new_vec(type);
+        t4 = tcg_temp_new_vec(type);
+        tcg_gen_dupi_vec(MO_8, t4, -16);
+        vec_gen_3(INDEX_op_ppc_rotl_vec, type, MO_32, tcgv_vec_arg(t1),
+                  tcgv_vec_arg(v2), tcgv_vec_arg(t4));
+        vec_gen_3(INDEX_op_ppc_mulou_vec, type, MO_16, tcgv_vec_arg(t2),
+                  tcgv_vec_arg(v1), tcgv_vec_arg(v2));
+        tcg_gen_dupi_vec(MO_8, t3, 0);
+        vec_gen_4(INDEX_op_ppc_msum_vec, type, MO_16, tcgv_vec_arg(t3),
+                  tcgv_vec_arg(v1), tcgv_vec_arg(t1), tcgv_vec_arg(t3));
+        vec_gen_3(INDEX_op_shlv_vec, type, MO_32, tcgv_vec_arg(t3),
+                  tcgv_vec_arg(t3), tcgv_vec_arg(t4));
+        tcg_gen_add_vec(MO_32, v0, t2, t3);
+        tcg_temp_free_vec(t3);
+        tcg_temp_free_vec(t4);
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
+    tcg_temp_free_vec(t1);
+    tcg_temp_free_vec(t2);
+}
+
 void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
                        TCGArg a0, ...)
 {
@@ -3173,6 +3269,10 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
         v2 = temp_tcgv_vec(arg_temp(a2));
         expand_vec_cmp(type, vece, v0, v1, v2, va_arg(va, TCGArg));
         break;
+    case INDEX_op_mul_vec:
+        v2 = temp_tcgv_vec(arg_temp(a2));
+        expand_vec_mul(type, vece, v0, v1, v2);
+        break;
     default:
         g_assert_not_reached();
     }
@@ -3219,6 +3319,8 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     static const TCGTargetOpDef v_r = { .args_ct_str = { "v", "r" } };
     static const TCGTargetOpDef v_v = { .args_ct_str = { "v", "v" } };
     static const TCGTargetOpDef v_v_v = { .args_ct_str = { "v", "v", "v" } };
+    static const TCGTargetOpDef v_v_v_v
+        = { .args_ct_str = { "v", "v", "v", "v" } };
 
     switch (op) {
     case INDEX_op_goto_ptr:
@@ -3374,6 +3476,12 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_shlv_vec:
     case INDEX_op_shrv_vec:
     case INDEX_op_sarv_vec:
+    case INDEX_op_ppc_mrgh_vec:
+    case INDEX_op_ppc_mrgl_vec:
+    case INDEX_op_ppc_muleu_vec:
+    case INDEX_op_ppc_mulou_vec:
+    case INDEX_op_ppc_pkum_vec:
+    case INDEX_op_ppc_rotl_vec:
         return &v_v_v;
     case INDEX_op_not_vec:
     case INDEX_op_dup_vec:
@@ -3382,6 +3490,8 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_st_vec:
     case INDEX_op_dupm_vec:
         return &v_r;
+    case INDEX_op_ppc_msum_vec:
+        return &v_v_v_v;
 
     default:
         return NULL;
diff --git a/tcg/ppc/tcg-target.opc.h b/tcg/ppc/tcg-target.opc.h
index 4816a6c..5c6a5ad 100644
--- a/tcg/ppc/tcg-target.opc.h
+++ b/tcg/ppc/tcg-target.opc.h
@@ -1,3 +1,11 @@
 /* Target-specific opcodes for host vector expansion.  These will be
    emitted by tcg_expand_vec_op.  For those familiar with GCC internals,
    consider these to be UNSPEC with names.  */
+
+DEF(ppc_mrgh_vec, 1, 2, 0, IMPLVEC)
+DEF(ppc_mrgl_vec, 1, 2, 0, IMPLVEC)
+DEF(ppc_msum_vec, 1, 3, 0, IMPLVEC)
+DEF(ppc_muleu_vec, 1, 2, 0, IMPLVEC)
+DEF(ppc_mulou_vec, 1, 2, 0, IMPLVEC)
+DEF(ppc_pkum_vec, 1, 2, 0, IMPLVEC)
+DEF(ppc_rotl_vec, 1, 2, 0, IMPLVEC)
-- 
2.7.4


