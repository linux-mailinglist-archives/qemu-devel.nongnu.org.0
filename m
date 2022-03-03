Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FD94CC7E9
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:22:33 +0100 (CET)
Received: from localhost ([::1]:35016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPsu8-0000j6-Mm
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:22:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYn-00067q-K9
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:32 -0500
Received: from [2607:f8b0:4864:20::62a] (port=33652
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYd-0004Ja-B4
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:20 -0500
Received: by mail-pl1-x62a.google.com with SMTP id c9so5908549pll.0
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 13:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1c1ppA+8RTch2imfz9xAE3XksAhgAsrDZznz0cROn8M=;
 b=oDmuIBNWwr7pgimqhUvrsQznbbQE3fHUq/mvzOdgj0hssV2cau+Mi6XBv5b4jzjAiz
 VSEiCk4A1S+RAuiXREa1O1ZbZOMgdngDIm9vC5LTGps3JqzKZzq8Gwd1xDdQ2bypgxy2
 QQfRPz3oc8ChZMbjKCSu3xT5+1rMo2oUS/XBBVfo8O3JCljzO+iFT30i5fdcXfn+JWgv
 rCuOvc12k79aFOILKd48SwNuMRM5ybCL1gkWAD2mMjx8S4yp+E29A2Brb6VBDMxPzIey
 9oYgruJ24R+aEQGzu4J4IuITNv0q59NWM4bwgMTqXzoQyPG6qCxa+ETPmViF4aYqndCS
 Ijbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1c1ppA+8RTch2imfz9xAE3XksAhgAsrDZznz0cROn8M=;
 b=Kq/8glpU6texgxP57tp4Zk7rnaGABvHaCVOrp0pvY3hAiMrAN4cGjhiUmwysnXflxs
 Ka9ldSnYz5Je6hK1JbU2uHSp+Sr5+Yv2m+HJISrezErJovCn1OIHbWjTB8Ja2v7FpIN7
 bR1qvKPHFwh7FTIEGt2ObFJJ9gii3V3mgTfDwHwnxXfSQG9nnCzBvW2cYPSPE2ELGcm0
 B+z0Rph+w3lSxRClkIrM3zrPEd/fTBsS9lwmAuli40NJD2P+hC96hsvipY8tp9dDjEsY
 lA6KEiNUuF9V/4+p8rvLReZWW5e97ueOO6nJvME4XrClkJa48ewWgl6CD+c26MHel4ix
 rrtg==
X-Gm-Message-State: AOAM5328A4a9+716u0O5aTaiwm1AjFcdZEhbO2/84SiVhLiDwRYdKpHd
 Ef8hnL/mnUbwDkH9DtCLU51FdUMOW+J9bw==
X-Google-Smtp-Source: ABdhPJzozUBdfp3DKGDLrtXR5ly4q+5am7byNpfz6X47bp5BJn4tMf/vtRf9/QrF5etSrZvb+uhNeA==
X-Received: by 2002:a17:902:7610:b0:151:6152:549c with SMTP id
 k16-20020a170902761000b001516152549cmr24228368pll.91.1646341217104; 
 Thu, 03 Mar 2022 13:00:17 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a6549c8000000b00372eb3a7fb3sm2729934pgs.92.2022.03.03.13.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 13:00:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/30] tcg/i386: Implement more logical operations for avx512
Date: Thu,  3 Mar 2022 10:59:34 -1000
Message-Id: <20220303205944.469445-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303205944.469445-1-richard.henderson@linaro.org>
References: <20220303205944.469445-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

AVX512VL has a general ternary logic operation, VPTERNLOGQ,
which can implement NOT, ORC, NAND, NOR, EQV.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.h     | 10 +++++-----
 tcg/i386/tcg-target.c.inc | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 5 deletions(-)

diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index da1eff59aa..e02cef7575 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -188,11 +188,11 @@ extern bool have_movbe;
 #define TCG_TARGET_HAS_v256             have_avx2
 
 #define TCG_TARGET_HAS_andc_vec         1
-#define TCG_TARGET_HAS_orc_vec          0
-#define TCG_TARGET_HAS_nand_vec         0
-#define TCG_TARGET_HAS_nor_vec          0
-#define TCG_TARGET_HAS_eqv_vec          0
-#define TCG_TARGET_HAS_not_vec          0
+#define TCG_TARGET_HAS_orc_vec          have_avx512vl
+#define TCG_TARGET_HAS_nand_vec         have_avx512vl
+#define TCG_TARGET_HAS_nor_vec          have_avx512vl
+#define TCG_TARGET_HAS_eqv_vec          have_avx512vl
+#define TCG_TARGET_HAS_not_vec          have_avx512vl
 #define TCG_TARGET_HAS_neg_vec          0
 #define TCG_TARGET_HAS_abs_vec          1
 #define TCG_TARGET_HAS_roti_vec         have_avx512vl
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index a800764d2f..140a51ce70 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -448,6 +448,7 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_VPSRLVW     (0x10 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_VPSRLVD     (0x45 | P_EXT38 | P_DATA16)
 #define OPC_VPSRLVQ     (0x45 | P_EXT38 | P_DATA16 | P_VEXW)
+#define OPC_VPTERNLOGQ  (0x25 | P_EXT3A | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_VZEROUPPER  (0x77 | P_EXT)
 #define OPC_XCHG_ax_r32	(0x90)
 
@@ -3098,6 +3099,29 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         insn = vpshldi_insn[vece];
         sub = args[3];
         goto gen_simd_imm8;
+
+    case INDEX_op_not_vec:
+        insn = OPC_VPTERNLOGQ;
+        a2 = a1;
+        sub = 0x33; /* !B */
+        goto gen_simd_imm8;
+    case INDEX_op_nor_vec:
+        insn = OPC_VPTERNLOGQ;
+        sub = 0x11; /* norCB */
+        goto gen_simd_imm8;
+    case INDEX_op_nand_vec:
+        insn = OPC_VPTERNLOGQ;
+        sub = 0x77; /* nandCB */
+        goto gen_simd_imm8;
+    case INDEX_op_eqv_vec:
+        insn = OPC_VPTERNLOGQ;
+        sub = 0x99; /* xnorCB */
+        goto gen_simd_imm8;
+    case INDEX_op_orc_vec:
+        insn = OPC_VPTERNLOGQ;
+        sub = 0xdd; /* orB!C */
+        goto gen_simd_imm8;
+
     gen_simd_imm8:
         tcg_debug_assert(insn != OPC_UD2);
         if (type == TCG_TYPE_V256) {
@@ -3318,6 +3342,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_or_vec:
     case INDEX_op_xor_vec:
     case INDEX_op_andc_vec:
+    case INDEX_op_orc_vec:
+    case INDEX_op_nand_vec:
+    case INDEX_op_nor_vec:
+    case INDEX_op_eqv_vec:
     case INDEX_op_ssadd_vec:
     case INDEX_op_usadd_vec:
     case INDEX_op_sssub_vec:
@@ -3350,6 +3378,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
     case INDEX_op_abs_vec:
     case INDEX_op_dup_vec:
+    case INDEX_op_not_vec:
     case INDEX_op_shli_vec:
     case INDEX_op_shri_vec:
     case INDEX_op_sari_vec:
@@ -3378,6 +3407,11 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_or_vec:
     case INDEX_op_xor_vec:
     case INDEX_op_andc_vec:
+    case INDEX_op_orc_vec:
+    case INDEX_op_nand_vec:
+    case INDEX_op_nor_vec:
+    case INDEX_op_eqv_vec:
+    case INDEX_op_not_vec:
         return 1;
     case INDEX_op_cmp_vec:
     case INDEX_op_cmpsel_vec:
-- 
2.25.1


