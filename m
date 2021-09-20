Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754664117BA
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 17:02:22 +0200 (CEST)
Received: from localhost ([::1]:50270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKoH-0004Ik-G4
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 11:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9c-0002nT-RT
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:20 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9I-0000pu-Kc
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:20 -0400
Received: by mail-wr1-x435.google.com with SMTP id t8so23197924wri.1
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=UiwiA603nWlgf1SmpbSjqbdxK6T+RHOk6JCg+fRl4t8=;
 b=tuQ+Tfvmdg6pubiqtymWDa3UyeVrWM41RvspyHwcOvC57QCIJZ8vghuINSro5aXS1l
 5iDo7lJKT9zWISVrgOCcZSRr07+63vzQxeNd8dVXVxyHaFyg9oMKigMeTn7CfPcQCWJf
 MsQWiy59lmwI6zBtaGCxmZDLqAzhFc602gBMm+dDQbHdIWXjOvty1HBJffoSxY8qy2o+
 I7lyxV/0978Fvyjk04hXn7gjH4CSjSNHLgrUyCOMMcoe4O0+bhb3+JDb155SHpkvXDpW
 iXWWbhCt+rdmBx0Ww+zYaNT9MNoEsijijwT6bCDoVUx25Gah+5R8cA5MmI2asl21wtFU
 3kEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UiwiA603nWlgf1SmpbSjqbdxK6T+RHOk6JCg+fRl4t8=;
 b=J18YM6Il3c95v/o4qwtISMcn/3JbW94nqNFBAcdseeaBIgtz10EC2/hQT9AgitLock
 cHRho6yRtI8IWu75zh+w+1LKKiv0qnEfRrNYVhf6OrStYlOZh7O2POebBz0ZfBtyVhwz
 UxWeNRCaVrjwgqYctwGde+Ku+ePhY5K7QdidAaX6irw7joEOIuRTSn6M2ecyMDTqB+T1
 /7zwNjMj0vR3+cwMVxzdKEy2SKr8t41OEGoZKQolbYFDEXb0/wcG+pKI6nyIIaz1UFkj
 MdSvguPJmyU3LlPIhdF+KydYiDVrWMl957EJLL+KDBL9dpWwqZUp+unxxekVwF9heuEf
 +jlw==
X-Gm-Message-State: AOAM531JYWhCkWNsmqgZBd6tY3aZmgLwOcS5IfbNfXHP0THhAHm42TR1
 PkOTO3XUhhouHCU0H0U/zKGuvnwMGAXBWA==
X-Google-Smtp-Source: ABdhPJxjYDIukpBmoF1L5XuAWl0nqbok5DLFxDaA6GwHQ2jS2D7kJKM5pUYaAmWgKfbGcr5X5qhUzA==
X-Received: by 2002:a05:600c:1910:: with SMTP id
 j16mr29872607wmq.11.1632147598231; 
 Mon, 20 Sep 2021 07:19:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n17sm16229693wrp.17.2021.09.20.07.19.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:19:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/27] arm/hvf: Add a WFI handler
Date: Mon, 20 Sep 2021 15:19:31 +0100
Message-Id: <20210920141947.5537-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920141947.5537-1-peter.maydell@linaro.org>
References: <20210920141947.5537-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Collingbourne <pcc@google.com>

Sleep on WFI until the VTIMER is due but allow ourselves to be woken
up on IPI.

In this implementation IPI is blocked on the CPU thread at startup and
pselect() is used to atomically unblock the signal and begin sleeping.
The signal is sent unconditionally so there's no need to worry about
races between actually sleeping and the "we think we're sleeping"
state. It may lead to an extra wakeup but that's better than missing
it entirely.

Signed-off-by: Peter Collingbourne <pcc@google.com>
Signed-off-by: Alexander Graf <agraf@csgraf.de>
Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Message-id: 20210916155404.86958-6-agraf@csgraf.de
[agraf: Remove unused 'set' variable, always advance PC on WFX trap,
        support vm stop / continue operations and cntv offsets]
Signed-off-by: Alexander Graf <agraf@csgraf.de>
Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/sysemu/hvf_int.h  |  1 +
 accel/hvf/hvf-accel-ops.c |  5 +--
 target/arm/hvf/hvf.c      | 79 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 82 insertions(+), 3 deletions(-)

diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index 7c245c7b111..6545f7cd613 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -52,6 +52,7 @@ struct hvf_vcpu_state {
     uint64_t fd;
     void *exit;
     bool vtimer_masked;
+    sigset_t unblock_ipi_mask;
 };
 
 void assert_hvf_ok(hv_return_t ret);
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 4f75927a8ef..93976f4ecea 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -370,15 +370,14 @@ static int hvf_init_vcpu(CPUState *cpu)
     cpu->hvf = g_malloc0(sizeof(*cpu->hvf));
 
     /* init cpu signals */
-    sigset_t set;
     struct sigaction sigact;
 
     memset(&sigact, 0, sizeof(sigact));
     sigact.sa_handler = dummy_signal;
     sigaction(SIG_IPI, &sigact, NULL);
 
-    pthread_sigmask(SIG_BLOCK, NULL, &set);
-    sigdelset(&set, SIG_IPI);
+    pthread_sigmask(SIG_BLOCK, NULL, &cpu->hvf->unblock_ipi_mask);
+    sigdelset(&cpu->hvf->unblock_ipi_mask, SIG_IPI);
 
 #ifdef __aarch64__
     r = hv_vcpu_create(&cpu->hvf->fd, (hv_vcpu_exit_t **)&cpu->hvf->exit, NULL);
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index f3b4023030a..110a9d547d8 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2,6 +2,7 @@
  * QEMU Hypervisor.framework support for Apple Silicon
 
  * Copyright 2020 Alexander Graf <agraf@csgraf.de>
+ * Copyright 2020 Google LLC
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
@@ -490,6 +491,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 
 void hvf_kick_vcpu_thread(CPUState *cpu)
 {
+    cpus_kick_thread(cpu);
     hv_vcpus_exit(&cpu->hvf->fd, 1);
 }
 
@@ -608,6 +610,80 @@ static uint64_t hvf_vtimer_val_raw(void)
     return mach_absolute_time() - hvf_state->vtimer_offset;
 }
 
+static uint64_t hvf_vtimer_val(void)
+{
+    if (!runstate_is_running()) {
+        /* VM is paused, the vtimer value is in vtimer.vtimer_val */
+        return vtimer.vtimer_val;
+    }
+
+    return hvf_vtimer_val_raw();
+}
+
+static void hvf_wait_for_ipi(CPUState *cpu, struct timespec *ts)
+{
+    /*
+     * Use pselect to sleep so that other threads can IPI us while we're
+     * sleeping.
+     */
+    qatomic_mb_set(&cpu->thread_kicked, false);
+    qemu_mutex_unlock_iothread();
+    pselect(0, 0, 0, 0, ts, &cpu->hvf->unblock_ipi_mask);
+    qemu_mutex_lock_iothread();
+}
+
+static void hvf_wfi(CPUState *cpu)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    struct timespec ts;
+    hv_return_t r;
+    uint64_t ctl;
+    uint64_t cval;
+    int64_t ticks_to_sleep;
+    uint64_t seconds;
+    uint64_t nanos;
+    uint32_t cntfrq;
+
+    if (cpu->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ)) {
+        /* Interrupt pending, no need to wait */
+        return;
+    }
+
+    r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CTL_EL0, &ctl);
+    assert_hvf_ok(r);
+
+    if (!(ctl & 1) || (ctl & 2)) {
+        /* Timer disabled or masked, just wait for an IPI. */
+        hvf_wait_for_ipi(cpu, NULL);
+        return;
+    }
+
+    r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CVAL_EL0, &cval);
+    assert_hvf_ok(r);
+
+    ticks_to_sleep = cval - hvf_vtimer_val();
+    if (ticks_to_sleep < 0) {
+        return;
+    }
+
+    cntfrq = gt_cntfrq_period_ns(arm_cpu);
+    seconds = muldiv64(ticks_to_sleep, cntfrq, NANOSECONDS_PER_SECOND);
+    ticks_to_sleep -= muldiv64(seconds, NANOSECONDS_PER_SECOND, cntfrq);
+    nanos = ticks_to_sleep * cntfrq;
+
+    /*
+     * Don't sleep for less than the time a context switch would take,
+     * so that we can satisfy fast timer requests on the same CPU.
+     * Measurements on M1 show the sweet spot to be ~2ms.
+     */
+    if (!seconds && nanos < (2 * SCALE_MS)) {
+        return;
+    }
+
+    ts = (struct timespec) { seconds, nanos };
+    hvf_wait_for_ipi(cpu, &ts);
+}
+
 static void hvf_sync_vtimer(CPUState *cpu)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
@@ -728,6 +804,9 @@ int hvf_vcpu_exec(CPUState *cpu)
     }
     case EC_WFX_TRAP:
         advance_pc = true;
+        if (!(syndrome & WFX_IS_WFE)) {
+            hvf_wfi(cpu);
+        }
         break;
     case EC_AA64_HVC:
         cpu_synchronize_state(cpu);
-- 
2.20.1


