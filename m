Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A71E55B372
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 20:17:42 +0200 (CEST)
Received: from localhost ([::1]:38396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5WpJ-0008T0-6j
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 14:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WMX-0003xo-Ug
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:47:57 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WMW-0000Al-2y
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:47:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y8I5iXHqcdgO10+xLFQE805ot4zcDs5uMhaH5m5DFE8=; b=x8iAwmEVpiv3cmrdbD9wmK6XQg
 IR85muHp/5nYFKa8dE4va/y1Y9w3pwXTeQHteAmpd36Iz2eEjEDXXl/Oi+AJRS7uRh3eDNpyHtR5v
 TYuLuOoftNFwdpxyRGwGG1bxlDSKzlQIJCIB/gYVRtQ4wb2+OJ3cqi3eOxtDDlsyxZ1rQ1al2XlM9
 uB2epFuP/oDOsQxJdRFzh10nWLCWc5Fqhiln+bJjunJ7i96zAmXRPXMY4PIoCiVbhd1tltTPp/NHp
 S706Op+zMABxDgGUPrcufhnhX4f9sOcydgVXGRbqVlZljkKM5w3/sIkZakuVlM4GayOphdi5bYIvX
 6Js8anuoHxR17ds0h6cWnVvAwrNpfzdaORxUdll1DeVCi/gI39ThkPlkMtjGOHniiKfbXcNMvS9tz
 lakj+MdvVvbvMoI9aYnflDyBWTXTuhl0ydFzFFv3onFzYOCB/eygRP9GwPet/1usfboDqwjeZuTJF
 GV0P9PiqtnlWNKpaaSSbqGyxeFk/7DkCCjwBYFegiSTJCtWQq3J4anXfSScJXFJShcPwYrYY8/ixR
 nBPwXczpGolgzhPEzTha1XrHMRMlN1va5phmboVv2kFrvy97wGal+I57V1BHCvuh7EYr7XChP2nq9
 h4uOqfVFcvPsIWSe5aKsFOonbmnS8qjWj91e/sQoI=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WL8-0007KY-Bk; Sun, 26 Jun 2022 18:46:34 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:45:09 +0100
Message-Id: <20220626174531.969187-34-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 33/55] ps2: introduce ps2_lower_irq() instead of calling
 update_irq() directly
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

This consolidates the logic of lowering the PS2 IRQ into one single function.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220624134109.881989-34-mark.cave-ayland@ilande.co.uk>
---
 hw/input/ps2.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index a14281bc54..bc0bcf1789 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -177,6 +177,11 @@ static void ps2_raise_irq(PS2State *s)
     s->update_irq(s->update_arg, 1);
 }
 
+static void ps2_lower_irq(PS2State *s)
+{
+    s->update_irq(s->update_arg, 0);
+}
+
 void ps2_queue(PS2State *s, int b)
 {
     if (PS2_QUEUE_SIZE - s->queue.count < 1) {
@@ -554,7 +559,7 @@ uint32_t ps2_read_data(PS2State *s)
             q->cwptr = -1;
         }
         /* reading deasserts IRQ */
-        s->update_irq(s->update_arg, 0);
+        ps2_lower_irq(s);
         /* reassert IRQs if data left */
         if (q->count) {
             ps2_raise_irq(s);
@@ -1001,7 +1006,7 @@ static void ps2_reset(DeviceState *dev)
 
     s->write_cmd = -1;
     ps2_reset_queue(s);
-    s->update_irq(s->update_arg, 0);
+    ps2_lower_irq(s);
 }
 
 static void ps2_common_post_load(PS2State *s)
-- 
2.30.2


