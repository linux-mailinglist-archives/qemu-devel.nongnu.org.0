Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E21532D584
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 08:30:54 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48020 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVs6w-0001So-3X
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 02:30:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41996)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hVs4m-0000aI-8R
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:28:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hVs4l-0004eD-51
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:28:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52058)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hVs4k-0004dY-Ck
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:28:38 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8CC66307E051;
	Wed, 29 May 2019 06:28:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-59.ams2.redhat.com
	[10.36.116.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C3FEB619BC;
	Wed, 29 May 2019 06:28:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 08B1C17446; Wed, 29 May 2019 08:28:33 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 29 May 2019 08:28:24 +0200
Message-Id: <20190529062832.26483-2-kraxel@redhat.com>
In-Reply-To: <20190529062832.26483-1-kraxel@redhat.com>
References: <20190529062832.26483-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Wed, 29 May 2019 06:28:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 1/9] usb: call reset handler before updating
 state
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

That way the device reset handler can see what
the before-reset state of the device is.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20190522094702.17619-2-kraxel@redhat.com
---
 hw/usb/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/core.c b/hw/usb/core.c
index 8fbd9c7d573b..3ab48a16074b 100644
--- a/hw/usb/core.c
+++ b/hw/usb/core.c
@@ -87,10 +87,10 @@ void usb_device_reset(USBDevice *dev)
     if (dev == NULL || !dev->attached) {
         return;
     }
+    usb_device_handle_reset(dev);
     dev->remote_wakeup = 0;
     dev->addr = 0;
     dev->state = USB_STATE_DEFAULT;
-    usb_device_handle_reset(dev);
 }
 
 void usb_wakeup(USBEndpoint *ep, unsigned int stream)
-- 
2.18.1


