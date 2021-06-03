Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E09739A550
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:07:36 +0200 (CEST)
Received: from localhost ([::1]:44644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lopsd-0007Na-Ah
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkZ-00081w-Sl
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:15 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkW-0006mr-5u
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:15 -0400
Received: by mail-wr1-x431.google.com with SMTP id j14so6385254wrq.5
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=grEElkudzhlG08Zt5qxe4SAKlLrlc5lljt/oYKSsh0g=;
 b=XEBsFM0J6bS5OWuXz2lAtzB7Id7ymYkoOaOivbvt59ETq+g++xIkbrQNsv7yoNMbHm
 v5kYM1tn6ErvIhMUCyUGDZIBy+Hu1ejU/gJ2HxuKCCSZkrk9TMj8tfJ1Brcf5whgRw+9
 jvyRS4MLoLj59U+7ABSTqKB/64wmzbXI+D9+qrnffTyv9bf9au3wspMmjcbeuP6E9VKa
 u9Ggjr4op2OCvo9gPs41ghwzDEGHh7S37gdWObsnz90yW4DkDjjDAK9vbyfRe/01zics
 fX4miGUswFpwtjTf/o2ZN1zg/dtDnpvw/EAHXhLzrkzFHPmMsMuZ3B83SDzG3u8u0WEk
 Amkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=grEElkudzhlG08Zt5qxe4SAKlLrlc5lljt/oYKSsh0g=;
 b=gVg4bF5KSxoHetiB3v3waw2WfAr3mDSRTgl8GKDIYPEtAW7XTtQK8xNMVRKzX2ZkYn
 ZDegTR2zmmEOVXBx12ZjwZcXDcYgupqtWOHpqP8uDsjhgZI6XMg9d23b+nSDoYS/gxed
 m6vKB0RjydVfT2rTZdm5q+k2R/YOtTJCEWXxV/XXgG9pgzxmDCT50DaZzWOsGW81hBvt
 grgbPmjP8F3GVipvahjynmq1LXiNhIEXU8CcRrBELceaI3lw5C3Ey5p48h3TTizVv1U4
 JCCOOYuAn5exgPhd2SoPblFBFlWdSnTvQ9J6mAtHlyAXwNf+lIBOSYZU+23wqspKoBGr
 jQdg==
X-Gm-Message-State: AOAM5333Qu1LTayTG1ALtF0V1DktrIXhkqhnJ22yHusalqx7qx2HWYpS
 JwJJqPjwkSZjT7IoQQvdhC75r6dRMnGeRBiU
X-Google-Smtp-Source: ABdhPJx4BGlmQi8Tvy0VZdiAtqY+JsEVuiufUNPPID20mLSYcpTge0VA7F1pO4D5BE21BzZje4SeKQ==
X-Received: by 2002:adf:a1d2:: with SMTP id v18mr646572wrv.280.1622735950825; 
 Thu, 03 Jun 2021 08:59:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/45] target/arm: Fix return values in fp_sysreg_checks()
Date: Thu,  3 Jun 2021 16:58:24 +0100
Message-Id: <20210603155904.26021-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

The fp_sysreg_checks() function is supposed to be returning an
FPSysRegCheckResult, which is an enum with three possible values.
However, three places in the function "return false" (a hangover from
a previous iteration of the design where the function just returned a
bool).  Make these return FPSysRegCheckFailed instead (for no
functional change, since both false and FPSysRegCheckFailed are
zero).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210520152840.24453-6-peter.maydell@linaro.org
---
 target/arm/translate-vfp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index ac5832a4ed5..791c4f5f70b 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -691,16 +691,16 @@ static FPSysRegCheckResult fp_sysreg_checks(DisasContext *s, int regno)
         break;
     case ARM_VFP_FPSCR_NZCVQC:
         if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
-            return false;
+            return FPSysRegCheckFailed;
         }
         break;
     case ARM_VFP_FPCXT_S:
     case ARM_VFP_FPCXT_NS:
         if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
-            return false;
+            return FPSysRegCheckFailed;
         }
         if (!s->v8m_secure) {
-            return false;
+            return FPSysRegCheckFailed;
         }
         break;
     default:
-- 
2.20.1


