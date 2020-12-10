Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FB72D59F3
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:05:32 +0100 (CET)
Received: from localhost ([::1]:42134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKhP-0000LZ-P4
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:05:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKR4-0001Y1-82
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:38 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:54428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQs-00077e-Bg
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:37 -0500
Received: by mail-wm1-x342.google.com with SMTP id d3so4380302wmb.4
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=XFqW4OUMJKJNIdAWJJrDAuilTkugbK+/iNLz4Uk/fzU=;
 b=MtsDOOPY9T+kXMLa08wM7BzpMM8Bk/5rs/OKQqVV8BKO+CuYWOXp3IS1FEdjw5Nksh
 yXGCvGMrfuuK8Ko435dSkYkpXSf/sG67FrilzvcBoghejliEPE4WbqNtuISc651e2j+t
 EPv8PIujH4W6TAbTDezT3wXPxMqV8bQ8OmpUgqQXPNvdVD/c2heWBISQylvJFqyD6ySJ
 TpB+DemqDtzh+7WfxysU+pYIey4M2iMURQPjPL6EFbYKDebAjQS4OZlh+pa5sOTentJ7
 OeejSTN2ce+f6ppsjKoT3kAtTZMAM2Wptu+gc+yxXZQmxttpoZgblsfiTxV3lgEcfOlj
 uYig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XFqW4OUMJKJNIdAWJJrDAuilTkugbK+/iNLz4Uk/fzU=;
 b=VMmpQmGXellpWl12FB3B3FOiMnD2a+vtiY1kuUMgURudVJWv1fyHUfK0J4CMRMiziM
 /wXpZ7SR7g5gCKrKZ5OIdPsAjn9RWxeZBBjf4sy0SYbxRD4CkBjx0gKk/l7rSiQZnn6C
 Y85PwAPhbkGbKJkA8emk6ydD0Qi4sj1rsbqxByxFsqQinZctE5mKBxaoAQK8jvWJ1Ks+
 s49bhJmN7vtKbfszBsyqcgKpmNCJWTceNNO1AIHfKId6HKohBhO8Rx4rAVeozDU2xutd
 4ZiFV8y8NSkInD386oQlc/znrqPOGABp0HdsE/IP+38Ys0JsaqVE+xQu0UrIyZthmkc9
 Yy+g==
X-Gm-Message-State: AOAM53360L4yqCqi4wtzAwn46iBw2kN9D9JQJKGuRlNRE+JSKpz6ZsjY
 sprZRHPfc3AqoOBr8FgbCa2jf+CodBMklQ==
X-Google-Smtp-Source: ABdhPJzhy71pyhIgJ2g88EZxM9mv0i4mzdpRJnWiKUZq4AgWyP3Xt2Lck2RaKdHDexQOtNAU29DsUA==
X-Received: by 2002:a1c:4e0a:: with SMTP id g10mr7768906wmh.51.1607600903956; 
 Thu, 10 Dec 2020 03:48:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/36] target/arm: Use new FPCR_NZCV_MASK constant
Date: Thu, 10 Dec 2020 11:47:42 +0000
Message-Id: <20201210114756.16501-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
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

We defined a constant name for the mask of NZCV bits in the FPCR/FPSCR
in the previous commit; use it in a couple of places in existing code,
where we're masking out everything except NZCV for the "load to Rt=15
sets CPSR.NZCV" special case.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201119215617.29887-12-peter.maydell@linaro.org
---
 target/arm/translate-vfp.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index d698f3e1cd1..cd8d5b4f28b 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -744,7 +744,7 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
          * helper call for the "VMRS to CPSR.NZCV" insn.
          */
         tmp = load_cpu_field(vfp.xregs[ARM_VFP_FPSCR]);
-        tcg_gen_andi_i32(tmp, tmp, 0xf0000000);
+        tcg_gen_andi_i32(tmp, tmp, FPCR_NZCV_MASK);
         storefn(s, opaque, tmp);
         break;
     default:
@@ -885,7 +885,7 @@ static bool trans_VMSR_VMRS(DisasContext *s, arg_VMSR_VMRS *a)
         case ARM_VFP_FPSCR:
             if (a->rt == 15) {
                 tmp = load_cpu_field(vfp.xregs[ARM_VFP_FPSCR]);
-                tcg_gen_andi_i32(tmp, tmp, 0xf0000000);
+                tcg_gen_andi_i32(tmp, tmp, FPCR_NZCV_MASK);
             } else {
                 tmp = tcg_temp_new_i32();
                 gen_helper_vfp_get_fpscr(tmp, cpu_env);
-- 
2.20.1


