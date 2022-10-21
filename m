Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86231607EB6
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 21:09:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1olxLZ-0002Qd-Db; Fri, 21 Oct 2022 15:06:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oluyQ-0000d8-EL
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 12:34:18 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oluyM-0003av-1N
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 12:34:15 -0400
Received: by mail-wr1-x42c.google.com with SMTP id f11so5372487wrm.6
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 09:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0eaOA0Mqr3aYi2uDLHNW9A4jpgOCivFc5XmGZui78Jc=;
 b=Oyb4RVs+AS4PTnRpalfbULmYl8Uegg18jfdPHTL77UNCAnlmO6i3bowIqEvMXr6QOh
 04hi67oet0NWpJCeUOebuB63ICIonnSt2jniDJIL1mSQ8Wsj4ckcgnvu9bDIiGznL4X6
 jNaWcv4qTHo4SiinZsBbjehPsOwEo9KZbD28nr4lWwyYLrnnsQEzyonofNPAhtRUInJs
 0Pn7SyPUh9JAmUyjj21rE0DsNMYm5yedgqPDh900BAYtuQfqAMVXsBTAjfcamcUemPt+
 APiCW+jItflg3wFhNX9ogXhjS1tPil05/SXkS4hZXszywSD1jFrcaS/RIpF3AZN9MP4b
 APsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0eaOA0Mqr3aYi2uDLHNW9A4jpgOCivFc5XmGZui78Jc=;
 b=HYqT6dxwZZehqrFVGIAXtAVjNmDSnZOYgpsJYwRJO9LqGQwqxxf5eIOMZzGUSd1uiO
 S5hz7v/7rfBddXWIkvxNFGJ1ciTqsladE2EDbKEYCPTk/U8GY4fYWp3WbgFuY4t5544G
 xEzJvOvyruJ+TFI5j/r30SRAFe2NXMiivL/UuGqTflx/zanbF9nu18RzF9j8GoOzlNVT
 d1exDJHhK/t2Brhws1Ob5duYQgwYSuMmkH3eDQ1Qe0qv/tKQdDRJExc7i3dSBDjzYJDR
 uHE3A4QpSQ3LEXXeLDQJ8NZ8rhcQv+iLzvFyAJFXNIlaejNK0ZPAPSSl59ceJkwvvQTm
 53gA==
X-Gm-Message-State: ACrzQf13k5ixGlZPKMECK8ANNyoP//q8YnE26sgBnoyUK9sHmA8YBVBB
 r9bwhbBEv3nhay5FtBStJRYzP6AMckHmjA==
X-Google-Smtp-Source: AMsMyM41MDFPCUg4zfZfTSoKQoFHgTo2gHUUXGUuO59IFfCNPb7lcQqomaGZyMt81fn2KPQKf/JD2g==
X-Received: by 2002:a5d:64ab:0:b0:231:44c1:32b0 with SMTP id
 m11-20020a5d64ab000000b0023144c132b0mr13029089wrp.255.1666370052077; 
 Fri, 21 Oct 2022 09:34:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a05600012cf00b002365b759b65sm100173wrx.86.2022.10.21.09.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 09:34:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-stable@nongnu.org, Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH] Revert "accel/tcg: Init TCG cflags in vCPU thread handler"
Date: Fri, 21 Oct 2022 17:34:09 +0100
Message-Id: <20221021163409.3674911-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Commit a82fd5a4ec24d was intended to be a code cleanup, but
unfortunately it has a bug. It moves the initialization of the
TCG cflags from the "start a new vcpu" function to the
thread handler; this is fine when each vcpu has its own thread,
but when we are doing round-robin of vcpus on a single thread
we end up only initializing the cflags for CPU 0, not for any
of the others.

The most obvious effect of this bug is that running in icount
mode with more than one CPU is broken; typically the guest
hangs shortly after it brings up the secondary CPUs.

This reverts commit a82fd5a4ec24d923ff1e6da128c0fd4a74079d99.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 accel/tcg/tcg-accel-ops-mttcg.c | 5 +++--
 accel/tcg/tcg-accel-ops-rr.c    | 7 ++++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/accel/tcg/tcg-accel-ops-mttcg.c b/accel/tcg/tcg-accel-ops-mttcg.c
index ba997f6cfe4..d50239e0e28 100644
--- a/accel/tcg/tcg-accel-ops-mttcg.c
+++ b/accel/tcg/tcg-accel-ops-mttcg.c
@@ -70,8 +70,6 @@ static void *mttcg_cpu_thread_fn(void *arg)
     assert(tcg_enabled());
     g_assert(!icount_enabled());
 
-    tcg_cpu_init_cflags(cpu, current_machine->smp.max_cpus > 1);
-
     rcu_register_thread();
     force_rcu.notifier.notify = mttcg_force_rcu;
     force_rcu.cpu = cpu;
@@ -141,6 +139,9 @@ void mttcg_start_vcpu_thread(CPUState *cpu)
 {
     char thread_name[VCPU_THREAD_NAME_SIZE];
 
+    g_assert(tcg_enabled());
+    tcg_cpu_init_cflags(cpu, current_machine->smp.max_cpus > 1);
+
     cpu->thread = g_new0(QemuThread, 1);
     cpu->halt_cond = g_malloc0(sizeof(QemuCond));
     qemu_cond_init(cpu->halt_cond);
diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index cc8adc23802..1a72149f0e4 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -152,9 +152,7 @@ static void *rr_cpu_thread_fn(void *arg)
     Notifier force_rcu;
     CPUState *cpu = arg;
 
-    g_assert(tcg_enabled());
-    tcg_cpu_init_cflags(cpu, false);
-
+    assert(tcg_enabled());
     rcu_register_thread();
     force_rcu.notify = rr_force_rcu;
     rcu_add_force_rcu_notifier(&force_rcu);
@@ -277,6 +275,9 @@ void rr_start_vcpu_thread(CPUState *cpu)
     static QemuCond *single_tcg_halt_cond;
     static QemuThread *single_tcg_cpu_thread;
 
+    g_assert(tcg_enabled());
+    tcg_cpu_init_cflags(cpu, false);
+
     if (!single_tcg_cpu_thread) {
         cpu->thread = g_new0(QemuThread, 1);
         cpu->halt_cond = g_new0(QemuCond, 1);
-- 
2.25.1


