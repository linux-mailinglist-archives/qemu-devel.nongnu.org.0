Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C16B35789BD
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 20:46:19 +0200 (CEST)
Received: from localhost ([::1]:57312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDVl3-0004qb-TA
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 14:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZS-000801-Ck
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:34:21 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZQ-0005Xq-TO
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:34:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/+vzape9gqxwBCbgfkvh0euzQ7m+8MBhxRIU/PDlQRg=; b=WnDSASeZTKRDqPsGlZ92f0Q8n9
 vll9JO0CPpkBppxFEa09Np5Ck1N4S0BrYivgL/zyJbN7qevwXhzcxGpyFssIx4T8W8Z+as5523jcq
 +qtUOJvSTU1NYTKz6d8+NvibgR9BflvjBNUModmzruy4qgNmBv1cWkz1YQY9Str/UkUcnl2rcCb7Z
 pdXsqkKUmhnQNnQS9RIT9F70unMwRSmTW2BPssOqgfExF5+JkU00e1gJ4CDJQnbJi81l2rJrviuQJ
 y0cm1V1vexve5iVWjMGfrJG2Npnw707oCCP1AXAXKCenFEqRyrIeySDvYyOIaCYUGvqYmw4yIvuAj
 agHkQlcUIgTpNyERz1WDEzLcCGgRfZRDMgWh/04WAOGHr9UGTyJ4TRu8uOAygRsVHR8lzfGSoNVvY
 At2gbUl75TFXGz7em/K+avuwXyqqZAGy8/5lwcriCOhNQAvIp7qGEcyND0BW7M9N3oEjk//Vg6jqH
 iTt0+VnWrw8po4p9obUNYYOaaBj+Sjhy7W3TRbNv4lJlHKRVh28OVho4Dv9x+l4aUWm/CIE5Fprow
 jB1h4EbA5C5UGMd9dJuCxaJLvovpcrWBNHQ74oOn/LJY+022cCBlX8pb+ZvU9PnLrP8cYeOEIbFBa
 vvzPkOaivVDu00+FLI6yMzxd2M1ol657WCkX1mh+M=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVY5-000B51-6t; Mon, 18 Jul 2022 19:32:57 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:33:05 +0100
Message-Id: <20220718183339.124253-7-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 06/40] pl050: move logic from pl050_realize() to pl050_init()
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

The logic for initialising the register memory region and the sysbus output IRQ
does not depend upon any device properties and so can be moved from
pl050_realize() to pl050_init().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220712215251.7944-7-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/pl050.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index 88459997e0..e32d86005a 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -152,11 +152,7 @@ static const MemoryRegionOps pl050_ops = {
 static void pl050_realize(DeviceState *dev, Error **errp)
 {
     PL050State *s = PL050(dev);
-    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &pl050_ops, s, "pl050", 0x1000);
-    sysbus_init_mmio(sbd, &s->iomem);
-    sysbus_init_irq(sbd, &s->irq);
     if (s->is_mouse) {
         s->ps2dev = ps2_mouse_init();
     } else {
@@ -197,6 +193,13 @@ static const TypeInfo pl050_mouse_info = {
 
 static void pl050_init(Object *obj)
 {
+    PL050State *s = PL050(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+
+    memory_region_init_io(&s->iomem, obj, &pl050_ops, s, "pl050", 0x1000);
+    sysbus_init_mmio(sbd, &s->iomem);
+    sysbus_init_irq(sbd, &s->irq);
+
     qdev_init_gpio_in_named(DEVICE(obj), pl050_set_irq, "ps2-input-irq", 1);
 }
 
-- 
2.30.2


