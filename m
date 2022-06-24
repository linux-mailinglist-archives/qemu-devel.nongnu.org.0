Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B80559AAE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 15:51:49 +0200 (CEST)
Received: from localhost ([::1]:60934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4jiu-0003m9-LG
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 09:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZU-0008A4-GW; Fri, 24 Jun 2022 09:42:04 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZS-00056e-RK; Fri, 24 Jun 2022 09:42:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qpyYJsUslD7HcPHbBvR0JXi4478xZf387fDV2B8cdeg=; b=JVsy1wLAZQMl3iirglEv7oNIBh
 xg9XyUwZicTq09M2SFLoGx9m3fWXf9JA2G01UNoXftJipEGT+WatbFZY+iJSpIXj8+xU3/99K6kya
 bUTtyur4rnWdvBAgunmAfP8QvzQK6s3Ol/JMIehRip8Z6Asrotnml49IsZlCP8KnPbvk9jBt49/L9
 TR+Y15nDO0I4T36l12g8RjEWIE986rLW5tDCA9QjfjjaLVFTRpf2VjAVBcCVhbmz5ZkH8EPllEA0t
 dhs4yvYaO3IXmWV3TkW4md6tO3ddrIsJAzeTzz8aYy8ZkMo23FnZrfeg/V50YURqNh5nrZvHaOYvB
 frouaOTvt7mLPk4MDVxcJQCdkG9terxpnrjf8rPZQcGvUb8RTYBeGw4Gbx669Uk848dsXlSQM8U5I
 6HbhTdi8Q+uoQZoNmzg8Hxh6wnAgMH90eU/PeI1xKEh6xlp3Tznfn87MGesl59D3Mcr219Pqu142J
 gEIYTe07z/rWXP4+LOxIVC5GQTZv7zxe3VJ85sJqOv1KYTtPn5mgbfau3fIMlvqHG1Eg0pHEOYRlm
 xLO4QfhE5iuRHgaCoY/obZUhbc9QZlpK6MVCTjEs2NJVMfiaOe2L34wQ5RgdGHMaLp/XWWtqwUMif
 dk6bTA5wGPNqbqzV0GFoeHZ2veLla+BZDjTW1huwU=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jYD-00037t-LM; Fri, 24 Jun 2022 14:40:46 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:26 +0100
Message-Id: <20220624134109.881989-12-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 11/54] ps2: implement ps2_mouse_realize() and use it to
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/input/ps2.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 62ea4c228b..eae7df2096 100644
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
2.30.2


