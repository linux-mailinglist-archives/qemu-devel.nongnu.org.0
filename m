Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A8A363855
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 00:56:20 +0200 (CEST)
Received: from localhost ([::1]:38552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYGKx-0007fX-Pq
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 18:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGGU-0002qA-H5
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:51:42 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:52844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGGT-0000YD-2R
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:51:42 -0400
Received: by mail-wm1-x333.google.com with SMTP id y204so15757580wmg.2
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 15:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eApDsHd46Y+IQH1RVKAdhqg7h/PQQ2n3i/53YZQWS2A=;
 b=vf9RnpevS5eCvIeEyNHERCcax112QSw8ql2UJoWQFyeGdp+TOjrGtzcVPzGvWXU8VG
 gNnP3CZLN+w3LggnxFn70kL/7otB39I0uPG7393FoCeJI7Cwk06G1a6N13tq40jEPWiK
 lEAXLwCCw01JmN8S6zPvZLf88mm3SZ4vAyedQu/C2Sw5aT29m2xe1Qgphnn7OSGHCiHf
 b0c52gyxXI4OZ0bB7e+rW5HzvT7yeEZCPprlARP/opbOUfmWWsbRuXhEnQvqwb4P+NQe
 Y26OKtgCJQDxUMBDopjVgqmeAHU18v9WeOtYh/epEclis+ioK10OlbG6cI9FC24+3961
 7oGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eApDsHd46Y+IQH1RVKAdhqg7h/PQQ2n3i/53YZQWS2A=;
 b=bQZ+EzBy56s98nuHSjagd38czxjof08V5lI79OGthTq3FYpCMJwtY3bNxlQl8+Bz9g
 qGDlnTt3PWFzeIvL4r5P1JKBnDGaYyh2/WA8rYzMhfAEJdxYs3I+7ipWaBSULKhJcxak
 YyWQ17nof7lRXaO8hVjWFyhdiAJKvNkhRODkCUleFf3mF2D9xEQ7QvA2pVpYmNx98l3z
 Fuwjfdv3m1fenP2Ag9PVjVt2MnB8uqlRqBsqWsHluJ1e8UoENP9RxX9EDsB9Xg0GJkVd
 M4MOQKABfRkoTN86KERGsu2pZoSRaeGuv+pTkY7fDvaYNONEKyegguWS+wxDZCDbJFGX
 s4yw==
X-Gm-Message-State: AOAM531t5jMM+eNGmJ93PhbxGMPPt18orCX+8kCjr61lBdiQjBnadge7
 qE4GaBcPfXxc1RC4IIXajL+U0pDX8Sk4mQ==
X-Google-Smtp-Source: ABdhPJxc3gpTfccsrhccs0SFJ+us3BRh4TD5MfNQq4sX84yzYhNgNK00eWhbgvIb8F+RPXtpN2fPWQ==
X-Received: by 2002:a1c:e309:: with SMTP id a9mr18296700wmh.63.1618786298949; 
 Sun, 18 Apr 2021 15:51:38 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id g1sm11974234wrd.69.2021.04.18.15.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 15:51:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/29] target/mips: Declare mips_cpu_set_error_pc() inlined
 in "internal.h"
Date: Mon, 19 Apr 2021 00:50:37 +0200
Message-Id: <20210418225058.1257014-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418225058.1257014-1-f4bug@amsat.org>
References: <20210418225058.1257014-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

Rename set_pc() as mips_cpu_set_error_pc(), declare it inlined
and use it in cpu.c and op_helper.c.

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h  | 11 +++++++++++
 target/mips/cpu.c       |  8 +-------
 target/mips/op_helper.c | 16 +++-------------
 3 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 57072a941e7..81671d567d0 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -219,6 +219,17 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 /* op_helper.c */
 void update_pagemask(CPUMIPSState *env, target_ulong arg1, int32_t *pagemask);
 
+static inline void mips_cpu_set_error_pc(CPUMIPSState *env,
+                                         target_ulong error_pc)
+{
+    env->active_tc.PC = error_pc & ~(target_ulong)1;
+    if (error_pc & 1) {
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
index 90ae232c8b8..fcbf95c85b9 100644
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
+    mips_cpu_set_error_pc(&cpu->env, value);
 }
 
 #ifdef CONFIG_TCG
diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index b80e8f75401..f7da8c83aee 100644
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
+        mips_cpu_set_error_pc(env, env->CP0_ErrorEPC);
         env->CP0_Status &= ~(1 << CP0St_ERL);
     } else {
-        set_pc(env, env->CP0_EPC);
+        mips_cpu_set_error_pc(env, env->CP0_EPC);
         env->CP0_Status &= ~(1 << CP0St_EXL);
     }
     compute_hflags(env);
@@ -1036,7 +1026,7 @@ void helper_deret(CPUMIPSState *env)
     env->hflags &= ~MIPS_HFLAG_DM;
     compute_hflags(env);
 
-    set_pc(env, env->CP0_DEPC);
+    mips_cpu_set_error_pc(env, env->CP0_DEPC);
 
     debug_post_eret(env);
 }
-- 
2.26.3


