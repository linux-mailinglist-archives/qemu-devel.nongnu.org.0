Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4F52D5A5D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:22:04 +0100 (CET)
Received: from localhost ([::1]:60946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKxP-000371-Kl
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:22:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKR5-0001ZX-0r
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:39 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQs-00077W-FG
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:38 -0500
Received: by mail-wr1-x436.google.com with SMTP id t16so5161761wra.3
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/LTSIYlir4ilpKHjcrz/1PwD2k3uNW7FvzrH/uQrWPA=;
 b=Wk88U7EW87Kdjm9c2zNUA+mfoKUWVfPOpdlGq9n9LkhxyvtZsaxQ6bHhHysrOYkbBg
 t22BsNdG8eMTZhE1OMrcw9u/4HExjDIdLEulRGVUjT/izSV+2eJjkP8UUtdISCatNPSG
 AI93GJ0q3Pbv2nbjw0v33iUSgYGkYSIU0RWOKuxMrX48eY3AROjshXB/DgpvCjq+tqzi
 f9vGyFA2Iuu0/u3FKnt1rIMr6VqJw5x2o3FdCQN+HJvnRzSHEj0sDRmEPYBX4XIR5dGp
 zdvT/0b+JFXbbqfo0ofmWYJgs4gT8NkSF/6CXKRRlrEFLgUI20zY8TsVEav+Q/MvSfDV
 QDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/LTSIYlir4ilpKHjcrz/1PwD2k3uNW7FvzrH/uQrWPA=;
 b=Kk9/52LDaqUi7kN1SpIP7LT1O+3sy5WC1UuDlOWYoz9hZWHBmzZOJ9ddRJXb/eE1Td
 jfFSaoO+iv/UjRSyJ2O3Fxe22dkAbHPyi9I5ksnoQTSogfhcTQ9kf8bLfcx4g/kn5OAt
 ATPNErhn/I7pnw2mA23vida7qlA/4uH305jdaqn9jqFz43gbq84FiMdmaZPs0u3HYKKZ
 /ARx0mZBr8/QaW+XDrPAw6pBqImf+f6AwJSp0P70gvd6NbtsDOXcNPs+ENx9PeQ4o23M
 n3EypYGxv1TUDapUI314DSYGysNfMHL2D0PUW2io2eSIuNF9ZO61hkdsfvX4inCP4zdD
 bfQw==
X-Gm-Message-State: AOAM5329ogY61AY274bkVfxaXDrKcnVMnZl/7/Dk9qznhUej4tBXxoBt
 t5S1xlqq6GFGQBIQeeI3F1bBGUZB5Ig2/w==
X-Google-Smtp-Source: ABdhPJxmfHYRatGh5N+ceUOmv6b6GorLa2uh0nlxWtDq2xREpENZn0K2oeltDZu/4iVJ3HKTeInJEA==
X-Received: by 2002:a5d:6ccb:: with SMTP id c11mr7849199wrc.224.1607600902975; 
 Thu, 10 Dec 2020 03:48:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/36] target/arm: Implement M-profile FPSCR_nzcvqc
Date: Thu, 10 Dec 2020 11:47:41 +0000
Message-Id: <20201210114756.16501-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201119215617.29887-11-peter.maydell@linaro.org
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
index f884d680a03..d698f3e1cd1 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -648,6 +648,11 @@ static FPSysRegCheckResult fp_sysreg_checks(DisasContext *s, int regno)
     case ARM_VFP_FPSCR:
     case QEMU_VFP_FPSCR_NZCV:
         break;
+    case ARM_VFP_FPSCR_NZCVQC:
+        if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
+            return false;
+        }
+        break;
     default:
         return FPSysRegCheckFailed;
     }
@@ -683,6 +688,22 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
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
@@ -711,6 +732,12 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
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


