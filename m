Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA1167F636
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 09:21:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLgOZ-0006Tf-GD; Sat, 28 Jan 2023 03:17:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+5966041548699f31a8b8+7097+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pLgJa-00060a-B1
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 03:11:59 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+5966041548699f31a8b8+7097+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pLgJK-0007oV-2m
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 03:11:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=J9EEi92D/Hsp5akxvJevu+/WAHIghB+eCsC2I4GtTkQ=; b=AUOcG6Mrl+xQLam390zDexMLzu
 VGPzYyDnmCzqrZR+kFPK4jqmOZ0y35dLnO+aU3vNoTQgtD3xtowxnZraPfDEGFBLAw3waILD1h3uD
 /ZiH2TuSG4rI4+cGXMNl4mAzhUDEIa52V0U/jACgxilzX5Uaj7pCpm16QHNV7mdV8wg0X9QZ8HXb9
 KG/9XMSSmjXZXRDFJzf+v+ceI0d8jHTkMqqQdoqRAFq1JLbmizQdDX/pU3moTPTCiPGaaf13e8jGp
 Aap7I3rKQ4ZQ8cm8pCaO4MyrFS/bi/dg74xjoWK4mZ9doqtr6ROEceufnHE80cyYkuAvDH/sOjp3v
 0F69c7dA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pLgIw-008RKS-Ml; Sat, 28 Jan 2023 08:11:19 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pLgIw-006mIe-2G; Sat, 28 Jan 2023 08:11:18 +0000
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
Subject: [PATCH v9 15/58] i386/xen: manage and save/restore Xen guest
 long_mode setting
Date: Sat, 28 Jan 2023 08:10:30 +0000
Message-Id: <20230128081113.1615111-16-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230128081113.1615111-1-dwmw2@infradead.org>
References: <20230128081113.1615111-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+5966041548699f31a8b8+7097+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Xen will "latch" the guest's 32-bit or 64-bit ("long mode") setting when
the guest writes the MSR to fill in the hypercall page, or when the guest
sets the event channel callback in HVM_PARAM_CALLBACK_IRQ.

KVM handles the former and sets the kernel's long_mode flag accordingly.
The latter will be handled in userspace. Keep them in sync by noticing
when a hypercall is made in a mode that doesn't match qemu's idea of
the guest mode, and resyncing from the kernel. Do that same sync right
before serialization too, in case the guest has set the hypercall page
but hasn't yet made a system call.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_overlay.c | 62 +++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_overlay.h |  4 +++
 target/i386/kvm/xen-emu.c | 12 ++++++++
 3 files changed, 78 insertions(+)

diff --git a/hw/i386/kvm/xen_overlay.c b/hw/i386/kvm/xen_overlay.c
index 0cd623992c..e0efcc6395 100644
--- a/hw/i386/kvm/xen_overlay.c
+++ b/hw/i386/kvm/xen_overlay.c
@@ -44,6 +44,7 @@ struct XenOverlayState {
     MemoryRegion shinfo_mem;
     void *shinfo_ptr;
     uint64_t shinfo_gpa;
+    bool long_mode;
 };
 
 struct XenOverlayState *xen_overlay_singleton;
@@ -96,9 +97,21 @@ static void xen_overlay_realize(DeviceState *dev, Error **errp)
 
     s->shinfo_ptr = memory_region_get_ram_ptr(&s->shinfo_mem);
     s->shinfo_gpa = INVALID_GPA;
+    s->long_mode = false;
     memset(s->shinfo_ptr, 0, XEN_PAGE_SIZE);
 }
 
+static int xen_overlay_pre_save(void *opaque)
+{
+    /*
+     * Fetch the kernel's idea of long_mode to avoid the race condition
+     * where the guest has set the hypercall page up in 64-bit mode but
+     * not yet made a hypercall by the time migration happens, so qemu
+     * hasn't yet noticed.
+     */
+    return xen_sync_long_mode();
+}
+
 static int xen_overlay_post_load(void *opaque, int version_id)
 {
     XenOverlayState *s = opaque;
@@ -107,6 +120,9 @@ static int xen_overlay_post_load(void *opaque, int version_id)
         xen_overlay_do_map_page(&s->shinfo_mem, s->shinfo_gpa);
         xen_overlay_set_be_shinfo(s->shinfo_gpa >> XEN_PAGE_SHIFT);
     }
+    if (s->long_mode) {
+        xen_set_long_mode(true);
+    }
 
     return 0;
 }
@@ -121,9 +137,11 @@ static const VMStateDescription xen_overlay_vmstate = {
     .version_id = 1,
     .minimum_version_id = 1,
     .needed = xen_overlay_is_needed,
+    .pre_save = xen_overlay_pre_save,
     .post_load = xen_overlay_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT64(shinfo_gpa, XenOverlayState),
+        VMSTATE_BOOL(long_mode, XenOverlayState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -203,3 +221,47 @@ void *xen_overlay_get_shinfo_ptr(void)
 
     return s->shinfo_ptr;
 }
+
+int xen_sync_long_mode(void)
+{
+    int ret;
+    struct kvm_xen_hvm_attr xa = {
+        .type = KVM_XEN_ATTR_TYPE_LONG_MODE,
+    };
+
+    if (!xen_overlay_singleton) {
+        return -ENOENT;
+    }
+
+    ret = kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_GET_ATTR, &xa);
+    if (!ret) {
+        xen_overlay_singleton->long_mode = xa.u.long_mode;
+    }
+
+    return ret;
+}
+
+int xen_set_long_mode(bool long_mode)
+{
+    int ret;
+    struct kvm_xen_hvm_attr xa = {
+        .type = KVM_XEN_ATTR_TYPE_LONG_MODE,
+        .u.long_mode = long_mode,
+    };
+
+    if (!xen_overlay_singleton) {
+        return -ENOENT;
+    }
+
+    ret = kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_SET_ATTR, &xa);
+    if (!ret) {
+        xen_overlay_singleton->long_mode = xa.u.long_mode;
+    }
+
+    return ret;
+}
+
+bool xen_is_long_mode(void)
+{
+    return xen_overlay_singleton && xen_overlay_singleton->long_mode;
+}
diff --git a/hw/i386/kvm/xen_overlay.h b/hw/i386/kvm/xen_overlay.h
index 00cff05bb0..5c46a0b036 100644
--- a/hw/i386/kvm/xen_overlay.h
+++ b/hw/i386/kvm/xen_overlay.h
@@ -17,4 +17,8 @@ void xen_overlay_create(void);
 int xen_overlay_map_shinfo_page(uint64_t gpa);
 void *xen_overlay_get_shinfo_ptr(void);
 
+int xen_sync_long_mode(void);
+int xen_set_long_mode(bool long_mode);
+bool xen_is_long_mode(void);
+
 #endif /* QEMU_XEN_OVERLAY_H */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 5579e012ed..e1a5663284 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -20,6 +20,8 @@
 #include "trace.h"
 #include "sysemu/runstate.h"
 
+#include "hw/i386/kvm/xen_overlay.h"
+
 #include "standard-headers/xen/version.h"
 #include "standard-headers/xen/sched.h"
 
@@ -282,6 +284,16 @@ int kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
         return -1;
     }
 
+    /*
+     * The kernel latches the guest 32/64 mode when the MSR is used to fill
+     * the hypercall page. So if we see a hypercall in a mode that doesn't
+     * match our own idea of the guest mode, fetch the kernel's idea of the
+     * "long mode" to remain in sync.
+     */
+    if (exit->u.hcall.longmode != xen_is_long_mode()) {
+        xen_sync_long_mode();
+    }
+
     if (!do_kvm_xen_handle_exit(cpu, exit)) {
         /*
          * Some hypercalls will be deliberately "implemented" by returning
-- 
2.39.0


