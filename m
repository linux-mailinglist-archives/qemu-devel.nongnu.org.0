Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3EF6EE853
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 21:37:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prOQy-0003jp-6U; Tue, 25 Apr 2023 15:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQj-0003YK-3Q
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:34:25 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQT-0004k4-JP
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:34:24 -0400
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2a7b02615f1so61477801fa.0
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 12:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451248; x=1685043248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SlwZz/TkkaqpzfKRH/vz8Q4X3wFSx4Ts4VLXAbAY/Hk=;
 b=zCmv0DgmQ159PkPi+U7jG+n13JygEiACYEQO07VPMFbEk6vVeGtOflXZY3BQcblIbc
 syu/IhmiJmFLCQKOICVOLWYZwlMIDKPNs1Vyc/Hzse1wN1ZxEaFKlbo97JudtGsHYQ0B
 gaxsIIWgpfN0Ga6QMNm35vkK0gy8O1tTZZsFCNEJXtA6FKrN1q37pQIGxKpoykoggt+d
 6OBof6cuUGX6qdjW9neizLAAb1MWy9RnNzg7HqMTAVRifFFRguTCe0/X8osCfMcSallY
 qShFpeVxItnfQTv8kIjHD95w4kBqW+TghLJ0Lgizx1Iiw+V6DtM/EPqlWgV2D4L4bPyK
 vFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451248; x=1685043248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SlwZz/TkkaqpzfKRH/vz8Q4X3wFSx4Ts4VLXAbAY/Hk=;
 b=RSsnZtf52o1zhQLzBsQrsXo5K4YryuBJOFaDRxiUH9FgnexjniKrGPx3ro/Qfj0PIO
 CqRH8ITEMXpyfmDbDzeW+R0hY1ySPYc5DmxhNThpjYata43/kQnwvIrPwT3NyGa5/3CJ
 ElWFKp/X4ve2PYtUZtOAM3OtYPGZgwZV2HdNZfzDN4GBft+v3Waj3AUgjya2RtkKYpzR
 WDhTXP/Xj6WusOI7tANbeaN8E86/fczl303ovc3cIqEe71MhVR9HmHbgL5Hw+C9A2kOB
 35ooNFH4msloBnbmgwe/VfiL9aciGjSyR8LeYJdHUQFEgX/LBmIu5NSqCMUkE1psjygV
 T3iw==
X-Gm-Message-State: AAQBX9eM4no+OGIh1e4wyaDjBMYGvl4xkkndbM/giQkVlYFMkRkXae4U
 erQ5UyelMzqfOE5pA4bU87bZudzZ6LqyTwPFAWbesQ==
X-Google-Smtp-Source: AKy350aejj8ruA4w7IZb3d7AVO82LoRwc2nlGR/ogsbPSH1XCkdKLghVlfWlAV/0jAX1rKrummEDVw==
X-Received: by 2002:a2e:98d8:0:b0:2a8:ee05:ca1e with SMTP id
 s24-20020a2e98d8000000b002a8ee05ca1emr3877303ljj.13.1682451247776; 
 Tue, 25 Apr 2023 12:34:07 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:34:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 18/57] tcg/aarch64: Detect have_lse, have_lse2 for darwin
Date: Tue, 25 Apr 2023 20:31:07 +0100
Message-Id: <20230425193146.2106111-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

These features are present for Apple M1.

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index fc551a3d10..3adc5fd3a3 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -16,6 +16,9 @@
 #ifdef __linux__
 #include <asm/hwcap.h>
 #endif
+#ifdef CONFIG_DARWIN
+#include <sys/sysctl.h>
+#endif
 
 /* We're going to re-use TCGType in setting of the SF bit, which controls
    the size of the operation performed.  If we know the values match, it
@@ -2903,6 +2906,27 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     }
 }
 
+#ifdef CONFIG_DARWIN
+static bool sysctl_for_bool(const char *name)
+{
+    int val = 0;
+    size_t len = sizeof(val);
+
+    if (sysctlbyname(name, &val, &len, NULL, 0) == 0) {
+        return val != 0;
+    }
+
+    /*
+     * We might in ask for properties not present in older kernels,
+     * but we're only asking about static properties, all of which
+     * should be 'int'.  So we shouln't see ENOMEM (val too small),
+     * or any of the other more exotic errors.
+     */
+    assert(errno == ENOENT);
+    return false;
+}
+#endif
+
 static void tcg_target_init(TCGContext *s)
 {
 #ifdef __linux__
@@ -2910,6 +2934,10 @@ static void tcg_target_init(TCGContext *s)
     have_lse = hwcap & HWCAP_ATOMICS;
     have_lse2 = hwcap & HWCAP_USCAT;
 #endif
+#ifdef CONFIG_DARWIN
+    have_lse = sysctl_for_bool("hw.optional.arm.FEAT_LSE");
+    have_lse2 = sysctl_for_bool("hw.optional.arm.FEAT_LSE2");
+#endif
 
     tcg_target_available_regs[TCG_TYPE_I32] = 0xffffffffu;
     tcg_target_available_regs[TCG_TYPE_I64] = 0xffffffffu;
-- 
2.34.1


