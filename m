Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C629619CDE
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 17:17:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqzMs-0000Uo-4k; Fri, 04 Nov 2022 12:16:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqzLw-0006UY-Qc
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:15:38 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqzLq-0000gt-96
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:15:31 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso5723837wme.5
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 09:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gLOBIeXxFQHn8NKIeCIiWY2W/ASCn2XAaQBn9bK18Gk=;
 b=hcjfI/qZk3A4T50D5mS2JIIswiG49UGB/+QEiMArwm8MgVVtpcm6eFLeHaa0Q0BYpD
 98McuAUVzjTObsgIOiXnhBG54qktzcS3xQzsTc+qrTL4RViVbf0mjfpQlmRcOFIURy/G
 w00uyHNdb+hm0QjzufqsC6RT06k4HFMWEEpRvHUw9fjBfgKwXe0kSxLMC6Ec7Jpe1fNx
 G9HGGh20YpnR+JbZFoI4Bft872pIM+CYb/O7dNkDCHGtfDFhrnXEx+JtjLifFgfzQtmf
 c65FHXac/VNlf3REXe7HMOyMA9AfF3jHICs6X6dZUcoakJlix6buD4LAcbt5PsPTEyJz
 DaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gLOBIeXxFQHn8NKIeCIiWY2W/ASCn2XAaQBn9bK18Gk=;
 b=aLcYv6eYGKkwCRh7fHkB03Kv6hOSSMLdX5Z3SS09AMGnhKC6bbqGb24Cbou3UTcwpW
 Fw64VdFTmu8VZjf033yBU97XYU05V6Lnjc9QI9vc72WQ1ntCWQ0sfYHGFImeqTc91lUZ
 gYKkzwjQ/PFuTu1UpXKRgpOY9Lrc8xX1NVadvsG6CIbFYrGqsjn0BOZYfhdugFYfpJ7O
 1JO9x9Z1QDnTfj2slNBcOT9tso1eaGEGS6SDdjGUnTI+1cOdP2D5Bu/3K0PZ1qNh7b5/
 XV3/DdjqTpqqhV4KtkeLmIcIsoWlp7W8cDWEUAJT7yYqu2aVFYYv7PsbdJuPgp8NdnZ0
 E/Pg==
X-Gm-Message-State: ACrzQf3XQRlc2vOyw+0PePfZxogMf3lInEycu3XuCskgZRf6I55cZXYr
 9LJOeaoa3ojqu8EVUs4inOsa/WyHc87+iA==
X-Google-Smtp-Source: AMsMyM66jWG5irhr6zssaK88QGeP16EBXp1ahfYkcv7sQ9TZb8HFHAw/mPhH/L0S829FD0IZBi3sCA==
X-Received: by 2002:a05:600c:46cd:b0:3c6:f5ab:d383 with SMTP id
 q13-20020a05600c46cd00b003c6f5abd383mr24932132wmo.40.1667578523201; 
 Fri, 04 Nov 2022 09:15:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ay5-20020a5d6f05000000b0022e57e66824sm4649645wrb.99.2022.11.04.09.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 09:15:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH for-8.0 5/9] pci: Use device_cold_reset() and bus_cold_reset()
Date: Fri,  4 Nov 2022 16:15:09 +0000
Message-Id: <20221104161513.2455862-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104161513.2455862-1-peter.maydell@linaro.org>
References: <20221104161513.2455862-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In the PCI subsystem we currently use the legacy function
qdev_reset_all() and qbus_reset_all().  These perform a recursive
reset, starting from either a qbus or a qdev.  However they do not
permit any of the devices in the tree to use three-phase reset,
because device reset goes through the device_legacy_reset() function
that only calls the single DeviceClass::reset method.

Switch to using the device_cold_reset() and bus_cold_reset()
functions.  These also perform a recursive reset, where first the
children are reset and then finally the parent, but they use the new
(...in 2020...) Resettable mechanism, which supports both the old
style single-reset method and also the new 3-phase reset handling.

This should be a no-behaviour-change commit which just reduces the
use of a deprecated API.

Commit created with:
 sed -i -e 's/qdev_reset_all/device_cold_reset/g;s/qbus_reset_all/bus_cold_reset/g' hw/pci/*.c

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/pci/pci.c        | 6 +++---
 hw/pci/pci_bridge.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 2f450f6a728..9d819cbe3b3 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -378,14 +378,14 @@ static void pci_do_device_reset(PCIDevice *dev)
  */
 void pci_device_reset(PCIDevice *dev)
 {
-    qdev_reset_all(&dev->qdev);
+    device_cold_reset(&dev->qdev);
     pci_do_device_reset(dev);
 }
 
 /*
  * Trigger pci bus reset under a given bus.
- * Called via qbus_reset_all on RST# assert, after the devices
- * have been reset qdev_reset_all-ed already.
+ * Called via bus_cold_reset on RST# assert, after the devices
+ * have been reset device_cold_reset-ed already.
  */
 static void pcibus_reset(BusState *qbus)
 {
diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
index da34c8ebcd1..b2b180edd61 100644
--- a/hw/pci/pci_bridge.c
+++ b/hw/pci/pci_bridge.c
@@ -275,7 +275,7 @@ void pci_bridge_write_config(PCIDevice *d,
     newctl = pci_get_word(d->config + PCI_BRIDGE_CONTROL);
     if (~oldctl & newctl & PCI_BRIDGE_CTL_BUS_RESET) {
         /* Trigger hot reset on 0->1 transition. */
-        qbus_reset_all(BUS(&s->sec_bus));
+        bus_cold_reset(BUS(&s->sec_bus));
     }
 }
 
-- 
2.25.1


