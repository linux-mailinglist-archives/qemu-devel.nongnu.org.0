Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA69C1DD345
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 18:47:03 +0200 (CEST)
Received: from localhost ([::1]:36056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jboLW-0008MX-Ov
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 12:47:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jboHy-0001f3-FU
 for qemu-devel@nongnu.org; Thu, 21 May 2020 12:43:22 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:42228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jboHx-0006TM-8T
 for qemu-devel@nongnu.org; Thu, 21 May 2020 12:43:22 -0400
Received: by mail-qk1-x741.google.com with SMTP id s1so7834227qkf.9
 for <qemu-devel@nongnu.org>; Thu, 21 May 2020 09:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=niJOK+gFFfbZ7oCXJZeMjKiL+kdF4g0cKXPQfbfeKkw=;
 b=kPI6r7a1lED6MVSPk87IsVqLAyD+RsId94FvTDU/9QyaYz8Y3xeWXMwZ9d25hxxXVm
 +huCpNnk0o+4g9JQkz7BL2OZHUtA/cCYh2M/rFPE3XTA1VjML9PWwMKsdhRV8o5/ksly
 GSZTIdTMumJUsG3qWvHeVTvNXGSMrSBr+HM5AJvKyrk7uYWULo9jzntROdWk6+4mXnJa
 68R2LkkGvspHQdB6nLFpP6/Vw3X9+H//aRQ7wYsFDRxFdu9+2JverfL1eCDG4Yt8Gjcb
 qmHLMCAw+o7Fu7sa3QUY+BrG9u5VAWBkpxGSh1u4ULivdaSMuZAYMa0AP3VPwPaAZdc7
 SRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=niJOK+gFFfbZ7oCXJZeMjKiL+kdF4g0cKXPQfbfeKkw=;
 b=M4CN5eJUpykNwmekLPEEtRZqZeoNZxJI6nEaaEQUC2W8HDGIHA6p0iiOzWqi8qQqDe
 bxjbW68M2QdVv1ADlovuu/W7CZVdmO0BtAs74HpJ5vlo7gj2vX52fKxDQ5IYtD5SgmLA
 Q9k8MhBJKGcKmAFw2b1jtw2T3wTdYWlSTU2A453eOmILLvxmKAW1RJjoZfq429hsFtMC
 wZdKVX2nyMjhqT6QDrGXhbarEu4HvQiPyX9id3ydwF3hVg43vHshU2lvwg9YX683Nr7p
 0HCtnYZtBDzVOT0K+PQtBlKrsTwDFtfFNYwyO62U3oXYMiUzbVYi2XAwpLEGsMk5PTQC
 dAxg==
X-Gm-Message-State: AOAM532rUxEuylgWzTpUTTaVkJ81iVkjmgkBuGFNr5bL64itumqn+i0N
 BP8GEqmKWve+/bJEyOpBhN2B1oxBBkAMtA==
X-Google-Smtp-Source: ABdhPJy6xBxfJvX8ZP7Ow8cUE7HyZu0IhkRVAJnO5ATWnJtQYePi0+prJb6fQy3LZE6Cn9JHRcMGsQ==
X-Received: by 2002:a37:b144:: with SMTP id a65mr10554942qkf.462.1590079399077; 
 Thu, 21 May 2020 09:43:19 -0700 (PDT)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:1944:c530:655c:5583])
 by smtp.gmail.com with ESMTPSA id x24sm5923829qth.57.2020.05.21.09.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 09:43:18 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 04/74] cpu: make qemu_work_cond per-cpu
Date: Thu, 21 May 2020 12:39:01 -0400
Message-Id: <20200521164011.638-5-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200521164011.638-1-robert.foley@linaro.org>
References: <20200521164011.638-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::741;
 envelope-from=robert.foley@linaro.org; helo=mail-qk1-x741.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: richard.henderson@linaro.org, cota@braap.org, alex.bennee@linaro.org,
 robert.foley@linaro.org, peter.puhov@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

This eliminates the need to use the BQL to queue CPU work.

While at it, give the per-cpu field a generic name ("cond") since
it will soon be used for more than just queueing CPU work.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 cpus-common.c         | 72 ++++++++++++++++++++++++++++++++++---------
 cpus.c                |  2 +-
 hw/core/cpu.c         |  1 +
 include/hw/core/cpu.h |  6 ++--
 4 files changed, 63 insertions(+), 18 deletions(-)

diff --git a/cpus-common.c b/cpus-common.c
index 34025923e3..4db4e0026f 100644
--- a/cpus-common.c
+++ b/cpus-common.c
@@ -27,7 +27,6 @@
 static QemuMutex qemu_cpu_list_lock;
 static QemuCond exclusive_cond;
 static QemuCond exclusive_resume;
-static QemuCond qemu_work_cond;
 
 /* >= 1 if a thread is inside start_exclusive/end_exclusive.  Written
  * under qemu_cpu_list_lock, read with atomic operations.
@@ -43,7 +42,6 @@ void qemu_init_cpu_list(void)
     qemu_mutex_init(&qemu_cpu_list_lock);
     qemu_cond_init(&exclusive_cond);
     qemu_cond_init(&exclusive_resume);
-    qemu_cond_init(&qemu_work_cond);
 }
 
 void cpu_list_lock(void)
@@ -103,23 +101,37 @@ struct qemu_work_item {
     bool free, exclusive, done;
 };
 
-static void queue_work_on_cpu(CPUState *cpu, struct qemu_work_item *wi)
+/* Called with the CPU's lock held */
+static void queue_work_on_cpu_locked(CPUState *cpu, struct qemu_work_item *wi)
 {
-    qemu_mutex_lock(&cpu->lock);
     QSIMPLEQ_INSERT_TAIL(&cpu->work_list, wi, node);
     wi->done = false;
-    qemu_mutex_unlock(&cpu->lock);
 
     qemu_cpu_kick(cpu);
 }
 
-void do_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data,
-                   QemuMutex *mutex)
+static void queue_work_on_cpu(CPUState *cpu, struct qemu_work_item *wi)
+{
+    cpu_mutex_lock(cpu);
+    queue_work_on_cpu_locked(cpu, wi);
+    cpu_mutex_unlock(cpu);
+}
+
+void do_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data)
 {
     struct qemu_work_item wi;
+    bool has_bql = qemu_mutex_iothread_locked();
+
+    g_assert(no_cpu_mutex_locked());
 
     if (qemu_cpu_is_self(cpu)) {
-        func(cpu, data);
+        if (has_bql) {
+            func(cpu, data);
+        } else {
+            qemu_mutex_lock_iothread();
+            func(cpu, data);
+            qemu_mutex_unlock_iothread();
+        }
         return;
     }
 
@@ -129,13 +141,34 @@ void do_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data,
     wi.free = false;
     wi.exclusive = false;
 
-    queue_work_on_cpu(cpu, &wi);
+    cpu_mutex_lock(cpu);
+    queue_work_on_cpu_locked(cpu, &wi);
+
+    /*
+     * We are going to sleep on the CPU lock, so release the BQL.
+     *
+     * During the transition to per-CPU locks, we release the BQL _after_
+     * having kicked the destination CPU (from queue_work_on_cpu_locked above).
+     * This makes sure that the enqueued work will be seen by the CPU
+     * after being woken up from the kick, since the CPU sleeps on the BQL.
+     * Once we complete the transition to per-CPU locks, we will release
+     * the BQL earlier in this function.
+     */
+    if (has_bql) {
+        qemu_mutex_unlock_iothread();
+    }
+
     while (!atomic_mb_read(&wi.done)) {
         CPUState *self_cpu = current_cpu;
 
-        qemu_cond_wait(&qemu_work_cond, mutex);
+        qemu_cond_wait(&cpu->cond, &cpu->lock);
         current_cpu = self_cpu;
     }
+    cpu_mutex_unlock(cpu);
+
+    if (has_bql) {
+        qemu_mutex_lock_iothread();
+    }
 }
 
 void async_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data)
@@ -299,6 +332,7 @@ void async_safe_run_on_cpu(CPUState *cpu, run_on_cpu_func func,
 void process_queued_cpu_work(CPUState *cpu)
 {
     struct qemu_work_item *wi;
+    bool has_bql = qemu_mutex_iothread_locked();
 
     qemu_mutex_lock(&cpu->lock);
     if (QSIMPLEQ_EMPTY(&cpu->work_list)) {
@@ -316,13 +350,23 @@ void process_queued_cpu_work(CPUState *cpu)
              * BQL, so it goes to sleep; start_exclusive() is sleeping too, so
              * neither CPU can proceed.
              */
-            qemu_mutex_unlock_iothread();
+            if (has_bql) {
+                qemu_mutex_unlock_iothread();
+            }
             start_exclusive();
             wi->func(cpu, wi->data);
             end_exclusive();
-            qemu_mutex_lock_iothread();
+            if (has_bql) {
+                qemu_mutex_lock_iothread();
+            }
         } else {
-            wi->func(cpu, wi->data);
+            if (has_bql) {
+                wi->func(cpu, wi->data);
+            } else {
+                qemu_mutex_lock_iothread();
+                wi->func(cpu, wi->data);
+                qemu_mutex_unlock_iothread();
+            }
         }
         qemu_mutex_lock(&cpu->lock);
         if (wi->free) {
@@ -332,5 +376,5 @@ void process_queued_cpu_work(CPUState *cpu)
         }
     }
     qemu_mutex_unlock(&cpu->lock);
-    qemu_cond_broadcast(&qemu_work_cond);
+    qemu_cond_broadcast(&cpu->cond);
 }
diff --git a/cpus.c b/cpus.c
index c2da430221..e57e8fe669 100644
--- a/cpus.c
+++ b/cpus.c
@@ -1196,7 +1196,7 @@ void qemu_init_cpu_loop(void)
 
 void run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data)
 {
-    do_run_on_cpu(cpu, func, data, &qemu_global_mutex);
+    do_run_on_cpu(cpu, func, data);
 }
 
 static void qemu_kvm_destroy_vcpu(CPUState *cpu)
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 4d58399cfc..9b9d4296f9 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -368,6 +368,7 @@ static void cpu_common_initfn(Object *obj)
     cpu->nr_threads = 1;
 
     qemu_mutex_init(&cpu->lock);
+    qemu_cond_init(&cpu->cond);
     QSIMPLEQ_INIT(&cpu->work_list);
     QTAILQ_INIT(&cpu->breakpoints);
     QTAILQ_INIT(&cpu->watchpoints);
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 2912d9a7c1..d8b81db262 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -333,6 +333,7 @@ struct qemu_work_item;
  * @kvm_fd: vCPU file descriptor for KVM.
  * @lock: Lock to prevent multiple access to per-CPU fields. Must be acquired
  *        after the BQL.
+ * @cond: Condition variable for per-CPU events.
  * @work_list: List of pending asynchronous work.
  * @trace_dstate_delayed: Delayed changes to trace_dstate (includes all changes
  *                        to @trace_dstate).
@@ -378,6 +379,7 @@ struct CPUState {
 
     QemuMutex lock;
     /* fields below protected by @lock */
+    QemuCond cond;
     QSIMPLEQ_HEAD(, qemu_work_item) work_list;
 
     CPUAddressSpace *cpu_ases;
@@ -769,12 +771,10 @@ bool cpu_is_stopped(CPUState *cpu);
  * @cpu: The vCPU to run on.
  * @func: The function to be executed.
  * @data: Data to pass to the function.
- * @mutex: Mutex to release while waiting for @func to run.
  *
  * Used internally in the implementation of run_on_cpu.
  */
-void do_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data,
-                   QemuMutex *mutex);
+void do_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data);
 
 /**
  * run_on_cpu:
-- 
2.17.1


