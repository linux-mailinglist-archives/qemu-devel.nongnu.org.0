Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D456480AE
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 11:12:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3a8T-0002lQ-O2; Fri, 09 Dec 2022 04:57:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+00235e7d7be18c3eb674+7047+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p3a7N-0002SZ-NA
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:56:35 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+00235e7d7be18c3eb674+7047+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p3a7J-0006pI-Vy
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:56:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=sui8yvN/mWU9WIOwI6TBQRc/VfVTZIKVB44fUAxa1Pg=; b=Xu1Uj1T1H5HIjxL2zHJXosNAma
 Qbr4aZ6ID9HH/o+Hruj7VPeEM4I8Ef3Kij896Rsnk9mUGfi9IoR1kbNdWmH2JmxPjNFh7rt+voR+K
 rUSGyfElpXIuLI9UGRY6SngxAX8MjV1vo8aQiIuaKbkLik/F8PAEKWqksxt0SleUTia3R9KuDk9D7
 JUDqIhTqdBzKUYco4/HvLMNZ/Y/pcjuWZkon2FA0BTzI1IhxQZ9iRITFVWlaFOm/4UMm8GIwQ1zsO
 kg4LkYnzqe2ee74LGnnr4r4dN7+IEwyB8+ghO7z4ZLyz7tZAH3AH7LQ3jVIE4bDoyDLEjRMbh208e
 ckvAt0qw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p3a7G-007tiT-Ch; Fri, 09 Dec 2022 09:56:26 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p3a77-002tYo-Vx; Fri, 09 Dec 2022 09:56:17 +0000
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
 Claudio Fontana <cfontana@suse.de>
Subject: [RFC PATCH v2 10/22] i386/xen: handle guest hypercalls
Date: Fri,  9 Dec 2022 09:56:00 +0000
Message-Id: <20221209095612.689243-11-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221209095612.689243-1-dwmw2@infradead.org>
References: <20221209095612.689243-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+00235e7d7be18c3eb674+7047+infradead.org+dwmw2@casper.srs.infradead.org;
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
 target/i386/kvm/kvm.c    |  5 +++++
 target/i386/trace-events |  3 +++
 target/i386/xen.c        | 39 +++++++++++++++++++++++++++++++++++++++
 target/i386/xen.h        |  1 +
 4 files changed, 48 insertions(+)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 0d3eddf9de..ebde6bc204 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -5471,6 +5471,11 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
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
diff --git a/target/i386/trace-events b/target/i386/trace-events
index 2cd8726eeb..1bf9558811 100644
--- a/target/i386/trace-events
+++ b/target/i386/trace-events
@@ -11,3 +11,6 @@ kvm_sev_launch_measurement(const char *value) "data %s"
 kvm_sev_launch_finish(void) ""
 kvm_sev_launch_secret(uint64_t hpa, uint64_t hva, uint64_t secret, int len) "hpa 0x%" PRIx64 " hva 0x%" PRIx64 " data 0x%" PRIx64 " len %d"
 kvm_sev_attestation_report(const char *mnonce, const char *data) "mnonce %s data %s"
+
+# target/i386/xen.c
+kvm_xen_hypercall(int cpu, uint8_t cpl, uint64_t input, uint64_t a0, uint64_t a1, uint64_t a2, uint64_t ret) "xen_hypercall: cpu %d cpl %d input %" PRIu64 " a0 0x%" PRIx64 " a1 0x%" PRIx64 " a2 0x%" PRIx64" ret 0x%" PRIx64
diff --git a/target/i386/xen.c b/target/i386/xen.c
index bc183dce4e..708ab908a0 100644
--- a/target/i386/xen.c
+++ b/target/i386/xen.c
@@ -10,8 +10,10 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "kvm/kvm_i386.h"
 #include "xen.h"
+#include "trace.h"
 
 int kvm_xen_init(KVMState *s, uint32_t xen_version)
 {
@@ -47,3 +49,40 @@ int kvm_xen_init(KVMState *s, uint32_t xen_version)
 
     return 0;
 }
+
+static bool __kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
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
+    if (exit->type != KVM_EXIT_XEN_HCALL)
+        return -1;
+
+    if (!__kvm_xen_handle_exit(cpu, exit)) {
+        /* Some hypercalls will be deliberately "implemented" by returning
+         * -ENOSYS. This case is for hypercalls which are unexpected. */
+        exit->u.hcall.result = -ENOSYS;
+        qemu_log_mask(LOG_GUEST_ERROR, "Unimplemented Xen hypercall %"
+                      PRId64 " (0x%" PRIx64 " 0x%" PRIx64 " 0x%" PRIx64 ")\n",
+                      (uint64_t)exit->u.hcall.input, (uint64_t)exit->u.hcall.params[0],
+                      (uint64_t)exit->u.hcall.params[1], (uint64_t)exit->u.hcall.params[1]);
+    }
+
+    trace_kvm_xen_hypercall(CPU(cpu)->cpu_index, exit->u.hcall.cpl,
+                            exit->u.hcall.input, exit->u.hcall.params[0],
+                            exit->u.hcall.params[1], exit->u.hcall.params[2],
+                            exit->u.hcall.result);
+    return 0;
+}
diff --git a/target/i386/xen.h b/target/i386/xen.h
index ae880c47bc..9134d78685 100644
--- a/target/i386/xen.h
+++ b/target/i386/xen.h
@@ -23,5 +23,6 @@
 #define XEN_VERSION(maj, min) ((maj) << 16 | (min))
 
 int kvm_xen_init(KVMState *s, uint32_t xen_version);
+int kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit);
 
 #endif /* QEMU_I386_XEN_H */
-- 
2.35.3


