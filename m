Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AA61EFF30
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jun 2020 19:38:47 +0200 (CEST)
Received: from localhost ([::1]:58616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jhGIo-000529-5q
	for lists+qemu-devel@lfdr.de; Fri, 05 Jun 2020 13:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jhGHh-0003Jb-S4
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 13:37:37 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:34899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jhGHg-0003q0-Qn
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 13:37:37 -0400
Received: by mail-pf1-x443.google.com with SMTP id h185so5290034pfg.2
 for <qemu-devel@nongnu.org>; Fri, 05 Jun 2020 10:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QonKzFLvxHetjYHv0eko5X68Tto6P2i1o+bAUOOMVq8=;
 b=IqfJ0B/6o/HB9WrnAdz0DzKWhSIhvU3L3BtJurcDXQWusz3uv1YGZvnKy6Rs3X+nWg
 5XXLGHGguFT97AAbAjokOTflLlO8dBghVl/0KYD2FAsii+0MG5mJmbWUU1iqkkANWH6K
 b5Huid8G04XSqnLaybnwT7+/cqUnhzOJste3Ud3rYr+k1h0sL0mxN2juY8D7p9zzlniG
 /ebMO5NcoumH2H5cwQwHGKreFd4l9wrzaW8mEz1qQLUeZ9kgBm8dDZTV+jpJnfAxhfDw
 PIQEJ+8ILMnHve/9wjDAkQP8dkg2LGOmxki/mXRV3+eo6+tO1NUrXUWVu8oqOuGLanjL
 4M+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QonKzFLvxHetjYHv0eko5X68Tto6P2i1o+bAUOOMVq8=;
 b=JAoG+8fpzJrNde8xQJNhgsrGHr9zSgIenUUp43UDT2aHr8sKmqBLKTpQ8kpxPihDXo
 gWI/1iMTUXM9Va6lzkK2ahDTuNzHF2M+00E/M7Ju0xjfPQ5U1ErwMioBzA1hEOTMri/T
 8wDxlFqtcKlkpKwB3l+/KiNynlFyCtEhwfXIsQwlb+UZZiZ7WEpl67hFI2enUOa7Po10
 z3mjIUgrqgXBtZOOaD8bj3TVZhjxv6AVDN0I/gzjFaw09o3qE2Xd6/AEyCa13Kt/or65
 FYZa5ubSM5QDAIHkw8kQrzsxhRLAmNDFZJTDHOJlRQmga4spjU3NQsrkSHugM6NoMpCX
 E+0g==
X-Gm-Message-State: AOAM533mlCb0T8+m1XBlvyA8zAeQR7PcLC5vE5Cnc6OFLLGFFGnxTOYH
 nrN1//d522eqvSD8jgVQZuypMXrPPF3J+Q==
X-Google-Smtp-Source: ABdhPJw+se9W1WtXmKMZGAHlKna5uJVtR1KGit6G2Og/A2azeWskc6mjc5fG5yMhAuUsBP7/FkDPfg==
X-Received: by 2002:aa7:868b:: with SMTP id d11mr10304598pfo.52.1591378655149; 
 Fri, 05 Jun 2020 10:37:35 -0700 (PDT)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 (c-73-47-162-176.hsd1.ma.comcast.net. [73.47.162.176])
 by smtp.gmail.com with ESMTPSA id a19sm188307pfd.165.2020.06.05.10.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 10:37:34 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/13] cpu: convert queued work to a QSIMPLEQ
Date: Fri,  5 Jun 2020 13:34:11 -0400
Message-Id: <20200605173422.1490-3-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200605173422.1490-1-robert.foley@linaro.org>
References: <20200605173422.1490-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=robert.foley@linaro.org; helo=mail-pf1-x443.google.com
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
Cc: robert.foley@linaro.org, Eduardo Habkost <ehabkost@redhat.com>,
 cota@braap.org, Paolo Bonzini <pbonzini@redhat.com>, peter.puhov@linaro.org,
 alex.bennee@linaro.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

We convert queued work to a QSIMPLEQ, instead of
open-coding it.

While at it, make sure that all accesses to the list are
performed while holding the list's lock.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 cpus-common.c         | 25 ++++++++-----------------
 cpus.c                | 14 ++++++++++++--
 hw/core/cpu.c         |  1 +
 include/hw/core/cpu.h |  6 +++---
 4 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/cpus-common.c b/cpus-common.c
index 70a9d12981..8f5512b3d7 100644
--- a/cpus-common.c
+++ b/cpus-common.c
@@ -97,7 +97,7 @@ void cpu_list_remove(CPUState *cpu)
 }
 
 struct qemu_work_item {
-    struct qemu_work_item *next;
+    QSIMPLEQ_ENTRY(qemu_work_item) node;
     run_on_cpu_func func;
     run_on_cpu_data data;
     bool free, exclusive, done;
@@ -106,13 +106,7 @@ struct qemu_work_item {
 static void queue_work_on_cpu(CPUState *cpu, struct qemu_work_item *wi)
 {
     qemu_mutex_lock(&cpu->work_mutex);
-    if (cpu->queued_work_first == NULL) {
-        cpu->queued_work_first = wi;
-    } else {
-        cpu->queued_work_last->next = wi;
-    }
-    cpu->queued_work_last = wi;
-    wi->next = NULL;
+    QSIMPLEQ_INSERT_TAIL(&cpu->work_list, wi, node);
     wi->done = false;
     qemu_mutex_unlock(&cpu->work_mutex);
 
@@ -306,17 +300,14 @@ void process_queued_cpu_work(CPUState *cpu)
 {
     struct qemu_work_item *wi;
 
-    if (cpu->queued_work_first == NULL) {
+    qemu_mutex_lock(&cpu->work_mutex);
+    if (QSIMPLEQ_EMPTY(&cpu->work_list)) {
+        qemu_mutex_unlock(&cpu->work_mutex);
         return;
     }
-
-    qemu_mutex_lock(&cpu->work_mutex);
-    while (cpu->queued_work_first != NULL) {
-        wi = cpu->queued_work_first;
-        cpu->queued_work_first = wi->next;
-        if (!cpu->queued_work_first) {
-            cpu->queued_work_last = NULL;
-        }
+    while (!QSIMPLEQ_EMPTY(&cpu->work_list)) {
+        wi = QSIMPLEQ_FIRST(&cpu->work_list);
+        QSIMPLEQ_REMOVE_HEAD(&cpu->work_list, node);
         qemu_mutex_unlock(&cpu->work_mutex);
         if (wi->exclusive) {
             /* Running work items outside the BQL avoids the following deadlock:
diff --git a/cpus.c b/cpus.c
index 5670c96bcf..af44027549 100644
--- a/cpus.c
+++ b/cpus.c
@@ -97,9 +97,19 @@ bool cpu_is_stopped(CPUState *cpu)
     return cpu->stopped || !runstate_is_running();
 }
 
+static inline bool cpu_work_list_empty(CPUState *cpu)
+{
+    bool ret;
+
+    qemu_mutex_lock(&cpu->work_mutex);
+    ret = QSIMPLEQ_EMPTY(&cpu->work_list);
+    qemu_mutex_unlock(&cpu->work_mutex);
+    return ret;
+}
+
 static bool cpu_thread_is_idle(CPUState *cpu)
 {
-    if (cpu->stop || cpu->queued_work_first) {
+    if (cpu->stop || !cpu_work_list_empty(cpu)) {
         return false;
     }
     if (cpu_is_stopped(cpu)) {
@@ -1498,7 +1508,7 @@ static void *qemu_tcg_rr_cpu_thread_fn(void *arg)
             cpu = first_cpu;
         }
 
-        while (cpu && !cpu->queued_work_first && !cpu->exit_request) {
+        while (cpu && cpu_work_list_empty(cpu) && !cpu->exit_request) {
 
             atomic_mb_set(&tcg_current_rr_cpu, cpu);
             current_cpu = cpu;
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 5284d384fb..77703d62b7 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -368,6 +368,7 @@ static void cpu_common_initfn(Object *obj)
     cpu->nr_threads = 1;
 
     qemu_mutex_init(&cpu->work_mutex);
+    QSIMPLEQ_INIT(&cpu->work_list);
     QTAILQ_INIT(&cpu->breakpoints);
     QTAILQ_INIT(&cpu->watchpoints);
 
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 07f7698155..d78ff1d165 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -331,8 +331,8 @@ struct qemu_work_item;
  * @opaque: User data.
  * @mem_io_pc: Host Program Counter at which the memory was accessed.
  * @kvm_fd: vCPU file descriptor for KVM.
- * @work_mutex: Lock to prevent multiple access to queued_work_*.
- * @queued_work_first: First asynchronous work pending.
+ * @work_mutex: Lock to prevent multiple access to @work_list.
+ * @work_list: List of pending asynchronous work.
  * @trace_dstate_delayed: Delayed changes to trace_dstate (includes all changes
  *                        to @trace_dstate).
  * @trace_dstate: Dynamic tracing state of events for this vCPU (bitmask).
@@ -376,7 +376,7 @@ struct CPUState {
     sigjmp_buf jmp_env;
 
     QemuMutex work_mutex;
-    struct qemu_work_item *queued_work_first, *queued_work_last;
+    QSIMPLEQ_HEAD(, qemu_work_item) work_list;
 
     CPUAddressSpace *cpu_ases;
     int num_ases;
-- 
2.17.1


