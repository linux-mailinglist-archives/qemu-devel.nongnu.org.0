Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C24153F2AB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 01:41:50 +0200 (CEST)
Received: from localhost ([::1]:49426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyMM1-0003EA-Cz
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 19:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwR-0001k3-Th
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:27 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:46648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwK-0003yZ-49
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:21 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 k5-20020a17090a404500b001e8875e6242so3110495pjg.5
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 16:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2tEpznda4NBD1pF/zDxh99hZ9qnK8CZehoNRiqaZwwU=;
 b=NBXIEa7grTNEnAQH/8dwGr9tyDoJqV5k4hKcPMflRFwTucPeYIfn+9zDBkc+VlUjiz
 t4X8BWfNvpgD5CdYiZvLzyLdPVg04pI1nlZYZFin4KDAOhcYJ9Wo4+O/3dlJ5PBMiW+n
 hAVeqaqF7slrt2klk1Ya+WI4TSYNbXtKy63XvaCqMPhDPnevvJ65p3CfxWLiae5J5FS9
 F22XGn1d9+mx5kkmBsGrVqYOETnRK0JSjPohfyibel2h8NaEGzGqYfhksOaM+Jk3/5vq
 L6kKIkofAdlKQ5krRSfEwBnBd2t9Y5GYqI4nl7CP38WUyJ9Z4F3KgWZMSdT58x0YQW+s
 9z4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2tEpznda4NBD1pF/zDxh99hZ9qnK8CZehoNRiqaZwwU=;
 b=g1IeNj/Uv+36XWyEED8hISgo5ypZVmZGJ03GwNDlYc1kDi580R7m7VNpPHPoXsKnrq
 sX8tozmJNQRXn5DnT+pQ+X+2zffyJ23afqmnDebRp97bnSel+4U/dHEmJH2E60aumcv4
 TtVAw784wK1yAH4HKvM9C2apYLf83kZEmzdO3B6vzBkt8Qzn2yDR4AHS/LdjZdMGS95J
 Lns1l+xwvz4bgDpgxDgnSdpQpx2uXg9OcwlQPxZWF62BENhAdq2JjSnEi4BKjBYCx9+R
 uRm6OeyoITSK922zJPKSNdec5EHpHhaVid987K21ZT3IOAYcQlWy9Mv61WYlWvSmmGQg
 Jpdw==
X-Gm-Message-State: AOAM530qszwk5aBODFap8LQf5YbC7+TcvcqK1qZoH/tO8A8y/ge7DI/h
 +RMIiOaNe75mcAbINonlWe/5lx454uoaMw==
X-Google-Smtp-Source: ABdhPJwFl/POD0Zc9rjtlCrE6oX5ffVfmJ4ymAM0gI+v077/RRR4nzbkAf2uFJlAhQndTvP06VdPMQ==
X-Received: by 2002:a17:902:ecc9:b0:163:e41c:bf12 with SMTP id
 a9-20020a170902ecc900b00163e41cbf12mr26100477plh.164.1654557314515; 
 Mon, 06 Jun 2022 16:15:14 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c24200b00162523fdb8fsm10954623plg.252.2022.06.06.16.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:15:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 Song Gao <gaosong@loongson.cn>
Subject: [PULL 24/43] target/loongarch: Add constant timer support
Date: Mon,  6 Jun 2022 16:14:31 -0700
Message-Id: <20220606231450.448443-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606231450.448443-1-richard.henderson@linaro.org>
References: <20220606231450.448443-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220606124333.2060567-25-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/cpu.h            |  4 ++
 target/loongarch/internals.h      |  6 +++
 target/loongarch/constant_timer.c | 64 +++++++++++++++++++++++++++++++
 target/loongarch/cpu.c            |  2 +
 target/loongarch/meson.build      |  1 +
 5 files changed, 77 insertions(+)
 create mode 100644 target/loongarch/constant_timer.c

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index b983ce241c..2081902f2e 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -11,6 +11,7 @@
 #include "exec/cpu-defs.h"
 #include "fpu/softfloat-types.h"
 #include "hw/registerfields.h"
+#include "qemu/timer.h"
 
 #define TCG_GUEST_DEFAULT_MO (0)
 
@@ -185,6 +186,8 @@ extern const char * const regnames[32];
 extern const char * const fregnames[32];
 
 #define N_IRQS      13
+#define IRQ_TIMER   11
+#define IRQ_IPI     12
 
 #define LOONGARCH_STLB         2048 /* 2048 STLB */
 #define LOONGARCH_MTLB         64   /* 64 MTLB */
@@ -295,6 +298,7 @@ struct ArchCPU {
 
     CPUNegativeOffsetState neg;
     CPULoongArchState env;
+    QEMUTimer timer;
 };
 
 #define TYPE_LOONGARCH_CPU "loongarch-cpu"
diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
index 69183e8bb5..4b1bcd7c0f 100644
--- a/target/loongarch/internals.h
+++ b/target/loongarch/internals.h
@@ -32,6 +32,12 @@ extern const VMStateDescription vmstate_loongarch_cpu;
 
 void loongarch_cpu_set_irq(void *opaque, int irq, int level);
 
+void loongarch_constant_timer_cb(void *opaque);
+uint64_t cpu_loongarch_get_constant_timer_counter(LoongArchCPU *cpu);
+uint64_t cpu_loongarch_get_constant_timer_ticks(LoongArchCPU *cpu);
+void cpu_loongarch_store_constant_timer_config(LoongArchCPU *cpu,
+                                               uint64_t value);
+
 bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                             MMUAccessType access_type, int mmu_idx,
                             bool probe, uintptr_t retaddr);
diff --git a/target/loongarch/constant_timer.c b/target/loongarch/constant_timer.c
new file mode 100644
index 0000000000..1851f53fd6
--- /dev/null
+++ b/target/loongarch/constant_timer.c
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU LoongArch constant timer support
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/timer.h"
+#include "cpu.h"
+#include "internals.h"
+#include "cpu-csr.h"
+
+#define TIMER_PERIOD                10 /* 10 ns period for 100 MHz frequency */
+#define CONSTANT_TIMER_TICK_MASK    0xfffffffffffcUL
+#define CONSTANT_TIMER_ENABLE       0x1UL
+
+uint64_t cpu_loongarch_get_constant_timer_counter(LoongArchCPU *cpu)
+{
+    return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) / TIMER_PERIOD;
+}
+
+uint64_t cpu_loongarch_get_constant_timer_ticks(LoongArchCPU *cpu)
+{
+    uint64_t now, expire;
+
+    now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    expire = timer_expire_time_ns(&cpu->timer);
+
+    return (expire - now) / TIMER_PERIOD;
+}
+
+void cpu_loongarch_store_constant_timer_config(LoongArchCPU *cpu,
+                                               uint64_t value)
+{
+    CPULoongArchState *env = &cpu->env;
+    uint64_t now, next;
+
+    env->CSR_TCFG = value;
+    if (value & CONSTANT_TIMER_ENABLE) {
+        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        next = now + (value & CONSTANT_TIMER_TICK_MASK) * TIMER_PERIOD;
+        timer_mod(&cpu->timer, next);
+    } else {
+        timer_del(&cpu->timer);
+    }
+}
+
+void loongarch_constant_timer_cb(void *opaque)
+{
+    LoongArchCPU *cpu  = opaque;
+    CPULoongArchState *env = &cpu->env;
+    uint64_t now, next;
+
+    if (FIELD_EX64(env->CSR_TCFG, CSR_TCFG, PERIODIC)) {
+        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        next = now + (env->CSR_TCFG & CONSTANT_TIMER_TICK_MASK) * TIMER_PERIOD;
+        timer_mod(&cpu->timer, next);
+    } else {
+        env->CSR_TCFG = FIELD_DP64(env->CSR_TCFG, CSR_TCFG, EN, 0);
+    }
+
+    loongarch_cpu_set_irq(opaque, IRQ_TIMER, 1);
+}
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 01a0b4878a..5ec0ba1cfa 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -495,6 +495,8 @@ static void loongarch_cpu_init(Object *obj)
 
     cpu_set_cpustate_pointers(cpu);
     qdev_init_gpio_in(DEVICE(cpu), loongarch_cpu_set_irq, N_IRQS);
+    timer_init_ns(&cpu->timer, QEMU_CLOCK_VIRTUAL,
+                  &loongarch_constant_timer_cb, cpu);
 }
 
 static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
index 435cc75999..04e15ba1e3 100644
--- a/target/loongarch/meson.build
+++ b/target/loongarch/meson.build
@@ -18,6 +18,7 @@ loongarch_softmmu_ss = ss.source_set()
 loongarch_softmmu_ss.add(files(
   'machine.c',
   'tlb_helper.c',
+  'constant_timer.c',
 ))
 
 loongarch_ss.add_all(when: 'CONFIG_TCG', if_true: [loongarch_tcg_ss])
-- 
2.34.1


