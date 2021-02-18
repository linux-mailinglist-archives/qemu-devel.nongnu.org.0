Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1853131E956
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 12:55:11 +0100 (CET)
Received: from localhost ([::1]:37814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lChtm-0000oW-3d
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 06:55:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lChqz-0007Kp-72
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 06:52:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lChqt-0004nK-EN
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 06:52:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613649129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ljs0jl2NWwnjIia2zMHwRqHl3PssesXBzlB04pg2NuQ=;
 b=OZ3WeD8mZWga7D73ztfaQf8F+BJ7gkTJ8V/K+R/SPR8DnzdpuPk+U4IWGzGjZnP6BQ6WxV
 VlMAXdflBcqo+/y/A5JQLomXSC3OTVN5NSsOjw4LPOnr0Pnzd5eXUxw6b+vyPW856D4eCo
 1+SnYyfLtrbZkHTxJk68Oyuuw3MR3aU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-mxWa1GZzPkWF1ZJRFstBqA-1; Thu, 18 Feb 2021 06:52:07 -0500
X-MC-Unique: mxWa1GZzPkWF1ZJRFstBqA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E3B618829DC;
 Thu, 18 Feb 2021 11:52:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 511A25C1C4;
 Thu, 18 Feb 2021 11:52:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B5B311800382; Thu, 18 Feb 2021 12:52:01 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] usb-host: use correct altsetting in usb_host_ep_update
Date: Thu, 18 Feb 2021 12:52:00 +0100
Message-Id: <20210218115201.2765071-2-kraxel@redhat.com>
In-Reply-To: <20210218115201.2765071-1-kraxel@redhat.com>
References: <20210218115201.2765071-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Nick Rosbrook <rosbrookn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nick Rosbrook <rosbrookn@gmail.com>

In order to keep track of the alternate setting that should be used for
a given interface, the USBDevice struct keeps an array of alternate
setting values, which is indexed by the interface number. In
usb_host_set_interface, when this array is updated, usb_host_ep_update
is called as a result. However, when usb_host_ep_update accesses the
active libusb_config_descriptor, it indexes udev->altsetting with the
loop variable, rather than the interface number.

With the simple trace backend enable, this behavior can be seen:

  [...]

  usb_xhci_xfer_start 0.440 pid=1215 xfer=0x5596a4b85930 slotid=0x1 epid=0x1 streamid=0x0
  usb_packet_state_change 1.703 pid=1215 bus=0x1 port=b'1' ep=0x0 p=0x5596a4b85938 o=b'undef' n=b'setup'
  usb_host_req_control 2.269 pid=1215 bus=0x1 addr=0x5 p=0x5596a4b85938 req=0x10b value=0x1 index=0xd
  usb_host_set_interface 0.449 pid=1215 bus=0x1 addr=0x5 interface=0xd alt=0x1
  usb_host_parse_config 2542.648 pid=1215 bus=0x1 addr=0x5 value=0x2 active=0x1
  usb_host_parse_interface 1.804 pid=1215 bus=0x1 addr=0x5 num=0xc alt=0x0 active=0x1
  usb_host_parse_endpoint 2.012 pid=1215 bus=0x1 addr=0x5 ep=0x2 dir=b'in' type=b'int' active=0x1
  usb_host_parse_interface 1.598 pid=1215 bus=0x1 addr=0x5 num=0xd alt=0x0 active=0x1
  usb_host_req_emulated 3.593 pid=1215 bus=0x1 addr=0x5 p=0x5596a4b85938 status=0x0
  usb_packet_state_change 2.550 pid=1215 bus=0x1 port=b'1' ep=0x0 p=0x5596a4b85938 o=b'setup' n=b'complete'
  usb_xhci_xfer_success 4.298 pid=1215 xfer=0x5596a4b85930 bytes=0x0

  [...]

In particular, it is seen that although usb_host_set_interface sets the
alternate setting of interface 0xd to 0x1, usb_host_ep_update uses 0x0
as the alternate setting due to using the incorrect index to
udev->altsetting.

Fix this problem by getting the interface number from the active
libusb_config_descriptor, and then using that as the index to
udev->altsetting.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
Message-Id: <20210201213021.500277-1-rosbrookn@ainfosec.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/host-libusb.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index 7dde3d12069e..354713a77dc9 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -836,7 +836,7 @@ static void usb_host_ep_update(USBHostDevice *s)
     struct libusb_ss_endpoint_companion_descriptor *endp_ss_comp;
 #endif
     uint8_t devep, type;
-    int pid, ep;
+    int pid, ep, alt;
     int rc, i, e;
 
     usb_ep_reset(udev);
@@ -848,8 +848,20 @@ static void usb_host_ep_update(USBHostDevice *s)
                                 conf->bConfigurationValue, true);
 
     for (i = 0; i < conf->bNumInterfaces; i++) {
-        assert(udev->altsetting[i] < conf->interface[i].num_altsetting);
-        intf = &conf->interface[i].altsetting[udev->altsetting[i]];
+        /*
+         * The udev->altsetting array indexes alternate settings
+         * by the interface number. Get the 0th alternate setting
+         * first so that we can grab the interface number, and
+         * then correct the alternate setting value if necessary.
+         */
+        intf = &conf->interface[i].altsetting[0];
+        alt = udev->altsetting[intf->bInterfaceNumber];
+
+        if (alt != 0) {
+            assert(alt < conf->interface[i].num_altsetting);
+            intf = &conf->interface[i].altsetting[alt];
+        }
+
         trace_usb_host_parse_interface(s->bus_num, s->addr,
                                        intf->bInterfaceNumber,
                                        intf->bAlternateSetting, true);
-- 
2.29.2


