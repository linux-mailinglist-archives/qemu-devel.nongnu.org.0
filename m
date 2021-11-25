Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 115C045DE9F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 17:30:27 +0100 (CET)
Received: from localhost ([::1]:45082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqHdi-0001VQ-4p
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 11:30:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1mqHbg-0007rE-7S
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 11:28:20 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:41527
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1mqHbZ-0005yP-8y
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 11:28:19 -0500
HMM_SOURCE_IP: 172.18.0.188:42636.659795330
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.98.21 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 056A328009F;
 Fri, 26 Nov 2021 00:28:04 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id 80c7c7e80c4f421d904a6abdb832d4d6 for
 qemu-devel@nongnu.org; Fri, 26 Nov 2021 00:28:11 CST
X-Transaction-ID: 80c7c7e80c4f421d904a6abdb832d4d6
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v6 3/3] cpus-common: implement dirty page limit on vCPU
Date: Fri, 26 Nov 2021 00:27:52 +0800
Message-Id: <91286fcfc24795385fe4df0d69a48c34f8eac942.1637857372.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1637856472.git.huangy81@chinatelecom.cn>
References: <cover.1637856472.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1637857372.git.huangy81@chinatelecom.cn>
References: <cover.1637857372.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, FORGED_SPF_HELO=1,
 KHOP_HELO_FCRDNS=0.023, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

Implement dirtyrate calculation periodically basing on
dirty-ring and throttle vCPU until it reachs the quota
dirty page rate given by user.

Introduce qmp commands set-dirty-limit/cancel-dirty-limit to
set/cancel dirty page limit on vCPU.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 cpus-common.c         | 41 +++++++++++++++++++++++++++++++++++++++++
 include/hw/core/cpu.h |  9 +++++++++
 qapi/migration.json   | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 softmmu/vl.c          |  1 +
 4 files changed, 98 insertions(+)

diff --git a/cpus-common.c b/cpus-common.c
index 6e73d3e..3c156b3 100644
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
+#include "qapi/qapi-commands-migration.h"
 
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
+    if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
+        error_setg(errp, "setting a dirty page limit requires support from dirty ring");
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
+    if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
+        error_setg(errp, "no need to cancel a dirty page limit as dirty ring not enabled");
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
+    if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
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
diff --git a/qapi/migration.json b/qapi/migration.json
index bbfd48c..2b0fe19 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1850,6 +1850,53 @@
 { 'command': 'query-dirty-rate', 'returns': 'DirtyRateInfo' }
 
 ##
+# @set-dirty-limit:
+#
+# Set the upper limit of dirty page rate for a vCPU.
+#
+# This command could be used to cap the vCPU memory load, which is also
+# refered as "dirty page rate". Users can use set-dirty-limit unconditionally,
+# but if one want to know which vCPU is in high memory load and which vCPU
+# should be limited, using calc-dirty-rate command with dirty-ring mode maybe
+# an availiable method. Note that this command requires support from dirty
+# ring, which means property "dirty-ring-size" of accelerator object "kvm"
+# must be set.
+#
+# @cpu-index: vCPU index to set dirty page limit.
+#
+# @dirty-rate: upper limit for the specified vCPU's dirty page rate (MB/s)
+#
+# Since: 7.0
+#
+# Example:
+#   {"execute": "set-dirty-limit"}
+#    "arguments": { "cpu-index": 0,
+#                   "dirty-rate": 200 } }
+#
+##
+{ 'command': 'set-dirty-limit',
+  'data': { 'cpu-index': 'int', 'dirty-rate': 'uint64' } }
+
+##
+# @cancel-dirty-limit:
+#
+# Cancel the dirty page limit for the vCPU which has been set with
+# set-dirty-limit command. Note that this command requires support from
+# dirty ring, same as the "set-dirty-limit" command.
+#
+# @cpu-index: vCPU index to cancel the dirty page limit
+#
+# Since: 7.0
+#
+# Example:
+#   {"execute": "cancel-dirty-limit"}
+#    "arguments": { "cpu-index": 0 } }
+#
+##
+{ 'command': 'cancel-dirty-limit',
+  'data': { 'cpu-index': 'int' } }
+
+##
 # @snapshot-save:
 #
 # Save a VM snapshot
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 620a1f1..0f83ce3 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3777,5 +3777,6 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_init_displays();
     accel_setup_post(current_machine);
     os_setup_post();
+    dirtylimit_setup(current_machine->smp.max_cpus);
     resume_mux_open();
 }
-- 
1.8.3.1


