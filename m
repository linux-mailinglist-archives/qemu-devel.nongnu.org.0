Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 098B3698CE2
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 07:29:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSXhx-0003Iw-HF; Thu, 16 Feb 2023 01:25:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+96e41a9b2a2966255e0b+7116+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pSXhi-0003Br-Qq
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 01:25:16 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+96e41a9b2a2966255e0b+7116+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pSXhd-00070O-7A
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 01:25:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=fUWxz4sPgA+t1w0KWVXC0xQzW87of1/1L9R2NyK/S5M=; b=JivlmwFrZmeScofxGhpawM6aom
 1ubqvnIs6u8xJe3WFtntGAqEyfdi/7bHmnJHQaZdkBg7ltIfrr65S3WIIIJOa7kBvZ3PAbYE7BAYq
 sZpKsFCi5gXyZP/wbuP6TKbWppS+6DfzDDCMpE+YMyc4L0R/dNzE2/DxrVUfoH7frM/bWX4zZbt9N
 qwM1BsaApHlYZZert03nHUw8AMnEa9x+qOQeiIBdByRyR/AEAJkrlCsjJMHrp8kvanRNdIKHFTYmO
 NmmfVNqWbAaKzIUzT9jzXi72IbAAzG0Qzw5ZyjEob82WjoClHYUo6XcWc4x6CY3zfLJiPR5mNTDVc
 cO8NDyHw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pSXga-00AAz7-1i; Thu, 16 Feb 2023 06:24:48 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pSXhG-008w6W-2F; Thu, 16 Feb 2023 06:24:46 +0000
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
Subject: [PATCH v11 10/59] i386/xen: implement HYPERVISOR_xen_version
Date: Thu, 16 Feb 2023 06:23:55 +0000
Message-Id: <20230216062444.2129371-11-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230216062444.2129371-1-dwmw2@infradead.org>
References: <20230216062444.2129371-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+96e41a9b2a2966255e0b+7116+infradead.org+dwmw2@desiato.srs.infradead.org;
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

This is just meant to serve as an example on how we can implement
hypercalls. xen_version specifically since Qemu does all kind of
feature controllability. So handling that here seems appropriate.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
[dwmw2: Implement kvm_gva_rw() safely]
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 target/i386/kvm/xen-emu.c | 86 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 476f464ee2..56b80a7880 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -14,9 +14,55 @@
 #include "sysemu/kvm_int.h"
 #include "sysemu/kvm_xen.h"
 #include "kvm/kvm_i386.h"
+#include "exec/address-spaces.h"
 #include "xen-emu.h"
 #include "trace.h"
 
+#include "hw/xen/interface/version.h"
+
+static int kvm_gva_rw(CPUState *cs, uint64_t gva, void *_buf, size_t sz,
+                      bool is_write)
+{
+    uint8_t *buf = (uint8_t *)_buf;
+    int ret;
+
+    while (sz) {
+        struct kvm_translation tr = {
+            .linear_address = gva,
+        };
+
+        size_t len = TARGET_PAGE_SIZE - (tr.linear_address & ~TARGET_PAGE_MASK);
+        if (len > sz) {
+            len = sz;
+        }
+
+        ret = kvm_vcpu_ioctl(cs, KVM_TRANSLATE, &tr);
+        if (ret || !tr.valid || (is_write && !tr.writeable)) {
+            return -EFAULT;
+        }
+
+        cpu_physical_memory_rw(tr.physical_address, buf, len, is_write);
+
+        buf += len;
+        sz -= len;
+        gva += len;
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
+    return kvm_gva_rw(cs, gva, buf, sz, true);
+}
+
 int kvm_xen_init(KVMState *s, uint32_t hypercall_msr)
 {
     const int required_caps = KVM_XEN_HVM_CONFIG_HYPERCALL_MSR |
@@ -87,6 +133,43 @@ uint32_t kvm_xen_get_caps(void)
     return kvm_state->xen_caps;
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
+        /* No need for 32/64 compat handling */
+        qemu_build_assert(sizeof(fi) == 8);
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
@@ -97,6 +180,9 @@ static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
     }
 
     switch (code) {
+    case __HYPERVISOR_xen_version:
+        return kvm_xen_hcall_xen_version(exit, cpu, exit->u.hcall.params[0],
+                                         exit->u.hcall.params[1]);
     default:
         return false;
     }
-- 
2.39.0


