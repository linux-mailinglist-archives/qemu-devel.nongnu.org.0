Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B88426A4D
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 13:56:06 +0200 (CEST)
Received: from localhost ([::1]:40006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYoTt-0003uQ-2B
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 07:56:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYoJg-0006IR-Lz
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 07:45:35 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:33505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYoJc-0006zT-0B
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 07:45:31 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MeCYx-1nA40Y16EJ-00bHkb; Fri, 08
 Oct 2021 13:45:25 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 11/13] macfb: fix 24-bit RGB pixel encoding
Date: Fri,  8 Oct 2021 13:45:16 +0200
Message-Id: <20211008114518.757615-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211008114518.757615-1-laurent@vivier.eu>
References: <20211008114518.757615-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MbQ0v3HaxcJH9NXMsMupu9zhnM1IvxDigB3NKdl2QbD8s+3DPST
 LALtVgCN94tNKHg7QbJJBl2RpWXJMcQ5LTcnRgyJAlIslxia2r4XL+2tx3IuPchRSQ21U8r
 2u/Gp6eIo+M5S2KXYCADgB4Y45lgMViFECsAVSnfUQkq2quLdKU1lpiRlBltTLkp1j5jxcM
 YSUR31ESvfX0Ig6HPkkfg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Jvgti8FG1jo=:tfOG9LR2suayo8do9jKzvl
 qn64q3bQdfayBlWeFhPYDvsgrPdKSrLeO1JaoJLIO2o82THr7GiXKe5hHpd2xlFTVpgCBKvQh
 MISN5PLVJeGFoPmYPLk85q+qIBov7u8DmEBarTxBrKkXmHp73GWiYal64RvDd9/uoYw7z4PDw
 +XTJEgP5lRXXQ39je6FperS3WivviX1vwDKSCUU+avVjhp9GMooBdHzC60aOu+3SdtW9cyn13
 fqamzccjEdFW/kXAJe45QsvHcaIMThMDL68NUHLhzHrC+qKXBaLiI+6AXl+wC92dA8IPWlP9i
 QW510uFYICcYVOMccfthbmc6h8wmdkfvoOSkejotjx1cVyvyB1qnQbP4joo3s4iNwiLoa6Vzp
 tkAob1iL8KZcupXCzOTDBRaqojaGeRbN+K0qclhU/y043U6C0yTwlrFNxeD6O1kPBHaXu2BfW
 ZJxjOlq97FxiSIypWa+gkDFEQvEOLvDV4F3W8nWCDx9WV+79IS/oexCo86YT05zRgEdk9fX29
 fUNNS+xA95Msg3TUdU/GKc6ue64oRMbnrarFIc43nNKDZjAyiId2PLOKeCYjKsENi+CNtcgJt
 ky1fDkLHotpypAWVXTFMVdIRdlAQyvu0fm7bZND1tym1msaEvyaImRJUMsYRASxxdYvaEz5aq
 XrRQWBG0xOtmU7AhxKWdDxc3iQLf4CMUzglir/rMPD2DwSWAoXb4ODEhn/RmcPuWMbaefGe67
 mzO/fUxLytHIGlciXyUxTwxHdDnws2wyvv2aFw==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

According to Apple Technical Note HW26: "Macintosh Quadra Built-In Video" the
in-built framebuffer encodes each 24-bit pixel into 4 bytes. Adjust the 24-bit
RGB pixel encoding accordingly which agrees with the encoding expected by MacOS
when changing into 24-bit colour mode.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211007221253.29024-12-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/display/macfb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index e49c8b6f4b52..3288a71b89a6 100644
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
2.31.1


