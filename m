Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC9741FB09
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 13:08:54 +0200 (CEST)
Received: from localhost ([::1]:46924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWcsu-0005dd-O4
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 07:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mWckp-0004lj-AI
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 07:00:31 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33168
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mWckm-0004nk-FC
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 07:00:31 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mWckc-00020j-NC; Sat, 02 Oct 2021 12:00:19 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Sat,  2 Oct 2021 11:59:59 +0100
Message-Id: <20211002110007.30825-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
References: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 04/12] macfb: use memory_region_init_ram() in
 macfb_common_realize() for the framebuffer
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

Currently macfb_common_realize() defines the framebuffer RAM memory region as
being non-migrateable but then immediately registers it for migration. Replace
memory_region_init_ram_nomigrate() with memory_region_init_ram() which is clearer
and does exactly the same thing.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/display/macfb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index f4e789d0d7..e86fbbbb64 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -368,11 +368,10 @@ static void macfb_common_realize(DeviceState *dev, MacfbState *s, Error **errp)
     memory_region_init_io(&s->mem_ctrl, OBJECT(dev), &macfb_ctrl_ops, s,
                           "macfb-ctrl", 0x1000);
 
-    memory_region_init_ram_nomigrate(&s->mem_vram, OBJECT(dev), "macfb-vram",
-                                     MACFB_VRAM_SIZE, errp);
+    memory_region_init_ram(&s->mem_vram, OBJECT(dev), "macfb-vram",
+                           MACFB_VRAM_SIZE, errp);
     s->vram = memory_region_get_ram_ptr(&s->mem_vram);
     s->vram_bit_mask = MACFB_VRAM_SIZE - 1;
-    vmstate_register_ram(&s->mem_vram, dev);
     memory_region_set_coalescing(&s->mem_vram);
 }
 
-- 
2.20.1


