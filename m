Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E5755B34E
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 19:58:16 +0200 (CEST)
Received: from localhost ([::1]:40588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5WWV-0005Aj-DP
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 13:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WKs-0001jl-IT
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:46:14 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WKr-0008Mn-2C
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:46:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AbxRoqFnQwPjRro55F6eoaJuuWNbzTHPITWuPNLRkR0=; b=VQOW2/e7xxA6JS7HtepzfJ9Hur
 zZxD28z5e+XefaCEF3PKNLdGn8RLQrKckWalYRXv5/Vf5eUczhDgtasnwThmKhm8LrO58wlTqL1Ku
 L/ZonARDDDdH4bg+z8H/V5FrgGbUGFLUaVHIOnlQMW2auURbjfE9eJk95MVZZKlj13h8WYprObFQV
 mHCYPGpYA+QRjA0JndCt4Qc+zhPyjC9MqIc+85/+1H/mGuhVouF9I2aSgmuuP5l3h5Xcg06CpeOFu
 1TGiO+Y4uWKde26S7X02MlQnoR32CWOuWrMzVVcSIYgBFcEFphSLBItdy6dHXHdylZdKBMNXfG9I7
 QtsKPMowiIzBg3CFvsDsMTiWxrrhF+n3TSYolP7LUAc4UA9AFdLaJWUX8RpNoXaHJBVdplcm7PEud
 clbf6jzSXe2PYtlgPqK6BOYL2KiA3u5cNXgXmUXPxVEixsO8lwu8ORx+aUVpcKcaarOW5dqPFBCch
 395GoskufA63/JsJsOROGAr35U9eTeTFV94aNzcY1f3OCiF3IWgZklaaGdyj2oP7rihQskut9oS7c
 ZZPoIY4/pdZD1UngOdU6YxNfZJp1jS/WjoiBRO9c9xISljUgS18DW8Lse1buRXSQs1G6fcMkUBa/W
 A3arGzXbhlmTEM0DHjgzVaI37y/QOFdkrLi+eA7mQ=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WJd-0007KY-Fn; Sun, 26 Jun 2022 18:45:00 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:44:43 +0100
Message-Id: <20220626174531.969187-8-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 07/55] ps2: introduce PS2DeviceClass
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

This is in preparation for allowing the new PS2_KBD_DEVICE and PS2_MOUSE_DEVICE
QOM types to reference the parent PS2_DEVICE device reset() function.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Helge Deller <deller@gmx.de>
Message-Id: <20220624134109.881989-8-mark.cave-ayland@ilande.co.uk>
---
 hw/input/ps2.c         | 1 +
 include/hw/input/ps2.h | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 3a770f3b78..fd5236690a 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -1283,6 +1283,7 @@ static const TypeInfo ps2_info = {
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(PS2State),
     .class_init    = ps2_class_init,
+    .class_size    = sizeof(PS2DeviceClass),
     .abstract      = true
 };
 
diff --git a/include/hw/input/ps2.h b/include/hw/input/ps2.h
index 1a3321d77e..aef892b5e6 100644
--- a/include/hw/input/ps2.h
+++ b/include/hw/input/ps2.h
@@ -33,6 +33,10 @@
 #define PS2_MOUSE_BUTTON_SIDE   0x08
 #define PS2_MOUSE_BUTTON_EXTRA  0x10
 
+struct PS2DeviceClass {
+    SysBusDeviceClass parent_class;
+};
+
 /*
  * PS/2 buffer size. Keep 256 bytes for compatibility with
  * older QEMU versions.
@@ -54,7 +58,7 @@ struct PS2State {
 };
 
 #define TYPE_PS2_DEVICE "ps2-device"
-OBJECT_DECLARE_SIMPLE_TYPE(PS2State, PS2_DEVICE)
+OBJECT_DECLARE_TYPE(PS2State, PS2DeviceClass, PS2_DEVICE)
 
 struct PS2KbdState {
     PS2State parent_obj;
-- 
2.30.2


