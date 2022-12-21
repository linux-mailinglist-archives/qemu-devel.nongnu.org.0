Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F20F8652ABC
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 02:08:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7nZV-0002zW-HZ; Tue, 20 Dec 2022 20:07:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+b12bb331c036832273ad+7059+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p7nZJ-0002sR-6P
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 20:06:52 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+b12bb331c036832273ad+7059+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p7nZD-0004Co-Hd
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 20:06:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=ZW3s2Qsfwuopt/mqCLPAEP5Jw9o6pW/UPVLYRZdFeQQ=; b=Wi16J2tnBZPd8WNnjU+wL5ClIS
 15cXeaMOIFSCVIYMtjLwPa4m8zxuUp12BzR/fnnj5UB4jyc0Q3Bb/e1RglZ+nOqX3KfmMHm96FlKD
 L5mb5n2WK2v20XuJczZJjwaRRQpJWRH2/jpzL7tvkipXnARYU7YSdXjOc24+jnSjJ+40dDlPM5vNJ
 S9/yQxOO3oK+XxTO0qGofVokf1Fzl1NnYmQzZd/+oHqFxedovJTppO3cy89IQ8f6jC9btV05hwKu0
 ClzApTCXXF2Sx7A86AQDDOwdQT/pssFa8YE1brgGbzA/uC5sWf/+z872veMuBZ+Kj3EdbIXfvc2dY
 mZs1gyyw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p7nZ8-002Kcf-Ev; Wed, 21 Dec 2022 01:06:39 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p7nYx-004CNN-89; Wed, 21 Dec 2022 01:06:27 +0000
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
Subject: [RFC PATCH v4 41/47] hw/xen: Support HVM_PARAM_CALLBACK_TYPE_PCI_INTX
 callback
Date: Wed, 21 Dec 2022 01:06:17 +0000
Message-Id: <20221221010623.1000191-42-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221221010623.1000191-1-dwmw2@infradead.org>
References: <20221221010623.1000191-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+b12bb331c036832273ad+7059+infradead.org+dwmw2@casper.srs.infradead.org;
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
 hw/i386/kvm/xen_evtchn.c | 69 ++++++++++++++++++++++++++++++++++------
 1 file changed, 60 insertions(+), 9 deletions(-)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 255795b6e2..6f9fa78c69 100644
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
@@ -205,16 +208,42 @@ static void xen_evtchn_register_types(void)
 
 type_init(xen_evtchn_register_types)
 
-static void xen_evtchn_set_callback_level(XenEvtchnState *s, int level)
+static int set_callback_pci_intx(XenEvtchnState *s, uint64_t param)
 {
-    uint32_t param = (uint32_t)s->callback_param;
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
 
-    switch (s->callback_param >> CALLBACK_VIA_TYPE_SHIFT) {
-    case HVM_PARAM_CALLBACK_TYPE_GSI:
-        if (param < GSI_NUM_PINS) {
-            qemu_set_irq(s->gsis[param], level);
-        }
-        break;
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
+static void xen_evtchn_set_callback_level(XenEvtchnState *s, int level)
+{
+    if (s->callback_gsi && s->callback_gsi < GSI_NUM_PINS) {
+        qemu_set_irq(s->gsis[s->callback_gsi], level);
     }
 }
 
@@ -231,6 +260,8 @@ int xen_evtchn_set_callback_param(uint64_t param)
 {
     XenEvtchnState *s = xen_evtchn_singleton;
     bool in_kernel = false;
+    uint32_t gsi = 0;
+    int type = param >> CALLBACK_VIA_TYPE_SHIFT;
     int ret;
 
     if (!s) {
@@ -239,7 +270,7 @@ int xen_evtchn_set_callback_param(uint64_t param)
 
     qemu_mutex_lock(&s->port_lock);
 
-    switch (param >> CALLBACK_VIA_TYPE_SHIFT) {
+    switch (type) {
     case HVM_PARAM_CALLBACK_TYPE_VECTOR: {
         struct kvm_xen_hvm_attr xa = {
             .type = KVM_XEN_ATTR_TYPE_UPCALL_VECTOR,
@@ -250,10 +281,17 @@ int xen_evtchn_set_callback_param(uint64_t param)
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
 
@@ -265,6 +303,19 @@ int xen_evtchn_set_callback_param(uint64_t param)
     if (!ret) {
         s->callback_param = param;
         s->evtchn_in_kernel = in_kernel;
+
+        if (gsi != s->callback_gsi) {
+            struct vcpu_info *vi = kvm_xen_get_vcpu_info_hva(0);
+
+            xen_evtchn_set_callback_level(s, 0);
+            s->callback_gsi = gsi;
+
+            if (gsi && vi && vi->evtchn_upcall_pending) {
+                /* The KVM code needs to know to check and deassert */
+                kvm_xen_inject_vcpu_callback_vector(0, type);
+                xen_evtchn_set_callback_level(s, 1);
+            }
+        }
     }
 
     qemu_mutex_unlock(&s->port_lock);
-- 
2.35.3


