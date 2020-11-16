Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6732B4B27
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 17:31:38 +0100 (CET)
Received: from localhost ([::1]:53956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kehPl-0006JH-AI
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 11:31:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3i-0000FH-VA
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:50 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3f-0007t0-Om
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:50 -0500
Received: by mail-wr1-x431.google.com with SMTP id j7so19264513wrp.3
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 08:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jGBMU7bzpMOwqakNt2x4ljUeQHAKAHImkilvx3m/k4s=;
 b=xBGB/JazUWdCIHlJzYp60jV+0My5NdvvhQuFNGsj4bNKFc+A/qYz22zeRzVpWBcvRH
 mJcL+0i4C/LS2s4vAnVdYwdbeSVL8xuXYKgp8OwTLVRiqe+iVGwf4dLsIS6du7yh27Q7
 dSuIN/eS6xlYc2Nq/ZijfUpAskC1HrqYvzUqV20nL8CENhmIn/ATwC6BnzRYi064fmkj
 sO0+ziOpPsDpG62vhEa20w6pxIFY9OnB+YWUWUUBlybGnKzmx/UwjWGGBG62mw43t4QB
 Mtl2l1tkC5yjP0R9Wm885pGnIMqBaahD/ZeVf/614ioEHHfDLni8gPQqY5rO6swDT2Sb
 RSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jGBMU7bzpMOwqakNt2x4ljUeQHAKAHImkilvx3m/k4s=;
 b=A6LavbXqSzCpo5zqrxUCjU5miPYgK+PERT77+P6p51qkYtQjPL6LHDVlaEg+W71oXE
 BEZSPUwA0OjS+OyjuXNRnT8KQ3lbJU3qdpsH2Y/PLRciaHWuaAWKT/WrCHPu/dIXingP
 Unq6lEVOV9rfxV4hDVDFwrAATrHYvW3i9iV2GI3xh6NDDwXhdahk7vb+8rA3yqEvbc+c
 EVW++DvuBM//QHPnf+AnbNtxeLHHCWrr+Sm1RJJO8zMvgygmNGHqr6PAMFXoud5SRqgM
 5dLkA1VKfSlWxFdL5epPKWeTnuP8kQ5ZNMwxE5j2kgypUXVR6j1BoqQvKv4hZf5IckOK
 tPow==
X-Gm-Message-State: AOAM530viGSPYaPGZYHlc1iM2nfhSOnj14C4u7ybAypXDRpeD2pSYLNN
 MlxUOLTxLkeM0v58Fv98azHXats7aCFcCA==
X-Google-Smtp-Source: ABdhPJwUMkyWij95qV84qdFOEh97ZBT+0S0p7DuQpHjuM7mKrdZiXD6fr/PFaRi81DZRT7FJSZr3Tg==
X-Received: by 2002:a5d:4448:: with SMTP id x8mr19938152wrr.364.1605542926314; 
 Mon, 16 Nov 2020 08:08:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g20sm20116975wmh.20.2020.11.16.08.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 08:08:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 10/15] target/arm: Implement M-profile FPSCR_nzcvqc
Date: Mon, 16 Nov 2020 16:08:26 +0000
Message-Id: <20201116160831.31000-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116160831.31000-1-peter.maydell@linaro.org>
References: <20201116160831.31000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

v8.1M defines a new FP system register FPSCR_nzcvqc; this behaves
like the existing FPSCR, except that it reads and writes only bits
[31:27] of the FPSCR (the N, Z, C, V and QC flag bits).  (Unlike the
FPSCR, the special case for Rt=15 of writing the CPSR.NZCV is not
permitted.)

Implement the register.  Since we don't yet implement MVE, we handle
the QC bit as RES0, with todo comments for where we will need to add
support later.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h               | 13 +++++++++++++
 target/arm/translate-vfp.c.inc | 27 +++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 3b20f935174..34f8f4afe18 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1524,6 +1524,13 @@ void vfp_set_fpscr(CPUARMState *env, uint32_t val);
 #define FPCR_FZ     (1 << 24)   /* Flush-to-zero enable bit */
 #define FPCR_DN     (1 << 25)   /* Default NaN enable bit */
 #define FPCR_QC     (1 << 27)   /* Cumulative saturation bit */
+#define FPCR_V      (1 << 28)   /* FP overflow flag */
+#define FPCR_C      (1 << 29)   /* FP carry flag */
+#define FPCR_Z      (1 << 30)   /* FP zero flag */
+#define FPCR_N      (1 << 31)   /* FP negative flag */
+
+#define FPCR_NZCV_MASK (FPCR_N | FPCR_Z | FPCR_C | FPCR_V)
+#define FPCR_NZCVQC_MASK (FPCR_NZCV_MASK | FPCR_QC)
 
 static inline uint32_t vfp_get_fpsr(CPUARMState *env)
 {
@@ -1568,6 +1575,12 @@ enum arm_cpu_mode {
 #define ARM_VFP_FPEXC   8
 #define ARM_VFP_FPINST  9
 #define ARM_VFP_FPINST2 10
+/* These ones are M-profile only */
+#define ARM_VFP_FPSCR_NZCVQC 2
+#define ARM_VFP_VPR 12
+#define ARM_VFP_P0 13
+#define ARM_VFP_FPCXT_NS 14
+#define ARM_VFP_FPCXT_S 15
 
 /* QEMU-internal value meaning "FPSCR, but we care only about NZCV" */
 #define QEMU_VFP_FPSCR_NZCV 0xffff
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index cc115f1d35d..84e806004e4 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -648,6 +648,11 @@ static fp_sysreg_check_result fp_sysreg_checks(DisasContext *s, int regno)
     case ARM_VFP_FPSCR:
     case QEMU_VFP_FPSCR_NZCV:
         break;
+    case ARM_VFP_FPSCR_NZCVQC:
+        if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
+            return false;
+        }
+        break;
     default:
         return fp_sysreg_check_failed;
     }
@@ -682,6 +687,22 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
         tcg_temp_free_i32(tmp);
         gen_lookup_tb(s);
         break;
+    case ARM_VFP_FPSCR_NZCVQC:
+    {
+        TCGv_i32 fpscr;
+        tmp = loadfn(s, opaque);
+        /*
+         * TODO: when we implement MVE, write the QC bit.
+         * For non-MVE, QC is RES0.
+         */
+        tcg_gen_andi_i32(tmp, tmp, FPCR_NZCV_MASK);
+        fpscr = load_cpu_field(vfp.xregs[ARM_VFP_FPSCR]);
+        tcg_gen_andi_i32(fpscr, fpscr, ~FPCR_NZCV_MASK);
+        tcg_gen_or_i32(fpscr, fpscr, tmp);
+        store_cpu_field(fpscr, vfp.xregs[ARM_VFP_FPSCR]);
+        tcg_temp_free_i32(tmp);
+        break;
+    }
     default:
         g_assert_not_reached();
     }
@@ -710,6 +731,12 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         gen_helper_vfp_get_fpscr(tmp, cpu_env);
         storefn(s, opaque, tmp);
         break;
+    case ARM_VFP_FPSCR_NZCVQC:
+        /*
+         * TODO: MVE has a QC bit, which we probably won't store
+         * in the xregs[] field. For non-MVE, where QC is RES0,
+         * we can just fall through to the FPSCR_NZCV case.
+         */
     case QEMU_VFP_FPSCR_NZCV:
         /*
          * Read just NZCV; this is a special case to avoid the
-- 
2.20.1


