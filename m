Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2320C659862
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 13:44:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBEGA-00087m-2D; Fri, 30 Dec 2022 07:13:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1132f1bfe572585e6c7f+7068+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pBEFv-0007nw-0o
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:12:59 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1132f1bfe572585e6c7f+7068+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pBEFo-0004xt-Qg
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:12:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=KxiQ7bh/Vn6hXlw2lNFLRPHYyiOZJ3Q4CLF+BCbFo1E=; b=dxA6o862RDqa+vqxX7muADmzE1
 RXGpCrL1uFny+pHaNeu0D1zicGQTA4Zj2ZUA6aZFamOoE9y0kgVIVmJfRxelygK41JpzzEEW0uRCU
 UYXJ7HWuDPwsjxE7wLlGW+I5g9pwLduwjFYlzozz5NFh0U0V2vYZYLWxowYO+B2mwEbA2jd0POoY3
 29hMA9ulSb7EgxSd0r8oN9R+xtrQjNCsuCUBgKqYnaoNww+SMhjmreV2YyYwxrVsrq2tisiPcpFlV
 hp90P2tkzt2p9o3FrApVvr+RbDOz0TFj2Bff9Jt3vX+kcNuz0m9TDfyNKNJB8AwHu3ZWb5nNXue+/
 YNLuBiLQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pBEFl-00Ac8X-I5; Fri, 30 Dec 2022 12:12:49 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pBEFa-005Nyy-AU; Fri, 30 Dec 2022 12:12:38 +0000
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
Subject: [RFC PATCH v5 41/52] hw/xen: Support HVM_PARAM_CALLBACK_TYPE_PCI_INTX
 callback
Date: Fri, 30 Dec 2022 12:12:24 +0000
Message-Id: <20221230121235.1282915-42-dwmw2@infradead.org>
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

From: David Woodhouse <dwmw@amazon.co.uk>

The guest is permitted to specify an arbitrary domain/bus/device/function
and INTX pin from which the callback IRQ shall appear to have come.

In QEMU we can only easily do this for devices that actually exist, and
even that requires us "knowing" that it's a PCMachine in order to find
the PCI root bus — although that's OK really because it's always true.

We also don't get to get notified of INTX routing changes, because we
can't do that as a passive observer; if we try to register a notifier
it will overwrite any existing notifier callback on the device.

But in practice, guests using PCI_INTX will only ever use pin A on the
Xen platform device, and won't swizzle the INTX routing after they set
it up. So this is just fine.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_evtchn.c | 73 ++++++++++++++++++++++++++++++++++------
 1 file changed, 62 insertions(+), 11 deletions(-)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 29f5e60172..49caf69dc0 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -25,6 +25,8 @@
 #include "hw/sysbus.h"
 #include "hw/xen/xen.h"
 #include "hw/i386/x86.h"
+#include "hw/i386/pc.h"
+#include "hw/pci/pci.h"
 #include "hw/irq.h"
 
 #include "xen_evtchn.h"
@@ -100,6 +102,7 @@ struct XenEvtchnState {
 
     uint64_t callback_param;
     bool evtchn_in_kernel;
+    uint32_t callback_gsi;
 
     QemuMutex port_lock;
     uint32_t nr_ports;
@@ -205,20 +208,44 @@ static void xen_evtchn_register_types(void)
 
 type_init(xen_evtchn_register_types)
 
+static int set_callback_pci_intx(XenEvtchnState *s, uint64_t param)
+{
+    PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
+    uint8_t pin = param & 3;
+    uint8_t devfn = (param >> 8) & 0xff;
+    uint16_t bus = (param >> 16) & 0xffff;
+    uint16_t domain = (param >> 32) & 0xffff;
+    PCIDevice *pdev;
+    PCIINTxRoute r;
+
+    if (domain || !pcms) {
+        return 0;
+    }
+
+    pdev = pci_find_device(pcms->bus, bus, devfn);
+    if (!pdev) {
+        return 0;
+    }
+
+    r = pci_device_route_intx_to_irq(pdev, pin);
+    if (r.mode != PCI_INTX_ENABLED) {
+        return 0;
+    }
+
+    /*
+     * Hm, can we be notified of INTX routing changes? Not without
+     * *owning* the device and being allowed to overwrite its own
+     * ->intx_routing_notifier, AFAICT. So let's not.
+     */
+    return r.irq;
+}
+
 void xen_evtchn_set_callback_level(int level)
 {
     XenEvtchnState *s = xen_evtchn_singleton;
 
-    if (s) {
-        uint32_t param = (uint32_t)s->callback_param;
-
-        switch (s->callback_param >> CALLBACK_VIA_TYPE_SHIFT) {
-        case HVM_PARAM_CALLBACK_TYPE_GSI:
-            if (param < GSI_NUM_PINS) {
-                qemu_set_irq(s->gsis[param], level);
-            }
-            break;
-        }
+    if (s && s->callback_gsi && s->callback_gsi < GSI_NUM_PINS) {
+        qemu_set_irq(s->gsis[s->callback_gsi], level);
     }
 }
 
@@ -226,6 +253,8 @@ int xen_evtchn_set_callback_param(uint64_t param)
 {
     XenEvtchnState *s = xen_evtchn_singleton;
     bool in_kernel = false;
+    uint32_t gsi = 0;
+    int type = param >> CALLBACK_VIA_TYPE_SHIFT;
     int ret;
 
     if (!s) {
@@ -234,7 +263,7 @@ int xen_evtchn_set_callback_param(uint64_t param)
 
     qemu_mutex_lock(&s->port_lock);
 
-    switch (param >> CALLBACK_VIA_TYPE_SHIFT) {
+    switch (type) {
     case HVM_PARAM_CALLBACK_TYPE_VECTOR: {
         struct kvm_xen_hvm_attr xa = {
             .type = KVM_XEN_ATTR_TYPE_UPCALL_VECTOR,
@@ -245,10 +274,17 @@ int xen_evtchn_set_callback_param(uint64_t param)
         if (!ret && kvm_xen_has_cap(EVTCHN_SEND)) {
             in_kernel = true;
         }
+        gsi = 0;
         break;
     }
 
+    case HVM_PARAM_CALLBACK_TYPE_PCI_INTX:
+        gsi = set_callback_pci_intx(s, param);
+        ret = gsi ? 0 : -EINVAL;
+        break;
+
     case HVM_PARAM_CALLBACK_TYPE_GSI:
+        gsi = (uint32_t)param;
         ret = 0;
         break;
 
@@ -260,6 +296,21 @@ int xen_evtchn_set_callback_param(uint64_t param)
     if (!ret) {
         s->callback_param = param;
         s->evtchn_in_kernel = in_kernel;
+
+        if (gsi != s->callback_gsi) {
+            struct vcpu_info *vi = kvm_xen_get_vcpu_info_hva(0);
+
+            xen_evtchn_set_callback_level(0);
+            s->callback_gsi = gsi;
+
+            if (gsi && vi && vi->evtchn_upcall_pending) {
+                /*
+                 * The vCPU code needs to do it because it needs to set the
+                 * flag in the right order to avoid races with clearing.
+                 */
+                kvm_xen_inject_vcpu_callback_vector(0, type);
+            }
+        }
     }
 
     qemu_mutex_unlock(&s->port_lock);
-- 
2.35.3


