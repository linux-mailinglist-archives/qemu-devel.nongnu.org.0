Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8A959C47A
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 18:58:03 +0200 (CEST)
Received: from localhost ([::1]:50446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQAkU-0001aV-FL
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 12:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LW-0007sX-MO
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:11 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:53084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LN-0000fo-2u
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:09 -0400
Received: by mail-pj1-x102e.google.com with SMTP id f21so11353046pjt.2
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=LXSL+H12LObvuYlmrtCN7YFFVJ00RtMPHZQZ6vrA/8I=;
 b=hiB0GAnk+Yh/9CXaY0oXI99cgG3JnZgMav8Adunl9JiKpZGzCeelI04FMsThHz/0vb
 Wgtusw2ynNl2eMfhQhha5/VuRO+mHiq8YGtydzHR25ziBscYKfPSx9VZSN/zIau64yr9
 rG30O965ecDHmHIhGBk/BxHdE/0jWZAOYtzdYLB07tvuH4WkU4FeoLv+/5YJJi6Vs9jk
 2fk4zl/6P4EIr4ALnwyLQ6uBD+3UNGqnNUIvJQEODZgNzjLYzoUOnS4HPzgKu7H0ZgdX
 IT3qxp+9x4W1pfFFQWYJy/jOU9rhH2nA2CUbGCWNi0hCffdmZmR6g0k2wRJbTGgazQx6
 iWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=LXSL+H12LObvuYlmrtCN7YFFVJ00RtMPHZQZ6vrA/8I=;
 b=mY3TJymp9E1A1aIH/Wm1jsdfbyeijNTZbxP0chs/uw8mnczPtukOsXkq0raTB6Vjje
 Skn1Tu603xx145R3GWpFMP4QkKwkMCLTuh8CRszjQlQxiXVDFUcs8NwncwayP9f0bghG
 ltRXt6GuvwjLejjRueCFN29WhhwK0a7Y6RSj6GgOhZAQfyZys4HNymVe0P6YEvWu1qhV
 eJ2K8OIe0Ip6nLuL75wQndWW5+NUvAdSNxpR3R6YZK7LeMKPGZW2uUozyoPQWnWuVyd8
 zo2zXz/KvOh7+fjljVYv8Dm5VedkHw7XpGYCbhytGDMS2AjiZzqg+1NVbOHwLKxjHqnI
 Jjhw==
X-Gm-Message-State: ACgBeo3ICzrHT5rhTqcZdpZbDTNd1mn6OOZx7p9tD7aD5WbWoN6lK13O
 RYIZnynZcxwYb9Anc9ZokcnHp0Tipo7r4A==
X-Google-Smtp-Source: AA6agR6NtHwXsBuW2EJGGSDE37g+WPPNhzf0BkWVMsiV2vnJq+EnDOupPlVAo0X7XSWClvxYrNvXyA==
X-Received: by 2002:a17:90a:ab14:b0:1fa:b97f:c28b with SMTP id
 m20-20020a17090aab1400b001fab97fc28bmr23699834pjq.71.1661182080305; 
 Mon, 22 Aug 2022 08:28:00 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:27:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 22/66] target/arm: Add is_secure parameter to
 v7m_read_half_insn
Date: Mon, 22 Aug 2022 08:26:57 -0700
Message-Id: <20220822152741.1617527-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Remove the use of regime_is_secure from v7m_read_half_insn, using
the new parameter instead.

As it happens, both callers pass true, propagated from the argument
to arm_v7m_mmu_idx_for_secstate which created the mmu_idx argument,
but that is a detail of v7m_handle_execute_nsc we need not expose
to the callee.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/m_helper.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 5ee4ee15b3..203ba411f6 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -1981,7 +1981,7 @@ static bool do_v7m_function_return(ARMCPU *cpu)
     return true;
 }
 
-static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx,
+static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx, bool secure,
                                uint32_t addr, uint16_t *insn)
 {
     /*
@@ -2003,8 +2003,7 @@ static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx,
     ARMMMUFaultInfo fi = {};
     MemTxResult txres;
 
-    v8m_security_lookup(env, addr, MMU_INST_FETCH, mmu_idx,
-                        regime_is_secure(env, mmu_idx), &sattrs);
+    v8m_security_lookup(env, addr, MMU_INST_FETCH, mmu_idx, secure, &sattrs);
     if (!sattrs.nsc || sattrs.ns) {
         /*
          * This must be the second half of the insn, and it straddles a
@@ -2109,7 +2108,7 @@ static bool v7m_handle_execute_nsc(ARMCPU *cpu)
     /* We want to do the MPU lookup as secure; work out what mmu_idx that is */
     mmu_idx = arm_v7m_mmu_idx_for_secstate(env, true);
 
-    if (!v7m_read_half_insn(cpu, mmu_idx, env->regs[15], &insn)) {
+    if (!v7m_read_half_insn(cpu, mmu_idx, true, env->regs[15], &insn)) {
         return false;
     }
 
@@ -2125,7 +2124,7 @@ static bool v7m_handle_execute_nsc(ARMCPU *cpu)
         goto gen_invep;
     }
 
-    if (!v7m_read_half_insn(cpu, mmu_idx, env->regs[15] + 2, &insn)) {
+    if (!v7m_read_half_insn(cpu, mmu_idx, true, env->regs[15] + 2, &insn)) {
         return false;
     }
 
-- 
2.34.1


