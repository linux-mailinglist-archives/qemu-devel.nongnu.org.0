Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4724228B1F7
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 12:07:31 +0200 (CEST)
Received: from localhost ([::1]:49494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRujo-0001IQ-PT
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 06:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRubd-0000vb-Qx
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 05:59:02 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:37053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRubb-0002qH-Eq
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 05:59:01 -0400
Received: by mail-wr1-x443.google.com with SMTP id h7so18473570wre.4
 for <qemu-devel@nongnu.org>; Mon, 12 Oct 2020 02:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i1cGbjc5Cl94JMQEfZlvF0v5MlNUEPZb+r7dtqjcBUs=;
 b=mySgucuT+mIienoSK6h9h6BhwOCkdQESWURoe6cGQrndcSemCzwjGKbyVdbm/KoWk6
 xpAJUkWycjMVf3qebDnFF+eiUc+6GT6ryxNh25iaxDpR8aaNf58/lIItfahi6qM9nVFa
 YF3jigf/MVgj8vuC18QRcUHEwJkgKdc6+jAOtixGWyEIooYlVVx78h4dHeK2pw0KaDe5
 QaIUuFu38qCGC8Ll2t4FwppVyitlAJwvAbonSg1zfVzsSDqe5eyrcHsfPZ2opg4IMqG2
 7EPgSqkDcUEkcBEVfKV/ocYRNRJic/clt4kbTVfEg4oPU79YtSaAW80aFv2elqEuJ+Cq
 HBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=i1cGbjc5Cl94JMQEfZlvF0v5MlNUEPZb+r7dtqjcBUs=;
 b=Rq0EEiB3XyPBPNCa5hk00kqQhU02k9rCjUUlojcuB6rKZhOLUuQsuFNa62scEO0KZP
 iDL8wYO16Zxttdda27my/w3tipJkXzxnnYaf41dpZV/TK7TlWTxO0OOJYZv0XY6lOaB1
 WWwznPeRhzsWF2nlhkvHJOFbNNM5Erbexats+U/1UgPNX4KRTvICvtvXF9rQ4daH3RrC
 3qh29WkSgbcrKrmUSlmkusquzBO8Wo3wQF+YQZT0u2mf3l1LF9yUPtBw8HKFkN9RASZD
 n8WkV3RXLPP+bbRi4xtOpp7IL22BAUD0RPFKwqco2+2fv3fSAPK9SDre450B64GCtQW4
 WaAA==
X-Gm-Message-State: AOAM530VIGI+vHLGrqs1JffUhSrTA6v6CJwqdJD9FWdDM42zcTlu59WW
 3IsOTG5PcpyVFAYsszCvflQwQs0VpPI=
X-Google-Smtp-Source: ABdhPJyWzxBwslLmWAk7f7s7LLJ4eM2dKIiWpY/UMEBltVrLsrGiuPSfmurlXoZnMuYeLGkGRA8LfQ==
X-Received: by 2002:adf:e78b:: with SMTP id n11mr30170491wrm.280.1602496737732; 
 Mon, 12 Oct 2020 02:58:57 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id c16sm25182785wrx.31.2020.10.12.02.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 02:58:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/21] target/mips/cpu: Make cp0_count_rate a property
Date: Mon, 12 Oct 2020 11:57:53 +0200
Message-Id: <20201012095804.3335117-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012095804.3335117-1-f4bug@amsat.org>
References: <20201012095804.3335117-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Huacai Chen <zltjiangshi@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Luc Michel <luc@lmichel.fr>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Burton <paulburton@kernel.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Huacai Chen <chenhc@lemote.com>, Paolo Bonzini <pbonzini@redhat.com>,
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


