Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 235C3664780
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 18:36:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFH66-0003F5-29; Tue, 10 Jan 2023 11:03:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5P-0002sw-3H
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:02:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5N-0004z1-1j
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:02:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673366568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mv3QnxHWpyE3uOtMtG1TyDeNUQV1dkXfxbpTsNv2gGE=;
 b=KM9nEj7tabhbq3vyWwAZ0iDbgv/elMjppxJTb1Wr8DL1i5rWWL8d8TpMapBaoeoGkFa5fV
 sTd/UlWtnz+IFynYRWwG8DN9bgYiXtHOLJ1MNrLN3cB9fXSpwM1s7X50oFpLCcphWVyjWA
 19VmG6BzMmbGY/7RZSnt4ATfcg36ylM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-544-QRG6_m_HMb2MKoIvDfwybQ-1; Tue, 10 Jan 2023 11:02:46 -0500
X-MC-Unique: QRG6_m_HMb2MKoIvDfwybQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 m38-20020a05600c3b2600b003d23f8c6ebdso875447wms.0
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:02:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mv3QnxHWpyE3uOtMtG1TyDeNUQV1dkXfxbpTsNv2gGE=;
 b=PE31jxYYrB8YsnTNgLss6IDFASGyJCikO2+08gzYr14xoESbI7EwhCXK5AzmWtPLDe
 9XnzMMn8DaYGe4cBFllFPK6kZ5BG443rNP5S98sVacEP+mXUgziI0S+kIcI55EW2Xxlh
 vTQcWSBn5FRRR1lgQ5juRqPl8xg6HO3ft2lsyoz8TDeb2B+Whr0QakLaWFVwo+AQf6oX
 CbseldPHLC5zZ6UzJ1yNU4A0gYlVtIt23D/9hrV96cU0HfB/daR3cjVUWCUSvAbg27qT
 6koR4FTnqUrXQ1btiDGF3tmO3hBOW/jQC0lZMR4oAAOxtzKML8ezUU8bPQu115T519Ju
 ZurQ==
X-Gm-Message-State: AFqh2krDui33ALtaLl0VJBiC56LZ7TvgAbdYcZ/3KiLVXNvZAVoQyR4q
 ZfNg7z86M84FMSaHVAtbJJKuU1/pvLZrALlIjxHq+/5nM16Y99OurCy23CKYiBgFwqdc7B9GA8b
 bR52wIbfZ96J3dGdPxCroy3x8/P/RO7dOVu7IecbRF8xk8bEQ3/R8qAt/b5FR1Za52HQ=
X-Received: by 2002:a05:600c:1d89:b0:3d3:5cd6:781 with SMTP id
 p9-20020a05600c1d8900b003d35cd60781mr49127841wms.37.1673366564150; 
 Tue, 10 Jan 2023 08:02:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtP5Uei3ee+UyPxcQhcuNDdLg39aHx5VqNyS5WHA5/snBoIKVyZA5Uy9Z2Tz3QcWs4Hl/OnrA==
X-Received: by 2002:a05:600c:1d89:b0:3d3:5cd6:781 with SMTP id
 p9-20020a05600c1d8900b003d35cd60781mr49127802wms.37.1673366563761; 
 Tue, 10 Jan 2023 08:02:43 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a5d6d49000000b002bc8130cca7sm3512408wri.23.2023.01.10.08.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:02:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 03/29] accel: introduce accelerator blocker API
Date: Tue, 10 Jan 2023 17:02:07 +0100
Message-Id: <20230110160233.339771-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110160233.339771-1-pbonzini@redhat.com>
References: <20230110160233.339771-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

This API allows the accelerators to prevent vcpus from issuing
new ioctls while execting a critical section marked with the
accel_ioctl_inhibit_begin/end functions.

Note that all functions submitting ioctls must mark where the
ioctl is being called with accel_{cpu_}ioctl_begin/end().

This API requires the caller to always hold the BQL.
API documentation is in sysemu/accel-blocker.h

Internally, it uses a QemuLockCnt together with a per-CPU QemuLockCnt
(to minimize cache line bouncing) to keep avoid that new ioctls
run when the critical section starts, and a QemuEvent to wait
that all running ioctls finish.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221111154758.1372674-2-eesposit@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/accel-blocker.c          | 154 +++++++++++++++++++++++++++++++++
 accel/meson.build              |   2 +-
 hw/core/cpu-common.c           |   2 +
 include/hw/core/cpu.h          |   3 +
 include/sysemu/accel-blocker.h |  56 ++++++++++++
 util/meson.build               |   2 +-
 6 files changed, 217 insertions(+), 2 deletions(-)
 create mode 100644 accel/accel-blocker.c
 create mode 100644 include/sysemu/accel-blocker.h

diff --git a/accel/accel-blocker.c b/accel/accel-blocker.c
new file mode 100644
index 000000000000..1e7f423462df
--- /dev/null
+++ b/accel/accel-blocker.c
@@ -0,0 +1,154 @@
+/*
+ * Lock to inhibit accelerator ioctls
+ *
+ * Copyright (c) 2022 Red Hat Inc.
+ *
+ * Author: Emanuele Giuseppe Esposito       <eesposit@redhat.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/thread.h"
+#include "qemu/main-loop.h"
+#include "hw/core/cpu.h"
+#include "sysemu/accel-blocker.h"
+
+static QemuLockCnt accel_in_ioctl_lock;
+static QemuEvent accel_in_ioctl_event;
+
+void accel_blocker_init(void)
+{
+    qemu_lockcnt_init(&accel_in_ioctl_lock);
+    qemu_event_init(&accel_in_ioctl_event, false);
+}
+
+void accel_ioctl_begin(void)
+{
+    if (likely(qemu_mutex_iothread_locked())) {
+        return;
+    }
+
+    /* block if lock is taken in kvm_ioctl_inhibit_begin() */
+    qemu_lockcnt_inc(&accel_in_ioctl_lock);
+}
+
+void accel_ioctl_end(void)
+{
+    if (likely(qemu_mutex_iothread_locked())) {
+        return;
+    }
+
+    qemu_lockcnt_dec(&accel_in_ioctl_lock);
+    /* change event to SET. If event was BUSY, wake up all waiters */
+    qemu_event_set(&accel_in_ioctl_event);
+}
+
+void accel_cpu_ioctl_begin(CPUState *cpu)
+{
+    if (unlikely(qemu_mutex_iothread_locked())) {
+        return;
+    }
+
+    /* block if lock is taken in kvm_ioctl_inhibit_begin() */
+    qemu_lockcnt_inc(&cpu->in_ioctl_lock);
+}
+
+void accel_cpu_ioctl_end(CPUState *cpu)
+{
+    if (unlikely(qemu_mutex_iothread_locked())) {
+        return;
+    }
+
+    qemu_lockcnt_dec(&cpu->in_ioctl_lock);
+    /* change event to SET. If event was BUSY, wake up all waiters */
+    qemu_event_set(&accel_in_ioctl_event);
+}
+
+static bool accel_has_to_wait(void)
+{
+    CPUState *cpu;
+    bool needs_to_wait = false;
+
+    CPU_FOREACH(cpu) {
+        if (qemu_lockcnt_count(&cpu->in_ioctl_lock)) {
+            /* exit the ioctl, if vcpu is running it */
+            qemu_cpu_kick(cpu);
+            needs_to_wait = true;
+        }
+    }
+
+    return needs_to_wait || qemu_lockcnt_count(&accel_in_ioctl_lock);
+}
+
+void accel_ioctl_inhibit_begin(void)
+{
+    CPUState *cpu;
+
+    /*
+     * We allow to inhibit only when holding the BQL, so we can identify
+     * when an inhibitor wants to issue an ioctl easily.
+     */
+    g_assert(qemu_mutex_iothread_locked());
+
+    /* Block further invocations of the ioctls outside the BQL.  */
+    CPU_FOREACH(cpu) {
+        qemu_lockcnt_lock(&cpu->in_ioctl_lock);
+    }
+    qemu_lockcnt_lock(&accel_in_ioctl_lock);
+
+    /* Keep waiting until there are running ioctls */
+    while (true) {
+
+        /* Reset event to FREE. */
+        qemu_event_reset(&accel_in_ioctl_event);
+
+        if (accel_has_to_wait()) {
+            /*
+             * If event is still FREE, and there are ioctls still in progress,
+             * wait.
+             *
+             *  If an ioctl finishes before qemu_event_wait(), it will change
+             * the event state to SET. This will prevent qemu_event_wait() from
+             * blocking, but it's not a problem because if other ioctls are
+             * still running the loop will iterate once more and reset the event
+             * status to FREE so that it can wait properly.
+             *
+             * If an ioctls finishes while qemu_event_wait() is blocking, then
+             * it will be waken up, but also here the while loop makes sure
+             * to re-enter the wait if there are other running ioctls.
+             */
+            qemu_event_wait(&accel_in_ioctl_event);
+        } else {
+            /* No ioctl is running */
+            return;
+        }
+    }
+}
+
+void accel_ioctl_inhibit_end(void)
+{
+    CPUState *cpu;
+
+    qemu_lockcnt_unlock(&accel_in_ioctl_lock);
+    CPU_FOREACH(cpu) {
+        qemu_lockcnt_unlock(&cpu->in_ioctl_lock);
+    }
+}
+
diff --git a/accel/meson.build b/accel/meson.build
index 3a480cc2efef..49558dd232c2 100644
--- a/accel/meson.build
+++ b/accel/meson.build
@@ -1,4 +1,4 @@
-specific_ss.add(files('accel-common.c'))
+specific_ss.add(files('accel-common.c', 'accel-blocker.c'))
 softmmu_ss.add(files('accel-softmmu.c'))
 user_ss.add(files('accel-user.c'))
 
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index b177e761f010..5ccc3837b678 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -238,6 +238,7 @@ static void cpu_common_initfn(Object *obj)
     cpu->cflags_next_tb = -1;
 
     qemu_mutex_init(&cpu->work_mutex);
+    qemu_lockcnt_init(&cpu->in_ioctl_lock);
     QSIMPLEQ_INIT(&cpu->work_list);
     QTAILQ_INIT(&cpu->breakpoints);
     QTAILQ_INIT(&cpu->watchpoints);
@@ -249,6 +250,7 @@ static void cpu_common_finalize(Object *obj)
 {
     CPUState *cpu = CPU(obj);
 
+    qemu_lockcnt_destroy(&cpu->in_ioctl_lock);
     qemu_mutex_destroy(&cpu->work_mutex);
 }
 
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 88305461212f..2417597236bc 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -398,6 +398,9 @@ struct CPUState {
     uint32_t kvm_fetch_index;
     uint64_t dirty_pages;
 
+    /* Use by accel-block: CPU is executing an ioctl() */
+    QemuLockCnt in_ioctl_lock;
+
     /* Used for events with 'vcpu' and *without* the 'disabled' properties */
     DECLARE_BITMAP(trace_dstate_delayed, CPU_TRACE_DSTATE_MAX_EVENTS);
     DECLARE_BITMAP(trace_dstate, CPU_TRACE_DSTATE_MAX_EVENTS);
diff --git a/include/sysemu/accel-blocker.h b/include/sysemu/accel-blocker.h
new file mode 100644
index 000000000000..72020529ef35
--- /dev/null
+++ b/include/sysemu/accel-blocker.h
@@ -0,0 +1,56 @@
+/*
+ * Accelerator blocking API, to prevent new ioctls from starting and wait the
+ * running ones finish.
+ * This mechanism differs from pause/resume_all_vcpus() in that it does not
+ * release the BQL.
+ *
+ *  Copyright (c) 2022 Red Hat Inc.
+ *
+ * Author: Emanuele Giuseppe Esposito       <eesposit@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#ifndef ACCEL_BLOCKER_H
+#define ACCEL_BLOCKER_H
+
+#include "qemu/osdep.h"
+#include "sysemu/cpus.h"
+
+extern void accel_blocker_init(void);
+
+/*
+ * accel_{cpu_}ioctl_begin/end:
+ * Mark when ioctl is about to run or just finished.
+ *
+ * accel_{cpu_}ioctl_begin will block after accel_ioctl_inhibit_begin() is
+ * called, preventing new ioctls to run. They will continue only after
+ * accel_ioctl_inibith_end().
+ */
+extern void accel_ioctl_begin(void);
+extern void accel_ioctl_end(void);
+extern void accel_cpu_ioctl_begin(CPUState *cpu);
+extern void accel_cpu_ioctl_end(CPUState *cpu);
+
+/*
+ * accel_ioctl_inhibit_begin: start critical section
+ *
+ * This function makes sure that:
+ * 1) incoming accel_{cpu_}ioctl_begin() calls block
+ * 2) wait that all ioctls that were already running reach
+ *    accel_{cpu_}ioctl_end(), kicking vcpus if necessary.
+ *
+ * This allows the caller to access shared data or perform operations without
+ * worrying of concurrent vcpus accesses.
+ */
+extern void accel_ioctl_inhibit_begin(void);
+
+/*
+ * accel_ioctl_inhibit_end: end critical section started by
+ * accel_ioctl_inhibit_begin()
+ *
+ * This function allows blocked accel_{cpu_}ioctl_begin() to continue.
+ */
+extern void accel_ioctl_inhibit_end(void);
+
+#endif /* ACCEL_BLOCKER_H */
diff --git a/util/meson.build b/util/meson.build
index d8d109ff842b..26c73e586be6 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -58,6 +58,7 @@ util_ss.add(files('yank.c'))
 util_ss.add(files('int128.c'))
 util_ss.add(files('memalign.c'))
 util_ss.add(files('interval-tree.c'))
+util_ss.add(files('lockcnt.c'))
 
 if have_user
   util_ss.add(files('selfmap.c'))
@@ -72,7 +73,6 @@ endif
 if have_block or have_ga
   util_ss.add(files('aiocb.c', 'async.c'))
   util_ss.add(files('base64.c'))
-  util_ss.add(files('lockcnt.c'))
   util_ss.add(files('main-loop.c'))
   util_ss.add(files('qemu-coroutine.c', 'qemu-coroutine-lock.c', 'qemu-coroutine-io.c'))
   util_ss.add(files('coroutine-@0@.c'.format(config_host['CONFIG_COROUTINE_BACKEND'])))
-- 
2.38.1


