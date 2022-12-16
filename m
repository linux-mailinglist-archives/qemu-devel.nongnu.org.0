Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 891D264E559
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 01:45:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5ynS-0005Hu-AU; Thu, 15 Dec 2022 19:41:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+64e888c4aa1bfc596c85+7054+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p5ynC-0005Dn-Dj
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 19:41:40 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+64e888c4aa1bfc596c85+7054+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p5yn5-0006aa-IL
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 19:41:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=RRDYboOhQxbNNkVR+5pAKTs2a3rx182wi51/Plqb2lg=; b=Y1eNd2/DBOsfQEw1cyYc7rZ+Vr
 7UF59iLongvkas5Z6+gAH1OpeQNuA0VB3lDWnc236F1kcf4QFtDtZLLDjLiKLIt6FmmSKx7ofCfGz
 coylGSgANxfpcb1eaVux6Yag2MPP+aRGM8acN48gWwLpLjU63ffbLrNR04MeQaY9JPwe0+Ozq4+Ff
 eD5Y167E86mET/6u3XrAzWaikRpgxCcrs0atDkSpEFaUfLNAYtBisfFXcBOrw2fDRthN+LHSMaoD1
 wpjc686X05pqxMvyI9ZwKcoi4JqjIS6oTSWenJBXLa/SEYQNzfO1uH5Uk3lhCBVsbzcVjhl7eVeN0
 O8uhYUdw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p5yn6-00EvVM-FG; Fri, 16 Dec 2022 00:41:35 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p5ymw-003cQW-JZ; Fri, 16 Dec 2022 00:41:22 +0000
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
Subject: [RFC PATCH v3 38/38] hw/xen: Support HVM_PARAM_CALLBACK_TYPE_PCI_INTX
 callback
Date: Fri, 16 Dec 2022 00:41:17 +0000
Message-Id: <20221216004117.862106-39-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221216004117.862106-1-dwmw2@infradead.org>
References: <20221216004117.862106-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 hw/i386/kvm/xen_evtchn.c | 70 +++++++++++++++++++++++++++++++++-------
 1 file changed, 58 insertions(+), 12 deletions(-)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 8ea8cf550e..2852b46b45 100644
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
     /*< public >*/
 
     uint64_t callback_param;
+    uint32_t callback_gsi;
 
     QemuMutex port_lock;
     uint32_t nr_ports;
@@ -201,11 +204,50 @@ static void xen_evtchn_register_types(void)
 
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
+    if (domain || !pcms)
+        return 0;
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
+static void xen_evtchn_set_callback_level(XenEvtchnState *s, int level)
+{
+    if (s->callback_gsi && s->callback_gsi < GSI_NUM_PINS) {
+        qemu_set_irq(s->gsis[s->callback_gsi], level);
+    }
+}
+
 #define CALLBACK_VIA_TYPE_SHIFT       56
 
 int xen_evtchn_set_callback_param(uint64_t param)
 {
     XenEvtchnState *s = xen_evtchn_singleton;
+    uint32_t gsi = 0;
     int ret = -ENOSYS;
 
     if (!s) {
@@ -220,31 +262,35 @@ int xen_evtchn_set_callback_param(uint64_t param)
         };
 
         ret = kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_SET_ATTR, &xa);
+        gsi = 0;
         break;
     }
     case HVM_PARAM_CALLBACK_TYPE_GSI:
+        gsi = (uint32_t)param;
         ret = 0;
         break;
+
+    case HVM_PARAM_CALLBACK_TYPE_PCI_INTX:
+        gsi = set_callback_pci_intx(s, param);
+        ret = gsi ? 0 : -EINVAL;
+        break;
     }
 
     if (!ret) {
         s->callback_param = param;
-    }
-
-    return ret;
-}
+        if (gsi != s->callback_gsi) {
+            struct vcpu_info *vi = kvm_xen_get_vcpu_info_hva(0);
 
-static void xen_evtchn_set_callback_level(XenEvtchnState *s, int level)
-{
-    uint32_t param = (uint32_t)s->callback_param;
+            xen_evtchn_set_callback_level(s, 0);
+            s->callback_gsi = gsi;
 
-    switch (s->callback_param >> CALLBACK_VIA_TYPE_SHIFT) {
-    case HVM_PARAM_CALLBACK_TYPE_GSI:
-        if (param < GSI_NUM_PINS) {
-            qemu_set_irq(s->gsis[param], level);
+            if (gsi && vi && vi->evtchn_upcall_pending) {
+                xen_evtchn_set_callback_level(s, 1);
+            }
         }
-        break;
     }
+
+    return ret;
 }
 
 static void inject_callback(XenEvtchnState *s, uint32_t vcpu)
-- 
2.35.3


