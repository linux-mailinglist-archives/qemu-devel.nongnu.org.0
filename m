Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D095515FB8
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 19:59:41 +0200 (CEST)
Received: from localhost ([::1]:45938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkrNc-0004Ub-9q
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 13:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrHw-0004Tg-GS
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:53:48 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:45849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrHu-00080v-J9
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:53:48 -0400
Received: by mail-pl1-x631.google.com with SMTP id h12so9582950plf.12
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 10:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hV+IA21ry8VojR25e1IAEE42j7p287jopA93G1Fi9U8=;
 b=ASrKMOiCcOOGZHYVxSEYwh/UelcQGy4DA5jf1jZHTJd2eIK+GEjuRtkQUMqb6fIPlH
 CL6jCH/5ah1Vx+N6QVSPx7CUgOYt83OqY9e0xYl9E/vfLWUAAwGbAk3UvltBRbK+YdKd
 7QPKdeqXsiakPPRLco7XHO/a2F4XKZ7IR0BzX04m5MuSwT2ofZNY7teKlMy3gWUR5R6I
 3vNWBvgXqcnowluz7ZvKcYlfm4k78A+ky2ltFhd3/jz69qDAZSsWRclyrXVyY++tt6OJ
 0zBC+DlVHR8KGpHZ6oH4Xt4dsICABDS/TxoLCSeORLFO3blnn+VjMz87g5YDf43WfvLI
 4iQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hV+IA21ry8VojR25e1IAEE42j7p287jopA93G1Fi9U8=;
 b=3PWeXQnhhl4B4b9mox87DZj5UpZhnyMnGosWRLE4pY0Aum4d/CDxoBdA9o3f6s04eD
 +EyE1+EMDBCRP/g8fFelIpd5qyLCOhtB0zmI+7+uE/XB24RVHmqZ/jtskPPVgXgVC5oz
 jXdm7HmSV9YqW7z0Q+axM+w/USsG8tP8yWYYXSS0DSGkLnwGdmoKop52wN4D+WPQoxxC
 64RIS59lCgrCf4GJIQBXsxxgy3X2b2mcuq0Sjm2c9Bzsdvns63BkDukWJw/9prJWR9l8
 VnMqw9OJ6hvgm86PEyIWvGTmu7zwOgLCixCnJxluLF72SIzcBQ3AveN9ok1T2j19dl4v
 Zlwg==
X-Gm-Message-State: AOAM53074qGgM78sRJM/sUFOU9vIBB09/47KOuAEqFMJ0Ac6Qe3ahI/H
 mfVJlWyqaAnW4baqwlGb4cqStkZYiBElLA==
X-Google-Smtp-Source: ABdhPJyqhseRfYJ7aBiGeNvBkHnq/42QJ7HSIrMPh/j/l5cqxOc2zemn+3QWiDVK5/FjLrlJdOoyQw==
X-Received: by 2002:a17:902:ce11:b0:15b:4232:e5e7 with SMTP id
 k17-20020a170902ce1100b0015b4232e5e7mr4441349plg.39.1651341225171; 
 Sat, 30 Apr 2022 10:53:45 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 5-20020a170902c20500b0015e8d4eb282sm1740910pll.204.2022.04.30.10.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 10:53:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/17] target/m68k: Switch over exception type in
 m68k_interrupt_all
Date: Sat, 30 Apr 2022 10:53:27 -0700
Message-Id: <20220430175342.370628-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430175342.370628-1-richard.henderson@linaro.org>
References: <20220430175342.370628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace an if ladder with a switch for clarity.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/op_helper.c | 49 +++++++++++++++++++++++++----------------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index d30f988ae0..2b94a6ec84 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -333,7 +333,8 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         sp &= ~1;
     }
 
-    if (cs->exception_index == EXCP_ACCESS) {
+    switch (cs->exception_index) {
+    case EXCP_ACCESS:
         if (env->mmu.fault) {
             cpu_abort(cs, "DOUBLE MMU FAULT\n");
         }
@@ -391,29 +392,39 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
                      "ssw:  %08x ea:   %08x sfc:  %d    dfc: %d\n",
                      env->mmu.ssw, env->mmu.ar, env->sfc, env->dfc);
         }
-    } else if (cs->exception_index == EXCP_ADDRESS) {
+        break;
+
+    case EXCP_ADDRESS:
         do_stack_frame(env, &sp, 2, oldsr, 0, retaddr);
-    } else if (cs->exception_index == EXCP_ILLEGAL ||
-               cs->exception_index == EXCP_DIV0 ||
-               cs->exception_index == EXCP_CHK ||
-               cs->exception_index == EXCP_TRAPCC ||
-               cs->exception_index == EXCP_TRACE) {
+        break;
+
+    case EXCP_ILLEGAL:
+    case EXCP_DIV0:
+    case EXCP_CHK:
+    case EXCP_TRAPCC:
+    case EXCP_TRACE:
         /* FIXME: addr is not only env->pc */
         do_stack_frame(env, &sp, 2, oldsr, env->pc, retaddr);
-    } else if (is_hw && oldsr & SR_M &&
-               cs->exception_index >= EXCP_SPURIOUS &&
-               cs->exception_index <= EXCP_INT_LEVEL_7) {
-        do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
-        oldsr = sr;
-        env->aregs[7] = sp;
-        cpu_m68k_set_sr(env, sr &= ~SR_M);
-        sp = env->aregs[7];
-        if (!m68k_feature(env, M68K_FEATURE_UNALIGNED_DATA)) {
-            sp &= ~1;
+        break;
+
+    case EXCP_SPURIOUS ... EXCP_INT_LEVEL_7:
+        if (is_hw && oldsr & SR_M) {
+            do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
+            oldsr = sr;
+            env->aregs[7] = sp;
+            cpu_m68k_set_sr(env, sr &= ~SR_M);
+            sp = env->aregs[7];
+            if (!m68k_feature(env, M68K_FEATURE_UNALIGNED_DATA)) {
+                sp &= ~1;
+            }
+            do_stack_frame(env, &sp, 1, oldsr, 0, retaddr);
+            break;
         }
-        do_stack_frame(env, &sp, 1, oldsr, 0, retaddr);
-    } else {
+        /* fall through */
+
+    default:
         do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
+        break;
     }
 
     env->aregs[7] = sp;
-- 
2.34.1


