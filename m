Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38971530568
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 21:17:08 +0200 (CEST)
Received: from localhost ([::1]:43996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsr4d-0000Uf-AZ
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 15:17:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqCP-0000bv-CK; Sun, 22 May 2022 14:21:05 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:48094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqCN-0003vK-RQ; Sun, 22 May 2022 14:21:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gDQMPCwoNsXTyxU/r6lvoHHKbKvPI1252JkwrN27jy4=; b=hYc0pNLKbXLqdGjeg6TCsAA9TO
 EnDj+V9xnOfPekAlAMMQZaMmv8oqI1VmZsuBBl+QCh4KFk9IpYOCHiZzXW8NyeUsHrfwV9wNhwW/Q
 y5gFRHqK/10aAhKTdLlzqq1i5zJ5qbis0928JWJ1x099PS9tI6+ybjPUs4ABJwzyTv+YS+n+gtNvt
 q/fbvAdGG88boi9//5DVgtj4RIxbscgiPuGcHbi1jWEUjHrEs6exOiBzTOZSk7wD4wAC7B/P2uylr
 7I3xk0h7yuPYF473DEvIVEyRefWymO/GEf5lIcRRsecAlAFVXvqh/ISbiV/QM+2HbKipH+hK00G1p
 Zgc8aABvH3MbE9IWyT+eFC3I4+eQETOZzXgmjY4vGEk405vGoLBDj0MDhywOvOCsRlLnDDAWfrdRp
 63tf31RHrnCP41xg/YSUh822yHk5TYslyqU5x0U4er9qckGHmV3b4p6cxX9u/siaPsAbP7vI8/LxN
 DecgP2egZdb3I4VqLMvyxD+cYBUjD0wTyBw7qupgY0odfkdq9Qf6vUZIUH1Cs96w6RBndLj2wnCJ2
 8jGoL5J3UnJtN14W70kGXpR9CEELJ1tLccuDWtUqiACqP0/ElHEKJQ+9EIK/bR0reDF8OCoHb+dUC
 GiEfZMfKqUnkoSjJze6eBHgID4GLCQqXri3onuEjU=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAr-0007pH-Ep; Sun, 22 May 2022 19:19:33 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:29 +0100
Message-Id: <20220522181836.864-44-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 43/50] lasips2: add base property
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

This is in preparation for handling vmstate_register() within the device.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/lasips2.c         | 17 ++++++++++++++++-
 include/hw/input/lasips2.h |  1 +
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index bd89c03996..a7c7192c07 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -251,6 +251,7 @@ LASIPS2State *lasips2_initfn(hwaddr base, qemu_irq irq)
     DeviceState *dev;
 
     dev = qdev_new(TYPE_LASIPS2);
+    qdev_prop_set_uint64(dev, "base", base);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     s = LASIPS2(dev);
 
@@ -282,11 +283,25 @@ static void lasips2_init(Object *obj)
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mouse.reg);
 }
 
+static Property lasips2_properties[] = {
+    DEFINE_PROP_UINT64("base", LASIPS2State, base, UINT64_MAX),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void lasips2_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, lasips2_properties);
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
+}
+
 static const TypeInfo lasips2_info = {
     .name          = TYPE_LASIPS2,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_init = lasips2_init,
-    .instance_size = sizeof(LASIPS2State)
+    .instance_size = sizeof(LASIPS2State),
+    .class_init    = lasips2_class_init
 };
 
 static void lasips2_register_types(void)
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index b9723073e1..7e4437b925 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -25,6 +25,7 @@ typedef struct LASIPS2Port {
 struct LASIPS2State {
     SysBusDevice parent_obj;
 
+    hwaddr base;
     LASIPS2Port kbd;
     LASIPS2Port mouse;
     qemu_irq irq;
-- 
2.20.1


