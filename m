Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2898830E0E6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 18:25:44 +0100 (CET)
Received: from localhost ([::1]:46948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7LuR-00017P-2I
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 12:25:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7Loo-0004L6-Ao
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:19:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7Lol-0003s8-3l
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:19:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612372790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mJY/cGKSL/CUJEXgY5804aFPSKvib7o1+hs7CdYXhEU=;
 b=KpBx9EeDMAbHdMXAXGc0GfKEdTNtZKExQE3Got08D/Q6QkgbMDudDtLofz8a5YP8kGea8o
 0AS7ft24VwvTdCXPGMYEx+zGB1aL/kHvgKjneoHBzAchuxdRKfE79gvqjE/3xrVJBhYCU+
 +d0UjXnqZrIdK4Qe1ZzRVu6PUVUJhjA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-O5-R4rHzPFuMh7Wdoq4L_w-1; Wed, 03 Feb 2021 12:19:46 -0500
X-MC-Unique: O5-R4rHzPFuMh7Wdoq4L_w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBD05107ACF4;
 Wed,  3 Feb 2021 17:19:45 +0000 (UTC)
Received: from thuth.com (ovpn-112-165.ams2.redhat.com [10.36.112.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B3DB61D33;
 Wed,  3 Feb 2021 17:19:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 4/4] hw/usb/bus: Remove the "full-path" property
Date: Wed,  3 Feb 2021 18:18:32 +0100
Message-Id: <20210203171832.483176-5-thuth@redhat.com>
In-Reply-To: <20210203171832.483176-1-thuth@redhat.com>
References: <20210203171832.483176-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, libvir-list@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This property was only required for the pc-1.0 and earlier machine
types. Since these have been removed now, we can delete the property
as well.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/usb/bus.c     | 7 +------
 include/hw/usb.h | 2 +-
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index 064f94e9c3..df7411fea8 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -19,8 +19,6 @@ static void usb_qdev_unrealize(DeviceState *qdev);
 static Property usb_props[] = {
     DEFINE_PROP_STRING("port", USBDevice, port_path),
     DEFINE_PROP_STRING("serial", USBDevice, serial),
-    DEFINE_PROP_BIT("full-path", USBDevice, flags,
-                    USB_DEV_FLAG_FULL_PATH, true),
     DEFINE_PROP_BIT("msos-desc", USBDevice, flags,
                     USB_DEV_FLAG_MSOS_DESC_ENABLE, true),
     DEFINE_PROP_STRING("pcap", USBDevice, pcap_filename),
@@ -596,11 +594,8 @@ static char *usb_get_dev_path(DeviceState *qdev)
 {
     USBDevice *dev = USB_DEVICE(qdev);
     DeviceState *hcd = qdev->parent_bus->parent;
-    char *id = NULL;
+    char *id = qdev_get_dev_path(hcd);
 
-    if (dev->flags & (1 << USB_DEV_FLAG_FULL_PATH)) {
-        id = qdev_get_dev_path(hcd);
-    }
     if (id) {
         char *ret = g_strdup_printf("%s/%s", id, dev->port->path);
         g_free(id);
diff --git a/include/hw/usb.h b/include/hw/usb.h
index abfbfc5284..c44b77dae0 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -216,7 +216,7 @@ struct USBEndpoint {
 };
 
 enum USBDeviceFlags {
-    USB_DEV_FLAG_FULL_PATH,
+    USB_DEV_FLAG_FULL_PATH,             /* unused since QEMU v6.0 */
     USB_DEV_FLAG_IS_HOST,
     USB_DEV_FLAG_MSOS_DESC_ENABLE,
     USB_DEV_FLAG_MSOS_DESC_IN_USE,
-- 
2.27.0


