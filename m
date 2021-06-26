Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D563B4CBE
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 07:08:20 +0200 (CEST)
Received: from localhost ([::1]:56438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx0YF-0003NM-Lx
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 01:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx0TO-0006xT-H5
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 01:03:18 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:39676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx0TL-0008HS-TT
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 01:03:18 -0400
Received: by mail-pf1-x429.google.com with SMTP id g192so9127707pfb.6
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 22:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CFGDGCwhvAJbpWWCsNcb9mvpCKGl7HMW0/Cb9Q6KSow=;
 b=oGnkyJ/X7KUZ4dBgAMAVRh1btlbdffT1OAWmeQRJsnXUI8gAglQYhk3lTp+v9ngkYu
 QxJDku2sdfKzAVzIU/Jdgjw65rAfMBHrfVROIikTQuVApbcELscTJYtKMkkSjdi94Fa4
 Rc5LjeHCDVdihJQVpsIo9Xyh3erzTLb5zuUCT/A6SrbjOP5vmbq3O2HCx3RqkRlEje2g
 S6YMJNYOLCNSFtJtvFnK87g2U6/3tLy0jgT2c7IVda5fu/zL0wpRoUR/WWWlZFnYglm7
 DGsM5kXCvbLWmvOaVVr4T4+vv25JfgrwmGAx/9Vh+InVeXDJlqqaryz57r2gmPSEnUIs
 p0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CFGDGCwhvAJbpWWCsNcb9mvpCKGl7HMW0/Cb9Q6KSow=;
 b=YVZh/iltS00wE0ZzSQJasBa/zyYGxn9svcVyohpsKurzH4pCcfx1tjD/fo0XVAn9P5
 ebAGNPyEHRBev+V/9AwLbDWXyt8MKZZhrz6YQEnZzGCt5eEdzPeSCiBq5pyQ8a0tcHet
 RBHI+u5SIE3vezqfHLxCx6mg5Wg8qK1Vs2AnNQxF6mJ/l8TnBJfhjGa6htdCwUm2l3Yf
 Uqp4pAxOJJ5mApsgPAOOc5e7qyoOMCuICV9zsI4XJnR9xqr45DnlEjMeNhZ8jEoZ/nGl
 ak4skY9015LTcQmX5wOnd06DUmRRWB1dx0+8oSAxBytew8S0jJxsaem+96VCP4ZlHdlm
 K/nw==
X-Gm-Message-State: AOAM533WQGcec78NdjXt7RYpo2Ek4MwioszHcuybzhH7PusmQ+G4KKbP
 itxum/HMMol5+3Xnp4Ml+TR5Lx5SjndVjQ==
X-Google-Smtp-Source: ABdhPJyDkL8ydvdLRTUb2rnlvyfmrdWy+WPMjoja1SbIov/WGN8BsCLkS3Bog5F0/DX7uyv0DExNpA==
X-Received: by 2002:a62:7e05:0:b029:2ea:57f:ec86 with SMTP id
 z5-20020a627e050000b02902ea057fec86mr13963827pfc.37.1624683794596; 
 Fri, 25 Jun 2021 22:03:14 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id c62sm7389768pfa.12.2021.06.25.22.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 22:03:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/16] tcg/s390x: Implement vector shift operations
Date: Fri, 25 Jun 2021 22:03:02 -0700
Message-Id: <20210626050307.2408505-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626050307.2408505-1-richard.henderson@linaro.org>
References: <20210626050307.2408505-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target-con-set.h |  1 +
 tcg/s390x/tcg-target.h         | 12 ++---
 tcg/s390x/tcg-target.c.inc     | 93 +++++++++++++++++++++++++++++++++-
 3 files changed, 99 insertions(+), 7 deletions(-)

diff --git a/tcg/s390x/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
index cb953896d5..49b98f33b9 100644
--- a/tcg/s390x/tcg-target-con-set.h
+++ b/tcg/s390x/tcg-target-con-set.h
@@ -24,6 +24,7 @@ C_O1_I2(r, 0, rI)
 C_O1_I2(r, 0, rJ)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, rZ, r)
+C_O1_I2(v, v, r)
 C_O1_I2(v, v, v)
 C_O1_I4(r, r, ri, r, 0)
 C_O1_I4(r, r, ri, rI, 0)
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index cb14a011c7..8dce6af5af 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -148,12 +148,12 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_not_vec        1
 #define TCG_TARGET_HAS_neg_vec        1
 #define TCG_TARGET_HAS_abs_vec        1
-#define TCG_TARGET_HAS_roti_vec       0
-#define TCG_TARGET_HAS_rots_vec       0
-#define TCG_TARGET_HAS_rotv_vec       0
-#define TCG_TARGET_HAS_shi_vec        0
-#define TCG_TARGET_HAS_shs_vec        0
-#define TCG_TARGET_HAS_shv_vec        0
+#define TCG_TARGET_HAS_roti_vec       1
+#define TCG_TARGET_HAS_rots_vec       1
+#define TCG_TARGET_HAS_rotv_vec       1
+#define TCG_TARGET_HAS_shi_vec        1
+#define TCG_TARGET_HAS_shs_vec        1
+#define TCG_TARGET_HAS_shv_vec        1
 #define TCG_TARGET_HAS_mul_vec        1
 #define TCG_TARGET_HAS_sat_vec        0
 #define TCG_TARGET_HAS_minmax_vec     0
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index c142279bb8..b9d12e579b 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -277,6 +277,10 @@ typedef enum S390Opcode {
     VRRc_VCEQ   = 0xe7f8,   /* we leave the m5 cs field 0 */
     VRRc_VCH    = 0xe7fb,   /* " */
     VRRc_VCHL   = 0xe7f9,   /* " */
+    VRRc_VERLLV = 0xe773,
+    VRRc_VESLV  = 0xe770,
+    VRRc_VESRAV = 0xe77a,
+    VRRc_VESRLV = 0xe778,
     VRRc_VML    = 0xe7a2,
     VRRc_VN     = 0xe768,
     VRRc_VNC    = 0xe769,
@@ -287,6 +291,10 @@ typedef enum S390Opcode {
     VRRc_VX     = 0xe76d,
     VRRf_VLVGP  = 0xe762,
 
+    VRSa_VERLL  = 0xe733,
+    VRSa_VESL   = 0xe730,
+    VRSa_VESRA  = 0xe73a,
+    VRSa_VESRL  = 0xe738,
     VRSb_VLVG   = 0xe722,
     VRSc_VLGV   = 0xe721,
 
@@ -633,6 +641,18 @@ static void tcg_out_insn_VRRf(TCGContext *s, S390Opcode op,
     tcg_out16(s, (op & 0x00ff) | RXB(v1, 0, 0, 0));
 }
 
+static void tcg_out_insn_VRSa(TCGContext *s, S390Opcode op, TCGReg v1,
+                              intptr_t d2, TCGReg b2, TCGReg v3, int m4)
+{
+    tcg_debug_assert(v1 >= TCG_REG_V0 && v1 <= TCG_REG_V31);
+    tcg_debug_assert(d2 >= 0 && d2 <= 0xfff);
+    tcg_debug_assert(b2 <= TCG_REG_R15);
+    tcg_debug_assert(v3 >= TCG_REG_V0 && v3 <= TCG_REG_V31);
+    tcg_out16(s, (op & 0xff00) | ((v1 & 15) << 4) | (v3 & 15));
+    tcg_out16(s, b2 << 12 | d2);
+    tcg_out16(s, (op & 0x00ff) | RXB(v1, 0, v3, 0) | (m4 << 12));
+}
+
 static void tcg_out_insn_VRSb(TCGContext *s, S390Opcode op, TCGReg v1,
                               intptr_t d2, TCGReg b2, TCGReg r3, int m4)
 {
@@ -2678,6 +2698,43 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         tcg_out_insn(s, VRRc, VX, a0, a1, a2, 0);
         break;
 
+    case INDEX_op_shli_vec:
+        tcg_out_insn(s, VRSa, VESL, a0, a2, TCG_REG_NONE, a1, vece);
+        break;
+    case INDEX_op_shri_vec:
+        tcg_out_insn(s, VRSa, VESRL, a0, a2, TCG_REG_NONE, a1, vece);
+        break;
+    case INDEX_op_sari_vec:
+        tcg_out_insn(s, VRSa, VESRA, a0, a2, TCG_REG_NONE, a1, vece);
+        break;
+    case INDEX_op_rotli_vec:
+        tcg_out_insn(s, VRSa, VERLL, a0, a2, TCG_REG_NONE, a1, vece);
+        break;
+    case INDEX_op_shls_vec:
+        tcg_out_insn(s, VRSa, VESL, a0, 0, a2, a1, vece);
+        break;
+    case INDEX_op_shrs_vec:
+        tcg_out_insn(s, VRSa, VESRL, a0, 0, a2, a1, vece);
+        break;
+    case INDEX_op_sars_vec:
+        tcg_out_insn(s, VRSa, VESRA, a0, 0, a2, a1, vece);
+        break;
+    case INDEX_op_rotls_vec:
+        tcg_out_insn(s, VRSa, VERLL, a0, 0, a2, a1, vece);
+        break;
+    case INDEX_op_shlv_vec:
+        tcg_out_insn(s, VRRc, VESLV, a0, a1, a2, vece);
+        break;
+    case INDEX_op_shrv_vec:
+        tcg_out_insn(s, VRRc, VESRLV, a0, a1, a2, vece);
+        break;
+    case INDEX_op_sarv_vec:
+        tcg_out_insn(s, VRRc, VESRAV, a0, a1, a2, vece);
+        break;
+    case INDEX_op_rotlv_vec:
+        tcg_out_insn(s, VRRc, VERLLV, a0, a1, a2, vece);
+        break;
+
     case INDEX_op_cmp_vec:
         switch ((TCGCond)args[3]) {
         case TCG_COND_EQ:
@@ -2712,10 +2769,23 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_not_vec:
     case INDEX_op_or_vec:
     case INDEX_op_orc_vec:
+    case INDEX_op_rotli_vec:
+    case INDEX_op_rotls_vec:
+    case INDEX_op_rotlv_vec:
+    case INDEX_op_sari_vec:
+    case INDEX_op_sars_vec:
+    case INDEX_op_sarv_vec:
+    case INDEX_op_shli_vec:
+    case INDEX_op_shls_vec:
+    case INDEX_op_shlv_vec:
+    case INDEX_op_shri_vec:
+    case INDEX_op_shrs_vec:
+    case INDEX_op_shrv_vec:
     case INDEX_op_sub_vec:
     case INDEX_op_xor_vec:
         return 1;
     case INDEX_op_cmp_vec:
+    case INDEX_op_rotrv_vec:
         return -1;
     case INDEX_op_mul_vec:
         return vece < MO_64;
@@ -2778,7 +2848,7 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
                        TCGArg a0, ...)
 {
     va_list va;
-    TCGv_vec v0, v1, v2;
+    TCGv_vec v0, v1, v2, t0;
 
     va_start(va, a0);
     v0 = temp_tcgv_vec(arg_temp(a0));
@@ -2790,6 +2860,13 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
         expand_vec_cmp(type, vece, v0, v1, v2, va_arg(va, TCGArg));
         break;
 
+    case INDEX_op_rotrv_vec:
+        t0 = tcg_temp_new_vec(type);
+        tcg_gen_neg_vec(vece, t0, v2);
+        tcg_gen_rotlv_vec(vece, v0, v1, t0);
+        tcg_temp_free_vec(t0);
+        break;
+
     default:
         g_assert_not_reached();
     }
@@ -2946,6 +3023,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_abs_vec:
     case INDEX_op_neg_vec:
     case INDEX_op_not_vec:
+    case INDEX_op_rotli_vec:
+    case INDEX_op_sari_vec:
+    case INDEX_op_shli_vec:
+    case INDEX_op_shri_vec:
         return C_O1_I1(v, v);
     case INDEX_op_add_vec:
     case INDEX_op_sub_vec:
@@ -2956,7 +3037,17 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_xor_vec:
     case INDEX_op_cmp_vec:
     case INDEX_op_mul_vec:
+    case INDEX_op_rotlv_vec:
+    case INDEX_op_rotrv_vec:
+    case INDEX_op_shlv_vec:
+    case INDEX_op_shrv_vec:
+    case INDEX_op_sarv_vec:
         return C_O1_I2(v, v, v);
+    case INDEX_op_rotls_vec:
+    case INDEX_op_shls_vec:
+    case INDEX_op_shrs_vec:
+    case INDEX_op_sars_vec:
+        return C_O1_I2(v, v, r);
 
     default:
         g_assert_not_reached();
-- 
2.25.1


