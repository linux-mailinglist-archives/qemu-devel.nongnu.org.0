Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D69362C37
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 02:03:24 +0200 (CEST)
Received: from localhost ([::1]:37998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXYQl-00022r-1M
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 20:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYN6-0005Az-KD
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 19:59:36 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:47078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYN4-0005bB-Fq
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 19:59:36 -0400
Received: by mail-pf1-x429.google.com with SMTP id d124so19326313pfa.13
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 16:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P4NySGYmw96BmCITsEvNWRDoN+LZscH1OmpdX1Sy41g=;
 b=rEqA/G9gMX0jKakzD36y14c5dEo6QzZcyqVl0AVKo00XUVSrGCGLM+ijH/kacNA+kc
 sRFfPWxmHpJG++Y6VDwd3NlGfY9WsNnEKyfSAU+KQlMtZBMzXIWMQ5EjU7Rs5zhJvj2W
 1Bm0yq759KVfTKts4YSivCJrqewnwaV6c4FwQW/oIBiA/6z2+rkADbpmLaX6uw5FTvJl
 kKtVx+QtzbbB9LBHt/hNFVoerI1Z44V02SYT0zuKaDyih/WHB7CTG3qrwg0aOyDIq5op
 87i3GBdCbHZDYZvMC+Teb+7gkjZhaNAxhhj+oWHTERjd4a8TD3Ly0IxcDR1SB6w+qXak
 8LuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P4NySGYmw96BmCITsEvNWRDoN+LZscH1OmpdX1Sy41g=;
 b=A5yZ5Fn/S6B45r+HS5jx9DEG24D/aZQZbKqKLo7Ot3CYXiqFmyb07xUUutGn3HERsl
 n+0qn1Xcys1ufzT7ud8uHOIpOreFeM09jM9OAuj3lvMHppBgvZsTlS42tGgyNoF3j4jr
 cF+M6JWNH3qKO7aen8DphkEEdMqy44FySKQCw1Xuwd4qJBBCKRuADKg9Alh//ar1lKkY
 DlgJx7JrZxir4hGmiNlOvA0vsuKLF+0fHUwkroDXIXSW1WxGLW8J9On5INJeDG3pTxMW
 ODz7UQw5EUC2LYs5KLYucfomc1//sIlMn4mayMZXe29y6PlwGPH9FXLY8GsLPAkiUFAc
 207Q==
X-Gm-Message-State: AOAM532WMF0wQmBEhZycYzvaVaUAaPt/lZlp2iDwYe9I6fBrhAhYB5u9
 80V6FIJ7W85vp59KCOtL8w/vJvvxw2T5iQ==
X-Google-Smtp-Source: ABdhPJzr38zPH0RFo1SyvfOWiDgJF3N+PEDbUYOpnJb9QVRl1mTxuL/lmKrbqRrcFx3nGV1QhAZFhA==
X-Received: by 2002:a63:4513:: with SMTP id s19mr1295269pga.34.1618617573307; 
 Fri, 16 Apr 2021 16:59:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d71sm560853pfd.83.2021.04.16.16.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 16:59:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 03/11] target/arm: Implement scalar float32 to bfloat16
 conversion
Date: Fri, 16 Apr 2021 16:59:20 -0700
Message-Id: <20210416235928.1631788-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416235928.1631788-1-richard.henderson@linaro.org>
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the 64-bit BFCVT and the 32-bit VCVT{B,T}.BF16.F32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h            |  1 +
 target/arm/vfp.decode          |  2 ++
 target/arm/translate-a64.c     | 19 +++++++++++++++++++
 target/arm/vfp_helper.c        |  5 +++++
 target/arm/translate-vfp.c.inc | 24 ++++++++++++++++++++++++
 5 files changed, 51 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 33df62f44d..0892207f80 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -143,6 +143,7 @@ DEF_HELPER_3(vfp_cmped, void, f64, f64, env)
 
 DEF_HELPER_2(vfp_fcvtds, f64, f32, env)
 DEF_HELPER_2(vfp_fcvtsd, f32, f64, env)
+DEF_HELPER_FLAGS_2(bfcvt, TCG_CALL_NO_RWG, i32, f32, ptr)
 
 DEF_HELPER_2(vfp_uitoh, f16, i32, ptr)
 DEF_HELPER_2(vfp_uitos, f32, i32, ptr)
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 6f7f28f9a4..52535d9b0b 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -205,6 +205,8 @@ VCVT_f64_f16 ---- 1110 1.11 0010 .... 1011 t:1 1.0 .... \
 
 # VCVTB and VCVTT to f16: Vd format is always vd_sp;
 # Vm format depends on size bit
+VCVT_b16_f32 ---- 1110 1.11 0011 .... 1001 t:1 1.0 .... \
+             vd=%vd_sp vm=%vm_sp
 VCVT_f16_f32 ---- 1110 1.11 0011 .... 1010 t:1 1.0 .... \
              vd=%vd_sp vm=%vm_sp
 VCVT_f16_f64 ---- 1110 1.11 0011 .... 1011 t:1 1.0 .... \
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d8ec219bb2..d767194cc7 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -6288,6 +6288,9 @@ static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
     case 0x3: /* FSQRT */
         gen_helper_vfp_sqrts(tcg_res, tcg_op, cpu_env);
         goto done;
+    case 0x6: /* BFCVT */
+        gen_fpst = gen_helper_bfcvt;
+        break;
     case 0x8: /* FRINTN */
     case 0x9: /* FRINTP */
     case 0xa: /* FRINTM */
@@ -6565,6 +6568,22 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
         }
         break;
 
+    case 0x6:
+        switch (type) {
+        case 1: /* BFCVT */
+            if (!dc_isar_feature(aa64_bf16, s)) {
+                goto do_unallocated;
+            }
+            if (!fp_access_check(s)) {
+                return;
+            }
+            handle_fp_1src_single(s, opcode, rd, rn);
+            break;
+        default:
+            goto do_unallocated;
+        }
+        break;
+
     default:
     do_unallocated:
         unallocated_encoding(s);
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 01b9d8557f..fe7a2a5daa 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -408,6 +408,11 @@ float32 VFP_HELPER(fcvts, d)(float64 x, CPUARMState *env)
     return float64_to_float32(x, &env->vfp.fp_status);
 }
 
+uint32_t HELPER(bfcvt)(float32 x, void *status)
+{
+    return float32_to_bfloat16(x, status);
+}
+
 /*
  * VFP3 fixed point conversion. The AArch32 versions of fix-to-float
  * must always round-to-nearest; the AArch64 ones honour the FPSCR
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index e20d9c7ba6..709d1fddcf 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -3003,6 +3003,30 @@ static bool trans_VCVT_f64_f16(DisasContext *s, arg_VCVT_f64_f16 *a)
     return true;
 }
 
+static bool trans_VCVT_b16_f32(DisasContext *s, arg_VCVT_b16_f32 *a)
+{
+    TCGv_ptr fpst;
+    TCGv_i32 tmp;
+
+    if (!dc_isar_feature(aa32_bf16, s)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    fpst = fpstatus_ptr(FPST_FPCR);
+    tmp = tcg_temp_new_i32();
+
+    vfp_load_reg32(tmp, a->vm);
+    gen_helper_bfcvt(tmp, tmp, fpst);
+    tcg_gen_st16_i32(tmp, cpu_env, vfp_f16_offset(a->vd, a->t));
+    tcg_temp_free_ptr(fpst);
+    tcg_temp_free_i32(tmp);
+    return true;
+}
+
 static bool trans_VCVT_f16_f32(DisasContext *s, arg_VCVT_f16_f32 *a)
 {
     TCGv_ptr fpst;
-- 
2.25.1


