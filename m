Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7820D3613BE
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 22:57:38 +0200 (CEST)
Received: from localhost ([::1]:41942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX93R-00051l-25
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 16:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lX91T-0003mw-QM
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 16:55:35 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:42501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lX91R-0001U3-Hp
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 16:55:35 -0400
Received: by mail-pg1-x533.google.com with SMTP id g35so17704333pgg.9
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 13:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+JaCiTedYSQAb4N+G8YrbkANV0xKjTtxSIhO2zJqTe0=;
 b=VIy/jwk3SOfITF1F+v2faX664PLoUZFgiMalc1BilotmRvfwPM949GVW+5fLzW4Hjk
 Wrjku3u7dlPVCK4Lj91gudurzQOnVjQD7bhUCOQ5JsRMMQC7iiBRloTKSIzKViMSddL/
 6OJiR+Zc985lNth6viRp/ZUPJKd2BE2lJuHgkoDgYhXxnbVVh9YbHl3KFZL6ED0WkzO+
 +8BiXRLk2TCGtlPcWOrpWqxzGTVRiqldNGn6Teg5mm900YEgMcPThme1MmzcM6uOmy2r
 oG5yo8ahymEymyyv7LMQoxZij7Ej2sCrntxrD8qFFPZO/nanTIl0zXe4C8zD92Q4zYvp
 GPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+JaCiTedYSQAb4N+G8YrbkANV0xKjTtxSIhO2zJqTe0=;
 b=YN63OUuG7HT4l9VBQfWpLQ5Ocp1O9nW5Y+MtX9O7aCkGOpBIdg6aSifj0nizZUmCTX
 WLUBEb1b6nwnPEb/+f42c/WyKHEUqzqqd7q4WMBSovo4pL+h+ZZ6fPtO7gczNHYjCS+t
 HUXxKn//t63Lw3saNc9oXj4yS8Z077rI+a7s/WmygYQDSm69svFDo0esOk5YdbezocXk
 txxPNRH3YAwCadmNZo/ShkQPxmpP6XAjtht5+MQdvH/TQZ/Rbz4ab1uEusSiDbkpRb0x
 41LHb1En1BCSZ1IJT27bC3XKsxanZzVP97QN70Gpc1GKI+qx8au70iOSpe4XYwdgYBLO
 Ufrw==
X-Gm-Message-State: AOAM530vm+iuR2omOfTRkR7cJRsZ4+rY4MbnAQaG1akogMYeQ2xOmqFp
 P0lbgYQ2q3OO7kxUoI7MzTd2IEWxczc=
X-Google-Smtp-Source: ABdhPJw8dkUeUtnQqe+85y4dVqYAb++zQKwwQEVNEKeBS8dDGvfb8uG1G9CJCEPac+705O1RSp5IAw==
X-Received: by 2002:aa7:99cb:0:b029:245:1b7c:7982 with SMTP id
 v11-20020aa799cb0000b02902451b7c7982mr4983497pfi.23.1618520131664; 
 Thu, 15 Apr 2021 13:55:31 -0700 (PDT)
Received: from octofox.cadence.com ([2601:641:400:9e10:44a3:54ac:c170:b748])
 by smtp.gmail.com with ESMTPSA id pg11sm3145130pjb.53.2021.04.15.13.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 13:55:31 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/xtensa: don't generate extra EXCP_DEBUG on exception
Date: Thu, 15 Apr 2021 13:55:17 -0700
Message-Id: <20210415205517.23599-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

target/xtensa used to generate an extra EXCP_DEBUG exception before the
first instruction executed after an interrupt or an exception is taken
to allow single-stepping that instruction in the debugger.
This is no longer needed after the following commits:
a7ba744f4082 ("tcg/cpu-exec: precise single-stepping after an exception")
ba3c35d9c402 ("tcg/cpu-exec: precise single-stepping after an interrupt")
Drop exception state tracking/extra EXCP_DEBUG generation code.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
This patch depends on the "target/xtensa: Make sure that tb->size != 0"
patch.

 target/xtensa/cpu.c        | 1 -
 target/xtensa/cpu.h        | 7 -------
 target/xtensa/exc_helper.c | 5 -----
 target/xtensa/translate.c  | 6 ------
 4 files changed, 19 deletions(-)

diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index e2b2c7a71c1d..210ef800923b 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -79,7 +79,6 @@ static void xtensa_cpu_reset(DeviceState *dev)
 
     xcc->parent_reset(dev);
 
-    env->exception_taken = 0;
     env->pc = env->config->exception_vector[EXC_RESET0 + env->static_vectors];
     env->sregs[LITBASE] &= ~1;
 #ifndef CONFIG_USER_ONLY
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 3bd4f691c1a0..2345cb59c790 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -540,7 +540,6 @@ typedef struct CPUXtensaState {
     uint32_t ccount_base;
 #endif
 
-    int exception_taken;
     int yield_needed;
     unsigned static_vectors;
 
@@ -711,7 +710,6 @@ static inline int cpu_mmu_index(CPUXtensaState *env, bool ifetch)
 #define XTENSA_TBFLAG_ICOUNT 0x20
 #define XTENSA_TBFLAG_CPENABLE_MASK 0x3fc0
 #define XTENSA_TBFLAG_CPENABLE_SHIFT 6
-#define XTENSA_TBFLAG_EXCEPTION 0x4000
 #define XTENSA_TBFLAG_WINDOW_MASK 0x18000
 #define XTENSA_TBFLAG_WINDOW_SHIFT 15
 #define XTENSA_TBFLAG_YIELD 0x20000
@@ -732,8 +730,6 @@ typedef XtensaCPU ArchCPU;
 static inline void cpu_get_tb_cpu_state(CPUXtensaState *env, target_ulong *pc,
         target_ulong *cs_base, uint32_t *flags)
 {
-    CPUState *cs = env_cpu(env);
-
     *pc = env->pc;
     *cs_base = 0;
     *flags = 0;
@@ -782,9 +778,6 @@ static inline void cpu_get_tb_cpu_state(CPUXtensaState *env, target_ulong *pc,
     if (xtensa_option_enabled(env->config, XTENSA_OPTION_COPROCESSOR)) {
         *flags |= env->sregs[CPENABLE] << XTENSA_TBFLAG_CPENABLE_SHIFT;
     }
-    if (cs->singlestep_enabled && env->exception_taken) {
-        *flags |= XTENSA_TBFLAG_EXCEPTION;
-    }
     if (xtensa_option_enabled(env->config, XTENSA_OPTION_WINDOWED_REGISTER) &&
         (env->sregs[PS] & (PS_WOE | PS_EXCM)) == PS_WOE) {
         uint32_t windowstart = xtensa_replicate_windowstart(env) >>
diff --git a/target/xtensa/exc_helper.c b/target/xtensa/exc_helper.c
index 2f032bc05333..10e75ab070d7 100644
--- a/target/xtensa/exc_helper.c
+++ b/target/xtensa/exc_helper.c
@@ -40,9 +40,6 @@ void HELPER(exception)(CPUXtensaState *env, uint32_t excp)
     if (excp == EXCP_YIELD) {
         env->yield_needed = 0;
     }
-    if (excp == EXCP_DEBUG) {
-        env->exception_taken = 0;
-    }
     cpu_loop_exit(cs);
 }
 
@@ -197,7 +194,6 @@ static void handle_interrupt(CPUXtensaState *env)
             }
             env->sregs[PS] |= PS_EXCM;
         }
-        env->exception_taken = 1;
     }
 }
 
@@ -242,7 +238,6 @@ void xtensa_cpu_do_interrupt(CPUState *cs)
 
             vector = env->config->exception_vector[cs->exception_index];
             env->pc = relocated_vector(env, vector);
-            env->exception_taken = 1;
         } else {
             qemu_log_mask(CPU_LOG_INT,
                           "%s(pc = %08x) bad exception_index: %d\n",
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 73584d9d605b..f93df87ec490 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1279,12 +1279,6 @@ static void xtensa_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         dc->base.is_jmp = DISAS_NORETURN;
         return;
     }
-    if (dc->base.tb->flags & XTENSA_TBFLAG_EXCEPTION) {
-        gen_exception(dc, EXCP_DEBUG);
-        dc->base.pc_next = dc->pc + 1;
-        dc->base.is_jmp = DISAS_NORETURN;
-        return;
-    }
 
     if (dc->icount) {
         TCGLabel *label = gen_new_label();
-- 
2.20.1


