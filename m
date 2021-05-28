Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F9D39442F
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 16:25:47 +0200 (CEST)
Received: from localhost ([::1]:41618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmdQo-00088T-JT
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 10:25:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmdNV-00040C-VX
 for qemu-devel@nongnu.org; Fri, 28 May 2021 10:22:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmdNU-0001qs-10
 for qemu-devel@nongnu.org; Fri, 28 May 2021 10:22:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622211736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=foWSAqxuvmHuom0aGMBD1aSVCP5GIGA4uzRRkkgJuj4=;
 b=E8ZGICLsdjbi8RBg8AMfI7X7w601NApjrTvlRD06t/QX2Lsen8Tk14auS00n/Vg5GMLihP
 IDMm0Wd1YGMlb/Aaf2Y25bSw8h1u/JhKbgYONavRXn4REG7eh/5AYHswgv2P7US49dHBga
 Rjz0jDiklkRMzcsv7GId/N4cRwXeRIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-ep_QpBHzOMiH1N_TGLw1cA-1; Fri, 28 May 2021 10:22:13 -0400
X-MC-Unique: ep_QpBHzOMiH1N_TGLw1cA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAF7C1007467;
 Fri, 28 May 2021 14:22:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3048B1002D71;
 Fri, 28 May 2021 14:22:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D32D71800982; Fri, 28 May 2021 16:22:02 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] hw/usb: hcd-xhci-pci: Fix spec violation of IP flag for
 MSI/MSI-X
Date: Fri, 28 May 2021 16:22:02 +0200
Message-Id: <20210528142202.2154592-4-kraxel@redhat.com>
In-Reply-To: <20210528142202.2154592-1-kraxel@redhat.com>
References: <20210528142202.2154592-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Ruimei Yan <ruimei.yan@windriver.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ruimei Yan <ruimei.yan@windriver.com>

Per xHCI spec v1.2 chapter 4.17.5 page 296:

  If MSI or MSI-X interrupts are enabled, Interrupt Pending (IP)
  shall be cleared automatically when the PCI dword write generated
  by the interrupt assertion is complete.

Currently QEMU does not clear the IP flag in the MSI / MSI-X mode.
This causes subsequent spurious interrupt to be delivered to guests.
To solve this, we change the xhci intr_raise() hook routine to have
a bool return value that is passed to its caller (the xhci core),
with true indicating that IP should be self-cleared.

Fixes: 62c6ae04cf43 ("xhci: Initial xHCI implementation")
Fixes: 4c47f800631a ("xhci: add msix support")
Signed-off-by: Ruimei Yan <ruimei.yan@windriver.com>
[bmeng: move IP clear codes from xhci pci to xhci core]
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <20210521024224.2277634-2-bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-xhci.h        | 2 +-
 hw/usb/hcd-xhci-pci.c    | 8 +++++---
 hw/usb/hcd-xhci-sysbus.c | 4 +++-
 hw/usb/hcd-xhci.c        | 8 ++++++--
 4 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/hw/usb/hcd-xhci.h b/hw/usb/hcd-xhci.h
index 7bba361f3bbd..98f598382adc 100644
--- a/hw/usb/hcd-xhci.h
+++ b/hw/usb/hcd-xhci.h
@@ -194,7 +194,7 @@ typedef struct XHCIState {
     uint32_t flags;
     uint32_t max_pstreams_mask;
     void (*intr_update)(XHCIState *s, int n, bool enable);
-    void (*intr_raise)(XHCIState *s, int n, bool level);
+    bool (*intr_raise)(XHCIState *s, int n, bool level);
     DeviceState *hostOpaque;
 
     /* Operational Registers */
diff --git a/hw/usb/hcd-xhci-pci.c b/hw/usb/hcd-xhci-pci.c
index b6acd1790c1a..e934b1a5b1fb 100644
--- a/hw/usb/hcd-xhci-pci.c
+++ b/hw/usb/hcd-xhci-pci.c
@@ -57,7 +57,7 @@ static void xhci_pci_intr_update(XHCIState *xhci, int n, bool enable)
     }
 }
 
-static void xhci_pci_intr_raise(XHCIState *xhci, int n, bool level)
+static bool xhci_pci_intr_raise(XHCIState *xhci, int n, bool level)
 {
     XHCIPciState *s = container_of(xhci, XHCIPciState, xhci);
     PCIDevice *pci_dev = PCI_DEVICE(s);
@@ -70,13 +70,15 @@ static void xhci_pci_intr_raise(XHCIState *xhci, int n, bool level)
 
     if (msix_enabled(pci_dev) && level) {
         msix_notify(pci_dev, n);
-        return;
+        return true;
     }
 
     if (msi_enabled(pci_dev) && level) {
         msi_notify(pci_dev, n);
-        return;
+        return true;
     }
+
+    return false;
 }
 
 static void xhci_pci_reset(DeviceState *dev)
diff --git a/hw/usb/hcd-xhci-sysbus.c b/hw/usb/hcd-xhci-sysbus.c
index 42e2574c8298..a14e4381960e 100644
--- a/hw/usb/hcd-xhci-sysbus.c
+++ b/hw/usb/hcd-xhci-sysbus.c
@@ -16,11 +16,13 @@
 #include "hw/acpi/aml-build.h"
 #include "hw/irq.h"
 
-static void xhci_sysbus_intr_raise(XHCIState *xhci, int n, bool level)
+static bool xhci_sysbus_intr_raise(XHCIState *xhci, int n, bool level)
 {
     XHCISysbusState *s = container_of(xhci, XHCISysbusState, xhci);
 
     qemu_set_irq(s->irq[n], level);
+
+    return false;
 }
 
 void xhci_sysbus_reset(DeviceState *dev)
diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index 46212b1e695a..e01700039b13 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -551,7 +551,9 @@ static void xhci_intr_update(XHCIState *xhci, int v)
             level = 1;
         }
         if (xhci->intr_raise) {
-            xhci->intr_raise(xhci, 0, level);
+            if (xhci->intr_raise(xhci, 0, level)) {
+                xhci->intr[0].iman &= ~IMAN_IP;
+            }
         }
     }
     if (xhci->intr_update) {
@@ -579,7 +581,9 @@ static void xhci_intr_raise(XHCIState *xhci, int v)
         return;
     }
     if (xhci->intr_raise) {
-        xhci->intr_raise(xhci, v, true);
+        if (xhci->intr_raise(xhci, v, true)) {
+            xhci->intr[v].iman &= ~IMAN_IP;
+        }
     }
 }
 
-- 
2.31.1


