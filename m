Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9290B2D5A10
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:12:42 +0100 (CET)
Received: from localhost ([::1]:35308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKoL-0000qC-Gs
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:12:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKR1-0001UH-Hj
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:35 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQj-00074Q-2L
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:35 -0500
Received: by mail-wr1-x42b.google.com with SMTP id c5so1532583wrp.6
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mcv/XrXC4b0o58at+mfsbi4y+Psa/cPzkJdZahv1VmE=;
 b=ZsKRt/A8Don/Cr6ShGiYancdWtH3ZUmxbpmzeFUR298iqwqjkOhFHdVTKwdhFn1x5Y
 gIxHMUxPL/DBp/Pa4k6W7g+IPlUmkv2yqzDrpegp8uE5OZAx3U7y11PWcMIyUGFfLYhA
 hXSS/uAwl3UiBcgct8ofM5pgYZ84nUbtd/3QIXBekBADCWC+8sJxXhCl+u8fMobjuzTy
 k1rX6UGOV/cF2bkj/s51OZ61hElrDi0JnkBW2tX0QTmAvlK0dv9Tcqbwdm+h3qPuEhan
 4N8CRlTiDnwXzGfv1DfE7DkDFdJRrp4Czxu6tYn9ZtubKrrUFJLhpUonnqEa0tSZshwb
 ymzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mcv/XrXC4b0o58at+mfsbi4y+Psa/cPzkJdZahv1VmE=;
 b=TSEkn+FEr6R9eJwgFIY47j+34H+tdy1f/UgEGgHNYMHr3qKVX3qPT/vUgWAwklacSu
 BnQQNCN3OHn14cl6JIKuOWmA8A/UW29kuYjqiGmy08ZMKBJAdFxYZOxb+JBj8qWjj63o
 94U5OfIoOSp2BekPrMYT+LsDE5xvOZTWh6bAMtvuTkHeTbzoagSgIxGLSl/kYRzD0mal
 F04D+0A1e6hi8jURyurIr9XQrEDrk65cVXQWqO6d7NRA0eXppf9Bga1CnrEHbCk6RNdS
 bPHsEb+BpYpv+G998Il1HcMPH90rP6i0Q8Ubv0NB+cnttXoJfPXaxmz/G6eYz2bXpySd
 kPWw==
X-Gm-Message-State: AOAM530ns+TBHYNsmEsxKjmJXTESDHNyGuas5/pUp0bOX+cCo6oAIjMr
 XkuoLezEXgvtRpBzho2sWgUcjv0SujDG2A==
X-Google-Smtp-Source: ABdhPJw8D1+VAM8VCOD17Qsx9sH+s9prDOVKWJR+lozgYFREcTdkZWh/Gl0u0v2JFEWmv3qFPmAWzw==
X-Received: by 2002:adf:d085:: with SMTP id y5mr2159035wrh.41.1607600895516;
 Thu, 10 Dec 2020 03:48:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/36] target/arm: Don't clobber ID_PFR1.Security on M-profile
 cores
Date: Thu, 10 Dec 2020 11:47:34 +0000
Message-Id: <20201210114756.16501-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

In arm_cpu_realizefn() we check whether the board code disabled EL3
via the has_el3 CPU object property, which we create if the CPU
starts with the ARM_FEATURE_EL3 feature bit.  If it is disabled, then
we turn off ARM_FEATURE_EL3 and also zero out the relevant fields in
the ID_PFR1 and ID_AA64PFR0 registers.

This codepath was incorrectly being taken for M-profile CPUs, which
do not have an EL3 and don't set ARM_FEATURE_EL3, but which may have
the M-profile Security extension and so should have non-zero values
in the ID_PFR1.Security field.

Restrict the handling of the feature flag to A/R-profile cores.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201119215617.29887-4-peter.maydell@linaro.org
---
 target/arm/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 07492e9f9a4..40f3f798b2b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1674,7 +1674,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         }
     }
 
-    if (!cpu->has_el3) {
+    if (!arm_feature(env, ARM_FEATURE_M) && !cpu->has_el3) {
         /* If the has_el3 CPU property is disabled then we need to disable the
          * feature.
          */
-- 
2.20.1


