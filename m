Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 736DB4554A8
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 07:16:15 +0100 (CET)
Received: from localhost ([::1]:46724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnaiU-0002aa-AI
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 01:16:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1mnabB-0005EP-Il
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 01:08:41 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.222]:51767
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1mnab9-0000I5-2s
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 01:08:41 -0500
HMM_SOURCE_IP: 172.18.0.48:38028.1063050567
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 016352800AA;
 Thu, 18 Nov 2021 14:08:30 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id e0699463b25243f29b44c3ffd0e4a587 for
 qemu-devel@nongnu.org; Thu, 18 Nov 2021 14:08:32 CST
X-Transaction-ID: e0699463b25243f29b44c3ffd0e4a587
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v1 3/3] cpus-common: implement dirty restraint on vCPU
Date: Thu, 18 Nov 2021 14:07:22 +0800
Message-Id: <cc795c22ef5620e7e33b716bb68ef411802cb6ec.1637214721.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1637214721.git.huangy81@chinatelecom.cn>
References: <cover.1637214721.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1637214721.git.huangy81@chinatelecom.cn>
References: <cover.1637214721.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.222;
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
Cc: David Hildenbrand <david@redhat.com>, Hyman <huangy81@chinatelecom.cn>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

implement dirtyrate calculation periodically basing on dirty-ring
and throttle vCPU until it reachs the quota dirtyrate given by user.

introduce qmp commands dirty-restraint/dirty-restraint-cancel to
impose/cancel dirty restraint on vCPU

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 cpus-common.c         | 45 +++++++++++++++++++++++++++++++++++++++++++++
 include/hw/core/cpu.h |  7 +++++++
 qapi/misc.json        | 44 ++++++++++++++++++++++++++++++++++++++++++++
 softmmu/vl.c          |  1 +
 4 files changed, 97 insertions(+)

diff --git a/cpus-common.c b/cpus-common.c
index 6e73d3e..3c4dbbb 100644
--- a/cpus-common.c
+++ b/cpus-common.c
@@ -23,6 +23,11 @@
 #include "hw/core/cpu.h"
 #include "sysemu/cpus.h"
 #include "qemu/lockable.h"
+#include "sysemu/dirtyrestraint.h"
+#include "sysemu/cpu-throttle.h"
+#include "sysemu/kvm.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-misc.h"
 
 static QemuMutex qemu_cpu_list_lock;
 static QemuCond exclusive_cond;
@@ -352,3 +357,43 @@ void process_queued_cpu_work(CPUState *cpu)
     qemu_mutex_unlock(&cpu->work_mutex);
     qemu_cond_broadcast(&qemu_work_cond);
 }
+
+void qmp_dirty_restraint(int64_t idx,
+                         uint64_t dirtyrate,
+                         Error **errp)
+{
+    if (!kvm_dirty_ring_enabled()) {
+        error_setg(errp, "dirty ring not enable, needed by dirty restraint!");
+        return;
+    }
+
+    dirtyrestraint_calc_start();
+    dirtyrestraint_vcpu(idx, dirtyrate);
+
+    return;
+}
+
+void qmp_dirty_restraint_cancel(int64_t idx,
+                                Error **errp)
+{
+    if (!kvm_dirty_ring_enabled()) {
+        error_setg(errp, "dirty ring not enable, needed by dirty restraint!");
+        return;
+    }
+
+    dirtyrestraint_cancel_vcpu(idx);
+
+    return;
+}
+
+void dirtyrestraint_setup(int max_cpus)
+{
+    if (!kvm_dirty_ring_enabled()) {
+        return;
+    }
+
+    dirtyrestraint_calc_state_init(max_cpus);
+    dirtyrestraint_state_init(max_cpus);
+
+    return;
+}
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index e948e81..d2a3978 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -881,6 +881,13 @@ void end_exclusive(void);
  */
 void qemu_init_vcpu(CPUState *cpu);
 
+/**
+ * dirtyrestraint_setup:
+ *
+ * dirtyrestraint setup.
+ */
+void dirtyrestraint_setup(int max_cpus);
+
 #define SSTEP_ENABLE  0x1  /* Enable simulated HW single stepping */
 #define SSTEP_NOIRQ   0x2  /* Do not use IRQ while single stepping */
 #define SSTEP_NOTIMER 0x4  /* Do not Timers while single stepping */
diff --git a/qapi/misc.json b/qapi/misc.json
index 358548a..6a60b2e 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -527,3 +527,47 @@
  'data': { '*option': 'str' },
  'returns': ['CommandLineOptionInfo'],
  'allow-preconfig': true }
+
+##
+# @DirtyRateQuotaVcpu:
+#
+# Dirty rate of vcpu.
+#
+# @idx: vcpu index.
+#
+# @dirtyrate: dirty rate.
+#
+# Since: 6.3
+#
+##
+{ 'struct': 'DirtyRateQuotaVcpu',
+  'data': { 'idx': 'int', 'dirtyrate': 'uint64' } }
+
+##
+# @dirty-restraint:
+#
+# Since: 6.3
+#
+# Example:
+#   {"execute": "dirty-restraint"}
+#    "arguments": { "idx": "cpu-index",
+#                   "dirtyrate": "quota-dirtyrate" } }
+#
+##
+{ 'command': 'dirty-restraint',
+  'data': 'DirtyRateQuotaVcpu' }
+
+##
+# @dirty-restraint-cancel:
+#
+# @idx: vcpu index
+#
+# Since: 6.3
+#
+# Example:
+#   {"execute": "dirty-restraint-cancel"}
+#    "arguments": { "idx": "cpu-index" } }
+#
+##
+{ 'command': 'dirty-restraint-cancel',
+  'data': { 'idx': 'int' } }
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 1159a64..ab914cb 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3776,5 +3776,6 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_init_displays();
     accel_setup_post(current_machine);
     os_setup_post();
+    dirtyrestraint_setup(current_machine->smp.max_cpus);
     resume_mux_open();
 }
-- 
1.8.3.1


