Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D41360D932
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:20:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVtM-0004dU-O7; Tue, 25 Oct 2022 22:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVtJ-0004ZL-Gg
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:11:37 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVtA-00010y-R4
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:11:34 -0400
Received: by mail-pf1-x431.google.com with SMTP id y13so9348991pfp.7
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0JYOu0qx3JmQq4x7McLpyb3kJqh6JTUS1pVf9/nHHO0=;
 b=ARaRD+18I8/Lz0AgLFMeefqlrvuy3f7RIENWwa0Nb8iYPcfEWfVLVFKLzg1McY7fuX
 pt+pS2tVg0iwMldpUOkkLz4BmULjmnHQh/IRbClkkBfCylUVbRhdVt1kuP5JfXJIfCeB
 IcV9MAdywYzJ273iDgquip2v867HEOl+Fb7uIna+OwCkkN9PlJ/vKAoGSbW+nhjFISLO
 8ShmDBdJ0JOkQ6DywQ2umxySiO369kjz/FUMF+OIGqZRL9C3bpMaq16DFTHyqobrlXS2
 Bw+RpW4rGNTa+o3l5qk5jih6Y7S+9/XYgyukrl1KAAkgg2glfCwsarlIoGurpExZGVnK
 HDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0JYOu0qx3JmQq4x7McLpyb3kJqh6JTUS1pVf9/nHHO0=;
 b=S84WMr2N944vkCrndNVLX9H9ZPnXiqt8V0VraCWplLAToHaF8dEF8JSk6ltqXPS1dT
 iDidWTKeNg4ZusEQwIN2dXxZRkmaN1fzvcMX1yg2gDUap6YMTtdfbCoTyHDud/sA1W3x
 T+KG1yKTVaTIs2E9hbDD1F3fwUCISzmKgcboSqQh39uCJ2yiDND+YNic8RuYgNFsZTuA
 lvwG2sMaUvfaY3/uaszlAau57neUc5pMU6syyA26oISRu2P8z3HkCpk+H+gEOyBj0SHZ
 vxtCcbGCLlGD/oYxrpFyFI3hGTfy/JrI4c4TJ41Ab9pjvThh3wNVQC/bXqFH81SPjHUt
 zPxg==
X-Gm-Message-State: ACrzQf3qQu1X5hEtfVYgFnWE27sG1/s55qC4PBeud988cFuGd4maUDca
 ioeudyXP680gJwoSL2hwRsXmtlbd5D5hFADp
X-Google-Smtp-Source: AMsMyM5fn4//u03MaxE5mHF/0J3z4gFBSLF/6uaBnqwygsvxlLwz/rQOjRIRP7Ynu+NcRS3CWPxlBg==
X-Received: by 2002:a63:2b4b:0:b0:46e:9363:d969 with SMTP id
 r72-20020a632b4b000000b0046e9363d969mr26636010pgr.168.1666750286726; 
 Tue, 25 Oct 2022 19:11:26 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:11:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 qemu-stable@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 01/47] Revert "accel/tcg: Init TCG cflags in vCPU thread
 handler"
Date: Wed, 26 Oct 2022 12:10:30 +1000
Message-Id: <20221026021116.1988449-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Peter Maydell <peter.maydell@linaro.org>

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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20221021163409.3674911-1-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-accel-ops-mttcg.c | 5 +++--
 accel/tcg/tcg-accel-ops-rr.c    | 7 ++++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/accel/tcg/tcg-accel-ops-mttcg.c b/accel/tcg/tcg-accel-ops-mttcg.c
index ba997f6cfe..d50239e0e2 100644
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
index cc8adc2380..1a72149f0e 100644
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
2.34.1


