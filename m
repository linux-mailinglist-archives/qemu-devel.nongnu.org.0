Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C2D2607B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 11:28:36 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39138 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTNY3-0003I6-Ck
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 05:28:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43778)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hTNTY-0000Ys-RX
	for qemu-devel@nongnu.org; Wed, 22 May 2019 05:23:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hTNTX-00016z-Ix
	for qemu-devel@nongnu.org; Wed, 22 May 2019 05:23:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42146)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hTNTX-00015q-BJ
	for qemu-devel@nongnu.org; Wed, 22 May 2019 05:23:55 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A897981E04
	for <qemu-devel@nongnu.org>; Wed, 22 May 2019 09:23:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-74.ams2.redhat.com
	[10.36.117.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EAC9162660;
	Wed, 22 May 2019 09:23:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 1A815A205; Wed, 22 May 2019 11:23:51 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 22 May 2019 11:23:48 +0200
Message-Id: <20190522092351.17920-3-kraxel@redhat.com>
In-Reply-To: <20190522092351.17920-1-kraxel@redhat.com>
References: <20190522092351.17920-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 22 May 2019 09:23:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 2/5] usb-hub: make number of ports
 runtime-configurable
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add num_ports property which allows configure the number of downstream
ports.  Valid range is 1-8, default is 8.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/dev-hub.c | 45 +++++++++++++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 16 deletions(-)

diff --git a/hw/usb/dev-hub.c b/hw/usb/dev-hub.c
index 9b04b6a6ec2d..d25ac1817995 100644
--- a/hw/usb/dev-hub.c
+++ b/hw/usb/dev-hub.c
@@ -29,7 +29,7 @@
 #include "desc.h"
 #include "qemu/error-report.h"
 
-#define NUM_PORTS 8
+#define MAX_PORTS 8
 
 typedef struct USBHubPort {
     USBPort port;
@@ -40,7 +40,8 @@ typedef struct USBHubPort {
 typedef struct USBHubState {
     USBDevice dev;
     USBEndpoint *intr;
-    USBHubPort ports[NUM_PORTS];
+    uint32_t num_ports;
+    USBHubPort ports[MAX_PORTS];
 } USBHubState;
 
 #define TYPE_USB_HUB "usb-hub"
@@ -109,7 +110,7 @@ static const USBDescIface desc_iface_hub = {
         {
             .bEndpointAddress      = USB_DIR_IN | 0x01,
             .bmAttributes          = USB_ENDPOINT_XFER_INT,
-            .wMaxPacketSize        = 1 + DIV_ROUND_UP(NUM_PORTS, 8),
+            .wMaxPacketSize        = 1 + DIV_ROUND_UP(MAX_PORTS, 8),
             .bInterval             = 0xff,
         },
     }
@@ -242,7 +243,7 @@ static USBDevice *usb_hub_find_device(USBDevice *dev, uint8_t addr)
     USBDevice *downstream;
     int i;
 
-    for (i = 0; i < NUM_PORTS; i++) {
+    for (i = 0; i < s->num_ports; i++) {
         port = &s->ports[i];
         if (!(port->wPortStatus & PORT_STAT_ENABLE)) {
             continue;
@@ -262,7 +263,7 @@ static void usb_hub_handle_reset(USBDevice *dev)
     int i;
 
     trace_usb_hub_reset(s->dev.addr);
-    for (i = 0; i < NUM_PORTS; i++) {
+    for (i = 0; i < s->num_ports; i++) {
         port = s->ports + i;
         port->wPortStatus = PORT_STAT_POWER;
         port->wPortChange = 0;
@@ -332,7 +333,7 @@ static void usb_hub_handle_control(USBDevice *dev, USBPacket *p,
         {
             unsigned int n = index - 1;
             USBHubPort *port;
-            if (n >= NUM_PORTS) {
+            if (n >= s->num_ports) {
                 goto fail;
             }
             port = &s->ports[n];
@@ -361,7 +362,7 @@ static void usb_hub_handle_control(USBDevice *dev, USBPacket *p,
             trace_usb_hub_set_port_feature(s->dev.addr, index,
                                            feature_name(value));
 
-            if (n >= NUM_PORTS) {
+            if (n >= s->num_ports) {
                 goto fail;
             }
             port = &s->ports[n];
@@ -394,7 +395,7 @@ static void usb_hub_handle_control(USBDevice *dev, USBPacket *p,
             trace_usb_hub_clear_port_feature(s->dev.addr, index,
                                              feature_name(value));
 
-            if (n >= NUM_PORTS) {
+            if (n >= s->num_ports) {
                 goto fail;
             }
             port = &s->ports[n];
@@ -443,17 +444,17 @@ static void usb_hub_handle_control(USBDevice *dev, USBPacket *p,
             unsigned int n, limit, var_hub_size = 0;
             memcpy(data, qemu_hub_hub_descriptor,
                    sizeof(qemu_hub_hub_descriptor));
-            data[2] = NUM_PORTS;
+            data[2] = s->num_ports;
 
             /* fill DeviceRemovable bits */
-            limit = DIV_ROUND_UP(NUM_PORTS + 1, 8) + 7;
+            limit = DIV_ROUND_UP(s->num_ports + 1, 8) + 7;
             for (n = 7; n < limit; n++) {
                 data[n] = 0x00;
                 var_hub_size++;
             }
 
             /* fill PortPwrCtrlMask bits */
-            limit = limit + DIV_ROUND_UP(NUM_PORTS, 8);
+            limit = limit + DIV_ROUND_UP(s->num_ports, 8);
             for (;n < limit; n++) {
                 data[n] = 0xff;
                 var_hub_size++;
@@ -481,7 +482,7 @@ static void usb_hub_handle_data(USBDevice *dev, USBPacket *p)
             unsigned int status;
             uint8_t buf[4];
             int i, n;
-            n = DIV_ROUND_UP(NUM_PORTS + 1, 8);
+            n = DIV_ROUND_UP(s->num_ports + 1, 8);
             if (p->iov.size == 1) { /* FreeBSD workaround */
                 n = 1;
             } else if (n > p->iov.size) {
@@ -489,7 +490,7 @@ static void usb_hub_handle_data(USBDevice *dev, USBPacket *p)
                 return;
             }
             status = 0;
-            for(i = 0; i < NUM_PORTS; i++) {
+            for(i = 0; i < s->num_ports; i++) {
                 port = &s->ports[i];
                 if (port->wPortChange)
                     status |= (1 << (i + 1));
@@ -520,7 +521,7 @@ static void usb_hub_unrealize(USBDevice *dev, Error **errp)
     USBHubState *s = (USBHubState *)dev;
     int i;
 
-    for (i = 0; i < NUM_PORTS; i++) {
+    for (i = 0; i < s->num_ports; i++) {
         usb_unregister_port(usb_bus_from_device(dev),
                             &s->ports[i].port);
     }
@@ -540,6 +541,12 @@ static void usb_hub_realize(USBDevice *dev, Error **errp)
     USBHubPort *port;
     int i;
 
+    if (s->num_ports < 1 || s->num_ports > MAX_PORTS) {
+        error_setg(errp, "num_ports (%d) out of range (1..%d)",
+                   s->num_ports, MAX_PORTS);
+        return;
+    }
+
     if (dev->port->hubcount == 5) {
         error_setg(errp, "usb hub chain too deep");
         return;
@@ -548,7 +555,7 @@ static void usb_hub_realize(USBDevice *dev, Error **errp)
     usb_desc_create_serial(dev);
     usb_desc_init(dev);
     s->intr = usb_ep_get(dev, USB_TOKEN_IN, 1);
-    for (i = 0; i < NUM_PORTS; i++) {
+    for (i = 0; i < s->num_ports; i++) {
         port = &s->ports[i];
         usb_register_port(usb_bus_from_device(dev),
                           &port->port, s, i, &usb_hub_port_ops,
@@ -575,12 +582,17 @@ static const VMStateDescription vmstate_usb_hub = {
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
         VMSTATE_USB_DEVICE(dev, USBHubState),
-        VMSTATE_STRUCT_ARRAY(ports, USBHubState, NUM_PORTS, 0,
+        VMSTATE_STRUCT_ARRAY(ports, USBHubState, MAX_PORTS, 0,
                              vmstate_usb_hub_port, USBHubPort),
         VMSTATE_END_OF_LIST()
     }
 };
 
+static Property usb_hub_properties[] = {
+    DEFINE_PROP_UINT32("ports", USBHubState, num_ports, 8),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void usb_hub_class_initfn(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -597,6 +609,7 @@ static void usb_hub_class_initfn(ObjectClass *klass, void *data)
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
     dc->fw_name = "hub";
     dc->vmsd = &vmstate_usb_hub;
+    dc->props = usb_hub_properties;
 }
 
 static const TypeInfo hub_info = {
-- 
2.18.1


