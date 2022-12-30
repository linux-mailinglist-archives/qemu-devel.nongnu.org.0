Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9930F65984D
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 13:36:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBEGW-0008Uh-A7; Fri, 30 Dec 2022 07:13:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1132f1bfe572585e6c7f+7068+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pBEFy-0007va-3G
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:13:02 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1132f1bfe572585e6c7f+7068+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pBEFr-00050m-7H
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:13:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=UigSG6QP4wQ7IWVlTYaz3gvLp6K6ZYsDviHLpJrpFlE=; b=H9Kah3i0TTBWMW9smCvlgQVA93
 Sz62ykbM5eg1aYJ2A01vXbS/cId9t+5byjhGFPd5Wj5xkibidjmqsn6Tw77DdAY4AOuS7N0YlR103
 YpJfJMHH4/Xa2+ZSeZtJ+hqlb7LvKkSqLDUg16f6GfIxy4so1gGGCCmTaAujk79er7yL8lK1U1kch
 8W0mpobqL66FrPIH2kA7az3Y5GXa7aH1dDiSqiul2h9mmlgVrBjImYvKGwCvYxKJ9tk8BgKT7hHUa
 QjWZ9YVQkOjrs4+q176FMqipH4iihQtI7BwC2F7KjLaTbZke8agYD/uh6B0+4ZD82BkDu+vuzBIfy
 Q54E4wiw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pBEFk-00Ac86-R4; Fri, 30 Dec 2022 12:12:49 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pBEFZ-005NwG-IQ; Fri, 30 Dec 2022 12:12:37 +0000
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
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
Subject: [RFC PATCH v5 17/52] i386/xen: implement HYPERVISOR_memory_op
Date: Fri, 30 Dec 2022 12:12:00 +0000
Message-Id: <20221230121235.1282915-18-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221230121235.1282915-1-dwmw2@infradead.org>
References: <20221230121235.1282915-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+1132f1bfe572585e6c7f+7068+infradead.org+dwmw2@casper.srs.infradead.org;
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

Specifically XENMEM_add_to_physmap with space XENMAPSPACE_shared_info to
allow the guest to set its shared_info page.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
[dwmw2: Use the xen_overlay device, add compat support]
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 target/i386/kvm/trace-events |   1 +
 target/i386/kvm/xen-compat.h |  27 ++++++++
 target/i386/kvm/xen-emu.c    | 116 ++++++++++++++++++++++++++++++++++-
 3 files changed, 143 insertions(+), 1 deletion(-)
 create mode 100644 target/i386/kvm/xen-compat.h

diff --git a/target/i386/kvm/trace-events b/target/i386/kvm/trace-events
index cd6f842b1f..0a47c26e80 100644
--- a/target/i386/kvm/trace-events
+++ b/target/i386/kvm/trace-events
@@ -8,3 +8,4 @@ kvm_x86_update_msi_routes(int num) "Updated %d MSI routes"
 
 # xen-emu.c
 kvm_xen_hypercall(int cpu, uint8_t cpl, uint64_t input, uint64_t a0, uint64_t a1, uint64_t a2, uint64_t ret) "xen_hypercall: cpu %d cpl %d input %" PRIu64 " a0 0x%" PRIx64 " a1 0x%" PRIx64 " a2 0x%" PRIx64" ret 0x%" PRIx64
+kvm_xen_set_shared_info(uint64_t gfn) "shared info at gfn 0x%" PRIx64
diff --git a/target/i386/kvm/xen-compat.h b/target/i386/kvm/xen-compat.h
new file mode 100644
index 0000000000..0b7088662a
--- /dev/null
+++ b/target/i386/kvm/xen-compat.h
@@ -0,0 +1,27 @@
+/*
+ * Xen HVM emulation support in KVM
+ *
+ * Copyright © 2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef QEMU_I386_KVM_XEN_COMPAT_H
+#define QEMU_I386_KVM_XEN_COMPAT_H
+
+#include "standard-headers/xen/memory.h"
+
+typedef uint32_t compat_pfn_t;
+typedef uint32_t compat_ulong_t;
+
+struct compat_xen_add_to_physmap {
+    domid_t domid;
+    uint16_t size;
+    unsigned int space;
+    compat_ulong_t idx;
+    compat_pfn_t gpfn;
+};
+
+#endif /* QEMU_I386_XEN_COMPAT_H */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 80f09f33df..c8543d2153 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -9,8 +9,11 @@
  *
  */
 
+#define __XEN_INTERFACE_VERSION__ 0x00040e00
+
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "hw/xen/xen.h"
 #include "sysemu/kvm_int.h"
 #include "sysemu/kvm_xen.h"
 #include "kvm/kvm_i386.h"
@@ -23,6 +26,15 @@
 
 #include "standard-headers/xen/version.h"
 #include "standard-headers/xen/sched.h"
+#include "standard-headers/xen/memory.h"
+
+#include "xen-compat.h"
+
+#ifdef TARGET_X86_64
+#define hypercall_compat32(longmode) (!(longmode))
+#else
+#define hypercall_compat32(longmode) (false)
+#endif
 
 static int kvm_gva_rw(CPUState *cs, uint64_t gva, void *_buf, size_t sz,
                       bool is_write)
@@ -174,9 +186,108 @@ static bool kvm_xen_hcall_xen_version(struct kvm_xen_exit *exit, X86CPU *cpu,
     return true;
 }
 
+static int xen_set_shared_info(uint64_t gfn)
+{
+    uint64_t gpa = gfn << TARGET_PAGE_BITS;
+    int err;
+
+    /*
+     * The xen_overlay device tells KVM about it too, since it had to
+     * do that on migration load anyway (unless we're going to jump
+     * through lots of hoops to maintain the fiction that this isn't
+     * KVM-specific.
+     */
+    err = xen_overlay_map_shinfo_page(gpa);
+    if (err) {
+            return err;
+    }
+
+    trace_kvm_xen_set_shared_info(gfn);
+
+    return err;
+}
+
+static int add_to_physmap_one(uint32_t space, uint64_t idx, uint64_t gfn)
+{
+    switch (space) {
+    case XENMAPSPACE_shared_info:
+        if (idx > 0) {
+            return -EINVAL;
+        }
+        return xen_set_shared_info(gfn);
+
+    case XENMAPSPACE_grant_table:
+    case XENMAPSPACE_gmfn:
+    case XENMAPSPACE_gmfn_range:
+        return -ENOTSUP;
+
+    case XENMAPSPACE_gmfn_foreign:
+    case XENMAPSPACE_dev_mmio:
+        return -EPERM;
+
+    default:
+        return -EINVAL;
+    }
+}
+
+static int do_add_to_physmap(struct kvm_xen_exit *exit, X86CPU *cpu,
+                             uint64_t arg)
+{
+    struct xen_add_to_physmap xatp;
+    CPUState *cs = CPU(cpu);
+
+    if (hypercall_compat32(exit->u.hcall.longmode)) {
+        struct compat_xen_add_to_physmap xatp32;
+
+        qemu_build_assert(sizeof(struct compat_xen_add_to_physmap) == 16);
+        if (kvm_copy_from_gva(cs, arg, &xatp32, sizeof(xatp32))) {
+            return -EFAULT;
+        }
+        xatp.domid = xatp32.domid;
+        xatp.size = xatp32.size;
+        xatp.space = xatp32.space;
+        xatp.idx = xatp32.idx;
+        xatp.gpfn = xatp32.gpfn;
+    } else {
+        if (kvm_copy_from_gva(cs, arg, &xatp, sizeof(xatp))) {
+            return -EFAULT;
+        }
+    }
+
+    if (xatp.domid != DOMID_SELF && xatp.domid != xen_domid) {
+        return -ESRCH;
+    }
+
+    return add_to_physmap_one(xatp.space, xatp.idx, xatp.gpfn);
+}
+
+static bool kvm_xen_hcall_memory_op(struct kvm_xen_exit *exit, X86CPU *cpu,
+                                   int cmd, uint64_t arg)
+{
+    int err;
+
+    switch (cmd) {
+    case XENMEM_add_to_physmap:
+        err = do_add_to_physmap(exit, cpu, arg);
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
 static int kvm_xen_soft_reset(void)
 {
-    /* Nothing to reset... yet. */
+    int err;
+
+    err = xen_overlay_map_shinfo_page(INVALID_GFN);
+    if (err) {
+        return err;
+    }
+
     return 0;
 }
 
@@ -262,6 +373,9 @@ static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
     case __HYPERVISOR_sched_op:
         return kvm_xen_hcall_sched_op(exit, cpu, exit->u.hcall.params[0],
                                       exit->u.hcall.params[1]);
+    case __HYPERVISOR_memory_op:
+        return kvm_xen_hcall_memory_op(exit, cpu, exit->u.hcall.params[0],
+                                       exit->u.hcall.params[1]);
     case __HYPERVISOR_xen_version:
         return kvm_xen_hcall_xen_version(exit, cpu, exit->u.hcall.params[0],
                                          exit->u.hcall.params[1]);
-- 
2.35.3


