Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2413536638
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:59:05 +0200 (CEST)
Received: from localhost ([::1]:58722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nudIm-0006Y3-TR
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nud8K-0001MY-VB
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:48:16 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:33614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nud8J-0005OF-0L
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:48:16 -0400
Received: by mail-pl1-x62b.google.com with SMTP id f18so4642442plg.0
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 09:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dBQmcYvQNWemNoz94qCXnnbynO5dcM+A32yDVQduyko=;
 b=Gy510/cGr9r2KUbeYfyW3JADAKO2l6E+2VBZmM7WHgyL5M9AE7aFpYK7QVKY+nE5RS
 lsddZ3qOLXmgXNJuTu5gY2gnSUDpUVSfqJn2Unf2kIB6H+PjoRjSChuS3iUQwE+8rs0A
 SFyvtwin+uobuZfMa2fxs5oBzEeGJbiTtjTUXrofmOe1csDnuPoEbMhlLO+nhqkkTPrf
 hIOelmG1TBBLsKjCzbaAMF3rIGM4GO8vj/6EWVofbHfC+HHgFSHc3WiacFACXQNfYwJH
 GTxhT+ZxCSrNRx+sSQg0RPZfgvEAHHsvQhrMlg7xEGpX/9GCrvpebJ2u0sK68wsRzmaD
 aC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dBQmcYvQNWemNoz94qCXnnbynO5dcM+A32yDVQduyko=;
 b=pj43vxBQWbmLa0VK+4uDGgBNQR2ttHEUByF7aDt0abSoGMK9pPj6njUjV8DMFGwVGD
 WHObNakApKvUHGR56sp6VnKJzT/i4GJaIX1lEZhPlwyvTN7/y0Z8Z9tvynMtUkvwiZcs
 G1J+ICgIJSzCoH8k4tWr3n4VDfqk3rbHA8vPO3Fh1hghAgPnkQ0yAyZYaxCLWUSP8Uoh
 y2p6Hfz7Nz9flscPtrruoeztnqqmeP58TsHLDLFNClyqhLfM5qNtetWHJIsstYHXXgdX
 Ze3jvAs8c3T+4bHeWHHNJM/HWyKR7V45xXYWvYzHufPSWOaqEAoPwLQSY7cVB+fgEO3M
 QPKg==
X-Gm-Message-State: AOAM5330aMQI8nb02cAUmXLSZxrCkwY+TBUvmZGwhstQiEqwLRY65bOW
 2UziMKcs2QtfxkeQekUFdf/m/31ExfXqXw==
X-Google-Smtp-Source: ABdhPJz863RbmxE/L9gEPquUM1wjvZSejA6+B93RTXRsVomVOkhf4fDnOaIQbQtiQ+19SVow7ZaHpA==
X-Received: by 2002:a17:903:244c:b0:162:2037:aacc with SMTP id
 l12-20020a170903244c00b001622037aaccmr27484839pls.46.1653670093632; 
 Fri, 27 May 2022 09:48:13 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 j11-20020aa7928b000000b0050dc7628133sm3861420pfa.13.2022.05.27.09.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 09:48:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 05/17] target/m68k: Remove retaddr in m68k_interrupt_all
Date: Fri, 27 May 2022 09:47:55 -0700
Message-Id: <20220527164807.135038-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527164807.135038-1-richard.henderson@linaro.org>
References: <20220527164807.135038-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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


