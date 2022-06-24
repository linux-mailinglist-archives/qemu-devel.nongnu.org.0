Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CB2559B93
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 16:34:14 +0200 (CEST)
Received: from localhost ([::1]:57128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4kNx-0004OW-PH
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 10:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jbt-0004b6-Pc; Fri, 24 Jun 2022 09:44:36 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jbs-0005X5-7w; Fri, 24 Jun 2022 09:44:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aTe6B8EoIVLhFLb93AWNsfsTKMaSIKi3WCmBzmOY49A=; b=ct9GSwOXNWJ2POTb+WQgpeFlgE
 aeOQDCcNjoeZFgI0Xe8xt8DIlmHQ+6VTFaU77A7kEvg5pQzSpvva5DswwnsQPLKaPWfjFaSjklndB
 15kJBBKqVtWwBARYNB9TJeuxB/y+h90rZh10zrBTFtbrBXQwpDeDp+I1zpJHR19AadtyHlk/gwgwY
 gpTt80bKwLsqtpF8bbSNYr80U4X9OyVGhbj6rIebUuanoE6RB9vgbYHivXf4kRjyvMp5vpx88Sl+7
 1dq55oqg9TgKaoLrMqKNH0lNK6hV4AevEjn7InlYdeEQwD8zBRlWEwkUMgW29fRgHwomIOrZsGgJO
 FgoGtoZmlEYlS4qOVPQtm6F+n/9z2DvlrLY5UicZLr2UguT4F3cLv9/eWL6sHo3Li/XKy59RJe/Oo
 TLZMs1jHaxhkpCXza5TWYRZjswKkqm0qcRgZd4uHO9fYYBlpTQzvOk8f1bAFsbM1nTbFlAHj7fecx
 neYm0O65w2W3eh+Ei2TfPXg7gm5VkI9aIWeH/iexH79O3Uc6s4vvsIJnPlAEZOUWQtxyiMwUWiAfH
 TDH4hRAXKu53K5GfC8Y2PsD2iQp7hpOfP6qCenVYYLKH0wjY70+65NCp4N3fb9VPBFxc/M80fJCj5
 6S0/WN0tJSP2F/t+W5BBGY1O08GSsC+0a93B93u7I=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jaF-00037t-5y; Fri, 24 Jun 2022 14:42:54 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:41:01 +0100
Message-Id: <20220624134109.881989-47-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 46/54] lasips2: use sysbus IRQ for output IRQ
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

This enables the IRQ to be wired up using sysbus_connect_irq() in
lasips2_initfn().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/input/lasips2.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 49405191cb..bd72505411 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -247,16 +247,15 @@ static void lasips2_port_set_irq(void *opaque, int level)
 
 LASIPS2State *lasips2_initfn(hwaddr base, qemu_irq irq)
 {
-    LASIPS2State *s;
     DeviceState *dev;
 
     dev = qdev_new(TYPE_LASIPS2);
     qdev_prop_set_uint64(dev, "base", base);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    s = LASIPS2(dev);
 
-    s->irq = irq;
-    return s;
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, irq);
+
+    return LASIPS2(dev);
 }
 
 static void lasips2_realize(DeviceState *dev, Error **errp)
@@ -285,6 +284,8 @@ static void lasips2_init(Object *obj)
 
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->kbd.reg);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mouse.reg);
+
+    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
 }
 
 static Property lasips2_properties[] = {
-- 
2.30.2


