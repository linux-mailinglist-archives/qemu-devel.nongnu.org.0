Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C99694399
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 11:56:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRWVn-0006hz-BN; Mon, 13 Feb 2023 05:56:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRWVe-0006eR-GQ
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:56:34 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRWVa-0003fL-T1
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:56:33 -0500
Received: by mail-wr1-x433.google.com with SMTP id bk16so11693143wrb.11
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 02:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aF98Ma9RkPF/Vf1N+Mxitvw+ZUTQ0aa8j86PfGUlqco=;
 b=tyI42UepU6YR1dfVpVjzyz+FOViUjOCXASljJk/gExyr30grL6ajWokHe8e7rqKEFT
 0BdGH3zFcRA9oRjtzzyBFgJdZp5/r9X1brHqSZm0PSfXijIeFj3fl9J5Lx3uNxfJXnVi
 DwrlxJysuB2hoUQWezOwBFV6EXZDhRFCtESDf8jk9zgsFPiurCUD2S15suI7CHjyYJ3X
 7HoV4wttVed0Fxl5+2dCtpBu7ZIP3ks+dPT3ZMDxk5R/kwv9HWjNoO8Mzja1XE1TMmK+
 A1sBEuNhHh//7VRlGKrJWILHRmXcDrbcLUW0kzF0JF29XT6m8YmqPmc3Gq7TaUgpylzd
 rhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aF98Ma9RkPF/Vf1N+Mxitvw+ZUTQ0aa8j86PfGUlqco=;
 b=tzfLJ51CAdlmHqAqghsRBkdt3RhaLo1vkkQSlUD3Hj1ui8KQnf7mjsYVm6Nj+q4g8n
 71ih3khnfopiVh00/CdDLNXXOTsz7eZMkaX3iw8FmTnxWmOQQwT7CRdJAsxGF61xT6/f
 26xWKnQKuEOl08neWP8YzXovhhdpUK0wmhFB0KLYLXhO54Dys1WrC40t1SGl14bGOemG
 8VSZDuxENI4+q0kQ2pe+GbTEGXPIJi8SCvuvYgUmRq5gx2zbx5nAjMqG62yKrPWDVU4J
 8VjQZ5N8qoXwsN0xMjCLkycq3yFy6EltbaxPFAK8jHN4VQVAoIAfAPLFIQ8Hfn8SCmLG
 QiSA==
X-Gm-Message-State: AO0yUKWrkh0a2vnS+rYAAKoMt+AKSFO1HrC69BoliUb3oKHf4DDP2ht+
 QRCQvu81KyoE4xUUuR+l9PwIw/aYOZPOZY4b
X-Google-Smtp-Source: AK7set+vzrWSSQpAMDpuFOIvEAWU6HForGVCe5lFTCzbG5yArUOKdqEWHH9hVjBmWGWdUr/8/hby3Q==
X-Received: by 2002:a05:6000:1249:b0:2c5:5d1d:b244 with SMTP id
 j9-20020a056000124900b002c55d1db244mr1110571wrx.29.1676285788012; 
 Mon, 13 Feb 2023 02:56:28 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a5d5409000000b002c558228b6dsm2866827wrv.12.2023.02.13.02.56.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 02:56:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 3/3] hw/usb: Use USB_DEVICE_GET_BUS() macro
Date: Mon, 13 Feb 2023 11:56:09 +0100
Message-Id: <20230213105609.6173-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213105609.6173-1-philmd@linaro.org>
References: <20230213105609.6173-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Automatic conversion running:

  $ sed -i -e s/usb_bus_from_device/USB_DEVICE_GET_BUS/g \
    $(git grep -wl usb_bus_from_device)

then removing the usb_bus_from_device() function declaration.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/bus.c        | 10 +++++-----
 hw/usb/core.c       |  6 +++---
 hw/usb/dev-hub.c    |  4 ++--
 hw/usb/dev-serial.c | 10 +++++-----
 hw/usb/hcd-xhci.c   |  2 +-
 include/hw/usb.h    |  5 -----
 6 files changed, 16 insertions(+), 21 deletions(-)

diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index d7c3c71435..fa154e1e79 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -427,7 +427,7 @@ void usb_unregister_port(USBBus *bus, USBPort *port)
 
 void usb_claim_port(USBDevice *dev, Error **errp)
 {
-    USBBus *bus = usb_bus_from_device(dev);
+    USBBus *bus = USB_DEVICE_GET_BUS(dev);
     USBPort *port;
     USBDevice *hub;
 
@@ -473,7 +473,7 @@ void usb_claim_port(USBDevice *dev, Error **errp)
 
 void usb_release_port(USBDevice *dev)
 {
-    USBBus *bus = usb_bus_from_device(dev);
+    USBBus *bus = USB_DEVICE_GET_BUS(dev);
     USBPort *port = dev->port;
 
     assert(port != NULL);
@@ -517,7 +517,7 @@ static void usb_mask_to_str(char *dest, size_t size,
 
 void usb_check_attach(USBDevice *dev, Error **errp)
 {
-    USBBus *bus = usb_bus_from_device(dev);
+    USBBus *bus = USB_DEVICE_GET_BUS(dev);
     USBPort *port = dev->port;
     char devspeed[32], portspeed[32];
 
@@ -555,7 +555,7 @@ void usb_device_attach(USBDevice *dev, Error **errp)
 
 int usb_device_detach(USBDevice *dev)
 {
-    USBBus *bus = usb_bus_from_device(dev);
+    USBBus *bus = USB_DEVICE_GET_BUS(dev);
     USBPort *port = dev->port;
 
     assert(port != NULL);
@@ -583,7 +583,7 @@ static const char *usb_speed(unsigned int speed)
 static void usb_bus_dev_print(Monitor *mon, DeviceState *qdev, int indent)
 {
     USBDevice *dev = USB_DEVICE(qdev);
-    USBBus *bus = usb_bus_from_device(dev);
+    USBBus *bus = USB_DEVICE_GET_BUS(dev);
 
     monitor_printf(mon, "%*saddr %d.%d, port %s, speed %s, name %s%s\n",
                    indent, "", bus->busnr, dev->addr,
diff --git a/hw/usb/core.c b/hw/usb/core.c
index 975f76250a..849e95b9e2 100644
--- a/hw/usb/core.c
+++ b/hw/usb/core.c
@@ -95,7 +95,7 @@ void usb_device_reset(USBDevice *dev)
 void usb_wakeup(USBEndpoint *ep, unsigned int stream)
 {
     USBDevice *dev = ep->dev;
-    USBBus *bus = usb_bus_from_device(dev);
+    USBBus *bus = USB_DEVICE_GET_BUS(dev);
 
     if (!phase_check(PHASE_MACHINE_READY)) {
         /*
@@ -556,7 +556,7 @@ void usb_packet_check_state(USBPacket *p, USBPacketState expected)
         return;
     }
     dev = p->ep->dev;
-    bus = usb_bus_from_device(dev);
+    bus = USB_DEVICE_GET_BUS(dev);
     trace_usb_packet_state_fault(bus->busnr, dev->port->path, p->ep->nr, p,
                                  usb_packet_state_name(p->state),
                                  usb_packet_state_name(expected));
@@ -567,7 +567,7 @@ void usb_packet_set_state(USBPacket *p, USBPacketState state)
 {
     if (p->ep) {
         USBDevice *dev = p->ep->dev;
-        USBBus *bus = usb_bus_from_device(dev);
+        USBBus *bus = USB_DEVICE_GET_BUS(dev);
         trace_usb_packet_state_change(bus->busnr, dev->port->path, p->ep->nr, p,
                                       usb_packet_state_name(p->state),
                                       usb_packet_state_name(state));
diff --git a/hw/usb/dev-hub.c b/hw/usb/dev-hub.c
index a6b50dbc8d..fa094ec9bd 100644
--- a/hw/usb/dev-hub.c
+++ b/hw/usb/dev-hub.c
@@ -572,7 +572,7 @@ static void usb_hub_unrealize(USBDevice *dev)
     int i;
 
     for (i = 0; i < s->num_ports; i++) {
-        usb_unregister_port(usb_bus_from_device(dev),
+        usb_unregister_port(USB_DEVICE_GET_BUS(dev),
                             &s->ports[i].port);
     }
 
@@ -611,7 +611,7 @@ static void usb_hub_realize(USBDevice *dev, Error **errp)
     s->intr = usb_ep_get(dev, USB_TOKEN_IN, 1);
     for (i = 0; i < s->num_ports; i++) {
         port = &s->ports[i];
-        usb_register_port(usb_bus_from_device(dev),
+        usb_register_port(USB_DEVICE_GET_BUS(dev),
                           &port->port, s, i, &usb_hub_port_ops,
                           USB_SPEED_MASK_LOW | USB_SPEED_MASK_FULL);
         usb_port_location(&port->port, dev->port, i+1);
diff --git a/hw/usb/dev-serial.c b/hw/usb/dev-serial.c
index 63047d79cf..4cfe27818b 100644
--- a/hw/usb/dev-serial.c
+++ b/hw/usb/dev-serial.c
@@ -190,7 +190,7 @@ static void usb_serial_set_flow_control(USBSerialState *s,
                                         uint8_t flow_control)
 {
     USBDevice *dev = USB_DEVICE(s);
-    USBBus *bus = usb_bus_from_device(dev);
+    USBBus *bus = USB_DEVICE_GET_BUS(dev);
 
     /* TODO: ioctl */
     s->flow_control = flow_control;
@@ -200,7 +200,7 @@ static void usb_serial_set_flow_control(USBSerialState *s,
 static void usb_serial_set_xonxoff(USBSerialState *s, int xonxoff)
 {
     USBDevice *dev = USB_DEVICE(s);
-    USBBus *bus = usb_bus_from_device(dev);
+    USBBus *bus = USB_DEVICE_GET_BUS(dev);
 
     s->xon = xonxoff & 0xff;
     s->xoff = (xonxoff >> 8) & 0xff;
@@ -221,7 +221,7 @@ static void usb_serial_reset(USBSerialState *s)
 static void usb_serial_handle_reset(USBDevice *dev)
 {
     USBSerialState *s = USB_SERIAL(dev);
-    USBBus *bus = usb_bus_from_device(dev);
+    USBBus *bus = USB_DEVICE_GET_BUS(dev);
 
     trace_usb_serial_reset(bus->busnr, dev->addr);
 
@@ -261,7 +261,7 @@ static void usb_serial_handle_control(USBDevice *dev, USBPacket *p,
                                       int length, uint8_t *data)
 {
     USBSerialState *s = USB_SERIAL(dev);
-    USBBus *bus = usb_bus_from_device(dev);
+    USBBus *bus = USB_DEVICE_GET_BUS(dev);
     int ret;
 
     trace_usb_serial_handle_control(bus->busnr, dev->addr, request, value);
@@ -479,7 +479,7 @@ static void usb_serial_token_in(USBSerialState *s, USBPacket *p)
 static void usb_serial_handle_data(USBDevice *dev, USBPacket *p)
 {
     USBSerialState *s = USB_SERIAL(dev);
-    USBBus *bus = usb_bus_from_device(dev);
+    USBBus *bus = USB_DEVICE_GET_BUS(dev);
     uint8_t devep = p->ep->nr;
     struct iovec *iov;
     int i;
diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index b89b618ec2..7d2ff9d46a 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -3268,7 +3268,7 @@ static void xhci_complete(USBPort *port, USBPacket *packet)
 
 static void xhci_child_detach(USBPort *uport, USBDevice *child)
 {
-    USBBus *bus = usb_bus_from_device(child);
+    USBBus *bus = USB_DEVICE_GET_BUS(child);
     XHCIState *xhci = container_of(bus, XHCIState, bus);
 
     xhci_detach_slot(xhci, child->port);
diff --git a/include/hw/usb.h b/include/hw/usb.h
index 09f345f5c5..d859cdc11c 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -518,11 +518,6 @@ void usb_device_attach(USBDevice *dev, Error **errp);
 int usb_device_detach(USBDevice *dev);
 void usb_check_attach(USBDevice *dev, Error **errp);
 
-static inline USBBus *usb_bus_from_device(USBDevice *d)
-{
-    return DO_UPCAST(USBBus, qbus, qdev_get_parent_bus(DEVICE(d)));
-}
-
 extern const VMStateDescription vmstate_usb_device;
 
 #define VMSTATE_USB_DEVICE(_field, _state) {                         \
-- 
2.38.1


