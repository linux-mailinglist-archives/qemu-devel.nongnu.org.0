Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B0325560B
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 10:11:45 +0200 (CEST)
Received: from localhost ([::1]:38712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBZU8-0005aa-N1
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 04:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kBZRV-0000Y6-4Q
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 04:09:01 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:21593
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kBZRS-0003RE-0P
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 04:09:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598602135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e7ADtjUCvvlcoWLUsdaaSfb862SflFQHg7D9hEwKRwc=;
 b=i5o8s/RLllru6eD+2a+d8EPqsbHYFUwHc3mDG76mEDRe/oYKe9a5G2AlzwaPs/2Y+s4COu
 QgMEt5ARoPlEGIZ2tSkIo3gNzPvL60XeCm19FMiqFUsCkK2vqPM0zuNzx8EaBPEeNAKpfn
 nXTVjV4lwQvmRQaZjmLuwWIzaYehVPM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-EfVSa_DvON25vUjwir2zwg-1; Fri, 28 Aug 2020 04:08:53 -0400
X-MC-Unique: EfVSa_DvON25vUjwir2zwg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5388802B4B
 for <qemu-devel@nongnu.org>; Fri, 28 Aug 2020 08:08:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-54.ams2.redhat.com
 [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56C2D7A207;
 Fri, 28 Aug 2020 08:08:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8CCC731FC3; Fri, 28 Aug 2020 10:08:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/18] usb-host: workaround libusb bug
Date: Fri, 28 Aug 2020 10:08:44 +0200
Message-Id: <20200828080845.28287-18-kraxel@redhat.com>
In-Reply-To: <20200828080845.28287-1-kraxel@redhat.com>
References: <20200828080845.28287-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/28 03:48:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

libusb_get_device_speed() does not work for
libusb_wrap_sys_device() devices in v1.0.23.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1871090
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20200824110057.32089-1-kraxel@redhat.com
---
 hw/usb/host-libusb.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index c474551d8456..08604f787fdf 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -39,6 +39,11 @@
 #endif
 #include <libusb.h>
 
+#ifdef CONFIG_LINUX
+#include <sys/ioctl.h>
+#include <linux/usbdevice_fs.h>
+#endif
+
 #include "qapi/error.h"
 #include "migration/vmstate.h"
 #include "monitor/monitor.h"
@@ -885,6 +890,7 @@ static void usb_host_ep_update(USBHostDevice *s)
 static int usb_host_open(USBHostDevice *s, libusb_device *dev, int hostfd)
 {
     USBDevice *udev = USB_DEVICE(s);
+    int libusb_speed;
     int bus_num = 0;
     int addr = 0;
     int rc;
@@ -935,7 +941,36 @@ static int usb_host_open(USBHostDevice *s, libusb_device *dev, int hostfd)
     usb_ep_init(udev);
     usb_host_ep_update(s);
 
-    udev->speed     = speed_map[libusb_get_device_speed(dev)];
+    libusb_speed = libusb_get_device_speed(dev);
+#ifdef CONFIG_LINUX
+    if (hostfd && libusb_speed == 0) {
+        /*
+         * Workaround libusb bug: libusb_get_device_speed() does not
+         * work for libusb_wrap_sys_device() devices in v1.0.23.
+         *
+         * Speeds are defined in linux/usb/ch9.h, file not included
+         * due to name conflicts.
+         */
+        int rc = ioctl(hostfd, USBDEVFS_GET_SPEED, NULL);
+        switch (rc) {
+        case 1: /* low */
+            libusb_speed = LIBUSB_SPEED_LOW;
+            break;
+        case 2: /* full */
+            libusb_speed = LIBUSB_SPEED_FULL;
+            break;
+        case 3: /* high */
+        case 4: /* wireless */
+            libusb_speed = LIBUSB_SPEED_HIGH;
+            break;
+        case 5: /* super */
+        case 6: /* super plus */
+            libusb_speed = LIBUSB_SPEED_SUPER;
+            break;
+        }
+    }
+#endif
+    udev->speed = speed_map[libusb_speed];
     usb_host_speed_compat(s);
 
     if (s->ddesc.iProduct) {
-- 
2.27.0


