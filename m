Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BCF55B38A
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 20:36:32 +0200 (CEST)
Received: from localhost ([::1]:58056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5X7X-0008TM-Pb
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 14:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WSB-0005Zc-AE
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:53:47 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WS4-0000xD-HY
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:53:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UrTrhI4ZHDBVA3zY3jrVw/QjkSmppvXZMjErcrPy788=; b=Ni3kDYj/vKAs7g+7wkkcIQ6RDJ
 RqKQVB16ek3rnaKa+pz/J4M7W3e75tkFpesgABK83tjuHLoMrl5drZiiS9G4d5kHqZogP/tTxSmtG
 m6XnjC87yLo9EJJrhB18gbXpdhHCHj2zZkIcThL5sgxwxpECb8/LQ2pwvt/lxBJ+hZGJKRc+n/8L3
 kGZjGbDsfLpyNXAHRIPUOyFVrShxgU2pE6xZk63ywH09dh8X1vRDh6QGX2aRORCHh9z/QwpiPi60w
 AQ9/8DMgKoaSy8MLOKlJEq+Rc+jimDXnMMqwu6AI2toZ51wUug8QsepIkTNMjzPt7h3KoFx7Wc7n8
 51Oq6a2rIdqW5gW1n9SE7sPd7agm0Q5fwxzL8V29lrPYzUgYqr7UCmr50Nfp5avrzhz7EXBRPm4Hr
 4B7iyM1DxS7nxhkqQVlAClOrYVwkgxHSDL5ipRI+SJgMx9ebZ4OEd4HXPT2F4y/wbdu4y6zpWC8cL
 SVlO2n+GegUXEcqsVUd4zc1kn2wPR49QXIyzDK3tYqwXq/lwdrgLdbUKv8Q+Kom61WLoujMpVWwV4
 VvfTMLjDdAsuwbVZRiE4fxjwIyqRvIGlUFqu6BHll9YUfBjXBmLEA5uMhdOamI8z4NaU4iUC2lyyo
 RXqoI5QrDo7GprqwQ4lZucpxWVOvq7OSaSLXZQDB4=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WMD-0007KY-Tc; Sun, 26 Jun 2022 18:47:41 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:45:27 +0100
Message-Id: <20220626174531.969187-52-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 51/55] pckbd: add i8042_reset() function to I8042 device
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

This means that it is no longer necessary to call qemu_register_reset() manually
within i8042_realizefn().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220624134109.881989-52-mark.cave-ayland@ilande.co.uk>
---
 hw/input/pckbd.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index ee306428a3..ff76c0636d 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -808,6 +808,14 @@ static const MemoryRegionOps i8042_cmd_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
+static void i8042_reset(DeviceState *dev)
+{
+    ISAKBDState *s = I8042(dev);
+    KBDState *ks = &s->kbd;
+
+    kbd_reset(ks);
+}
+
 static void i8042_initfn(Object *obj)
 {
     ISAKBDState *isa_s = I8042(obj);
@@ -854,7 +862,6 @@ static void i8042_realizefn(DeviceState *dev, Error **errp)
         s->throttle_timer = timer_new_us(QEMU_CLOCK_VIRTUAL,
                                          kbd_throttle_timeout, s);
     }
-    qemu_register_reset(kbd_reset, s);
 }
 
 static void i8042_build_aml(AcpiDevAmlIf *adev, Aml *scope)
@@ -900,6 +907,7 @@ static void i8042_class_initfn(ObjectClass *klass, void *data)
     AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
     device_class_set_props(dc, i8042_properties);
+    dc->reset = i8042_reset;
     dc->realize = i8042_realizefn;
     dc->vmsd = &vmstate_kbd_isa;
     adevc->build_dev_aml = i8042_build_aml;
-- 
2.30.2


