Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA243342FA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:24:45 +0100 (CET)
Received: from localhost ([::1]:46280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1dc-0001qz-P0
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:24:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lK1I1-0005Tn-BB
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:02:25 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:37293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lK1Hx-0003bS-3E
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:02:24 -0500
Received: by mail-ej1-x635.google.com with SMTP id bm21so39717599ejb.4
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5XMPup8ivt9E7EoWbJ/bupPlgZ/KucgUB5pL+xCAceY=;
 b=QoosUdbQ0giY0p9aNO2ZYfVDiA3uSpVH/IoR1j1xNL1j8K3lAANtGOeaY1faPhkRpU
 AkiYiS+091AoPQKHlK1oJ+RpB2mXLUWUZUVFewcHx1F4fj8ksa27DOZEkY47YC31oJ9W
 PvEKgYxTAgTyuPxsqZv3wDrV+YxBb4f0ncN297mLfE2CYZ826rVvmBM5DaCoahCgcTC4
 01bp9fypXclqKlh/A2BopG8V3LB1mdliaQU53aRNOIQT7yAp45wJbEVwHt8bSaaed+Mu
 fma/mVxcKc1QE0nldzYGQ7FnIYrWzRrBZTKxdw2WGANCDJQhlFMgfjbJMaBIgNSKp9Rh
 s+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=5XMPup8ivt9E7EoWbJ/bupPlgZ/KucgUB5pL+xCAceY=;
 b=X/YH7KbmWo4dGur6+lKFU0QbTpprXyU2VhySbaGBXafjbL49MFs0aC9m91+k7xE+SP
 2ihdx+BOS/qRG1W7/Gz+sR1hx+o8MiMZc0leL0QU+EloipEGuaZURp3ZXyqIgbehqPio
 R/WnrGpF0xSJr86mikkB5B/jojJeiRonRk3FgeapIYwBnkTUO/9ef7RStUegh8cEG5La
 eREv0TaZRGAiNWfQgp9pqU8AXGDqP8P7m5cd0PcFfEMNRmHhvne6mA+HocrU4nZ3h/XX
 U/eQOUEFdMBdp91egG00M0xX6NqZqoGwNI1aDEtyFcUJJgcTUx0rLq8eZH1o9Qb3hz62
 YDuA==
X-Gm-Message-State: AOAM531w0wy96hd1wkhTlykC32y9L8ZV7vsd0KvY1La3cMo9n3qEiUCK
 Fa++7NNw26WYHcmu89SMLtQ5ykoCCss=
X-Google-Smtp-Source: ABdhPJxo7CChHVgVwX5D7BV4tHfdH2QFPEiOKOVKiZxc3CxEg+serU4VhD/lXN8OOXI93cFmR3dwKw==
X-Received: by 2002:a17:906:644f:: with SMTP id
 l15mr4476126ejn.229.1615392136210; 
 Wed, 10 Mar 2021 08:02:16 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 mc2sm9881363ejb.115.2021.03.10.08.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 08:02:15 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] usb: remove support for -usbdevice parameters
Date: Wed, 10 Mar 2021 17:02:14 +0100
Message-Id: <20210310160214.283517-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: thuth@redhat.com, armbru@redhat.com, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No device needs them anymore and in fact they're undocumented.
Remove the code.  The only change in behavior is that "-usbdevice
braille:hello" now reports an error, which is a bugfix.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
---
Based-on: <20210309165035.967853-1-thuth@redhat.com>
---
 hw/usb/bus.c        | 32 +++++++-------------------------
 hw/usb/dev-serial.c |  2 +-
 include/hw/usb.h    |  2 +-
 3 files changed, 9 insertions(+), 27 deletions(-)

diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index 064f94e9c3..4b8882427d 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -312,13 +312,13 @@ typedef struct LegacyUSBFactory
 {
     const char *name;
     const char *usbdevice_name;
-    USBDevice *(*usbdevice_init)(const char *params);
+    USBDevice *(*usbdevice_init)(void);
 } LegacyUSBFactory;
 
 static GSList *legacy_usb_factory;
 
 void usb_legacy_register(const char *typename, const char *usbdevice_name,
-                         USBDevice *(*usbdevice_init)(const char *params))
+                         USBDevice *(*usbdevice_init)(void))
 {
     if (usbdevice_name) {
         LegacyUSBFactory *f = g_malloc0(sizeof(*f));
@@ -663,27 +663,17 @@ void hmp_info_usb(Monitor *mon, const QDict *qdict)
 }
 
 /* handle legacy -usbdevice cmd line option */
-USBDevice *usbdevice_create(const char *cmdline)
+USBDevice *usbdevice_create(const char *driver)
 {
     USBBus *bus = usb_bus_find(-1 /* any */);
     LegacyUSBFactory *f = NULL;
     Error *err = NULL;
     GSList *i;
-    char driver[32];
-    const char *params;
-    int len;
     USBDevice *dev;
 
-    params = strchr(cmdline,':');
-    if (params) {
-        params++;
-        len = params - cmdline;
-        if (len > sizeof(driver))
-            len = sizeof(driver);
-        pstrcpy(driver, len, cmdline);
-    } else {
-        params = "";
-        pstrcpy(driver, sizeof(driver), cmdline);
+    if (strchr(driver, ':')) {
+        error_report("usbdevice parameters are not supported anymore");
+        return NULL;
     }
 
     for (i = legacy_usb_factory; i; i = i->next) {
@@ -707,15 +697,7 @@ USBDevice *usbdevice_create(const char *cmdline)
         return NULL;
     }
 
-    if (f->usbdevice_init) {
-        dev = f->usbdevice_init(params);
-    } else {
-        if (*params) {
-            error_report("usbdevice %s accepts no params", driver);
-            return NULL;
-        }
-        dev = usb_new(f->name);
-    }
+    dev = f->usbdevice_init ? f->usbdevice_init() : usb_new(f->name);
     if (!dev) {
         error_report("Failed to create USB device '%s'", f->name);
         return NULL;
diff --git a/hw/usb/dev-serial.c b/hw/usb/dev-serial.c
index b58c4eb908..63047d79cf 100644
--- a/hw/usb/dev-serial.c
+++ b/hw/usb/dev-serial.c
@@ -614,7 +614,7 @@ static void usb_serial_realize(USBDevice *dev, Error **errp)
     s->intr = usb_ep_get(dev, USB_TOKEN_IN, 1);
 }
 
-static USBDevice *usb_braille_init(const char *unused)
+static USBDevice *usb_braille_init(void)
 {
     USBDevice *dev;
     Chardev *cdrv;
diff --git a/include/hw/usb.h b/include/hw/usb.h
index abfbfc5284..08684bcd27 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -500,7 +500,7 @@ void usb_bus_new(USBBus *bus, size_t bus_size,
 void usb_bus_release(USBBus *bus);
 USBBus *usb_bus_find(int busnr);
 void usb_legacy_register(const char *typename, const char *usbdevice_name,
-                         USBDevice *(*usbdevice_init)(const char *params));
+                         USBDevice *(*usbdevice_init)(void));
 USBDevice *usb_new(const char *name);
 bool usb_realize_and_unref(USBDevice *dev, USBBus *bus, Error **errp);
 USBDevice *usb_create_simple(USBBus *bus, const char *name);
-- 
2.29.2


