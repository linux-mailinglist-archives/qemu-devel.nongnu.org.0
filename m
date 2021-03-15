Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A38133C5C6
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:36:36 +0100 (CET)
Received: from localhost ([::1]:50078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLs4x-0008H3-CA
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lLrYT-00029o-L0
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:03:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lLrYN-0000Wu-1z
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:03:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615831374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VfBRUwqCiQv4p1UR7m5zW9f9shYxpP7YYg6Wfun0ZnE=;
 b=aN+gViN5aqq1CBBJ5Vrze7zyYb6zF11mygwmOAWgxcSMxfxL7FwerlsOzUYWeTO5y0OjNv
 nCK5UMoItmIGd6RO3AaQaBITd3H5AnyEaqqrHy1Osizmn9XgisK1HT0QW5A15jVojKCTTK
 lQNweGFPY0gG2mQDfisn2dhOKjhwDRY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-ZfXcufh_MzSzVAGZpUs6rg-1; Mon, 15 Mar 2021 14:02:51 -0400
X-MC-Unique: ZfXcufh_MzSzVAGZpUs6rg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6565C1015C84;
 Mon, 15 Mar 2021 18:02:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1E545D9C0;
 Mon, 15 Mar 2021 18:02:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0EE9E1800636; Mon, 15 Mar 2021 19:02:41 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/13] hw/usb/bus: Remove the "full-path" property
Date: Mon, 15 Mar 2021 19:02:28 +0100
Message-Id: <20210315180240.1597240-2-kraxel@redhat.com>
In-Reply-To: <20210315180240.1597240-1-kraxel@redhat.com>
References: <20210315180240.1597240-1-kraxel@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, libvir-list@redhat.com,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

This property was only required for the pc-1.0 and earlier machine
types. Since these have been removed now, we can delete the property
as well.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210302120152.118042-1-thuth@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/usb.h | 1 -
 hw/usb/bus.c     | 7 +------
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/hw/usb.h b/include/hw/usb.h
index abfbfc5284c2..9f42394efaea 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -216,7 +216,6 @@ struct USBEndpoint {
 };
 
 enum USBDeviceFlags {
-    USB_DEV_FLAG_FULL_PATH,
     USB_DEV_FLAG_IS_HOST,
     USB_DEV_FLAG_MSOS_DESC_ENABLE,
     USB_DEV_FLAG_MSOS_DESC_IN_USE,
diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index 064f94e9c3cc..df7411fea8e4 100644
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
-- 
2.29.2


