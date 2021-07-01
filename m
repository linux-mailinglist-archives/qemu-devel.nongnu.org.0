Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A21503B93E8
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 17:27:31 +0200 (CEST)
Received: from localhost ([::1]:38176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyybC-0007AU-5v
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 11:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyyZY-0004OO-4S
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:25:48 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:35693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyyZS-00088m-70
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:25:47 -0400
Received: by mail-pg1-x529.google.com with SMTP id v7so6432556pgl.2
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 08:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0vRIHqeRyM8fI+g5SmswZ/3igwA5aeF29s3zHSl2bx4=;
 b=lHjUzNrqdJ4ZuELys5pKoTIHkUjdfwcnsW8eZ9zvW1MR3ms9JG1Hz6CTgfDiy3rJXB
 mU9Jsi8eBVgObjHQLOOMCcKc1ORrsljCtZqlJpVd2mtpoir0w5j9yxfz5hDkwg80ilWj
 SmPJvNYgaG9HN3CpQskfvb6A0LRn2v53+hKYzu74c+LX7Qi6h9GwqPELuMkBbETzIrKt
 TX5F30VkFjSuqKBJ3sayzGHNCKnQtxR3BX2OoOhm1zlm43e2nPuLmHg5JT+IBXZJpX7J
 guETt57AdEb/eeUczjRiXyPGLYN53TsGhNxaqg3vWIEz3QF2KVe32W5M6eqVl3YhE4on
 tVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0vRIHqeRyM8fI+g5SmswZ/3igwA5aeF29s3zHSl2bx4=;
 b=RjG5dEqSEcP6Q7b0nCRo7uwgPd/D3EKBHHTALGfMQJaOQds9iqF/wprYpbxzTGJDFa
 7jnz2RNCAyKX2Yf1lQQGkm/vZqzbfBuAF4Nd2ZXE4iPLd92UMUux0c6wHRVktwvTP3zO
 fvIraZg2M+d5/ua0kaX7lb3lyCwyolSQA4KcZZcG06Wcy+cZLBxvPge7HFV86j61kBMh
 xiXe6A43DHCee8uNvPkzt+w41N3DoqeIQV9SqKFjgLNqePwETVFdidHql8w70lxcdBc8
 zOAf4YhI33rsSztxXR4NH/xWrXLm5t2NwnSs/vzBcOBapc+NjNlyEylBpmtxWss2Wvvn
 ogvg==
X-Gm-Message-State: AOAM532ryfYnxB2IUhnSm+N3oADHzBTnBKmlRIkKH5rhNQhN7Vm2+972
 EhHmaR/1S7pkRS3UrofeRNl/SZWK0scy3w==
X-Google-Smtp-Source: ABdhPJwCZ5dxXNM549sXHFlCXh0TeYWDsYLfKmStdpjFvhdChxnmETp3S5jYwl5wHecAM2rdk82dbA==
X-Received: by 2002:a63:5d5c:: with SMTP id o28mr194707pgm.22.1625153139956;
 Thu, 01 Jul 2021 08:25:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j4sm10213197pjv.7.2021.07.01.08.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 08:25:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/17] accel/tcg: Move helper_lookup_tb_ptr to cpu-exec.c
Date: Thu,  1 Jul 2021 08:25:22 -0700
Message-Id: <20210701152537.3330420-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210701152537.3330420-1-richard.henderson@linaro.org>
References: <20210701152537.3330420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will allow additional code sharing.
No functional change.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c    | 30 ++++++++++++++++++++++++++++++
 accel/tcg/tcg-runtime.c | 22 ----------------------
 2 files changed, 30 insertions(+), 22 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index ad1279d2ed..fb6668606f 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -38,6 +38,7 @@
 #include "exec/cpu-all.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/replay.h"
+#include "exec/helper-proto.h"
 #include "tb-hash.h"
 #include "tb-lookup.h"
 #include "tb-context.h"
@@ -145,6 +146,35 @@ static void init_delay_params(SyncClocks *sc, const CPUState *cpu)
 }
 #endif /* CONFIG USER ONLY */
 
+/**
+ * helper_lookup_tb_ptr: quick check for next tb
+ * @env: current cpu state
+ *
+ * Look for an existing TB matching the current cpu state.
+ * If found, return the code pointer.  If not found, return
+ * the tcg epilogue so that we return into cpu_tb_exec.
+ */
+const void *HELPER(lookup_tb_ptr)(CPUArchState *env)
+{
+    CPUState *cpu = env_cpu(env);
+    TranslationBlock *tb;
+    target_ulong cs_base, pc;
+    uint32_t flags;
+
+    cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
+
+    tb = tb_lookup(cpu, pc, cs_base, flags, curr_cflags(cpu));
+    if (tb == NULL) {
+        return tcg_code_gen_epilogue;
+    }
+    qemu_log_mask_and_addr(CPU_LOG_EXEC, pc,
+                           "Chain %d: %p ["
+                           TARGET_FMT_lx "/" TARGET_FMT_lx "/%#x] %s\n",
+                           cpu->cpu_index, tb->tc.ptr, cs_base, pc, flags,
+                           lookup_symbol(pc));
+    return tb->tc.ptr;
+}
+
 /* Execute a TB, and fix up the CPU state afterwards if necessary */
 /*
  * Disable CFI checks.
diff --git a/accel/tcg/tcg-runtime.c b/accel/tcg/tcg-runtime.c
index 66ac830e2f..e4e030043f 100644
--- a/accel/tcg/tcg-runtime.c
+++ b/accel/tcg/tcg-runtime.c
@@ -30,7 +30,6 @@
 #include "disas/disas.h"
 #include "exec/log.h"
 #include "tcg/tcg.h"
-#include "tb-lookup.h"
 
 /* 32-bit helpers */
 
@@ -145,27 +144,6 @@ uint64_t HELPER(ctpop_i64)(uint64_t arg)
     return ctpop64(arg);
 }
 
-const void *HELPER(lookup_tb_ptr)(CPUArchState *env)
-{
-    CPUState *cpu = env_cpu(env);
-    TranslationBlock *tb;
-    target_ulong cs_base, pc;
-    uint32_t flags;
-
-    cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
-
-    tb = tb_lookup(cpu, pc, cs_base, flags, curr_cflags(cpu));
-    if (tb == NULL) {
-        return tcg_code_gen_epilogue;
-    }
-    qemu_log_mask_and_addr(CPU_LOG_EXEC, pc,
-                           "Chain %d: %p ["
-                           TARGET_FMT_lx "/" TARGET_FMT_lx "/%#x] %s\n",
-                           cpu->cpu_index, tb->tc.ptr, cs_base, pc, flags,
-                           lookup_symbol(pc));
-    return tb->tc.ptr;
-}
-
 void HELPER(exit_atomic)(CPUArchState *env)
 {
     cpu_loop_exit_atomic(env_cpu(env), GETPC());
-- 
2.25.1


