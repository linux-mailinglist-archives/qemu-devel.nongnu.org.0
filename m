Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF875F1DA0
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 18:30:41 +0200 (CEST)
Received: from localhost ([::1]:56768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oefNw-0002Uo-8D
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 12:30:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHB-0006d0-Hc
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:23:41 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:40490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefH8-0006DP-GT
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:23:40 -0400
Received: by mail-qt1-x831.google.com with SMTP id cj27so4336523qtb.7
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=6Tnfc5rXfCku9MasFsfztuydoPYwIjiauClakmhLN0A=;
 b=EvjkrmHCJzh9pvhJhXid6iFFNxK7GGiyvCnoXwsWpuW4aUVEsYpMrWxs5WtQBz1C9u
 Vk98uNPVRXH6i+p97Kq1Mgf98xA2wM5rInMUMp4M1zesAM2H/6bcmzaofMKgMCkhDIGE
 LMnFxx15UHjyAaHqiCOqVMOxEIQ+CNPDEks1+/4g49F2GYUtNKqo/FFYuwS/U8Lvf3Hm
 J2G8s9xvHLv2RvnHYou/CxkmCZcfYqpJtiF1q1gRxtXg1CIjdgQyXgxspqXWmMmn0QKi
 J/EeWoOvsz8wq0Sc0wvCxLdM+i54uZC1wkqMe8mIdhaFc8u+yIl8QFkey4NXNRRqduvn
 xIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=6Tnfc5rXfCku9MasFsfztuydoPYwIjiauClakmhLN0A=;
 b=VVP51IixSrzzUQe2YPEH2Llw9sLg2+1a79m01j8LhpLQSeiEVKk2dW3lpG3M4roIXv
 v5O32V1WWJ0wIltdPp0glSjQ45elkOwjSaefOj6qkkDG+67B9rBKu+3E4iygbv8/Qdd8
 ccvWALuhu9rlH1v+0icEIupA1AxWI5tMroBtUZFJXcivvTMXSB1PChG/ndZS1zAYnmlu
 Iudnf1tu1K3j8ALDPb8SyA4ams022mYBm6UkFjqL8AVJ75X9XNd32RcdPI/CZhHqZ9j7
 fxmZ0SF3gDNHgryv8x7nv6FOCCKG11jLVrDQFir6tgUyYWu2ZQLnRbh1oQW9fjzzgy3E
 BDsQ==
X-Gm-Message-State: ACrzQf1ZkxEml9sFB5cw4rO4wJbfHsg8/PcXxjkI4UgqYw3/YMxILC0K
 Z0SefOxBsP9Q/FWZzdDQbwNhZ8AJi8BmwA==
X-Google-Smtp-Source: AMsMyM61PU8VMEVdykE/halpW/Vjok+sDU1/X3s1JOeI2blWYnTwXe/ZZHBaUA7b/HbrY/qGC6Qq6Q==
X-Received: by 2002:a05:622a:1c7:b0:35d:4a61:f2c7 with SMTP id
 t7-20020a05622a01c700b0035d4a61f2c7mr10802438qtw.578.1664641417854; 
 Sat, 01 Oct 2022 09:23:37 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:23:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 06/42] target/arm: Add is_secure parameter to
 v7m_read_half_insn
Date: Sat,  1 Oct 2022 09:22:42 -0700
Message-Id: <20221001162318.153420-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x831.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


