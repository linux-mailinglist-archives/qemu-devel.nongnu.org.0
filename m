Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 890392AD4D7
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:25:44 +0100 (CET)
Received: from localhost ([::1]:37678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRmR-0000Yj-H5
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:25:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgX-0002Bc-BF
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:37 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:37892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgU-0006qK-9x
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:37 -0500
Received: by mail-wm1-x330.google.com with SMTP id h62so2622119wme.3
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 03:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ncROH4SAzxzER5pxRz2Vkiv7YWAfqJ5o51gGiSjIRBA=;
 b=iHCYsAZl70cL5cc/9hPJh/k/Z2jaWjnlljwjR6pPPyHDjE3IckVoeoxQl8vqT6amap
 283NtfZbjlzVPMpR+mbXJ2HEhBBk3u3jgitq5L1x+ASE/axRE7G3DTYWwzoBLkLT6Kxj
 wPKq/KS615tYBvkX+5jR1PRYtWRKbB6HU1iR4c49RnXAPkSll/hNFzRta3qvMS9gVV7G
 pOzyESOwWQpBEvwzw69HTQNBeGkLS7g1WIM29I9KvV43afMAbY3yxWdPGWSnVSV2OZRd
 rdoziAEveTCVDDoPTH3JUQXP4bP+vZECB6xtOC3XjJggqXEMp1lc1GTOj50RJLr/jpvt
 /qIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ncROH4SAzxzER5pxRz2Vkiv7YWAfqJ5o51gGiSjIRBA=;
 b=TOhYn4deF7B4KobiRFFt0hVHB3RgDvxDAo+605HCnmxqs57uA9YQhT3rKnvfYA65qr
 KmmzsA6gfxuHqGWTmiXJ0v4npVyuS7d8TrGZraiIbiuzhquIsI7jpNCB23C77fWsOfVW
 eUmUJUVy+JSfoC6/0ORu7j5hKKJOH8SdlMkOS6rrdUblsS+znaPBNpyDug1coa/qqBgR
 hrE4fuCEl5HrKbiFiGaHZmyUfiC717iSVNxvhusSv+cgHCibMVW9sqivqMVPTSkzyj5i
 +Fy+T3KhZTEFRhD+mpb1ov57edsn7wUQ0JKJhkVcd4AZPJNyPhGbIEqyYIHtzmHP+CCs
 geow==
X-Gm-Message-State: AOAM531le1wT6uP7HFO6y2SdDVmcvneOdE1ZWLxXtL0azRgcP8WTZf4W
 j/lO/SWVqsChMsYDINoLa5y+VFnx3dbFfw==
X-Google-Smtp-Source: ABdhPJxyqv5V0MkJeTUeo9fc7IOrstjfb4y+XBomMjLqr07Ve2xX8OWeWWqOycYRSgyupn/yr1MeRA==
X-Received: by 2002:a7b:c5c3:: with SMTP id n3mr4117152wmk.44.1605007172730;
 Tue, 10 Nov 2020 03:19:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 109sm16909498wra.29.2020.11.10.03.19.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 03:19:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/16] hw/arm/nseries: Remove invalid/unnecessary
 n8x0_uart_setup()
Date: Tue, 10 Nov 2020 11:19:12 +0000
Message-Id: <20201110111917.29539-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110111917.29539-1-peter.maydell@linaro.org>
References: <20201110111917.29539-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

omap2420_mpu_init() introduced in commit 827df9f3c5f ("Add basic
OMAP2 chip support") takes care of creating the 3 UARTs.

Then commit 58a26b477e9 ("Emulate a serial bluetooth HCI with H4+
extensions and attach to n8x0's UART") added n8x0_uart_setup()
which create the UART and connects it to an IRQ output,
overwritting the existing peripheral and its IRQ connection.
This is incorrect.

Fortunately we don't need to fix this, because commit 6da68df7f9b
("hw/arm/nseries: Replace the bluetooth chardev with a "null"
chardev") removed the use of this peripheral. We can simply
remove the code.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20201107193403.436146-4-f4bug@amsat.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/nseries.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 76fd7fe9854..6215c18d627 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -789,16 +789,6 @@ static void n8x0_cbus_setup(struct n800_s *s)
     cbus_attach(cbus, s->tahvo = tahvo_init(tahvo_irq, 1));
 }
 
-static void n8x0_uart_setup(struct n800_s *s)
-{
-    Chardev *radio = qemu_chr_new("bt-dummy-uart", "null", NULL);
-    /*
-     * Note: We used to connect N8X0_BT_RESET_GPIO and N8X0_BT_WKUP_GPIO
-     * here, but this code has been removed with the bluetooth backend.
-     */
-    omap_uart_attach(s->mpu->uart[BT_UART], radio);
-}
-
 static void n8x0_usb_setup(struct n800_s *s)
 {
     SysBusDevice *dev;
@@ -1362,7 +1352,6 @@ static void n8x0_init(MachineState *machine,
     n8x0_spi_setup(s);
     n8x0_dss_setup(s);
     n8x0_cbus_setup(s);
-    n8x0_uart_setup(s);
     if (machine_usb(machine)) {
         n8x0_usb_setup(s);
     }
-- 
2.20.1


