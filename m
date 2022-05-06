Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AB551DF0D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 20:22:20 +0200 (CEST)
Received: from localhost ([::1]:39796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn2ap-0007Pi-9o
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 14:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IT-00062i-SZ
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:03:23 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:38700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IR-0003wF-IB
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:03:21 -0400
Received: by mail-oi1-x229.google.com with SMTP id r185so3472827oih.5
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 11:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YgPJJBWxd6UwNbu8I9UhpjXUvb+eh/ewRL4C5SYoXZc=;
 b=WSobL0sMyT0KRvtk81VICiJ55j7byygjWb0YuNKo6+3ZeAIHZgBJGD+vtK2aRILFVF
 Enwa8Jl2JMU/mZTbbZR1vwERz3HKhq1U7qa3w1vAYXTq6XHh246GAngBh6HhJLiRqIXQ
 9QDW0rc4NKh69IYbrSfEjxtwEUzm4+3OZysDAakq7zBdeKOleE5GJcrcyChTIK6AjCRu
 RAS1MAhwqTuiWPh8F9AMSHfNCrfbkh61CXUvZlgBx18bRwYrRmk3ch3sePTFwizMcNNg
 6XsWV01C9twC/Sl31VOgMTWJ120Ysfd3e83bewHYb2z6MQ57NGc/9zMqjfl6OCnkzxRx
 +1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YgPJJBWxd6UwNbu8I9UhpjXUvb+eh/ewRL4C5SYoXZc=;
 b=plEa1kYRD9ARln42Y4Sgws/JaeA1EuTtmv6L1/mDvP1rGQf7P5MdejrG5EJSkCe2yZ
 QKX2dNElY87Z7QVqE9jYVAm+dXcPklHNsNi+0KhIwhEKjvUrsLGqXpDyHCiCesvcqBqc
 DwgfUa+Jlnxf2VhwsDjiQmMA3OVz+e0gbqqU1D67KRPae3JO0dVBjMcI4OvVkVT5Gg+Y
 mWZ7JXxnT+aTF1fz7ii6fcRuFwaQhsSH0ndoiNChCLuXTwH2Pv1RGk+E6f42+CSgkqVC
 DWhI0I1t06JpJvPAniE8XpofGWZouialjJ0Rd+9qUwtBPE1R0BWKR6z8/9fcHjO6zHyi
 3MDA==
X-Gm-Message-State: AOAM530YMyiJIy5qMuWfZFKYb4SqcpqMAIfuyFqmny0IYKEYUjcq3tU+
 71zrkLDXu2lH2P5ClX7m1BoLdo7uikZpbRFD
X-Google-Smtp-Source: ABdhPJxWp9+0kpCYTqM5a1wMcLX6wzRa7vYHMLhh26KJHMeNaF2NJx+uh/WpYwFkn0KKS9mdX5vn+g==
X-Received: by 2002:a05:6808:2095:b0:325:7ad8:6d18 with SMTP id
 s21-20020a056808209500b003257ad86d18mr5560151oiw.58.1651860197336; 
 Fri, 06 May 2022 11:03:17 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a056870c0c400b000e686d1389esm1780002oad.56.2022.05.06.11.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:03:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 19/24] target/arm: Enable FEAT_CSV2 for -cpu max
Date: Fri,  6 May 2022 13:02:37 -0500
Message-Id: <20220506180242.216785-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220506180242.216785-1-richard.henderson@linaro.org>
References: <20220506180242.216785-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
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
index b200012d89..b2a3e2a437 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -12,6 +12,7 @@ the following architecture extensions:
 - FEAT_BBM at level 2 (Translation table break-before-make levels)
 - FEAT_BF16 (AArch64 BFloat16 instructions)
 - FEAT_BTI (Branch Target Identification)
+- FEAT_CSV2 (Cache speculation variant 2)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 10410619f9..25fe74f928 100644
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
index c5cf7efe95..762b961707 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -68,6 +68,7 @@ void aa32_max_features(ARMCPU *cpu)
     cpu->isar.id_mmfr4 = t;
 
     t = cpu->isar.id_pfr0;
+    t = FIELD_DP32(t, ID_PFR0, CSV2, 2);          /* FEAT_CVS2 */
     t = FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
     t = FIELD_DP32(t, ID_PFR0, RAS, 1);           /* FEAT_RAS */
     cpu->isar.id_pfr0 = t;
-- 
2.34.1


