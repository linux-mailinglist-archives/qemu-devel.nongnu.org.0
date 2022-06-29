Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A15D5560097
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 14:58:03 +0200 (CEST)
Received: from localhost ([::1]:56392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6XGc-0001oA-N2
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 08:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X07-0007ac-86; Wed, 29 Jun 2022 08:40:59 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X04-0004dQ-Nh; Wed, 29 Jun 2022 08:40:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dAIx0b4dvbGc+BzOGQjfkHdH1N0oRA7JiPFuOhbR47I=; b=JEUhv7F+py5N2CZWlFz0BlvySv
 baayFGW3j9OIm4TruFThBc0eIE84qqyj0S89JSDkuv0j9QnpY6YlHEJ1p9kxqSriGRZ8FwyQbd8zy
 VzNqAzWDbx1bIUBUJuMM0s/4lPyiJqIv1EhQMs60RMQ6ouaL7IuXYCNEEbYQKagBdjTtHDagq7kHr
 +JOmv/Kha6CVIZFptcRWGYUwjJosbl1VmdFqiM0VM9SLiyVqzIVrq6VTWH2a6DuvV+QKxdjkiC3Cp
 37FobzihFGg5A1H86y2Kl/37mBl5geq/U/hQDp/ffRAdfAGFmbaJ/SxgXDh+0X9jv8wQneFsvTpig
 tomaPaoauZdgLWs9WjxOhsHgTCcdNfm6RG4+V1jbBBDb3AgxyKkKN32PRWezdKa6Ep/fQoMUYxOBe
 NRtygNt3ubmZAVovxoJwPxnMSmFboj3xjNtzNpxNBnazOdjdLXEitXIDsFrrHdZiF8PplA8KajyH0
 gvHPYE1waDN2+FuJuZOZYQsRnoicXdnQFX0SHY6Q8OHghySGZT0aR1yo5Oaylcp22kNJ0ig4Wjg9b
 tlyJnFoc3LJfSd8Jq1dppIFbKnWoqQydMcq2fZh9fCNmAeqXmHVx7op2NDOBmYy7uzZl3xAAEpCtr
 PqAusyokSKOhFzf/EOLI9p9/TAlJ9/RJH3hm6jqw4=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wyo-0002tZ-1s; Wed, 29 Jun 2022 13:39:38 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:39:52 +0100
Message-Id: <20220629124026.1077021-7-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 06/40] pl050: move logic from pl050_realize() to pl050_init()
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


