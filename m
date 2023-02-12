Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AECA3693AAF
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 23:54:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRLE6-00025z-Qf; Sun, 12 Feb 2023 17:53:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLE4-0001v9-Ux
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:53:40 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLE2-0004Hn-Sw
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:53:40 -0500
Received: by mail-wm1-x32a.google.com with SMTP id z13so7552017wmp.2
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 14:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y7MPn97FcL/7BFhSjHMb1CUqDm78YK7bxAD/KSpYvWc=;
 b=K5kR2iIAlG/tgEloMhNQllCw7HWJqgY/l2CMffXFBlhZK70onVOm5WRQkBPMYna3mN
 fcDkLZISPcEdzsFhbEVQ+ZYsqbfT0TATIhpGDpfnXLQQkArLkwR3ar1ER5li+nx7stNn
 6r7xKcHvxIeWzdQ+cTnGZR2PKK+xXkPXgku8N9f+FI0ZrUgeEWV3kraWlUWieCaOh/qK
 ATxXz2paOpGfrRQpBKhNGp2LnkglodiQYHeNtsIKcBx6XTJtn8S7+s8UdgFI1XZxkK64
 gcy/xM3KCG+VphBitmP949kJdom9DqpkBakjy/b/iF2hDHnL6BIWqOMroQBb9Ou8khoz
 Qshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y7MPn97FcL/7BFhSjHMb1CUqDm78YK7bxAD/KSpYvWc=;
 b=RQ1gFaUbRTg3URgYMSseBKzn4ay8awBryfIMkNCTTHP7TlfBZ7nuNd13ncHZRhSJn2
 Oal3s6r3InPE2q+Uv2E/Z4KX/P0CfNs2HI7sljuV119xuu6fMUp8KlYsj0ji4B4V3MR4
 pjoMkkqTag+caArkr27RyMLGyhYHfH+Z/N420APJMvNq8qTugIfoENuS8DuSg7nldyVB
 ztPb/XjhwTEK6LxW7UWrGzGa38XIyDEceusfKXd21Jxlw6E/DG9bWctsulbsdBPemh+Y
 IeoPU5zThcIF3TgN/zAWvLxnGUBNmIANsUa5dc/iKYZJRTjV1cq9eT54aFykEe3t+gjS
 TPvg==
X-Gm-Message-State: AO0yUKUxeUQjkkpCQDR+yVwHbgaDaT0IGfh9oRMznSBTEttu8aF8FK01
 xWwZUhU0XByQPXASVK2e147Qjg==
X-Google-Smtp-Source: AK7set+HtjaxVgYpUJCpkgf7zMVYf5+eLQiNPj8we1EpLcPt6O7wgtdbbDICyBEYUUd5+Cn03Bdagw==
X-Received: by 2002:a05:600c:4b1b:b0:3df:fbc7:5b10 with SMTP id
 i27-20020a05600c4b1b00b003dffbc75b10mr17047531wmp.0.1676242417442; 
 Sun, 12 Feb 2023 14:53:37 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a1c5445000000b003dc492e4430sm12040317wmi.28.2023.02.12.14.53.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 14:53:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Eduardo Habkost <eduardo@habkost.net>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xiaoqiang zhao <zxq_yx_007@163.com>, Hu Tao <hutao@cn.fujitsu.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Li Qiang <liq3ea@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [RFC PATCH 19/19] hw/usb: Inline usb_bus_from_device()
Date: Sun, 12 Feb 2023 23:51:44 +0100
Message-Id: <20230212225144.58660-20-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230212225144.58660-1-philmd@linaro.org>
References: <20230212225144.58660-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
RFC Other devices don't use such helper. Maybe it should
    be the other way around, introduce more bus_from_device()
    helpers?
---
 hw/usb/bus.c        | 10 +++++-----
 hw/usb/core.c       |  6 +++---
 hw/usb/dev-hub.c    |  4 ++--
 hw/usb/dev-serial.c | 10 +++++-----
 hw/usb/hcd-xhci.c   |  2 +-
 include/hw/usb.h    |  5 -----
 6 files changed, 16 insertions(+), 21 deletions(-)

diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index d7c3c71435..4a1b67761c 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -427,7 +427,7 @@ void usb_unregister_port(USBBus *bus, USBPort *port)
 
 void usb_claim_port(USBDevice *dev, Error **errp)
 {
-    USBBus *bus = usb_bus_from_device(dev);
+    USBBus *bus = USB_BUS(qdev_get_parent_bus(DEVICE(dev)));
     USBPort *port;
     USBDevice *hub;
 
@@ -473,7 +473,7 @@ void usb_claim_port(USBDevice *dev, Error **errp)
 
 void usb_release_port(USBDevice *dev)
 {
-    USBBus *bus = usb_bus_from_device(dev);
+    USBBus *bus = USB_BUS(qdev_get_parent_bus(DEVICE(dev)));
     USBPort *port = dev->port;
 
     assert(port != NULL);
@@ -517,7 +517,7 @@ static void usb_mask_to_str(char *dest, size_t size,
 
 void usb_check_attach(USBDevice *dev, Error **errp)
 {
-    USBBus *bus = usb_bus_from_device(dev);
+    USBBus *bus = USB_BUS(qdev_get_parent_bus(DEVICE(dev)));
     USBPort *port = dev->port;
     char devspeed[32], portspeed[32];
 
@@ -555,7 +555,7 @@ void usb_device_attach(USBDevice *dev, Error **errp)
 
 int usb_device_detach(USBDevice *dev)
 {
-    USBBus *bus = usb_bus_from_device(dev);
+    USBBus *bus = USB_BUS(qdev_get_parent_bus(DEVICE(dev)));
     USBPort *port = dev->port;
 
     assert(port != NULL);
@@ -583,7 +583,7 @@ static const char *usb_speed(unsigned int speed)
 static void usb_bus_dev_print(Monitor *mon, DeviceState *qdev, int indent)
 {
     USBDevice *dev = USB_DEVICE(qdev);
-    USBBus *bus = usb_bus_from_device(dev);
+    USBBus *bus = USB_BUS(qdev_get_parent_bus(qdev));
 
     monitor_printf(mon, "%*saddr %d.%d, port %s, speed %s, name %s%s\n",
                    indent, "", bus->busnr, dev->addr,
diff --git a/hw/usb/core.c b/hw/usb/core.c
index 975f76250a..f358f0313a 100644
--- a/hw/usb/core.c
+++ b/hw/usb/core.c
@@ -95,7 +95,7 @@ void usb_device_reset(USBDevice *dev)
 void usb_wakeup(USBEndpoint *ep, unsigned int stream)
 {
     USBDevice *dev = ep->dev;
-    USBBus *bus = usb_bus_from_device(dev);
+    USBBus *bus = USB_BUS(qdev_get_parent_bus(DEVICE(dev)));
 
     if (!phase_check(PHASE_MACHINE_READY)) {
         /*
@@ -556,7 +556,7 @@ void usb_packet_check_state(USBPacket *p, USBPacketState expected)
         return;
     }
     dev = p->ep->dev;
-    bus = usb_bus_from_device(dev);
+    bus = USB_BUS(qdev_get_parent_bus(DEVICE(dev)));
     trace_usb_packet_state_fault(bus->busnr, dev->port->path, p->ep->nr, p,
                                  usb_packet_state_name(p->state),
                                  usb_packet_state_name(expected));
@@ -567,7 +567,7 @@ void usb_packet_set_state(USBPacket *p, USBPacketState state)
 {
     if (p->ep) {
         USBDevice *dev = p->ep->dev;
-        USBBus *bus = usb_bus_from_device(dev);
+        USBBus *bus = USB_BUS(qdev_get_parent_bus(DEVICE(dev)));
         trace_usb_packet_state_change(bus->busnr, dev->port->path, p->ep->nr, p,
                                       usb_packet_state_name(p->state),
                                       usb_packet_state_name(state));
diff --git a/hw/usb/dev-hub.c b/hw/usb/dev-hub.c
index 4734700e3e..4a0bcc4093 100644
--- a/hw/usb/dev-hub.c
+++ b/hw/usb/dev-hub.c
@@ -572,7 +572,7 @@ static void usb_hub_unrealize(USBDevice *dev)
     int i;
 
     for (i = 0; i < s->num_ports; i++) {
-        usb_unregister_port(usb_bus_from_device(dev),
+        usb_unregister_port(USB_BUS(qdev_get_parent_bus(DEVICE(dev))),
                             &s->ports[i].port);
     }
 
@@ -611,7 +611,7 @@ static void usb_hub_realize(USBDevice *dev, Error **errp)
     s->intr = usb_ep_get(dev, USB_TOKEN_IN, 1);
     for (i = 0; i < s->num_ports; i++) {
         port = &s->ports[i];
-        usb_register_port(usb_bus_from_device(dev),
+        usb_register_port(USB_BUS(qdev_get_parent_bus(DEVICE(dev))),
                           &port->port, s, i, &usb_hub_port_ops,
                           USB_SPEED_MASK_LOW | USB_SPEED_MASK_FULL);
         usb_port_location(&port->port, dev->port, i+1);
diff --git a/hw/usb/dev-serial.c b/hw/usb/dev-serial.c
index 63047d79cf..0194bb541b 100644
--- a/hw/usb/dev-serial.c
+++ b/hw/usb/dev-serial.c
@@ -190,7 +190,7 @@ static void usb_serial_set_flow_control(USBSerialState *s,
                                         uint8_t flow_control)
 {
     USBDevice *dev = USB_DEVICE(s);
-    USBBus *bus = usb_bus_from_device(dev);
+    USBBus *bus = USB_BUS(qdev_get_parent_bus(DEVICE(dev)));
 
     /* TODO: ioctl */
     s->flow_control = flow_control;
@@ -200,7 +200,7 @@ static void usb_serial_set_flow_control(USBSerialState *s,
 static void usb_serial_set_xonxoff(USBSerialState *s, int xonxoff)
 {
     USBDevice *dev = USB_DEVICE(s);
-    USBBus *bus = usb_bus_from_device(dev);
+    USBBus *bus = USB_BUS(qdev_get_parent_bus(DEVICE(dev)));
 
     s->xon = xonxoff & 0xff;
     s->xoff = (xonxoff >> 8) & 0xff;
@@ -221,7 +221,7 @@ static void usb_serial_reset(USBSerialState *s)
 static void usb_serial_handle_reset(USBDevice *dev)
 {
     USBSerialState *s = USB_SERIAL(dev);
-    USBBus *bus = usb_bus_from_device(dev);
+    USBBus *bus = USB_BUS(qdev_get_parent_bus(DEVICE(dev)));
 
     trace_usb_serial_reset(bus->busnr, dev->addr);
 
@@ -261,7 +261,7 @@ static void usb_serial_handle_control(USBDevice *dev, USBPacket *p,
                                       int length, uint8_t *data)
 {
     USBSerialState *s = USB_SERIAL(dev);
-    USBBus *bus = usb_bus_from_device(dev);
+    USBBus *bus = USB_BUS(qdev_get_parent_bus(DEVICE(dev)));
     int ret;
 
     trace_usb_serial_handle_control(bus->busnr, dev->addr, request, value);
@@ -479,7 +479,7 @@ static void usb_serial_token_in(USBSerialState *s, USBPacket *p)
 static void usb_serial_handle_data(USBDevice *dev, USBPacket *p)
 {
     USBSerialState *s = USB_SERIAL(dev);
-    USBBus *bus = usb_bus_from_device(dev);
+    USBBus *bus = USB_BUS(qdev_get_parent_bus(DEVICE(dev)));
     uint8_t devep = p->ep->nr;
     struct iovec *iov;
     int i;
diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index b89b618ec2..94c2e58aaf 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -3268,7 +3268,7 @@ static void xhci_complete(USBPort *port, USBPacket *packet)
 
 static void xhci_child_detach(USBPort *uport, USBDevice *child)
 {
-    USBBus *bus = usb_bus_from_device(child);
+    USBBus *bus = USB_BUS(qdev_get_parent_bus(DEVICE(child)));
     XHCIState *xhci = container_of(bus, XHCIState, bus);
 
     xhci_detach_slot(xhci, child->port);
diff --git a/include/hw/usb.h b/include/hw/usb.h
index f743a5e945..4a2987c477 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -518,11 +518,6 @@ void usb_device_attach(USBDevice *dev, Error **errp);
 int usb_device_detach(USBDevice *dev);
 void usb_check_attach(USBDevice *dev, Error **errp);
 
-static inline USBBus *usb_bus_from_device(USBDevice *d)
-{
-    return USB_BUS(qdev_get_parent_bus(DEVICE(d)));
-}
-
 extern const VMStateDescription vmstate_usb_device;
 
 #define VMSTATE_USB_DEVICE(_field, _state) {                         \
-- 
2.38.1


