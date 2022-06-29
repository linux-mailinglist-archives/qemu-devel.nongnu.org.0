Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 811A356016A
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 15:36:05 +0200 (CEST)
Received: from localhost ([::1]:55696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6XrP-0008H6-P0
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 09:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1S-0001JG-UQ; Wed, 29 Jun 2022 08:42:23 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1R-0005Cx-7X; Wed, 29 Jun 2022 08:42:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pjAcywYgywewWIYav2AWuknwqMDrLcZi9CVuKyqnSlk=; b=YTVwjrkb6+Aosj9ZwHUtGYUmO3
 eALO6toTNw6m3r7nknj9KKf1N7oFWzfsM36qC+/wG898wQY3LXmZb5FLV9unOUb8yv3/OEzmsHKe9
 hf1PqTp2h0seHx7bWm/gcAaMpEHCQwE89lwnket1+kqlj0ovo16GKhjDxZPclYQTgq/NMW8m5SodN
 EXRs2CH6hNYybOt4fxyikChw9gzKQoS1FAAJL0ldv4AB0O7Z46bqiw36+Q+HTcN9x9pf0Vp5N/XC3
 4g1S0ol1m+U2np4YXnsKxLp5VZPUds1P/0VbqfTB7BYPo68r4569rnKi1HmBb5F+O2OSuNm4WU47f
 io/xKvJwyZ4NA6cKGNpFP62lrD8+lsABz1304HnCbFt9RlWG+sSh30r7wJtdmQY2fzVswRyxLEw1X
 8sX2H1SzywUMV+GFjHtJSDb34YSsoWDJwHRK9ftw+mdmO29LFmiKCsblQQ7mxYhP6Xic7o0YIAYhM
 tDWMmsmibxBH2VOK/zZ5kzsMt87zfWOtvN9qQgAAOQ2tbFa8+xlLjFolIJk6AI8EnCIGe+z9+AtbQ
 hqtEjqMbbAN2o3/ukDr/UEzLx37OO8GxoloX+wyKDuNXTT+oA1RxHMEXkeqcX4cPsx7q19On3Y59e
 W/+5yQHW75gvqBevXBIdda5GIy59KiDCuKFxm9MNs=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wzm-0002tZ-RY; Wed, 29 Jun 2022 13:40:39 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:40:19 +0100
Message-Id: <20220629124026.1077021-34-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 33/40] lasips2: don't use legacy ps2_mouse_init() function
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

Instantiate the PS2 mouse device within LASIPS2MousePort using
object_initialize_child() in lasips2_mouse_port_init() and realize it in
lasips2_mouse_port_realize() accordingly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/lasips2.c         | 10 +++++++++-
 include/hw/input/lasips2.h |  2 ++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 4b3264a02d..e602e3c986 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -398,10 +398,15 @@ static const TypeInfo lasips2_kbd_port_info = {
 
 static void lasips2_mouse_port_realize(DeviceState *dev, Error **errp)
 {
+    LASIPS2MousePort *s = LASIPS2_MOUSE_PORT(dev);
     LASIPS2Port *lp = LASIPS2_PORT(dev);
     LASIPS2PortDeviceClass *lpdc = LASIPS2_PORT_GET_CLASS(lp);
 
-    lp->ps2dev = ps2_mouse_init();
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->mouse), errp)) {
+        return;
+    }
+
+    lp->ps2dev = PS2_DEVICE(&s->mouse);
     lpdc->parent_realize(dev, errp);
 }
 
@@ -412,6 +417,9 @@ static void lasips2_mouse_port_init(Object *obj)
 
     memory_region_init_io(&lp->reg, obj, &lasips2_reg_ops, lp, "lasips2-mouse",
                           0x100);
+
+    object_initialize_child(obj, "mouse", &s->mouse, TYPE_PS2_MOUSE_DEVICE);
+
     lp->id = 1;
     lp->lasips2 = container_of(s, LASIPS2State, mouse_port);
 }
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index 4a0ad999d7..01911c50f9 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -61,6 +61,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(LASIPS2MousePort, LASIPS2_MOUSE_PORT)
 
 struct LASIPS2MousePort {
     LASIPS2Port parent_obj;
+
+    PS2MouseState mouse;
 };
 
 struct LASIPS2State {
-- 
2.30.2


