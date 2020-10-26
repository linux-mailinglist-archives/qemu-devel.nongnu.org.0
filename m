Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3154629885C
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 09:37:07 +0100 (CET)
Received: from localhost ([::1]:34570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kWy02-00057K-1g
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 04:37:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kWxxh-0003IJ-3q
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 04:34:41 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:46964
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kWxxb-0005ys-PC
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 04:34:39 -0400
Received: from host86-148-103-79.range86-148.btcentralplus.com
 ([86.148.103.79] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kWxxi-00082O-57; Mon, 26 Oct 2020 08:34:43 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	kraxel@redhat.com,
	samuel.thibault@ens-lyon.org
Date: Mon, 26 Oct 2020 08:33:56 +0000
Message-Id: <20201026083401.13231-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201026083401.13231-1-mark.cave-ayland@ilande.co.uk>
References: <20201026083401.13231-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.103.79
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 4/9] dev-serial: add trace-events for baud rate and data
 parameters
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
 hw/usb/dev-serial.c | 3 +++
 hw/usb/trace-events | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/hw/usb/dev-serial.c b/hw/usb/dev-serial.c
index abc316c7bf..badf8785db 100644
--- a/hw/usb/dev-serial.c
+++ b/hw/usb/dev-serial.c
@@ -307,6 +307,7 @@ static void usb_serial_handle_control(USBDevice *dev, USBPacket *p,
         }
 
         s->params.speed = (48000000 / 2) / (8 * divisor + subdivisor8);
+        trace_usb_serial_set_baud(bus->busnr, dev->addr, s->params.speed);
         qemu_chr_fe_ioctl(&s->cs, CHR_IOCTL_SERIAL_SET_PARAMS, &s->params);
         break;
     }
@@ -340,6 +341,8 @@ static void usb_serial_handle_control(USBDevice *dev, USBPacket *p,
             goto fail;
         }
 
+        trace_usb_serial_set_data(bus->busnr, dev->addr, s->params.parity,
+                                  s->params.data_bits, s->params.stop_bits);
         qemu_chr_fe_ioctl(&s->cs, CHR_IOCTL_SERIAL_SET_PARAMS, &s->params);
         /* TODO: TX ON/OFF */
         break;
diff --git a/hw/usb/trace-events b/hw/usb/trace-events
index e5871cbbbc..9e984b2e0c 100644
--- a/hw/usb/trace-events
+++ b/hw/usb/trace-events
@@ -328,3 +328,5 @@ usb_serial_unsupported_parity(int bus, int addr, int value) "dev %d:%d unsupport
 usb_serial_unsupported_stopbits(int bus, int addr, int value) "dev %d:%d unsupported stop bits %d"
 usb_serial_unsupported_control(int bus, int addr, int request, int value) "dev %d:%d got unsupported/bogus control 0x%x, value 0x%x"
 usb_serial_bad_token(int bus, int addr) "dev %d:%d bad token"
+usb_serial_set_baud(int bus, int addr, int baud) "dev %d:%d baud rate %d"
+usb_serial_set_data(int bus, int addr, int parity, int data, int stop) "dev %d:%d parity %c, data bits %d, stop bits %d"
-- 
2.20.1


