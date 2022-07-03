Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8723A56460E
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 10:56:45 +0200 (CEST)
Received: from localhost ([::1]:57440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vPI-0005aR-KK
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 04:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvU-0000Es-VK
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:56 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:47057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvT-0006DS-DN
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:56 -0400
Received: by mail-pf1-x42b.google.com with SMTP id a15so6322421pfv.13
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nKGjUZfBkhVbWA12ORMzUOT3YB96l6xmhnKiB3/6fQo=;
 b=agMKJwUKdHCinJ3LQndFn5l7HYb5kNt5zEtXit1Bs8CM6lSvIuDBcoGL0faYcNnLb5
 Sf58nAskBLQTKf8hLR6YUTczfFgiBvV0HfU9N2BEAVEnEG+kygvaOHEPaxMAqMVurRtB
 zL+zHLGZcZuWHwaRd/L1K1pXtvcH8gNDqsbbNlojzJuv7JXsw84n/bk0KXYraLCGU+px
 jprBkcniHGacEDQcGUtVXubpTEBitJ7UBC9B+jh60wQQfx7PpBJbzUOZXy6isIoizwgE
 GaAhqoodT47e5EX+c0rFPsv2R9rcVmvthZcDhZbfEVdYexL+bhL3wsDYKbVZMRbNCs4d
 bCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nKGjUZfBkhVbWA12ORMzUOT3YB96l6xmhnKiB3/6fQo=;
 b=caJoduq9hE+BiivdeKIpOJ1w0d29yn8aDsFB/Kl353iS4mUFXfrrA1dX7LOez+4OT7
 XDTuuOO8dyLwhqOCXrH6cTwPfp7zRUZ8/BFiGEz74wAjv1FO0tCc/k5o1yGsC/YiJ7v7
 Pfe31xDyytFjCbZk+ytc0ptL0/t670h+iJ8l2Rf/l+rd5KFwIQsomwvVSd1a6Jr+Ikx/
 q2r3Hp0JzZ5fBmJE1vUvxGuSuSNBgCZhLzy+3OrUaQBCB3vsSoZ9JVKLCnv3mZX1++M/
 xgRH2hAVGPEgwaBLxeQpC3qO4ksaOj2qdyfvkxHvVHqRjgrPu5W2vO1DxIWDfeXiE3WT
 YAhg==
X-Gm-Message-State: AJIora+JD+MBEkxnC/QYDpoh1uSmBVwegAXzDF7Ba8NSHF9dj4pltS35
 aiZF6sy+LTddQUBIKRcnvWm6NMx0OQF+KfoG
X-Google-Smtp-Source: AGRyM1tJ1pc3HhTkHsxDMvfg22idUO3kYMQui/hWOjkCH8jYn1n/Xo5bfBGFGCeq7sBNpcomSBQtAg==
X-Received: by 2002:a63:e648:0:b0:412:22fa:6fbb with SMTP id
 p8-20020a63e648000000b0041222fa6fbbmr3330126pgj.24.1656836754099; 
 Sun, 03 Jul 2022 01:25:54 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:25:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 29/62] target/arm: Add is_secure parameter to
 v7m_read_half_insn
Date: Sun,  3 Jul 2022 13:53:46 +0530
Message-Id: <20220703082419.770989-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

Remove the use of regime_is_secure from v7m_read_half_insn.
As it happens, both callers pass true, but that is a detail
of v7m_handle_execute_nsc we need not expose to the callee.

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


