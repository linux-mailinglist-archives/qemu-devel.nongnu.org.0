Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C074DAA48
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 07:03:56 +0100 (CET)
Received: from localhost ([::1]:60732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUMlH-0002LW-6U
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 02:03:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgL-0002GC-Sa
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:50 -0400
Received: from [2607:f8b0:4864:20::636] (port=39568
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgK-0006Rz-B5
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:49 -0400
Received: by mail-pl1-x636.google.com with SMTP id d18so965382plr.6
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 22:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=46ufPNCBtrD2443ESlCBM/IFeVZu2U1LqCPdzBzWRlc=;
 b=vZnFHq+IIbqItDylP6+lvjrFO+2baeqXweVOScytmDv16FOkZSfLv7bHxKMlP+r4BJ
 TrYRDpHqsMN3l66PP6ChU+EcB8Fv1+3vI9mcXCnyvlc+p4QOIYmZ72QXpbIWlReDMAf/
 sqXG5hUbNtoIyCYUSHFw0oxTp2p5iHlSXjL6VNFZt+gpDN44HxMsQrM3DBEGVx3BjUf9
 FZwCNZdNtJ1tXNArHxmS0HX4SLKB84Vp10Vpv7dVfLsvACLs480YnK0+RjJoL9bOVG7z
 trRHiAXNtWzg/4JGEGKZlzrgRUJDKem+G0UOZhbyRSxzjMXTpFhyUIUTWBv4JFXB+2wQ
 451g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=46ufPNCBtrD2443ESlCBM/IFeVZu2U1LqCPdzBzWRlc=;
 b=Z4HTxxNNM/64+NvksgCBrWp8MxkN/Zj3ElQJqikn+uGJ6THvg7Ke6seW2aCdMPB+Bc
 SQvLF+xqoll+YFMzapBDmihsezyAO9uG/TpeSVQFO3oKKMgfjvKqGVMmUiaUCzzkzXJi
 Vl23s4MxP/RUkHdkktQM3AU8lRAe9mAAWJ1NIHczILxSG5EPYsvGbkWBO03GBSPkXLsT
 jC072hDniaHZG6FWpPsw30t0nldQabE1EEVUsy252CNrtMXGhwwm5axjmV8Ly9OGMdC6
 uhteR8s9dFOMhmQfU8onKrIkSFVR+ne3/PayBHwtgsW6ofDlUeklPlIer9xJ0DuNgKmK
 nBaQ==
X-Gm-Message-State: AOAM530jCVPsyNxycx9Zjb74OMIhNb/Ux6LihAaZbSdiXf2lgxpbwZEI
 bZBgVhvqAeePUBfCT3Up9mBElEJht6BZDw==
X-Google-Smtp-Source: ABdhPJxGCaid/Tbk/A2lucJT/oLu3QaMs3a5USzO1rTmf5ZUctLNxl4eoyRL+s0Zgkzedlc66dBVgQ==
X-Received: by 2002:a17:902:7296:b0:151:62b1:e2b0 with SMTP id
 d22-20020a170902729600b0015162b1e2b0mr31721514pll.165.1647410326781; 
 Tue, 15 Mar 2022 22:58:46 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i24-20020a056a00225800b004f6edabc9f4sm1236290pfu.72.2022.03.15.22.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 22:58:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/17] target/m68k: Remove retaddr in m68k_interrupt_all
Date: Tue, 15 Mar 2022 22:58:28 -0700
Message-Id: <20220316055840.727571-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316055840.727571-1-richard.henderson@linaro.org>
References: <20220316055840.727571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
2.25.1


