Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DF65523C1
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 20:20:10 +0200 (CEST)
Received: from localhost ([::1]:57918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3M0P-0004IP-M4
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 14:20:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LaO-0006OV-Bb
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:53:18 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:43149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LaH-0001ZF-OS
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:53:12 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 y13-20020a17090a154d00b001eaaa3b9b8dso10987572pja.2
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zl3UQa9L83DTzd5dN0hhGMfsA9e6o+OsnHnXrS/Os6s=;
 b=xh2uG1T/oYbbuFNqTvwHHhyXVAxgJZQei6IkfqezkwKW39CsLPX0qmRt5a0VDfn6Vm
 NlUplWm5ipFiQv8z8o4afiKAE6yYOwKZ4qZzz8tSCXkj2J0C8qBsaYgRthq+uUoUx9ek
 Kfy5+FFZL0dtS7qfm5SiPNgY29M+SUb1yYx+T2ln5eML2xISaRKJPgk79w0S2L/knmbS
 GDPx8xwd7haF9vKvTHetZveq4DeEWijg0s8lIxa58Ov63gbUAZ6/fUlw/p6I0ecPqjll
 q9pl3E6yYtGHZjoXejqTRbTMWoDAkzB/PmtJKd2txVgpYG6N0Kl36Uf8r6hpveU5HjCe
 UXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zl3UQa9L83DTzd5dN0hhGMfsA9e6o+OsnHnXrS/Os6s=;
 b=Aegy+E+rbIwmKFO3ukr9phjFqmA5+8AOcV+h8Xd657QTmwySJJRtVCS9ZrmKnPxVyB
 tOjkD7K8FGV7nLrMXoxV9tlE33XIf6oFNkHEXCDFvck/J7LlsfHKcBZIdpipn1pAAU7M
 NUSrfDFrJakzS/EMsSBFXauroHeyp/Zvjb0aoCNKeQ+dinBVqmdiT3KqDZ5JFe3dOv7a
 K5+FqSH7Ndu+pCl8xPZCfJKi0rZT1ZEtHo7MWoGOI2JFCt08v1jEZ6sNVK8/jOkkngR7
 ZH3QoVmZPrdLbmyVWmTZ0hGAgt/AmQP8St1I8TazKWc6WbWidMNMVGXmbWpYR7BHjU1Z
 t4tQ==
X-Gm-Message-State: AJIora8RMsuoLJauR3FAIWXxQa2x4Wtv0Z0IDmD9M4cFQVSUB8yzd6d4
 /pKqGd2mHGUdY78ks1tJps3MicQsKJ8vEA==
X-Google-Smtp-Source: AGRyM1v0XBOeBdREkAFWhtm/phcGeD7ziaIQzBVeNmis1qqds6HeycyUEdQemu/Z+Nk7EI5IsOolOg==
X-Received: by 2002:a17:90a:2f87:b0:1ec:87b2:ff15 with SMTP id
 t7-20020a17090a2f8700b001ec87b2ff15mr16295045pjd.135.1655747588348; 
 Mon, 20 Jun 2022 10:53:08 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:53:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 37/51] target/arm: Reset streaming sve state on exception
 boundaries
Date: Mon, 20 Jun 2022 10:52:21 -0700
Message-Id: <20220620175235.60881-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 26f4a4bc26..9c5b1a10eb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11754,6 +11754,19 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
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
@@ -11766,10 +11779,8 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
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


