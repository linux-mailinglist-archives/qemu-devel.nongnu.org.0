Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9633C55B37E
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 20:26:42 +0200 (CEST)
Received: from localhost ([::1]:35444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5Wy1-0000dQ-LL
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 14:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WN1-0004Or-LW
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:48:27 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WMy-0000DQ-H4
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LeXiucJ8qhCBXXYLXa1/WdtxadtXPiU4qX02evmxMlw=; b=amK46NNNNlGdlyOUVZ78iTZ+/z
 LkNg9bZmMVIKNyNM0AxKraB0/gah2yIezot5cVGi+/dLTwNDsFJeXus+Op+adCXfpjsLE3fZq0LZs
 Evan0RyaGtkXrTnHksYrPgl4XbgUl1Qi0HZGxc8tsSOlPo19+jE+QFMTnz4pqeswH6CQ1Jc2ZUnMu
 UZYm2huMF2XUxZMah1hy1U0PxdA5T7x0lMpif15U72msPYSTa7gu0cRpb9xZQuW3RCRo55PeVVEXr
 8jRMPCI3pbGCk127ZAXLJ/OBI25Af0wMjYS/iXjmSfOCChzi0i6IsVAdbMCQD6x7+ru5Bskak+uWv
 3929jO5tuQrhBOZPaERC3CkUi/GgM6jyNNHnQ//CZ7EuYTauylp1JoBJe/FMgCSH+9D//QuZwGnMe
 cuOspfCVspDv4nzhE37/YY7sPWdCImyES6a+2j6QvtoNhlC+LN0H68Ugb8u6XvrdS5lRxc0DY0cdT
 8eSwNVpNz2i0B1jyWHG0HpgDQ8lfDMDsKROMpdKlC5nkyOiOEQgteaOsvSCEZwI6l5Kh8KZWJ9cBQ
 MSoLYmZD1vWlyOIY5ocbnrXztnRs80FBlUcXKHvpmLdeenrT8kxeDnxdcLFtkZdiN0KgimMueYSsw
 bgM5RJCRwsd6m9jeuXfC5HKZzx59JDO2O8k/2gatA=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WLe-0007KY-AA; Sun, 26 Jun 2022 18:47:02 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:45:17 +0100
Message-Id: <20220626174531.969187-42-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 41/55] lasips2: implement lasips2_init() function
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Move the initialisation of the keyboard and mouse memory regions to lasips2_init()
and expose them as SysBus memory regions.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220624134109.881989-42-mark.cave-ayland@ilande.co.uk>
---
 hw/input/lasips2.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 85da4081e3..8d3a2d88e8 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -265,20 +265,30 @@ LASIPS2State *lasips2_initfn(MemoryRegion *address_space,
     s->kbd.dev = ps2_kbd_init(lasips2_port_set_irq, &s->kbd);
     s->mouse.dev = ps2_mouse_init(lasips2_port_set_irq, &s->mouse);
 
-    memory_region_init_io(&s->kbd.reg, NULL, &lasips2_reg_ops, &s->kbd,
-                          "lasips2-kbd", 0x100);
     memory_region_add_subregion(address_space, base, &s->kbd.reg);
 
-    memory_region_init_io(&s->mouse.reg, NULL, &lasips2_reg_ops, &s->mouse,
-                          "lasips2-mouse", 0x100);
     memory_region_add_subregion(address_space, base + 0x100, &s->mouse.reg);
 
     return s;
 }
 
+static void lasips2_init(Object *obj)
+{
+    LASIPS2State *s = LASIPS2(obj);
+
+    memory_region_init_io(&s->kbd.reg, obj, &lasips2_reg_ops, &s->kbd,
+                          "lasips2-kbd", 0x100);
+    memory_region_init_io(&s->mouse.reg, obj, &lasips2_reg_ops, &s->mouse,
+                          "lasips2-mouse", 0x100);
+
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->kbd.reg);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mouse.reg);
+}
+
 static const TypeInfo lasips2_info = {
     .name          = TYPE_LASIPS2,
     .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_init = lasips2_init,
     .instance_size = sizeof(LASIPS2State)
 };
 
-- 
2.30.2


