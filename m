Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF6155B36F
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 20:16:40 +0200 (CEST)
Received: from localhost ([::1]:35412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5WoJ-0006Mh-Dz
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 14:16:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WNK-0004hf-BS
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:48:46 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WNI-0000GC-NZ
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:48:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=97CdfCmZa2Lr0PHkOmsEee/cAbPASY9ehGSw+JXywwo=; b=cDdu59czgbQK0fJSIYLopuM4ex
 KFFUoR6NTGtRgtsN7StaIB21X1+CzD+YS7xdtycl19/DlVJBQwzTDp7fdourtwINH2mV3kYMulG2R
 qWrCJuesl87CoyfwHja81DKmxSHwoli7QVuzdSMteLztqa/0lkkLpvzy5z4grKiFc9w556lV2dFC1
 6nKi1NGymj1Mh3RcrPO26QstxALq96x0sw1GHeNEdpcpLxDws5LM1vGTG4MScdVH835qIJZytWBPR
 EETHP1cOD7kueVggEj+Z0us5qlLIlv2JAt3+ihcXVfjW2qpY6p0Mv5DGBva4YcJKRUopGtvyeHotZ
 7kW5j0UcmCVXkEamxwYvLT9Ye28TD4PwlwDw/xAsxBSv+M8v5ZtU+FXQpbgavJ3Lpnw4bQfTnGJk2
 NR3PTBXcZFb7+O9phYC3BXIBJl1lA8I7EQTTb0duJV91r2mcVrx5BQgsh90Bi6C1mPMCQG6Y8lAtM
 aFjS6Qk+5q1tip9Xrxp8CwJIi5rlltzZR86bSzVsLLddxuiBG/ACGOSTmpHatV22VTFYnfqd+i0F9
 6jFh3vuTfI6KRPxRUDsYWrAWwvgHgImokgqSqDzldP1/1w0LewuxH9hkfzrRQB1/bW3s7MsRGQxmz
 P+ZxK1zCc8mGoj1lkqo/x/MigExiM5wFXrG/SGKX0=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WLu-0007KY-Qi; Sun, 26 Jun 2022 18:47:22 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:45:22 +0100
Message-Id: <20220626174531.969187-47-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 46/55] lasips2: use sysbus IRQ for output IRQ
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
Message-Id: <20220624134109.881989-47-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


