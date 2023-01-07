Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CF1660CE9
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 09:05:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE3zT-0003jc-RL; Sat, 07 Jan 2023 02:51:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zG-0003em-K0
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:31 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zE-0004BC-4a
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:30 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 l1-20020a17090a384100b00226f05b9595so2111096pjf.0
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 23:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XYdrzdt2klT5TKJ4GxOu/aIPwEjrlRiXakVQXnV+e/o=;
 b=eYrfWrZTFQHa2Ilz2mekD2964M5jpuo1CvaRxnlvT12Ho+dEviWGazeFhzZERm0FZn
 Y95vhm8A9P1SnH2MYjlCZwsbHUFweGyXJaSWLpQg2DBC7RBvV0BTz2hgsKT74u6Ta0kW
 ZuddCe2xaTY4JUJopva5yF3n51GnGnpWeA3bG6gWp/sy4oJYEY3UdE3QCc3f+uI/Vib5
 FSwzkjc7CUaBssgyhaYIUaY9/Qq5Zhejhjb911ftajjTtjqJUG69uS0w+YelsDluJE5n
 iXJSHltcGsaGXNqD9CflijWNUHD/IBi7YTOJzMMBukiQFJmTLrDC2aLpklzU6VZimWLI
 hjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XYdrzdt2klT5TKJ4GxOu/aIPwEjrlRiXakVQXnV+e/o=;
 b=teHnKiHedCsYa2/AkpjarrJXWME5hwvuxALB9D/IPrerZbLL9/1LDOeKymYt8lqJxq
 rzpKmmVW1iylccihrFpCJSvtIyWTWH+kUqJK3fUvElMSMzE6e66kV2oc2hTjazext+Ab
 fNw9QvsWU2n8d2BgMWLGUvEu/JoZNobpsTGq/a4t/PEDcayAFZqEpwS5c2hILQAW/jwZ
 pKUcfT/QF/7qbWSSGBF+al/l6dVj382CYkFU3KV8TfCbw8GUGzXKzNo5Mf7kjXAAgNo+
 P3xFwGa89yiaYxgEHuZ/LB2ihtNkUrP3cNoWPvhiEtwTF+FHt4OkorwN8iaKMryj1KTL
 Sx/w==
X-Gm-Message-State: AFqh2kpKgkKu3O4a97XfJgcZMoQ9nNCWhvWPxbOB4bfLRvFkj6CgUEJG
 MxUKs+E3oDwfDMkvBICIB01NFmabda/0Wnii
X-Google-Smtp-Source: AMrXdXtxoH8SdeNNSCbe0ASSJbUFdiruZ8RX5/nvfQHko74aKukgrhPoS/q54UZ30bcnqZUZf9vPOQ==
X-Received: by 2002:a17:90b:f82:b0:219:bd15:8c4c with SMTP id
 ft2-20020a17090b0f8200b00219bd158c4cmr69463431pjb.34.1673077886759; 
 Fri, 06 Jan 2023 23:51:26 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 bj5-20020a17090b088500b00212e5068e17sm1945119pjb.40.2023.01.06.23.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 23:51:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 07/27] tcg/s390x: Check for general-instruction-extension
 facility at startup
Date: Fri,  6 Jan 2023 23:50:58 -0800
Message-Id: <20230107075118.1814503-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230107075118.1814503-1-richard.henderson@linaro.org>
References: <20230107075118.1814503-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The general-instruction-extension facility was introduced in z10,
which itself was end-of-life in 2019.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h     |  10 ++--
 tcg/s390x/tcg-target.c.inc | 100 ++++++++++++++++---------------------
 2 files changed, 49 insertions(+), 61 deletions(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 126ba1048a..d47e8ba66a 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -57,10 +57,10 @@ typedef enum TCGReg {
 #define FACILITY_ZARCH_ACTIVE         2
 #define FACILITY_LONG_DISP            18
 #define FACILITY_EXT_IMM              21
+#define FACILITY_GEN_INST_EXT         34
 
 /* Facilities that are checked at runtime. */
 
-#define FACILITY_GEN_INST_EXT         34
 #define FACILITY_LOAD_ON_COND         45
 #define FACILITY_FAST_BCR_SER         FACILITY_LOAD_ON_COND
 #define FACILITY_DISTINCT_OPS         FACILITY_LOAD_ON_COND
@@ -92,8 +92,8 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_clz_i32        0
 #define TCG_TARGET_HAS_ctz_i32        0
 #define TCG_TARGET_HAS_ctpop_i32      0
-#define TCG_TARGET_HAS_deposit_i32    HAVE_FACILITY(GEN_INST_EXT)
-#define TCG_TARGET_HAS_extract_i32    HAVE_FACILITY(GEN_INST_EXT)
+#define TCG_TARGET_HAS_deposit_i32    1
+#define TCG_TARGET_HAS_extract_i32    1
 #define TCG_TARGET_HAS_sextract_i32   0
 #define TCG_TARGET_HAS_extract2_i32   0
 #define TCG_TARGET_HAS_movcond_i32    1
@@ -129,8 +129,8 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_clz_i64        1
 #define TCG_TARGET_HAS_ctz_i64        0
 #define TCG_TARGET_HAS_ctpop_i64      0
-#define TCG_TARGET_HAS_deposit_i64    HAVE_FACILITY(GEN_INST_EXT)
-#define TCG_TARGET_HAS_extract_i64    HAVE_FACILITY(GEN_INST_EXT)
+#define TCG_TARGET_HAS_deposit_i64    1
+#define TCG_TARGET_HAS_extract_i64    1
 #define TCG_TARGET_HAS_sextract_i64   0
 #define TCG_TARGET_HAS_extract2_i64   0
 #define TCG_TARGET_HAS_movcond_i64    1
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 42e161cc7e..f0b581293c 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -843,15 +843,8 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     }
 
     /* Otherwise, stuff it in the constant pool.  */
-    if (HAVE_FACILITY(GEN_INST_EXT)) {
-        tcg_out_insn(s, RIL, LGRL, ret, 0);
-        new_pool_label(s, sval, R_390_PC32DBL, s->code_ptr - 2, 2);
-    } else {
-        TCGReg base = ret ? ret : TCG_TMP0;
-        tcg_out_insn(s, RIL, LARL, base, 0);
-        new_pool_label(s, sval, R_390_PC32DBL, s->code_ptr - 2, 2);
-        tcg_out_insn(s, RXY, LG, ret, base, TCG_REG_NONE, 0);
-    }
+    tcg_out_insn(s, RIL, LGRL, ret, 0);
+    new_pool_label(s, sval, R_390_PC32DBL, s->code_ptr - 2, 2);
 }
 
 /* Emit a load/store type instruction.  Inputs are:
@@ -1105,7 +1098,7 @@ static void tgen_andi(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
             return;
         }
     }
-    if (HAVE_FACILITY(GEN_INST_EXT) && risbg_mask(val)) {
+    if (risbg_mask(val)) {
         tgen_andi_risbg(s, dest, dest, val);
         return;
     }
@@ -1460,48 +1453,47 @@ static void tgen_brcond(TCGContext *s, TCGType type, TCGCond c,
                         TCGReg r1, TCGArg c2, int c2const, TCGLabel *l)
 {
     int cc;
+    bool is_unsigned = is_unsigned_cond(c);
+    bool in_range;
+    S390Opcode opc;
 
-    if (HAVE_FACILITY(GEN_INST_EXT)) {
-        bool is_unsigned = is_unsigned_cond(c);
-        bool in_range;
-        S390Opcode opc;
+    cc = tcg_cond_to_s390_cond[c];
 
-        cc = tcg_cond_to_s390_cond[c];
+    if (!c2const) {
+        opc = (type == TCG_TYPE_I32
+               ? (is_unsigned ? RIE_CLRJ : RIE_CRJ)
+               : (is_unsigned ? RIE_CLGRJ : RIE_CGRJ));
+        tgen_compare_branch(s, opc, cc, r1, c2, l);
+        return;
+    }
 
-        if (!c2const) {
-            opc = (type == TCG_TYPE_I32
-                   ? (is_unsigned ? RIE_CLRJ : RIE_CRJ)
-                   : (is_unsigned ? RIE_CLGRJ : RIE_CGRJ));
-            tgen_compare_branch(s, opc, cc, r1, c2, l);
-            return;
-        }
-
-        /* COMPARE IMMEDIATE AND BRANCH RELATIVE has an 8-bit immediate field.
-           If the immediate we've been given does not fit that range, we'll
-           fall back to separate compare and branch instructions using the
-           larger comparison range afforded by COMPARE IMMEDIATE.  */
-        if (type == TCG_TYPE_I32) {
-            if (is_unsigned) {
-                opc = RIE_CLIJ;
-                in_range = (uint32_t)c2 == (uint8_t)c2;
-            } else {
-                opc = RIE_CIJ;
-                in_range = (int32_t)c2 == (int8_t)c2;
-            }
+    /*
+     * COMPARE IMMEDIATE AND BRANCH RELATIVE has an 8-bit immediate field.
+     * If the immediate we've been given does not fit that range, we'll
+     * fall back to separate compare and branch instructions using the
+     * larger comparison range afforded by COMPARE IMMEDIATE.
+     */
+    if (type == TCG_TYPE_I32) {
+        if (is_unsigned) {
+            opc = RIE_CLIJ;
+            in_range = (uint32_t)c2 == (uint8_t)c2;
         } else {
-            if (is_unsigned) {
-                opc = RIE_CLGIJ;
-                in_range = (uint64_t)c2 == (uint8_t)c2;
-            } else {
-                opc = RIE_CGIJ;
-                in_range = (int64_t)c2 == (int8_t)c2;
-            }
+            opc = RIE_CIJ;
+            in_range = (int32_t)c2 == (int8_t)c2;
         }
-        if (in_range) {
-            tgen_compare_imm_branch(s, opc, cc, r1, c2, l);
-            return;
+    } else {
+        if (is_unsigned) {
+            opc = RIE_CLGIJ;
+            in_range = (uint64_t)c2 == (uint8_t)c2;
+        } else {
+            opc = RIE_CGIJ;
+            in_range = (int64_t)c2 == (int8_t)c2;
         }
     }
+    if (in_range) {
+        tgen_compare_imm_branch(s, opc, cc, r1, c2, l);
+        return;
+    }
 
     cc = tgen_cmp(s, type, c, r1, c2, c2const, false);
     tgen_branch(s, cc, l);
@@ -1659,7 +1651,7 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addr_reg, MemOp opc,
        cross pages using the address of the last byte of the access.  */
     a_off = (a_bits >= s_bits ? 0 : s_mask - a_mask);
     tlb_mask = (uint64_t)TARGET_PAGE_MASK | a_mask;
-    if (HAVE_FACILITY(GEN_INST_EXT) && a_off == 0) {
+    if (a_off == 0) {
         tgen_andi_risbg(s, TCG_REG_R3, addr_reg, tlb_mask);
     } else {
         tcg_out_insn(s, RX, LA, TCG_REG_R3, addr_reg, TCG_REG_NONE, a_off);
@@ -2972,17 +2964,9 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
                 : C_O1_I2(r, 0, ri));
 
     case INDEX_op_mul_i32:
-        /* If we have the general-instruction-extensions, then we have
-           MULTIPLY SINGLE IMMEDIATE with a signed 32-bit, otherwise we
-           have only MULTIPLY HALFWORD IMMEDIATE, with a signed 16-bit.  */
-        return (HAVE_FACILITY(GEN_INST_EXT)
-                ? C_O1_I2(r, 0, ri)
-                : C_O1_I2(r, 0, rI));
-
+        return C_O1_I2(r, 0, ri);
     case INDEX_op_mul_i64:
-        return (HAVE_FACILITY(GEN_INST_EXT)
-                ? C_O1_I2(r, 0, rJ)
-                : C_O1_I2(r, 0, rI));
+        return C_O1_I2(r, 0, rJ);
 
     case INDEX_op_shl_i32:
     case INDEX_op_shr_i32:
@@ -3151,6 +3135,10 @@ static void query_s390_facilities(void)
         which = "extended-immediate";
         goto fail;
     }
+    if (!HAVE_FACILITY(GEN_INST_EXT)) {
+        which = "general-instructions-extension";
+        goto fail;
+    }
     return;
 
  fail:
-- 
2.34.1


