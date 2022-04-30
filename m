Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC47515FB7
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 19:59:40 +0200 (CEST)
Received: from localhost ([::1]:45860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkrNb-0004Rf-Aw
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 13:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrHy-0004ZN-PG
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:53:50 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:46772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrHx-00081P-75
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:53:50 -0400
Received: by mail-pl1-x636.google.com with SMTP id u7so9578905plg.13
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 10:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dBQmcYvQNWemNoz94qCXnnbynO5dcM+A32yDVQduyko=;
 b=PY+NS7nAUlQ37XRhqC2+ZBAkY9cEQfdOO6nASWdwKd4N8u9U/lUhKCfImi/E5g7BxB
 Qfm50o3Fo2eXGMCaKslBV+6bvne5X8vnwfzOJq6kjJOkeRXbbNdySaVT44GTJEYlYv09
 HcgwAyPSFEBBjXdEU7VM+nRvWMsLtpO1ObGXNuMinH+bMrNFIPViyXyT2rSynZW7K+w1
 eaGU/dugpLA0nScEtuSC5+UCN0N1o7n8erRARzAQoRb/xhxmfObs5Hvf6LWEf6zRT9Fg
 czMDOwTBZCueV3bthwUdh7s9OzJJPo8a6nlZuFVmULSG4ODPHT+7AOnTJgbKa2w27kZo
 1gMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dBQmcYvQNWemNoz94qCXnnbynO5dcM+A32yDVQduyko=;
 b=M2zEh5e1/2c50uVUB1LtVDVqekUOmLBR1Aq8z57gVLy+3FuzTlCocvYx6IZPBolA5x
 bEU2+T9BxHJUIXcJd2pJPKmju8QQBjwSraipYCb8GojPN/Gibxh6mN1QQ+SdmmvFa77d
 6cX1UXCCATz8GGu3BNCFg7eKcOsSV6bnx7SZMHSf+1QwIOx4mcoAPoBNCtJRVZGzp41q
 g0JhUsyiQtymNOAOhrJ3aB1WhEao4GX/KU5gfWo9y4dWesO4R/t/ZXHBVRaM48g9sBOR
 JKi5jJAEyAevomz97qDrVP8LZKOieHO2pvbCa/v0q5jFz1oyR6SQJBXqDgNjzimALgD+
 MgIw==
X-Gm-Message-State: AOAM530KKmfCpQhtSo2X6yoCiYXYHmSfE8HgwvaRSIu2wHIYWWWbpbwy
 eyBzF0iPpIS+ZXGJEMcASDQhZoRMEPDTOw==
X-Google-Smtp-Source: ABdhPJyI+ldHE5tfisJq9wobS1MVs2FJ8cgIDxOOsDdGBn1ZdDk89tY/QkIyqN50mkg3noJAZQJEaA==
X-Received: by 2002:a17:902:e741:b0:15e:5aad:b3d5 with SMTP id
 p1-20020a170902e74100b0015e5aadb3d5mr4764781plf.102.1651341227936; 
 Sat, 30 Apr 2022 10:53:47 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 5-20020a170902c20500b0015e8d4eb282sm1740910pll.204.2022.04.30.10.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 10:53:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/17] target/m68k: Remove retaddr in m68k_interrupt_all
Date: Sat, 30 Apr 2022 10:53:30 -0700
Message-Id: <20220430175342.370628-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430175342.370628-1-richard.henderson@linaro.org>
References: <20220430175342.370628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

The only value this variable holds is now env->pc.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/op_helper.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 0f41c2dce3..777869790b 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -287,12 +287,9 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
 {
     CPUState *cs = env_cpu(env);
     uint32_t sp;
-    uint32_t retaddr;
     uint32_t vector;
     uint16_t sr, oldsr;
 
-    retaddr = env->pc;
-
     if (!is_hw) {
         switch (cs->exception_index) {
         case EXCP_RTE:
@@ -385,7 +382,7 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         sp -= 4;
         cpu_stl_mmuidx_ra(env, sp, env->mmu.ar, MMU_KERNEL_IDX, 0);
 
-        do_stack_frame(env, &sp, 7, oldsr, 0, retaddr);
+        do_stack_frame(env, &sp, 7, oldsr, 0, env->pc);
         env->mmu.fault = false;
         if (qemu_loglevel_mask(CPU_LOG_INT)) {
             qemu_log("            "
@@ -395,7 +392,7 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         break;
 
     case EXCP_ADDRESS:
-        do_stack_frame(env, &sp, 2, oldsr, 0, retaddr);
+        do_stack_frame(env, &sp, 2, oldsr, 0, env->pc);
         break;
 
     case EXCP_ILLEGAL:
@@ -404,12 +401,12 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
     case EXCP_TRAPCC:
     case EXCP_TRACE:
         /* FIXME: addr is not only env->pc */
-        do_stack_frame(env, &sp, 2, oldsr, env->pc, retaddr);
+        do_stack_frame(env, &sp, 2, oldsr, env->pc, env->pc);
         break;
 
     case EXCP_SPURIOUS ... EXCP_INT_LEVEL_7:
         if (is_hw && (oldsr & SR_M)) {
-            do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
+            do_stack_frame(env, &sp, 0, oldsr, 0, env->pc);
             oldsr = sr;
             env->aregs[7] = sp;
             cpu_m68k_set_sr(env, sr & ~SR_M);
@@ -417,13 +414,13 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
             if (!m68k_feature(env, M68K_FEATURE_UNALIGNED_DATA)) {
                 sp &= ~1;
             }
-            do_stack_frame(env, &sp, 1, oldsr, 0, retaddr);
+            do_stack_frame(env, &sp, 1, oldsr, 0, env->pc);
             break;
         }
         /* fall through */
 
     default:
-        do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
+        do_stack_frame(env, &sp, 0, oldsr, 0, env->pc);
         break;
     }
 
-- 
2.34.1


