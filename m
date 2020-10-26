Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA5F29885B
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 09:36:57 +0100 (CET)
Received: from localhost ([::1]:34318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kWxzs-00051F-Kp
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 04:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kWxxZ-0003El-V8
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 04:34:33 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:46950
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kWxxY-0005xn-9j
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 04:34:33 -0400
Received: from host86-148-103-79.range86-148.btcentralplus.com
 ([86.148.103.79] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kWxxc-00082O-WA; Mon, 26 Oct 2020 08:34:40 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	kraxel@redhat.com,
	samuel.thibault@ens-lyon.org
Date: Mon, 26 Oct 2020 08:33:54 +0000
Message-Id: <20201026083401.13231-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201026083401.13231-1-mark.cave-ayland@ilande.co.uk>
References: <20201026083401.13231-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.103.79
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 2/9] dev-serial: use USB_SERIAL QOM macro for USBSerialState
 assignments
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/usb/dev-serial.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/usb/dev-serial.c b/hw/usb/dev-serial.c
index 7a5fa3770e..77ce89d38b 100644
--- a/hw/usb/dev-serial.c
+++ b/hw/usb/dev-serial.c
@@ -204,7 +204,7 @@ static void usb_serial_reset(USBSerialState *s)
 
 static void usb_serial_handle_reset(USBDevice *dev)
 {
-    USBSerialState *s = (USBSerialState *)dev;
+    USBSerialState *s = USB_SERIAL(dev);
 
     DPRINTF("Reset\n");
 
@@ -243,7 +243,7 @@ static void usb_serial_handle_control(USBDevice *dev, USBPacket *p,
                                       int request, int value, int index,
                                       int length, uint8_t *data)
 {
-    USBSerialState *s = (USBSerialState *)dev;
+    USBSerialState *s = USB_SERIAL(dev);
     int ret;
 
     DPRINTF("got control %x, value %x\n", request, value);
@@ -430,7 +430,7 @@ static void usb_serial_token_in(USBSerialState *s, USBPacket *p)
 
 static void usb_serial_handle_data(USBDevice *dev, USBPacket *p)
 {
-    USBSerialState *s = (USBSerialState *)dev;
+    USBSerialState *s = USB_SERIAL(dev);
     uint8_t devep = p->ep->nr;
     struct iovec *iov;
     int i;
-- 
2.20.1


