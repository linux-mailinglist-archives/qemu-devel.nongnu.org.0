Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A991F50C05B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 21:29:48 +0200 (CEST)
Received: from localhost ([::1]:42112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhyyR-000738-QB
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 15:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nhyl2-0005Tn-Gv
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 15:15:56 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:35491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nhyl0-0003e7-Qp
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 15:15:56 -0400
Received: by mail-pl1-x636.google.com with SMTP id b7so12891270plh.2
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 12:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P63OzSdz6FU81VGMPFWRvWLp0HB+vs1VIjyKt3sQlS8=;
 b=TJC3vwrTGfPAwsy96Kf/GwQXrmOiTVvF2CbUEwy6yxQitzF9lWKQk96gepVGC4bVEB
 /4O5jAQQnyx77cHU3UtzU0Paj51x/1I0rv3yEf3OTx9aNr/pA/teHtIfbCdngT5v31CY
 S+evglxRn7w3+HlrBQ0GdxMfVInO4I0MLxG2iMn65h6xVY/kow6eX7HEXddU+mnnRzXO
 +tFxyGJNhZGvqFny4yY2aLJyClXjCTSGSZ561VrKocFr6asAziWSjMQGz6NQ8uVe8u+H
 rXahIHixbuY2WFEXGnowmaOrjXAJagYz/msqMz1iyAaI5Qp3I2mMxR97vfWPCR27Wktw
 GWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P63OzSdz6FU81VGMPFWRvWLp0HB+vs1VIjyKt3sQlS8=;
 b=GU7dlG+VkJBfw8o06anhR5ugGplZHD9igNhQLcSYkXS7e32I9aIijoAt58WP//1r8P
 3GutRqwWD65SeWa31zwd3CCR3QJY+9FANLBysSKJN+LSPEqdzim13pDKgQpUSogZfPS5
 f98iycj0/hQRYU1fsylXwMgUOzupjD8h0HYf7FgPTBl7RFFk59X+Srm4AiGPpzLtW+FE
 PhoqVDfJwqaAhDa49eIP3FP0NfXiZH7r9se07WzlztsUNn8Sl2oUiWqdYBTgXt9c52MF
 bOtPvXzXwH5JL8T0s+tU5tzZ1iDjqipDslvSDSDOvELYirzTDf6POAxv99mNIJ/XfepM
 yWug==
X-Gm-Message-State: AOAM533kIbwk7wPSvXF64pJmBjU7jencJAReMHVblzatx2Ijf6bLcY6A
 21eVVIZN5LfDZ8ZfEyYuSZzVVLredtA=
X-Google-Smtp-Source: ABdhPJxLn6SjIcWwH31b0fTKYaANtBwEAUwqLOQPk2upGxazuPDQBaHcplukyluVoXcdTyHRO9gStQ==
X-Received: by 2002:a17:903:40c6:b0:15a:8355:3c3b with SMTP id
 t6-20020a17090340c600b0015a83553c3bmr6184725pld.9.1650654949893; 
 Fri, 22 Apr 2022 12:15:49 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:4c40:4238:b597:4c1a])
 by smtp.gmail.com with ESMTPSA id
 a38-20020a056a001d2600b004fae885424dsm3391598pfx.72.2022.04.22.12.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 12:15:49 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/xtensa: add clock input to xtensa CPU
Date: Fri, 22 Apr 2022 12:15:42 -0700
Message-Id: <20220422191542.415701-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create clock input for the xtensa CPU device and initialize its
frequency to the default core frequency specified in the config.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 target/xtensa/cpu.c       | 15 +++++++++++++++
 target/xtensa/cpu.h       |  5 +++++
 target/xtensa/op_helper.c |  7 ++++---
 3 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 224f72323693..fd553fdfb5e6 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -34,6 +34,7 @@
 #include "fpu/softfloat.h"
 #include "qemu/module.h"
 #include "migration/vmstate.h"
+#include "hw/qdev-clock.h"
 
 
 static void xtensa_cpu_set_pc(CPUState *cs, vaddr value)
@@ -172,9 +173,23 @@ static void xtensa_cpu_initfn(Object *obj)
     memory_region_init_io(env->system_er, obj, NULL, env, "er",
                           UINT64_C(0x100000000));
     address_space_init(env->address_space_er, env->system_er, "ER");
+
+    cpu->clock = qdev_init_clock_in(DEVICE(obj), "clk-in", NULL, cpu, 0);
+    clock_set_hz(cpu->clock, env->config->clock_freq_khz * 1000);
 #endif
 }
 
+XtensaCPU *xtensa_cpu_create_with_clock(const char *cpu_type, Clock *cpu_refclk)
+{
+    DeviceState *cpu;
+
+    cpu = DEVICE(object_new(cpu_type));
+    qdev_connect_clock_in(cpu, "clk-in", cpu_refclk);
+    qdev_realize(cpu, NULL, &error_abort);
+
+    return XTENSA_CPU(cpu);
+}
+
 #ifndef CONFIG_USER_ONLY
 static const VMStateDescription vmstate_xtensa_cpu = {
     .name = "cpu",
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 4515f682aa26..6f773e681384 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -30,6 +30,7 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#include "hw/clock.h"
 #include "xtensa-isa.h"
 
 /* Xtensa processors have a weak memory model */
@@ -558,6 +559,7 @@ struct ArchCPU {
     CPUState parent_obj;
     /*< public >*/
 
+    Clock *clock;
     CPUNegativeOffsetState neg;
     CPUXtensaState env;
 };
@@ -792,4 +794,7 @@ static inline void cpu_get_tb_cpu_state(CPUXtensaState *env, target_ulong *pc,
     }
 }
 
+XtensaCPU *xtensa_cpu_create_with_clock(const char *cpu_type,
+                                        Clock *cpu_refclk);
+
 #endif
diff --git a/target/xtensa/op_helper.c b/target/xtensa/op_helper.c
index d85d3516d6a5..1af7becc54b1 100644
--- a/target/xtensa/op_helper.c
+++ b/target/xtensa/op_helper.c
@@ -38,12 +38,12 @@
 
 void HELPER(update_ccount)(CPUXtensaState *env)
 {
+    XtensaCPU *cpu = XTENSA_CPU(env_cpu(env));
     uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
 
     env->ccount_time = now;
     env->sregs[CCOUNT] = env->ccount_base +
-        (uint32_t)((now - env->time_base) *
-                   env->config->clock_freq_khz / 1000000);
+        (uint32_t)clock_ns_to_ticks(cpu->clock, now - env->time_base);
 }
 
 void HELPER(wsr_ccount)(CPUXtensaState *env, uint32_t v)
@@ -59,6 +59,7 @@ void HELPER(wsr_ccount)(CPUXtensaState *env, uint32_t v)
 
 void HELPER(update_ccompare)(CPUXtensaState *env, uint32_t i)
 {
+    XtensaCPU *cpu = XTENSA_CPU(env_cpu(env));
     uint64_t dcc;
 
     qatomic_and(&env->sregs[INTSET],
@@ -66,7 +67,7 @@ void HELPER(update_ccompare)(CPUXtensaState *env, uint32_t i)
     HELPER(update_ccount)(env);
     dcc = (uint64_t)(env->sregs[CCOMPARE + i] - env->sregs[CCOUNT] - 1) + 1;
     timer_mod(env->ccompare[i].timer,
-              env->ccount_time + (dcc * 1000000) / env->config->clock_freq_khz);
+              env->ccount_time + clock_ticks_to_ns(cpu->clock, dcc));
     env->yield_needed = 1;
 }
 
-- 
2.30.2


