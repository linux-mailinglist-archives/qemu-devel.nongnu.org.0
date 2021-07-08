Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C2B3C1630
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:41:12 +0200 (CEST)
Received: from localhost ([::1]:36860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1W9H-0005rO-NI
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vn7-00012U-K7
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:17 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:44586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vn5-0008JB-Uu
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:17 -0400
Received: by mail-ed1-x531.google.com with SMTP id l24so9014761edr.11
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K7PuuCBvtlN45vecpFtrMHdXAgGZfGszCYtMSUbfSOA=;
 b=Us2bXDjJEplUjBjlaXThSBpNVpQtjlGlUdDchQ4Kf+vfO+hL53BurpBov/byuxziZZ
 pavdJyQc7ECzRQCzJnYY8RRtki9YGS3XNbzks31i/k8IVD7Ng8BTWqqfOyLhrFUFOJzk
 GoF3Y8T7n8sy3DF2q9vIHn9QvbU4TTxMDclZs6pUTb2yOlzKNneCMP9BJkA7E1BwRRzn
 Zkn/LTwSihKxgbFwSoIB+XQQ4QNjiGhkILqq8mfyX2PPDxeqtx6K4hkLszRe7RS7J8Yc
 wFsnNxbKCI0n0U4gNF6izc79YE+ECIVnW+MVj4x5FSATdRHm8mZXuPlCxMDF6z8rcTeX
 EgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=K7PuuCBvtlN45vecpFtrMHdXAgGZfGszCYtMSUbfSOA=;
 b=XurYVolpfmr+AXCuzK9gVLQVWZPOoXFkB73JBAZfgaUOVuV2VsdfyjGp8i8zcKkfsW
 lGNe8wTqeVe3gOCFSHhgz/GzLU3dBTy8kpgWl1koziOskLCncujH/dkmLD3ivshq6FKj
 UQTPwEgVcO5U5eilFVyn89IDWhXagh/uZ6jQmOnn5FEGIssn3jav8AGjLhKcaXDEEY5k
 KIbGYkHVC27tdxlVbwnmwmYtR1o73GxEalm2+jEJRdGnIFj/MOxGhGJu5DA1Z3C79Zhn
 rooASeavLecQknKk3CfnxXns++Ys2wqEP99T1KABPd4EdVy/LY+G0gLTwf0BX/0C+7jx
 qQ4w==
X-Gm-Message-State: AOAM532tynkhgT7cNQhVPcQcNdxH21L8c6SAJDrTM3W4PU1u5xkd7zt8
 RJnRz/H1bat2Eaq+09UfjbfAFXdoUJc=
X-Google-Smtp-Source: ABdhPJy3frLIqt/PJmxdduUg4gWuk5R4GS5ZL3j2IwRWLqqD4ejwuB4lMM7rTWgXrpcBYT6qL5skhw==
X-Received: by 2002:a05:6402:4311:: with SMTP id
 m17mr20312215edc.346.1625757494766; 
 Thu, 08 Jul 2021 08:18:14 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:18:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 35/48] usb: drop usb_host_dev_is_scsi_storage hook
Date: Thu,  8 Jul 2021 17:17:35 +0200
Message-Id: <20210708151748.408754-36-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Jose R . Ziviani" <jziviani@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Introduce an usb device flag instead, set it when usb-host looks at the
device descriptors anyway.  Also set it for emulated storage devices,
for consistency.  Add an inline helper function to check the flag.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-32-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/ppc/spapr.c               |  2 +-
 hw/usb/dev-storage-bot.c     |  1 +
 hw/usb/dev-storage-classic.c |  1 +
 hw/usb/dev-uas.c             |  1 +
 hw/usb/host-libusb.c         | 36 +++++++-----------------------------
 hw/usb/host-stub.c           |  5 -----
 include/hw/usb.h             |  7 ++++++-
 7 files changed, 17 insertions(+), 36 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 4dd90b75cc..f83a081af0 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3106,7 +3106,7 @@ static char *spapr_get_fw_dev_path(FWPathProvider *p, BusState *bus,
      */
     if (strcmp("usb-host", qdev_fw_name(dev)) == 0) {
         USBDevice *usbdev = CAST(USBDevice, dev, TYPE_USB_DEVICE);
-        if (usb_host_dev_is_scsi_storage(usbdev)) {
+        if (usb_device_is_scsi_storage(usbdev)) {
             return g_strdup_printf("storage@%s/disk", usbdev->port->path);
         }
     }
diff --git a/hw/usb/dev-storage-bot.c b/hw/usb/dev-storage-bot.c
index 6aad026d11..68ebaca10c 100644
--- a/hw/usb/dev-storage-bot.c
+++ b/hw/usb/dev-storage-bot.c
@@ -32,6 +32,7 @@ static void usb_msd_bot_realize(USBDevice *dev, Error **errp)
 
     usb_desc_create_serial(dev);
     usb_desc_init(dev);
+    dev->flags |= (1 << USB_DEV_FLAG_IS_SCSI_STORAGE);
     if (d->hotplugged) {
         s->dev.auto_attach = 0;
     }
diff --git a/hw/usb/dev-storage-classic.c b/hw/usb/dev-storage-classic.c
index 00cb34b22f..3d017a4e67 100644
--- a/hw/usb/dev-storage-classic.c
+++ b/hw/usb/dev-storage-classic.c
@@ -64,6 +64,7 @@ static void usb_msd_storage_realize(USBDevice *dev, Error **errp)
 
     usb_desc_create_serial(dev);
     usb_desc_init(dev);
+    dev->flags |= (1 << USB_DEV_FLAG_IS_SCSI_STORAGE);
     scsi_bus_new(&s->bus, sizeof(s->bus), DEVICE(dev),
                  &usb_msd_scsi_info_storage, NULL);
     scsi_dev = scsi_bus_legacy_add_drive(&s->bus, blk, 0, !!s->removable,
diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
index d2bd85d3f6..263056231c 100644
--- a/hw/usb/dev-uas.c
+++ b/hw/usb/dev-uas.c
@@ -926,6 +926,7 @@ static void usb_uas_realize(USBDevice *dev, Error **errp)
     QTAILQ_INIT(&uas->requests);
     uas->status_bh = qemu_bh_new(usb_uas_send_status_bh, uas);
 
+    dev->flags |= (1 << USB_DEV_FLAG_IS_SCSI_STORAGE);
     scsi_bus_new(&uas->bus, sizeof(uas->bus), DEVICE(dev),
                  &usb_uas_scsi_info, NULL);
 }
diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index 2518306f52..e6d21aa8e1 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -770,6 +770,13 @@ static void usb_host_speed_compat(USBHostDevice *s)
         for (i = 0; i < conf->bNumInterfaces; i++) {
             for (a = 0; a < conf->interface[i].num_altsetting; a++) {
                 intf = &conf->interface[i].altsetting[a];
+
+                if (intf->bInterfaceClass == LIBUSB_CLASS_MASS_STORAGE &&
+                    intf->bInterfaceSubClass == 6) { /* SCSI */
+                    udev->flags |= (1 << USB_DEV_FLAG_IS_SCSI_STORAGE);
+                    break;
+                }
+
                 for (e = 0; e < intf->bNumEndpoints; e++) {
                     endp = &intf->endpoint[e];
                     type = endp->bmAttributes & 0x3;
@@ -1893,35 +1900,6 @@ static void usb_host_auto_check(void *unused)
     timer_mod(usb_auto_timer, qemu_clock_get_ms(QEMU_CLOCK_REALTIME) + 2000);
 }
 
-/**
- * Check whether USB host device has a USB mass storage SCSI interface
- */
-bool usb_host_dev_is_scsi_storage(USBDevice *ud)
-{
-    USBHostDevice *uhd = USB_HOST_DEVICE(ud);
-    struct libusb_config_descriptor *conf;
-    const struct libusb_interface_descriptor *intf;
-    bool is_scsi_storage = false;
-    int i;
-
-    if (!uhd || libusb_get_active_config_descriptor(uhd->dev, &conf) != 0) {
-        return false;
-    }
-
-    for (i = 0; i < conf->bNumInterfaces; i++) {
-        intf = &conf->interface[i].altsetting[ud->altsetting[i]];
-        if (intf->bInterfaceClass == LIBUSB_CLASS_MASS_STORAGE &&
-            intf->bInterfaceSubClass == 6) {                 /* 6 means SCSI */
-            is_scsi_storage = true;
-            break;
-        }
-    }
-
-    libusb_free_config_descriptor(conf);
-
-    return is_scsi_storage;
-}
-
 void hmp_info_usbhost(Monitor *mon, const QDict *qdict)
 {
     libusb_device **devs = NULL;
diff --git a/hw/usb/host-stub.c b/hw/usb/host-stub.c
index 80809ceba5..bbe69baa39 100644
--- a/hw/usb/host-stub.c
+++ b/hw/usb/host-stub.c
@@ -38,8 +38,3 @@ void hmp_info_usbhost(Monitor *mon, const QDict *qdict)
 {
     monitor_printf(mon, "USB host devices not supported\n");
 }
-
-bool usb_host_dev_is_scsi_storage(USBDevice *ud)
-{
-    return false;
-}
diff --git a/include/hw/usb.h b/include/hw/usb.h
index 436e07b304..33668dd0a9 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -219,6 +219,7 @@ enum USBDeviceFlags {
     USB_DEV_FLAG_IS_HOST,
     USB_DEV_FLAG_MSOS_DESC_ENABLE,
     USB_DEV_FLAG_MSOS_DESC_IN_USE,
+    USB_DEV_FLAG_IS_SCSI_STORAGE,
 };
 
 /* definition of a USB device */
@@ -465,7 +466,6 @@ void usb_generic_async_ctrl_complete(USBDevice *s, USBPacket *p);
 
 /* usb-linux.c */
 void hmp_info_usbhost(Monitor *mon, const QDict *qdict);
-bool usb_host_dev_is_scsi_storage(USBDevice *usbdev);
 
 /* usb ports of the VM */
 
@@ -561,6 +561,11 @@ const char *usb_device_get_product_desc(USBDevice *dev);
 
 const USBDesc *usb_device_get_usb_desc(USBDevice *dev);
 
+static inline bool usb_device_is_scsi_storage(USBDevice *dev)
+{
+    return dev->flags & (1 << USB_DEV_FLAG_IS_SCSI_STORAGE);
+}
+
 /* quirks.c */
 
 /* In bulk endpoints are streaming data sources (iow behave like isoc eps) */
-- 
2.31.1



