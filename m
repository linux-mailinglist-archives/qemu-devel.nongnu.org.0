Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCD448E4B1
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 08:10:35 +0100 (CET)
Received: from localhost ([::1]:60432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8GjJ-00017g-6j
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 02:10:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GTM-00073x-Tk
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:54:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GTK-0007PW-PG
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:54:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642143242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v+hCg8CyEan8CkMetUw6GpvibfdhdNRYg7jz61NnAX4=;
 b=MmmQYEyq9ipnFdgyDOuyMGBEEXJDVRvtoIF58/MWnCAf6Rp1MzxX/AWHoZW1kC2mrpyvZa
 KSBEH1HDSGH0eyDzv8DXPxMTgFWM4BWHztRqtzYh3HwAKSlwnhwPZPTyYz3MBcm0VuaQyL
 PwLWuL59ohiM0Z5rlaSY5WEyfERlI/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-QuyXmajCPCihRzXZr-4iLw-1; Fri, 14 Jan 2022 01:53:59 -0500
X-MC-Unique: QuyXmajCPCihRzXZr-4iLw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 069321006AA4;
 Fri, 14 Jan 2022 06:53:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B3604699B;
 Fri, 14 Jan 2022 06:53:29 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6445C180060E; Fri, 14 Jan 2022 07:53:26 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/20] hw/usb/dev-wacom: add missing HID descriptor
Date: Fri, 14 Jan 2022 07:53:07 +0100
Message-Id: <20220114065326.782420-2-kraxel@redhat.com>
In-Reply-To: <20220114065326.782420-1-kraxel@redhat.com>
References: <20220114065326.782420-1-kraxel@redhat.com>
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
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Linux need to fill up the HID descriptor in order to let the driver be
emulated. The descriptor was downloaded from [1]. The patch was tested
with evtest tool on top of qemu 5.2.0 with linux kernel 4.19.208.

[1] https://github.com/linuxwacom/wacom-hid-descriptors/tree/master/Wacom%20PenPartner

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-Id: <20220112090125.381364-1-dario.binacchi@amarulasolutions.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/dev-wacom.c | 72 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/hw/usb/dev-wacom.c b/hw/usb/dev-wacom.c
index ed687bc9f1eb..8323650c6a4d 100644
--- a/hw/usb/dev-wacom.c
+++ b/hw/usb/dev-wacom.c
@@ -69,6 +69,65 @@ static const USBDescStrings desc_strings = {
     [STR_SERIALNUMBER]     = "1",
 };
 
+static const uint8_t qemu_wacom_hid_report_descriptor[] = {
+    0x05, 0x01,      /* Usage Page (Desktop) */
+    0x09, 0x02,      /* Usage (Mouse) */
+    0xa1, 0x01,      /* Collection (Application) */
+    0x85, 0x01,      /*    Report ID (1) */
+    0x09, 0x01,      /*    Usage (Pointer) */
+    0xa1, 0x00,      /*    Collection (Physical) */
+    0x05, 0x09,      /*       Usage Page (Button) */
+    0x19, 0x01,      /*       Usage Minimum (01h) */
+    0x29, 0x03,      /*       Usage Maximum (03h) */
+    0x15, 0x00,      /*       Logical Minimum (0) */
+    0x25, 0x01,      /*       Logical Maximum (1) */
+    0x95, 0x03,      /*       Report Count (3) */
+    0x75, 0x01,      /*       Report Size (1) */
+    0x81, 0x02,      /*       Input (Data, Variable, Absolute) */
+    0x95, 0x01,      /*       Report Count (1) */
+    0x75, 0x05,      /*       Report Size (5) */
+    0x81, 0x01,      /*       Input (Constant) */
+    0x05, 0x01,      /*       Usage Page (Desktop) */
+    0x09, 0x30,      /*       Usage (X) */
+    0x09, 0x31,      /*       Usage (Y) */
+    0x09, 0x38,      /*       Usage (Wheel) */
+    0x15, 0x81,      /*       Logical Minimum (-127) */
+    0x25, 0x7f,      /*       Logical Maximum (127) */
+    0x75, 0x08,      /*       Report Size (8) */
+    0x95, 0x03,      /*       Report Count (3) */
+    0x81, 0x06,      /*       Input (Data, Variable, Relative) */
+    0x95, 0x03,      /*       Report Count (3) */
+    0x81, 0x01,      /*       Input (Constant) */
+    0xc0,            /*    End Collection */
+    0xc0,            /* End Collection */
+    0x05, 0x0d,      /* Usage Page (Digitizer) */
+    0x09, 0x01,      /* Usage (Digitizer) */
+    0xa1, 0x01,      /* Collection (Application) */
+    0x85, 0x02,      /*    Report ID (2) */
+    0xa1, 0x00,      /*    Collection (Physical) */
+    0x06, 0x00, 0xff,/*       Usage Page (ff00h), vendor-defined */
+    0x09, 0x01,      /*       Usage (01h) */
+    0x15, 0x00,      /*       Logical Minimum (0) */
+    0x26, 0xff, 0x00,/*       Logical Maximum (255) */
+    0x75, 0x08,      /*       Report Size (8) */
+    0x95, 0x07,      /*       Report Count (7) */
+    0x81, 0x02,      /*       Input (Data, Variable, Absolute) */
+    0xc0,            /*    End Collection */
+    0x09, 0x01,      /*    Usage (01h) */
+    0x85, 0x63,      /*    Report ID (99) */
+    0x95, 0x07,      /*    Report Count (7) */
+    0x81, 0x02,      /*    Input (Data, Variable, Absolute) */
+    0x09, 0x01,      /*    Usage (01h) */
+    0x85, 0x02,      /*    Report ID (2) */
+    0x95, 0x01,      /*    Report Count (1) */
+    0xb1, 0x02,      /*    Feature (Variable) */
+    0x09, 0x01,      /*    Usage (01h) */
+    0x85, 0x03,      /*    Report ID (3) */
+    0x95, 0x01,      /*    Report Count (1) */
+    0xb1, 0x02,      /*    Feature (Variable) */
+    0xc0             /* End Collection */
+};
+
 static const USBDescIface desc_iface_wacom = {
     .bInterfaceNumber              = 0,
     .bNumEndpoints                 = 1,
@@ -86,7 +145,7 @@ static const USBDescIface desc_iface_wacom = {
                 0x00,          /*  u8  country_code */
                 0x01,          /*  u8  num_descriptors */
                 USB_DT_REPORT, /*  u8  type: Report */
-                0x6e, 0,       /*  u16 len */
+                sizeof(qemu_wacom_hid_report_descriptor), 0, /*  u16 len */
             },
         },
     },
@@ -266,6 +325,17 @@ static void usb_wacom_handle_control(USBDevice *dev, USBPacket *p,
     }
 
     switch (request) {
+    case InterfaceRequest | USB_REQ_GET_DESCRIPTOR:
+        switch (value >> 8) {
+        case 0x22:
+                memcpy(data, qemu_wacom_hid_report_descriptor,
+                       sizeof(qemu_wacom_hid_report_descriptor));
+                p->actual_length = sizeof(qemu_wacom_hid_report_descriptor);
+            break;
+        default:
+            return;
+        }
+        break;
     case WACOM_SET_REPORT:
         if (s->mouse_grabbed) {
             qemu_remove_mouse_event_handler(s->eh_entry);
-- 
2.34.1


