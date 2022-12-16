Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7362564E561
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 01:49:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5yni-0005PK-8q; Thu, 15 Dec 2022 19:42:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+54656a84ae694b50c6d0+7054+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p5ynK-0005Fv-1l
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 19:41:46 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+54656a84ae694b50c6d0+7054+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p5ynI-0006fd-81
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 19:41:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=VWjE1fM6kr8j65/rSw8tUwrrimb4U2TfBvsIMEU3MTw=; b=Icp3a++NenhqP0t1IHf0EzBJf5
 veEe076qdPpR18RHLGagX+AXCkltHSm1MO1z+myti82pKxr3qoBznAjhyNP1iYJxK4l78/oKRpBqB
 fDzFzd7Lq5bBtgzQCgt4NEz2wFRxWFdOANbmdjCqcqhiPZJ4XNgQm2eI/SE3ecbkdoVUZKmNOW9s0
 yBeQO51HD0dxM9ZqhGxbdgYsb+gGEC6dxV6csAo4ptLOVELPSalQ1uj1aUvgTDZ1R1r4UbKM0erBN
 Y6a8El6xIIpBVt1fXriVOJSRWxmI+D4eGlvZv/uxXYbGLrEpKbS6DGBRXrfPGE8MtF0kZa4CSTXtG
 3kDR0/Ng==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p5ymz-00Azyt-9R; Fri, 16 Dec 2022 00:41:32 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p5ymw-003cOo-17; Fri, 16 Dec 2022 00:41:22 +0000
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
Subject: [RFC PATCH v3 15/38] i386/xen: implement XENMEM_add_to_physmap_batch
Date: Fri, 16 Dec 2022 00:40:54 +0000
Message-Id: <20221216004117.862106-16-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221216004117.862106-1-dwmw2@infradead.org>
References: <20221216004117.862106-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+54656a84ae694b50c6d0+7054+infradead.org+dwmw2@desiato.srs.infradead.org;
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

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 target/i386/kvm/xen-compat.h | 24 +++++++++++++
 target/i386/kvm/xen-emu.c    | 70 ++++++++++++++++++++++++++++++++++++
 2 files changed, 94 insertions(+)

diff --git a/target/i386/kvm/xen-compat.h b/target/i386/kvm/xen-compat.h
index 0b7088662a..2925dcc7f6 100644
--- a/target/i386/kvm/xen-compat.h
+++ b/target/i386/kvm/xen-compat.h
@@ -15,6 +15,20 @@
 
 typedef uint32_t compat_pfn_t;
 typedef uint32_t compat_ulong_t;
+typedef uint32_t compat_ptr_t;
+
+#define __DEFINE_COMPAT_HANDLE(name, type)      \
+    typedef struct {                            \
+        compat_ptr_t c;                         \
+        type *_[0] __attribute__((packed));     \
+    } __compat_handle_ ## name;                 \
+
+#define DEFINE_COMPAT_HANDLE(name) __DEFINE_COMPAT_HANDLE(name, name)
+#define COMPAT_HANDLE(name) __compat_handle_ ## name
+
+DEFINE_COMPAT_HANDLE(compat_pfn_t);
+DEFINE_COMPAT_HANDLE(compat_ulong_t);
+DEFINE_COMPAT_HANDLE(int);
 
 struct compat_xen_add_to_physmap {
     domid_t domid;
@@ -24,4 +38,14 @@ struct compat_xen_add_to_physmap {
     compat_pfn_t gpfn;
 };
 
+struct compat_xen_add_to_physmap_batch {
+    domid_t domid;
+    uint16_t space;
+    uint16_t size;
+    uint16_t extra;
+    COMPAT_HANDLE(compat_ulong_t) idxs;
+    COMPAT_HANDLE(compat_pfn_t) gpfns;
+    COMPAT_HANDLE(int) errs;
+};
+
 #endif /* QEMU_I386_XEN_COMPAT_H */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 1fecab6e10..c23026b872 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -215,6 +215,72 @@ static int do_add_to_physmap(struct kvm_xen_exit *exit, X86CPU *cpu, uint64_t ar
 
     return add_to_physmap_one(xatp.space, xatp.idx, xatp.gpfn);
 }
+
+static int do_add_to_physmap_batch(struct kvm_xen_exit *exit, X86CPU *cpu,
+                                   uint64_t arg)
+{
+    struct xen_add_to_physmap_batch xatpb;
+    unsigned long idxs_gva, gpfns_gva, errs_gva;
+    CPUState *cs = CPU(cpu);
+    size_t op_sz;
+
+    if (hypercall_compat32(exit->u.hcall.longmode)) {
+        struct compat_xen_add_to_physmap_batch xatpb32;
+
+        qemu_build_assert(sizeof(struct compat_xen_add_to_physmap_batch) == 20);
+        if (kvm_copy_from_gva(cs, arg, &xatpb32, sizeof(xatpb32))) {
+            return -EFAULT;
+        }
+        xatpb.domid = xatpb32.domid;
+        xatpb.space = xatpb32.space;
+        xatpb.size = xatpb32.size;
+
+        idxs_gva = xatpb32.idxs.c;
+        gpfns_gva = xatpb32.gpfns.c;
+        errs_gva = xatpb32.errs.c;
+        op_sz = sizeof(uint32_t);;
+    } else {
+        if (kvm_copy_from_gva(cs, arg, &xatpb, sizeof(xatpb))) {
+            return -EFAULT;
+        }
+        op_sz = sizeof(unsigned long);
+        idxs_gva = (unsigned long)xatpb.idxs.p;
+        gpfns_gva = (unsigned long)xatpb.gpfns.p;
+        errs_gva = (unsigned long)xatpb.errs.p;
+    }
+
+    if (xatpb.domid != DOMID_SELF && xatpb.domid != xen_domid) {
+        return -ESRCH;
+    }
+
+    /* Explicitly invalid for the batch op. Not that we implement it anyway. */
+    if (xatpb.space == XENMAPSPACE_gmfn_range) {
+        return -EINVAL;
+    }
+
+    while (xatpb.size--) {
+        unsigned long idx = 0;
+        unsigned long gpfn = 0;
+        int err;
+
+        /* For 32-bit compat this only copies the low 32 bits of each */
+        if (kvm_copy_from_gva(cs, idxs_gva, &idx, op_sz) ||
+            kvm_copy_from_gva(cs, gpfns_gva, &gpfn, op_sz)) {
+            return -EFAULT;
+        }
+        idxs_gva += op_sz;
+        gpfns_gva += op_sz;
+
+        err = add_to_physmap_one(xatpb.space, idx, gpfn);
+
+        if (kvm_copy_to_gva(cs, errs_gva, &err, sizeof(err))) {
+            return -EFAULT;
+        }
+        errs_gva += sizeof(err);
+    }
+    return 0;
+}
+
 static bool kvm_xen_hcall_memory_op(struct kvm_xen_exit *exit, X86CPU *cpu,
                                    int cmd, uint64_t arg)
 {
@@ -225,6 +291,10 @@ static bool kvm_xen_hcall_memory_op(struct kvm_xen_exit *exit, X86CPU *cpu,
         err = do_add_to_physmap(exit, cpu, arg);
         break;
 
+    case XENMEM_add_to_physmap_batch:
+        err = do_add_to_physmap_batch(exit, cpu, arg);
+        break;
+
     default:
         return false;
     }
-- 
2.35.3


