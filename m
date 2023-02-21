Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4288569D86A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 03:22:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUIGa-0001gm-GC; Mon, 20 Feb 2023 21:20:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIGK-0001eQ-RZ
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 21:20:13 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIGI-00080h-VG
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 21:20:12 -0500
Received: by mail-pj1-x102e.google.com with SMTP id o16so3252675pjp.3
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 18:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tb7eak0fnXBbpHkQ6RD7c94PCh+h4m119aRi0NXAmMg=;
 b=KIJ4RUa4hsxt5EzAwRK3FCS+hbKTODP87zNvuJbzU5AcUG2LVJ0+Z/XQNDIWsEKWVu
 KoXMd1D4pNcxSlD38lhBjne1GzQZjvqwDShAUL8a39M+ytK9/O7LvFSO2zXKsnc5Y1ny
 6z7mvjKNT2gTJLXY0W7IKubP+UWIE14L09MOpCpPit9WEjFGUJSllfMlfCLPim1hqnu3
 JFpbJ1dOFfx37cSqKQTP5/xsdL1M3bbDEtIOxGQE1wqKzY/SfTLstiFOYGa0fUj3hC0r
 oP4muKgXhdslhd/0hnBBJvmAjow0iOJWz7re4SHmWkMh1otzJCoMs4Up/PfyVDlaq1wX
 01iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tb7eak0fnXBbpHkQ6RD7c94PCh+h4m119aRi0NXAmMg=;
 b=N7/sKSNmVJo7qSvM8sO8jedPZ+SYWucMtfmzG2vaTEu/oRJ8r+YxMk/GDY7hCgyUFI
 WPEEqp4aAFUYMxsg8wvfhggIH71a5RH0TKeRq1dppKhmpCgLac92lXcwrRsOGm6b/3yj
 VhX1E/2l30GVRE/pY+RcWPSvLIK1MwP/h6apX4qa/wBxMACo7kIWpFDh6MND3silWUIs
 qoSL6Bp1TCTJXXjzUDJCpePdfOOrLz5DAlQJuWssJHJCEKy5engy3l73GXz8fmhFbqPW
 PsiQISbDOMgBi04O24WUL+taFOdIArqKJVrDyo6kToU8nEeC2ruRfZN5E1eV3DD5t0qT
 XbUw==
X-Gm-Message-State: AO0yUKWEQCCVrkAhO+RicDHrvwflWmyHn/ArEI+s/Ws+wADDeXkWMXw+
 rnohNCJai/fxllxLxpyPKUWOHPcUeVkYJ0IDC8M=
X-Google-Smtp-Source: AK7set/971+p/EHo1IXakqwEwjsNVEGQVuN6kTX7Wjd/j+c6eRnJhKSnnuOBEHL3roNH1mLzSYvOuQ==
X-Received: by 2002:a17:902:ec83:b0:19a:e7d7:485b with SMTP id
 x3-20020a170902ec8300b0019ae7d7485bmr5151549plg.34.1676946010119; 
 Mon, 20 Feb 2023 18:20:10 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a170902e98300b0019141c79b1dsm8559328plb.254.2023.02.20.18.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 18:20:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 10/14] target/arm: Create pauth_ptr_mask
Date: Mon, 20 Feb 2023 16:19:47 -1000
Message-Id: <20230221021951.453601-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221021951.453601-1-richard.henderson@linaro.org>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Keep the logic for pauth within pauth_helper.c, and expose
a helper function for use with the gdbstub pac extension.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h    | 10 ++++++++++
 target/arm/pauth_helper.c | 26 ++++++++++++++++++++++----
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 32b8562cbf..370655061e 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1350,6 +1350,16 @@ int exception_target_el(CPUARMState *env);
 bool arm_singlestep_active(CPUARMState *env);
 bool arm_generate_debug_exceptions(CPUARMState *env);
 
+/**
+ * pauth_ptr_mask:
+ * @env: cpu context
+ * @ptr: selects between TTBR0 and TTBR1
+ * @data: selects between TBI and TBID
+ *
+ * Return a mask of the bits of @ptr that contain the authentication code.
+ */
+uint64_t pauth_ptr_mask(CPUARMState *env, uint64_t ptr, bool data);
+
 /* Add the cpreg definitions for debug related system registers */
 void define_debug_regs(ARMCPU *cpu);
 
diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
index d0483bf051..20f347332d 100644
--- a/target/arm/pauth_helper.c
+++ b/target/arm/pauth_helper.c
@@ -339,14 +339,32 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
     return pac | ext | ptr;
 }
 
-static uint64_t pauth_original_ptr(uint64_t ptr, ARMVAParameters param)
+static uint64_t pauth_ptr_mask_internal(ARMVAParameters param)
 {
-    /* Note that bit 55 is used whether or not the regime has 2 ranges. */
-    uint64_t extfield = sextract64(ptr, 55, 1);
     int bot_pac_bit = 64 - param.tsz;
     int top_pac_bit = 64 - 8 * param.tbi;
 
-    return deposit64(ptr, bot_pac_bit, top_pac_bit - bot_pac_bit, extfield);
+    return MAKE_64BIT_MASK(bot_pac_bit, top_pac_bit - bot_pac_bit);
+}
+
+static uint64_t pauth_original_ptr(uint64_t ptr, ARMVAParameters param)
+{
+    uint64_t mask = pauth_ptr_mask_internal(param);
+
+    /* Note that bit 55 is used whether or not the regime has 2 ranges. */
+    if (extract64(ptr, 55, 1)) {
+        return ptr | mask;
+    } else {
+        return ptr & ~mask;
+    }
+}
+
+uint64_t pauth_ptr_mask(CPUARMState *env, uint64_t ptr, bool data)
+{
+    ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
+    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data);
+
+    return pauth_ptr_mask_internal(param);
 }
 
 static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
-- 
2.34.1


