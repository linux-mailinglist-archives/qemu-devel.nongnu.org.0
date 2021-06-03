Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EC539A571
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:10:08 +0200 (CEST)
Received: from localhost ([::1]:53160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lopv4-0005Dw-EP
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopki-0000C1-ME
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:24 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:56114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkf-0006yI-Ev
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:24 -0400
Received: by mail-wm1-x336.google.com with SMTP id g204so3705004wmf.5
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Wqh7RQOq9hwUwMON5DQGW2Bekv7kpbEi7rQDGxxuy/Q=;
 b=ZTQtI5Vrw2PjArrj5ofkiQmOozic/vsdhB8IboBLfdg/YLHNPi3Ztje8ceWkRwr77b
 AfQDOI/zkbcfWfRQbjHSxNcMjpRW/p2mbDnB9xywa1DED6oHTHA6Z+uFNQz4SzUXutiH
 DrfaQYgf+8Pj7fPbIqSLEccMd7yIsbljErLbh7QW3EXR46haSDEKWGydHzSlwMWEiUQ6
 oE7g4JCnU2m0zCb03gu7UfuIIP2dV5DMqTzXD+yQKGTFdl1Ea9FkHlCncx+Fm7IoRWey
 9xqes3EkSs8q6cc2M0XYr2O793Pr+AKeTzl1y+zrrhP06gpJvQqUOx1c8LL3HaFYem7T
 xQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wqh7RQOq9hwUwMON5DQGW2Bekv7kpbEi7rQDGxxuy/Q=;
 b=LT5m3KefopSFZR+sRe5IeY8FSkPqqeJfOtBejP7Alo0w1Y/selaqwpyVWUI4Dq9NIh
 e5H/b/Tde6Y0knca+Fn1obJdFwIK/yVxgyhuk5+7SLDNm1fq8GgB62jERL9AtlzVyBkY
 L22uCbCvGXvzQ1kD4FfH/CYw2hQX9RFhkkiIpgc3/O1XMHHx7JeIQJ0IHnuLw8RJsyjm
 oJ5rRMDGnfp12fbE4QJPqt6YdwpIxuXunO+d0nzsPVfqUygr2mkFrmCvZqLCifsSG5EU
 ZSifnZ4JZUjptepSsDffhBSI7ToP4+Odirh6OfFy0KtsrOY2/UG6pleepC9i6OoFi8zK
 /TFg==
X-Gm-Message-State: AOAM533HxFBEaW3tBr371uEl+DgO5i49ZKSVmu35OE8hDPdYB0xpFSjG
 6Mwwm0escpMm2unuFseI5xUmIpABRMmzsjfc
X-Google-Smtp-Source: ABdhPJzCBCmd2b/5oxe4RGAaW59CczHKIah+zhpwUItOQXG5XRVDgh38hMqDgsDWvajrM9FYOTGqLw==
X-Received: by 2002:a05:600c:4f01:: with SMTP id
 l1mr4510534wmq.123.1622735960070; 
 Thu, 03 Jun 2021 08:59:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/45] target/arm: Implement scalar float32 to bfloat16
 conversion
Date: Thu,  3 Jun 2021 16:58:37 +0100
Message-Id: <20210603155904.26021-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

This is the 64-bit BFCVT and the 32-bit VCVT{B,T}.BF16.F32.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525225817.400336-4-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h        |  1 +
 target/arm/vfp.decode      |  2 ++
 target/arm/translate-a64.c | 19 +++++++++++++++++++
 target/arm/translate-vfp.c | 24 ++++++++++++++++++++++++
 target/arm/vfp_helper.c    |  5 +++++
 5 files changed, 51 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 23ccb0f72f6..9977a827e97 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -143,6 +143,7 @@ DEF_HELPER_3(vfp_cmped, void, f64, f64, env)
 
 DEF_HELPER_2(vfp_fcvtds, f64, f32, env)
 DEF_HELPER_2(vfp_fcvtsd, f32, f64, env)
+DEF_HELPER_FLAGS_2(bfcvt, TCG_CALL_NO_RWG, i32, f32, ptr)
 
 DEF_HELPER_2(vfp_uitoh, f16, i32, ptr)
 DEF_HELPER_2(vfp_uitos, f32, i32, ptr)
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 6f7f28f9a46..52535d9b0b8 100644
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
index 95c2853f39f..b335ca87355 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -6280,6 +6280,9 @@ static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
     case 0x3: /* FSQRT */
         gen_helper_vfp_sqrts(tcg_res, tcg_op, cpu_env);
         goto done;
+    case 0x6: /* BFCVT */
+        gen_fpst = gen_helper_bfcvt;
+        break;
     case 0x8: /* FRINTN */
     case 0x9: /* FRINTP */
     case 0xa: /* FRINTM */
@@ -6557,6 +6560,22 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
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
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 2316e105acc..d01e465821b 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -3085,6 +3085,30 @@ static bool trans_VCVT_f64_f16(DisasContext *s, arg_VCVT_f64_f16 *a)
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
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index e0886ab5a56..200439ad663 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -411,6 +411,11 @@ float32 VFP_HELPER(fcvts, d)(float64 x, CPUARMState *env)
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
-- 
2.20.1


