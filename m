Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFB9559AE1
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 16:05:57 +0200 (CEST)
Received: from localhost ([::1]:39422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4jwa-00034n-PX
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 10:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jaj-0001rY-Rk; Fri, 24 Jun 2022 09:43:21 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jag-0005GX-Di; Fri, 24 Jun 2022 09:43:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TJVbzcOHsgxqs5i7fi+Gogmj4a0olFvR0c/lHpv3bf0=; b=c1XlIyhvf2ZJY7vlq7In2veUX5
 lvUJOG8AkBXI3tP3WZ5wMCoFui6fT5q1137XqUkXjqSh1BaLVblnkAFyJkq38rSRatwG/mzdl5i+c
 fbttMO2q19H8IR2nxHShQ3kw0kPeSMzVxsRSOX7DkNQyD/qaRXtwLrBnKXQgvL5tZT0s8wHvbrZ5D
 ZwzCONK9Tk5yGn65UPVqOL+57t8R88VR8SOEQPxtJx/p8wjhUfcYCDYrFX29tHCQmxWJS3tDb74nb
 hpcKyFfHCdPMoXBaXzCGRi9KBWTyD2kMADU/LtgMfKHWZgsnAsrqBSv1jWL5n2vywtROwnkrRiLZ1
 0yvRet+wXruLG62CRWKAgTfEVyKY7bbZ8H230SF01i3D9kOize2bHY3mW5UzvxHXuTDFrX58KyK4q
 asjkLGIZCaOKJdA2baMaqJGQ27JZFEZW2YAFJGr3l/oxYQL2622jkmvFzv91nNuZknwOqInliiW6i
 gOKib2VV1eDHrplwEj7710Y16Y3WT9bCGR3MlzogvERkWYhImkVwWB8t9QKjrPoAPwWtM6C3R0YS2
 JDAZ3+sevMwgF+bwiT1Dpxv90mQl54gK2F/lxpvKCjNRd097sM2H4cjFSLTdVDHfq576J9ZeVM7zd
 kYa5moH9QNZjqey3E77a8faixWQVmzrS6ZTUjwLv0=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZ3-00037t-KD; Fri, 24 Jun 2022 14:41:41 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:41 +0100
Message-Id: <20220624134109.881989-27-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 26/54] pckbd: implement i8042_mmio_init() function
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

This enables use to set the required value of extended_state directly during
device init rather than in i8042_mm_init().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/input/pckbd.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index bc51f7eedd..b8623d2f9a 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -684,6 +684,14 @@ static void i8042_mmio_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->region);
 }
 
+static void i8042_mmio_init(Object *obj)
+{
+    MMIOKBDState *s = I8042_MMIO(obj);
+    KBDState *ks = &s->kbd;
+
+    ks->extended_state = true;
+}
+
 static Property i8042_mmio_properties[] = {
     DEFINE_PROP_UINT64("mask", MMIOKBDState, kbd.mask, UINT64_MAX),
     DEFINE_PROP_UINT32("size", MMIOKBDState, size, -1),
@@ -716,8 +724,6 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
     s->irq_kbd = kbd_irq;
     s->irq_mouse = mouse_irq;
 
-    s->extended_state = true;
-
     vmstate_register(NULL, 0, &vmstate_kbd, s);
 
     region = &I8042_MMIO(dev)->region;
@@ -729,6 +735,7 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
 static const TypeInfo i8042_mmio_info = {
     .name          = TYPE_I8042_MMIO,
     .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_init = i8042_mmio_init,
     .instance_size = sizeof(MMIOKBDState),
     .class_init    = i8042_mmio_class_init
 };
-- 
2.30.2


