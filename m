Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3781A2A642E
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 13:23:49 +0100 (CET)
Received: from localhost ([::1]:36362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaHpM-000063-9I
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 07:23:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kaHfW-0007es-HZ
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 07:13:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kaHfS-0007pg-Ei
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 07:13:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604492013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qEs2RXZrN1CnST8I+xCmdo3dwGb0aHMQN6lPH3PEaDQ=;
 b=YIigWXopGJF7y8RqnD3uIbatoAa9+UYv/9QCgzNA8ujA8eYqiZJVjHRoo6BbwpjG/ovzjZ
 GLTC35iVgHjD50iVwcYW6ICdDH/3ylrJvce5mJ5zfnf9/zat7mgtTsntojkfELS99qs6P6
 ljxeIlh+kF43ZIWadYk4eNOANu/y03c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-kQoT9Nk_Oc6uDhe3LyyBrg-1; Wed, 04 Nov 2020 07:13:31 -0500
X-MC-Unique: kQoT9Nk_Oc6uDhe3LyyBrg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7F3D64165;
 Wed,  4 Nov 2020 12:13:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28F58194B0;
 Wed,  4 Nov 2020 12:13:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 813D49C90; Wed,  4 Nov 2020 13:13:21 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/8] dev-serial: add always-plugged property to ensure USB
 device is always attached
Date: Wed,  4 Nov 2020 13:13:19 +0100
Message-Id: <20201104121321.7772-7-kraxel@redhat.com>
In-Reply-To: <20201104121321.7772-1-kraxel@redhat.com>
References: <20201104121321.7772-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Some operating systems will generate a new device ID when a USB device is unplugged
and then replugged into the USB. If this is done whilst switching between multiple
applications over a virtual serial port, the change of device ID requires going
back into the OS/application to locate the new device accordingly.

Add a new always-plugged property that if specified will ensure that the device
always remains attached to the USB regardless of the state of the backend
chardev.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Message-id: 20201027150456.24606-7-mark.cave-ayland@ilande.co.uk
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/dev-serial.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/usb/dev-serial.c b/hw/usb/dev-serial.c
index 92c35615eb13..b9e308dca198 100644
--- a/hw/usb/dev-serial.c
+++ b/hw/usb/dev-serial.c
@@ -97,6 +97,7 @@ struct USBSerialState {
     uint8_t event_chr;
     uint8_t error_chr;
     uint8_t event_trigger;
+    bool always_plugged;
     QEMUSerialSetParams params;
     int latency;        /* ms */
     CharBackend cs;
@@ -516,12 +517,12 @@ static void usb_serial_event(void *opaque, QEMUChrEvent event)
         s->event_trigger |= FTDI_BI;
         break;
     case CHR_EVENT_OPENED:
-        if (!s->dev.attached) {
+        if (!s->always_plugged && !s->dev.attached) {
             usb_device_attach(&s->dev, &error_abort);
         }
         break;
     case CHR_EVENT_CLOSED:
-        if (s->dev.attached) {
+        if (!s->always_plugged && s->dev.attached) {
             usb_device_detach(&s->dev);
         }
         break;
@@ -556,7 +557,8 @@ static void usb_serial_realize(USBDevice *dev, Error **errp)
                              usb_serial_event, NULL, s, NULL, true);
     usb_serial_handle_reset(dev);
 
-    if (qemu_chr_fe_backend_open(&s->cs) && !dev->attached) {
+    if ((s->always_plugged || qemu_chr_fe_backend_open(&s->cs)) &&
+        !dev->attached) {
         usb_device_attach(dev, &error_abort);
     }
     s->intr = usb_ep_get(dev, USB_TOKEN_IN, 1);
@@ -584,6 +586,7 @@ static const VMStateDescription vmstate_usb_serial = {
 
 static Property serial_properties[] = {
     DEFINE_PROP_CHR("chardev", USBSerialState, cs),
+    DEFINE_PROP_BOOL("always-plugged", USBSerialState, always_plugged, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.27.0


