Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A055128A10F
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Oct 2020 19:37:14 +0200 (CEST)
Received: from localhost ([::1]:59378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRInx-0003yU-6w
	for lists+qemu-devel@lfdr.de; Sat, 10 Oct 2020 13:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRIdi-0000dg-P5
 for qemu-devel@nongnu.org; Sat, 10 Oct 2020 13:26:40 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:34189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRIdf-0003rd-QQ
 for qemu-devel@nongnu.org; Sat, 10 Oct 2020 13:26:37 -0400
Received: by mail-wr1-x444.google.com with SMTP id i1so7554807wro.1
 for <qemu-devel@nongnu.org>; Sat, 10 Oct 2020 10:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i1cGbjc5Cl94JMQEfZlvF0v5MlNUEPZb+r7dtqjcBUs=;
 b=SKKtqH7MaIjmjoZzCPXDhMH+IUc5IO5PRCMeH50ranrtbo6BJnubq9H2E2oyTpPaNT
 hOajyPLpYYN/WZhtEkNIKPwVmsFbiooWU76zV1b1l31SoSNsCi1ALQhfGn3LUaX6+LIC
 zoXr388r31tGNsdoLot1pv96jY7XoPWLqFO0E6yqKC8M3+W/GYPXLTpru3RwifLuQ/X+
 om3FkmjeGzQ+k+0zQAR7Lg1ZOCugMM38x/XMQhjgHeOkifPY0gg5e6XfuDkfLFIjvset
 a+mIiun4Abr/RhP+hD6HekM+YjpdUS5ojhih4QYhtWdiP6pmqaEyhITTQ74IlPhPouUN
 ZMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=i1cGbjc5Cl94JMQEfZlvF0v5MlNUEPZb+r7dtqjcBUs=;
 b=TmCED+fHDue9M0rjpuHSPQPuUTLokB2zirK1hb0GHBsNW9VPcX5xE68q+EkgqWHB64
 6iQLgTuUJbsc0WP4hacqTpk3+Rxad4f8TxUR45cOyD9TVvx8cPHHjr40Wg9wJs0retht
 dYYz0wJIVXo0WeKJ9needprv11NhXCgV/5ZRBbJV+1DEXsUMTnrk+TfhOXEq/C1iAvLr
 JOa95Mbnfysqqpkrx9o8JfsKTpuloBEvowZubaLJYUZDQq+8QdZxv+Q1UumCzAswgwYw
 q4HRl+ZgQblI5+yRPJkRpZDeQiYJH2L7dZCwF0JmcXKXopS0dD+taeEpmdw1ncpVD/1d
 IjEg==
X-Gm-Message-State: AOAM533SZrZiWkuIoT1eHavjCIcxlWQTATLGK8HZLQA0nIVEZ/HSQzE5
 xajr9NHCHvqEtoC19wAyyNtlxXSV9NU=
X-Google-Smtp-Source: ABdhPJzAbaZ6zR9VIiJSLmay4Mk9SWsp+Y/6KB/Vzfw+vEooVmyzOYESI8DDN0ySMYrtB2zV3H3ulA==
X-Received: by 2002:a5d:63c3:: with SMTP id c3mr20630624wrw.315.1602350794356; 
 Sat, 10 Oct 2020 10:26:34 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id i11sm16786068wre.32.2020.10.10.10.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2020 10:26:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/20] target/mips/cpu: Make cp0_count_rate a property
Date: Sat, 10 Oct 2020 19:26:07 +0200
Message-Id: <20201010172617.3079633-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201010172617.3079633-1-f4bug@amsat.org>
References: <20201010172617.3079633-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Huacai Chen <zltjiangshi@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Luc Michel <luc@lmichel.fr>,
 Paul Burton <paulburton@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since not all CPU implementations use a cores use a CP0 timer
at half the frequency of the CPU, make this variable a property.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.h |  9 +++++++++
 target/mips/cpu.c | 19 +++++++++++--------
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 085a88e9550..baeceb892ef 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1151,6 +1151,7 @@ struct CPUMIPSState {
 /**
  * MIPSCPU:
  * @env: #CPUMIPSState
+ * @cp0_count_rate: rate at which the coprocessor 0 counter increments
  *
  * A MIPS CPU.
  */
@@ -1161,6 +1162,14 @@ struct MIPSCPU {
 
     CPUNegativeOffsetState neg;
     CPUMIPSState env;
+    /*
+     * The Count register acts as a timer, incrementing at a constant rate,
+     * whether or not an instruction is executed, retired, or any forward
+     * progress is made through the pipeline. The rate at which the counter
+     * increments is implementation dependent, and is a function of the
+     * pipeline clock of the processor, not the issue width of the processor.
+     */
+    unsigned cp0_count_rate;
 };
 
 
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 46188139b7b..461edfe22b7 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -26,7 +26,7 @@
 #include "qemu/module.h"
 #include "sysemu/kvm.h"
 #include "exec/exec-all.h"
-
+#include "hw/qdev-properties.h"
 
 static void mips_cpu_set_pc(CPUState *cs, vaddr value)
 {
@@ -135,12 +135,7 @@ static void mips_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 }
 
 /*
- * Since commit 6af0bf9c7c3 this model assumes a CPU clocked at 200MHz
- * and a CP0 timer running at half the clock of the CPU (cp0_count_rate = 2).
- *
- * TIMER_FREQ_HZ = CPU_FREQ_HZ / CP0_COUNT_RATE = 200 MHz / 2 = 100 MHz
- *
- * TIMER_PERIOD_NS = 1 / TIMER_FREQ_HZ = 10 ns
+ * Since commit 6af0bf9c7c3 this model assumes a CPU clocked at 200MHz.
  */
 #define CPU_FREQ_HZ_DEFAULT     200000000
 #define CP0_COUNT_RATE_DEFAULT  2
@@ -149,7 +144,7 @@ static void mips_cp0_period_set(MIPSCPU *cpu)
 {
     CPUMIPSState *env = &cpu->env;
 
-    env->cp0_count_ns = muldiv64(NANOSECONDS_PER_SECOND, CP0_COUNT_RATE_DEFAULT,
+    env->cp0_count_ns = muldiv64(NANOSECONDS_PER_SECOND, cpu->cp0_count_rate,
                                  CPU_FREQ_HZ_DEFAULT);
 }
 
@@ -202,6 +197,13 @@ static ObjectClass *mips_cpu_class_by_name(const char *cpu_model)
     return oc;
 }
 
+static Property mips_cpu_properties[] = {
+    /* CP0 timer running at half the clock of the CPU */
+    DEFINE_PROP_UINT32("cp0-count-rate", MIPSCPU, cp0_count_rate,
+                       CP0_COUNT_RATE_DEFAULT),
+    DEFINE_PROP_END_OF_LIST()
+};
+
 static void mips_cpu_class_init(ObjectClass *c, void *data)
 {
     MIPSCPUClass *mcc = MIPS_CPU_CLASS(c);
@@ -211,6 +213,7 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_parent_realize(dc, mips_cpu_realizefn,
                                     &mcc->parent_realize);
     device_class_set_parent_reset(dc, mips_cpu_reset, &mcc->parent_reset);
+    device_class_set_props(dc, mips_cpu_properties);
 
     cc->class_by_name = mips_cpu_class_by_name;
     cc->has_work = mips_cpu_has_work;
-- 
2.26.2


