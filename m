Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0225353053B
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 20:39:33 +0200 (CEST)
Received: from localhost ([::1]:34338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsqUG-0003dk-3Q
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 14:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBC-0007ST-Cd; Sun, 22 May 2022 14:19:50 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBA-0003Za-S0; Sun, 22 May 2022 14:19:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7+omfs4P1N7MKohv7RCdWVxPT7B+mUaP60iTQaTpTrM=; b=W4ENus2PeUNQrfeRdHmkRcrEwB
 C1lgjBARK6eYVhZ8xSv3nnH66xAZvzIGB1i/YvZ7FGZa3lXzvSsUyl5OhYbRRhL5ZE3yxVkPhlLOX
 YqaYHG9OfpYmSjc06ydGUMh3DMAeM5Nd2yOJAdiNXheX9ImN23TClhb2HK6ORf1zowuwxsJCh+dID
 pEZ6QQCNHxRLuVhLYJJn1h5NRfkgII/icyaWrKJondMoAgGhq/8hWtJJB0e6GJauwA8T0Cn9VI42q
 TLuUXXwTX8sTF4VyfhGajL78vqoVAQtTwwfJKofkMBUrJDbZOnYLBdZW8RpFeY6sma6N88pBdBT8R
 GZAnv9PmLFGEk3tpCFqD7YRHT95CeW6CQxD3kfQLoTHAJxMSoegtfgqqp3W4vfAqoKgYLtheWtbPp
 slPjg5Mqd2/7WtUH4okmfQhnjw5vRARneUet/1mkVxhq1DsDC8glibX1x7a6FX9zSirN7luRoWWjv
 0FW3RHM8UhLHQaBh1uF0lJvP7AM0wALW5WarnC+dE4SKdmKDssyMQEAsW6iGFjk6hf8MC0nKdhqFS
 aTb8ap6DH7IuMcoSzSToGfPFSUUCPFcBVphEK6krLY+uV0a6sU2iYRgaZOB16klzBP9vtL+Dmrlgz
 8mr9SWRaQFh1aeTt8ZSDfN1A+njHmCs5UJkhabP6c=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsq9k-0007pH-GE; Sun, 22 May 2022 19:18:20 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:17:57 +0100
Message-Id: <20220522181836.864-12-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 11/50] ps2: implement ps2_mouse_realize() and use it to
 register ps2_mouse_handler
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

Move the registration of ps2_mouse_handler from ps2_mouse_init() to a new
ps2_mouse_realize() function. Since the abstract PS2_DEVICE parent class doesn't
have a realize() function then it is not necessary to store the reference to
it in PS2DeviceClass and use device_class_set_parent_realize().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/ps2.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 2abd6510ab..1d223de59f 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -1244,6 +1244,11 @@ static QemuInputHandler ps2_mouse_handler = {
     .sync  = ps2_mouse_sync,
 };
 
+static void ps2_mouse_realize(DeviceState *dev, Error **errp)
+{
+    qemu_input_handler_register(dev, &ps2_mouse_handler);
+}
+
 void *ps2_mouse_init(void (*update_irq)(void *, int), void *update_arg)
 {
     DeviceState *dev;
@@ -1259,8 +1264,6 @@ void *ps2_mouse_init(void (*update_irq)(void *, int), void *update_arg)
     ps2->update_irq = update_irq;
     ps2->update_arg = update_arg;
     vmstate_register(NULL, 0, &vmstate_ps2_mouse, s);
-    qemu_input_handler_register((DeviceState *)s,
-                                &ps2_mouse_handler);
     return s;
 }
 
@@ -1285,6 +1288,7 @@ static void ps2_mouse_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     PS2DeviceClass *ps2dc = PS2_DEVICE_CLASS(klass);
 
+    dc->realize = ps2_mouse_realize;
     device_class_set_parent_reset(dc, ps2_mouse_reset,
                                   &ps2dc->parent_reset);
 }
-- 
2.20.1


