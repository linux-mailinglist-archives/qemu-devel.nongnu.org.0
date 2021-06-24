Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF6F3B2DA2
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 13:18:07 +0200 (CEST)
Received: from localhost ([::1]:56478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwNN0-0006VH-Kw
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 07:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwMol-0008El-Az
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:42:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwMoh-00013l-8J
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:42:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624531358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QiurdwY7zx/Ww1rbDD4KkyNSNb9+u2YvZzq+hk9TBso=;
 b=dhRffWG/zeyuNzfMwjpW4B9TszNg1H7lqe1r6tYvhWpnKMAdEl0FEKhC3pcNxRJTi/h7sx
 jM7QoxQ21Ks8R8sJRY/95BjZv+oL+iKuUw0sawhSBbP1ZgylrE6vtS/cICQozCON9ixY4z
 8q4w0/YeWwLrky5BpFqc3ghplmtiIQ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-XDN7YoiNOyO14H__a76YSQ-1; Thu, 24 Jun 2021 06:42:37 -0400
X-MC-Unique: XDN7YoiNOyO14H__a76YSQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B110106B7DE;
 Thu, 24 Jun 2021 10:42:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE78C60E3A;
 Thu, 24 Jun 2021 10:42:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9E2531803556; Thu, 24 Jun 2021 12:38:38 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 32/34] monitor/usb: register 'info usbhost' dynamically
Date: Thu, 24 Jun 2021 12:38:34 +0200
Message-Id: <20210624103836.2382472-33-kraxel@redhat.com>
In-Reply-To: <20210624103836.2382472-1-kraxel@redhat.com>
References: <20210624103836.2382472-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/host-libusb.c |  1 +
 hw/usb/host-stub.c   | 40 ----------------------------------------
 hmp-commands-info.hx |  1 -
 hw/usb/meson.build   |  4 +---
 4 files changed, 2 insertions(+), 44 deletions(-)
 delete mode 100644 hw/usb/host-stub.c

diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index e6d21aa8e1d3..2b7f87872ce3 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -1781,6 +1781,7 @@ static TypeInfo usb_host_dev_info = {
 static void usb_host_register_types(void)
 {
     type_register_static(&usb_host_dev_info);
+    monitor_register_hmp("usbhost", true, hmp_info_usbhost);
 }
 
 type_init(usb_host_register_types)
diff --git a/hw/usb/host-stub.c b/hw/usb/host-stub.c
deleted file mode 100644
index bbe69baa390f..000000000000
--- a/hw/usb/host-stub.c
+++ /dev/null
@@ -1,40 +0,0 @@
-/*
- * Stub host USB redirector
- *
- * Copyright (c) 2005 Fabrice Bellard
- *
- * Copyright (c) 2008 Max Krasnyansky
- *      Support for host device auto connect & disconnect
- *      Major rewrite to support fully async operation
- *
- * Copyright 2008 TJ <linux@tjworld.net>
- *      Added flexible support for /dev/bus/usb /sys/bus/usb/devices in addition
- *      to the legacy /proc/bus/usb USB device discovery and handling
- *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to deal
- * in the Software without restriction, including without limitation the rights
- * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
- * copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
- * THE SOFTWARE.
- */
-
-#include "qemu/osdep.h"
-#include "hw/usb.h"
-#include "monitor/monitor.h"
-
-void hmp_info_usbhost(Monitor *mon, const QDict *qdict)
-{
-    monitor_printf(mon, "USB host devices not supported\n");
-}
diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index fb59c27200cb..ce42aef47acb 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -368,7 +368,6 @@ ERST
         .args_type  = "",
         .params     = "",
         .help       = "show host USB devices",
-        .cmd        = hmp_info_usbhost,
     },
 
 SRST
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index f357270d0b6b..3d8f2ae99302 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -73,9 +73,7 @@ endif
 
 # usb pass-through
 softmmu_ss.add(when: ['CONFIG_USB', 'CONFIG_USB_LIBUSB', libusb],
-               if_true: files('host-libusb.c'),
-               if_false: files('host-stub.c'))
-softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('host-stub.c'))
+               if_true: files('host-libusb.c'))
 
 softmmu_ss.add(when: ['CONFIG_USB', 'CONFIG_XEN', libusb], if_true: files('xen-usb.c'))
 
-- 
2.31.1


