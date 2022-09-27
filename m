Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7F35EC21E
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 14:10:33 +0200 (CEST)
Received: from localhost ([::1]:55186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od9Q0-0001mQ-Ue
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 08:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8Re-0003DA-09
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:13 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:35765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8Ra-00057G-JI
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:09 -0400
Received: by mail-pf1-x42a.google.com with SMTP id i6so5185180pfb.2
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=FodAt/+tlmeyr8mO0vp74otmvfdLkdpAkh8HSKQOwPY=;
 b=QGrNRpE8in4ec+vRl7yKsXY2h+i466qlHyDC0LRPE7vPjM7fOz3W1E8oey2/iQFBfl
 1SW3vmNmDFuM9tg0QNyUtItV7pQCMI6y+f5pSTOyN5zyYaJ+2+g9XZ2JR6rSU5y0hpE0
 c00Wy83wHg7VMlr8Tth4fYFAmxawYoNnZ58Fal4DM3Ry2PoOQ9qUT4AEyCdUeuKEzXdK
 bhyqsGqMUInSbtYCPZugxv5EqFusdViZuo56OJ4uLoBQJqIEpydu8cUqKN9gvR8XeiH9
 A4OeQ0u5G4gJCdp6K9Vth5xasgYPX5nB4eG+0nwEHS+991u7egvg7cOrA3K8QEFUC/su
 bG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=FodAt/+tlmeyr8mO0vp74otmvfdLkdpAkh8HSKQOwPY=;
 b=A8TVgEIoUwxZQ+HSZQvB5eKHpxqy6R3rmE5BiwUVLaE/pwMBAwplJ49fCqAev/PAyo
 wP5CArBTQ7PMkh/KlZp7lDiI6erywLUX5IMG+YKFhO2MoOzclR4htBodsH10HJHdopQr
 UhOioTNzS2ZT7eQ2MzpZX1wPw0Pq/McW11D/Ja4vAckDaBgmy0yNCoHQ+5MKMPhc0IlG
 VGd4TsTNNTkYY/Fmya8uyE1Cdg4QHHcdbUeio1/RBr9ED/t3gNL70aVjeBwpDdspmhB1
 bOfjoLGi+en8R+IIzcw5ratXdGZxA7Y22n2+2lDLId3Kc7jK4zAFw+j1K0CMmJ6j3TKO
 Yf0Q==
X-Gm-Message-State: ACrzQf3I2EB4Tyh7gaqVoSi7pLlQE6icMZw4yA/hO5OVCGR8k9W/ayUr
 PRjMyC5/O/Z+Vboi4McMWAcofkR9c74=
X-Google-Smtp-Source: AMsMyM4RSj59VU/nJaAYI021H8mL408buvNJpJlOICBuYL1A+q2tVsV/zuXHquA7D0bDVu1Hs4NQyg==
X-Received: by 2002:a05:6a00:3492:b0:540:b30d:8396 with SMTP id
 cp18-20020a056a00349200b00540b30d8396mr28804282pfb.81.1664276885059; 
 Tue, 27 Sep 2022 04:08:05 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:08:04 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, Eduardo Habkost <eduardo@habkost.net>,
 Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v4 31/54] accel/qtest: Implement a portable qtest accelerator
Date: Tue, 27 Sep 2022 19:06:09 +0800
Message-Id: <20220927110632.1973965-32-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42a.google.com
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
to kick the dummy CPU instead.

As a result of this, the POSIX implementation via signal is no
longer needed and can use the same path as Windows.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v2)

Changes in v2:
- Replace signal by the semaphore on posix too

 include/hw/core/cpu.h   |  1 +
 accel/dummy-cpus.c      | 15 ++-------------
 softmmu/cpus.c          | 10 +---------
 accel/meson.build       |  1 +
 accel/qtest/meson.build |  1 +
 5 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 500503da13..2f46c37dc1 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -326,6 +326,7 @@ struct CPUState {
 #ifdef _WIN32
     HANDLE hThread;
 #endif
+    QemuSemaphore sem;
     int thread_id;
     bool running, has_waiter;
     struct QemuCond *halt_cond;
diff --git a/accel/dummy-cpus.c b/accel/dummy-cpus.c
index 10429fdfb2..3769d3db0a 100644
--- a/accel/dummy-cpus.c
+++ b/accel/dummy-cpus.c
@@ -21,8 +21,6 @@
 static void *dummy_cpu_thread_fn(void *arg)
 {
     CPUState *cpu = arg;
-    sigset_t waitset;
-    int r;
 
     rcu_register_thread();
 
@@ -32,23 +30,13 @@ static void *dummy_cpu_thread_fn(void *arg)
     cpu->can_do_io = 1;
     current_cpu = cpu;
 
-    sigemptyset(&waitset);
-    sigaddset(&waitset, SIG_IPI);
-
     /* signal CPU creation */
     cpu_thread_signal_created(cpu);
     qemu_guest_random_seed_thread_part2(cpu->random_seed);
 
     do {
         qemu_mutex_unlock_iothread();
-        do {
-            int sig;
-            r = sigwait(&waitset, &sig);
-        } while (r == -1 && (errno == EAGAIN || errno == EINTR));
-        if (r == -1) {
-            perror("sigwait");
-            exit(1);
-        }
+        qemu_sem_wait(&cpu->sem);
         qemu_mutex_lock_iothread();
         qemu_wait_io_event(cpu);
     } while (!cpu->unplug);
@@ -67,6 +55,7 @@ void dummy_start_vcpu_thread(CPUState *cpu)
     qemu_cond_init(cpu->halt_cond);
     snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/DUMMY",
              cpu->cpu_index);
+    qemu_sem_init(&cpu->sem, 0);
     qemu_thread_create(cpu->thread, thread_name, dummy_cpu_thread_fn, cpu,
                        QEMU_THREAD_JOINABLE);
 }
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 23b30484b2..2a992d0d5f 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -437,19 +437,11 @@ void qemu_wait_io_event(CPUState *cpu)
 
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
-    if (err && err != ESRCH) {
-        fprintf(stderr, "qemu:%s: %s", __func__, strerror(err));
-        exit(1);
-    }
-#endif
+    qemu_sem_post(&cpu->sem);
 }
 
 void qemu_cpu_kick(CPUState *cpu)
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


