Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E21375728EC
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:01:46 +0200 (CEST)
Received: from localhost ([::1]:45244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBNwv-0004wE-UV
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNou-0008SY-R7; Tue, 12 Jul 2022 17:53:29 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNos-0007oa-Vf; Tue, 12 Jul 2022 17:53:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MkygjhFyY6EERcP/oDTHCTHmOjiJJbIR1TiysoqwM1M=; b=ptb7KGo9DBopYZZITj/vpgiRrb
 yZKMpcBepfeQVVuQzMOnMgZBJQZ4nt0kBt4NfJUZ2lxz5EBnVcIGB/yFJMIbNzNChWTGBX893a+l5
 7JKbUqj0R+sdDT345tr/+Fj+mePcbq5xvJHDwriINmjpSqSJ/wjaYfG5L0Ooei8x+7l+BEnb6F8C1
 ebprsMMv7Yp7qIxe6ElZgLX4yzJ/tw5DL+JBH7DAKkDfdjB7bGH0xEOint8dpmn4PT8/hSh7/phwc
 u8R8E0IYBWT9KSy8UPxtKAnbc6CrROtkiD3IeK6/j/gRNtAvjTBgEYxeO8kOm5JAk9WzrtSstJWUI
 2Hb+P1gpQguSCC+j0tuNQCAyeVHrkzVOw8yd8/dzXfsFGz6sfk6pqgHrCznOxm1zGmz19I4LQtwiD
 GYrJ6tfN2DtXX/VChmZ+QcM9O0vXfk4ci+FzKcbBGNei786W/M2iRmWdETco43oMXGvgafW4LV1vo
 NnciN0vZ/SFGxsWwr3vGhznOfdz+r/V2WNgzaaAbzKKm08UrAB5yliKMuZVgYuXry3IRxsNhB401x
 raXhxxfTMoOKecARLaFVYaFtj4jEL3b0dtsGag/S7W26VRYFg7GqunfZ9H0q9FlAy7A5w7hi4g9MY
 jhS3AdiIbio6rlhhzlsNv/ZcC7lh6Xm51i389zf+A=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNnU-000Bqt-8l; Tue, 12 Jul 2022 22:52:00 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:17 +0100
Message-Id: <20220712215251.7944-7-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 06/40] pl050: move logic from pl050_realize() to
 pl050_init()
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


