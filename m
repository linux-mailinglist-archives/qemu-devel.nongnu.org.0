Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A413E5789BC
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 20:45:39 +0200 (CEST)
Received: from localhost ([::1]:55658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDVkQ-0003eo-8H
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 14:45:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZW-000850-1M
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:34:22 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZU-0005YM-Dx
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:34:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TBnZrCE9IAzd2j8nmwx0gUDbeneVwSHVs65lfkHzNG8=; b=plh85NjWrg1DTW/BxpgaaxQWEb
 ToKVn21X58124kIJq1oH9CQTyLszlWUJ+m8LnaCXGU5MR3HEsM759qGR5TurJknfvT6lT9gi2g61F
 6aOBKoIsnI/jvCCpO+AfQog6khXlRQVKmejrolJfQGwBR5JWAML10Ayqgj8sTM27IxC8Snxnc3XI1
 216z+4HZ6wgfxgoleAX2HjYmrCc5JK4/fXrsUux3tEZCP7YxpCEk7fpaygd5n0WfAUiy858MCynSe
 +p79ozj28PhSt+EEpev4SmJysmX2H7i3xm2OvknKRucsXP4zIttNjbZg17ubKACWtODgRRGOz7miZ
 FBbe4X2Mg7BJsDAhqCRxIs0iqhTDc59XKe5sdzGmUllYvwstfAIzW1ptAK4/9jXpTZbWVsvwjeREy
 xM3xSwTGbqtjeUxcmYsla2KZymx5gH4OiWqUXgKsUmWkHSZkaS4IrMPKsA6I6WXYR/WwXTi0l6oFn
 adOFWf+yj98izVuMOORL9PMKDpgL890sNkfAs/LKYQNS/4LfzlxOGZGU9bF4XPgDb1QZZXD23UJKL
 Gu/ay98m6TulOTpnN3fjJXnlnu3SDjROV81g41WoI0wpgTZLYTd3ZCZs8HhUIvu7quAZo0/aueqrq
 f1Hrdnp/hG4mptKB7tBS9QeTwBX1bmoLBtuBWVM8M=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVY9-000B51-DX; Mon, 18 Jul 2022 19:33:01 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:33:06 +0100
Message-Id: <20220718183339.124253-8-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 07/40] pl050: introduce PL050DeviceClass for the PL050 device
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

This will soon be used to store the reference to the PL050 parent device
for PL050_KBD_DEVICE and PL050_MOUSE_DEVICE.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220712215251.7944-8-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/pl050.c         | 2 ++
 include/hw/input/pl050.h | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index e32d86005a..d7796b73a1 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -216,6 +216,8 @@ static const TypeInfo pl050_type_info = {
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_init = pl050_init,
     .instance_size = sizeof(PL050State),
+    .class_init    = pl050_class_init,
+    .class_size    = sizeof(PL050DeviceClass),
     .abstract      = true,
     .class_init    = pl050_class_init,
 };
diff --git a/include/hw/input/pl050.h b/include/hw/input/pl050.h
index bb0e87ff45..203f03a194 100644
--- a/include/hw/input/pl050.h
+++ b/include/hw/input/pl050.h
@@ -16,8 +16,14 @@
 #include "hw/input/ps2.h"
 #include "hw/irq.h"
 
+struct PL050DeviceClass {
+    SysBusDeviceClass parent_class;
+
+    DeviceRealize parent_realize;
+};
+
 #define TYPE_PL050 "pl050"
-OBJECT_DECLARE_SIMPLE_TYPE(PL050State, PL050)
+OBJECT_DECLARE_TYPE(PL050State, PL050DeviceClass, PL050)
 
 struct PL050State {
     SysBusDevice parent_obj;
-- 
2.30.2


