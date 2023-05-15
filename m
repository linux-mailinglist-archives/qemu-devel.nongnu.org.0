Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E732A703052
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:43:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZM4-0002LO-9J; Mon, 15 May 2023 10:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZK6-0005tg-GO
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:37:20 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJs-0005yx-VG
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:37:13 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1ab05018381so118708775ad.2
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161420; x=1686753420;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BwdovVLSIJ9sUIX28iM3Bk5pQGlPR2EuvtD4XWozcso=;
 b=toLjq8gXa23rau//UMrLnw38baXSNt94IJiVDgLDLpMgMU7EUu1tTfH1/lz8y727TD
 G+3SnrFnl5w8FqKSP+qQbyAOSSpQVcY0tt+TRmNg4UYZ6VTfy2fT07VVETF6zy7Xn95/
 9O6BNYqJwzD0vbFUV6RCCRw0YYYdCS8W0XN8mSKO01xqmdqIccZMd2I1OXOKa2Kr7p64
 Km53CUmAG+WzwG1NtOoMeX/S/Z7VNLfIm20YyYblN8E5Hll8WdSUH2CMJA0UMfePyIL8
 E+TwNk5QYYZvIfX3ekGJCJc+K8tdF43tCan85HxczgPQCLkcZU8Si4UM4pMX9FkZLkwI
 ZJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161420; x=1686753420;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BwdovVLSIJ9sUIX28iM3Bk5pQGlPR2EuvtD4XWozcso=;
 b=X24tbu5tS28gmaslOu6bclipORtiZNagztoa5zW/kZblVMOu5tZe8jPE6pCtFhy/jM
 8aqZqsWe6JNPlvYBuhWMlAvLdkyj65lG/QcO+ho4TipQWWb7eb9ySu3k1qctZ3anhaQz
 //cFRrKlq9fo6cndXzGxQYKqNV3ThdXVDHoRRTaycEbOiKThPDp2hi+pA1S4Bx3VHhR5
 eRHqyHZgAt+8hdVdxC3DDJtSm64Oh64V134CcoMojQWSzgHNNIBip/sdoJedzHsDoUWj
 mm+Q58ZnSTcolNPfBJ/TPwDKELMjMmZ9V5AVhXWPNWKI/FXSjKjmL4y05qSPiiF/xDBA
 EWJA==
X-Gm-Message-State: AC+VfDxzj8V2E83DJtmKqBOBUcu80l4PKtHOC5M/Jd3QVLIeis1IQ3Gz
 3viCeaQedHoq9d4EbSRSjrclOWwzRQR9+vFzNAI=
X-Google-Smtp-Source: ACHHUZ4kIKllCw8pxKKZVdvaNAx+e3IhNDMINEBTPTcFy1cykfoBLhMiddDF3RRc7zSaBRiCiLYXbw==
X-Received: by 2002:a17:902:e5ce:b0:1ae:e2b:3ad8 with SMTP id
 u14-20020a170902e5ce00b001ae0e2b3ad8mr5885732plf.66.1684161420258; 
 Mon, 15 May 2023 07:37:00 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a1709026ac600b001aadfdfcd06sm8942735plt.299.2023.05.15.07.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:36:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v5 54/54] tcg/s390x: Support 128-bit load/store
Date: Mon, 15 May 2023 07:33:13 -0700
Message-Id: <20230515143313.734053-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

Use LPQ/STPQ when 16-byte atomicity is required.
Note that these instructions require 16-byte alignment.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target-con-set.h |   2 +
 tcg/s390x/tcg-target.h         |   2 +-
 tcg/s390x/tcg-target.c.inc     | 103 ++++++++++++++++++++++++++++++++-
 3 files changed, 103 insertions(+), 4 deletions(-)

diff --git a/tcg/s390x/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
index ecc079bb6d..cbad91b2b5 100644
--- a/tcg/s390x/tcg-target-con-set.h
+++ b/tcg/s390x/tcg-target-con-set.h
@@ -14,6 +14,7 @@ C_O0_I2(r, r)
 C_O0_I2(r, ri)
 C_O0_I2(r, rA)
 C_O0_I2(v, r)
+C_O0_I3(o, m, r)
 C_O1_I1(r, r)
 C_O1_I1(v, r)
 C_O1_I1(v, v)
@@ -36,6 +37,7 @@ C_O1_I2(v, v, v)
 C_O1_I3(v, v, v, v)
 C_O1_I4(r, r, ri, rI, r)
 C_O1_I4(r, r, rA, rI, r)
+C_O2_I1(o, m, r)
 C_O2_I2(o, m, 0, r)
 C_O2_I2(o, m, r, r)
 C_O2_I3(o, m, 0, 1, r)
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 170007bea5..ec96952172 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -140,7 +140,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_muluh_i64      0
 #define TCG_TARGET_HAS_mulsh_i64      0
 
-#define TCG_TARGET_HAS_qemu_ldst_i128 0
+#define TCG_TARGET_HAS_qemu_ldst_i128 1
 
 #define TCG_TARGET_HAS_v64            HAVE_FACILITY(VECTOR)
 #define TCG_TARGET_HAS_v128           HAVE_FACILITY(VECTOR)
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 8e34b214fc..835daa51fa 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -243,6 +243,7 @@ typedef enum S390Opcode {
     RXY_LLGF    = 0xe316,
     RXY_LLGH    = 0xe391,
     RXY_LMG     = 0xeb04,
+    RXY_LPQ     = 0xe38f,
     RXY_LRV     = 0xe31e,
     RXY_LRVG    = 0xe30f,
     RXY_LRVH    = 0xe31f,
@@ -253,6 +254,7 @@ typedef enum S390Opcode {
     RXY_STG     = 0xe324,
     RXY_STHY    = 0xe370,
     RXY_STMG    = 0xeb24,
+    RXY_STPQ    = 0xe38e,
     RXY_STRV    = 0xe33e,
     RXY_STRVG   = 0xe32f,
     RXY_STRVH   = 0xe33f,
@@ -1577,7 +1579,18 @@ typedef struct {
 
 bool tcg_target_has_memory_bswap(MemOp memop)
 {
-    return true;
+    TCGAtomAlign aa;
+
+    if ((memop & MO_SIZE) <= MO_64) {
+        return true;
+    }
+
+    /*
+     * Reject 16-byte memop with 16-byte atomicity,
+     * but do allow a pair of 64-bit operations.
+     */
+    aa = atom_and_align_for_opc(tcg_ctx, memop, MO_ATOM_IFALIGN, true);
+    return aa.atom <= MO_64;
 }
 
 static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg data,
@@ -1734,13 +1747,13 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
+    MemOp s_bits = opc & MO_SIZE;
     unsigned a_mask;
 
-    h->aa = atom_and_align_for_opc(s, opc, MO_ATOM_IFALIGN, false);
+    h->aa = atom_and_align_for_opc(s, opc, MO_ATOM_IFALIGN, s_bits == MO_128);
     a_mask = (1 << h->aa.align) - 1;
 
 #ifdef CONFIG_SOFTMMU
-    unsigned s_bits = opc & MO_SIZE;
     unsigned s_mask = (1 << s_bits) - 1;
     int mem_index = get_mmuidx(oi);
     int fast_off = TLB_MASK_TABLE_OFS(mem_index);
@@ -1865,6 +1878,80 @@ static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
     }
 }
 
+static void tcg_out_qemu_ldst_i128(TCGContext *s, TCGReg datalo, TCGReg datahi,
+                                   TCGReg addr_reg, MemOpIdx oi, bool is_ld)
+{
+    TCGLabel *l1 = NULL, *l2 = NULL;
+    TCGLabelQemuLdst *ldst;
+    HostAddress h;
+    bool need_bswap;
+    bool use_pair;
+    S390Opcode insn;
+
+    ldst = prepare_host_addr(s, &h, addr_reg, oi, is_ld);
+
+    use_pair = h.aa.atom < MO_128;
+    need_bswap = get_memop(oi) & MO_BSWAP;
+
+    if (!use_pair) {
+        /*
+         * Atomicity requires we use LPQ.  If we've already checked for
+         * 16-byte alignment, that's all we need.  If we arrive with
+         * lesser alignment, we have determined that less than 16-byte
+         * alignment can be satisfied with two 8-byte loads.
+         */
+        if (h.aa.align < MO_128) {
+            use_pair = true;
+            l1 = gen_new_label();
+            l2 = gen_new_label();
+
+            tcg_out_insn(s, RI, TMLL, addr_reg, 15);
+            tgen_branch(s, 7, l1); /* CC in {1,2,3} */
+        }
+
+        tcg_debug_assert(!need_bswap);
+        tcg_debug_assert(datalo & 1);
+        tcg_debug_assert(datahi == datalo - 1);
+        insn = is_ld ? RXY_LPQ : RXY_STPQ;
+        tcg_out_insn_RXY(s, insn, datahi, h.base, h.index, h.disp);
+
+        if (use_pair) {
+            tgen_branch(s, S390_CC_ALWAYS, l2);
+            tcg_out_label(s, l1);
+        }
+    }
+    if (use_pair) {
+        TCGReg d1, d2;
+
+        if (need_bswap) {
+            d1 = datalo, d2 = datahi;
+            insn = is_ld ? RXY_LRVG : RXY_STRVG;
+        } else {
+            d1 = datahi, d2 = datalo;
+            insn = is_ld ? RXY_LG : RXY_STG;
+        }
+
+        if (h.base == d1 || h.index == d1) {
+            tcg_out_insn(s, RXY, LAY, TCG_TMP0, h.base, h.index, h.disp);
+            h.base = TCG_TMP0;
+            h.index = TCG_REG_NONE;
+            h.disp = 0;
+        }
+        tcg_out_insn_RXY(s, insn, d1, h.base, h.index, h.disp);
+        tcg_out_insn_RXY(s, insn, d2, h.base, h.index, h.disp + 8);
+    }
+    if (l2) {
+        tcg_out_label(s, l2);
+    }
+
+    if (ldst) {
+        ldst->type = TCG_TYPE_I128;
+        ldst->datalo_reg = datalo;
+        ldst->datahi_reg = datahi;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
+    }
+}
+
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
 {
     /* Reuse the zeroing that exists for goto_ptr.  */
@@ -2222,6 +2309,12 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_qemu_st_i64:
         tcg_out_qemu_st(s, args[0], args[1], args[2], TCG_TYPE_I64);
         break;
+    case INDEX_op_qemu_ld_i128:
+        tcg_out_qemu_ldst_i128(s, args[0], args[1], args[2], args[3], true);
+        break;
+    case INDEX_op_qemu_st_i128:
+        tcg_out_qemu_ldst_i128(s, args[0], args[1], args[2], args[3], false);
+        break;
 
     case INDEX_op_ld16s_i64:
         tcg_out_mem(s, 0, RXY_LGH, args[0], args[1], TCG_REG_NONE, args[2]);
@@ -3099,6 +3192,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_qemu_st_i64:
     case INDEX_op_qemu_st_i32:
         return C_O0_I2(r, r);
+    case INDEX_op_qemu_ld_i128:
+        return C_O2_I1(o, m, r);
+    case INDEX_op_qemu_st_i128:
+        return C_O0_I3(o, m, r);
 
     case INDEX_op_deposit_i32:
     case INDEX_op_deposit_i64:
-- 
2.34.1


