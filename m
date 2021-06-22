Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9E73B0539
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 14:52:33 +0200 (CEST)
Received: from localhost ([::1]:55452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvftJ-00066a-0u
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 08:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvfqS-0002W3-EH
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:49:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvfqN-00005K-4l
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:49:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624366170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QiurdwY7zx/Ww1rbDD4KkyNSNb9+u2YvZzq+hk9TBso=;
 b=hONlShb36rj+OmZRc0qBBtZ6ODIhaWo8Iue9Pjy7iCVpjGe9wuCB17DpjToHgMeIwOPFh/
 eIj32tLt90jxcw9Ir2mMpziYRJm/3ItQRv0k3XcPSnE0Yt/fFr67rZjfjpTm2kgWVnqb/o
 MSLOiBNEea+2e+H1S+pIt81tdX5WCr4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-lkT2cOOHPBy90tUJAcKmTg-1; Tue, 22 Jun 2021 08:49:28 -0400
X-MC-Unique: lkT2cOOHPBy90tUJAcKmTg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E3BD8042F3;
 Tue, 22 Jun 2021 12:49:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 387402C00F;
 Tue, 22 Jun 2021 12:49:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7D1371800909; Tue, 22 Jun 2021 14:49:15 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] monitor/usb: register 'info usbhost' dynamically
Date: Tue, 22 Jun 2021 14:49:13 +0200
Message-Id: <20210622124915.261060-4-kraxel@redhat.com>
In-Reply-To: <20210622124915.261060-1-kraxel@redhat.com>
References: <20210622124915.261060-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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


