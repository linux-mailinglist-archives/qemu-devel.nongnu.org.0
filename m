Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBA6313B8B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 18:53:29 +0100 (CET)
Received: from localhost ([::1]:44642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Aj2-0000Cy-3W
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 12:53:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l94kK-0001nO-BF
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:30:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l94k2-0002Iy-H8
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:30:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612783802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Se5PgBvmj/igHU2KtSDhk45/M6qHCrQMbFcqOM72qf0=;
 b=CJ9Hduhfz3nwiz/YRE1b/aGV4D2aFu7JXSf0m/Ku4hAU7wcNNpLerapgN7csWvgBLQ9CD0
 t8Bt75gqYazBCRcGzYTmqfMGjlZER8anGoFYNb4MUs5QQdjxNTmyXmoMngd5S3cvw0s6Mb
 cpCjL80W5KvB5UWjLHawF4DAnpdgAJU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-3VaSbUSnNCWkWC3BughC1Q-1; Mon, 08 Feb 2021 06:29:59 -0500
X-MC-Unique: 3VaSbUSnNCWkWC3BughC1Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0279080402E;
 Mon,  8 Feb 2021 11:29:58 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-22.ams2.redhat.com
 [10.36.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0245B1002388;
 Mon,  8 Feb 2021 11:29:55 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, andrey.gruzdev@virtuozzo.com, berrange@redhat.com,
 gaojinhao@huawei.com, armbru@redhat.com, mst@redhat.com, philmd@redhat.com,
 wainersm@redhat.com, s.reiter@proxmox.com
Subject: [PULL 08/27] migration: introduce 'userfaultfd-wrlat.py' script
Date: Mon,  8 Feb 2021 11:28:59 +0000
Message-Id: <20210208112918.185058-9-dgilbert@redhat.com>
In-Reply-To: <20210208112918.185058-1-dgilbert@redhat.com>
References: <20210208112918.185058-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>

Add BCC/eBPF script to analyze userfaultfd write fault latency distribution.

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210129101407.103458-6-andrey.gruzdev@virtuozzo.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 scripts/userfaultfd-wrlat.py | 122 +++++++++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)
 create mode 100755 scripts/userfaultfd-wrlat.py

diff --git a/scripts/userfaultfd-wrlat.py b/scripts/userfaultfd-wrlat.py
new file mode 100755
index 0000000000..0684be4e04
--- /dev/null
+++ b/scripts/userfaultfd-wrlat.py
@@ -0,0 +1,122 @@
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
+BPF_HASH(ev_start, u32, u64);
+BPF_HISTOGRAM(ev_delta_hist, u64);
+
+/* Trace UFFD page fault start event. */
+static void do_event_start()
+{
+    /* Using "(u32)" to drop group ID which is upper 32 bits */
+    u32 tid = (u32) bpf_get_current_pid_tgid();
+    u64 ts = bpf_ktime_get_ns();
+
+    ev_start.update(&tid, &ts);
+}
+
+/* Trace UFFD page fault end event. */
+static void do_event_end()
+{
+    /* Using "(u32)" to drop group ID which is upper 32 bits */
+    u32 tid = (u32) bpf_get_current_pid_tgid();
+    u64 ts = bpf_ktime_get_ns();
+    u64 *tsp;
+
+    tsp = ev_start.lookup(&tid);
+    if (tsp) {
+        u64 delta = ts - (*tsp);
+        /* Transform time delta to milliseconds */
+        ev_delta_hist.increment(bpf_log2l(delta / 1000000));
+        ev_start.delete(&tid);
+    }
+}
+
+/* KPROBE for handle_userfault(). */
+int probe_handle_userfault(struct pt_regs *ctx, struct vm_fault *vmf,
+        unsigned long reason)
+{
+    /* Trace only UFFD write faults. */
+    if (reason & VM_UFFD_WP) {
+        do_event_start();
+    }
+    return 0;
+}
+
+/* KRETPROBE for handle_userfault(). */
+int retprobe_handle_userfault(struct pt_regs *ctx)
+{
+    do_event_end();
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
2.29.2


