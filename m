Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E4751C94C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:36:36 +0200 (CEST)
Received: from localhost ([::1]:54038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmhH9-0006LE-MU
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYg-00036P-9K
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:50:38 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:34364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYd-0004NF-T4
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:50:38 -0400
Received: by mail-oi1-x231.google.com with SMTP id j12so337895oie.1
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 11:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GY2odDA192T0ClkUF75+bPEfdCFgpsNoLihYttz/3zY=;
 b=RuupAJxij1iUWDYoPju8S2pJjrLZ6lUUNzfm0xNTEUHt1bxfRU3/MTVwCxt4Jcf01X
 arIa8pwsnC3k9TlGbo7PwCSTUvqLTpC4yjj2X2f4E6erW5HWO9ez5qogDrRFa7jxeRwr
 4gDWP2/kQ1kzDwq52Lu+/n6ocJrZbKB/gT9idufYJyChbEwDfbNVV+HgzD9MCHtfLD8j
 sbPGw5mBZxqCJqWwn16KQ9od3DvMX/9vOwYvwENT3XxvXKpQYp+VZCBh9kFU7oDmgEc1
 Qw/qQ1dAhSaOn7dNKOPIOujt4KHXxsDJpnwKa8McaNdTiNdCBhKI26vAMDRj1U5gCj2s
 acjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GY2odDA192T0ClkUF75+bPEfdCFgpsNoLihYttz/3zY=;
 b=pdcNWwTycMmwId+JiWkQx0XBG6pFFuaUEn/6rn1I1YaiMYW/q2C5RNIJmdOUC8hK3x
 gZfTt81aKjkhxjz/hKI9OfES5FSe43Mfr1g71APDmEnQvfC+kfxK4pye0JC2c5txUYTr
 aBd56rE9RD3j0WmOgT2cksj5+yofaz16MDUjm1y2wdvW4ZvM2xqeHeyvgyN0aKwv2Jc4
 nfXn+DMt/ODhZqt2ujy9FTgGulFefAzc8sPQER3Jh1dLFSmEmH5em37LpgWiO2wnCJNn
 3AkS2Pb8Ngq/q/Y76/RyVK0qcsMsLvWdacD5rgaYWPScwyC551J4WVxvjEzDG7bLxmUB
 mVDQ==
X-Gm-Message-State: AOAM531OE/PmD4LtxjJ+dUmp44tHezZPhXxzV5SfBF1woBeFAwneEXuA
 c06z3mJKcJ+t1qX/TQi8PnBOtrMaxljwrnN9
X-Google-Smtp-Source: ABdhPJws0dm89mt6zQGbIfv3OMp2tavr4A8SjVe70fSIyJ5AxnwvI176ZH7yVxliKZoLD1/5aoomqg==
X-Received: by 2002:aca:a945:0:b0:325:9428:ac02 with SMTP id
 s66-20020acaa945000000b003259428ac02mr3130507oie.268.1651776634933; 
 Thu, 05 May 2022 11:50:34 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a0568302aa400b0060603221259sm857273otu.41.2022.05.05.11.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 18/24] target/arm: Enable FEAT_IESB for -cpu max
Date: Thu,  5 May 2022 13:50:00 -0500
Message-Id: <20220505185006.200555-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505185006.200555-1-richard.henderson@linaro.org>
References: <20220505185006.200555-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This feature is AArch64 only, and applies to physical SErrors,
which QEMU does not implement, thus the feature is a nop.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 8110408000..b200012d89 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -25,6 +25,7 @@ the following architecture extensions:
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
 - FEAT_HPDS (Hierarchical permission disables)
 - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
+- FEAT_IESB (Implicit error synchronization event)
 - FEAT_JSCVT (JavaScript conversion instructions)
 - FEAT_LOR (Limited ordering regions)
 - FEAT_LPA (Large Physical Address space)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 35881c74b2..10410619f9 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -781,6 +781,7 @@ static void aarch64_max_initfn(Object *obj)
     t = cpu->isar.id_aa64mmfr2;
     t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1);      /* FEAT_TTCNP */
     t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);      /* FEAT_UAO */
+    t = FIELD_DP64(t, ID_AA64MMFR2, IESB, 1);     /* FEAT_IESB */
     t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1);  /* FEAT_LVA */
     t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1);       /* FEAT_TTST */
     t = FIELD_DP64(t, ID_AA64MMFR2, TTL, 1);      /* FEAT_TTL */
-- 
2.34.1


