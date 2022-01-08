Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2AE48848F
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 17:44:05 +0100 (CET)
Received: from localhost ([::1]:44196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6Ep2-0000bA-Gq
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 11:44:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n6EnM-0007TP-1k
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 11:42:20 -0500
Received: from [2001:41c9:1:41f::167] (port=40302
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n6EnK-0007Km-Hw
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 11:42:19 -0500
Received: from [2a00:23c4:8ba0:4900:614:7796:ec2b:4f88] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n6Emu-0009j2-U6; Sat, 08 Jan 2022 16:41:54 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Sat,  8 Jan 2022 16:41:47 +0000
Message-Id: <20220108164147.30813-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:4900:614:7796:ec2b:4f88
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH] macfb: fix VRAM dirty memory region logging
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The macfb VRAM memory region was configured with coalescing rather than dirty
memory logging enabled, causing some areas of the screen not to redraw after
a full screen update.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Fixes: 8ac919a065 ("hw/m68k: add Nubus macfb video card")
---
 hw/display/macfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index 277d3e6633..4bd7c3ad6a 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -661,9 +661,9 @@ static bool macfb_common_realize(DeviceState *dev, MacfbState *s, Error **errp)
 
     memory_region_init_ram(&s->mem_vram, OBJECT(dev), "macfb-vram",
                            MACFB_VRAM_SIZE, &error_abort);
+    memory_region_set_log(&s->mem_vram, true, DIRTY_MEMORY_VGA);
     s->vram = memory_region_get_ram_ptr(&s->mem_vram);
     s->vram_bit_mask = MACFB_VRAM_SIZE - 1;
-    memory_region_set_coalescing(&s->mem_vram);
 
     s->vbl_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, macfb_vbl_timer, s);
     macfb_update_mode(s);
-- 
2.20.1


