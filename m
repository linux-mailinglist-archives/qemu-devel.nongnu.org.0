Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D60B55F6AFC
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 17:47:01 +0200 (CEST)
Received: from localhost ([::1]:58096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogT5Q-0005Qc-U9
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 11:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSXi-0003YC-32
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:12:10 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:46599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSXg-0004ak-Db
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:12:09 -0400
Received: by mail-pl1-x635.google.com with SMTP id l1so1946283pld.13
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jlh3NcGL14udoTSs2qKNoQECkhWg9Im/R612Y2w5/+E=;
 b=FN52SnVoXtMFI80iWqxxxMETAmZewY1k7wLV1ETouCaq7xkE2AxVa/oBHy9mrrj00q
 MH6Q0ucrdWbI3AtwJOhWx51yJ8/MnIO9rkM0dG/V8PruVmCQJ4jypJWS7HfvFoRFgHaQ
 GKOTNkRyg7FuR7FJ/wHAxFUsYGyJAst+iH0p/rAn3hyECIlC9vh24BF/ZG5TtQfSUMMv
 vc2pWjYcNbDQUlH6dIP+QqOeouLKYPfFi4HZXKxtsI3N7czi/Boa0uy36EjPqZKSeYK0
 nvbNYbUb9w6TWFTt9Mc67ekViA6v4gsl1lH7eR5a5PjmELw7k3MPjczMThiOlghhDvdF
 DlvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jlh3NcGL14udoTSs2qKNoQECkhWg9Im/R612Y2w5/+E=;
 b=slfiv9vd20d9gcxTEteX2IPdPYe/68727VNH12aNP6oUG1XWO0bkLL2Z4EErkzHeSC
 TlhT3EzNpod/b8RZhth4QuNyGagTwUOLCZ4fJ5SRPrud6vz7xKxC2k6q7INHs+jHVX6D
 2/YqZBr1rfQKw9g2Lk28iVPc8e8zdOhXSM6EC4VXEoeMak2ioT47QmR2jvphOk0R085W
 1nYS6xKru53utLVL2Ea1i8HdFWXwdPwLAZJLzs6x9nDGVbrB0BFTVwV8ntg5eKggX3xB
 kPgNq5vKp6ODg1CZFfIzZSiRfPHgahXiWyx0DKdHTJaEAvPBFkEVkwDgWCa7xjYORHEY
 yqUw==
X-Gm-Message-State: ACrzQf3IfAL2NVxWkrh0BWQIOJ2OOf89mUUYt9fLWJKT84kQB1UMRDxy
 4J+/rHQ9PxIVEuQQdTify/gjLzz2kQ0=
X-Google-Smtp-Source: AMsMyM7qoXz2uzSxWmqHeQj6GD0psf/OLcIGduXFONDf8P6SGYNgDvVrSdDAs84tC25sbJ5sU/pLKg==
X-Received: by 2002:a17:90b:3890:b0:20a:9ab0:6fa2 with SMTP id
 mu16-20020a17090b389000b0020a9ab06fa2mr11296238pjb.49.1665069126816; 
 Thu, 06 Oct 2022 08:12:06 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 135-20020a62148d000000b00540c8ed61ddsm8589067pfu.150.2022.10.06.08.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:12:06 -0700 (PDT)
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
Subject: [PATCH 08/18] accel/qtest: Support qtest accelerator for Windows
Date: Thu,  6 Oct 2022 23:11:25 +0800
Message-Id: <20221006151135.2078908-9-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151135.2078908-1-bmeng.cn@gmail.com>
References: <20221006151135.2078908-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x635.google.com
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


