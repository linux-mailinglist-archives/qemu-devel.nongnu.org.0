Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 607D05683C3
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:43:22 +0200 (CEST)
Received: from localhost ([::1]:44350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o91Z3-0006EB-CY
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Lx-0006fY-Gy
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:45 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:34365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Lw-0000lw-0f
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:45 -0400
Received: by mail-pg1-x531.google.com with SMTP id g4so13477429pgc.1
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pfb4nqNRQyJu+x99bnAw+yE0S7aPMHgZg/2pDMgRZBo=;
 b=YVfis2tL6P38QmeZKjMMr3YOtGQlLYhAb46d5OKOxX+M5so3sj+IYWUrp+PNXgH3rb
 RVg7EhTzkFVjgKeRvpa2AtpHtCM5d04XnqwDB49OEpO7RINf7uMP3TLn/tFdUZSYItlx
 WcZ0xAS3vCPONwgvNGXrfHzsIbjD35eoZq3cIbtvzS7ttfztRkc1iYzLc9Jdp7KQZmsB
 6s0AFp/aB+BtqDs/nd0QG6bd/l708M1skuOP5u1GPJ+HYFQ8INm2ZLubVOMSuuPBLPNV
 HH+/QIRqiUTEeGPQSni7qCFYl8fggtn4D7ekmm7VXkFYiv+5mvV3U3bZdA8BTjeWaoSq
 MB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pfb4nqNRQyJu+x99bnAw+yE0S7aPMHgZg/2pDMgRZBo=;
 b=fUwMf19Ba24C7WuY7o/z8wFN0015scyJZHRtKGVbSvfQEEuIvpMmw7SxH+4iQxExck
 U2zPsvLkdTDQnhjLvnuRFMmhX2LHdCZDYUVU2X6BliuCt/2Cs+atWASGLtr44QaYrKx+
 +2FyP8Kagnjx4WgAacmiscdOjwNSFnKejd4C8ES/CGx4hYgwDSF6/8jefoEkoU23TxfZ
 Ti07fwjICqkjq7ryST1yJJQsGK3FcFwdbM6k5seiUKkG8F6qfg7LL95toL8PjqGu9L0F
 R1vNiyjopx+MiZIBKn0e5oN/UdZRrQFBJVlvPIpLOfyuBPQq7Gdj7oAc/qMRuMacR3m6
 14+Q==
X-Gm-Message-State: AJIora/yGb9/PlLFd2/8IJ/jJMV341JR9DPv5MW++XJiuTgqtMOVxN0p
 Qm5W0UqmZHnuNY5eQxdZvEy9xahnXs/RZhF5
X-Google-Smtp-Source: AGRyM1sjlEyw/8OCyvBMG8VxB4eZX6P9+hHYfPzUAxi00adwL9goJUdvV4tYeJ8cJn1ZNc6Mh1jOYw==
X-Received: by 2002:a63:293:0:b0:412:4f02:950f with SMTP id
 141-20020a630293000000b004124f02950fmr11939919pgc.187.1657095942767; 
 Wed, 06 Jul 2022 01:25:42 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:25:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 31/45] target/arm: Reset streaming sve state on exception
 boundaries
Date: Wed,  6 Jul 2022 13:53:57 +0530
Message-Id: <20220706082411.1664825-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

We can handle both exception entry and exception return by
hooking into aarch64_sve_change_el.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 67f8ca98f2..11f70725e5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11753,6 +11753,19 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
         return;
     }
 
+    old_a64 = old_el ? arm_el_is_aa64(env, old_el) : el0_a64;
+    new_a64 = new_el ? arm_el_is_aa64(env, new_el) : el0_a64;
+
+    /*
+     * Both AArch64.TakeException and AArch64.ExceptionReturn
+     * invoke ResetSVEState when taking an exception from, or
+     * returning to, AArch32 state when PSTATE.SM is enabled.
+     */
+    if (old_a64 != new_a64 && FIELD_EX64(env->svcr, SVCR, SM)) {
+        arm_reset_sve_state(env);
+        return;
+    }
+
     /*
      * DDI0584A.d sec 3.2: "If SVE instructions are disabled or trapped
      * at ELx, or not available because the EL is in AArch32 state, then
@@ -11765,10 +11778,8 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
      * we already have the correct register contents when encountering the
      * vq0->vq0 transition between EL0->EL1.
      */
-    old_a64 = old_el ? arm_el_is_aa64(env, old_el) : el0_a64;
     old_len = (old_a64 && !sve_exception_el(env, old_el)
                ? sve_vqm1_for_el(env, old_el) : 0);
-    new_a64 = new_el ? arm_el_is_aa64(env, new_el) : el0_a64;
     new_len = (new_a64 && !sve_exception_el(env, new_el)
                ? sve_vqm1_for_el(env, new_el) : 0);
 
-- 
2.34.1


