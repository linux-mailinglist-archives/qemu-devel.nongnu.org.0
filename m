Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC6E693A90
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 23:48:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRL8P-0001OL-AS; Sun, 12 Feb 2023 17:47:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRL8N-0001Mb-BY
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:47:47 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRL8L-0003IM-Bp
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:47:47 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 az4-20020a05600c600400b003dff767a1f1so7760702wmb.2
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 14:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0g+OKIY42HUqYw3UQ9cJG+AfIPwvafK4fS3QuXAucdQ=;
 b=shXjCloISjiE+oHmYwgCh6KfYZbPp1ZyN2WMU3N56mqsYk5BwJN3uaci33/kWXNezY
 j8bwa4s7TH/62YFlnuhAMWcQu35MCI3iPyEUkBYDeZfjUC1aKtPJqeIIf0FKqlFR8FWN
 WpMpAJzyvoizWvIvcx2UgmvVpe5LIualcqNN4Tbat5P1xwZXJNVaoEXPuOpq/Getkssf
 +La+SHF1J22nVq526ontxrUgsX4ISKqCLpsFpla6xBsZMZPBWArPn+mfT2xjRtD+srrl
 PmY01Tg/+qN5WIenzX6uGBV520CNrYAL+gbCd/GOFnTZMZx6I7jTSpSLk/uf5/Vdftf4
 j+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0g+OKIY42HUqYw3UQ9cJG+AfIPwvafK4fS3QuXAucdQ=;
 b=RZsbqvFWftXvK+85OZ3f1Sb8NVXFDj0KGg35JtH47xTqfc3wej/ajLiWRmq5Ku9IuL
 mVTHOqjxRi5Wjrw8U7ujcAFpDj7mxwM8LpEPQBwgk/GdbRppg3773935FkSq1A+jLvo3
 c5TD0GnVPCcoBuhof1BCFy92K4r1LFcpeFXlEQ4WHYfkf1yJWef1FH7BSeFZ6/LWOY9h
 VTqeHjZu/QShlU2CrSL8tzxSo7TleK8UgeHxcA76xXycF5BE95tRWpsvSi0t57Uwbd0u
 G9FZyvt0hw4QIgUdE9WX6qSlj/wH4druk2tfRrElFE3asr46uORvTFcMGFr7MxAsfrt/
 zBBg==
X-Gm-Message-State: AO0yUKUOWKqbb8oZaZQxzLFf4myQodtEQRwKRBFQLZ2/+xlOU0XxSfGV
 xTBDc3quZExz2vsi+dfjkKOvDMVaxIn/PpSQ
X-Google-Smtp-Source: AK7set8RTMBAt6p0nKHz5kcfR1Yc8ag3TbHKJ+Q6sGJ+rviJTz+ruB2dXi9D1H7CSCiQPDuxS1Oy7g==
X-Received: by 2002:a05:600c:490a:b0:3dc:433a:e952 with SMTP id
 f10-20020a05600c490a00b003dc433ae952mr17301775wmp.33.1676242063879; 
 Sun, 12 Feb 2023 14:47:43 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a05600c491800b003dc0cb5e3f1sm11393219wmp.46.2023.02.12.14.47.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 14:47:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Fam Zheng <fam@euphon.net>
Subject: [PATCH 2/4] hw: Replace dev->parent_bus by qdev_get_parent_bus(dev)
Date: Sun, 12 Feb 2023 23:47:28 +0100
Message-Id: <20230212224730.51438-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230212224730.51438-1-philmd@linaro.org>
References: <20230212224730.51438-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

DeviceState::parent_bus is an internal field and should be
accessed by the qdev_get_parent_bus() helper. Replace all
uses in hw/ except the QDev uses in hw/core/.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/audio/intel-hda.c                |  2 +-
 hw/block/fdc.c                      |  2 +-
 hw/block/swim.c                     |  2 +-
 hw/ide/qdev.c                       |  4 ++--
 hw/net/virtio-net.c                 |  2 +-
 hw/pci-bridge/pci_expander_bridge.c |  2 +-
 hw/scsi/scsi-bus.c                  |  2 +-
 hw/usb/bus.c                        |  2 +-
 hw/usb/desc.c                       |  2 +-
 hw/usb/dev-smartcard-reader.c       | 16 ++++++++--------
 10 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index b9ed231fe8..6bc239a981 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -59,7 +59,7 @@ void hda_codec_bus_init(DeviceState *dev, HDACodecBus *bus, size_t bus_size,
 
 static void hda_codec_dev_realize(DeviceState *qdev, Error **errp)
 {
-    HDACodecBus *bus = HDA_BUS(qdev->parent_bus);
+    HDACodecBus *bus = HDA_BUS(qdev_get_parent_bus(qdev));
     HDACodecDevice *dev = HDA_CODEC_DEVICE(qdev);
     HDACodecDeviceClass *cdc = HDA_CODEC_DEVICE_GET_CLASS(dev);
 
diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 64ae4a6899..31ad6f6ae0 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -466,7 +466,7 @@ static Property floppy_drive_properties[] = {
 static void floppy_drive_realize(DeviceState *qdev, Error **errp)
 {
     FloppyDrive *dev = FLOPPY_DRIVE(qdev);
-    FloppyBus *bus = FLOPPY_BUS(qdev->parent_bus);
+    FloppyBus *bus = FLOPPY_BUS(qdev_get_parent_bus(qdev));
     FDrive *drive;
     bool read_only;
     int ret;
diff --git a/hw/block/swim.c b/hw/block/swim.c
index 333da08ce0..64e30e9e80 100644
--- a/hw/block/swim.c
+++ b/hw/block/swim.c
@@ -157,7 +157,7 @@ static Property swim_drive_properties[] = {
 static void swim_drive_realize(DeviceState *qdev, Error **errp)
 {
     SWIMDrive *dev = SWIM_DRIVE(qdev);
-    SWIMBus *bus = SWIM_BUS(qdev->parent_bus);
+    SWIMBus *bus = SWIM_BUS(qdev_get_parent_bus(qdev));
     FDrive *drive;
     int ret;
 
diff --git a/hw/ide/qdev.c b/hw/ide/qdev.c
index 6f6c7462f3..96582ce49b 100644
--- a/hw/ide/qdev.c
+++ b/hw/ide/qdev.c
@@ -81,7 +81,7 @@ static char *idebus_get_fw_dev_path(DeviceState *dev)
     char path[30];
 
     snprintf(path, sizeof(path), "%s@%x", qdev_fw_name(dev),
-             ((IDEBus*)dev->parent_bus)->bus_id);
+             ((IDEBus*)qdev_get_parent_bus(dev))->bus_id);
 
     return g_strdup(path);
 }
@@ -90,7 +90,7 @@ static void ide_qdev_realize(DeviceState *qdev, Error **errp)
 {
     IDEDevice *dev = IDE_DEVICE(qdev);
     IDEDeviceClass *dc = IDE_DEVICE_GET_CLASS(dev);
-    IDEBus *bus = DO_UPCAST(IDEBus, qbus, qdev->parent_bus);
+    IDEBus *bus = DO_UPCAST(IDEBus, qbus, qdev_get_parent_bus(qdev));
 
     if (dev->unit == -1) {
         dev->unit = bus->master ? 1 : 0;
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 3ae909041a..8bc160ab59 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3423,7 +3423,7 @@ static bool failover_replug_primary(VirtIONet *n, DeviceState *dev,
     if (!pdev->partially_hotplugged) {
         return true;
     }
-    primary_bus = dev->parent_bus;
+    primary_bus = qdev_get_parent_bus(dev);
     if (!primary_bus) {
         error_setg(errp, "virtio_net: couldn't find primary bus");
         return false;
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index e752a21292..8c0649c071 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -151,7 +151,7 @@ static char *pxb_host_ofw_unit_address(const SysBusDevice *dev)
     assert(position >= 0);
 
     pxb_dev_base = DEVICE(pxb_dev);
-    main_host = PCI_HOST_BRIDGE(pxb_dev_base->parent_bus->parent);
+    main_host = PCI_HOST_BRIDGE(qdev_get_parent_bus(pxb_dev_base)->parent);
     main_host_sbd = SYS_BUS_DEVICE(main_host);
 
     if (main_host_sbd->num_mmio > 0) {
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index ceceafb2cd..3127cd7273 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -1671,7 +1671,7 @@ void scsi_device_purge_requests(SCSIDevice *sdev, SCSISense sense)
 static char *scsibus_get_dev_path(DeviceState *dev)
 {
     SCSIDevice *d = SCSI_DEVICE(dev);
-    DeviceState *hba = dev->parent_bus->parent;
+    DeviceState *hba = qdev_get_parent_bus(dev)->parent;
     char *id;
     char *path;
 
diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index 92d6ed5626..d7c3c71435 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -595,7 +595,7 @@ static void usb_bus_dev_print(Monitor *mon, DeviceState *qdev, int indent)
 static char *usb_get_dev_path(DeviceState *qdev)
 {
     USBDevice *dev = USB_DEVICE(qdev);
-    DeviceState *hcd = qdev->parent_bus->parent;
+    DeviceState *hcd = qdev_get_parent_bus(qdev)->parent;
     char *id = qdev_get_dev_path(hcd);
 
     if (id) {
diff --git a/hw/usb/desc.c b/hw/usb/desc.c
index 7f6cc2f99b..2646515e26 100644
--- a/hw/usb/desc.c
+++ b/hw/usb/desc.c
@@ -553,7 +553,7 @@ void usb_desc_set_string(USBDevice *dev, uint8_t index, const char *str)
  */
 void usb_desc_create_serial(USBDevice *dev)
 {
-    DeviceState *hcd = dev->qdev.parent_bus->parent;
+    DeviceState *hcd = qdev_get_parent_bus(DEVICE(dev))->parent;
     const USBDesc *desc = usb_device_get_usb_desc(dev);
     int index = desc->id.iSerialNumber;
     char *path, *serial;
diff --git a/hw/usb/dev-smartcard-reader.c b/hw/usb/dev-smartcard-reader.c
index 28164d89be..5e94b4f64a 100644
--- a/hw/usb/dev-smartcard-reader.c
+++ b/hw/usb/dev-smartcard-reader.c
@@ -1187,7 +1187,7 @@ void ccid_card_send_apdu_to_guest(CCIDCardState *card,
                                   uint8_t *apdu, uint32_t len)
 {
     DeviceState *qdev = DEVICE(card);
-    USBDevice *dev = USB_DEVICE(qdev->parent_bus->parent);
+    USBDevice *dev = USB_DEVICE(qdev_get_parent_bus(qdev)->parent);
     USBCCIDState *s = USB_CCID_DEV(dev);
     Answer *answer;
 
@@ -1210,7 +1210,7 @@ void ccid_card_send_apdu_to_guest(CCIDCardState *card,
 void ccid_card_card_removed(CCIDCardState *card)
 {
     DeviceState *qdev = DEVICE(card);
-    USBDevice *dev = USB_DEVICE(qdev->parent_bus->parent);
+    USBDevice *dev = USB_DEVICE(qdev_get_parent_bus(qdev)->parent);
     USBCCIDState *s = USB_CCID_DEV(dev);
 
     ccid_on_slot_change(s, false);
@@ -1221,7 +1221,7 @@ void ccid_card_card_removed(CCIDCardState *card)
 int ccid_card_ccid_attach(CCIDCardState *card)
 {
     DeviceState *qdev = DEVICE(card);
-    USBDevice *dev = USB_DEVICE(qdev->parent_bus->parent);
+    USBDevice *dev = USB_DEVICE(qdev_get_parent_bus(qdev)->parent);
     USBCCIDState *s = USB_CCID_DEV(dev);
 
     DPRINTF(s, 1, "CCID Attach\n");
@@ -1231,7 +1231,7 @@ int ccid_card_ccid_attach(CCIDCardState *card)
 void ccid_card_ccid_detach(CCIDCardState *card)
 {
     DeviceState *qdev = DEVICE(card);
-    USBDevice *dev = USB_DEVICE(qdev->parent_bus->parent);
+    USBDevice *dev = USB_DEVICE(qdev_get_parent_bus(qdev)->parent);
     USBCCIDState *s = USB_CCID_DEV(dev);
 
     DPRINTF(s, 1, "CCID Detach\n");
@@ -1244,7 +1244,7 @@ void ccid_card_ccid_detach(CCIDCardState *card)
 void ccid_card_card_error(CCIDCardState *card, uint64_t error)
 {
     DeviceState *qdev = DEVICE(card);
-    USBDevice *dev = USB_DEVICE(qdev->parent_bus->parent);
+    USBDevice *dev = USB_DEVICE(qdev_get_parent_bus(qdev)->parent);
     USBCCIDState *s = USB_CCID_DEV(dev);
 
     s->bmCommandStatus = COMMAND_STATUS_FAILED;
@@ -1263,7 +1263,7 @@ void ccid_card_card_error(CCIDCardState *card, uint64_t error)
 void ccid_card_card_inserted(CCIDCardState *card)
 {
     DeviceState *qdev = DEVICE(card);
-    USBDevice *dev = USB_DEVICE(qdev->parent_bus->parent);
+    USBDevice *dev = USB_DEVICE(qdev_get_parent_bus(qdev)->parent);
     USBCCIDState *s = USB_CCID_DEV(dev);
 
     s->bmCommandStatus = COMMAND_STATUS_NO_ERROR;
@@ -1275,7 +1275,7 @@ static void ccid_card_unrealize(DeviceState *qdev)
 {
     CCIDCardState *card = CCID_CARD(qdev);
     CCIDCardClass *cc = CCID_CARD_GET_CLASS(card);
-    USBDevice *dev = USB_DEVICE(qdev->parent_bus->parent);
+    USBDevice *dev = USB_DEVICE(qdev_get_parent_bus(qdev)->parent);
     USBCCIDState *s = USB_CCID_DEV(dev);
 
     if (ccid_card_inserted(s)) {
@@ -1291,7 +1291,7 @@ static void ccid_card_realize(DeviceState *qdev, Error **errp)
 {
     CCIDCardState *card = CCID_CARD(qdev);
     CCIDCardClass *cc = CCID_CARD_GET_CLASS(card);
-    USBDevice *dev = USB_DEVICE(qdev->parent_bus->parent);
+    USBDevice *dev = USB_DEVICE(qdev_get_parent_bus(qdev)->parent);
     USBCCIDState *s = USB_CCID_DEV(dev);
     Error *local_err = NULL;
 
-- 
2.38.1


