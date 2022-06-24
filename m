Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5971A559B84
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 16:29:00 +0200 (CEST)
Received: from localhost ([::1]:45814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4kIt-0005De-D6
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 10:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jbl-0004AA-2Q; Fri, 24 Jun 2022 09:44:25 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jbg-0005Qd-KS; Fri, 24 Jun 2022 09:44:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jnjxPls9g2ECTzO9SOuC6rjP7WJZ1e0cvCvq+d4ChmI=; b=boO/pkSUB049eVR4w9tWS9lxxX
 1yxw8oi+jVI1uqWGLBiOd4vXE9LBzgx0f+lMRlc0RQKDD8Ce8wI3zLYXU/3ktnm3OqkkDhNy0WPHu
 aQXq0CKiCRbvHVIShnbMmCNCKVnUnYlF5+4aprVcCIuXYUtpwgikDGoDBQcXRfg7duiAsIKYBG10e
 wBJetthZHcX58uiJN9GlN87uvqI+860gZqpHLzLTPT7zdO5PHt9by1j6ciRaW0MUW6ZE0v4IjYsCq
 S2aXITGhbV9tA2/M1qS7DzlN99Zv3MqxkjOLW3DCbv6jDIylKNePr81b+gVI2MkNk1Zz/4BdhXKzZ
 cUVmdNUlutQ43Z/i+etisOTn/iuAdsQZLbNPWTbEqmJEMQf9mnoy6g68woDlqhlB5odLcY3eTqTUA
 a9D1CTHhNRCjEjiH+Dz+AJ/mv2bH+iFhod9lkDLL+CmU7ltW/4MoOoxgxH4RWke8BReoanRSDO7sM
 7X7sDK15Z7SzN9VsrgzBQslz6HcGj0xb3Ct09kpg+MB5jJQksPczZYqSv87yH+g4CJReK+6wUilpj
 repRZwHJ7E7rOqIpteY+U0MmFZqQJPFkTkJlz01FA2WoxCxkQRzuJXhSzmSW7oKXxhNN10uJTppdO
 UMNKnGa1d9QR+/bvs1H6opvtxSt8GNTR3O2yzcGOQ=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4ja2-00037t-NC; Fri, 24 Jun 2022 14:42:42 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:58 +0100
Message-Id: <20220624134109.881989-44-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 43/54] lasips2: move initialisation of PS2 ports from
 lasi_initfn() to lasi_init()
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

This can be improved once the ps2_kbd_init() and ps2_mouse_init() functions have
been removed, but for now move the existing logic from lasi_initfn() to
lasi_init(). At the same time explicitly set keyboard port id to 0, even if it
isn't technically required.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/lasips2.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 84e7a1feee..bd89c03996 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -255,9 +255,6 @@ LASIPS2State *lasips2_initfn(hwaddr base, qemu_irq irq)
     s = LASIPS2(dev);
 
     s->irq = irq;
-    s->mouse.id = 1;
-    s->kbd.parent = s;
-    s->mouse.parent = s;
 
     vmstate_register(NULL, base, &vmstate_lasips2, s);
 
@@ -271,6 +268,11 @@ static void lasips2_init(Object *obj)
 {
     LASIPS2State *s = LASIPS2(obj);
 
+    s->kbd.id = 0;
+    s->mouse.id = 1;
+    s->kbd.parent = s;
+    s->mouse.parent = s;
+
     memory_region_init_io(&s->kbd.reg, obj, &lasips2_reg_ops, &s->kbd,
                           "lasips2-kbd", 0x100);
     memory_region_init_io(&s->mouse.reg, obj, &lasips2_reg_ops, &s->mouse,
-- 
2.30.2


