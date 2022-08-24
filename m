Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4FD59F7EB
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:38:47 +0200 (CEST)
Received: from localhost ([::1]:56832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQnmY-0007b7-Dp
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmuD-0003iy-9A
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:37 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:35402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmuB-0001aF-H0
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:36 -0400
Received: by mail-pg1-x535.google.com with SMTP id r69so14557081pgr.2
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=hdtxjLMnNVU1rKYleO313NZ7D82NDLkpXwsAYvVj3S0=;
 b=mVqbC3O/frS8lRjN7/wJv4EuqSVn9CFQWeOfEI9WVWNXIfCBXkaj/gllYvuDo4l2iH
 d8Ocp0GW2jkwn7Lseoy9DAfZsR/2dcIcAJ3qZEB0kyQez0yOyd/7voACySdajC/JGpni
 gAbCB364XJ/zB9K934O590g7FYSFrhkqsut0zkp/iJU13wFGzO79IdyLpyc0oovcBn/G
 E+WQWYAbefRm8Qc6INVRtf6lnldEwiFyLEu6HAqYkS2kBlIX+pbB8gSUwvNAusNMYEhw
 Ngc3JOgag6sYiEUsUzJ0cGBM2IxUL//iECRECtSex0pLmZHcEDArwt7BpvTzkZTiXQR2
 8czQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=hdtxjLMnNVU1rKYleO313NZ7D82NDLkpXwsAYvVj3S0=;
 b=p6oaWPYYriCaWFhahn2eKyd3cRuWIXM4wZyBg5mgwodnD3e80h3bTwmc0TfAHXGvRn
 3y/jZvIFKKpxDlHwEzSeKZyjTAX6f0kO3o0/UvuKwx3PjefnMOaoSXZV6ho669PevkgI
 UfKkyDOm+H2trAk3PNRLt2ig0G+Om11yPNicu4TFOdnfATVcEQ0AAiywcTIpPijW6rY9
 XH9Y1LdLKWILRkO3g2cNYySWQr+cd94foWhZCit71UC7Qv2KAG0QcpkSc0WHZeTtJhMe
 ffEkH7s6BrkBPipYcJgGA6r8yjMoaICEdKVEBDdO7NoCgowwQQ24uvZ6p1LaVlbwQ4lG
 IUYg==
X-Gm-Message-State: ACgBeo1hyZKrNO2uxtphQ2esWH5dm1yDKDvAk8Zpw5WrBt8nuElF2EZm
 nIm2vvilAglANUcTVlWrc6OXHlTwKaY=
X-Google-Smtp-Source: AA6agR7lo9wbggC3jooao5yYq3psZ6ceOVwNBVBisI5RnYyxfZmwOBeHPZ6gzh1+RWKKLYxLsguefg==
X-Received: by 2002:a65:6d19:0:b0:42a:37d7:90da with SMTP id
 bf25-20020a656d19000000b0042a37d790damr20688393pgb.16.1661334153909; 
 Wed, 24 Aug 2022 02:42:33 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:42:33 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, Eduardo Habkost <eduardo@habkost.net>,
 Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH 23/51] accel/qtest: Support qtest accelerator for Windows
Date: Wed, 24 Aug 2022 17:40:01 +0800
Message-Id: <20220824094029.1634519-24-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

Currently signal SIGIPI [=SIGUSR1] is used to kick the dummy CPU
when qtest accelerator is used. However SIGUSR1 is unsupported on
Windows. To support Windows, we add a QemuSemaphore CPUState::sem
to kick the dummy CPU instead for Windows.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 include/hw/core/cpu.h   |  1 +
 accel/dummy-cpus.c      | 14 ++++++++++++--
 softmmu/cpus.c          |  9 +++++----
 accel/meson.build       |  1 +
 accel/qtest/meson.build |  1 +
 5 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 500503da13..c564108877 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -325,6 +325,7 @@ struct CPUState {
     struct QemuThread *thread;
 #ifdef _WIN32
     HANDLE hThread;
+    QemuSemaphore sem;
 #endif
     int thread_id;
     bool running, has_waiter;
diff --git a/accel/dummy-cpus.c b/accel/dummy-cpus.c
index 10429fdfb2..d6a1b8d0a2 100644
--- a/accel/dummy-cpus.c
+++ b/accel/dummy-cpus.c
@@ -21,8 +21,6 @@
 static void *dummy_cpu_thread_fn(void *arg)
 {
     CPUState *cpu = arg;
-    sigset_t waitset;
-    int r;
 
     rcu_register_thread();
 
@@ -32,8 +30,13 @@ static void *dummy_cpu_thread_fn(void *arg)
     cpu->can_do_io = 1;
     current_cpu = cpu;
 
+#ifndef _WIN32
+    sigset_t waitset;
+    int r;
+
     sigemptyset(&waitset);
     sigaddset(&waitset, SIG_IPI);
+#endif
 
     /* signal CPU creation */
     cpu_thread_signal_created(cpu);
@@ -41,6 +44,7 @@ static void *dummy_cpu_thread_fn(void *arg)
 
     do {
         qemu_mutex_unlock_iothread();
+#ifndef _WIN32
         do {
             int sig;
             r = sigwait(&waitset, &sig);
@@ -49,6 +53,9 @@ static void *dummy_cpu_thread_fn(void *arg)
             perror("sigwait");
             exit(1);
         }
+#else
+        qemu_sem_wait(&cpu->sem);
+#endif
         qemu_mutex_lock_iothread();
         qemu_wait_io_event(cpu);
     } while (!cpu->unplug);
@@ -69,4 +76,7 @@ void dummy_start_vcpu_thread(CPUState *cpu)
              cpu->cpu_index);
     qemu_thread_create(cpu->thread, thread_name, dummy_cpu_thread_fn, cpu,
                        QEMU_THREAD_JOINABLE);
+#ifdef _WIN32
+    qemu_sem_init(&cpu->sem, 0);
+#endif
 }
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 23b30484b2..fd10db927a 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -437,18 +437,19 @@ void qemu_wait_io_event(CPUState *cpu)
 
 void cpus_kick_thread(CPUState *cpu)
 {
-#ifndef _WIN32
-    int err;
-
     if (cpu->thread_kicked) {
         return;
     }
     cpu->thread_kicked = true;
-    err = pthread_kill(cpu->thread->thread, SIG_IPI);
+
+#ifndef _WIN32
+    int err = pthread_kill(cpu->thread->thread, SIG_IPI);
     if (err && err != ESRCH) {
         fprintf(stderr, "qemu:%s: %s", __func__, strerror(err));
         exit(1);
     }
+#else
+    qemu_sem_post(&cpu->sem);
 #endif
 }
 
diff --git a/accel/meson.build b/accel/meson.build
index b9a963cf80..b21c85dc0a 100644
--- a/accel/meson.build
+++ b/accel/meson.build
@@ -17,4 +17,5 @@ dummy_ss.add(files(
 ))
 
 specific_ss.add_all(when: ['CONFIG_SOFTMMU', 'CONFIG_POSIX'], if_true: dummy_ss)
+specific_ss.add_all(when: ['CONFIG_WIN32'], if_true: dummy_ss)
 specific_ss.add_all(when: ['CONFIG_XEN'], if_true: dummy_ss)
diff --git a/accel/qtest/meson.build b/accel/qtest/meson.build
index 4c65600293..a4876fc0f2 100644
--- a/accel/qtest/meson.build
+++ b/accel/qtest/meson.build
@@ -1,2 +1,3 @@
 qtest_module_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_POSIX'],
                     if_true: files('qtest.c'))
+qtest_module_ss.add(when: ['CONFIG_WIN32'], if_true: files('qtest.c'))
-- 
2.34.1


