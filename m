Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B111D9AFD
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 17:18:55 +0200 (CEST)
Received: from localhost ([::1]:36682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jb417-0006k8-Vk
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 11:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jb3fD-0001i9-BE
 for qemu-devel@nongnu.org; Tue, 19 May 2020 10:56:15 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:45861
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jb3f3-0003Xl-Pa
 for qemu-devel@nongnu.org; Tue, 19 May 2020 10:56:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589900164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FBFm9N5hKap20U71Cng/pdYqe4/tLTy/ynupMSpxwAA=;
 b=FmbgficWRcTA1RtKo/mf+cJtDE0/vPVczkRh5IpgzL2HU11g/ttx5m13/Z2ZpohiwC9tGF
 3vJrsBgQ2h0jiD2HdVcINrhx5aVnzxgwYjOcr2xZzDWurB9YjPYK2BbAgqfRBgIJhBUXxY
 ENcbP6pILevbYOVe/CJVzmNFHN4at1g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-9lwkckqgPVSDf_utZw9LNQ-1; Tue, 19 May 2020 10:56:02 -0400
X-MC-Unique: 9lwkckqgPVSDf_utZw9LNQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0E991009600
 for <qemu-devel@nongnu.org>; Tue, 19 May 2020 14:56:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDABF6ACE7;
 Tue, 19 May 2020 14:55:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1891711358D7; Tue, 19 May 2020 16:55:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/55] usb: Convert uses of usb_create()
Date: Tue, 19 May 2020 16:55:22 +0200
Message-Id: <20200519145551.22836-27-armbru@redhat.com>
In-Reply-To: <20200519145551.22836-1-armbru@redhat.com>
References: <20200519145551.22836-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 23:19:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: pbonzini@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace

    dev = usb_create(bus, type_name);
    ...
    object_property_set_bool(OBJECT(dev), true, "realized", &err);

by

    dev = isa_new(type_name);
    ...
    usb_realize_and_unref(dev, bus, &err);

Recent commit "qdev: New qdev_new(), qdev_realize(), etc." explains
why.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/hw/usb.h    |  3 +--
 hw/usb/bus.c        | 11 +++++------
 hw/usb/dev-serial.c |  4 ++--
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/include/hw/usb.h b/include/hw/usb.h
index 2d2730f161..86093d941a 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -532,8 +532,7 @@ void usb_bus_new(USBBus *bus, size_t bus_size,
 void usb_bus_release(USBBus *bus);
 USBBus *usb_bus_find(int busnr);
 void usb_legacy_register(const char *typename, const char *usbdevice_name,
-                         USBDevice *(*usbdevice_init)(USBBus *bus,
-                                                      const char *params));
+                         USBDevice *(*usbdevice_init)(const char *params));
 USBDevice *usb_new(const char *name);
 bool usb_realize_and_unref(USBDevice *dev, USBBus *bus, Error **errp);
 USBDevice *usb_create(USBBus *bus, const char *name);
diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index 6b0d9f9e4d..da85b8b005 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -296,14 +296,13 @@ typedef struct LegacyUSBFactory
 {
     const char *name;
     const char *usbdevice_name;
-    USBDevice *(*usbdevice_init)(USBBus *bus, const char *params);
+    USBDevice *(*usbdevice_init)(const char *params);
 } LegacyUSBFactory;
 
 static GSList *legacy_usb_factory;
 
 void usb_legacy_register(const char *typename, const char *usbdevice_name,
-                         USBDevice *(*usbdevice_init)(USBBus *bus,
-                                                      const char *params))
+                         USBDevice *(*usbdevice_init)(const char *params))
 {
     if (usbdevice_name) {
         LegacyUSBFactory *f = g_malloc0(sizeof(*f));
@@ -710,19 +709,19 @@ USBDevice *usbdevice_create(const char *cmdline)
     }
 
     if (f->usbdevice_init) {
-        dev = f->usbdevice_init(bus, params);
+        dev = f->usbdevice_init(params);
     } else {
         if (*params) {
             error_report("usbdevice %s accepts no params", driver);
             return NULL;
         }
-        dev = usb_create(bus, f->name);
+        dev = usb_new(f->name);
     }
     if (!dev) {
         error_report("Failed to create USB device '%s'", f->name);
         return NULL;
     }
-    object_property_set_bool(OBJECT(dev), true, "realized", &err);
+    usb_realize_and_unref(dev, bus, &err);
     if (err) {
         error_reportf_err(err, "Failed to initialize USB device '%s': ",
                           f->name);
diff --git a/hw/usb/dev-serial.c b/hw/usb/dev-serial.c
index d2c03681b7..7e50e3ba47 100644
--- a/hw/usb/dev-serial.c
+++ b/hw/usb/dev-serial.c
@@ -542,7 +542,7 @@ static void usb_serial_realize(USBDevice *dev, Error **errp)
     s->intr = usb_ep_get(dev, USB_TOKEN_IN, 1);
 }
 
-static USBDevice *usb_braille_init(USBBus *bus, const char *unused)
+static USBDevice *usb_braille_init(const char *unused)
 {
     USBDevice *dev;
     Chardev *cdrv;
@@ -551,7 +551,7 @@ static USBDevice *usb_braille_init(USBBus *bus, const char *unused)
     if (!cdrv)
         return NULL;
 
-    dev = usb_create(bus, "usb-braille");
+    dev = usb_new("usb-braille");
     qdev_prop_set_chr(&dev->qdev, "chardev", cdrv);
     return dev;
 }
-- 
2.21.1


