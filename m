Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20319252CD5
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 13:49:27 +0200 (CEST)
Received: from localhost ([::1]:49638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAtvi-0007Oo-78
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 07:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <srs0=n7r+=ce=lse.epita.fr=cesar.belley@cri.epita.fr>)
 id 1kAtpd-00058v-94
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 07:43:09 -0400
Received: from gate-2.cri.epita.net ([163.5.55.20]:47968
 helo=mail-2.srv.cri.epita.fr)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <srs0=n7r+=ce=lse.epita.fr=cesar.belley@cri.epita.fr>)
 id 1kAtpb-00086x-9c
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 07:43:08 -0400
Received: from MattGorko-Laptop.home
 (lfbn-idf1-1-1395-83.w90-79.abo.wanadoo.fr [90.79.87.83])
 (Authenticated sender: cesar.belley)
 by mail-2.srv.cri.epita.fr (Postfix) with ESMTPSA id 58254412EA;
 Wed, 26 Aug 2020 13:42:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lse.epita.fr; s=cri;
 t=1598442175; bh=5gfXi+frrtfkG33iM3G746wi4KGxTaFnB9zd62r5J60=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oo9CWw7A2gpqgYnoLwQFgDUa/veUJSeknkYOS5DxfxHPoGDivjuq3yOBzyYjWlvs7
 us7BYmZmMas2cgAhCl4LLrtq3wGTG5BR4eIQ149zMf9pTociY+3yy0iFedKN5/nByM
 B61G8WfD25sn3v8fmm236genAzZs4fv2TEXWbenQ=
From: =?UTF-8?q?C=C3=A9sar=20Belley?= <cesar.belley@lse.epita.fr>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/12] hw/usb: Add U2F device autoscan to passthru mode
Date: Wed, 26 Aug 2020 13:42:09 +0200
Message-Id: <20200826114209.28821-13-cesar.belley@lse.epita.fr>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200826114209.28821-1-cesar.belley@lse.epita.fr>
References: <20200826114209.28821-1-cesar.belley@lse.epita.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=163.5.55.20;
 envelope-from=srs0=n7r+=ce=lse.epita.fr=cesar.belley@cri.epita.fr;
 helo=mail-2.srv.cri.epita.fr
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 07:42:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?C=C3=A9sar=20Belley?= <cesar.belley@lse.epita.fr>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds an autoscan to let u2f-passthru choose the first U2F
device it finds.

The autoscan is performed using libudev with an enumeration of all the
hidraw devices present on the host.

The first device which happens to be a U2F device is taken to do the
passtru.

Signed-off-by: César Belley <cesar.belley@lse.epita.fr>
---
 docs/u2f.txt          |   9 ++++
 hw/usb/meson.build    |   2 +-
 hw/usb/u2f-passthru.c | 113 +++++++++++++++++++++++++++++++++++++-----
 3 files changed, 110 insertions(+), 14 deletions(-)

diff --git a/docs/u2f.txt b/docs/u2f.txt
index f60052882e..8f44994818 100644
--- a/docs/u2f.txt
+++ b/docs/u2f.txt
@@ -42,6 +42,10 @@ on libu2f-emu: configuring and building:
 
     ./configure --enable-u2f && make
 
+The pass-through mode is built by default on Linux. To take advantage
+of the autoscan option it provides, make sure you have a working libudev
+installed on the host.
+
 
 3. Using u2f-emulated
 
@@ -90,6 +94,11 @@ On the host specify the u2f-passthru device with a suitable hidraw:
 
     qemu -usb -device u2f-passthru,hidraw=/dev/hidraw0
 
+Alternately, the u2f-passthru device can autoscan to take the first
+U2F device it finds on the host (this requires a working libudev):
+
+    qemu -usb -device u2f-passthru
+
 
 5. Libu2f-emu
 
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index a25109b88c..b7c7ff23bf 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -52,7 +52,7 @@ endif
 
 # U2F
 softmmu_ss.add(when: 'CONFIG_USB_U2F', if_true: files('u2f.c'))
-softmmu_ss.add(when: ['CONFIG_LINUX', 'CONFIG_USB_U2F'], if_true: files('u2f-passthru.c'))
+softmmu_ss.add(when: ['CONFIG_LINUX', 'CONFIG_USB_U2F'], if_true: [libudev, files('u2f-passthru.c')])
 if u2f.found()
   softmmu_ss.add(when: 'CONFIG_USB_U2F', if_true: [u2f, files('u2f-emulated.c')])
 endif
diff --git a/hw/usb/u2f-passthru.c b/hw/usb/u2f-passthru.c
index f8771966c7..1311530ee5 100644
--- a/hw/usb/u2f-passthru.c
+++ b/hw/usb/u2f-passthru.c
@@ -378,6 +378,84 @@ static bool u2f_passthru_is_u2f_device(int fd)
                   sizeof(u2f_hid_report_desc_header)) == 0;
 }
 
+#ifdef CONFIG_LIBUDEV
+static int u2f_passthru_open_from_device(struct udev_device *device)
+{
+    const char *devnode = udev_device_get_devnode(device);
+
+    int fd = qemu_open(devnode, O_RDWR);
+    if (fd < 0) {
+        return -1;
+    } else if (!u2f_passthru_is_u2f_device(fd)) {
+        qemu_close(fd);
+        return -1;
+    }
+    return fd;
+}
+
+static int u2f_passthru_open_from_enumerate(struct udev *udev,
+                                            struct udev_enumerate *enumerate)
+{
+    struct udev_list_entry *devices, *entry;
+    int ret, fd;
+
+    ret = udev_enumerate_scan_devices(enumerate);
+    if (ret < 0) {
+        return -1;
+    }
+
+    devices = udev_enumerate_get_list_entry(enumerate);
+    udev_list_entry_foreach(entry, devices) {
+        struct udev_device *device;
+        const char *syspath = udev_list_entry_get_name(entry);
+
+        if (syspath == NULL) {
+            continue;
+        }
+
+        device = udev_device_new_from_syspath(udev, syspath);
+        if (device == NULL) {
+            continue;
+        }
+
+        fd = u2f_passthru_open_from_device(device);
+        udev_device_unref(device);
+        if (fd >= 0) {
+            return fd;
+        }
+    }
+    return -1;
+}
+
+static int u2f_passthru_open_from_scan(void)
+{
+    struct udev *udev;
+    struct udev_enumerate *enumerate;
+    int ret, fd = -1;
+
+    udev = udev_new();
+    if (udev == NULL) {
+        return -1;
+    }
+
+    enumerate = udev_enumerate_new(udev);
+    if (enumerate == NULL) {
+        udev_unref(udev);
+        return -1;
+    }
+
+    ret = udev_enumerate_add_match_subsystem(enumerate, "hidraw");
+    if (ret >= 0) {
+        fd = u2f_passthru_open_from_enumerate(udev, enumerate);
+    }
+
+    udev_enumerate_unref(enumerate);
+    udev_unref(udev);
+
+    return fd;
+}
+#endif
+
 static void u2f_passthru_unrealize(U2FKeyState *base)
 {
     U2FPassthruState *key = PASSTHRU_U2F_KEY(base);
@@ -392,22 +470,31 @@ static void u2f_passthru_realize(U2FKeyState *base, Error **errp)
     int fd;
 
     if (key->hidraw == NULL) {
+#ifdef CONFIG_LIBUDEV
+        fd = u2f_passthru_open_from_scan();
+        if (fd < 0) {
+            error_setg(errp, "%s: Failed to find a U2F USB device",
+                       TYPE_U2F_PASSTHRU);
+            return;
+        }
+#else
         error_setg(errp, "%s: Missing hidraw", TYPE_U2F_PASSTHRU);
         return;
-    }
-
-    fd = qemu_open(key->hidraw, O_RDWR);
-    if (fd < 0) {
-        error_setg(errp, "%s: Failed to open %s", TYPE_U2F_PASSTHRU,
-                   key->hidraw);
-        return;
-    }
+#endif
+    } else {
+        fd = qemu_open(key->hidraw, O_RDWR);
+        if (fd < 0) {
+            error_setg(errp, "%s: Failed to open %s", TYPE_U2F_PASSTHRU,
+                       key->hidraw);
+            return;
+        }
 
-    if (!u2f_passthru_is_u2f_device(fd)) {
-        qemu_close(fd);
-        error_setg(errp, "%s: Passed hidraw does not represent "
-                   "a U2F HID device", TYPE_U2F_PASSTHRU);
-        return;
+        if (!u2f_passthru_is_u2f_device(fd)) {
+            qemu_close(fd);
+            error_setg(errp, "%s: Passed hidraw does not represent "
+                       "a U2F HID device", TYPE_U2F_PASSTHRU);
+            return;
+        }
     }
     key->hidraw_fd = fd;
     u2f_passthru_reset(key);
-- 
2.28.0


