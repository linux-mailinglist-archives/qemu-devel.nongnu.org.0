Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07826698D25
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 07:37:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSXiI-0003Mk-Ia; Thu, 16 Feb 2023 01:25:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+33d3adc5578b079b0cf9+7116+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pSXhl-0003Cf-79
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 01:25:20 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+33d3adc5578b079b0cf9+7116+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pSXhe-0006vD-1x
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 01:25:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=YPuuSoMgWYz690sH1aLS2/yex/Sce0VuLgfJF8oJSB0=; b=Zgbg6JASy2wyhKGlF15RsseeXW
 xkxN9IG6GZPs0BokEuxu1Vq+UBk1SdUX41IOgSIw+HzU6cW2h9gv8zhlE+5qU+87fqf7BQEjrjzbD
 OOrL0FfMcmpEAsbduQNJ4DiOfnOJ3wKWMf5eOvN1qtnHzftWidq9MAfJHyPBWFaFFMbjSMaL5O2Wk
 Eej4qQsvvyYgmh+w+zuZsGNHd6KysuOXpO0TOZg1j/XxMQY+eIkjIM0JXNrNeLl6GTO7QHUjm8PWl
 dZd/oZqrSsALt7JSzj0v4BZWaZnUcr1D4ExoLKkHl0OTE/SSnHbfVkIgCFIhlItm5AHsyEF1ewnY0
 TvCM8yLA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pSXhG-0089x8-MJ; Thu, 16 Feb 2023 06:24:47 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pSXhG-008w6S-24; Thu, 16 Feb 2023 06:24:46 +0000
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
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
Subject: [PATCH v11 09/59] i386/xen: handle guest hypercalls
Date: Thu, 16 Feb 2023 06:23:54 +0000
Message-Id: <20230216062444.2129371-10-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230216062444.2129371-1-dwmw2@infradead.org>
References: <20230216062444.2129371-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+33d3adc5578b079b0cf9+7116+infradead.org+dwmw2@casper.srs.infradead.org;
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

This means handling the new exit reason for Xen but still
crashing on purpose. As we implement each of the hypercalls
we will then return the right return code.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
[dwmw2: Add CPL to hypercall tracing, disallow hypercalls from CPL > 0]
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 target/i386/kvm/kvm.c        |  5 ++++
 target/i386/kvm/trace-events |  3 +++
 target/i386/kvm/xen-emu.c    | 44 ++++++++++++++++++++++++++++++++++++
 target/i386/kvm/xen-emu.h    |  1 +
 4 files changed, 53 insertions(+)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 165fa5232d..a7ba3476ac 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -5478,6 +5478,11 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
         assert(run->msr.reason == KVM_MSR_EXIT_REASON_FILTER);
         ret = kvm_handle_wrmsr(cpu, run);
         break;
+#ifdef CONFIG_XEN_EMU
+    case KVM_EXIT_XEN:
+        ret = kvm_xen_handle_exit(cpu, &run->xen);
+        break;
+#endif
     default:
         fprintf(stderr, "KVM: unknown exit reason %d\n", run->exit_reason);
         ret = -1;
diff --git a/target/i386/kvm/trace-events b/target/i386/kvm/trace-events
index 7c369db1e1..cd6f842b1f 100644
--- a/target/i386/kvm/trace-events
+++ b/target/i386/kvm/trace-events
@@ -5,3 +5,6 @@ kvm_x86_fixup_msi_error(uint32_t gsi) "VT-d failed to remap interrupt for GSI %"
 kvm_x86_add_msi_route(int virq) "Adding route entry for virq %d"
 kvm_x86_remove_msi_route(int virq) "Removing route entry for virq %d"
 kvm_x86_update_msi_routes(int num) "Updated %d MSI routes"
+
+# xen-emu.c
+kvm_xen_hypercall(int cpu, uint8_t cpl, uint64_t input, uint64_t a0, uint64_t a1, uint64_t a2, uint64_t ret) "xen_hypercall: cpu %d cpl %d input %" PRIu64 " a0 0x%" PRIx64 " a1 0x%" PRIx64 " a2 0x%" PRIx64" ret 0x%" PRIx64
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 4883b95d9d..476f464ee2 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -10,10 +10,12 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "sysemu/kvm_int.h"
 #include "sysemu/kvm_xen.h"
 #include "kvm/kvm_i386.h"
 #include "xen-emu.h"
+#include "trace.h"
 
 int kvm_xen_init(KVMState *s, uint32_t hypercall_msr)
 {
@@ -84,3 +86,45 @@ uint32_t kvm_xen_get_caps(void)
 {
     return kvm_state->xen_caps;
 }
+
+static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
+{
+    uint16_t code = exit->u.hcall.input;
+
+    if (exit->u.hcall.cpl > 0) {
+        exit->u.hcall.result = -EPERM;
+        return true;
+    }
+
+    switch (code) {
+    default:
+        return false;
+    }
+}
+
+int kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
+{
+    if (exit->type != KVM_EXIT_XEN_HCALL) {
+        return -1;
+    }
+
+    if (!do_kvm_xen_handle_exit(cpu, exit)) {
+        /*
+         * Some hypercalls will be deliberately "implemented" by returning
+         * -ENOSYS. This case is for hypercalls which are unexpected.
+         */
+        exit->u.hcall.result = -ENOSYS;
+        qemu_log_mask(LOG_UNIMP, "Unimplemented Xen hypercall %"
+                      PRId64 " (0x%" PRIx64 " 0x%" PRIx64 " 0x%" PRIx64 ")\n",
+                      (uint64_t)exit->u.hcall.input,
+                      (uint64_t)exit->u.hcall.params[0],
+                      (uint64_t)exit->u.hcall.params[1],
+                      (uint64_t)exit->u.hcall.params[2]);
+    }
+
+    trace_kvm_xen_hypercall(CPU(cpu)->cpu_index, exit->u.hcall.cpl,
+                            exit->u.hcall.input, exit->u.hcall.params[0],
+                            exit->u.hcall.params[1], exit->u.hcall.params[2],
+                            exit->u.hcall.result);
+    return 0;
+}
diff --git a/target/i386/kvm/xen-emu.h b/target/i386/kvm/xen-emu.h
index d62f1d8ed8..21faf6bf38 100644
--- a/target/i386/kvm/xen-emu.h
+++ b/target/i386/kvm/xen-emu.h
@@ -25,5 +25,6 @@
 
 int kvm_xen_init(KVMState *s, uint32_t hypercall_msr);
 int kvm_xen_init_vcpu(CPUState *cs);
+int kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit);
 
 #endif /* QEMU_I386_KVM_XEN_EMU_H */
-- 
2.39.0


