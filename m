Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB38865D485
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 14:41:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD3zo-0003eq-P9; Wed, 04 Jan 2023 08:39:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD3zk-0003eg-2R
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 08:39:52 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD3zi-0001UR-D4
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 08:39:51 -0500
Received: by mail-wr1-x434.google.com with SMTP id d9so4406141wrp.10
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 05:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WTE5lvRuyw95tyd7OeeOqOVNz/VGzsf7WbrAe7T/I2s=;
 b=Cba85PgerYpzdlNd0hifJZDxSmqaCsIPmauZaSLR020pggJ8m+voU/pk/am2Gs7Ded
 hUmM3FDxRhDLjA5WeME3VrPBiPDqT1bJwGjZ039Z9TUFbY8iB7BDbvbE0u6FcbFEJjim
 nwKAPmRMTe+P6zlV/x2ZdLpiS4IrkUuX4Wj8Zu4lH1cwdHDLOL5kGC629imXKF7QXdvM
 S+pSlH8sPpOTnA0BONd+SfToiT6KkhWdGBH6P/vjC5doRLx4nTT/kkCAaFz9Ny0Chzel
 Vy4zU9vcF7siQNOw0t/IjwaPRsvhi9wuUWTTo5HhPRhKcLKUv08W+9MQAkdk9e26o0oz
 x2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WTE5lvRuyw95tyd7OeeOqOVNz/VGzsf7WbrAe7T/I2s=;
 b=gdpdqJun/+G5vsLLoaFVpc/nCnc8aRiRrJFaOR3xI+j+7A8swSe+rxCYiQCjqVW/l6
 WPkcFJL+DaJAzxjQmjMGqXpL51p/+5o/eOIZSgL/osr1/XtrfJ4xWLuG/X0bT6zJU2VU
 AJJrJDOC7O4A3Xo8yhpzAVu8WgZr2KdEkkhYVvWxbzwseE4YmDq2jTBkLeSUOAwDJ86K
 ZcPQ+PGueWbWF9LMEpesHb40iauWoduRg8YZ799t3cm7u+1fbj0kobdmP8/BZ01lfFLf
 hF/xHkWFlhb1fr8pY2xpqaN0ViCwKMv5DHq+Bf/b2zQwsW4/Qmr6oqzDAnMxBE8GxBaA
 tEbQ==
X-Gm-Message-State: AFqh2kq83tWq70uS9WCW+pi/MfwBX4vBLyCvdkE1ib78PdkPyS/Xnv/z
 /12Qr9F5sQNrUZ/1Hs10s4czIMuTc+IfwNR5
X-Google-Smtp-Source: AMrXdXuoyWYJj7Azjg6Jf1wBSSyA4RTmoZgsttst8FxoUfja6QAMemkNYvagt05rfd42xbDdxG8ppw==
X-Received: by 2002:a5d:4e92:0:b0:2a9:5b5d:2156 with SMTP id
 e18-20020a5d4e92000000b002a95b5d2156mr797347wru.23.1672839588406; 
 Wed, 04 Jan 2023 05:39:48 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a5d6b4c000000b00241fea203b6sm33876790wrw.87.2023.01.04.05.39.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 05:39:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/6] hw/mips/malta: Split FPGA LEDs/ASCII display updates
Date: Wed,  4 Jan 2023 14:39:31 +0100
Message-Id: <20230104133935.4639-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104133935.4639-1-philmd@linaro.org>
References: <20230104133935.4639-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

No need to refresh the ASCII bar when a LED is toggled
(and vice versa).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/malta.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index c0a2e0ab04..e9424150aa 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -106,11 +106,10 @@ static struct _loaderparams {
 } loaderparams;
 
 /* Malta FPGA */
-static void malta_fpga_update_display(void *opaque)
+static void malta_fpga_update_display_leds(MaltaFPGAState *s)
 {
     char leds_text[9];
     int i;
-    MaltaFPGAState *s = opaque;
 
     for (i = 7 ; i >= 0 ; i--) {
         if (s->leds & (1 << i)) {
@@ -123,6 +122,10 @@ static void malta_fpga_update_display(void *opaque)
 
     qemu_chr_fe_printf(&s->display, "\e[H\n\n|\e[32m%-8.8s\e[00m|\r\n",
                        leds_text);
+}
+
+static void malta_fpga_update_display_ascii(MaltaFPGAState *s)
+{
     qemu_chr_fe_printf(&s->display, "\n\n\n\n|\e[31m%-8.8s\e[00m|",
                        s->display_text);
 }
@@ -457,13 +460,13 @@ static void malta_fpga_write(void *opaque, hwaddr addr,
     /* LEDBAR Register */
     case 0x00408:
         s->leds = val & 0xff;
-        malta_fpga_update_display(s);
+        malta_fpga_update_display_leds(s);
         break;
 
     /* ASCIIWORD Register */
     case 0x00410:
         snprintf(s->display_text, 9, "%08X", (uint32_t)val);
-        malta_fpga_update_display(s);
+        malta_fpga_update_display_ascii(s);
         break;
 
     /* ASCIIPOS0 to ASCIIPOS7 Registers */
@@ -476,7 +479,7 @@ static void malta_fpga_write(void *opaque, hwaddr addr,
     case 0x00448:
     case 0x00450:
         s->display_text[(saddr - 0x00418) >> 3] = (char) val;
-        malta_fpga_update_display(s);
+        malta_fpga_update_display_ascii(s);
         break;
 
     /* SOFTRES Register */
-- 
2.38.1


