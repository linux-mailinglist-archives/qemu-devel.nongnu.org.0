Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D4D4CD6F0
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:58:38 +0100 (CET)
Received: from localhost ([::1]:52168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9O9-0001xg-3e
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:58:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8ou-0000Hq-VB
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:22:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8ot-0000Ev-Df
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:22:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646403730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PzMFBP0l+WrNxBuICGRpdfAruoi2OmgMa+g4nr7G2dk=;
 b=d2eBUuzsj64ExT1WQUFiFLfA3LJMY9jsJi6sZ3Vy9ytC22hxGpa26vcevMDfhJVT9Q2Afo
 5Nh4WmRKhYBxoP5W5TNkuMirEV3ObVmMVZa6ZgLivMiufT2kKCfeV9reXO6+AXwHgORTPo
 gApKoZxS9xdKNNvP/bPeH2J1WjHfwMw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-alYB5lpFPWyl_E1tAJ9ndg-1; Fri, 04 Mar 2022 09:22:07 -0500
X-MC-Unique: alYB5lpFPWyl_E1tAJ9ndg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCAA8FC81;
 Fri,  4 Mar 2022 14:22:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DDE891057059;
 Fri,  4 Mar 2022 14:21:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0806C18003A7; Fri,  4 Mar 2022 15:21:24 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/35] usb/ohci: Move cancelling async packet to
 ohci_stop_endpoints()
Date: Fri,  4 Mar 2022 15:20:52 +0100
Message-Id: <20220304142123.956171-5-kraxel@redhat.com>
In-Reply-To: <20220304142123.956171-1-kraxel@redhat.com>
References: <20220304142123.956171-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

This is always done before calling this function so remove duplicated
code and do it within the function at one place.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <ce766722506bfd7145cccbec750692ff57072280.1643117600.git.balaton@eik.bme.hu>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-ohci.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index f915cc547351..6d762973ebd2 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -369,6 +369,10 @@ void ohci_stop_endpoints(OHCIState *ohci)
     USBDevice *dev;
     int i, j;
 
+    if (ohci->async_td) {
+        usb_cancel_packet(&ohci->usb_packet);
+        ohci->async_td = 0;
+    }
     for (i = 0; i < ohci->num_ports; i++) {
         dev = ohci->rhport[i].port.dev;
         if (dev && dev->attached) {
@@ -398,10 +402,6 @@ static void ohci_roothub_reset(OHCIState *ohci)
             usb_port_reset(&port->port);
         }
     }
-    if (ohci->async_td) {
-        usb_cancel_packet(&ohci->usb_packet);
-        ohci->async_td = 0;
-    }
     ohci_stop_endpoints(ohci);
 }
 
@@ -1277,10 +1277,6 @@ static void ohci_frame_boundary(void *opaque)
 
     /* Cancel all pending packets if either of the lists has been disabled.  */
     if (ohci->old_ctl & (~ohci->ctl) & (OHCI_CTL_BLE | OHCI_CTL_CLE)) {
-        if (ohci->async_td) {
-            usb_cancel_packet(&ohci->usb_packet);
-            ohci->async_td = 0;
-        }
         ohci_stop_endpoints(ohci);
     }
     ohci->old_ctl = ohci->ctl;
-- 
2.35.1


