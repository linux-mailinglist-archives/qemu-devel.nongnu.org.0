Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E85B04FCB00
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 03:01:24 +0200 (CEST)
Received: from localhost ([::1]:46738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne4uJ-0001rE-Of
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 21:01:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4Tg-0001wC-AE
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:54 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:45971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4Tc-0001t4-5S
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:51 -0400
Received: by mail-pf1-x430.google.com with SMTP id s8so15994521pfk.12
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 17:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vvaSAF9dWxfTutPcPK5woK3fG4aF2EnUyhQgs/BQ6VM=;
 b=j0P8wQkANITMz6s+rLKNO/c13jUInPdSaGN6UzVbkCX0Je09sfssCiYTAHdZeyZy2w
 SUGnijSNCR4yikcT93Mb14nANpKEhIDUFZnXiVeY0UhMWJ8ypiGK1HphFZi3SwGBhknp
 jgIplE+vv7sZWoqsznZscMKzFa9uw6XbPnjaJQdd27VByHHMxBsd/bpTfWBjePqAUVFi
 YpMrJi+lGf8letoVPF/cgfI3Ym+qWK/XeF8gaCPPz55E14xgDjjlD/Ija6HHWH3JD5Jr
 WdHXD2SEg5ntOcJ59j/KN2V2Om1Hk8+L/eb7FF3t6g84RTA7vjwnV8QJa1P5NFG59+0q
 4+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vvaSAF9dWxfTutPcPK5woK3fG4aF2EnUyhQgs/BQ6VM=;
 b=nG30ozVTkYefUO18FgVJhuTBp1FJHTwd6Io2GqKOa7mhdErJR8R57ML8UEl4Kt3OT5
 kDbDwA8Ku7uad5A2jLMJfHcrxYG8d0bmAey8AuSLMkvz0UEDO5BA4KqYB68YnOmoF0Vs
 io8KKxBIatFlrrdZZM4l/sX2pOBcsmhWKjoLhkatk9wi+RYMcC7iHh0q6KHA5VlYEINJ
 jxbU/rVDvfdSOyF7l0+04CJYOVbaLY472eocc9eUo4tgD25xJ5L1v88+t+iMvudc4aof
 KNqXqFOWhQCHIf8uGv/RY6uHAys7qaNfD86XHs8M/s9nsNEE4fczjRq+car591DVAKaz
 yMlA==
X-Gm-Message-State: AOAM530vDlVQKoDQ85zRKoMKQjikf1sl5jQlPBJi7z6JRM0UrEh8KP+4
 dqknrX6n1kYouttSmVjSoVqdnZ4ONenpow==
X-Google-Smtp-Source: ABdhPJyLxdAnPfvh2JzyS6zV4tpnz7SPl0Z6B8RP49RnynUt47Yojbt/VS0KiWrb6jMFH4oWFE8HkQ==
X-Received: by 2002:a05:6a00:16cd:b0:4e1:366:7ee8 with SMTP id
 l13-20020a056a0016cd00b004e103667ee8mr35414150pfc.9.1649723624360; 
 Mon, 11 Apr 2022 17:33:44 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm38346669pfc.111.2022.04.11.17.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 17:33:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/24] target/arm: Enable FEAT_CSV2 for -cpu max
Date: Mon, 11 Apr 2022 17:33:20 -0700
Message-Id: <20220412003326.588530-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412003326.588530-1-richard.henderson@linaro.org>
References: <20220412003326.588530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This extension concerns branch speculation, which TCG does
not implement.  Thus we can trivially enable this feature.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/cpu_tcg.c          | 1 +
 3 files changed, 3 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index ebd9e418cc..91fb06c579 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -11,6 +11,7 @@ the following architecture extensions:
 - FEAT_AES (AESD and AESE instructions)
 - FEAT_BF16 (AArch64 BFloat16 instructions)
 - FEAT_BTI (Branch Target Identification)
+- FEAT_CSV2 (Cache speculation variant 2)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index c91528a12e..eb4bcd8e80 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -748,6 +748,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
+    t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 1);      /* FEAT_CSV2 */
     cpu->isar.id_aa64pfr0 = t;
 
     t = cpu->isar.id_aa64pfr1;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 4aa2eb0841..7775a84575 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -67,6 +67,7 @@ void arm32_max_features(ARMCPU *cpu)
     cpu->isar.id_mmfr4 = t;
 
     t = cpu->isar.id_pfr0;
+    t = FIELD_DP32(t, ID_PFR0, CSV2, 2);          /* FEAT_CVS2 */
     t = FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
     t = FIELD_DP32(t, ID_PFR0, RAS, 1);           /* FEAT_RAS */
     cpu->isar.id_pfr0 = t;
-- 
2.25.1


