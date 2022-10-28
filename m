Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA22C6112A7
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 15:27:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooPLS-00028g-JL; Fri, 28 Oct 2022 09:24:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKh-0001Jd-Ar
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKe-0005K2-Ox
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666963412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EOwCbSx6RaFxN3KnKE6Mv1+VPvPhECR7ju5uIwAb1Uc=;
 b=dpInSsK1ao48vILrdlR1X4vWIxu+9gP17bIK2lOOv2rxOo8bOflInul2cSij9oPsQmN2lJ
 PuwG3sEI1UecGkzMCaZFXJ9mhS6XMY613LVP5XGifhzjz+AcqkOx5bQ3n9lASMo4bsfhvA
 xfAEkg/XNakxC/2SzhWAy/lwbch1bMo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-759F9OfeNLWOzXI4dHmMyw-1; Fri, 28 Oct 2022 09:23:28 -0400
X-MC-Unique: 759F9OfeNLWOzXI4dHmMyw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71923858F13;
 Fri, 28 Oct 2022 13:23:28 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29D02112131B;
 Fri, 28 Oct 2022 13:23:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 13/21] accel/qtest: Support qtest accelerator for Windows
Date: Fri, 28 Oct 2022 15:22:56 +0200
Message-Id: <20221028132304.829103-14-thuth@redhat.com>
In-Reply-To: <20221028132304.829103-1-thuth@redhat.com>
References: <20221028132304.829103-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

Currently signal SIGIPI [=SIGUSR1] is used to kick the dummy CPU
when qtest accelerator is used. However SIGUSR1 is unsupported on
Windows. To support Windows, we add a QemuSemaphore CPUState::sem
to kick the dummy CPU instead for Windows.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20221028045736.679903-2-bin.meng@windriver.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/core/cpu.h   |  1 +
 accel/dummy-cpus.c      | 14 ++++++++++++--
 softmmu/cpus.c          |  9 +++++----
 accel/meson.build       |  2 +-
 accel/qtest/meson.build |  3 +--
 5 files changed, 20 insertions(+), 9 deletions(-)

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
index b9a963cf80..259c35c4c8 100644
--- a/accel/meson.build
+++ b/accel/meson.build
@@ -16,5 +16,5 @@ dummy_ss.add(files(
   'dummy-cpus.c',
 ))
 
-specific_ss.add_all(when: ['CONFIG_SOFTMMU', 'CONFIG_POSIX'], if_true: dummy_ss)
+specific_ss.add_all(when: ['CONFIG_SOFTMMU'], if_true: dummy_ss)
 specific_ss.add_all(when: ['CONFIG_XEN'], if_true: dummy_ss)
diff --git a/accel/qtest/meson.build b/accel/qtest/meson.build
index 4c65600293..176d990ae1 100644
--- a/accel/qtest/meson.build
+++ b/accel/qtest/meson.build
@@ -1,2 +1 @@
-qtest_module_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_POSIX'],
-                    if_true: files('qtest.c'))
+qtest_module_ss.add(when: ['CONFIG_SOFTMMU'], if_true: files('qtest.c'))
-- 
2.31.1


