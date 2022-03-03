Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C014CC7EE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:23:09 +0100 (CET)
Received: from localhost ([::1]:37012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPsui-00023W-5S
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:23:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYq-0006AU-EO
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:43 -0500
Received: from [2607:f8b0:4864:20::102c] (port=44714
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYd-0004Jt-Qq
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:21 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 gj15-20020a17090b108f00b001bef86c67c1so6035406pjb.3
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 13:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GZeqg0WZetg1ni1zZeZXg4Eeu+pSLJpBQ2JK38q7DCI=;
 b=Qg2AMYPCTYw+tIrcX1EkbQ6XpodKAO+/I8LWb0mrOnFM9McCqyHav1VFFVypanaJIm
 SJfpJuUbDGoWtCnOwy2si4DMtgOEdruSvGqyfGMkM0zSvUml85qMhEJLx16i1HlrRaqG
 0kDitvem7l9Ms498Mmxys3NTlMA6yVsGPOvWPhMhsAMKhSDSH1iTpkxDhB45izuY4w2U
 2gQDga2atjGloZnkpDp77XQPaDll82FvySbr3JVIrC73FsQj/yxA95fcE6AVhnj3Z3LD
 XS4JwESBeSHIv5O22LknaTCnFyLZsIBLLMF+r/o3S2EyhezHzzVuqZ3THNIhMNj7z0l9
 fUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GZeqg0WZetg1ni1zZeZXg4Eeu+pSLJpBQ2JK38q7DCI=;
 b=V++yQbNSButBJue1wUCLc7ihs7b3h2nvRe4qNsq/RxxBA/RbxeHJg9GG3HraNZYxwd
 zTI6GBuBEB8E0TLz5Avl8sfpU4+Q7LTc86Hfqq44COoaE0RpfDSmyXQqg8I7X8eUo2RI
 Bnth8jQAHqEJCt10H+IoO5KtTl4Fnj46w1T6SmjAN+0r2745+u5nS5hlN17BnadyUjYs
 yaqia0e1ylxdRYnv44mhFXgt5eyd3XO0AHka2t4PRcRTnsbPORcmfFLGZJSj9j3iovAB
 pUfg0bpIloKOfQHIEpGtxdRBRbFAZNMUfBXlzmuSkbGrklBPiaOvhKr7AsssU09x2stw
 v29w==
X-Gm-Message-State: AOAM533O3tHUReUJ6e0XC2y+s8ucQM7UV7vPG0IP9X6Mcvapa2QZ/wu0
 b4PtXXhEgYJWReebJOiI+6S+KXn/IzFmyg==
X-Google-Smtp-Source: ABdhPJzvDPy8M9EyEvE4EDju6G2oIWGsV/5N32MT8FGYVp9pvs/k39/GCudO3fPK9k4AXQrK0vmTyQ==
X-Received: by 2002:a17:903:292:b0:149:460a:9901 with SMTP id
 j18-20020a170903029200b00149460a9901mr38100197plr.44.1646341218547; 
 Thu, 03 Mar 2022 13:00:18 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a6549c8000000b00372eb3a7fb3sm2729934pgs.92.2022.03.03.13.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 13:00:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/30] tcg/i386: Implement bitsel for avx512
Date: Thu,  3 Mar 2022 10:59:35 -1000
Message-Id: <20220303205944.469445-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303205944.469445-1-richard.henderson@linaro.org>
References: <20220303205944.469445-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

The general ternary logic operation can implement BITSEL.
Funnel the 4-operand operation into three variants of the
3-operand instruction, depending on input operand overlap.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.h     |  2 +-
 tcg/i386/tcg-target.c.inc | 20 +++++++++++++++++++-
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index e02cef7575..00fcbe297d 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -204,7 +204,7 @@ extern bool have_movbe;
 #define TCG_TARGET_HAS_mul_vec          1
 #define TCG_TARGET_HAS_sat_vec          1
 #define TCG_TARGET_HAS_minmax_vec       1
-#define TCG_TARGET_HAS_bitsel_vec       0
+#define TCG_TARGET_HAS_bitsel_vec       have_avx512vl
 #define TCG_TARGET_HAS_cmpsel_vec       -1
 
 #define TCG_TARGET_deposit_i32_valid(ofs, len) \
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 140a51ce70..b5c6159853 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2898,7 +2898,7 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
 
     TCGType type = vecl + TCG_TYPE_V64;
     int insn, sub;
-    TCGArg a0, a1, a2;
+    TCGArg a0, a1, a2, a3;
 
     a0 = args[0];
     a1 = args[1];
@@ -3122,6 +3122,22 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         sub = 0xdd; /* orB!C */
         goto gen_simd_imm8;
 
+    case INDEX_op_bitsel_vec:
+        insn = OPC_VPTERNLOGQ;
+        a3 = args[3];
+        if (a0 == a1) {
+            a1 = a2;
+            a2 = a3;
+            sub = 0xca; /* A?B:C */
+        } else if (a0 == a2) {
+            a2 = a3;
+            sub = 0xe2; /* B?A:C */
+        } else {
+            tcg_out_mov(s, type, a0, a3);
+            sub = 0xb8; /* B?C:A */
+        }
+        goto gen_simd_imm8;
+
     gen_simd_imm8:
         tcg_debug_assert(insn != OPC_UD2);
         if (type == TCG_TYPE_V256) {
@@ -3390,6 +3406,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_x86_vpshrdv_vec:
         return C_O1_I3(x, 0, x, x);
 
+    case INDEX_op_bitsel_vec:
     case INDEX_op_x86_vpblendvb_vec:
         return C_O1_I3(x, x, x, x);
 
@@ -3412,6 +3429,7 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_nor_vec:
     case INDEX_op_eqv_vec:
     case INDEX_op_not_vec:
+    case INDEX_op_bitsel_vec:
         return 1;
     case INDEX_op_cmp_vec:
     case INDEX_op_cmpsel_vec:
-- 
2.25.1


