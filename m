Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD73864EDCF
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 16:24:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6CZS-0002HV-8i; Fri, 16 Dec 2022 10:24:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6CZO-0002H7-Mf
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 10:24:18 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6CZK-0000wo-Uk
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 10:24:17 -0500
Received: by mail-wr1-x42b.google.com with SMTP id y16so2863157wrm.2
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 07:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WafTAAJogOWdkFpTF0q8FAoLgjZ785o76HD8t7NlFkQ=;
 b=bYNOhOQ9WX5/NSbIURI8/FBgWbyuHdV+lCOkcvP1UocLdMnVlBn2hcMPtZOp4YIcDn
 7Df5JhrtYkyZ2112TNcDWhVQIpqFydN/rMv9wHWHUJYGG3Sgp2gdb+MZSJRTqH4F4HBl
 /QCkcz17ZPMJIsXwKSh1+YyUnpRLbLpcEKyAvjaECbevdAYmjJXdlpT2gFdHp7h88sHr
 4G/uBmBV0s84NfJ3wRUllF+Cajqu6cf+rWpvkD6whdmCBA+DMsv6Iy7Fc4vwm6yEwMrA
 C//wm2Uw+d0GrvjkOcMZlYHRVY0cRsC3CHb77AitcthajzHvSYOacGYwzSB1anO3L6vj
 MQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WafTAAJogOWdkFpTF0q8FAoLgjZ785o76HD8t7NlFkQ=;
 b=VW2mqc3YH7aZrOEvmPu5pvlGy59+DelifBmovvaXIdIftjcg56HFrVptp5/FbwvL0U
 aNDghhWR3m5/XWIln0EFE1ZVvp1yMw3l8SUlqzlcbiuwfeCpyC5+zJa1TO0/PAoQI1CO
 UP7Oa4XJsaHFveFcTE90qsgnDhKBSnLBzpoZBDHznkoeqc0UgLEEOLtuzlFXOggy2oBy
 Og9kUmrBzN4nk5Rqi+aj7gW/WXd2jXwYpXkCRX7QgBlI16O3WurO7MrZWBHKsHvCUmpU
 D/VVpKBKCo05SSXEhhmI3KYXNtsIbdml34FoUsn9tHDkNoDp1/9hdAc6vFB+YW1QCtbM
 xjbQ==
X-Gm-Message-State: ANoB5pl2eQcwwEtAcVvraUE6fsNQAIPdtwwrFj1hKNGwngsR3VbVk66v
 91HXzWJ86VJ6cv1/Rhj5cxKEwg==
X-Google-Smtp-Source: AA0mqf71mZWx+70+NZ2msdG6w6+SJpmD3gx55ybsG8qhZPAEniOt3A8WCIzVAkFPGMI7vgiLHYbsnw==
X-Received: by 2002:a05:6000:170f:b0:253:62af:8025 with SMTP id
 n15-20020a056000170f00b0025362af8025mr12350917wrc.61.1671204252745; 
 Fri, 16 Dec 2022 07:24:12 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a5d510d000000b00241e5b917d0sm2953008wrt.36.2022.12.16.07.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 07:24:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Igor Kotrasinski <i.kotrasinsk@samsung.com>
Subject: [PATCH] target/arm: Don't set EXC_RETURN.ES if Security Extension not
 present
Date: Fri, 16 Dec 2022 15:24:10 +0000
Message-Id: <20221216152410.1185369-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
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

In v7m_exception_taken(), for v8M we set the EXC_RETURN.ES bit if
either the exception targets Secure or if the CPU doesn't implement
the Security Extension.  This is incorrect: the v8M Arm ARM specifies
that the ES bit should be RES0 if the Security Extension is not
implemented, and the pseudocode agrees.

Remove the incorrect condition, so that we leave the ES bit 0
if the Security Extension isn't implemented.

This doesn't have any guest-visible effects for our current set of
emulated CPUs, because all our v8M CPUs implement the Security
Extension; but it's worth fixing in case we add a v8M CPU without
the extension in future.

Reported-by: Igor Kotrasinski <i.kotrasinsk@samsung.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/m_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 355cd4d60a7..2b55e90ea9d 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -895,7 +895,7 @@ static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailchain,
         }
 
         lr &= ~R_V7M_EXCRET_ES_MASK;
-        if (targets_secure || !arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+        if (targets_secure) {
             lr |= R_V7M_EXCRET_ES_MASK;
         }
         lr &= ~R_V7M_EXCRET_SPSEL_MASK;
-- 
2.25.1


