Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8840530554
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 20:59:23 +0200 (CEST)
Received: from localhost ([::1]:42736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsqnS-0003yU-TO
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 14:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBU-0007vW-Gt; Sun, 22 May 2022 14:20:09 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBQ-0003ao-4I; Sun, 22 May 2022 14:20:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ISWEG4VfSuh8z2JdLel2rveX5OtktYJr7RJtbL5goMI=; b=TL9llOV/ze6kO316bpATd16Tdz
 cdZnoi2fBlsNiaekqUzWF0H+NBKaQuQL6wB4+CnhnIrI5r/y2NQScWQJONWFSDcLepSCVr46k9M2v
 DXO32KkINZxVrW/m5uSB+OPPAiWj4SWXH5vs6LS2aHfF91MYNWYkn4uxU54nhKmXKnhC7iINBk6TZ
 /zrc2WwVezIuoXdKl+VrBH85/OvJI+o3WTdxEcu2o+ca/7Z0Jc3uh/hsuvX3MidyAQCKgPmyoELxI
 U2uVDwSJURHhgGB/8YrJIV3JdKQGl4hNbyEiJ8PL+7AjuU8VHQnDsNpsNnNYi4AgTkCUbj/kVo+mi
 y//+tw/eWtnmhTv0PvC7yqGd7PHXNMXyyNwe7OKwTQM3YPX2tLQreHJNJvGmSwg7+rOizU/3FSB3K
 RiynbpBr6/4EcVgc59YQRwWb2eXyz79+H4WR19YnX7jnIlc1ceRTPR/VFOBCGu44pXt5TPs1LWjcc
 xqcojNGQCWEJ4sZNEaBPRq68orpJM9c6Yow+tRGo+hiEu6nUUUKlzkHif8pLn0hmx7u/R9CKryk2i
 0izPjkF/aQKncD9hxzRiV2OvsYwkhMYXHpg/tFruI4cvxWMOIygF1ep8vsyzeV0RV0aTR6Lv4iBiL
 xTNmyuYIGBzS5g/ke0WehrUnrA3kwFi7bWZFCsJo4=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsq9w-0007pH-FR; Sun, 22 May 2022 19:18:36 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:06 +0100
Message-Id: <20220522181836.864-21-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 20/50] pckbd: move ISAKBDState from pckbd.c to i8042.h
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

This allows the QOM types in pckbd.c to be used elsewhere by simply including
i8042.h.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/pckbd.c         | 10 ----------
 include/hw/input/i8042.h | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 87e015f243..3a7411f799 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -686,16 +686,6 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
     qemu_register_reset(kbd_reset, s);
 }
 
-struct ISAKBDState {
-    ISADevice parent_obj;
-
-    KBDState kbd;
-    bool kbd_throttle;
-    MemoryRegion io[2];
-    uint8_t kbd_irq;
-    uint8_t mouse_irq;
-};
-
 void i8042_isa_mouse_fake_event(ISAKBDState *isa)
 {
     KBDState *s = &isa->kbd;
diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
index 84b5aa7f23..a246250d1f 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -39,6 +39,16 @@ typedef struct KBDState {
 #define TYPE_I8042 "i8042"
 OBJECT_DECLARE_SIMPLE_TYPE(ISAKBDState, I8042)
 
+struct ISAKBDState {
+    ISADevice parent_obj;
+
+    KBDState kbd;
+    bool kbd_throttle;
+    MemoryRegion io[2];
+    uint8_t kbd_irq;
+    uint8_t mouse_irq;
+};
+
 #define I8042_A20_LINE "a20"
 
 
-- 
2.20.1


