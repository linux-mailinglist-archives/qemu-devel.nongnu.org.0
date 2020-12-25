Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7502E2C5E
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Dec 2020 21:33:38 +0100 (CET)
Received: from localhost ([::1]:56784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kstmL-0007Jw-6f
	for lists+qemu-devel@lfdr.de; Fri, 25 Dec 2020 15:33:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kstZO-00038m-TI
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 15:20:14 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:35508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kstZM-0005Cx-J9
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 15:20:14 -0500
Received: by mail-pg1-x531.google.com with SMTP id n7so3513464pgg.2
 for <qemu-devel@nongnu.org>; Fri, 25 Dec 2020 12:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gtgLkycaCNbpvxv3G7Bhe7Cbw5c0KGYZhP5BMnkzD8w=;
 b=CEuCPmgNXUOO7RrFfE6N8bdr1Zye5U6oP7xph5AB9ATqpB+8yMdGC/iEdvm9m5Kwfx
 7VklRDmQpFWpU7qF/e8/hfWptM9DrWefOv5RdrqBz/JdBZNpbwGHiqJ3Bbn5rovgbFhB
 IP3jztLqP5EillsnBjZlPR4sOHIMITjLdG/80vFukvdXuRrIim85hsjBZzNyzTtXY+td
 agmUlMgxQCKQa4wr9Nw5v3vJufxratdhjNfWkEqqBwtBaMtaTwOe0+ncLcxyOD2TRf04
 Eoy6C6lxcO9Pt849CizTuLgsxaJ2cZvFHJongY+ngz5z44WpEdKUXmOPVuGLMjhbDBsO
 3+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gtgLkycaCNbpvxv3G7Bhe7Cbw5c0KGYZhP5BMnkzD8w=;
 b=b7njhN5wXklB2iUlRcJVSCXduUNq4AjA0zZXgoDMEugeXqfVu9q6zbUqmD5jL1+a6W
 f0HdTPtqI8FnuOPPz0SfxqVI7w8bbSP2tiGgcoYnUgiefxZGwZ3ZNcpqGhEudeJVpCmx
 WatQglHBX9TIC+myQdqqT6GuJQNG38de05BMEaTPrR41GMPR736xSoPOMHwARNsWTBrN
 MLcRzBOuYCoLm2TRU2ZXknJlFEC1LUqIFfcsQ30bVkKZVM7lVglMkjBuLr4Jf8bq1I5A
 ZNFzFuODCVrFVApqTC0/3B2bZ1iSteSf5w9TSZ76J4fB8mHdslYvAsb67BAMskkR8lj/
 nMbg==
X-Gm-Message-State: AOAM5317c+WtOlLNXlu8UUmqZuXZJ0W6SCyLPWH2nltmm95Q/fPXL6LX
 sFuV0jvwY+oBKWyVmRGZvv0Z5n7pFZk3GA==
X-Google-Smtp-Source: ABdhPJw53sEvUfUrGXBWLkeWwpkk8hnhD7X6B/VnAhdDYKQEH+2CrSP3fiS6OPUGVneL2yiLZO/PyQ==
X-Received: by 2002:a62:1ccb:0:b029:1ad:8138:dc42 with SMTP id
 c194-20020a621ccb0000b02901ad8138dc42mr12825149pfc.0.1608927610744; 
 Fri, 25 Dec 2020 12:20:10 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id l8sm5816497pjt.32.2020.12.25.12.20.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Dec 2020 12:20:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/16] tcg/s390x: Implement vector shift operations
Date: Fri, 25 Dec 2020 12:19:51 -0800
Message-Id: <20201225201956.692861-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201225201956.692861-1-richard.henderson@linaro.org>
References: <20201225201956.692861-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target-conset.h |  1 +
 tcg/s390x/tcg-target.h        | 12 ++---
 tcg/s390x/tcg-target.c.inc    | 93 ++++++++++++++++++++++++++++++++++-
 3 files changed, 99 insertions(+), 7 deletions(-)

diff --git a/tcg/s390x/tcg-target-conset.h b/tcg/s390x/tcg-target-conset.h
index c44d5f181c..9c7dd85eac 100644
--- a/tcg/s390x/tcg-target-conset.h
+++ b/tcg/s390x/tcg-target-conset.h
@@ -19,6 +19,7 @@ C_O1_I2(r, 0, rI)
 C_O1_I2(r, 0, rJ)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, rZ, r)
+C_O1_I2(v, v, r)
 C_O1_I2(v, v, v)
 C_O1_I4(r, r, ri, r, 0)
 C_O1_I4(r, r, ri, rI, 0)
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 3f0be23323..a97738e525 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -144,12 +144,12 @@ extern uint64_t s390_facilities[3];
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
index c5c17adc0c..259b63d8bc 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -262,6 +262,10 @@ typedef enum S390Opcode {
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
@@ -272,6 +276,10 @@ typedef enum S390Opcode {
     VRRc_VX     = 0xe76d,
     VRRf_VLVGP  = 0xe762,
 
+    VRSa_VERLL  = 0xe733,
+    VRSa_VESL   = 0xe730,
+    VRSa_VESRA  = 0xe73a,
+    VRSa_VESRL  = 0xe738,
     VRSb_VLVG   = 0xe722,
     VRSc_VLGV   = 0xe721,
 
@@ -615,6 +623,18 @@ static void tcg_out_insn_VRRf(TCGContext *s, S390Opcode op,
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
@@ -2671,6 +2691,43 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -2705,10 +2762,23 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
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
@@ -2771,7 +2841,7 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
                        TCGArg a0, ...)
 {
     va_list va;
-    TCGv_vec v0, v1, v2;
+    TCGv_vec v0, v1, v2, t0;
 
     va_start(va, a0);
     v0 = temp_tcgv_vec(arg_temp(a0));
@@ -2783,6 +2853,13 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
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
@@ -2939,6 +3016,10 @@ static int tcg_target_op_def(TCGOpcode op)
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
@@ -2949,7 +3030,17 @@ static int tcg_target_op_def(TCGOpcode op)
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


