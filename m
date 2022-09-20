Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D29905BE45D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 13:27:28 +0200 (CEST)
Received: from localhost ([::1]:56324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oabPT-0008Vs-6f
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 07:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYk-00012K-PT
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:00 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:34592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYf-0004qa-Fd
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:32:54 -0400
Received: by mail-pf1-x434.google.com with SMTP id e68so2348834pfe.1
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=coajynULDWAZNTjpgIFLrJ318DUJeq2ShOj+5RVWOfU=;
 b=d+IiRzmYuYKe2hrRuikwivDRvOiQdahdViwE9HTaaKgB1467f7gTCC3rampmnvY1bu
 kKGXJq6jwkC39mcTNlIuJL7QIPLPyoiDRW75e2UEx4+rC1THVJCN24320vr+vQTsbIh3
 CUJdGjIq6UDI2MQNs2KOScMQEvSxHVRrqXObNlQt7z5SaVptddDCNwcBg8wIkcYo9i0/
 gWry0Uv62KfbGuFAnIdLRhN0Iz94Cw3XR/PRXD6qYyP6R4jKxv95fjcI38zK1Wy5fEjk
 whyHEUWRxaUcIAUJn1MOlnBjhx+dh3fXQcmjNZmwNkqWCFcCGi3kFVm0V+M8sskt5BPL
 LPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=coajynULDWAZNTjpgIFLrJ318DUJeq2ShOj+5RVWOfU=;
 b=Htn1yC5d5g+Amj39DlVZNaZCJDQGdmxYw5uPjy3Kc/cjGYDfF8ZwTj00K6cEPJ6IgR
 9+Ui32XkPT4A5Cy+v2xx4fpQObo8A3PKcsEFbkURzucshV4+yuI2u6I0SkS77H4u/Dr9
 GnaorWCY1v7DHwQZ3s9V5T/O42o2T04S8SW9+g+Yqme/kXQbQdqx603RmD/lc8HkiZ8Z
 gfHnlLOKRxpWs/Ti1q6jLP6F4+D590lzsteXf1xbo+kHvDKkRfn10dPi+E3LiKhBhD3V
 mf0WoXqQasSJcCOE+GMxrT2BZiDBdEqptCjs+p2wdwftwYO0X1yMASFRWSzV0fzSRHF7
 AJ4g==
X-Gm-Message-State: ACrzQf2Uqamsw0rovljIIXITQD5c6DVoX1TEr0vzVv7LUth6QC4St3Jh
 jn+u0sRsqIsZ96RRy9ceIBhNh+vDrD0=
X-Google-Smtp-Source: AMsMyM4OdfXFzQy493NueRy/+P0k9lvDYLNVo6xMITTPPug0KBUzlpoiJi+wrsZpNVt0dKAr3GBNyA==
X-Received: by 2002:a63:e306:0:b0:42c:414a:95e9 with SMTP id
 f6-20020a63e306000000b0042c414a95e9mr20352222pgh.139.1663669971978; 
 Tue, 20 Sep 2022 03:32:51 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:32:51 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v2 14/39] accel/qtest: Implement a portable qtest accelerator
Date: Tue, 20 Sep 2022 18:31:34 +0800
Message-Id: <20220920103159.1865256-15-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x434.google.com
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


