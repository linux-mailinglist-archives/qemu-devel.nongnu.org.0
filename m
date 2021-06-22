Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FCE3B0553
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 14:56:33 +0200 (CEST)
Received: from localhost ([::1]:39004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvfxA-0005ks-Gf
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 08:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvfqN-0002Qw-DB
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:49:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvfqK-0008Vz-HB
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:49:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624366167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pwu7ByVlvVUODEspPEYf01bS4Xz0BZKDwp7H+1ARSK4=;
 b=LJckHswMdjkqPDclEM7xu6yj3sPRdygqSVa9cnwC7Z0+meXC5pOTXuiUDoQbJsl3o6QfwI
 J8CvuIKgdfG8RIddGkHDiE4BNJCmbPLkkHi0MHRJKut33wwFt4441wSxuNdo1evA3xDC0Q
 T2f8CVlud/j2WD/lm66HGdRApXlK5fY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-5kUuMxyrNNS0L7ZZ2UfI6Q-1; Tue, 22 Jun 2021 08:49:23 -0400
X-MC-Unique: 5kUuMxyrNNS0L7ZZ2UfI6Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2A1A100C611;
 Tue, 22 Jun 2021 12:49:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3764360C13;
 Tue, 22 Jun 2021 12:49:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6C1061800902; Tue, 22 Jun 2021 14:49:15 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] usb: drop usb_host_dev_is_scsi_storage hook
Date: Tue, 22 Jun 2021 14:49:12 +0200
Message-Id: <20210622124915.261060-3-kraxel@redhat.com>
In-Reply-To: <20210622124915.261060-1-kraxel@redhat.com>
References: <20210622124915.261060-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, Markus Armbruster <armbru@redhat.com>,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce an usb device flag instead, set it when usb-host looks at the
device descriptors anyway.  Also set it for emulated storage devices,
for consistency.  Add an inline helper function to check the flag.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/usb.h             |  7 ++++++-
 hw/ppc/spapr.c               |  2 +-
 hw/usb/dev-storage-bot.c     |  1 +
 hw/usb/dev-storage-classic.c |  1 +
 hw/usb/dev-uas.c             |  1 +
 hw/usb/host-libusb.c         | 36 +++++++-----------------------------
 hw/usb/host-stub.c           |  5 -----
 7 files changed, 17 insertions(+), 36 deletions(-)

diff --git a/include/hw/usb.h b/include/hw/usb.h
index 436e07b30404..33668dd0a99a 100644
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
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 4dd90b75cc52..f83a081af0f1 100644
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
index 6aad026d1133..68ebaca10c66 100644
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
index 00cb34b22f02..3d017a4e6791 100644
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
index d2bd85d3f6bb..263056231c79 100644
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
index 2518306f527f..e6d21aa8e1d3 100644
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
index 80809ceba542..bbe69baa390f 100644
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
-- 
2.31.1


