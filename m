Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C97714CC7CE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:17:22 +0100 (CET)
Received: from localhost ([::1]:46426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPsp7-0005yv-TO
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:17:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYV-00063b-QV
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:14 -0500
Received: from [2607:f8b0:4864:20::1029] (port=36400
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYT-0004I0-VG
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:11 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 g7-20020a17090a708700b001bb78857ccdso8903341pjk.1
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 13:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GxqbaeGaqhtNNI3GWh/zd5zM1ofbIy5Pq91AeE2m2ho=;
 b=fjOajX71PR2ShO7W4/DTEvLAcGAR7K20ltudoHLPQ9YWBeYaj/B0AszLpu2EYmvQ9n
 OdFDvv4hqALSdXVaGr4apmOcb+jZDFZZ+c5sPQ8A+2ADNp+GziaK2oJze9LtQraBXyOz
 ieR2EggunVga2pm/BnH8yS+pW4T3mJ0vHZ6KA2TO6SHIYGK02F8KnqYVeaXj6Y/x93Xw
 fA9CH8nRpVonjW9ikFlWrguBDu7qga7z0vJLPBfhw09B7Ad/ExpPIrbU2xntArZtUFAr
 0EpaX4h6A1kaK7uUZc0ikDCbYs//8s6/kSsEOdjOrse4rClcou+830WGpxBN86/rOC8f
 SvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GxqbaeGaqhtNNI3GWh/zd5zM1ofbIy5Pq91AeE2m2ho=;
 b=7H9fydruaMuM8SR9F1u7aMl7ZyI+C7BMZHM+cR0lDUjn0AlOabbqbyJbUI8JaYjRHH
 5em5sVPfqkA3fqQW9N/G2E77zc8NlL2UWGQSNIohQAHi1BLkSW+CfqYMbMGALkJu6hqE
 hDZxAUgzL5m3mVYqj9U0VlryqbZ16nbXoQgdyKMtxtZ2McO2L/5Zc7J005EZmQsKKsOF
 UpSXs+MqgWZMRUzKFQjqiTKW5ak2BWjFuhg/BDEvutp493AABsHy28LmF2wwTIE4xhUZ
 +Oa/Xkr5DVKtrCIiJQu26iUc+Dqt4bPl5FyXE1xOTHxlsNk3jftqhOCUbvaNnMNBvk66
 W+VA==
X-Gm-Message-State: AOAM530ubvAgSuwnhocq5D2AW10BZbqn/WXuipVMQMJw4atAGPPJaIaq
 OEJx8+mVRtdbqLZCBn2cCgA53/r2pI30vw==
X-Google-Smtp-Source: ABdhPJzWxgZLYtSVy1cOl42q5eY+zBMza+F5pUgg64pW8JCYvNyA9ybBxViLWqe8DIIobDJh7TcHqg==
X-Received: by 2002:a17:90b:4f8f:b0:1bf:ac1:2016 with SMTP id
 qe15-20020a17090b4f8f00b001bf0ac12016mr6153283pjb.21.1646341208672; 
 Thu, 03 Mar 2022 13:00:08 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a6549c8000000b00372eb3a7fb3sm2729934pgs.92.2022.03.03.13.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 13:00:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/30] tcg/i386: Support avx512vbmi2 vector shift-double
 instructions
Date: Thu,  3 Mar 2022 10:59:28 -1000
Message-Id: <20220303205944.469445-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303205944.469445-1-richard.henderson@linaro.org>
References: <20220303205944.469445-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

We will use VPSHLD, VPSHLDV and VPSHRDV for 16-bit rotates.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target-con-set.h |  1 +
 tcg/i386/tcg-target.opc.h     |  3 +++
 tcg/i386/tcg-target.c.inc     | 38 +++++++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/tcg/i386/tcg-target-con-set.h b/tcg/i386/tcg-target-con-set.h
index 78774d1005..91ceb0e1da 100644
--- a/tcg/i386/tcg-target-con-set.h
+++ b/tcg/i386/tcg-target-con-set.h
@@ -45,6 +45,7 @@ C_O1_I2(r, r, rI)
 C_O1_I2(x, x, x)
 C_N1_I2(r, r, r)
 C_N1_I2(r, r, rW)
+C_O1_I3(x, 0, x, x)
 C_O1_I3(x, x, x, x)
 C_O1_I4(r, r, re, r, 0)
 C_O1_I4(r, r, r, ri, ri)
diff --git a/tcg/i386/tcg-target.opc.h b/tcg/i386/tcg-target.opc.h
index 1312941800..b5f403e35e 100644
--- a/tcg/i386/tcg-target.opc.h
+++ b/tcg/i386/tcg-target.opc.h
@@ -33,3 +33,6 @@ DEF(x86_psrldq_vec, 1, 1, 1, IMPLVEC)
 DEF(x86_vperm2i128_vec, 1, 2, 1, IMPLVEC)
 DEF(x86_punpckl_vec, 1, 2, 0, IMPLVEC)
 DEF(x86_punpckh_vec, 1, 2, 0, IMPLVEC)
+DEF(x86_vpshldi_vec, 1, 2, 1, IMPLVEC)
+DEF(x86_vpshldv_vec, 1, 3, 0, IMPLVEC)
+DEF(x86_vpshrdv_vec, 1, 3, 0, IMPLVEC)
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 712ae3a168..a39f890a7d 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -424,6 +424,15 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_VPROLVQ     (0x15 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_VPRORVD     (0x14 | P_EXT38 | P_DATA16 | P_EVEX)
 #define OPC_VPRORVQ     (0x14 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
+#define OPC_VPSHLDW     (0x70 | P_EXT3A | P_DATA16 | P_VEXW | P_EVEX)
+#define OPC_VPSHLDD     (0x71 | P_EXT3A | P_DATA16 | P_EVEX)
+#define OPC_VPSHLDQ     (0x71 | P_EXT3A | P_DATA16 | P_VEXW | P_EVEX)
+#define OPC_VPSHLDVW    (0x70 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
+#define OPC_VPSHLDVD    (0x71 | P_EXT38 | P_DATA16 | P_EVEX)
+#define OPC_VPSHLDVQ    (0x71 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
+#define OPC_VPSHRDVW    (0x72 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
+#define OPC_VPSHRDVD    (0x73 | P_EXT38 | P_DATA16 | P_EVEX)
+#define OPC_VPSHRDVQ    (0x73 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_VPSLLVW     (0x12 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_VPSLLVD     (0x47 | P_EXT38 | P_DATA16)
 #define OPC_VPSLLVQ     (0x47 | P_EXT38 | P_DATA16 | P_VEXW)
@@ -2867,6 +2876,15 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     static int const sars_insn[4] = {
         OPC_UD2, OPC_PSRAW, OPC_PSRAD, OPC_VPSRAQ
     };
+    static int const vpshldi_insn[4] = {
+        OPC_UD2, OPC_VPSHLDW, OPC_VPSHLDD, OPC_VPSHLDQ
+    };
+    static int const vpshldv_insn[4] = {
+        OPC_UD2, OPC_VPSHLDVW, OPC_VPSHLDVD, OPC_VPSHLDVQ
+    };
+    static int const vpshrdv_insn[4] = {
+        OPC_UD2, OPC_VPSHRDVW, OPC_VPSHRDVD, OPC_VPSHRDVQ
+    };
     static int const abs_insn[4] = {
         /* TODO: AVX512 adds support for MO_64.  */
         OPC_PABSB, OPC_PABSW, OPC_PABSD, OPC_UD2
@@ -2959,6 +2977,16 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_x86_packus_vec:
         insn = packus_insn[vece];
         goto gen_simd;
+    case INDEX_op_x86_vpshldv_vec:
+        insn = vpshldv_insn[vece];
+        a1 = a2;
+        a2 = args[3];
+        goto gen_simd;
+    case INDEX_op_x86_vpshrdv_vec:
+        insn = vpshrdv_insn[vece];
+        a1 = a2;
+        a2 = args[3];
+        goto gen_simd;
 #if TCG_TARGET_REG_BITS == 32
     case INDEX_op_dup2_vec:
         /* First merge the two 32-bit inputs to a single 64-bit element. */
@@ -3061,7 +3089,12 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         insn = OPC_VPERM2I128;
         sub = args[3];
         goto gen_simd_imm8;
+    case INDEX_op_x86_vpshldi_vec:
+        insn = vpshldi_insn[vece];
+        sub = args[3];
+        goto gen_simd_imm8;
     gen_simd_imm8:
+        tcg_debug_assert(insn != OPC_UD2);
         if (type == TCG_TYPE_V256) {
             insn |= P_VEXL;
         }
@@ -3305,6 +3338,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_x86_vperm2i128_vec:
     case INDEX_op_x86_punpckl_vec:
     case INDEX_op_x86_punpckh_vec:
+    case INDEX_op_x86_vpshldi_vec:
 #if TCG_TARGET_REG_BITS == 32
     case INDEX_op_dup2_vec:
 #endif
@@ -3319,6 +3353,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_x86_psrldq_vec:
         return C_O1_I1(x, x);
 
+    case INDEX_op_x86_vpshldv_vec:
+    case INDEX_op_x86_vpshrdv_vec:
+        return C_O1_I3(x, 0, x, x);
+
     case INDEX_op_x86_vpblendvb_vec:
         return C_O1_I3(x, x, x, x);
 
-- 
2.25.1


