Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E063B2D2E
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 13:03:40 +0200 (CEST)
Received: from localhost ([::1]:43538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwN91-0002lq-9S
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 07:03:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwMoU-0007Mh-F9
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:42:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwMoR-0000rL-G6
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:42:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624531342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aW3Yh7aCT487AnoyNPyO5X1fiSDPAABiJ0kmhsQQXbE=;
 b=PG1GTS27a4H6tjZsSqb/4sO9K576C9ncuAO9KLwVyhWiFUiAOADS8lSDkQnA204Ekc9ZqH
 ycAhO009vhavA9HJxC1YDGUUlHEXiKpzgleyb9dM5sPhKvjYyEex3pOu8HzQIz77Ce4BJ4
 /OctdSi9vXxqgNBdNo4w4/r3uWgAPqQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-IQ3DklNJMXyu9G9qhIqBRA-1; Thu, 24 Jun 2021 06:42:21 -0400
X-MC-Unique: IQ3DklNJMXyu9G9qhIqBRA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 746C6106B7DF;
 Thu, 24 Jun 2021 10:42:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55D0A5D9F0;
 Thu, 24 Jun 2021 10:42:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8CEF11803555; Thu, 24 Jun 2021 12:38:38 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 31/34] usb: drop usb_host_dev_is_scsi_storage hook
Date: Thu, 24 Jun 2021 12:38:33 +0200
Message-Id: <20210624103836.2382472-32-kraxel@redhat.com>
In-Reply-To: <20210624103836.2382472-1-kraxel@redhat.com>
References: <20210624103836.2382472-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Lieven <pl@kamp.de>,
 Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x@nongnu.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce an usb device flag instead, set it when usb-host looks at the
device descriptors anyway.  Also set it for emulated storage devices,
for consistency.  Add an inline helper function to check the flag.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
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


