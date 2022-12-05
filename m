Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 505F3642EF6
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 18:37:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2FKh-00080n-P0; Mon, 05 Dec 2022 12:32:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+0f5700dbc1736e95d806+7043+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p2FKP-0007rg-7W
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:32:30 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+0f5700dbc1736e95d806+7043+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p2FJx-0007PI-Ny
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:32:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=pQy5uzYvVKgQgnyYM+49fV0wFOa4mD8rLIxjgXtTRWs=; b=SuFL33Ke4OOuEW8fvhuV9VhqHV
 /97t0CoBHDpjYSs9j3weflWpPxhrQhddkSOt8iGVDkiFzQyrrAyYtE1wqIceEJUgj5p+vpik6YYNd
 t+FQN57LugFZryyZ3KsNge8vc6OZsCVKVR7QXXkm1uCnwvAH5dC7xOxA3otmdtR8qg5m+ZQOKhqyS
 SwBl+VtxczHj6jsnFXTX8GF5Z7YtpO4I/UAymykYyGrXRHDfLzcnHAs8RRNBSQVxUAkQCu8m8An6r
 zQ1B/aM6z60g0egGdOGifEPYXu5JffGMuKNSxfQBY/M+flJ0F+Gg5YKKIcat6YJT+gpLjwfEA5dNt
 BGDaLbvw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p2FJo-007fzL-S0; Mon, 05 Dec 2022 17:31:52 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p2FJo-002YKH-K5; Mon, 05 Dec 2022 17:31:52 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>
Subject: [RFC PATCH 10/21] i386/xen: handle guest hypercalls
Date: Mon,  5 Dec 2022 17:31:26 +0000
Message-Id: <20221205173137.607044-11-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221205173137.607044-1-dwmw2@infradead.org>
References: <20221205173137.607044-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+0f5700dbc1736e95d806+7043+infradead.org+dwmw2@desiato.srs.infradead.org;
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

This means handling the new exit reason for Xen but still
crashing on purpose. As we implement each of the hypercalls
we will then return the right return code.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
[dwmw2: Add CPL to hypercall tracing, disallow hypercalls from CPL > 0]
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 target/i386/kvm/kvm.c    |  5 +++++
 target/i386/trace-events |  3 +++
 target/i386/xen.c        | 45 ++++++++++++++++++++++++++++++++++++++++
 target/i386/xen.h        |  1 +
 4 files changed, 54 insertions(+)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 4b21d03250..6396d11f1e 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -5468,6 +5468,11 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
         assert(run->msr.reason == KVM_MSR_EXIT_REASON_FILTER);
         ret = kvm_handle_wrmsr(cpu, run);
         break;
+#ifdef CONFIG_XEN
+    case KVM_EXIT_XEN:
+        ret = kvm_xen_handle_exit(cpu, &run->xen);
+        break;
+#endif
     default:
         fprintf(stderr, "KVM: unknown exit reason %d\n", run->exit_reason);
         ret = -1;
diff --git a/target/i386/trace-events b/target/i386/trace-events
index 2cd8726eeb..3fb9ee3add 100644
--- a/target/i386/trace-events
+++ b/target/i386/trace-events
@@ -11,3 +11,6 @@ kvm_sev_launch_measurement(const char *value) "data %s"
 kvm_sev_launch_finish(void) ""
 kvm_sev_launch_secret(uint64_t hpa, uint64_t hva, uint64_t secret, int len) "hpa 0x%" PRIx64 " hva 0x%" PRIx64 " data 0x%" PRIx64 " len %d"
 kvm_sev_attestation_report(const char *mnonce, const char *data) "mnonce %s data %s"
+
+# target/i386/xen.c
+kvm_xen_hypercall(int cpu, uint8_t cpl, uint64_t input, uint64_t a0, uint64_t a1, uint64_t a2, uint64_t ret) "xen_hypercall: cpu %d cpl %d input %" PRIu64 " a0 0x%" PRIx64 " a1 0x%" PRIx64 " a2 0x%" PRIx64" ret 0x%" PRIu64
diff --git a/target/i386/xen.c b/target/i386/xen.c
index bc183dce4e..d7e942289c 100644
--- a/target/i386/xen.c
+++ b/target/i386/xen.c
@@ -12,6 +12,17 @@
 #include "qemu/osdep.h"
 #include "kvm/kvm_i386.h"
 #include "xen.h"
+#include "trace.h"
+
+/*
+ * Unhandled hypercalls error:
+ *
+ * -1 crash and dump registers
+ *  0 no abort and guest handles -ENOSYS (default)
+ */
+#ifndef HCALL_ERR
+#define HCALL_ERR      0
+#endif
 
 int kvm_xen_init(KVMState *s, uint32_t xen_version)
 {
@@ -47,3 +58,37 @@ int kvm_xen_init(KVMState *s, uint32_t xen_version)
 
     return 0;
 }
+
+static int __kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
+{
+    uint16_t code = exit->u.hcall.input;
+
+    if (exit->u.hcall.cpl > 0) {
+            exit->u.hcall.result = -EPERM;
+            return HCALL_ERR;
+    }
+
+    switch (code) {
+    default:
+        exit->u.hcall.result = -ENOSYS;
+        return HCALL_ERR;
+    }
+}
+
+int kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
+{
+    int ret = HCALL_ERR;
+
+    switch (exit->type) {
+    case KVM_EXIT_XEN_HCALL: {
+        ret = __kvm_xen_handle_exit(cpu, exit);
+        trace_kvm_xen_hypercall(CPU(cpu)->cpu_index, exit->u.hcall.cpl,
+                           exit->u.hcall.input, exit->u.hcall.params[0],
+                           exit->u.hcall.params[1], exit->u.hcall.params[2],
+                           exit->u.hcall.result);
+        return ret;
+    }
+    default:
+        return ret;
+    }
+}
diff --git a/target/i386/xen.h b/target/i386/xen.h
index d4903ecfa1..3537415d31 100644
--- a/target/i386/xen.h
+++ b/target/i386/xen.h
@@ -23,5 +23,6 @@
 #define XEN_VERSION(maj, min) ((maj) << 16 | (min))
 
 int kvm_xen_init(KVMState *s, uint32_t xen_version);
+int kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit);
 
 #endif /* QEMU_I386_XEN_H */
-- 
2.35.3


