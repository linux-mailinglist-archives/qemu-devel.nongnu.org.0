Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF39415DF9
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 14:16:36 +0200 (CEST)
Received: from localhost ([::1]:59752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTNeV-0002R0-Hh
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 08:16:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTNa8-0008DW-IA
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 08:12:04 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTNa2-00006M-Tg
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 08:12:04 -0400
Received: by mail-wr1-x432.google.com with SMTP id d21so16444412wra.12
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 05:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Aebt9h6je0rGRtTCsuE2EkTvb8UCEL9VpN1x+WjtHz4=;
 b=Uej+exY9ASfcJY74lGUMC1fEf19xCqY+sgUQ+iESjEoHLr/AHwwFKyoZyDr9yH73MS
 2vqNyAUd6J/kU2pwH9QP8Afw99mOb2ZGyIeD9lLXv5+SU49QNMbFVFHEoEQkGLR9zxzy
 u0lj3DW2EsdZPID38/qhjI/pifgr55JKFCz8WEj1bGRhvPk/XgAjo/sIgw35Pa32q/5L
 jXrF/6IS+oJgesF8zbld9Xwdk/EvJFIUUFU3JwBa1DPeVt5XF77GBefk1GZ5i5Hx+HNj
 QhVzzjZTsF1X7015Yr2Go1EKRu/AfCndKRP+CLmhykaIKpPGA3AHyWrYlizJ3rwin6mW
 B6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Aebt9h6je0rGRtTCsuE2EkTvb8UCEL9VpN1x+WjtHz4=;
 b=TafvU/xhaLzKVk2rXXiZk/AxxgwAB5OaiyRP8Gmu7WsZ9Y65yaUfwM7bX9pqZ4Ql6P
 NVjs8/x0h9p3i8IkUDUFUOA4HeE9BH+0PbWNbDzT0lN6cTP7y0fty3uQcOAU161R7wzy
 gKHSWrHXNAF8WHAbPNbhnP6AaHDxksxZhRM3Ympm2870vFqY9ujNNEdPti/WR0D+OI8M
 ghgz8NInwrpwaR/G46REr2tPkVQTUYoFKT1TKunasYxGezFlHGvUN5FGTl65VP5srPIW
 HWtwmQU5ekQ2ssSL2GCjfP0/MEaqUGPdUMgZG3Sy1iEUANDmUmOGhC52OusvgR59RCPQ
 LPtw==
X-Gm-Message-State: AOAM531MzedUAafORNm++pE2rWQ3u4nbIJxw1pCR0yPw2C0FSohmJzIK
 y2IHU2oWBrKUbfiANC1hRH2DZ7xgbx9oIA==
X-Google-Smtp-Source: ABdhPJzhejrA5clNQ7HEMRReckmt0p8jtNrZttlukZSPFbYvKSFZzv+H1Inr7xB0dWCUok10ck02uQ==
X-Received: by 2002:a5d:6c6f:: with SMTP id r15mr4721900wrz.428.1632399117454; 
 Thu, 23 Sep 2021 05:11:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t22sm1382349wmj.30.2021.09.23.05.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 05:11:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] scsi: Replace scsi_bus_new() with scsi_bus_init(),
 scsi_bus_init_named()
Date: Thu, 23 Sep 2021 13:11:48 +0100
Message-Id: <20210923121153.23754-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210923121153.23754-1-peter.maydell@linaro.org>
References: <20210923121153.23754-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Fam Zheng <fam@euphon.net>, Alberto Garcia <berto@igalia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function scsi_bus_new() creates a new SCSI bus; callers can
either pass in a name argument to specify the name of the new bus, or
they can pass in NULL to allow the bus to be given an automatically
generated unique name.  Almost all callers want to use the
autogenerated name; the only exception is the virtio-scsi device.

Taking a name argument that should almost always be NULL is an
easy-to-misuse API design -- it encourages callers to think perhaps
they should pass in some standard name like "scsi" or "scsi-bus".  We
don't do this anywhere for SCSI, but we do (incorrectly) do it for
other bus types such as i2c.

The function name also implies that it will return a newly allocated
object, when it in fact does in-place allocation.  We more commonly
name such functions foo_init(), with foo_new() being the
allocate-and-return variant.

Replace all the scsi_bus_new() callsites with either:
 * scsi_bus_init() for the usual case where the caller wants
   an autogenerated bus name
 * scsi_bus_init_named() for the rare case where the caller
   needs to specify the bus name

and document that for the _named() version it's then the caller's
responsibility to think about uniqueness of bus names.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/scsi/scsi.h       | 30 ++++++++++++++++++++++++++++--
 hw/scsi/esp-pci.c            |  2 +-
 hw/scsi/esp.c                |  2 +-
 hw/scsi/lsi53c895a.c         |  2 +-
 hw/scsi/megasas.c            |  3 +--
 hw/scsi/mptsas.c             |  2 +-
 hw/scsi/scsi-bus.c           |  4 ++--
 hw/scsi/spapr_vscsi.c        |  3 +--
 hw/scsi/virtio-scsi.c        |  4 ++--
 hw/scsi/vmw_pvscsi.c         |  3 +--
 hw/usb/dev-storage-bot.c     |  3 +--
 hw/usb/dev-storage-classic.c |  4 ++--
 hw/usb/dev-uas.c             |  3 +--
 13 files changed, 43 insertions(+), 22 deletions(-)

diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 0b726bc78c6..a567a5ed86b 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -146,8 +146,34 @@ struct SCSIBus {
     const SCSIBusInfo *info;
 };
 
-void scsi_bus_new(SCSIBus *bus, size_t bus_size, DeviceState *host,
-                  const SCSIBusInfo *info, const char *bus_name);
+/**
+ * scsi_bus_init_named: Initialize a SCSI bus with the specified name
+ * @bus: SCSIBus object to initialize
+ * @bus_size: size of @bus object
+ * @host: Device which owns the bus (generally the SCSI controller)
+ * @info: structure defining callbacks etc for the controller
+ * @bus_name: Name to use for this bus
+ *
+ * This in-place initializes @bus as a new SCSI bus with a name
+ * provided by the caller. It is the caller's responsibility to make
+ * sure that name does not clash with the name of any other bus in the
+ * system. Unless you need the new bus to have a specific name, you
+ * should use scsi_bus_new() instead.
+ */
+void scsi_bus_init_named(SCSIBus *bus, size_t bus_size, DeviceState *host,
+                         const SCSIBusInfo *info, const char *bus_name);
+
+/**
+ * scsi_bus_init: Initialize a SCSI bus
+ *
+ * This in-place-initializes @bus as a new SCSI bus and gives it
+ * an automatically generated unique name.
+ */
+static inline void scsi_bus_init(SCSIBus *bus, size_t bus_size,
+                                 DeviceState *host, const SCSIBusInfo *info)
+{
+    scsi_bus_init_named(bus, bus_size, host, info, NULL);
+}
 
 static inline SCSIBus *scsi_bus_from_device(SCSIDevice *d)
 {
diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
index 9db10b1a487..dac054aeed4 100644
--- a/hw/scsi/esp-pci.c
+++ b/hw/scsi/esp-pci.c
@@ -388,7 +388,7 @@ static void esp_pci_scsi_realize(PCIDevice *dev, Error **errp)
     pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &pci->io);
     s->irq = pci_allocate_irq(dev);
 
-    scsi_bus_new(&s->bus, sizeof(s->bus), d, &esp_pci_scsi_info, NULL);
+    scsi_bus_init(&s->bus, sizeof(s->bus), d, &esp_pci_scsi_info);
 }
 
 static void esp_pci_scsi_exit(PCIDevice *d)
diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 4ac21147888..8454ed17735 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -1348,7 +1348,7 @@ static void sysbus_esp_realize(DeviceState *dev, Error **errp)
 
     qdev_init_gpio_in(dev, sysbus_esp_gpio_demux, 2);
 
-    scsi_bus_new(&s->bus, sizeof(s->bus), dev, &esp_scsi_info, NULL);
+    scsi_bus_init(&s->bus, sizeof(s->bus), dev, &esp_scsi_info);
 }
 
 static void sysbus_esp_hard_reset(DeviceState *dev)
diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index e2c19180a0d..85e907a7854 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -2309,7 +2309,7 @@ static void lsi_scsi_realize(PCIDevice *dev, Error **errp)
     pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->ram_io);
     QTAILQ_INIT(&s->queue);
 
-    scsi_bus_new(&s->bus, sizeof(s->bus), d, &lsi_scsi_info, NULL);
+    scsi_bus_init(&s->bus, sizeof(s->bus), d, &lsi_scsi_info);
 }
 
 static void lsi_scsi_exit(PCIDevice *dev)
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 8f2389d2c6a..4ff51221d4c 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -2416,8 +2416,7 @@ static void megasas_scsi_realize(PCIDevice *dev, Error **errp)
         s->frames[i].state = s;
     }
 
-    scsi_bus_new(&s->bus, sizeof(s->bus), DEVICE(dev),
-                 &megasas_scsi_info, NULL);
+    scsi_bus_init(&s->bus, sizeof(s->bus), DEVICE(dev), &megasas_scsi_info);
 }
 
 static Property megasas_properties_gen1[] = {
diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
index db3219e7d20..f6c77655443 100644
--- a/hw/scsi/mptsas.c
+++ b/hw/scsi/mptsas.c
@@ -1315,7 +1315,7 @@ static void mptsas_scsi_realize(PCIDevice *dev, Error **errp)
 
     s->request_bh = qemu_bh_new(mptsas_fetch_requests, s);
 
-    scsi_bus_new(&s->bus, sizeof(s->bus), &dev->qdev, &mptsas_scsi_info, NULL);
+    scsi_bus_init(&s->bus, sizeof(s->bus), &dev->qdev, &mptsas_scsi_info);
 }
 
 static void mptsas_scsi_uninit(PCIDevice *dev)
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index 2a0a98cac91..e28a6ea053a 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -134,8 +134,8 @@ void scsi_device_unit_attention_reported(SCSIDevice *s)
 }
 
 /* Create a scsi bus, and attach devices to it.  */
-void scsi_bus_new(SCSIBus *bus, size_t bus_size, DeviceState *host,
-                  const SCSIBusInfo *info, const char *bus_name)
+void scsi_bus_init_named(SCSIBus *bus, size_t bus_size, DeviceState *host,
+                         const SCSIBusInfo *info, const char *bus_name)
 {
     qbus_create_inplace(bus, bus_size, TYPE_SCSI_BUS, host, bus_name);
     bus->busnr = next_scsi_bus++;
diff --git a/hw/scsi/spapr_vscsi.c b/hw/scsi/spapr_vscsi.c
index c210262484a..a07a8e1523f 100644
--- a/hw/scsi/spapr_vscsi.c
+++ b/hw/scsi/spapr_vscsi.c
@@ -1216,8 +1216,7 @@ static void spapr_vscsi_realize(SpaprVioDevice *dev, Error **errp)
 
     dev->crq.SendFunc = vscsi_do_crq;
 
-    scsi_bus_new(&s->bus, sizeof(s->bus), DEVICE(dev),
-                 &vscsi_scsi_info, NULL);
+    scsi_bus_init(&s->bus, sizeof(s->bus), DEVICE(dev), &vscsi_scsi_info);
 
     /* ibmvscsi SCSI bus does not allow hotplug. */
     qbus_set_hotplug_handler(BUS(&s->bus), NULL);
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 6d807302870..51fd09522ac 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -1019,8 +1019,8 @@ static void virtio_scsi_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    scsi_bus_new(&s->bus, sizeof(s->bus), dev,
-                 &virtio_scsi_scsi_info, vdev->bus_name);
+    scsi_bus_init_named(&s->bus, sizeof(s->bus), dev,
+                       &virtio_scsi_scsi_info, vdev->bus_name);
     /* override default SCSI bus hotplug-handler, with virtio-scsi's one */
     qbus_set_hotplug_handler(BUS(&s->bus), OBJECT(dev));
 
diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
index 1f30cb020a1..cd76bd67ab7 100644
--- a/hw/scsi/vmw_pvscsi.c
+++ b/hw/scsi/vmw_pvscsi.c
@@ -1180,8 +1180,7 @@ pvscsi_realizefn(PCIDevice *pci_dev, Error **errp)
 
     s->completion_worker = qemu_bh_new(pvscsi_process_completion_queue, s);
 
-    scsi_bus_new(&s->bus, sizeof(s->bus), DEVICE(pci_dev),
-                 &pvscsi_scsi_info, NULL);
+    scsi_bus_init(&s->bus, sizeof(s->bus), DEVICE(pci_dev), &pvscsi_scsi_info);
     /* override default SCSI bus hotplug-handler, with pvscsi's one */
     qbus_set_hotplug_handler(BUS(&s->bus), OBJECT(s));
     pvscsi_reset_state(s);
diff --git a/hw/usb/dev-storage-bot.c b/hw/usb/dev-storage-bot.c
index 68ebaca10c6..b24b3148c28 100644
--- a/hw/usb/dev-storage-bot.c
+++ b/hw/usb/dev-storage-bot.c
@@ -37,8 +37,7 @@ static void usb_msd_bot_realize(USBDevice *dev, Error **errp)
         s->dev.auto_attach = 0;
     }
 
-    scsi_bus_new(&s->bus, sizeof(s->bus), DEVICE(dev),
-                 &usb_msd_scsi_info_bot, NULL);
+    scsi_bus_init(&s->bus, sizeof(s->bus), DEVICE(dev), &usb_msd_scsi_info_bot);
     usb_msd_handle_reset(dev);
 }
 
diff --git a/hw/usb/dev-storage-classic.c b/hw/usb/dev-storage-classic.c
index 3d017a4e679..00f25bade28 100644
--- a/hw/usb/dev-storage-classic.c
+++ b/hw/usb/dev-storage-classic.c
@@ -65,8 +65,8 @@ static void usb_msd_storage_realize(USBDevice *dev, Error **errp)
     usb_desc_create_serial(dev);
     usb_desc_init(dev);
     dev->flags |= (1 << USB_DEV_FLAG_IS_SCSI_STORAGE);
-    scsi_bus_new(&s->bus, sizeof(s->bus), DEVICE(dev),
-                 &usb_msd_scsi_info_storage, NULL);
+    scsi_bus_init(&s->bus, sizeof(s->bus), DEVICE(dev),
+                 &usb_msd_scsi_info_storage);
     scsi_dev = scsi_bus_legacy_add_drive(&s->bus, blk, 0, !!s->removable,
                                          s->conf.bootindex, s->conf.share_rw,
                                          s->conf.rerror, s->conf.werror,
diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
index f6309a5ebfd..599d6b52a01 100644
--- a/hw/usb/dev-uas.c
+++ b/hw/usb/dev-uas.c
@@ -938,8 +938,7 @@ static void usb_uas_realize(USBDevice *dev, Error **errp)
     uas->status_bh = qemu_bh_new(usb_uas_send_status_bh, uas);
 
     dev->flags |= (1 << USB_DEV_FLAG_IS_SCSI_STORAGE);
-    scsi_bus_new(&uas->bus, sizeof(uas->bus), DEVICE(dev),
-                 &usb_uas_scsi_info, NULL);
+    scsi_bus_init(&uas->bus, sizeof(uas->bus), DEVICE(dev), &usb_uas_scsi_info);
 }
 
 static const VMStateDescription vmstate_usb_uas = {
-- 
2.20.1


