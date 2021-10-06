Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1964241B5
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 17:46:34 +0200 (CEST)
Received: from localhost ([::1]:32812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY97p-0004Ej-Qz
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 11:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8ix-0002ar-Cx
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:53 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:33564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8in-0007sY-DZ
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:51 -0400
Received: by mail-pl1-x62d.google.com with SMTP id a11so1937286plm.0
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 08:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YFOcXjzdXQG0mAsls6wwLN6tgDtHJ7E0FQLIkhRx9D8=;
 b=mv5OYMpmujYtU1cjV4DQ3HXtdMlhxTa+xQhGSf6HymvqUBXioy4vnGH20VkK/1XQT9
 oicghGmFv6zcKG73c7FpEpZWGLoD06ffswIB1AlaAWllRtlFDjuPV2V0EtAmOmx07eM/
 I3cKW4K24gtAcWHaoegY7n2HhiG+q40OwZGGS7iWnmZ74DwTDldsFqb6oIAthNe1+q5C
 /7IqfxHoHnAi9YJGNi16oDlyfHcAulsrFqKkz8w/L5m+AJd3pif9dyyXheGHBp4EoOeM
 z97d1xwI31InZCtak0S3BuvOq4jMk2YjrO2rwAu8ijse9+c1/ok6e2Z4yLHj50yvcYV2
 Ch/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YFOcXjzdXQG0mAsls6wwLN6tgDtHJ7E0FQLIkhRx9D8=;
 b=ptsA5rp+RN4rfFF7u9Zz9BRmxjDJI8QVS7P9IDGhanlVHbgiBCM40IAlbEdasJElCW
 qPh3U6GeLg85nH8jqNG1keX7wIdY6aWNARfX5U9gE9NU5+XLGeQQwLnOFJZJWLUb9z2e
 6IgFTNZPSCsMZ4C8u6PsbWUSPlukNKy4FeShULc+RvDUvRzSpEUbMMRnR4bg3x2PkEHD
 QrkpLj12GoAMfOEvawsc7I8QaiKVUuzKT5P8tppA1nf5nhy+wv9FvIflPt1VwtZrRs5/
 gdwA2BWYA01MYoryqASu7YhZ/OR0NpNQdtOqj1DF4mVXC4TzwVo1ECwxB2qvZJnn/bml
 QSTA==
X-Gm-Message-State: AOAM532pCWuhhOLv5IzuKLSWxcuVS5vT/uyB5D+0tW5FKVZIEiNT5jxo
 kdGEiPtKu5nTeQSRLnmsH2G+fwaD6gkQHg==
X-Google-Smtp-Source: ABdhPJyET/FHM3IGfR08ZG1GOGuC9n/w0UT6ZGHZPo6mfsgHXuWgTa4v2N1W7OJuJ1xn3APRvqmhVQ==
X-Received: by 2002:a17:90a:b783:: with SMTP id
 m3mr11791605pjr.183.1633533637240; 
 Wed, 06 Oct 2021 08:20:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 130sm22239256pfz.77.2021.10.06.08.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 08:20:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/28] tcg/s390x: Implement vector shift operations
Date: Wed,  6 Oct 2021 08:20:10 -0700
Message-Id: <20211006152014.741026-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006152014.741026-1-richard.henderson@linaro.org>
References: <20211006152014.741026-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: David Hildenbrand <david@redhat.com>
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
index 1c581a2f60..d7d204b782 100644
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
index 85178c93d3..98c0cd5091 100644
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
 
@@ -643,6 +651,18 @@ static void tcg_out_insn_VRRf(TCGContext *s, S390Opcode op,
     tcg_out16(s, (op & 0x00ff) | RXB(v1, 0, 0, 0));
 }
 
+static void tcg_out_insn_VRSa(TCGContext *s, S390Opcode op, TCGReg v1,
+                              intptr_t d2, TCGReg b2, TCGReg v3, int m4)
+{
+    tcg_debug_assert(is_vector_reg(v1));
+    tcg_debug_assert(d2 >= 0 && d2 <= 0xfff);
+    tcg_debug_assert(is_general_reg(b2));
+    tcg_debug_assert(is_vector_reg(v3));
+    tcg_out16(s, (op & 0xff00) | ((v1 & 0xf) << 4) | (v3 & 0xf));
+    tcg_out16(s, b2 << 12 | d2);
+    tcg_out16(s, (op & 0x00ff) | RXB(v1, 0, v3, 0) | (m4 << 12));
+}
+
 static void tcg_out_insn_VRSb(TCGContext *s, S390Opcode op, TCGReg v1,
                               intptr_t d2, TCGReg b2, TCGReg r3, int m4)
 {
@@ -2710,6 +2730,43 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -2744,10 +2801,23 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
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
@@ -2810,7 +2880,7 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
                        TCGArg a0, ...)
 {
     va_list va;
-    TCGv_vec v0, v1, v2;
+    TCGv_vec v0, v1, v2, t0;
 
     va_start(va, a0);
     v0 = temp_tcgv_vec(arg_temp(a0));
@@ -2822,6 +2892,13 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
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
@@ -2978,6 +3055,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
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
@@ -2988,7 +3069,17 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
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


