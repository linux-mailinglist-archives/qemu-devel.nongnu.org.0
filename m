Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC1F4FD4B
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Jun 2019 19:24:02 +0200 (CEST)
Received: from localhost ([::1]:45890 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hf6Dg-0006vH-H5
	for lists+qemu-devel@lfdr.de; Sun, 23 Jun 2019 13:24:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34160)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hf5wM-0001dD-Qk
 for qemu-devel@nongnu.org; Sun, 23 Jun 2019 13:06:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hf5wK-0004Gw-7v
 for qemu-devel@nongnu.org; Sun, 23 Jun 2019 13:06:06 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:41121 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hf5wJ-0004FB-Oe
 for qemu-devel@nongnu.org; Sun, 23 Jun 2019 13:06:04 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id E6B241A1D6C;
 Sun, 23 Jun 2019 19:05:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id C05131A1D64;
 Sun, 23 Jun 2019 19:05:27 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Sun, 23 Jun 2019 19:04:38 +0200
Message-Id: <1561309489-16146-6-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561309489-16146-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1561309489-16146-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v5 05/16] tcg/ppc: Add support for
 load/store/logic/comparison
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

Add various bits and peaces related mostly to load and store
operations. In that context, logic, compare, and splat Altivec
instructions are used, and, therefore, the support for emitting
them is included in this patch too.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 tcg/ppc/tcg-target.h     |   6 +-
 tcg/ppc/tcg-target.inc.c | 506 ++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 484 insertions(+), 28 deletions(-)

diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index f6283f4..b66a808 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -145,15 +145,15 @@ extern bool have_isa_3_00;
 #define TCG_TARGET_HAS_v128             have_isa_altivec
 #define TCG_TARGET_HAS_v256             0
 
-#define TCG_TARGET_HAS_andc_vec         0
+#define TCG_TARGET_HAS_andc_vec         1
 #define TCG_TARGET_HAS_orc_vec          0
-#define TCG_TARGET_HAS_not_vec          0
+#define TCG_TARGET_HAS_not_vec          1
 #define TCG_TARGET_HAS_neg_vec          0
 #define TCG_TARGET_HAS_abs_vec          0
 #define TCG_TARGET_HAS_shi_vec          0
 #define TCG_TARGET_HAS_shs_vec          0
 #define TCG_TARGET_HAS_shv_vec          0
-#define TCG_TARGET_HAS_cmp_vec          0
+#define TCG_TARGET_HAS_cmp_vec          1
 #define TCG_TARGET_HAS_mul_vec          0
 #define TCG_TARGET_HAS_sat_vec          0
 #define TCG_TARGET_HAS_minmax_vec       0
diff --git a/tcg/ppc/tcg-target.inc.c b/tcg/ppc/tcg-target.inc.c
index 0fe96bf..d3e4557 100644
--- a/tcg/ppc/tcg-target.inc.c
+++ b/tcg/ppc/tcg-target.inc.c
@@ -233,6 +233,10 @@ static const char *target_parse_constraint(TCGArgConstraint *ct,
         ct->ct |= TCG_CT_REG;
         ct->u.regs = 0xffffffff;
         break;
+    case 'v':
+        ct->ct |= TCG_CT_REG;
+        ct->u.regs = 0xffffffff00000000ull;
+        break;
     case 'L':                   /* qemu_ld constraint */
         ct->ct |= TCG_CT_REG;
         ct->u.regs = 0xffffffff;
@@ -462,6 +466,39 @@ static int tcg_target_const_match(tcg_target_long val, TCGType type,
 
 #define NOP    ORI  /* ori 0,0,0 */
 
+#define LVX        XO31(103)
+#define LVEBX      XO31(7)
+#define LVEHX      XO31(39)
+#define LVEWX      XO31(71)
+
+#define STVX       XO31(231)
+#define STVEWX     XO31(199)
+
+#define VCMPEQUB   VX4(6)
+#define VCMPEQUH   VX4(70)
+#define VCMPEQUW   VX4(134)
+#define VCMPGTSB   VX4(774)
+#define VCMPGTSH   VX4(838)
+#define VCMPGTSW   VX4(902)
+#define VCMPGTUB   VX4(518)
+#define VCMPGTUH   VX4(582)
+#define VCMPGTUW   VX4(646)
+
+#define VAND       VX4(1028)
+#define VANDC      VX4(1092)
+#define VNOR       VX4(1284)
+#define VOR        VX4(1156)
+#define VXOR       VX4(1220)
+
+#define VSPLTB     VX4(524)
+#define VSPLTH     VX4(588)
+#define VSPLTW     VX4(652)
+#define VSPLTISB   VX4(780)
+#define VSPLTISH   VX4(844)
+#define VSPLTISW   VX4(908)
+
+#define VSLDOI     VX4(44)
+
 #define RT(r) ((r)<<21)
 #define RS(r) ((r)<<21)
 #define RA(r) ((r)<<16)
@@ -535,6 +572,8 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
                         intptr_t value, intptr_t addend)
 {
     tcg_insn_unit *target;
+    int16_t lo;
+    int32_t hi;
 
     value += addend;
     target = (tcg_insn_unit *)value;
@@ -556,6 +595,20 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
         }
         *code_ptr = (*code_ptr & ~0xfffc) | (value & 0xfffc);
         break;
+    case R_PPC_ADDR32:
+        /*
+         * We are abusing this relocation type.  Again, this points to
+         * a pair of insns, lis + load.  This is an absolute address
+         * relocation for PPC32 so the lis cannot be removed.
+         */
+        lo = value;
+        hi = value - lo;
+        if (hi + lo != value) {
+            return false;
+        }
+        code_ptr[0] = deposit32(code_ptr[0], 0, 16, hi >> 16);
+        code_ptr[1] = deposit32(code_ptr[1], 0, 16, lo);
+        break;
     default:
         g_assert_not_reached();
     }
@@ -567,9 +620,29 @@ static void tcg_out_mem_long(TCGContext *s, int opi, int opx, TCGReg rt,
 
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 {
-    tcg_debug_assert(TCG_TARGET_REG_BITS == 64 || type == TCG_TYPE_I32);
-    if (ret != arg) {
-        tcg_out32(s, OR | SAB(arg, ret, arg));
+    if (ret == arg) {
+        return true;
+    }
+    switch (type) {
+    case TCG_TYPE_I64:
+        tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+        /* fallthru */
+    case TCG_TYPE_I32:
+        if (ret < 32 && arg < 32) {
+            tcg_out32(s, OR | SAB(arg, ret, arg));
+            break;
+        } else if (ret < 32 || arg < 32) {
+            /* Altivec does not support vector/integer moves.  */
+            return false;
+        }
+        /* fallthru */
+    case TCG_TYPE_V64:
+    case TCG_TYPE_V128:
+        tcg_debug_assert(ret >= 32 && arg >= 32);
+        tcg_out32(s, VOR | VRT(ret) | VRA(arg) | VRB(arg));
+        break;
+    default:
+        g_assert_not_reached();
     }
     return true;
 }
@@ -718,10 +791,76 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
     }
 }
 
-static inline void tcg_out_movi(TCGContext *s, TCGType type, TCGReg ret,
-                                tcg_target_long arg)
+static void tcg_out_dupi_vec(TCGContext *s, TCGType type, TCGReg ret,
+                             tcg_target_long val)
+{
+    uint32_t load_insn;
+    int rel, low;
+    intptr_t add;
+
+    low = (int8_t)val;
+    if (low >= -16 && low < 16) {
+        if (val == (tcg_target_long)dup_const(MO_8, low)) {
+            tcg_out32(s, VSPLTISB | VRT(ret) | ((val & 31) << 16));
+            return;
+        }
+        if (val == (tcg_target_long)dup_const(MO_16, low)) {
+            tcg_out32(s, VSPLTISH | VRT(ret) | ((val & 31) << 16));
+            return;
+        }
+        if (val == (tcg_target_long)dup_const(MO_32, low)) {
+            tcg_out32(s, VSPLTISW | VRT(ret) | ((val & 31) << 16));
+            return;
+        }
+    }
+
+    /*
+     * Otherwise we must load the value from the constant pool.
+     */
+    if (USE_REG_TB) {
+        rel = R_PPC_ADDR16;
+        add = -(intptr_t)s->code_gen_ptr;
+    } else {
+        rel = R_PPC_ADDR32;
+        add = 0;
+    }
+
+    load_insn = LVX | VRT(ret) | RB(TCG_REG_TMP1);
+    if (TCG_TARGET_REG_BITS == 64) {
+        new_pool_l2(s, rel, s->code_ptr, add, val, val);
+    } else {
+        new_pool_l4(s, rel, s->code_ptr, add, val, val, val, val);
+    }
+
+    if (USE_REG_TB) {
+        tcg_out32(s, ADDI | TAI(TCG_REG_TMP1, 0, 0));
+        load_insn |= RA(TCG_REG_TB);
+    } else {
+        tcg_out32(s, ADDIS | TAI(TCG_REG_TMP1, 0, 0));
+        tcg_out32(s, ADDI | TAI(TCG_REG_TMP1, TCG_REG_TMP1, 0));
+    }
+    tcg_out32(s, load_insn);
+}
+
+static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg ret,
+                         tcg_target_long arg)
 {
-    tcg_out_movi_int(s, type, ret, arg, false);
+    switch (type) {
+    case TCG_TYPE_I32:
+    case TCG_TYPE_I64:
+        tcg_debug_assert(ret < 32);
+        tcg_out_movi_int(s, type, ret, arg, false);
+        break;
+
+    case TCG_TYPE_V64:
+    case TCG_TYPE_V128:
+        tcg_debug_assert(ret >= 32);
+        tcg_out_dupi_vec(s, type, ret, arg);
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
 }
 
 static bool mask_operand(uint32_t c, int *mb, int *me)
@@ -874,7 +1013,7 @@ static void tcg_out_mem_long(TCGContext *s, int opi, int opx, TCGReg rt,
     }
 
     /* For unaligned, or very large offsets, use the indexed form.  */
-    if (offset & align || offset != (int32_t)offset) {
+    if (offset & align || offset != (int32_t)offset || opi == 0) {
         if (rs == base) {
             rs = TCG_REG_R0;
         }
@@ -905,32 +1044,96 @@ static void tcg_out_mem_long(TCGContext *s, int opi, int opx, TCGReg rt,
     }
 }
 
-static inline void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret,
-                              TCGReg arg1, intptr_t arg2)
+static void tcg_out_vsldoi(TCGContext *s, TCGReg ret,
+                           TCGReg va, TCGReg vb, int shb)
 {
-    int opi, opx;
+    tcg_out32(s, VSLDOI | VRT(ret) | VRA(va) | VRB(vb) | (shb << 6));
+}
 
-    tcg_debug_assert(TCG_TARGET_REG_BITS == 64 || type == TCG_TYPE_I32);
-    if (type == TCG_TYPE_I32) {
-        opi = LWZ, opx = LWZX;
-    } else {
-        opi = LD, opx = LDX;
+static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret,
+                       TCGReg base, intptr_t offset)
+{
+    int shift;
+
+    switch (type) {
+    case TCG_TYPE_I32:
+        if (ret < 32) {
+            tcg_out_mem_long(s, LWZ, LWZX, ret, base, offset);
+            break;
+        }
+        assert((offset & 3) == 0);
+        tcg_out_mem_long(s, 0, LVEWX, ret & 31, base, offset);
+        shift = (offset - 4) & 0xc;
+        if (shift) {
+            tcg_out_vsldoi(s, ret, ret, ret, shift);
+        }
+        break;
+    case TCG_TYPE_I64:
+        if (ret < 32) {
+            tcg_out_mem_long(s, LD, LDX, ret, base, offset);
+            break;
+        }
+        /* fallthru */
+    case TCG_TYPE_V64:
+        tcg_debug_assert(ret >= 32);
+        assert((offset & 7) == 0);
+        tcg_out_mem_long(s, 0, LVX, ret & 31, base, offset & -16);
+        if (offset & 8) {
+            tcg_out_vsldoi(s, ret, ret, ret, 8);
+        }
+        break;
+    case TCG_TYPE_V128:
+        tcg_debug_assert(ret >= 32);
+        assert((offset & 15) == 0);
+        tcg_out_mem_long(s, 0, LVX, ret & 31, base, offset);
+        break;
+    default:
+        g_assert_not_reached();
     }
-    tcg_out_mem_long(s, opi, opx, ret, arg1, arg2);
 }
 
-static inline void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
-                              TCGReg arg1, intptr_t arg2)
+static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
+                              TCGReg base, intptr_t offset)
 {
-    int opi, opx;
+    int shift;
 
-    tcg_debug_assert(TCG_TARGET_REG_BITS == 64 || type == TCG_TYPE_I32);
-    if (type == TCG_TYPE_I32) {
-        opi = STW, opx = STWX;
-    } else {
-        opi = STD, opx = STDX;
+    switch (type) {
+    case TCG_TYPE_I32:
+        if (arg < 32) {
+            tcg_out_mem_long(s, STW, STWX, arg, base, offset);
+            break;
+        }
+        assert((offset & 3) == 0);
+        shift = (offset - 4) & 0xc;
+        if (shift) {
+            tcg_out_vsldoi(s, TCG_VEC_TMP1, arg, arg, shift);
+            arg = TCG_VEC_TMP1;
+        }
+        tcg_out_mem_long(s, 0, STVEWX, arg & 31, base, offset);
+        break;
+    case TCG_TYPE_I64:
+        if (arg < 32) {
+            tcg_out_mem_long(s, STD, STDX, arg, base, offset);
+            break;
+        }
+        /* fallthru */
+    case TCG_TYPE_V64:
+        tcg_debug_assert(arg >= 32);
+        assert((offset & 7) == 0);
+        if (offset & 8) {
+            tcg_out_vsldoi(s, TCG_VEC_TMP1, arg, arg, 8);
+            arg = TCG_VEC_TMP1;
+        }
+        tcg_out_mem_long(s, 0, STVEWX, arg & 31, base, offset);
+        tcg_out_mem_long(s, 0, STVEWX, arg & 31, base, offset + 4);
+        break;
+    case TCG_TYPE_V128:
+        tcg_debug_assert(arg >= 32);
+        tcg_out_mem_long(s, 0, STVX, arg & 31, base, offset);
+        break;
+    default:
+        g_assert_not_reached();
     }
-    tcg_out_mem_long(s, opi, opx, arg, arg1, arg2);
 }
 
 static inline bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
@@ -2606,6 +2809,241 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     }
 }
 
+int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
+{
+    switch (opc) {
+    case INDEX_op_and_vec:
+    case INDEX_op_or_vec:
+    case INDEX_op_xor_vec:
+    case INDEX_op_andc_vec:
+    case INDEX_op_not_vec:
+        return 1;
+    case INDEX_op_cmp_vec:
+        return vece <= MO_32 ? -1 : 0;
+    default:
+        return 0;
+    }
+}
+
+static bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
+                            TCGReg dst, TCGReg src)
+{
+    tcg_debug_assert(dst >= 32);
+    tcg_debug_assert(src >= 32);
+
+    /*
+     * Recall we use (or emulate) VSX integer loads, so the integer is
+     * right justified within the left (zero-index) double-word.
+     */
+    switch (vece) {
+    case MO_8:
+        tcg_out32(s, VSPLTB | VRT(dst) | VRB(src) | (7 << 16));
+        break;
+    case MO_16:
+        tcg_out32(s, VSPLTH | VRT(dst) | VRB(src) | (3 << 16));
+        break;
+    case MO_32:
+        tcg_out32(s, VSPLTW | VRT(dst) | VRB(src) | (1 << 16));
+        break;
+    case MO_64:
+        tcg_out_vsldoi(s, TCG_VEC_TMP1, src, src, 8);
+        tcg_out_vsldoi(s, dst, TCG_VEC_TMP1, src, 8);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    return true;
+}
+
+static bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
+                             TCGReg out, TCGReg base, intptr_t offset)
+{
+    int elt;
+
+    tcg_debug_assert(out >= 32);
+    out &= 31;
+    switch (vece) {
+    case MO_8:
+        tcg_out_mem_long(s, 0, LVEBX, out, base, offset);
+        elt = extract32(offset, 0, 4);
+#ifndef HOST_WORDS_BIGENDIAN
+        elt ^= 15;
+#endif
+        tcg_out32(s, VSPLTB | VRT(out) | VRB(out) | (elt << 16));
+        break;
+    case MO_16:
+        assert((offset & 1) == 0);
+        tcg_out_mem_long(s, 0, LVEHX, out, base, offset);
+        elt = extract32(offset, 1, 3);
+#ifndef HOST_WORDS_BIGENDIAN
+        elt ^= 7;
+#endif
+        tcg_out32(s, VSPLTH | VRT(out) | VRB(out) | (elt << 16));
+        break;
+    case MO_32:
+        assert((offset & 3) == 0);
+        tcg_out_mem_long(s, 0, LVEWX, out, base, offset);
+        elt = extract32(offset, 2, 2);
+#ifndef HOST_WORDS_BIGENDIAN
+        elt ^= 3;
+#endif
+        tcg_out32(s, VSPLTW | VRT(out) | VRB(out) | (elt << 16));
+        break;
+    case MO_64:
+        assert((offset & 7) == 0);
+        tcg_out_mem_long(s, 0, LVX, out, base, offset & -16);
+        tcg_out_vsldoi(s, TCG_VEC_TMP1, out, out, 8);
+        elt = extract32(offset, 3, 1);
+#ifndef HOST_WORDS_BIGENDIAN
+        elt = !elt;
+#endif
+        if (elt) {
+            tcg_out_vsldoi(s, out, out, TCG_VEC_TMP1, 8);
+        } else {
+            tcg_out_vsldoi(s, out, TCG_VEC_TMP1, out, 8);
+        }
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    return true;
+}
+
+static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
+                           unsigned vecl, unsigned vece,
+                           const TCGArg *args, const int *const_args)
+{
+    static const uint32_t
+        eq_op[4]  = { VCMPEQUB, VCMPEQUH, VCMPEQUW, 0 },
+        gts_op[4] = { VCMPGTSB, VCMPGTSH, VCMPGTSW, 0 },
+        gtu_op[4] = { VCMPGTUB, VCMPGTUH, VCMPGTUW, 0 };
+
+    TCGType type = vecl + TCG_TYPE_V64;
+    TCGArg a0 = args[0], a1 = args[1], a2 = args[2];
+    uint32_t insn;
+
+    switch (opc) {
+    case INDEX_op_ld_vec:
+        tcg_out_ld(s, type, a0, a1, a2);
+        return;
+    case INDEX_op_st_vec:
+        tcg_out_st(s, type, a0, a1, a2);
+        return;
+    case INDEX_op_dupm_vec:
+        tcg_out_dupm_vec(s, type, vece, a0, a1, a2);
+        return;
+
+    case INDEX_op_and_vec:
+        insn = VAND;
+        break;
+    case INDEX_op_or_vec:
+        insn = VOR;
+        break;
+    case INDEX_op_xor_vec:
+        insn = VXOR;
+        break;
+    case INDEX_op_andc_vec:
+        insn = VANDC;
+        break;
+    case INDEX_op_not_vec:
+        insn = VNOR;
+        a2 = a1;
+        break;
+
+    case INDEX_op_cmp_vec:
+        switch (args[3]) {
+        case TCG_COND_EQ:
+            insn = eq_op[vece];
+            break;
+        case TCG_COND_GT:
+            insn = gts_op[vece];
+            break;
+        case TCG_COND_GTU:
+            insn = gtu_op[vece];
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        break;
+
+    case INDEX_op_mov_vec:  /* Always emitted via tcg_out_mov.  */
+    case INDEX_op_dupi_vec: /* Always emitted via tcg_out_movi.  */
+    case INDEX_op_dup_vec:  /* Always emitted via tcg_out_dup_vec.  */
+    default:
+        g_assert_not_reached();
+    }
+
+    tcg_debug_assert(insn != 0);
+    tcg_out32(s, insn | VRT(a0) | VRA(a1) | VRB(a2));
+}
+
+static void expand_vec_cmp(TCGType type, unsigned vece, TCGv_vec v0,
+                           TCGv_vec v1, TCGv_vec v2, TCGCond cond)
+{
+    bool need_swap = false, need_inv = false;
+
+    tcg_debug_assert(vece <= MO_32);
+
+    switch (cond) {
+    case TCG_COND_EQ:
+    case TCG_COND_GT:
+    case TCG_COND_GTU:
+        break;
+    case TCG_COND_NE:
+    case TCG_COND_LE:
+    case TCG_COND_LEU:
+        need_inv = true;
+        break;
+    case TCG_COND_LT:
+    case TCG_COND_LTU:
+        need_swap = true;
+        break;
+    case TCG_COND_GE:
+    case TCG_COND_GEU:
+        need_swap = need_inv = true;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    if (need_inv) {
+        cond = tcg_invert_cond(cond);
+    }
+    if (need_swap) {
+        TCGv_vec t1;
+        t1 = v1, v1 = v2, v2 = t1;
+        cond = tcg_swap_cond(cond);
+    }
+
+    vec_gen_4(INDEX_op_cmp_vec, type, vece, tcgv_vec_arg(v0),
+              tcgv_vec_arg(v1), tcgv_vec_arg(v2), cond);
+
+    if (need_inv) {
+        tcg_gen_not_vec(vece, v0, v0);
+    }
+}
+
+void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
+                       TCGArg a0, ...)
+{
+    va_list va;
+    TCGv_vec v0, v1, v2;
+
+    va_start(va, a0);
+    v0 = temp_tcgv_vec(arg_temp(a0));
+    v1 = temp_tcgv_vec(arg_temp(va_arg(va, TCGArg)));
+    v2 = temp_tcgv_vec(arg_temp(va_arg(va, TCGArg)));
+
+    switch (opc) {
+    case INDEX_op_cmp_vec:
+        expand_vec_cmp(type, vece, v0, v1, v2, va_arg(va, TCGArg));
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    va_end(va);
+}
+
 static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
 {
     static const TCGTargetOpDef r = { .args_ct_str = { "r" } };
@@ -2643,6 +3081,9 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
         = { .args_ct_str = { "r", "r", "r", "r", "rI", "rZM" } };
     static const TCGTargetOpDef sub2
         = { .args_ct_str = { "r", "r", "rI", "rZM", "r", "r" } };
+    static const TCGTargetOpDef v_r = { .args_ct_str = { "v", "r" } };
+    static const TCGTargetOpDef v_v = { .args_ct_str = { "v", "v" } };
+    static const TCGTargetOpDef v_v_v = { .args_ct_str = { "v", "v", "v" } };
 
     switch (op) {
     case INDEX_op_goto_ptr:
@@ -2778,6 +3219,21 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
         return (TCG_TARGET_REG_BITS == 64 ? &S_S
                 : TARGET_LONG_BITS == 32 ? &S_S_S : &S_S_S_S);
 
+    case INDEX_op_and_vec:
+    case INDEX_op_or_vec:
+    case INDEX_op_xor_vec:
+    case INDEX_op_andc_vec:
+    case INDEX_op_orc_vec:
+    case INDEX_op_cmp_vec:
+        return &v_v_v;
+    case INDEX_op_not_vec:
+    case INDEX_op_dup_vec:
+        return &v_v;
+    case INDEX_op_ld_vec:
+    case INDEX_op_st_vec:
+    case INDEX_op_dupm_vec:
+        return &v_r;
+
     default:
         return NULL;
     }
-- 
2.7.4


