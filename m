Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4724366D14D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 23:06:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHXXR-0002p4-MM; Mon, 16 Jan 2023 17:01:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+491b11caf3ce55304f6a+7085+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pHXUz-0006ry-VK
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 16:58:37 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+491b11caf3ce55304f6a+7085+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pHXUt-0003e4-Qr
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 16:58:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=xD96yzlJIFD6DNCbcae/hNZZFl15kbUpOd8ZpCU9kWM=; b=MXhODXriZ3iPcAmdGJmJql+3G/
 TJ2a98YvmwPcxWY6HXgOkjXB2ldIYGupWSpknMFwvtYXVX9SolIRBtZEc3bn56ycZxEx3aAVqhkrD
 tfeg9jamANMo3md6djJPDwrTXDyJr5UzzAJHmQsmLo1/fdQq8vNEemKNXc44CTvm5DJq4hVWN2qgN
 WcF+5zIgWKLDQopqYJVTePqqs3I1Qksfa/sGsHCvaQLT3gW8WWxCLxV5EBhIpN+RcJQHQJdw64Yg2
 D1CsIV9ibn7uBmrgx2XHLQzFEnHST0VJFlN4oeaz/GtN0E9hAUWGcXGzCswJl1FGL1h6w6h0hF57x
 DPuOyayw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pHXUO-005jRl-07; Mon, 16 Jan 2023 21:58:02 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pHXUW-004iPW-33; Mon, 16 Jan 2023 21:58:08 +0000
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
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
Subject: [PATCH v7 28/51] hw/xen: Implement EVTCHNOP_status
Date: Mon, 16 Jan 2023 21:57:42 +0000
Message-Id: <20230116215805.1123514-29-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116215805.1123514-1-dwmw2@infradead.org>
References: <20230116215805.1123514-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+491b11caf3ce55304f6a+7085+infradead.org+dwmw2@desiato.srs.infradead.org;
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

This adds the basic structure for maintaining the port table and reporting
the status of ports therein.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_evtchn.c  | 104 ++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h  |   3 ++
 include/sysemu/kvm_xen.h  |   3 ++
 target/i386/kvm/xen-emu.c |  20 +++++++-
 4 files changed, 128 insertions(+), 2 deletions(-)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 018f4ef4da..ff143a8134 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -22,6 +22,7 @@
 #include "hw/sysbus.h"
 #include "hw/xen/xen.h"
 #include "xen_evtchn.h"
+#include "xen_overlay.h"
 
 #include "sysemu/kvm.h"
 #include "sysemu/kvm_xen.h"
@@ -33,6 +34,22 @@
 #define TYPE_XEN_EVTCHN "xen-evtchn"
 OBJECT_DECLARE_SIMPLE_TYPE(XenEvtchnState, XEN_EVTCHN)
 
+typedef struct XenEvtchnPort {
+    uint32_t vcpu;      /* Xen/ACPI vcpu_id */
+    uint16_t type;      /* EVTCHNSTAT_xxxx */
+    uint16_t type_val;  /* pirq# / virq# / remote port according to type */
+} XenEvtchnPort;
+
+#define COMPAT_EVTCHN_2L_NR_CHANNELS            1024
+
+/*
+ * For unbound/interdomain ports there are only two possible remote
+ * domains; self and QEMU. Use a single high bit in type_val for that,
+ * and the low bits for the remote port number (or 0 for unbound).
+ */
+#define PORT_INFO_TYPEVAL_REMOTE_QEMU           0x8000
+#define PORT_INFO_TYPEVAL_REMOTE_PORT_MASK      0x7FFF
+
 struct XenEvtchnState {
     /*< private >*/
     SysBusDevice busdev;
@@ -42,6 +59,8 @@ struct XenEvtchnState {
     bool evtchn_in_kernel;
 
     QemuMutex port_lock;
+    uint32_t nr_ports;
+    XenEvtchnPort port_table[EVTCHN_2L_NR_CHANNELS];
 };
 
 struct XenEvtchnState *xen_evtchn_singleton;
@@ -65,6 +84,18 @@ static bool xen_evtchn_is_needed(void *opaque)
     return xen_mode == XEN_EMULATE;
 }
 
+static const VMStateDescription xen_evtchn_port_vmstate = {
+    .name = "xen_evtchn_port",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(vcpu, XenEvtchnPort),
+        VMSTATE_UINT16(type, XenEvtchnPort),
+        VMSTATE_UINT16(type_val, XenEvtchnPort),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription xen_evtchn_vmstate = {
     .name = "xen_evtchn",
     .version_id = 1,
@@ -73,6 +104,9 @@ static const VMStateDescription xen_evtchn_vmstate = {
     .post_load = xen_evtchn_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT64(callback_param, XenEvtchnState),
+        VMSTATE_UINT32(nr_ports, XenEvtchnState),
+        VMSTATE_STRUCT_VARRAY_UINT32(port_table, XenEvtchnState, nr_ports, 1,
+                                     xen_evtchn_port_vmstate, XenEvtchnPort),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -146,3 +180,73 @@ int xen_evtchn_set_callback_param(uint64_t param)
 
     return ret;
 }
+
+static bool valid_port(evtchn_port_t port)
+{
+    if (!port) {
+        return false;
+    }
+
+    if (xen_is_long_mode()) {
+        return port < EVTCHN_2L_NR_CHANNELS;
+    } else {
+        return port < COMPAT_EVTCHN_2L_NR_CHANNELS;
+    }
+}
+
+int xen_evtchn_status_op(struct evtchn_status *status)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    XenEvtchnPort *p;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    if (status->dom != DOMID_SELF && status->dom != xen_domid) {
+        return -ESRCH;
+    }
+
+    if (!valid_port(status->port)) {
+        return -EINVAL;
+    }
+
+    qemu_mutex_lock(&s->port_lock);
+
+    p = &s->port_table[status->port];
+
+    status->status = p->type;
+    status->vcpu = p->vcpu;
+
+    switch (p->type) {
+    case EVTCHNSTAT_unbound:
+        if (p->type_val & PORT_INFO_TYPEVAL_REMOTE_QEMU) {
+            status->u.unbound.dom = DOMID_QEMU;
+        } else {
+            status->u.unbound.dom = xen_domid;
+        }
+        break;
+
+    case EVTCHNSTAT_interdomain:
+        if (p->type_val & PORT_INFO_TYPEVAL_REMOTE_QEMU) {
+            status->u.interdomain.dom = DOMID_QEMU;
+        } else {
+            status->u.interdomain.dom = xen_domid;
+        }
+
+        status->u.interdomain.port = p->type_val &
+            PORT_INFO_TYPEVAL_REMOTE_PORT_MASK;
+        break;
+
+    case EVTCHNSTAT_pirq:
+        status->u.pirq = p->type_val;
+        break;
+
+    case EVTCHNSTAT_virq:
+        status->u.virq = p->type_val;
+        break;
+    }
+
+    qemu_mutex_unlock(&s->port_lock);
+    return 0;
+}
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index c9b7f9d11f..76467636ee 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -15,4 +15,7 @@
 void xen_evtchn_create(void);
 int xen_evtchn_set_callback_param(uint64_t param);
 
+struct evtchn_status;
+int xen_evtchn_status_op(struct evtchn_status *status);
+
 #endif /* QEMU_XEN_EVTCHN_H */
diff --git a/include/sysemu/kvm_xen.h b/include/sysemu/kvm_xen.h
index ee53294deb..2192ceea10 100644
--- a/include/sysemu/kvm_xen.h
+++ b/include/sysemu/kvm_xen.h
@@ -16,6 +16,9 @@
 #define INVALID_GPA UINT64_MAX
 #define INVALID_GFN UINT64_MAX
 
+/* Qemu plays the rôle of dom0 for "interdomain" communication. */
+#define DOMID_QEMU  0
+
 uint32_t kvm_xen_get_caps(void);
 void *kvm_xen_get_vcpu_info_hva(uint32_t vcpu_id);
 void kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id, int type);
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index d04d858912..75dd15aa32 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -765,9 +765,10 @@ static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     return true;
 }
 
-static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit,
+static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit, X86CPU *cpu,
                                     int cmd, uint64_t arg)
 {
+    CPUState *cs = CPU(cpu);
     int err = -ENOSYS;
 
     switch (cmd) {
@@ -778,6 +779,21 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit,
         err = -ENOSYS;
         break;
 
+    case EVTCHNOP_status: {
+        struct evtchn_status status;
+
+        qemu_build_assert(sizeof(status) == 24);
+        if (kvm_copy_from_gva(cs, arg, &status, sizeof(status))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_evtchn_status_op(&status);
+        if (!err && kvm_copy_to_gva(cs, arg, &status, sizeof(status))) {
+            err = -EFAULT;
+        }
+        break;
+    }
     default:
         return false;
     }
@@ -892,7 +908,7 @@ static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
         return kvm_xen_hcall_sched_op(exit, cpu, exit->u.hcall.params[0],
                                       exit->u.hcall.params[1]);
     case __HYPERVISOR_event_channel_op:
-        return kvm_xen_hcall_evtchn_op(exit, exit->u.hcall.params[0],
+        return kvm_xen_hcall_evtchn_op(exit, cpu, exit->u.hcall.params[0],
                                        exit->u.hcall.params[1]);
     case __HYPERVISOR_vcpu_op:
         return kvm_xen_hcall_vcpu_op(exit, cpu,
-- 
2.39.0


