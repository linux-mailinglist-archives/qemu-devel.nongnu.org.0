Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4945F6B39
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 18:07:21 +0200 (CEST)
Received: from localhost ([::1]:40776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogTP6-0000aQ-F1
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 12:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSfI-0004Lf-3d
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:20:01 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:44890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSfG-00060D-Aj
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:19:59 -0400
Received: by mail-pl1-x629.google.com with SMTP id x6so1974179pll.11
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jlh3NcGL14udoTSs2qKNoQECkhWg9Im/R612Y2w5/+E=;
 b=LCaIrLBQ/MkpjTV9vPwh+zwVPpgdb/te0KWh0l8qC+k9xstfG8+gUgCsdxh4+OoGQC
 c83Qb3aIgxHB/y7tAwy1tZmzHrBr20OppPqVOXmjNKzz47dxzMlVCuzVRxBeBxGZXjtP
 psdpcKK7V63FhNU6sV90M2G8PHe/eXjJPfWpdyyj+VVZvcpfhfBU4nXA31wXN79Vgai8
 iJ7cajA3WRP3aGn+srhOV7bWIOnkPL7rE5MN0w3mB2LD73pzv8aSs5DaaR4097XrUElS
 m7nG2zZV+PE3OtLH6uLNo4iHJx0wywSen+Z3mpGlz2cV83V9lIFQ6FFyCOgj2QtQ6RxB
 MRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jlh3NcGL14udoTSs2qKNoQECkhWg9Im/R612Y2w5/+E=;
 b=XCnM8Vw8bW/odd+QETO5b96cTELEV5nb+CvkXpqcW4c6SvqgHppg58zcLcL40yI4aW
 Qxt2UUBlTIm5HlFqWgLyWqfUjA51FDEbdLmtsD7JdPv8C1MH+mw09GaUs9iwSqRPigvg
 Svh/v9uNek0LkFeljd091FBvAsuzlkLnHoujgKBNYq7llr3yxOis/JyalLiNytj4rv1g
 metv6P3eTHB5wRMwIyimYavx/oD5/RinCZIooyoinVtqa6oJU0eUZUo88BKacC7mIVGJ
 vn0pteCX5ikpitXWh3QUuvwUNL5x9iMLAUmW7fbw/4VB4fIODAcsQUtY1wQd9euWV+tM
 O0OQ==
X-Gm-Message-State: ACrzQf3wdJP5Uwboeq8osyGv7yDnNfJlVvcJtNL4sH12lD8sX0MQ/gzT
 7oYRkOnAOZ3BPOQfeTgxdWs0wcavKDQ=
X-Google-Smtp-Source: AMsMyM6j6AZtxfnMhiXgxT7SGHCOAPvjb7+c2Y0yOhojQCRBfKw9Cwr6LxBfsoR6eNKXIw+MxVsw2w==
X-Received: by 2002:a17:903:2616:b0:17f:8042:723a with SMTP id
 jd22-20020a170903261600b0017f8042723amr64788plb.106.1665069596657; 
 Thu, 06 Oct 2022 08:19:56 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a170902780d00b0017c37a5a2fdsm11426759pll.216.2022.10.06.08.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:19:56 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, Eduardo Habkost <eduardo@habkost.net>,
 Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v5 08/18] accel/qtest: Support qtest accelerator for Windows
Date: Thu,  6 Oct 2022 23:19:17 +0800
Message-Id: <20221006151927.2079583-9-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151927.2079583-1-bmeng.cn@gmail.com>
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

Currently signal SIGIPI [=SIGUSR1] is used to kick the dummy CPU
when qtest accelerator is used. However SIGUSR1 is unsupported on
Windows. To support Windows, we add a QemuSemaphore CPUState::sem
to kick the dummy CPU instead for Windows.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

Changes in v5:
- restore to v1 version which does not touch the posix implementation

 include/hw/core/cpu.h   |  1 +
 accel/dummy-cpus.c      | 14 ++++++++++++--
 softmmu/cpus.c          |  9 +++++----
 accel/meson.build       |  1 +
 accel/qtest/meson.build |  1 +
 5 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index f9b58773f7..8830546121 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -333,6 +333,7 @@ struct CPUState {
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
index 61b27ff59d..9dd1a4dc17 100644
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


