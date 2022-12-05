Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD59642EF7
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 18:38:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2FL1-0008DR-An; Mon, 05 Dec 2022 12:33:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+0f5700dbc1736e95d806+7043+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p2FKT-0007wF-HS
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:32:33 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+0f5700dbc1736e95d806+7043+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p2FJx-0007PK-O0
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:32:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=+ytGwVcilR8UkrvuUvL0LQlwPYV+dnAs7LBskObWxE0=; b=QlWaLbkRPj/9fMeFRJFMtOouwK
 F7vRl4mgVOB/kkztdBaSvfoIKNmjiOwpRV0w3cFdIqYxWdNwSqvBerAF9p6X5O5LhZYecoJG34IYl
 aFaQNQF1Arx05Ke8cGtrTHpKtbtgZPJh6svBtNAF2Q6OnJJZwRAKsPTeguWNL+mCVXXvkH7rT6OpJ
 xBdqFFG3ZebWoYPtjbEvT+mPbx/AI3D0De3uI2MLrZN5vAXGrGRIx9B8cNaKJvXkMHRO0A5Nfxfr3
 SDJQkZ2Te5ZUjdXFPiy/GTw9oHiFeZ7yymTOjJTFpocgSNWEPLnBocfsjouajcum24zL7sOi0y3ys
 C6MApvpQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p2FJo-007fzN-TS; Mon, 05 Dec 2022 17:31:52 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p2FJo-002YKL-Kr; Mon, 05 Dec 2022 17:31:52 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>
Subject: [RFC PATCH 11/21] i386/xen: implement HYPERCALL_xen_version
Date: Mon,  5 Dec 2022 17:31:27 +0000
Message-Id: <20221205173137.607044-12-dwmw2@infradead.org>
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

This is just meant to serve as an example on how we can implement
hypercalls. xen_version specifically since Qemu does all kind of
feature controllability. So handling that here seems appropriate.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 target/i386/xen.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/target/i386/xen.c b/target/i386/xen.c
index d7e942289c..ee6f99523d 100644
--- a/target/i386/xen.c
+++ b/target/i386/xen.c
@@ -11,9 +11,14 @@
 
 #include "qemu/osdep.h"
 #include "kvm/kvm_i386.h"
+#include "exec/address-spaces.h"
 #include "xen.h"
 #include "trace.h"
 
+#include "standard-headers/xen/version.h"
+
+#define PAGE_OFFSET    0xffffffff80000000UL
+
 /*
  * Unhandled hypercalls error:
  *
@@ -24,6 +29,28 @@
 #define HCALL_ERR      0
 #endif
 
+static void *gpa_to_hva(uint64_t gpa)
+{
+    MemoryRegionSection mrs;
+
+    mrs = memory_region_find(get_system_memory(), gpa, 1);
+    return !mrs.mr ? NULL : qemu_map_ram_ptr(mrs.mr->ram_block,
+                                             mrs.offset_within_region);
+}
+
+static void *gva_to_hva(CPUState *cs, uint64_t gva)
+{
+    struct kvm_translation t = { .linear_address = gva };
+    int err;
+
+    err = kvm_vcpu_ioctl(cs, KVM_TRANSLATE, &t);
+    if (err || !t.valid) {
+        return NULL;
+    }
+
+    return gpa_to_hva(t.physical_address);
+}
+
 int kvm_xen_init(KVMState *s, uint32_t xen_version)
 {
     const int required_caps = KVM_XEN_HVM_CONFIG_HYPERCALL_MSR |
@@ -59,6 +86,43 @@ int kvm_xen_init(KVMState *s, uint32_t xen_version)
     return 0;
 }
 
+static int kvm_xen_hcall_xen_version(struct kvm_xen_exit *exit, X86CPU *cpu,
+                                     int cmd, uint64_t arg)
+{
+    int err = 0;
+
+    switch (cmd) {
+    case XENVER_get_features: {
+            struct xen_feature_info *fi;
+
+            fi = gva_to_hva(CPU(cpu), arg);
+            if (!fi) {
+                err = -EFAULT;
+                break;
+            }
+
+            if (fi->submap_idx != 0) {
+                err = -EINVAL;
+                break;
+            }
+
+            /*
+             * There's only HVM guests and we only expose what
+             * we intend to support. These are left in the open
+             * whether we should or not support them:
+             *
+             *   XENFEAT_memory_op_vnode_supported
+             *   XENFEAT_writable_page_tables
+             */
+            fi->submap = (1U << XENFEAT_auto_translated_physmap);
+            break;
+         }
+    }
+
+    exit->u.hcall.result = err;
+    return err ? HCALL_ERR : 0;
+}
+
 static int __kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
 {
     uint16_t code = exit->u.hcall.input;
@@ -69,6 +133,9 @@ static int __kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
     }
 
     switch (code) {
+    case __HYPERVISOR_xen_version:
+        return kvm_xen_hcall_xen_version(exit, cpu, exit->u.hcall.params[0],
+                                         exit->u.hcall.params[1]);
     default:
         exit->u.hcall.result = -ENOSYS;
         return HCALL_ERR;
-- 
2.35.3


