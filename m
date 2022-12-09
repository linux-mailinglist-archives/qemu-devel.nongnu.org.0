Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 463976480AF
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 11:12:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3a87-0002eO-Ta; Fri, 09 Dec 2022 04:57:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+70dbbb0d34525a3cd306+7047+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p3a7N-0002SX-Gi
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:56:35 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+70dbbb0d34525a3cd306+7047+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p3a7I-0006pQ-Ux
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:56:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Y+BlTuckp88PFXdHx7mO1ZYpKNMqEHPt5axjP/mYtqw=; b=Cmm7OqWPNaNmOWPqxy7s3NiDZa
 Uk2J2RPVia2Dg3CJ7PYyDe9XAMOVNK6gNPm/bgQ/s114NxesZjsW4HJD6cfifCu+sMc+Ebf82G8hv
 bT3OZpFDlSROkBeg1ZWgV4IrTuaBEpECMzkoJoJHwbznL8vZLqBn6HNZe+x6rWKaHYXO6EP7NDySN
 cTnn6ke1e64UyMPXP4tCeDjdIz0Wx1nTzPdd7VbR0tyhestpAVdO9AquYIWa2FBq84ivnvUZo+kXP
 YL4+Csh9K8U2ngWds7G9bSkwt+u3NTANeut4zfxD7yCOPQ9yjViwGpbJJ2wAVchYwTM0jjIPaYKVd
 uLrY80uw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p3a78-008l4L-BN; Fri, 09 Dec 2022 09:56:19 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p3a78-002tZ0-2r; Fri, 09 Dec 2022 09:56:18 +0000
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
Subject: [RFC PATCH v2 13/22] i386/xen: implement HYPERVISOR_memory_op
Date: Fri,  9 Dec 2022 09:56:03 +0000
Message-Id: <20221209095612.689243-14-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221209095612.689243-1-dwmw2@infradead.org>
References: <20221209095612.689243-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+70dbbb0d34525a3cd306+7047+infradead.org+dwmw2@desiato.srs.infradead.org;
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

Specifically XENMEM_add_to_physmap with space XENMAPSPACE_shared_info to
allow the guest to set its shared_info page.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
[dwmw2: Use the xen_overlay device]
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 target/i386/trace-events |  1 +
 target/i386/xen.c        | 59 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/target/i386/trace-events b/target/i386/trace-events
index 1bf9558811..fb999d0052 100644
--- a/target/i386/trace-events
+++ b/target/i386/trace-events
@@ -14,3 +14,4 @@ kvm_sev_attestation_report(const char *mnonce, const char *data) "mnonce %s data
 
 # target/i386/xen.c
 kvm_xen_hypercall(int cpu, uint8_t cpl, uint64_t input, uint64_t a0, uint64_t a1, uint64_t a2, uint64_t ret) "xen_hypercall: cpu %d cpl %d input %" PRIu64 " a0 0x%" PRIx64 " a1 0x%" PRIx64 " a2 0x%" PRIx64" ret 0x%" PRIx64
+kvm_xen_set_shared_info(uint64_t gfn) "shared info at gfn 0x%" PRIx64
diff --git a/target/i386/xen.c b/target/i386/xen.c
index 55beed1913..ddd144039a 100644
--- a/target/i386/xen.c
+++ b/target/i386/xen.c
@@ -15,8 +15,9 @@
 #include "exec/address-spaces.h"
 #include "xen.h"
 #include "trace.h"
-
+#include "hw/i386/kvm/xen_overlay.h"
 #include "standard-headers/xen/version.h"
+#include "standard-headers/xen/memory.h"
 
 static int kvm_gva_rw(CPUState *cs, uint64_t gva, void *_buf, size_t sz,
                       bool is_write)
@@ -126,6 +127,59 @@ static bool kvm_xen_hcall_xen_version(struct kvm_xen_exit *exit, X86CPU *cpu,
     return true;
 }
 
+static int xen_set_shared_info(CPUState *cs, uint64_t gfn)
+{
+    uint64_t gpa = gfn << TARGET_PAGE_BITS;
+    int err;
+
+    /* The xen_overlay device tells KVM about it too, since it had to
+     * do that on migration load anyway (unless we're going to jump
+     * through lots of hoops to maintain the fiction that this isn't
+     * KVM-specific */
+    err = xen_overlay_map_page(XENMAPSPACE_shared_info, 0, gpa);
+    if (err)
+            return err;
+
+    trace_kvm_xen_set_shared_info(gfn);
+
+    return err;
+}
+
+static bool kvm_xen_hcall_memory_op(struct kvm_xen_exit *exit,
+                                   int cmd, uint64_t arg, X86CPU *cpu)
+{
+    CPUState *cs = CPU(cpu);
+    int err = 0;
+
+    switch (cmd) {
+    case XENMEM_add_to_physmap: {
+            struct xen_add_to_physmap xatp;
+
+            err = kvm_copy_from_gva(cs, arg, &xatp, sizeof(xatp));
+            if (err) {
+                break;
+            }
+
+            switch (xatp.space) {
+            case XENMAPSPACE_shared_info:
+                break;
+            default:
+                err = -ENOSYS;
+                break;
+            }
+
+            err = xen_set_shared_info(cs, xatp.gpfn);
+            break;
+         }
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
@@ -136,6 +190,9 @@ static bool __kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
     }
 
     switch (code) {
+    case __HYPERVISOR_memory_op:
+        return kvm_xen_hcall_memory_op(exit, exit->u.hcall.params[0],
+                                       exit->u.hcall.params[1], cpu);
     case __HYPERVISOR_xen_version:
         return kvm_xen_hcall_xen_version(exit, cpu, exit->u.hcall.params[0],
                                          exit->u.hcall.params[1]);
-- 
2.35.3


