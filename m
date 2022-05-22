Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E60153056B
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 21:20:37 +0200 (CEST)
Received: from localhost ([::1]:50610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsr80-0004va-M2
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 15:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqC7-0008IG-4C; Sun, 22 May 2022 14:20:47 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBp-0003qA-6I; Sun, 22 May 2022 14:20:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AaAUTlhTqrpPSPZnLu5z09pTzeglbwj2cDCyzCng+VQ=; b=zTKmMvuxEiLZSPFdHHemaL/4vN
 wsLPCxLJ52fkP7YxBqNv1Sz084RaEMBTZHNT6nBQaamsMyKhP1aFqqtVc5zt+mJMdk3pAP8i1ZD95
 vksPP3JZquLXxXW1IsAMtyTZ183j2BwExjowacmiu3WyXGG0TPbGgBy8pWkE3xHa33lEB+o3HmAcj
 aPEPPvZ/3Bx/bJyHo4aZskb3HyL0yB78mX1Ko77ncZUwlKvNxyUwHS/gWtoeWS7kf1ZAVGaIsAM2t
 YKPVE0dKsujryZcgjQ/IRz2nMgoptG3Ny2wsofJ+X1r3MQj/XMfbxDnTF7C6fHju7fJA1LT04EtLE
 1woc3mSug/o3GgQS/diZtEiR+ziTVRp5SzvL52xfAzZkJ0rUdbIqOZTRJDJckHivOT/oVX8JSFDwE
 58jmsT15DVr5dFdH6Inpwoef/KnUSLl0vxmT6PAiHQz22pok98v5rz1Edfkr2HGK0qsptUwn+mWaJ
 TOW9GF8qyUKiVZOCh+G9XSUcPPO/EFC35VUZo0uMURm2N6zZzuPz6RIWH2AxjDFiMjqBepHTR73Eg
 laiCrCI1Nvv+IHtrtqR4gyoXHIdkg9fF90pZvYXx7DisrLyV3od/akMsCcfhVDa6PlN3ojr/71nd3
 vauDS8OilU/obgCHg4gMQZ8K5UZ9FvygJiRu3C9z4=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAO-0007pH-21; Sun, 22 May 2022 19:19:00 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:19 +0100
Message-Id: <20220522181836.864-34-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 33/50] ps2: introduce ps2_lower_irq() instead of calling
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
---
 hw/input/ps2.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 55a2ac08c2..214dda60bf 100644
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
2.20.1


