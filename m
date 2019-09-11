Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC6AAFEFB
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 16:41:57 +0200 (CEST)
Received: from localhost ([::1]:51782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i83oi-0005jB-NZ
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 10:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44714)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>) id 1i83m7-00038P-E3
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 10:39:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <geert@linux-m68k.org>) id 1i83m6-0001x6-CJ
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 10:39:15 -0400
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15]:41636)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <geert@linux-m68k.org>)
 id 1i83m6-0001vG-5J
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 10:39:14 -0400
Received: from ramsan ([84.194.98.4]) by andre.telenet-ops.be with bizsmtp
 id 0Ef42100205gfCL01Ef4fw; Wed, 11 Sep 2019 16:39:10 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1i83lv-0006T4-UL; Wed, 11 Sep 2019 16:39:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1i83lv-0003P8-T2; Wed, 11 Sep 2019 16:39:03 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Wed, 11 Sep 2019 16:38:55 +0200
Message-Id: <20190911143858.13024-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190911143858.13024-1-geert+renesas@glider.be>
References: <20190911143858.13024-1-geert+renesas@glider.be>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:1800:120:4::f00:15
Subject: [Qemu-devel] [PATCH/RFC v2 2/5] gpio: Export gpiochip_get_desc() to
 modular GPIO code
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Marc Zyngier <marc.zyngier@arm.com>, Magnus Damm <magnus.damm@gmail.com>,
 Christoffer Dall <christoffer.dall@arm.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 Alexander Graf <graf@amazon.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Harish Jenny K N <harish_kandiga@mentor.com>,
 Phil Reid <preid@electromag.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Export the gpiochip_get_desc() symbol, so modular GPIO driver can make
use of this function again.

This is a partial revert of commit 1bd6b601fe196b6f ("gpio: make
gpiochip_get_desc() gpiolib-private").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
ERROR: "gpiochip_get_desc" [drivers/gpio/gpio-aggregator.ko] undefined!
---
 drivers/gpio/gpiolib.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index dbecf266be5a5a2a..c2cf01fb72a9de87 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -95,6 +95,7 @@ static inline void desc_set_label(struct gpio_desc *d, const char *label)
 {
 	d->label = label;
 }
+EXPORT_SYMBOL_GPL(gpiochip_get_desc);
 
 /**
  * gpio_to_desc - Convert a GPIO number to its descriptor
-- 
2.17.1


