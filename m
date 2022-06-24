Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C352F559B4D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 16:17:57 +0200 (CEST)
Received: from localhost ([::1]:45588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4k8C-0001Z3-S8
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 10:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jbq-0004Rr-RN; Fri, 24 Jun 2022 09:44:30 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jbo-0005Ve-9G; Fri, 24 Jun 2022 09:44:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HBCOYvabOINYa5baTi0qYlEdjWm3DadgDrJ7OM7KRGU=; b=sfGfjHKoIxavpe/145iOVhS6Tl
 e0GjCVPzrKwQzi0fP9dhzBpOrbemfSdSYyb2vBs6jQ3alPl3uNZv3W9U2C53HXZI6R5FEt5grl1Gw
 vEKIZXyfwWYGhUAdBAfoqJVZQfpsrpdTujajmQ8CiPxjlZVeZ+zkbz3UkFr0xLQZb0kcHYPirjQoz
 Hmx5jCAA85OfuWnWO0mUrhSOi90PDG063EDMhL5SpKMDIZWbOrCfmFLzJRIRFVRrBVHM1SGd37/Yy
 lxlQtzq6Yh1xA7Goy3wL1STmMkBzP47ocf347Pxs6m7VKzwaum4RF0pcjNTtbcbAqJCBExqu1+chX
 t1UWAHN1PSJTw4R9k+exICgiePFu7u4KyVShVmlFbc3o/hnn+7sbM5IU66iFgzYfyFvz/DzkkG3vi
 8Vj1Z2yRBvpovV8qCjyFp5njlz9Efa2THRL5uCe4c7l08pFl7h9RPnS+JWziMX9JwSngDlNOrl3q2
 6eqkGBheZPBex14bsGhHyfk7PHCYOxBm9JLHn11Kfs+s9c9j2mSETdVXBp9Lj1th8IwL1xS/PMjxY
 P0BFGkPV1gIYbQVDoEnMlKCFacVFNosb2swOMwVdav1G5zBtwKuBjRFauGhuVyi2sU4eMSwtxxoac
 62ipfNwbWHhev7Wsk7ugihxn9f5CSmgn6qCVvsp9I=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jaA-00037t-Rg; Fri, 24 Jun 2022 14:42:50 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:41:00 +0100
Message-Id: <20220624134109.881989-46-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 45/54] lasips2: implement lasips2_realize()
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

Move ps2_kbd_init() and ps2_mouse_init() from lasips2_initfn() to lasips2_realize.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/lasips2.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 81beb5b614..49405191cb 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -256,13 +256,17 @@ LASIPS2State *lasips2_initfn(hwaddr base, qemu_irq irq)
     s = LASIPS2(dev);
 
     s->irq = irq;
+    return s;
+}
+
+static void lasips2_realize(DeviceState *dev, Error **errp)
+{
+    LASIPS2State *s = LASIPS2(dev);
 
-    vmstate_register(NULL, base, &vmstate_lasips2, s);
+    vmstate_register(NULL, s->base, &vmstate_lasips2, s);
 
     s->kbd.dev = ps2_kbd_init(lasips2_port_set_irq, &s->kbd);
     s->mouse.dev = ps2_mouse_init(lasips2_port_set_irq, &s->mouse);
-
-    return s;
 }
 
 static void lasips2_init(Object *obj)
@@ -292,6 +296,7 @@ static void lasips2_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->realize = lasips2_realize;
     device_class_set_props(dc, lasips2_properties);
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
-- 
2.30.2


