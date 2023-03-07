Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A836AFAC2
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 00:50:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZh3d-0005uD-EF; Tue, 07 Mar 2023 18:49:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh3B-0005Eq-K0
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:48:58 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh39-0002tK-SX
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:48:57 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso179496wmq.1
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 15:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678232935;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G/7TZdWIWI2bPNX8WYjN36RNDgq59bbWj+qZFqKNCyM=;
 b=s4imKU1pSGCI846VbPzI+gH3Zvldo+Pu1mqmXJhhbHsfZYtSTokO+Ixo0RHMYbv++8
 AX3rM3XgejjEl9QSIb1+Os5bPqfdP33KYUCUcp4i0RXdPbWCPIe8rbImkB0sWnT5RNG0
 Yqw0ZUee9FfJOPqthq/AFgxxxQnm4i6DHWtV9ww7AzTIsJoARv0j890yCq4sdeBUtQMm
 3ARWxfZSmLiCTHtt7rpEs5G4nwljHsswPx1ogveNdad1FtLBacW53niKDU/v2dJmVBac
 P28RBRd7bLhfQhH6W4w1KExD03wTS/namSaFaauTQZmcQAV8ikP7EHsxDbCiGBGsMS9v
 zlOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678232935;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G/7TZdWIWI2bPNX8WYjN36RNDgq59bbWj+qZFqKNCyM=;
 b=dlb+6OKNk3IWrLC56oP/lfavG70iGX+nh2y7gRvQ3LjwNU23h/5UYo7e+VIDdN0Vh1
 gzxVBV13QvCJcYgUepEsG2aytNaLCsXnxFGmYBt05SHxpzqgR7TXDfNGyQnW1VgpRhTy
 BgsNlyrnG9R4GQW1PBl4meuhuARxrAo6Be2wEVMhT8gxAnDs5YuwjS3XLSxvnL8965WF
 dEc3WOeHXEwvFDTekvfSdrAEvjcwHtZr28sUrkJ6XsOTXZV2HBEBuU7tY9n0S/OimTTs
 Mo8QyP6mfEg6AIPF4aXWT8kiSTrB0IafG++jLVX/WUP8zJyjlF7/AzJTvxGomm49ZRJc
 GHYg==
X-Gm-Message-State: AO0yUKXk7Fe2nEpXHjLNEDTFYoHzr3i23w2zki+zBtwkKI4biPUAgVV2
 iml8TkwPY9OW/elI5OH/PLNhllm2bm8wlhvK4e8=
X-Google-Smtp-Source: AK7set9h8D9mBI07UH1QTrRaK1hXGJ0zQst7fkdZNtBRiXCPVcvKRQilSECdG1sizvvKkToG7d3yFA==
X-Received: by 2002:a1c:7c16:0:b0:3df:9858:c02e with SMTP id
 x22-20020a1c7c16000000b003df9858c02emr14118530wmc.3.1678232934902; 
 Tue, 07 Mar 2023 15:48:54 -0800 (PST)
Received: from localhost.localdomain (57.red-88-29-179.dynamicip.rima-tde.net.
 [88.29.179.57]) by smtp.gmail.com with ESMTPSA id
 z9-20020adfec89000000b002425be3c9e2sm13720376wrn.60.2023.03.07.15.48.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Mar 2023 15:48:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 17/20] hw/usb/ohci: Implement resume on connection status change
Date: Wed,  8 Mar 2023 00:47:08 +0100
Message-Id: <20230307234711.55375-18-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230307234711.55375-1-philmd@linaro.org>
References: <20230307234711.55375-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: BALATON Zoltan <balaton@eik.bme.hu>

If certain bit is set remote wake up should change state from
suspended to resume and generate interrupt. There was a todo comment
for this, implement that by moving existing resume logic to a function
and call that.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <35c4d4ccf2f73e6a87cdbd28fb6a1b33de72ed74.1676916640.git.balaton@eik.bme.hu>
[PMD: Have ohci_resume() return a boolean]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/hcd-ohci.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 6f8b543243..88d2b4b13c 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -1410,6 +1410,18 @@ static void ohci_set_hub_status(OHCIState *ohci, uint32_t val)
     }
 }
 
+/* This is the one state transition the controller can do by itself */
+static bool ohci_resume(OHCIState *s)
+{
+    if ((s->ctl & OHCI_CTL_HCFS) == OHCI_USB_SUSPEND) {
+        trace_usb_ohci_remote_wakeup(s->name);
+        s->ctl &= ~OHCI_CTL_HCFS;
+        s->ctl |= OHCI_USB_RESUME;
+        return true;
+    }
+    return false;
+}
+
 /*
  * Sets a flag in a port status reg but only set it if the port is connected.
  * If not set ConnectStatusChange flag. If flag is enabled return 1.
@@ -1426,7 +1438,10 @@ static int ohci_port_set_if_connected(OHCIState *ohci, int i, uint32_t val)
     if (!(ohci->rhport[i].ctrl & OHCI_PORT_CCS)) {
         ohci->rhport[i].ctrl |= OHCI_PORT_CSC;
         if (ohci->rhstatus & OHCI_RHS_DRWE) {
-            /* TODO: CSC is a wakeup event */
+            /* CSC is a wakeup event */
+            if (ohci_resume(ohci)) {
+                ohci_set_interrupt(ohci, OHCI_INTR_RD);
+            }
         }
         return 0;
     }
@@ -1828,11 +1843,7 @@ static void ohci_wakeup(USBPort *port1)
         intr = OHCI_INTR_RHSC;
     }
     /* Note that the controller can be suspended even if this port is not */
-    if ((s->ctl & OHCI_CTL_HCFS) == OHCI_USB_SUSPEND) {
-        trace_usb_ohci_remote_wakeup(s->name);
-        /* This is the one state transition the controller can do by itself */
-        s->ctl &= ~OHCI_CTL_HCFS;
-        s->ctl |= OHCI_USB_RESUME;
+    if (ohci_resume(s)) {
         /*
          * In suspend mode only ResumeDetected is possible, not RHSC:
          * see the OHCI spec 5.1.2.3.
-- 
2.38.1


