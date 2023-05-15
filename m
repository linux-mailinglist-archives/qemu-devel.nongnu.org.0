Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A584E70302F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:42:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZLJ-0007Zm-CH; Mon, 15 May 2023 10:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZK2-0005g4-FE
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:37:10 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJq-00061T-Eb
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:37:10 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1aaf7067647so87347815ad.0
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161417; x=1686753417;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t0lfTBvzVqVW4zHYDuaTXpybGovORRKOOKd48jLLK6c=;
 b=aQZUWQbvFyuWihDuBSGU/9c+q/rSVEP49EE8f6t1AAyIHHCJM7TqE5M6g1Z/pWGOVt
 /NVVgl7ISyFBRDwfFo9gurTg3tuUGtBOj9PzQUWlqVxD/+WLlhccPGkFSyiM4/lAQrM0
 IecF0p8a+DSk7Pk0X7N+ykW9Tl/sPwFAxeo1F3yUEmvwnOf/nhvHFBWldJ1wrl69Ug3C
 cGtkfwXM6VAG+LINiH/ahoEhytY/f9O0WFGhgWP6PiihlnJ+YQ9iCPpgplATxCBj979K
 Wg1SaVURAWV1061lA8fXbfVxWOPis35Wu62VowfyUg7yDDFHcp+sh37XNL1gqsFtTlgq
 kMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161417; x=1686753417;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t0lfTBvzVqVW4zHYDuaTXpybGovORRKOOKd48jLLK6c=;
 b=ZpG7QD/icE1wTbbhl30/GcUVn4N50sAJGBaWkY8OTGW6curIGGFBxqn0nEEtLJW4Nu
 Yux5Rm0zYWj1mEDaqhuwI/PPIfDT8DzszW4n8eYk8Xp+mjHb4Q6w5JECO60hg2QWSwVk
 StuPhmOdLDb8clZ/XfKrdqp35FZKP4mmCm/8bNlgIi1DrIkxvQNBuFigcdc3GT9kra72
 u9B7WjiMzcCKm+fpwI427po/+Sfod7/6wFOOXbitnbf4HcgR/TZ4D7gyTQ/DzHuKNn61
 kpPz6Fc3uYulCWPrp3u2VVvOD3IKL8RETRKA8TECM6JWumPO8fgm+YL0ia89Xg3zmbKH
 w54w==
X-Gm-Message-State: AC+VfDzjOOfHqCt9ltSMOefr0mATl8IMRc1iym01aANXSFxjuOmhyr3f
 P2NrSlVNqSR7T0qxfOX3vg9XCkDVLJzQIkhbHE0=
X-Google-Smtp-Source: ACHHUZ5X7+PPGYyo3z/f7GaYEZyiAG8Fp9ASxkh4MLFiJUfUmIAW0XhWNK3uNdClP6a3Yeh0DRVYXg==
X-Received: by 2002:a17:902:6ac3:b0:1ac:93ba:a5ec with SMTP id
 i3-20020a1709026ac300b001ac93baa5ecmr21115909plt.52.1684161417151; 
 Mon, 15 May 2023 07:36:57 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a1709026ac600b001aadfdfcd06sm8942735plt.299.2023.05.15.07.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:36:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 50/54] tcg/i386: Support 128-bit load/store with
 have_atomic16
Date: Mon, 15 May 2023 07:33:09 -0700
Message-Id: <20230515143313.734053-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.h     |   3 +-
 tcg/i386/tcg-target.c.inc | 181 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 180 insertions(+), 4 deletions(-)

diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 943af6775e..7f69997e30 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -194,7 +194,8 @@ extern bool have_atomic16;
 #define TCG_TARGET_HAS_qemu_st8_i32     1
 #endif
 
-#define TCG_TARGET_HAS_qemu_ldst_i128   0
+#define TCG_TARGET_HAS_qemu_ldst_i128 \
+    (TCG_TARGET_REG_BITS == 64 && have_atomic16)
 
 /* We do not support older SSE systems, only beginning with AVX1.  */
 #define TCG_TARGET_HAS_v64              have_avx1
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 0415ca2a4c..390f126dc8 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -91,6 +91,8 @@ static const int tcg_target_reg_alloc_order[] = {
 #endif
 };
 
+#define TCG_TMP_VEC  TCG_REG_XMM5
+
 static const int tcg_target_call_iarg_regs[] = {
 #if TCG_TARGET_REG_BITS == 64
 #if defined(_WIN64)
@@ -347,6 +349,8 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_PCMPGTW     (0x65 | P_EXT | P_DATA16)
 #define OPC_PCMPGTD     (0x66 | P_EXT | P_DATA16)
 #define OPC_PCMPGTQ     (0x37 | P_EXT38 | P_DATA16)
+#define OPC_PEXTRD      (0x16 | P_EXT3A | P_DATA16)
+#define OPC_PINSRD      (0x22 | P_EXT3A | P_DATA16)
 #define OPC_PMAXSB      (0x3c | P_EXT38 | P_DATA16)
 #define OPC_PMAXSW      (0xee | P_EXT | P_DATA16)
 #define OPC_PMAXSD      (0x3d | P_EXT38 | P_DATA16)
@@ -1783,7 +1787,21 @@ typedef struct {
 
 bool tcg_target_has_memory_bswap(MemOp memop)
 {
-    return have_movbe;
+    TCGAtomAlign aa;
+
+    if (!have_movbe) {
+        return false;
+    }
+    if ((memop & MO_SIZE) <= MO_64) {
+        return true;
+    }
+
+    /*
+     * Reject 16-byte memop with 16-byte atomicity, i.e. VMOVDQA,
+     * but do allow a pair of 64-bit operations, i.e. MOVBEQ.
+     */
+    aa = atom_and_align_for_opc(tcg_ctx, memop, MO_ATOM_IFALIGN, true);
+    return aa.atom <= MO_64;
 }
 
 /*
@@ -1811,6 +1829,30 @@ static const TCGLdstHelperParam ldst_helper_param = {
 static const TCGLdstHelperParam ldst_helper_param = { };
 #endif
 
+static void tcg_out_vec_to_pair(TCGContext *s, TCGType type,
+                                TCGReg l, TCGReg h, TCGReg v)
+{
+    int rexw = type == TCG_TYPE_I32 ? 0 : P_REXW;
+
+    /* vpmov{d,q} %v, %l */
+    tcg_out_vex_modrm(s, OPC_MOVD_EyVy + rexw, v, 0, l);
+    /* vpextr{d,q} $1, %v, %h */
+    tcg_out_vex_modrm(s, OPC_PEXTRD + rexw, v, 0, h);
+    tcg_out8(s, 1);
+}
+
+static void tcg_out_pair_to_vec(TCGContext *s, TCGType type,
+                                TCGReg v, TCGReg l, TCGReg h)
+{
+    int rexw = type == TCG_TYPE_I32 ? 0 : P_REXW;
+
+    /* vmov{d,q} %l, %v */
+    tcg_out_vex_modrm(s, OPC_MOVD_VyEy + rexw, v, 0, l);
+    /* vpinsr{d,q} $1, %h, %v, %v */
+    tcg_out_vex_modrm(s, OPC_PINSRD + rexw, v, v, h);
+    tcg_out8(s, 1);
+}
+
 /*
  * Generate code for the slow path for a load at the end of block
  */
@@ -1900,6 +1942,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
+    MemOp s_bits = opc & MO_SIZE;
     unsigned a_mask;
 
 #ifdef CONFIG_SOFTMMU
@@ -1910,7 +1953,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     *h = x86_guest_base;
 #endif
     h->base = addrlo;
-    h->aa = atom_and_align_for_opc(s, opc, MO_ATOM_IFALIGN, false);
+    h->aa = atom_and_align_for_opc(s, opc, MO_ATOM_IFALIGN, s_bits == MO_128);
     a_mask = (1 << h->aa.align) - 1;
 
 #ifdef CONFIG_SOFTMMU
@@ -1920,7 +1963,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     TCGType tlbtype = TCG_TYPE_I32;
     int trexw = 0, hrexw = 0, tlbrexw = 0;
     unsigned mem_index = get_mmuidx(oi);
-    unsigned s_bits = opc & MO_SIZE;
     unsigned s_mask = (1 << s_bits) - 1;
     target_ulong tlb_mask;
 
@@ -2115,6 +2157,69 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
                                      h.base, h.index, 0, h.ofs + 4);
         }
         break;
+
+    case MO_128:
+        {
+            TCGLabel *l1 = NULL, *l2 = NULL;
+            bool use_pair = h.aa.atom < MO_128;
+
+            tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+
+            if (!use_pair) {
+                tcg_debug_assert(!use_movbe);
+                /*
+                 * Atomicity requires that we use use VMOVDQA.
+                 * If we've already checked for 16-byte alignment, that's all
+                 * we need.  If we arrive here with lesser alignment, then we
+                 * have determined that less than 16-byte alignment can be
+                 * satisfied with two 8-byte loads.
+                 */
+                if (h.aa.align < MO_128) {
+                    use_pair = true;
+                    l1 = gen_new_label();
+                    l2 = gen_new_label();
+
+                    tcg_out_testi(s, h.base, 15);
+                    tcg_out_jxx(s, JCC_JNE, l2, true);
+                }
+
+                tcg_out_vex_modrm_sib_offset(s, OPC_MOVDQA_VxWx + h.seg,
+                                             TCG_TMP_VEC, 0,
+                                             h.base, h.index, 0, h.ofs);
+                tcg_out_vec_to_pair(s, TCG_TYPE_I64, datalo,
+                                    datahi, TCG_TMP_VEC);
+
+                if (use_pair) {
+                    tcg_out_jxx(s, JCC_JMP, l1, true);
+                    tcg_out_label(s, l2);
+                }
+            }
+            if (use_pair) {
+                if (use_movbe) {
+                    TCGReg t = datalo;
+                    datalo = datahi;
+                    datahi = t;
+                }
+                if (h.base == datalo || h.index == datalo) {
+                    tcg_out_modrm_sib_offset(s, OPC_LEA, datahi,
+                                             h.base, h.index, 0, h.ofs);
+                    tcg_out_modrm_offset(s, movop + P_REXW + h.seg,
+                                         datalo, datahi, 0);
+                    tcg_out_modrm_offset(s, movop + P_REXW + h.seg,
+                                         datahi, datahi, 8);
+                } else {
+                    tcg_out_modrm_sib_offset(s, movop + P_REXW + h.seg, datalo,
+                                             h.base, h.index, 0, h.ofs);
+                    tcg_out_modrm_sib_offset(s, movop + P_REXW + h.seg, datahi,
+                                             h.base, h.index, 0, h.ofs + 8);
+                }
+            }
+            if (l1) {
+                tcg_out_label(s, l1);
+            }
+        }
+        break;
+
     default:
         g_assert_not_reached();
     }
@@ -2200,6 +2305,60 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
                                      h.base, h.index, 0, h.ofs + 4);
         }
         break;
+
+    case MO_128:
+        {
+            TCGLabel *l1 = NULL, *l2 = NULL;
+            bool use_pair = h.aa.atom < MO_128;
+
+            tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+
+            if (!use_pair) {
+                tcg_debug_assert(!use_movbe);
+                /*
+                 * Atomicity requires that we use use VMOVDQA.
+                 * If we've already checked for 16-byte alignment, that's all
+                 * we need.  If we arrive here with lesser alignment, then we
+                 * have determined that less that 16-byte alignment can be
+                 * satisfied with two 8-byte loads.
+                 */
+                if (h.aa.align < MO_128) {
+                    use_pair = true;
+                    l1 = gen_new_label();
+                    l2 = gen_new_label();
+
+                    tcg_out_testi(s, h.base, 15);
+                    tcg_out_jxx(s, JCC_JNE, l2, true);
+                }
+
+                tcg_out_pair_to_vec(s, TCG_TYPE_I64, TCG_TMP_VEC,
+                                    datalo, datahi);
+                tcg_out_vex_modrm_sib_offset(s, OPC_MOVDQA_WxVx + h.seg,
+                                             TCG_TMP_VEC, 0,
+                                             h.base, h.index, 0, h.ofs);
+
+                if (use_pair) {
+                    tcg_out_jxx(s, JCC_JMP, l1, true);
+                    tcg_out_label(s, l2);
+                }
+            }
+            if (use_pair) {
+                if (use_movbe) {
+                    TCGReg t = datalo;
+                    datalo = datahi;
+                    datahi = t;
+                }
+                tcg_out_modrm_sib_offset(s, movop + P_REXW + h.seg, datalo,
+                                         h.base, h.index, 0, h.ofs);
+                tcg_out_modrm_sib_offset(s, movop + P_REXW + h.seg, datahi,
+                                         h.base, h.index, 0, h.ofs + 8);
+            }
+            if (l1) {
+                tcg_out_label(s, l1);
+            }
+        }
+        break;
+
     default:
         g_assert_not_reached();
     }
@@ -2523,6 +2682,10 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
             tcg_out_qemu_ld(s, a0, a1, a2, args[3], args[4], TCG_TYPE_I64);
         }
         break;
+    case INDEX_op_qemu_ld_i128:
+        tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+        tcg_out_qemu_ld(s, a0, a1, a2, -1, args[3], TCG_TYPE_I128);
+        break;
     case INDEX_op_qemu_st_i32:
     case INDEX_op_qemu_st8_i32:
         if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
@@ -2540,6 +2703,10 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
             tcg_out_qemu_st(s, a0, a1, a2, args[3], args[4], TCG_TYPE_I64);
         }
         break;
+    case INDEX_op_qemu_st_i128:
+        tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+        tcg_out_qemu_st(s, a0, a1, a2, -1, args[3], TCG_TYPE_I128);
+        break;
 
     OP_32_64(mulu2):
         tcg_out_modrm(s, OPC_GRP3_Ev + rexw, EXT3_MUL, args[3]);
@@ -3234,6 +3401,13 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
                 : TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? C_O0_I3(L, L, L)
                 : C_O0_I4(L, L, L, L));
 
+    case INDEX_op_qemu_ld_i128:
+        tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+        return C_O2_I1(r, r, L);
+    case INDEX_op_qemu_st_i128:
+        tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+        return C_O0_I3(L, L, L);
+
     case INDEX_op_brcond2_i32:
         return C_O0_I4(r, r, ri, ri);
 
@@ -4090,6 +4264,7 @@ static void tcg_target_init(TCGContext *s)
 
     s->reserved_regs = 0;
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_CALL_STACK);
+    tcg_regset_set_reg(s->reserved_regs, TCG_TMP_VEC);
 #ifdef _WIN64
     /* These are call saved, and we don't save them, so don't use them. */
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM6);
-- 
2.34.1


