Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 558FA2494BD
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 07:58:20 +0200 (CEST)
Received: from localhost ([::1]:51030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8H75-0007RW-ES
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 01:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1k8GwS-0007qj-RG
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 01:47:20 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:60861
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1k8GwH-0006iD-Mq
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 01:47:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597816016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=06peAcY7Lz89BngSip4yRWpED1qlvokW/5u3E1bm64I=;
 b=ULrmNKywADS9D+cxPeXe9LfF/4H/D+YwUS2hmUoRgsGwDC/5rYUNqZTEKK+t9t8/g0CGVi
 EFuQL/qKnsrArkJqs9I46M231HUy7CoFzce3LdC19y/YaFf6bG9dU4NptKe/ze+rNu6Te7
 iGWU47XYsZ99AI1UY0cC2FlVvmSBHAU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-fun7fcNlNNO3HWKVw8nrsw-1; Wed, 19 Aug 2020 01:46:51 -0400
X-MC-Unique: fun7fcNlNNO3HWKVw8nrsw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F6301DE04;
 Wed, 19 Aug 2020 05:46:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 153ED5C1D0;
 Wed, 19 Aug 2020 05:46:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9A545204AE; Wed, 19 Aug 2020 07:46:44 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/17] hw/usb: Add U2F key base class implementation
Date: Wed, 19 Aug 2020 07:46:35 +0200
Message-Id: <20200819054644.30610-9-kraxel@redhat.com>
In-Reply-To: <20200819054644.30610-1-kraxel@redhat.com>
References: <20200819054644.30610-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 01:46:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?C=C3=A9sar=20Belley?= <cesar.belley@lse.epita.fr>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: César Belley <cesar.belley@lse.epita.fr>

This patch adds the U2F key base class implementation.

The U2F key base mainly takes care of the HID interfacing with guest.
On the one hand, it retrieves the guest U2FHID packets and transmits
them to the variant associated according to the mode: pass-through
or emulated.
On the other hand, it provides the public API used by its variants to
send U2FHID packets to the guest.

Signed-off-by: César Belley <cesar.belley@lse.epita.fr>
Message-id: 20200812094135.20550-5-cesar.belley@lse.epita.fr
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/u2f.c | 352 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 352 insertions(+)
 create mode 100644 hw/usb/u2f.c

diff --git a/hw/usb/u2f.c b/hw/usb/u2f.c
new file mode 100644
index 000000000000..bc09191f063e
--- /dev/null
+++ b/hw/usb/u2f.c
@@ -0,0 +1,352 @@
+/*
+ * U2F USB device.
+ *
+ * Copyright (c) 2020 César Belley <cesar.belley@lse.epita.fr>
+ * Written by César Belley <cesar.belley@lse.epita.fr>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/module.h"
+#include "qapi/error.h"
+#include "hw/usb.h"
+#include "hw/usb/hid.h"
+#include "migration/vmstate.h"
+#include "desc.h"
+
+#include "u2f.h"
+
+/* U2F key Vendor / Product */
+#define U2F_KEY_VENDOR_NUM     0x46f4 /* CRC16() of "QEMU" */
+#define U2F_KEY_PRODUCT_NUM    0x0005
+
+enum {
+    STR_MANUFACTURER = 1,
+    STR_PRODUCT,
+    STR_SERIALNUMBER,
+    STR_CONFIG,
+    STR_INTERFACE
+};
+
+static const USBDescStrings desc_strings = {
+    [STR_MANUFACTURER]     = "QEMU",
+    [STR_PRODUCT]          = "U2F USB key",
+    [STR_SERIALNUMBER]     = "0",
+    [STR_CONFIG]           = "U2F key config",
+    [STR_INTERFACE]        = "U2F key interface"
+};
+
+static const USBDescIface desc_iface_u2f_key = {
+    .bInterfaceNumber              = 0,
+    .bNumEndpoints                 = 2,
+    .bInterfaceClass               = USB_CLASS_HID,
+    .bInterfaceSubClass            = 0x0,
+    .bInterfaceProtocol            = 0x0,
+    .ndesc                         = 1,
+    .descs = (USBDescOther[]) {
+        {
+            /* HID descriptor */
+            .data = (uint8_t[]) {
+                0x09,          /*  u8  bLength */
+                USB_DT_HID,    /*  u8  bDescriptorType */
+                0x10, 0x01,    /*  u16 HID_class */
+                0x00,          /*  u8  country_code */
+                0x01,          /*  u8  num_descriptors */
+                USB_DT_REPORT, /*  u8  type: Report */
+                0x22, 0,       /*  u16 len */
+            },
+        },
+    },
+    .eps = (USBDescEndpoint[]) {
+        {
+            .bEndpointAddress      = USB_DIR_IN | 0x01,
+            .bmAttributes          = USB_ENDPOINT_XFER_INT,
+            .wMaxPacketSize        = U2FHID_PACKET_SIZE,
+            .bInterval             = 0x05,
+        }, {
+            .bEndpointAddress      = USB_DIR_OUT | 0x01,
+            .bmAttributes          = USB_ENDPOINT_XFER_INT,
+            .wMaxPacketSize        = U2FHID_PACKET_SIZE,
+            .bInterval             = 0x05,
+        },
+    },
+
+};
+
+static const USBDescDevice desc_device_u2f_key = {
+    .bcdUSB                        = 0x0100,
+    .bMaxPacketSize0               = U2FHID_PACKET_SIZE,
+    .bNumConfigurations            = 1,
+    .confs = (USBDescConfig[]) {
+        {
+            .bNumInterfaces        = 1,
+            .bConfigurationValue   = 1,
+            .iConfiguration        = STR_CONFIG,
+            .bmAttributes          = USB_CFG_ATT_ONE,
+            .bMaxPower             = 15,
+            .nif = 1,
+            .ifs = &desc_iface_u2f_key,
+        },
+    },
+};
+
+static const USBDesc desc_u2f_key = {
+    .id = {
+        .idVendor          = U2F_KEY_VENDOR_NUM,
+        .idProduct         = U2F_KEY_PRODUCT_NUM,
+        .bcdDevice         = 0,
+        .iManufacturer     = STR_MANUFACTURER,
+        .iProduct          = STR_PRODUCT,
+        .iSerialNumber     = STR_SERIALNUMBER,
+    },
+    .full = &desc_device_u2f_key,
+    .str  = desc_strings,
+};
+
+static const uint8_t u2f_key_hid_report_desc[] = {
+    0x06, 0xd0, 0xf1, /* Usage Page (FIDO) */
+    0x09, 0x01,       /* Usage (FIDO) */
+    0xa1, 0x01,       /* Collection (HID Application) */
+    0x09, 0x20,       /*    Usage (FIDO data in) */
+    0x15, 0x00,       /*        Logical Minimum (0) */
+    0x26, 0xFF, 0x00, /*        Logical Maximum (0xff) */
+    0x75, 0x08,       /*        Report Size (8) */
+    0x95, 0x40,       /*        Report Count (0x40) */
+    0x81, 0x02,       /*        Input (Data, Variable, Absolute) */
+    0x09, 0x21,       /*    Usage (FIDO data out) */
+    0x15, 0x00,       /*        Logical Minimum (0) */
+    0x26, 0xFF, 0x00, /*        Logical Maximum  (0xFF) */
+    0x75, 0x08,       /*        Report Size (8) */
+    0x95, 0x40,       /*        Report Count (0x40) */
+    0x91, 0x02,       /*        Output (Data, Variable, Absolute) */
+    0xC0              /* End Collection */
+};
+
+static void u2f_key_reset(U2FKeyState *key)
+{
+    key->pending_in_start = 0;
+    key->pending_in_end = 0;
+    key->pending_in_num = 0;
+}
+
+static void u2f_key_handle_reset(USBDevice *dev)
+{
+    U2FKeyState *key = U2F_KEY(dev);
+
+    u2f_key_reset(key);
+}
+
+static void u2f_key_handle_control(USBDevice *dev, USBPacket *p,
+               int request, int value, int index, int length, uint8_t *data)
+{
+    U2FKeyState *key = U2F_KEY(dev);
+    int ret;
+
+    ret = usb_desc_handle_control(dev, p, request, value, index, length, data);
+    if (ret >= 0) {
+        return;
+    }
+
+    switch (request) {
+    case InterfaceRequest | USB_REQ_GET_DESCRIPTOR:
+        switch (value >> 8) {
+        case 0x22:
+            memcpy(data, u2f_key_hid_report_desc,
+                   sizeof(u2f_key_hid_report_desc));
+            p->actual_length = sizeof(u2f_key_hid_report_desc);
+            break;
+        default:
+            goto fail;
+        }
+        break;
+    case HID_GET_IDLE:
+        data[0] = key->idle;
+        p->actual_length = 1;
+        break;
+    case HID_SET_IDLE:
+        key->idle = (uint8_t)(value >> 8);
+        break;
+    default:
+    fail:
+        p->status = USB_RET_STALL;
+        break;
+    }
+
+}
+
+static void u2f_key_recv_from_guest(U2FKeyState *key, USBPacket *p)
+{
+    U2FKeyClass *kc = U2F_KEY_GET_CLASS(key);
+    uint8_t packet[U2FHID_PACKET_SIZE];
+
+    if (kc->recv_from_guest == NULL || p->iov.size != U2FHID_PACKET_SIZE) {
+        return;
+    }
+
+    usb_packet_copy(p, packet, p->iov.size);
+    kc->recv_from_guest(key, packet);
+}
+
+static void u2f_pending_in_add(U2FKeyState *key,
+                               const uint8_t packet[U2FHID_PACKET_SIZE])
+{
+    uint8_t index;
+
+    if (key->pending_in_num >= U2FHID_PENDING_IN_NUM) {
+        return;
+    }
+
+    index = key->pending_in_end;
+    key->pending_in_end = (index + 1) % U2FHID_PENDING_IN_NUM;
+    ++key->pending_in_num;
+
+    memcpy(key->pending_in[index], packet, U2FHID_PACKET_SIZE);
+}
+
+static uint8_t *u2f_pending_in_get(U2FKeyState *key)
+{
+    uint8_t index;
+
+    if (key->pending_in_num == 0) {
+        return NULL;
+    }
+
+    index = key->pending_in_start;
+    key->pending_in_start = (index + 1) % U2FHID_PENDING_IN_NUM;
+    --key->pending_in_num;
+
+    return key->pending_in[index];
+}
+
+static void u2f_key_handle_data(USBDevice *dev, USBPacket *p)
+{
+    U2FKeyState *key = U2F_KEY(dev);
+    uint8_t *packet_in;
+
+    /* Endpoint number check */
+    if (p->ep->nr != 1) {
+        p->status = USB_RET_STALL;
+        return;
+    }
+
+    switch (p->pid) {
+    case USB_TOKEN_OUT:
+        u2f_key_recv_from_guest(key, p);
+        break;
+    case USB_TOKEN_IN:
+        packet_in = u2f_pending_in_get(key);
+        if (packet_in == NULL) {
+            p->status = USB_RET_NAK;
+            return;
+        }
+        usb_packet_copy(p, packet_in, U2FHID_PACKET_SIZE);
+        break;
+    default:
+        p->status = USB_RET_STALL;
+        break;
+    }
+}
+
+void u2f_send_to_guest(U2FKeyState *key,
+                       const uint8_t packet[U2FHID_PACKET_SIZE])
+{
+    u2f_pending_in_add(key, packet);
+    usb_wakeup(key->ep, 0);
+}
+
+static void u2f_key_unrealize(USBDevice *dev)
+{
+    U2FKeyState *key = U2F_KEY(dev);
+    U2FKeyClass *kc = U2F_KEY_GET_CLASS(key);
+
+    if (kc->unrealize != NULL) {
+        kc->unrealize(key);
+    }
+}
+
+static void u2f_key_realize(USBDevice *dev, Error **errp)
+{
+    U2FKeyState *key = U2F_KEY(dev);
+    U2FKeyClass *kc = U2F_KEY_GET_CLASS(key);
+    Error *local_err = NULL;
+
+    usb_desc_create_serial(dev);
+    usb_desc_init(dev);
+    u2f_key_reset(key);
+
+    if (kc->realize != NULL) {
+        kc->realize(key, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
+    }
+    key->ep = usb_ep_get(dev, USB_TOKEN_IN, 1);
+}
+
+const VMStateDescription vmstate_u2f_key = {
+    .name = "u2f-key",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_USB_DEVICE(dev, U2FKeyState),
+        VMSTATE_UINT8(idle, U2FKeyState),
+        VMSTATE_UINT8_2DARRAY(pending_in, U2FKeyState,
+            U2FHID_PENDING_IN_NUM, U2FHID_PACKET_SIZE),
+        VMSTATE_UINT8(pending_in_start, U2FKeyState),
+        VMSTATE_UINT8(pending_in_end, U2FKeyState),
+        VMSTATE_UINT8(pending_in_num, U2FKeyState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void u2f_key_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    USBDeviceClass *uc = USB_DEVICE_CLASS(klass);
+
+    uc->product_desc   = "QEMU U2F USB key";
+    uc->usb_desc       = &desc_u2f_key;
+    uc->handle_reset   = u2f_key_handle_reset;
+    uc->handle_control = u2f_key_handle_control;
+    uc->handle_data    = u2f_key_handle_data;
+    uc->handle_attach  = usb_desc_attach;
+    uc->realize        = u2f_key_realize;
+    uc->unrealize      = u2f_key_unrealize;
+    dc->desc           = "QEMU U2F key";
+    dc->vmsd           = &vmstate_u2f_key;
+}
+
+static const TypeInfo u2f_key_info = {
+    .name          = TYPE_U2F_KEY,
+    .parent        = TYPE_USB_DEVICE,
+    .instance_size = sizeof(U2FKeyState),
+    .abstract      = true,
+    .class_size    = sizeof(U2FKeyClass),
+    .class_init    = u2f_key_class_init,
+};
+
+static void u2f_key_register_types(void)
+{
+    type_register_static(&u2f_key_info);
+    usb_legacy_register(TYPE_U2F_KEY, "u2f-key", NULL);
+}
+
+type_init(u2f_key_register_types)
-- 
2.18.4


