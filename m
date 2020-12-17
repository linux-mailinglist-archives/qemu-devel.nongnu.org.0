Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7712DD334
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 15:48:37 +0100 (CET)
Received: from localhost ([::1]:33426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpua4-00067V-E2
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 09:48:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kpuRE-0007zC-HD
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:39:28 -0500
Received: from relay.sw.ru ([185.231.240.75]:42784 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kpuR7-0000Iz-Cj
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:39:28 -0500
Received: from [192.168.15.61] (helo=andrey-MS-7B54.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kpuQe-00DOLN-U3; Thu, 17 Dec 2020 17:38:52 +0300
To: qemu-devel@nongnu.org
Subject: [PATCH v8 5/5] migration: introduce 'userfaultfd-wrlat.py' script
Date: Thu, 17 Dec 2020 17:36:54 +0300
Message-Id: <20201217143654.365582-6-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201217143654.365582-1-andrey.gruzdev@virtuozzo.com>
References: <20201217143654.365582-1-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.gruzdev@virtuozzo.com; helo=relay3.sw.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Den Lunev <den@openvz.org>, Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
From: Andrey Gruzdev via <qemu-devel@nongnu.org>

Add BCC/eBPF script to analyze userfaultfd write fault latency distribution.

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
---
 scripts/userfaultfd-wrlat.py | 148 +++++++++++++++++++++++++++++++++++
 1 file changed, 148 insertions(+)
 create mode 100755 scripts/userfaultfd-wrlat.py

diff --git a/scripts/userfaultfd-wrlat.py b/scripts/userfaultfd-wrlat.py
new file mode 100755
index 0000000000..5ffd3c6c9a
--- /dev/null
+++ b/scripts/userfaultfd-wrlat.py
@@ -0,0 +1,148 @@
+#!/usr/bin/python3
+#
+# userfaultfd-wrlat Summarize userfaultfd write fault latencies.
+#                   Events are continuously accumulated for the
+#                   run, while latency distribution histogram is
+#                   dumped each 'interval' seconds.
+#
+#                   For Linux, uses BCC, eBPF.
+#
+# USAGE: userfaultfd-lat [interval [count]]
+#
+# Copyright Virtuozzo GmbH, 2020
+#
+# Authors:
+#   Andrey Gruzdev   <andrey.gruzdev@virtuozzo.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+from __future__ import print_function
+from bcc import BPF
+from ctypes import c_ushort, c_int, c_ulonglong
+from time import sleep
+from sys import argv
+
+def usage():
+    print("USAGE: %s [interval [count]]" % argv[0])
+    exit()
+
+# define BPF program
+bpf_text = """
+#include <uapi/linux/ptrace.h>
+#include <linux/mm.h>
+
+/*
+ * UFFD page fault event descriptor.
+ * Used as a key to BPF_HASH table.
+ */
+struct ev_desc {
+    u64 pid;
+    u64 addr;
+};
+
+BPF_HASH(ev_start, struct ev_desc, u64);
+BPF_HASH(ctx_handle_userfault, u64, u64);
+BPF_HISTOGRAM(ev_delta_hist, u64);
+
+/* Trace UFFD page fault start event. */
+static void do_event_start(u64 pid, u64 address)
+{
+    struct ev_desc desc = { .pid = pid, .addr = address };
+    u64 ts = bpf_ktime_get_ns();
+
+    ev_start.insert(&desc, &ts);
+}
+
+/* Trace UFFD page fault end event. */
+static void do_event_end(u64 pid, u64 address)
+{
+    struct ev_desc desc = { .pid = pid, .addr = address };
+    u64 ts = bpf_ktime_get_ns();
+    u64 *tsp;
+
+    tsp = ev_start.lookup(&desc);
+    if (tsp) {
+        u64 delta = ts - (*tsp);
+        /* Transform time delta to milliseconds */
+        ev_delta_hist.increment(bpf_log2l(delta / 1000000));
+        ev_start.delete(&desc);
+    }
+}
+
+/* KPROBE for handle_userfault(). */
+int probe_handle_userfault(struct pt_regs *ctx, struct vm_fault *vmf,
+        unsigned long reason)
+{
+    /* Trace only UFFD write faults. */
+    if (reason & VM_UFFD_WP) {
+        u64 pid = (u32) bpf_get_current_pid_tgid();
+        u64 addr = vmf->address;
+
+        do_event_start(pid, addr);
+        ctx_handle_userfault.update(&pid, &addr);
+    }
+    return 0;
+}
+
+/* KRETPROBE for handle_userfault(). */
+int retprobe_handle_userfault(struct pt_regs *ctx)
+{
+    u64 pid = (u32) bpf_get_current_pid_tgid();
+    u64 *addr_p;
+
+    /*
+     * Here we just ignore the return value. In case of spurious wakeup
+     * or pending signal we'll still get (at least for v5.8.0 kernel)
+     * VM_FAULT_RETRY or (VM_FAULT_RETRY | VM_FAULT_MAJOR) here.
+     * Anyhow, handle_userfault() would be re-entered if such case happens,
+     * keeping initial timestamp unchanged for the faulting thread.
+     */
+    addr_p = ctx_handle_userfault.lookup(&pid);
+    if (addr_p) {
+        do_event_end(pid, *addr_p);
+        ctx_handle_userfault.delete(&pid);
+    }
+    return 0;
+}
+"""
+
+# arguments
+interval = 10
+count = -1
+if len(argv) > 1:
+    try:
+        interval = int(argv[1])
+        if interval == 0:
+            raise
+        if len(argv) > 2:
+            count = int(argv[2])
+    except:    # also catches -h, --help
+        usage()
+
+# load BPF program
+b = BPF(text=bpf_text)
+# attach KRPOBEs
+b.attach_kprobe(event="handle_userfault", fn_name="probe_handle_userfault")
+b.attach_kretprobe(event="handle_userfault", fn_name="retprobe_handle_userfault")
+
+# header
+print("Tracing UFFD-WP write fault latency... Hit Ctrl-C to end.")
+
+# output
+loop = 0
+do_exit = 0
+while (1):
+    if count > 0:
+        loop += 1
+        if loop > count:
+            exit()
+    try:
+        sleep(interval)
+    except KeyboardInterrupt:
+        pass; do_exit = 1
+
+    print()
+    b["ev_delta_hist"].print_log2_hist("msecs")
+    if do_exit:
+        exit()
-- 
2.25.1


