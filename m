Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C61D26A44F9
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:44:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeYD-000188-Hj; Mon, 27 Feb 2023 09:32:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+6644499f1bfadfc93882+7127+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pWeVi-0005wr-GN
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:29:57 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+6644499f1bfadfc93882+7127+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pWeVX-0004ad-F9
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:29:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=5Y43TprArj3IJ07m26R9E5OjFKd4faxvQGMXbVPgq2o=; b=acS5D/ZZkMDzKd4HI9ZXh1w1tw
 JWt4SnFOAZbf3/ImusUEoAaYTKheSRJOK5urd/Z1JqTIsYMbhXRoygtN1vVkS8qKZxovpwBSfVL/s
 pf6UG0CMdO9mt/nvSzav5NEmot4jeV5KLscL+fHgdTQ0ti8H76+q/wFEVD6VDGP2cNXt3zv46z0o4
 Gc+NpvAx2pLrXLOSEKhygyNrtWi2h9yddn6Tqa3KVlQ5kTJodl6YD9lz+G9Eoe3xjvYyDsI0aB1rS
 vB4fGbeyIYVLU2Q4hbflTvyApZM3B7V8E2o3YSXp8dq29pp7bejsd0SF4zAQscpR6vG4+c87xEuUY
 e6ce/lBA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pWeV5-00EFBj-1Q; Mon, 27 Feb 2023 14:29:11 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pWeV5-0027Ad-13; Mon, 27 Feb 2023 14:29:11 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
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
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com
Subject: [PATCH v14 11/60] i386/xen: implement HYPERVISOR_sched_op,
 SCHEDOP_shutdown
Date: Mon, 27 Feb 2023 14:28:19 +0000
Message-Id: <20230227142908.503517-12-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227142908.503517-1-dwmw2@infradead.org>
References: <20230227142908.503517-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+6644499f1bfadfc93882+7127+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
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
 include/sysemu/kvm_xen.h     |  1 +
 target/i386/kvm/trace-events |  1 +
 target/i386/kvm/xen-emu.c    | 75 ++++++++++++++++++++++++++++++++++++
 3 files changed, 77 insertions(+)

diff --git a/include/sysemu/kvm_xen.h b/include/sysemu/kvm_xen.h
index 296533f2d5..5dffcc0542 100644
--- a/include/sysemu/kvm_xen.h
+++ b/include/sysemu/kvm_xen.h
@@ -12,6 +12,7 @@
 #ifndef QEMU_SYSEMU_KVM_XEN_H
 #define QEMU_SYSEMU_KVM_XEN_H
 
+int kvm_xen_soft_reset(void);
 uint32_t kvm_xen_get_caps(void);
 
 #define kvm_xen_has_cap(cap) (!!(kvm_xen_get_caps() &           \
diff --git a/target/i386/kvm/trace-events b/target/i386/kvm/trace-events
index cd6f842b1f..bb732e1da8 100644
--- a/target/i386/kvm/trace-events
+++ b/target/i386/kvm/trace-events
@@ -8,3 +8,4 @@ kvm_x86_update_msi_routes(int num) "Updated %d MSI routes"
 
 # xen-emu.c
 kvm_xen_hypercall(int cpu, uint8_t cpl, uint64_t input, uint64_t a0, uint64_t a1, uint64_t a2, uint64_t ret) "xen_hypercall: cpu %d cpl %d input %" PRIu64 " a0 0x%" PRIx64 " a1 0x%" PRIx64 " a2 0x%" PRIx64" ret 0x%" PRIx64
+kvm_xen_soft_reset(void) ""
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 56b80a7880..4ed833656f 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -11,14 +11,17 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "qemu/main-loop.h"
 #include "sysemu/kvm_int.h"
 #include "sysemu/kvm_xen.h"
 #include "kvm/kvm_i386.h"
 #include "exec/address-spaces.h"
 #include "xen-emu.h"
 #include "trace.h"
+#include "sysemu/runstate.h"
 
 #include "hw/xen/interface/version.h"
+#include "hw/xen/interface/sched.h"
 
 static int kvm_gva_rw(CPUState *cs, uint64_t gva, void *_buf, size_t sz,
                       bool is_write)
@@ -170,6 +173,75 @@ static bool kvm_xen_hcall_xen_version(struct kvm_xen_exit *exit, X86CPU *cpu,
     return true;
 }
 
+int kvm_xen_soft_reset(void)
+{
+    assert(qemu_mutex_iothread_locked());
+
+    trace_kvm_xen_soft_reset();
+
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
+        qemu_mutex_lock_iothread();
+        ret = kvm_xen_soft_reset();
+        qemu_mutex_unlock_iothread();
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
@@ -180,6 +252,9 @@ static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
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


