Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 179DB64807A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 10:57:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3a7k-0002YU-JX; Fri, 09 Dec 2022 04:56:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+00235e7d7be18c3eb674+7047+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p3a7P-0002Si-Bm
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:56:38 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+00235e7d7be18c3eb674+7047+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p3a7K-0006pE-01
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:56:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=kv9C4h0Efvm29nM4oFkfjB8dBak5yhU4EG+XLcgNePk=; b=VUPWjTJZFYsBPqNZDmY0nalG8r
 Br33Ok2DBpEeUYpwdNYvIfKDuCpC7OiazWlA4fCzsklpVfZ4DA0AnfjN3x9i4dGcWTFNS2NyNN3zm
 eHM3pxKhZKvibjZ4XW9T8M8bwdWcvVHRWydfkyRHqRNP5HAs43iA0yaNEXp7w3taY3T4Ran2PR6Yw
 0nWxhSaoe4GCjXigvypzwzWyu9h8ECS6DChzIw9edfM2YIiQGDGYAWseg+RAuqOwVFYIM1TN53obj
 r1o6UHuiiabkZw/8Z5XGhXmA4giJZsCSErYvkhdOyTO1i5ZyO4OUcoTeUsogLhbnG7t6++E0JHFA8
 PcNkMZDQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p3a7G-007tiU-De; Fri, 09 Dec 2022 09:56:26 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p3a78-002tYs-0a; Fri, 09 Dec 2022 09:56:18 +0000
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
Subject: [RFC PATCH v2 11/22] i386/xen: implement HYPERCALL_xen_version
Date: Fri,  9 Dec 2022 09:56:01 +0000
Message-Id: <20221209095612.689243-12-dwmw2@infradead.org>
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

This is just meant to serve as an example on how we can implement
hypercalls. xen_version specifically since Qemu does all kind of
feature controllability. So handling that here seems appropriate.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
[dwmw2: Implement kvm_gva_rw() safely]
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 target/i386/xen.c | 79 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/target/i386/xen.c b/target/i386/xen.c
index 708ab908a0..55beed1913 100644
--- a/target/i386/xen.c
+++ b/target/i386/xen.c
@@ -12,9 +12,51 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "kvm/kvm_i386.h"
+#include "exec/address-spaces.h"
 #include "xen.h"
 #include "trace.h"
 
+#include "standard-headers/xen/version.h"
+
+static int kvm_gva_rw(CPUState *cs, uint64_t gva, void *_buf, size_t sz,
+                      bool is_write)
+{
+    uint8_t *buf = (uint8_t *)_buf;
+    size_t i = 0, len = 0;
+    int ret;
+
+    for (i = 0; i < sz; i+= len) {
+        struct kvm_translation tr = {
+            .linear_address = gva + i,
+        };
+
+        len = TARGET_PAGE_SIZE - (tr.linear_address & ~TARGET_PAGE_MASK);
+        if (len > sz)
+            len = sz;
+
+        ret = kvm_vcpu_ioctl(cs, KVM_TRANSLATE, &tr);
+        if (ret || !tr.valid || (is_write && !tr.writeable)) {
+            return -EFAULT;
+        }
+
+        cpu_physical_memory_rw(tr.physical_address, buf + i, len, is_write);
+    }
+
+    return 0;
+}
+
+static inline int kvm_copy_from_gva(CPUState *cs, uint64_t gva, void *buf,
+                                    size_t sz)
+{
+    return kvm_gva_rw(cs, gva, buf, sz, false);
+}
+
+static inline int kvm_copy_to_gva(CPUState *cs, uint64_t gva, void *buf,
+                                  size_t sz)
+{
+    return kvm_gva_rw(cs, gva, buf, sz, false);
+}
+
 int kvm_xen_init(KVMState *s, uint32_t xen_version)
 {
     const int required_caps = KVM_XEN_HVM_CONFIG_HYPERCALL_MSR |
@@ -50,6 +92,40 @@ int kvm_xen_init(KVMState *s, uint32_t xen_version)
     return 0;
 }
 
+static bool kvm_xen_hcall_xen_version(struct kvm_xen_exit *exit, X86CPU *cpu,
+                                     int cmd, uint64_t arg)
+{
+    int err = 0;
+
+    switch (cmd) {
+    case XENVER_get_features: {
+        struct xen_feature_info fi;
+
+        err = kvm_copy_from_gva(CPU(cpu), arg, &fi, sizeof(fi));
+        if (err) {
+            break;
+        }
+
+        fi.submap = 0;
+        if (fi.submap_idx == 0) {
+            fi.submap |= 1 << XENFEAT_writable_page_tables |
+                         1 << XENFEAT_writable_descriptor_tables |
+                         1 << XENFEAT_auto_translated_physmap |
+                         1 << XENFEAT_supervisor_mode_kernel;
+        }
+
+        err = kvm_copy_to_gva(CPU(cpu), arg, &fi, sizeof(fi));
+        break;
+    }
+
+    default:
+            return false;
+    }
+
+    exit->u.hcall.result = err;
+    return true;
+}
+
 static bool __kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
 {
     uint16_t code = exit->u.hcall.input;
@@ -60,6 +136,9 @@ static bool __kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
     }
 
     switch (code) {
+    case __HYPERVISOR_xen_version:
+        return kvm_xen_hcall_xen_version(exit, cpu, exit->u.hcall.params[0],
+                                         exit->u.hcall.params[1]);
     default:
         return false;
     }
-- 
2.35.3


