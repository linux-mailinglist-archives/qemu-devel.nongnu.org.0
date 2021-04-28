Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A78A536DE18
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:20:20 +0200 (CEST)
Received: from localhost ([::1]:42298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbnrH-0006Wb-Oo
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbnck-00082x-Rg
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:05:20 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbncf-0005yi-BB
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:05:15 -0400
Received: by mail-wr1-x436.google.com with SMTP id n2so10667126wrm.0
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 10:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EOSzSixAzta/FPxWAggSKFD1+tlg1/eL2RD8SSdD1EU=;
 b=a0pLiGNtt6e2X8pDEOarq78UvC6GkxlEqyHcQRTqdwyZI8Iy14HJgwc4hOcAzbxfAn
 RKauC7fXCB6aLDmiu0hdYe3ss6cQlkZFu0krTaqpkDafphfBi92ds47oqVdfhs0gO7jU
 0TbfiXvbEEQpG0gC+ZslYxG+8iWSROeiB4/lb4bOsHj0EZA48ZcZqHZz1aqi4mMEkzsv
 8rUPDmQpkJSXzxjCZ5aQlzPXyTDnWMtWn1kc5IROYWfScbSRsaiplx0EIwfn0u3d93u1
 tNPsoBMCxZO9Wf+YlSeN7Kj9ETvekCJ0ie4AkFwlENxFBcRy/xvpyHjvvMmizq+LuAst
 VfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EOSzSixAzta/FPxWAggSKFD1+tlg1/eL2RD8SSdD1EU=;
 b=pyxxs6DjPdHvtwxnOrc5iW12BwUVyGt6NopFYyWQZ5GzLQaieqQT+P3s+oSBT4ZED8
 1gtzHow0ZCRreQzIaNMSjcftUFWCDVQvyBihS8FcrTA+gSmcxC1HmUpPEnwTqZsyC+3o
 pLzq9DjcQJnclvIacEN6qhfp7V6GLumJm517g7mboM1KvHRemz3hWtB2ks4NG/tBs0Fo
 RmqyWYu4hWUT+pNrayrZmFmLEjm2jECsW5vHN2SoOV+Yv1dsYTy/RVL6rslVf1t+MNgo
 81hb1T+3xZ7/kwJpYZo3anbVl+9kU53LC5BcxaajSbRqtm2nJUKK8bH6SW409Zu2DAEX
 4PEQ==
X-Gm-Message-State: AOAM532BUbThqzIqfEOWDG1iyKGyy2/HKE4eNaxvBwJrXEvsiIiL0ej0
 md/+9oiLm8c91/ruoZwFbxOIcTKkpb7Q8Q==
X-Google-Smtp-Source: ABdhPJzQ+R8PszHv9zeuPLpGPAfVl7rJ7bdlFdtyccvmCXqLPsOM7fPKgzvRy2GuU0Lf5X619bMKfA==
X-Received: by 2002:a05:6000:144d:: with SMTP id
 v13mr37432655wrx.73.1619629511740; 
 Wed, 28 Apr 2021 10:05:11 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id p7sm472394wrt.24.2021.04.28.10.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:05:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/30] target/mips: Declare mips_env_set_pc() inlined in
 "internal.h"
Date: Wed, 28 Apr 2021 19:03:48 +0200
Message-Id: <20210428170410.479308-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428170410.479308-1-f4bug@amsat.org>
References: <20210428170410.479308-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename set_pc() as mips_env_set_pc(), declare it inlined
and use it in cpu.c and op_helper.c.

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v4: mips_cpu_set_error_pc -> mips_env_set_pc (rth)
---
 target/mips/internal.h  | 10 ++++++++++
 target/mips/cpu.c       |  8 +-------
 target/mips/op_helper.c | 16 +++-------------
 3 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 57072a941e7..04f4b3d6614 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -219,6 +219,16 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 /* op_helper.c */
 void update_pagemask(CPUMIPSState *env, target_ulong arg1, int32_t *pagemask);
 
+static inline void mips_env_set_pc(CPUMIPSState *env, target_ulong value)
+{
+    env->active_tc.PC = value & ~(target_ulong)1;
+    if (value & 1) {
+        env->hflags |= MIPS_HFLAG_M16;
+    } else {
+        env->hflags &= ~(MIPS_HFLAG_M16);
+    }
+}
+
 static inline void restore_pamask(CPUMIPSState *env)
 {
     if (env->hflags & MIPS_HFLAG_ELPA) {
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 8f76f4576f4..a751c958329 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -327,14 +327,8 @@ void QEMU_NORETURN do_raise_exception_err(CPUMIPSState *env,
 static void mips_cpu_set_pc(CPUState *cs, vaddr value)
 {
     MIPSCPU *cpu = MIPS_CPU(cs);
-    CPUMIPSState *env = &cpu->env;
 
-    env->active_tc.PC = value & ~(target_ulong)1;
-    if (value & 1) {
-        env->hflags |= MIPS_HFLAG_M16;
-    } else {
-        env->hflags &= ~(MIPS_HFLAG_M16);
-    }
+    mips_env_set_pc(&cpu->env, value);
 }
 
 #ifdef CONFIG_TCG
diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index b80e8f75401..222a0d7c7b3 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -993,24 +993,14 @@ static void debug_post_eret(CPUMIPSState *env)
     }
 }
 
-static void set_pc(CPUMIPSState *env, target_ulong error_pc)
-{
-    env->active_tc.PC = error_pc & ~(target_ulong)1;
-    if (error_pc & 1) {
-        env->hflags |= MIPS_HFLAG_M16;
-    } else {
-        env->hflags &= ~(MIPS_HFLAG_M16);
-    }
-}
-
 static inline void exception_return(CPUMIPSState *env)
 {
     debug_pre_eret(env);
     if (env->CP0_Status & (1 << CP0St_ERL)) {
-        set_pc(env, env->CP0_ErrorEPC);
+        mips_env_set_pc(env, env->CP0_ErrorEPC);
         env->CP0_Status &= ~(1 << CP0St_ERL);
     } else {
-        set_pc(env, env->CP0_EPC);
+        mips_env_set_pc(env, env->CP0_EPC);
         env->CP0_Status &= ~(1 << CP0St_EXL);
     }
     compute_hflags(env);
@@ -1036,7 +1026,7 @@ void helper_deret(CPUMIPSState *env)
     env->hflags &= ~MIPS_HFLAG_DM;
     compute_hflags(env);
 
-    set_pc(env, env->CP0_DEPC);
+    mips_env_set_pc(env, env->CP0_DEPC);
 
     debug_post_eret(env);
 }
-- 
2.26.3


