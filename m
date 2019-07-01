Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A292D58E
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 08:33:56 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48070 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVs9r-0003Nl-CE
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 02:33:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42039)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hVs4o-0000ao-Az
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:28:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hVs4m-0004eu-0H
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:28:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60314)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hVs4l-0004dt-G8
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:28:39 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 74F6F59450;
	Wed, 29 May 2019 06:28:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-59.ams2.redhat.com
	[10.36.116.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2A7181001DDD;
	Wed, 29 May 2019 06:28:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 398A317534; Wed, 29 May 2019 08:28:33 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 29 May 2019 08:28:30 +0200
Message-Id: <20190529062832.26483-8-kraxel@redhat.com>
In-Reply-To: <20190529062832.26483-1-kraxel@redhat.com>
References: <20190529062832.26483-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 29 May 2019 06:28:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 7/9] usb-hub: add usb_hub_port_update()
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Helper function to update port status bits which depends on the
connected device.  We need the same logic for device attach and
port reset, so factor it out.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-id: 20190524070310.4952-5-kraxel@redhat.com
---
 hw/usb/dev-hub.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/hw/usb/dev-hub.c b/hw/usb/dev-hub.c
index 1cc92a5f9abe..29f4d6723e26 100644
--- a/hw/usb/dev-hub.c
+++ b/hw/usb/dev-hub.c
@@ -188,18 +188,28 @@ static bool usb_hub_port_clear(USBHubPort *port, ui=
nt16_t status)
     return usb_hub_port_change(port, status);
 }
=20
+static bool usb_hub_port_update(USBHubPort *port)
+{
+    bool notify =3D false;
+
+    if (port->port.dev && port->port.dev->attached) {
+        notify =3D usb_hub_port_set(port, PORT_STAT_CONNECTION);
+        if (port->port.dev->speed =3D=3D USB_SPEED_LOW) {
+            usb_hub_port_set(port, PORT_STAT_LOW_SPEED);
+        } else {
+            usb_hub_port_clear(port, PORT_STAT_LOW_SPEED);
+        }
+    }
+    return notify;
+}
+
 static void usb_hub_attach(USBPort *port1)
 {
     USBHubState *s =3D port1->opaque;
     USBHubPort *port =3D &s->ports[port1->index];
=20
     trace_usb_hub_attach(s->dev.addr, port1->index + 1);
-    usb_hub_port_set(port, PORT_STAT_CONNECTION);
-    if (port->port.dev->speed =3D=3D USB_SPEED_LOW) {
-        usb_hub_port_set(port, PORT_STAT_LOW_SPEED);
-    } else {
-        usb_hub_port_clear(port, PORT_STAT_LOW_SPEED);
-    }
+    usb_hub_port_update(port);
     usb_wakeup(s->intr, 0);
 }
=20
@@ -287,12 +297,7 @@ static void usb_hub_handle_reset(USBDevice *dev)
         port->wPortStatus =3D 0;
         port->wPortChange =3D 0;
         usb_hub_port_set(port, PORT_STAT_POWER);
-        if (port->port.dev && port->port.dev->attached) {
-            usb_hub_port_set(port, PORT_STAT_CONNECTION);
-            if (port->port.dev->speed =3D=3D USB_SPEED_LOW) {
-                usb_hub_port_set(port, PORT_STAT_LOW_SPEED);
-            }
-        }
+        usb_hub_port_update(port);
     }
 }
=20
--=20
2.18.1


