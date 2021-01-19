Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A982FBAE8
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:20:11 +0100 (CET)
Received: from localhost ([::1]:44274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1snh-0000RE-1U
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:20:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfG-0007fL-D2
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:26 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:54972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sf7-0001Co-Nd
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:25 -0500
Received: by mail-wm1-x336.google.com with SMTP id i63so63163wma.4
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PBlz1TMFJRfv2sxCoazqUKmH8KCoew4VRYTc4X8mWRY=;
 b=eZv5CpAkAlF70kjQkNNi09E0TR2VvnaWe1Anr87S6ybM9ekxIuMpkClmw4NDMJpm6y
 qKqEo9Sqp8TrogtxvdbSB6oAru2Iol/IAcBspEA4Ejp92/8+gbzn9Vt8P1TS7bV+vv1h
 OjUnMmVWW9nupqJ4FBWil+pyqiYXun8wKwajeh0oKErE4OwW9jQG1KJfGmpOCNEn9HGW
 GbpsW09+bLfAVY2R1OchSXxGBPIiutCEJUtQUeXvXTSF1Qpj4iQS+NUHwI/MkEv46fKd
 41BQ/sMN3EoHhwhYZJkh7ISE7vGB8IQZR02v0i81bK4buf/EmNL+6DTQa9kLKNrfIdYw
 byiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PBlz1TMFJRfv2sxCoazqUKmH8KCoew4VRYTc4X8mWRY=;
 b=Yf7OdxhhPgv/QRx+uDZLjThLpfyFDj6HvAcks98IYP+z/YlTMBoJ3m3IgxF/OBE6NY
 t/ejOxF0LI7b6MI6IIyDFPsUzt3gCNk4kO4e1txDBlKRW1d0/LFn3d92DnQ4D95PSqSZ
 mnfM/tKPTUIec8jb+pjpoNtXKJ/5zyNukHq5Mk+gUQyip+l6XmeciYx3efXnQ6yLHpPE
 8PcHH30vR8Xxdy/kWw/RrOmvgVk3ZAl4KqzzmXQL4v3y7ElvKirDaWLnIdwXLoe4AR2b
 /G/l/902OgVsjymFxpmt0RVVUHk6f7fchM0THxOtSeHBfvnm+tXiFz3IJZQtkN72YKL9
 IY5Q==
X-Gm-Message-State: AOAM530TfQs/Z8J99elsoLd6VFUBGYLiGmp2rTbjpmBsdAH0/UoZd8nF
 fRaujBG3Nl52qh2ToPznStHXMlzWsYC1Fg==
X-Google-Smtp-Source: ABdhPJz8k/Pju60NYRU0XQzAMo+wz2/ayPnefET575Qlt1w1bmIy4na1/4YnM9kT7vMy4YkSANVLMg==
X-Received: by 2002:a1c:9e86:: with SMTP id h128mr64390wme.171.1611069074798; 
 Tue, 19 Jan 2021 07:11:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a184sm4843699wme.35.2021.01.19.07.11.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 07:11:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/33] target/arm: add 64-bit S-EL2 to EL exception table
Date: Tue, 19 Jan 2021 15:10:41 +0000
Message-Id: <20210119151104.16264-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119151104.16264-1-peter.maydell@linaro.org>
References: <20210119151104.16264-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

With the ARMv8.4-SEL2 extension, EL2 is a legal exception level in
secure mode, though it can only be AArch64.

This patch adds the target EL for exceptions from 64-bit S-EL2.

It also fixes the target EL to EL2 when HCR.{A,F,I}MO are set in secure
mode. Those values were never used in practice as the effective value of
HCR was always 0 in secure mode.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210112104511.36576-7-remi.denis.courmont@huawei.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c    | 10 +++++-----
 target/arm/op_helper.c |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index fdf504464f1..47f37b82ba3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9002,13 +9002,13 @@ static const int8_t target_el_table[2][2][2][2][2][4] = {
       {{/* 0   1   1   0 */{ 3,  3,  3, -1 },{ 3, -1, -1,  3 },},
        {/* 0   1   1   1 */{ 3,  3,  3, -1 },{ 3, -1, -1,  3 },},},},},
     {{{{/* 1   0   0   0 */{ 1,  1,  2, -1 },{ 1,  1, -1,  1 },},
-       {/* 1   0   0   1 */{ 2,  2,  2, -1 },{ 1,  1, -1,  1 },},},
-      {{/* 1   0   1   0 */{ 1,  1,  1, -1 },{ 1,  1, -1,  1 },},
-       {/* 1   0   1   1 */{ 2,  2,  2, -1 },{ 1,  1, -1,  1 },},},},
+       {/* 1   0   0   1 */{ 2,  2,  2, -1 },{ 2,  2, -1,  1 },},},
+      {{/* 1   0   1   0 */{ 1,  1,  1, -1 },{ 1,  1,  1,  1 },},
+       {/* 1   0   1   1 */{ 2,  2,  2, -1 },{ 2,  2,  2,  1 },},},},
      {{{/* 1   1   0   0 */{ 3,  3,  3, -1 },{ 3,  3, -1,  3 },},
        {/* 1   1   0   1 */{ 3,  3,  3, -1 },{ 3,  3, -1,  3 },},},
-      {{/* 1   1   1   0 */{ 3,  3,  3, -1 },{ 3,  3, -1,  3 },},
-       {/* 1   1   1   1 */{ 3,  3,  3, -1 },{ 3,  3, -1,  3 },},},},},
+      {{/* 1   1   1   0 */{ 3,  3,  3, -1 },{ 3,  3,  3,  3 },},
+       {/* 1   1   1   1 */{ 3,  3,  3, -1 },{ 3,  3,  3,  3 },},},},},
 };
 
 /*
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index ff91fe61213..5e0f123043b 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -652,10 +652,10 @@ void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome,
         target_el = exception_target_el(env);
         break;
     case CP_ACCESS_TRAP_EL2:
-        /* Requesting a trap to EL2 when we're in EL3 or S-EL0/1 is
+        /* Requesting a trap to EL2 when we're in EL3 is
          * a bug in the access function.
          */
-        assert(!arm_is_secure(env) && arm_current_el(env) != 3);
+        assert(arm_current_el(env) != 3);
         target_el = 2;
         break;
     case CP_ACCESS_TRAP_EL3:
-- 
2.20.1


