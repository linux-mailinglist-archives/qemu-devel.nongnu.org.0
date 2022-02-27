Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E824C5E09
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 19:23:32 +0100 (CET)
Received: from localhost ([::1]:55066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOOCh-0005CU-FT
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 13:23:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOOAo-0002Xq-5U
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 13:21:34 -0500
Received: from [2607:f8b0:4864:20::62d] (port=42729
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOOAm-0007mY-J0
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 13:21:33 -0500
Received: by mail-pl1-x62d.google.com with SMTP id p17so8873012plo.9
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 10:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JiLG8jrCqG2LmLZgkf4Aw8DjJEHnI6zkIpqp//BmyXY=;
 b=xEcX1c9FbjCwUu7YP+dvRzw4Q0NMLeAbx6ksgUendKQ0bRgTXNFRM21uVV4vw8okx7
 yk/7cBQ9bqKXhQF/gnOkUchEHdA0RYTJTavPY6N89SJFkJVoL3aMdEmxLu5cAL4m2GOn
 P3DQ0nahXeSRHTjsLlvN0OUJgsGZVPhExZCGw0tC8JlCuGpJGk/EJsVNYjjJkMrLniVv
 SY7eCOYMOodDJuh0QvQQLK4aq8s1uQxAxdQIBjhTISWjvP55It7mEE9OIijAMloHy7g7
 wrg+FeuJfQK0FbqCI5sC3NseG2ge1LAn/FO/1kOuq6srVLhQFtp8wd2Gt5v+9UgeLWF7
 9klw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JiLG8jrCqG2LmLZgkf4Aw8DjJEHnI6zkIpqp//BmyXY=;
 b=dW3f5lwxO6CzL/gZLl/VonAvbaQ1x1XmJOskQYRv3KkX9+vUwgOaHITt7A5EK8jj62
 BIJ7vRbL9dduiJAlgZT8JNStWU5aVMCwr7hCTI2bwlvkxRdVxWkdkLnp9xL/lQhPaL5U
 PYbRHLUOqic0yE8QuJwZl/c8ff2SvOeHs4Niy29NI9b4V/jg9fqbPTV/junjL/naoqOX
 Dm9dlAAa0y2arNZjjP8qMT+YJiv3B1ftjh/xtA4drN5/+3aDEw++syQWyQXcx7NiueTz
 2uz0X+cslLPRroitvG+zdRR/0ib09BJ2D67oHivifjUk3rZBTuYebyNYdHG++eSoxpxs
 qN9g==
X-Gm-Message-State: AOAM5309e/15bxqBJWAn+YcDq8tD0wdM1S/0/mB9+AFtEHfcTr914s2q
 jxMVOW9Qr4c1aLP6orISVr2ydOykmonWSQ==
X-Google-Smtp-Source: ABdhPJxjzEF6mrZOf5tDW28QtzGR8QMVeC/HfA9qaUqWxaEqeCaUNfZ0kFqRTGDvthZv063VSMCmMw==
X-Received: by 2002:a17:902:b204:b0:14f:26a7:9f61 with SMTP id
 t4-20020a170902b20400b0014f26a79f61mr17025043plr.97.1645986091364; 
 Sun, 27 Feb 2022 10:21:31 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-23be-43d9-7006-705a.res6.spectrum.com.
 [2603:800c:1201:c600:23be:43d9:7006:705a])
 by smtp.gmail.com with ESMTPSA id
 t41-20020a056a0013a900b004e167af0c0dsm10776252pfg.89.2022.02.27.10.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 10:21:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] target/nios2: Remove mmu_read_debug
Date: Sun, 27 Feb 2022 08:21:19 -1000
Message-Id: <20220227182125.21809-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220227182125.21809-1-richard.henderson@linaro.org>
References: <20220227182125.21809-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This functionality can be had via plugins, if desired.
In the meantime, it is unused code.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/helper.h    |  1 -
 target/nios2/mmu.h       |  1 -
 target/nios2/mmu.c       | 20 --------------------
 target/nios2/op_helper.c |  5 -----
 target/nios2/translate.c | 17 -----------------
 5 files changed, 44 deletions(-)

diff --git a/target/nios2/helper.h b/target/nios2/helper.h
index 6c8f0b5b35..6d8eec1814 100644
--- a/target/nios2/helper.h
+++ b/target/nios2/helper.h
@@ -21,7 +21,6 @@
 DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_WG, noreturn, env, i32)
 
 #if !defined(CONFIG_USER_ONLY)
-DEF_HELPER_2(mmu_read_debug, void, env, i32)
 DEF_HELPER_3(mmu_write, void, env, i32, i32)
 DEF_HELPER_1(check_interrupts, void, env)
 #endif
diff --git a/target/nios2/mmu.h b/target/nios2/mmu.h
index 4f46fbb82e..b7785b46c0 100644
--- a/target/nios2/mmu.h
+++ b/target/nios2/mmu.h
@@ -44,7 +44,6 @@ void mmu_flip_um(CPUNios2State *env, unsigned int um);
 unsigned int mmu_translate(CPUNios2State *env,
                            Nios2MMULookup *lu,
                            target_ulong vaddr, int rw, int mmu_idx);
-void mmu_read_debug(CPUNios2State *env, uint32_t rn);
 void mmu_write(CPUNios2State *env, uint32_t rn, uint32_t v);
 void mmu_init(CPUNios2State *env);
 
diff --git a/target/nios2/mmu.c b/target/nios2/mmu.c
index 2545c06761..5616c39d54 100644
--- a/target/nios2/mmu.c
+++ b/target/nios2/mmu.c
@@ -35,26 +35,6 @@
 #define MMU_LOG(x)
 #endif
 
-void mmu_read_debug(CPUNios2State *env, uint32_t rn)
-{
-    switch (rn) {
-    case CR_TLBACC:
-        MMU_LOG(qemu_log("TLBACC READ %08X\n", env->regs[rn]));
-        break;
-
-    case CR_TLBMISC:
-        MMU_LOG(qemu_log("TLBMISC READ %08X\n", env->regs[rn]));
-        break;
-
-    case CR_PTEADDR:
-        MMU_LOG(qemu_log("PTEADDR READ %08X\n", env->regs[rn]));
-        break;
-
-    default:
-        break;
-    }
-}
-
 /* rw - 0 = read, 1 = write, 2 = fetch.  */
 unsigned int mmu_translate(CPUNios2State *env,
                            Nios2MMULookup *lu,
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index a59003855a..61fc4dc903 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -26,11 +26,6 @@
 #include "qemu/main-loop.h"
 
 #if !defined(CONFIG_USER_ONLY)
-void helper_mmu_read_debug(CPUNios2State *env, uint32_t rn)
-{
-    mmu_read_debug(env, rn);
-}
-
 void helper_mmu_write(CPUNios2State *env, uint32_t rn, uint32_t v)
 {
     mmu_write(env, rn, v);
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index f9abc2fdd2..194c8ebafd 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -448,23 +448,6 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
     gen_check_supervisor(dc);
 
     switch (instr.imm5 + CR_BASE) {
-    case CR_PTEADDR:
-    case CR_TLBACC:
-    case CR_TLBMISC:
-    {
-#if !defined(CONFIG_USER_ONLY)
-        if (likely(instr.c != R_ZERO)) {
-            tcg_gen_mov_tl(cpu_R[instr.c], cpu_R[instr.imm5 + CR_BASE]);
-#ifdef DEBUG_MMU
-            TCGv_i32 tmp = tcg_const_i32(instr.imm5 + CR_BASE);
-            gen_helper_mmu_read_debug(cpu_R[instr.c], cpu_env, tmp);
-            tcg_temp_free_i32(tmp);
-#endif
-        }
-#endif
-        break;
-    }
-
     default:
         if (likely(instr.c != R_ZERO)) {
             tcg_gen_mov_tl(cpu_R[instr.c], cpu_R[instr.imm5 + CR_BASE]);
-- 
2.25.1


