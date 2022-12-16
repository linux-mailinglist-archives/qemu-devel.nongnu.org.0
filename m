Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0379064E550
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 01:43:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5yo5-0005kS-AA; Thu, 15 Dec 2022 19:42:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+64e888c4aa1bfc596c85+7054+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p5ynI-0005Fm-GK
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 19:41:46 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+64e888c4aa1bfc596c85+7054+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p5ynC-0006bN-MQ
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 19:41:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=xiB6Zv+Mz0wwjJUtAaHEfH8WlJgQDa7qtA4LR5bBdHw=; b=mJtZn28/rnNUFfTedCt8iI8TDZ
 tDuL8iecL2XNh7zI3M61euWsD7o9HC4V+9Jq4KxsuaeQTuh9Iiotzrup9/Zqg7kTd9vFSZQ9NUbsg
 3gAq9Ji+CnAT8s0Ksvk6SzlD06ySb2hSLCQCaWnPt/N+khmewRjZIgQqSMwBMP13ASddHhsWNoz5s
 OFuIe8oSJktsdnoH+fWgepwAs6+rHWOPLRdFppR1j/txzay2IgK501S0HcB7gkodcl3XTW5bxQAT+
 FLWEOMsNXnjhjdDACxlmmHZhjz73FyBO1Ancs/PpNJw2DmP4z1hJJOFD8Aj+qxvPivJt8XodFVbDi
 mPJyaN6Q==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p5yn6-00EvUz-7B; Fri, 16 Dec 2022 00:41:36 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p5ymw-003cPI-9L; Fri, 16 Dec 2022 00:41:22 +0000
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
Subject: [RFC PATCH v3 25/38] hw/xen: Implement EVTCHNOP_status
Date: Fri, 16 Dec 2022 00:41:04 +0000
Message-Id: <20221216004117.862106-26-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221216004117.862106-1-dwmw2@infradead.org>
References: <20221216004117.862106-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+64e888c4aa1bfc596c85+7054+infradead.org+dwmw2@casper.srs.infradead.org;
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

From: David Woodhouse <dwmw@amazon.co.uk>

This adds the basic structure for maintaining the port table and reporting
the status of ports therein.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_evtchn.c  | 108 +++++++++++++++++++++++++++++++++++++-
 hw/i386/kvm/xen_evtchn.h  |   4 ++
 target/i386/kvm/xen-emu.c |  21 +++++++-
 3 files changed, 130 insertions(+), 3 deletions(-)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 1ca0c034e7..77acf58540 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -22,6 +22,7 @@
 #include "hw/sysbus.h"
 #include "hw/xen/xen.h"
 #include "xen_evtchn.h"
+#include "xen_overlay.h"
 
 #include "sysemu/kvm.h"
 #include <linux/kvm.h>
@@ -32,12 +33,34 @@
 #define TYPE_XEN_EVTCHN "xenevtchn"
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
+#define DOMID_QEMU      0
+
 struct XenEvtchnState {
     /*< private >*/
     SysBusDevice busdev;
     /*< public >*/
 
     uint64_t callback_param;
+
+    QemuMutex port_lock;
+    uint32_t nr_ports;
+    XenEvtchnPort port_table[EVTCHN_2L_NR_CHANNELS];
 };
 
 struct XenEvtchnState *xen_evtchn_singleton;
@@ -58,6 +81,18 @@ static bool xen_evtchn_is_needed(void *opaque)
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
@@ -66,6 +101,9 @@ static const VMStateDescription xen_evtchn_vmstate = {
     .post_load = xen_evtchn_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT64(callback_param, XenEvtchnState),
+        VMSTATE_UINT32(nr_ports, XenEvtchnState),
+        VMSTATE_STRUCT_VARRAY_UINT32(port_table, XenEvtchnState, nr_ports, 1,
+                                     xen_evtchn_port_vmstate, XenEvtchnPort),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -86,7 +124,10 @@ static const TypeInfo xen_evtchn_info = {
 
 void xen_evtchn_create(void)
 {
-    xen_evtchn_singleton = XEN_EVTCHN(sysbus_create_simple(TYPE_XEN_EVTCHN, -1, NULL));
+    XenEvtchnState *s = XEN_EVTCHN(sysbus_create_simple(TYPE_XEN_EVTCHN, -1, NULL));
+    xen_evtchn_singleton = s;
+
+    qemu_mutex_init(&s->port_lock);
 }
 
 static void xen_evtchn_register_types(void)
@@ -115,3 +156,68 @@ int xen_evtchn_set_callback_param(uint64_t param)
     }
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
+    if (status->dom != DOMID_SELF && status->dom != xen_domid)
+        return -EPERM;
+
+    if (!valid_port(status->port))
+        return -EINVAL;
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
+        if (p->type_val & PORT_INFO_TYPEVAL_REMOTE_QEMU)
+            status->u.unbound.dom = DOMID_QEMU;
+        else
+            status->u.unbound.dom = xen_domid;
+        break;
+
+    case EVTCHNSTAT_interdomain:
+        if (p->type_val & PORT_INFO_TYPEVAL_REMOTE_QEMU)
+            status->u.interdomain.dom = DOMID_QEMU;
+        else
+            status->u.interdomain.dom = xen_domid;
+
+        status->u.interdomain.port = p->type_val & PORT_INFO_TYPEVAL_REMOTE_PORT_MASK;
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
index 11c6ed22a0..6f50e5c52d 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -9,5 +9,9 @@
  * See the COPYING file in the top-level directory.
  */
 
+
 void xen_evtchn_create(void);
 int xen_evtchn_set_callback_param(uint64_t param);
+
+struct evtchn_status;
+int xen_evtchn_status_op(struct evtchn_status *status);
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 1ff6d32edd..d4a35bef64 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -614,15 +614,32 @@ static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     return true;
 }
 
-static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit,
+static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit, X86CPU *cpu,
                                     int cmd, uint64_t arg)
 {
+    CPUState *cs = CPU(cpu);
     int err = -ENOSYS;
 
     switch (cmd) {
     case EVTCHNOP_init_control:
         err = -ENOSYS;
         break;
+
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
@@ -698,7 +715,7 @@ static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
         return kvm_xen_hcall_sched_op(exit, cpu, exit->u.hcall.params[0],
                                       exit->u.hcall.params[1]);
     case __HYPERVISOR_event_channel_op:
-        return kvm_xen_hcall_evtchn_op(exit, exit->u.hcall.params[0],
+        return kvm_xen_hcall_evtchn_op(exit, cpu, exit->u.hcall.params[0],
                                        exit->u.hcall.params[1]);
     case __HYPERVISOR_vcpu_op:
         return kvm_xen_hcall_vcpu_op(exit, cpu,
-- 
2.35.3


