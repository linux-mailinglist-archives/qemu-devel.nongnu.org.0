Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED862B9D5D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 23:08:09 +0100 (CET)
Received: from localhost ([::1]:46906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfs64-000686-Lx
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 17:08:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfruz-0000kL-Et
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:56:43 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:35689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrut-0004BG-11
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:56:40 -0500
Received: by mail-wm1-x32c.google.com with SMTP id w24so8079799wmi.0
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 13:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Bs7VQGF+Epl5dZ+q3vps3mLgkN/vGMivqNsTt71dwm8=;
 b=oA7gVbTWZTt37QDLprXb/lVmoFA2pgIdX0su8AJgdOvc9u0nLh65Y8/k6BCiFKGEUR
 EEMOziIeBspfWQNpB5pG21kYk8HMMi3MRl0DnrR5NVdRnmPoxswcWXbqKf/duSWH3c0F
 1BQqypH4Er+xomJbb1N4Y4jqnYqqUePKQCOk6ha5wGNqW4Gt/4hKXQwHRUn4DRFADViV
 If5RW+QUIT25VAfIHta4qDsQh3fvQR6fltf/dl22pfBdC7T3OQTRqbaI12/b6P9lyCMj
 FDtibzMdpI0D4uvxohyRswB7OtqUOh5Ne0WpDE5MBJTolcQvBxDaw8Tn3lR5QWRNzeYC
 Lb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bs7VQGF+Epl5dZ+q3vps3mLgkN/vGMivqNsTt71dwm8=;
 b=buMBea0ovy9lGuxUJn/RXZ/LU8nIBbvL+cEhuw6D9Oo7O2AXQw1L+Ja5FT0XjmXWc5
 72j96ovo0yfaZDmTArS9BS1cK3DeTrPFc/gVgXuysdhK9rOQR/HoyEDfz8wftj7scN+Q
 vnlZPR/7TtcL+neQfPUPaU2NbqZnmeZ0naqis8orwb6+CQ2k5/tOTt0YE3sy/xQbeLZx
 L6LE7MdVa9sioH5OBq/oFOOssGQww5KIfGKKZ+v62f5ZeXjAvSOJNbXHU9eknfVAUHqv
 qp4AswLy0aUUfsfApduRYCXGwItVmaS5KjtN91DY2WF5WOmb7ABes2YlYBIPN9Cd2Rcz
 0kgw==
X-Gm-Message-State: AOAM5312CxkOxYa1zr+8OjTv9drAi5Jp0TbQ44DGX/l0ddv3wlmjA2X8
 BEoGrStVUEkQhZ4Bc0qNM5y87A==
X-Google-Smtp-Source: ABdhPJwD+e3jTYI+KuAD2ckSiZudCxC0vwxEThvzYBNrcc+j9FKN0ZQ1j5Q5S8AT2qCoeO9691zksQ==
X-Received: by 2002:a1c:21c1:: with SMTP id h184mr6999755wmh.106.1605822991957; 
 Thu, 19 Nov 2020 13:56:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 10/28] target/arm: Implement M-profile FPSCR_nzcvqc
Date: Thu, 19 Nov 2020 21:55:59 +0000
Message-Id: <20201119215617.29887-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
index ad8b80c667d..04f6220b2f7 100644
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
index dc26759ab95..6c4b7db8213 100644
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


