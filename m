Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 340BE425034
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 11:37:19 +0200 (CEST)
Received: from localhost ([::1]:50616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYPq2-0003Od-6x
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 05:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mYPnp-0000Z9-12
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 05:35:01 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40718
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mYPnm-0001Rw-DK
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 05:35:00 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mYPnX-0000tc-41; Thu, 07 Oct 2021 10:34:47 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Thu,  7 Oct 2021 10:34:05 +0100
Message-Id: <20211007093407.3329-12-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211007093407.3329-1-mark.cave-ayland@ilande.co.uk>
References: <20211007093407.3329-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 11/13] macfb: fix 24-bit RGB pixel encoding
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) SPF_HELO_NONE=0.001,
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

According to Apple Technical Note HW26: "Macintosh Quadra Built-In Video" the
in-built framebuffer encodes each 24-bit pixel into 4 bytes. Adjust the 24-bit
RGB pixel encoding accordingly which agrees with the encoding expected by MacOS
when changing into 24-bit colour mode.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/display/macfb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index e49c8b6f4b..3288a71b89 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -224,10 +224,10 @@ static void macfb_draw_line24(MacfbState *s, uint8_t *d, uint32_t addr,
     int x;
 
     for (x = 0; x < width; x++) {
-        r = macfb_read_byte(s, addr);
-        g = macfb_read_byte(s, addr + 1);
-        b = macfb_read_byte(s, addr + 2);
-        addr += 3;
+        r = macfb_read_byte(s, addr + 1);
+        g = macfb_read_byte(s, addr + 2);
+        b = macfb_read_byte(s, addr + 3);
+        addr += 4;
 
         *(uint32_t *)d = rgb_to_pixel32(r, g, b);
         d += 4;
-- 
2.20.1


