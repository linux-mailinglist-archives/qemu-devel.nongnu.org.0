Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4038966D16E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 23:08:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHXV7-0006wE-7Z; Mon, 16 Jan 2023 16:58:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+fb0b8ce1ba8490165fd5+7085+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pHXUt-0006lE-1B
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 16:58:31 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+fb0b8ce1ba8490165fd5+7085+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pHXUn-0003Zp-2M
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 16:58:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=bF2AJDSMEQzQ4zEnAElhexkNV1t1BrfGIsr7OSUVI7s=; b=bfSv9EAyp4zfGTTDXzy9f5KUy1
 XdAXDqxTDfmrKCOrq4GCCs9pXetJ5x7KZsy6AfY45cPy4hwHw03ih+JKzkfYpPnM9GAKLoCh84vn6
 9b7wjBuv/bYYAI4DJzUmg7mGZAZfMb+Y5ge9WLn/1ERRx+dkf/7r165AtRiY38sqF5FvBQBfujHrI
 enemCZ8lyTrEMGTEIsjlrFddbwDzgkOhHScJCYRQ1Va2IUjz2C4MVcbF6OhprR0BpxTOWJ13XlxQf
 y+ra4RYal3+5X7CeqWJM1yRVdkGe8rqq1TL4I4YwmdWdqXzpFKa8CN7xMHcO2qpdq8aVVTYuHv8CX
 BLlibIHA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pHXUj-0097V7-NY; Mon, 16 Jan 2023 21:58:26 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pHXUW-004iOM-00; Mon, 16 Jan 2023 21:58:08 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
Subject: [PATCH v7 11/51] i386/xen: implement HYPERVISOR_sched_op,
 SCHEDOP_shutdown
Date: Mon, 16 Jan 2023 21:57:25 +0000
Message-Id: <20230116215805.1123514-12-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116215805.1123514-1-dwmw2@infradead.org>
References: <20230116215805.1123514-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+fb0b8ce1ba8490165fd5+7085+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Joao Martins <joao.m.martins@oracle.com>

It allows to shutdown itself via hypercall with any of the 3 reasons:
  1) self-reboot
  2) shutdown
  3) crash

Implementing SCHEDOP_shutdown sub op let us handle crashes gracefully rather
than leading to triple faults if it remains unimplemented.

In addition, the SHUTDOWN_soft_reset reason is used for kexec, to reset
Xen shared pages and other enlightenments and leave a clean slate for the
new kernel without the hypervisor helpfully writing information at
unexpected addresses.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
[dwmw2: Ditch sched_op_compat which was never available for HVM guests,
        Add SCHEDOP_soft_reset]
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 target/i386/kvm/xen-emu.c | 68 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 1dea6feb90..5f2b55ef10 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -17,8 +17,10 @@
 #include "exec/address-spaces.h"
 #include "xen-emu.h"
 #include "trace.h"
+#include "sysemu/runstate.h"
 
 #include "standard-headers/xen/version.h"
+#include "standard-headers/xen/sched.h"
 
 static int kvm_gva_rw(CPUState *cs, uint64_t gva, void *_buf, size_t sz,
                       bool is_write)
@@ -170,6 +172,69 @@ static bool kvm_xen_hcall_xen_version(struct kvm_xen_exit *exit, X86CPU *cpu,
     return true;
 }
 
+static int kvm_xen_soft_reset(void)
+{
+    /* Nothing to reset... yet. */
+    return 0;
+}
+
+static int schedop_shutdown(CPUState *cs, uint64_t arg)
+{
+    struct sched_shutdown shutdown;
+    int ret = 0;
+
+    /* No need for 32/64 compat handling */
+    qemu_build_assert(sizeof(shutdown) == 4);
+
+    if (kvm_copy_from_gva(cs, arg, &shutdown, sizeof(shutdown))) {
+        return -EFAULT;
+    }
+
+    switch (shutdown.reason) {
+    case SHUTDOWN_crash:
+        cpu_dump_state(cs, stderr, CPU_DUMP_CODE);
+        qemu_system_guest_panicked(NULL);
+        break;
+
+    case SHUTDOWN_reboot:
+        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+        break;
+
+    case SHUTDOWN_poweroff:
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+        break;
+
+    case SHUTDOWN_soft_reset:
+        ret = kvm_xen_soft_reset();
+        break;
+
+    default:
+        ret = -EINVAL;
+        break;
+    }
+
+    return ret;
+}
+
+static bool kvm_xen_hcall_sched_op(struct kvm_xen_exit *exit, X86CPU *cpu,
+                                   int cmd, uint64_t arg)
+{
+    CPUState *cs = CPU(cpu);
+    int err = -ENOSYS;
+
+    switch (cmd) {
+    case SCHEDOP_shutdown:
+        err = schedop_shutdown(cs, arg);
+        break;
+
+    default:
+        return false;
+    }
+
+    exit->u.hcall.result = err;
+    return true;
+}
+
 static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
 {
     uint16_t code = exit->u.hcall.input;
@@ -180,6 +245,9 @@ static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
     }
 
     switch (code) {
+    case __HYPERVISOR_sched_op:
+        return kvm_xen_hcall_sched_op(exit, cpu, exit->u.hcall.params[0],
+                                      exit->u.hcall.params[1]);
     case __HYPERVISOR_xen_version:
         return kvm_xen_hcall_xen_version(exit, cpu, exit->u.hcall.params[0],
                                          exit->u.hcall.params[1]);
-- 
2.39.0


