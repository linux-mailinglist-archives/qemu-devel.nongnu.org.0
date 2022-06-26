Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 215DE55B350
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 19:58:17 +0200 (CEST)
Received: from localhost ([::1]:40508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5WWW-00057j-7K
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 13:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WMA-0003Uy-0J
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:47:34 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WLy-0008W7-Lm
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:47:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ChwdzZCD5tiDT3DLMhvPjceW/hwuRQ7KyEMw1NT0BHo=; b=MzIxX06dKBpVpuneUsF+gXmAUT
 oskM90trR+Gjk7fmgd5njqOwQ8VGCvPL8CgG2/F9iQg2fCkaxyPXyY4ZzeBDDcCag9M4EUQN0XPl7
 jyvbp5yeADecmYpkBis1lY8EBxXrNrTPceeyYkycMGfnIexLYnolIDnGgUoTjvlbIC5L/ozKELHlc
 IxT4toQYa8s95SiBK6LNGSUoShhz5+E8e2P9usadGwPF8yjdpUlLog1ds9rA+TWLbbZebi/emSwbb
 n3W6GsjVGjhLVsxc9du4vBMSX884d3cDIU8TPv0b7Xr7NWTbJGj7BYntVZZUN5mavZehFZ/ylimpB
 M4dWxQEs/H8Uq/PLMcIY2EOwW/+S64bg/2oblbP4DZbZKZXszoGLlyC8nsVpPrG7y9R7FAJYDBsZJ
 EVv/ng6uTp8tKg4STdOTXhlCJVMWS439soVbyLChsn6jEb+UvRJUn6YrDS/pYBfjiuzBl2osoczzD
 XwyJZapgdndwzZLIoybxUOsoCcC4Ev5bxWOreF4oiqBQ7uZA7ca3nzMDHeY4fDkF1TjOaagCD5Ly4
 AjU/QGlCWpgmhiXmyH182YLHbzCnpMFrmQU0V01Z8uQGuyif3BZ4a/JDhRUcjKnaNOfMF4jdiV4ZU
 lQhZDlBVzF6iK4/BEyM2+Zj8POpKItH6GT2tlQ9s4=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WKT-0007KY-7c; Sun, 26 Jun 2022 18:45:53 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:44:58 +0100
Message-Id: <20220626174531.969187-23-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 22/55] pckbd: implement i8042_mmio_reset() for I8042_MMIO device
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

This allows the I8042_MMIO reset function to be registered directly within the
DeviceClass rather than using qemu_register_reset() directly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Message-Id: <20220624134109.881989-23-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/pckbd.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 89a41ed566..7b520d0eb4 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -665,10 +665,19 @@ static const MemoryRegionOps i8042_mmio_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static void i8042_mmio_reset(DeviceState *dev)
+{
+    MMIOKBDState *s = I8042_MMIO(dev);
+    KBDState *ks = &s->kbd;
+
+    kbd_reset(ks);
+}
+
 static void i8042_mmio_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->reset = i8042_mmio_reset;
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
 
@@ -695,7 +704,6 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
 
     s->kbd = ps2_kbd_init(kbd_update_kbd_irq, s);
     s->mouse = ps2_mouse_init(kbd_update_aux_irq, s);
-    qemu_register_reset(kbd_reset, s);
 }
 
 static const TypeInfo i8042_mmio_info = {
-- 
2.30.2


