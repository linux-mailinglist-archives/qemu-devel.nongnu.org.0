Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 105BE3C3561
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:56:49 +0200 (CEST)
Received: from localhost ([::1]:40408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2FLU-0005h5-3o
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2Exg-0006Cb-52
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:12 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:40600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2Exe-0002TP-6S
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:11 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 b14-20020a17090a7aceb029017261c7d206so9961183pjl.5
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZRs8c+bYXTrMqFwEkSuK8yjMifIV/i4B8zW/9Y2Jl1o=;
 b=MYMWwg/Y+O2hTJus4l/OaD77isoxwMkkwxEQdMR7UWAO0QunAIIf2gQOx1seA19lyM
 fA8GrFMKgigYpt+JcKmfY4DGAHTmD5eDJq9pNmg2UBIWOGP1sn9aePzUcTZeUXB6Kpjr
 o3EhnBv+E3QegS0x0bDYV5AepRsh7iosjRaKFuuZL2GVfSUTLrYZHmfSCuI5ORTLBT4O
 41c5BBbYWEkfxBxpDcsr77AmT7g4ZcEUIXqZzoJB+OHtJBChzc9fftA/7uLn3QltM+pt
 k+Ttgt0Lo6ACCbPUMQp6CKcSnWfod+mQ3G9MXlWe4VzQ5CH1OgntAN3+BplPVRvU51Mm
 Gz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZRs8c+bYXTrMqFwEkSuK8yjMifIV/i4B8zW/9Y2Jl1o=;
 b=YSNbNE4GkzitdmCUb1PlGQn+XEdGDfGRP/TRqPVIVDfqDpYpMLswCnJCNiesNfz/wm
 u9U/ZUZN595eT6jsnEQ2xxZnAk/37q+2gCz2QjgwGyVbkzFjHk2RmAEzWfbUlK9HcaEH
 gCbpMAKtwSCzYsN6mhEjR2VSGOkcpYj0ubd19rCa6FqIqvxxthwHALF3gq3IJYNP4YKe
 OvU6hoF2SZ2phFoRe0zeXazAm34BxEt2EKmnWTp2UWgfW4AwGqaCY5sPqA0meU47+EPN
 PQpvdxwFNl2YQ76M8JYqWQvS8aEPgbm9OwTVzCFnCF/beR/QGGniX7tJibuhygJGs0to
 Cgkw==
X-Gm-Message-State: AOAM5314H1388R5rPJ1XrZsJqVo4flteKkqC1z1m1CMo1/McgvR+tl2O
 8u94LjqN6AP6dHkyoZLFcYjokhwG8rpqRQ==
X-Google-Smtp-Source: ABdhPJx1ixG3GxJBLg97UdgOrP9bMgHt3nOBN7MTntEah8tDUXftpTRDJ4iwi+gVy7njaW4zKA4Zdw==
X-Received: by 2002:a17:902:d88b:b029:128:cd59:ead2 with SMTP id
 b11-20020a170902d88bb0290128cd59ead2mr35851874plz.27.1625931128919; 
 Sat, 10 Jul 2021 08:32:08 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:32:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 36/41] accel/tcg: Move helper_lookup_tb_ptr to cpu-exec.c
Date: Sat, 10 Jul 2021 08:31:38 -0700
Message-Id: <20210710153143.1320521-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will allow additional code sharing.
No functional change.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


