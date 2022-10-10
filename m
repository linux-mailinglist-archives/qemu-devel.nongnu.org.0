Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CA45FA052
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:42:47 +0200 (CEST)
Received: from localhost ([::1]:44286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohtzS-000177-C6
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtkw-0006GE-PN
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:46 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:38835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtkv-0005Z2-3X
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:46 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 r8-20020a1c4408000000b003c47d5fd475so3428281wma.3
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sCOloJHZeHe5fACLnqjx6IG4hS5rmNF8WAFU0jQEu+w=;
 b=auIbe8PW8r8nDIl7SZtwWVk8lk4xuXv1RKsC6JaP+w03HG3hF0xET8qfQQhrMZk7SV
 XV8NOuzYdY+G6oqhlx/6O0/vO4uyP27ZSFviMR5O7TpghjLQIvLOEqJ/V/hGZwtxNoWw
 80Xceu8E6GlzDKPrDquW9fLdvliC2eof6zixDDyk4OcY32fHK0NuqB1/UqHnKagueLVe
 v8ph497s7LKRC7fDu/49nZz3T1XElxfqPi7c9sCFliNmpUeQJbubAHKQ1N3j0x2ubGJx
 72xicsgzKXuoTCvdhPJlF8BVlZMY9gpHuxskGsAydB4umCz7OjykxtWaOAo4Ri0v1U/r
 xMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sCOloJHZeHe5fACLnqjx6IG4hS5rmNF8WAFU0jQEu+w=;
 b=ZuI43QjafZj9zxqKauiSeSYthqx0Ju4Xw28Xm3csJH9xrbedpt+lYU7Deqnm5wvqrh
 JXGz6gCspQPRAQ0Xf0xS0xzqsH48rNPPlJX7i5v6tWyTbaj5X9WVA4U5EIFij8zZG0Qq
 poYtgs/ahyNqaeb6zUvspxEkrDSO0Ku5iVwphYJWMqeX0HXJh5Mc3hZvtPOUHPWwE5Nr
 Rbiv+54mtO6dKxqC3H8zmI8sf/Ff0DsWGnGmwyNIHGBBpoi91VYDK2BVtvTTMvwTpapq
 uCu1542Pdqw7S4cxA6HEfXHWgyUbpO+z1pBdqaRigElri/Pa6WD1M5oHAiXY6UmYANUy
 DZrw==
X-Gm-Message-State: ACrzQf34Q1tqM+Pp3ShMt6bHQrWtP/9KjTEUOFB2cJrbqFl6617Mf56P
 b0kW7JE/jF3ZS7mb4PU/rnKodPVS6LtMew==
X-Google-Smtp-Source: AMsMyM67zG2IX4jptFXnZfPr5Xc6KY3FCPsjiq6H9mlyjuhN59DmFHT0apE7f1B/YRRxiA/6McjTAQ==
X-Received: by 2002:a7b:c5c2:0:b0:3c4:fd96:fb68 with SMTP id
 n2-20020a7bc5c2000000b003c4fd96fb68mr7556742wmk.36.1665412063194; 
 Mon, 10 Oct 2022 07:27:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adfed46000000b0022e04bfa661sm9037054wro.59.2022.10.10.07.27.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 07:27:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/28] target/arm: Add is_secure parameter to v7m_read_half_insn
Date: Mon, 10 Oct 2022 15:27:12 +0100
Message-Id: <20221010142730.502083-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010142730.502083-1-peter.maydell@linaro.org>
References: <20221010142730.502083-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Remove the use of regime_is_secure from v7m_read_half_insn, using
the new parameter instead.

As it happens, both callers pass true, propagated from the argument
to arm_v7m_mmu_idx_for_secstate which created the mmu_idx argument,
but that is a detail of v7m_handle_execute_nsc we need not expose
to the callee.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221001162318.153420-7-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/m_helper.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 5ee4ee15b36..203ba411f64 100644
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
2.25.1


