Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7677457D27
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 11:38:10 +0100 (CET)
Received: from localhost ([::1]:39450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moNl3-0005vE-0L
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 05:38:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1moNk5-0004SE-JM
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 05:37:09 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.226]:42475
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1moNk0-0004CF-Nb
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 05:37:08 -0500
HMM_SOURCE_IP: 172.18.0.218:60404.1303875965
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.138.181.165 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 12DC828009F;
 Sat, 20 Nov 2021 18:36:51 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id eabdad99657a4a8aaadc411175c6072e for
 qemu-devel@nongnu.org; Sat, 20 Nov 2021 18:36:57 CST
X-Transaction-ID: eabdad99657a4a8aaadc411175c6072e
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v3 3/3] cpus-common: implement dirty limit on vCPU
Date: Sat, 20 Nov 2021 18:36:40 +0800
Message-Id: <99ea5e76926164d60a4ee62d0a1831823bc0d7a9.1637403404.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1637403404.git.huangy81@chinatelecom.cn>
References: <cover.1637403404.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1637403404.git.huangy81@chinatelecom.cn>
References: <cover.1637403404.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.226;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Hyman <huangy81@chinatelecom.cn>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus ArmBruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

implement dirtyrate calculation periodically basing on
dirty-ring and throttle vCPU until it reachs the quota
dirtyrate given by user.

introduce qmp commands set-dirty-limit/cancel-dirty-limit to
set/cancel dirty limit on vCPU.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 cpus-common.c         | 41 +++++++++++++++++++++++++++++++++++++++++
 include/hw/core/cpu.h |  9 +++++++++
 qapi/misc.json        | 39 +++++++++++++++++++++++++++++++++++++++
 softmmu/vl.c          |  1 +
 4 files changed, 90 insertions(+)

diff --git a/cpus-common.c b/cpus-common.c
index 6e73d3e..e32612b 100644
--- a/cpus-common.c
+++ b/cpus-common.c
@@ -23,6 +23,11 @@
 #include "hw/core/cpu.h"
 #include "sysemu/cpus.h"
 #include "qemu/lockable.h"
+#include "sysemu/dirtylimit.h"
+#include "sysemu/cpu-throttle.h"
+#include "sysemu/kvm.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-misc.h"
 
 static QemuMutex qemu_cpu_list_lock;
 static QemuCond exclusive_cond;
@@ -352,3 +357,39 @@ void process_queued_cpu_work(CPUState *cpu)
     qemu_mutex_unlock(&cpu->work_mutex);
     qemu_cond_broadcast(&qemu_work_cond);
 }
+
+void qmp_set_dirty_limit(int64_t idx,
+                         uint64_t dirtyrate,
+                         Error **errp)
+{
+    if (!kvm_dirty_ring_enabled()) {
+        error_setg(errp, "dirty ring not enable, needed by dirty restraint!");
+        return;
+    }
+
+    dirtylimit_calc();
+    dirtylimit_vcpu(idx, dirtyrate);
+}
+
+void qmp_cancel_dirty_limit(int64_t idx,
+                            Error **errp)
+{
+    if (!kvm_dirty_ring_enabled()) {
+        error_setg(errp, "dirty ring not enable, needed by dirty restraint!");
+        return;
+    }
+
+    if (unlikely(!dirtylimit_cancel_vcpu(idx))) {
+        dirtylimit_calc_quit();
+    }
+}
+
+void dirtylimit_setup(int max_cpus)
+{
+    if (!kvm_dirty_ring_enabled()) {
+        return;
+    }
+
+    dirtylimit_calc_state_init(max_cpus);
+    dirtylimit_state_init(max_cpus);
+}
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index e948e81..11df012 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -881,6 +881,15 @@ void end_exclusive(void);
  */
 void qemu_init_vcpu(CPUState *cpu);
 
+/**
+ * dirtylimit_setup:
+ *
+ * Initializes the global state of dirtylimit calculation and
+ * dirtylimit itself. This is prepared for vCPU dirtylimit which
+ * could be triggered during vm lifecycle.
+ */
+void dirtylimit_setup(int max_cpus);
+
 #define SSTEP_ENABLE  0x1  /* Enable simulated HW single stepping */
 #define SSTEP_NOIRQ   0x2  /* Do not use IRQ while single stepping */
 #define SSTEP_NOTIMER 0x4  /* Do not Timers while single stepping */
diff --git a/qapi/misc.json b/qapi/misc.json
index 358548a..98e6001 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -527,3 +527,42 @@
  'data': { '*option': 'str' },
  'returns': ['CommandLineOptionInfo'],
  'allow-preconfig': true }
+
+##
+# @set-dirty-limit:
+#
+# This command could be used to cap the vCPU memory load, which is also
+# refered as dirtyrate. One should use "calc-dirty-rate" with "dirty-ring"
+# and to calculate vCPU dirtyrate and query it with "query-dirty-rate".
+# Once getting the vCPU current dirtyrate, "set-dirty-limit" can be used
+# to set the upper limit of dirtyrate for the interested vCPU.
+#
+# @idx: vCPU index to set dirtylimit.
+#
+# @dirtyrate: upper limit of drityrate the specified vCPU could reach (MB/s)
+#
+# Since: 6.3
+#
+# Example:
+#   {"execute": "set-dirty-limit"}
+#    "arguments": { "idx": 0,
+#                   "dirtyrate": 200 } }
+#
+##
+{ 'command': 'set-dirty-limit',
+  'data': { 'idx': 'int', 'dirtyrate': 'uint64' } }
+
+##
+# @cancel-dirty-limit:
+#
+# @idx: vCPU index to canceled the dirtylimit
+#
+# Since: 6.3
+#
+# Example:
+#   {"execute": "cancel-dirty-limit"}
+#    "arguments": { "idx": 0 } }
+#
+##
+{ 'command': 'cancel-dirty-limit',
+  'data': { 'idx': 'int' } }
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 1159a64..170ee23 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3776,5 +3776,6 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_init_displays();
     accel_setup_post(current_machine);
     os_setup_post();
+    dirtylimit_setup(current_machine->smp.max_cpus);
     resume_mux_open();
 }
-- 
1.8.3.1


