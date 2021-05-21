Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F1538BC9E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 04:44:28 +0200 (CEST)
Received: from localhost ([::1]:38456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljv9H-0001Gf-JX
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 22:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ljv7L-0007jK-Qt
 for qemu-devel@nongnu.org; Thu, 20 May 2021 22:42:27 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ljv7H-0006MY-SQ
 for qemu-devel@nongnu.org; Thu, 20 May 2021 22:42:27 -0400
Received: by mail-wr1-x435.google.com with SMTP id j14so17771164wrq.5
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 19:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0ApThDFfvO+SJjnCQ3BWmfL4+DzpKoc8xzwrjxxGOZo=;
 b=e7+tMUCwCSQSX/KIE0ZSfK7ZFticRTs0I4y/FyjiWgLkj603rFIGWVkggFtU+xv1XK
 hKlZdDannEdED5zedgqtbx1rj6hnzaDB+i0z/jyUrezi84BX4pW4OK9bw+sgr0YR6oPI
 V+SMwgHQ4NORmS6I6O6292OJlNeoxsVUfosJxLqqJbSycI0XkBocZbLfFJIYz87ZrC/W
 1L/yoOoxOCRpzLg7NkkEIxfeZfrD37MaM/HuolgWfdJISrAeD0vRZhj8r598nzVO+BiG
 KxIAszIJzcmM9/VBp7vFB9Pf8F2h0gt1RYdFIjtgqISKEoQoqbeNWUjy4/WTO7eEmgJ1
 Boqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0ApThDFfvO+SJjnCQ3BWmfL4+DzpKoc8xzwrjxxGOZo=;
 b=YKQKv1deRoW7b3pDCejXvr8agmlZI1Y4MOXBTY4K9YzA6Au6ieCttCWh6AKBrprr67
 CjZTHZUxdI4tcE6ee8thIcTq0twAT6tRc4K37AYuLGEbHDQimjAgKmNh7pRLIOiQLLCT
 DSrxN2HE2WHF3tgsGL338PgVW4zD3Lqj82h8tSVZoF4NPLqmPnHhIatzMoPQ+vwTl/WK
 40LibxhW1wE6yojt+xcM06nxUlfkWbUKv1+LF8bqXghHm+ENXeCbfv13ot6AupG6WqyJ
 mEs2GgVsFFikgTBGfDH8NqDbuWt40uaonakY/ftElFNZuaBSeYlVnDP3J4O5OGT/4l6z
 jMFw==
X-Gm-Message-State: AOAM532EGV86vmIkJtG/8JjgQcOSDKKmpp6CLklvZXAOtuO8VT7WTxwI
 GI2zGjEz1mw3OGrHPIzc8Cg=
X-Google-Smtp-Source: ABdhPJwYJzVbTLtLANWzQqszaKjdD1zOT0ciSms5PyEAnaGnoPu07qECFpHFSXbpERC/Ffl8niO1Ag==
X-Received: by 2002:a05:6000:1849:: with SMTP id
 c9mr6809316wri.282.1621564942635; 
 Thu, 20 May 2021 19:42:22 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id f20sm4988976wmh.41.2021.05.20.19.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 19:42:21 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/usb: hcd-xhci-pci: Fix spec violation of IP flag for
 MSI/MSI-X
Date: Fri, 21 May 2021 10:42:24 +0800
Message-Id: <20210521024224.2277634-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210521024224.2277634-1-bmeng.cn@gmail.com>
References: <20210521024224.2277634-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=bmeng.cn@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, Ruimei Yan <ruimei.yan@windriver.com>
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
---

 hw/usb/hcd-xhci.h        | 2 +-
 hw/usb/hcd-xhci-pci.c    | 8 +++++---
 hw/usb/hcd-xhci-sysbus.c | 4 +++-
 hw/usb/hcd-xhci.c        | 8 ++++++--
 4 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/hw/usb/hcd-xhci.h b/hw/usb/hcd-xhci.h
index 7bba361f3b..98f598382a 100644
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
index b6acd1790c..e934b1a5b1 100644
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
index 42e2574c82..a14e438196 100644
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
index 46212b1e69..e01700039b 100644
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
2.25.1


