Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08079530573
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 21:33:03 +0200 (CEST)
Received: from localhost ([::1]:48848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsrK2-0007da-4m
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 15:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqCS-0000ja-OF; Sun, 22 May 2022 14:21:08 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:48146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqCR-0003wY-74; Sun, 22 May 2022 14:21:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wIsgZdKuzxuxVIE6vIHLiUkAPJTWZ/P6Ag372fXTSq8=; b=pfx0CPZTyEi1YJihxrzf+tFZV+
 II5rIbKP0UvdJ7gv28GRiC2v8fDVdLw2XZquYUzYo4KgWFUtkFjogyyUeopiNsZXtIz2FVk3+JN/U
 QZ9blGwkddhKN9CHiQKGyBudnILd4dDvtYyYJWuc6V+8Kiu4298CAateTaJyLM9k23dx2AAq+Nd05
 6EHFWmifNWJT3qmnpVDAeFFEgFHEDV7+7hhsF+T4XTh2Kcuq4b6cVpBo451IDdHYNFZeyI3OFYnXQ
 5cY7UBfIQf9pI43tT0/9FJcYjSZ0lhedJxNLDlSkLSGnqxB/GZ4RUW2ZDiBWiGdcPpL4uCV5wQhfR
 o3clr8ksm86y0vFBTW8IR2zPW8zQZCi6mwJy3UzBvhjXf3ximYO1S4DfpHKwjjkUnyNrNfscwQEGL
 32OGoUL3+ze2pYWEoDV5esCCZYc4HKE3+tumMM6sxsEQd209Xbxtzv7+GChCJCPBb9q3nxQQCFRC6
 m0xuiVbtFfA8J63uvUOC1UlKMGo15T4fm7l99jfbhLvkUVKm9DOnwQR9TRWSlzPOqOP7mSLHfLKjK
 ClUJnURSHhVSV0TsN5+D1dX/63bc7i+fQ4+5DXbXPrcnS8fRdewwEuLuCj8ilUtgh4uj+cSwz2qSb
 MgZOEO0cBpejdJ4JsKbLdThNI3sxbAPKmLVp0C8no=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAx-0007pH-W9; Sun, 22 May 2022 19:19:40 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:34 +0100
Message-Id: <20220522181836.864-49-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 48/50] pckbd: add i8042_reset() function to I8042 device
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
---
 hw/input/pckbd.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index d89efddda9..b2fdd1c999 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -801,6 +801,14 @@ static const MemoryRegionOps i8042_cmd_ops = {
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
@@ -847,7 +855,6 @@ static void i8042_realizefn(DeviceState *dev, Error **errp)
         s->throttle_timer = timer_new_us(QEMU_CLOCK_VIRTUAL,
                                          kbd_throttle_timeout, s);
     }
-    qemu_register_reset(kbd_reset, s);
 }
 
 static void i8042_build_aml(ISADevice *isadev, Aml *scope)
@@ -893,6 +900,7 @@ static void i8042_class_initfn(ObjectClass *klass, void *data)
     ISADeviceClass *isa = ISA_DEVICE_CLASS(klass);
 
     device_class_set_props(dc, i8042_properties);
+    dc->reset = i8042_reset;
     dc->realize = i8042_realizefn;
     dc->vmsd = &vmstate_kbd_isa;
     isa->build_aml = i8042_build_aml;
-- 
2.20.1


