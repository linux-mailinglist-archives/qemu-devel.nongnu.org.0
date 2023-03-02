Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6330D6A8B1A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 22:23:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXqNc-0000kn-2T; Thu, 02 Mar 2023 16:22:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNa-0000kG-4c
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:22 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNY-0002Pi-KG
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:21 -0500
Received: by mail-ed1-x52a.google.com with SMTP id cw28so2500497edb.5
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 13:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677792139;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UZSVOd6Mrk5nklnTmZmHI7ndDybzDKIcEkTioDkr9Wg=;
 b=KtmHjx6YcMf798EJbm6wZvavhtoWli3vDC5NHVoqRQNiHuCRlyVCMUfP/6zSJO9yyX
 Fp4xIoc55UJZFBm/jWwkVYsrtfMvzKWNJAyBcQjNo1iMBqGOzdYL6ZBmCimK4Gj4WcMn
 QoN8tU/DKKcl+UG+CLtn9f9+vQgJ1HZu5gm2jh0iFVsqQNyw7vW8gQQoixObFulgO9kj
 JKmrKxQg/YHobLInrOhKh/Kr9AVSkPiyffSQSeAKTs0kpYiNaWJPO9Wlmup6TcuDPCR1
 xrPyxOV1SMRYpsh8rK/pPtksBjSwtF25ABpFKVJvE2MrVs3RyheEW5d6qzx8vShp9Xf8
 ww3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677792139;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UZSVOd6Mrk5nklnTmZmHI7ndDybzDKIcEkTioDkr9Wg=;
 b=6Djix1ZLTl69lqPe6wg2pKjKqqzMLfyJQ6X+wsXTK8g/NeiD3VQc16kDRPV4mMX5fS
 EoqUYmOF8oOguAsb+X+M11TIoKfYVv80MenLRsYE5yGASPGo2XCc2ZR/G1kxYrVdG8L3
 W8YVer1xJmgQoeb05y6K7Zj/tBdgSntEw06ENiqmvcJ8nlASiLY3WwjfCzUAmRg3m/ai
 Lmzs5kTUC20OeJTY8IlTTokA/vAjTctc/fp0OZN09geYgQtawjCCYuxH+RXo2Z4eOAPh
 QbCRodQtfUFO4sU2mxS6AT/BBQniO723ahLTuwsncyugXB/vVGtUleiIO3DHdAKqWpiU
 /osA==
X-Gm-Message-State: AO0yUKU7wczvCQ2N0Cm+VbIJmPuRAy27WreupTW6ijjBbkOftk5NEUs2
 pX0wZSriiTZuCWm2EmwjChYirvN+7iI=
X-Google-Smtp-Source: AK7set8gRYe3XznZgqDwgdscefgGAUrEGbCmdEfxOoPzqi2M6EgGFSvq5AtExrtZ1+MiN02gyLVZuA==
X-Received: by 2002:a17:907:d68a:b0:880:3129:d84a with SMTP id
 wf10-20020a170907d68a00b008803129d84amr16080381ejc.60.1677792139656; 
 Thu, 02 Mar 2023 13:22:19 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-092-224-150-004.92.224.pool.telefonica.de. [92.224.150.4])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709062ec400b008f89953b761sm145895eji.3.2023.03.02.13.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 13:22:19 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v8 09/23] hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
Date: Thu,  2 Mar 2023 22:21:47 +0100
Message-Id: <20230302212201.224360-10-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302212201.224360-1-shentey@gmail.com>
References: <20230302212201.224360-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

PIIX_NUM_PIC_IRQS is assumed to be the same as ISA_NUM_IRQS, otherwise
inconsistencies can occur.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-21-shentey@gmail.com>
---
 include/hw/southbridge/piix.h | 5 ++---
 hw/isa/piix3.c                | 8 ++++----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 14897a00d9..87dde11099 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -31,7 +31,6 @@
  */
 #define PIIX_RCR_IOPORT 0xcf9
 
-#define PIIX_NUM_PIC_IRQS       16      /* i8259 * 2 */
 #define PIIX_NUM_PIRQS          4ULL    /* PIRQ[A-D] */
 
 struct PIIXState {
@@ -43,10 +42,10 @@ struct PIIXState {
      * So one PIC level is tracked by PIIX_NUM_PIRQS bits.
      *
      * PIRQ is mapped to PIC pins, we track it by
-     * PIIX_NUM_PIRQS * PIIX_NUM_PIC_IRQS = 64 bits with
+     * PIIX_NUM_PIRQS * ISA_NUM_IRQS = 64 bits with
      * pic_irq * PIIX_NUM_PIRQS + pirq
      */
-#if PIIX_NUM_PIC_IRQS * PIIX_NUM_PIRQS > 64
+#if ISA_NUM_IRQS * PIIX_NUM_PIRQS > 64
 #error "unable to encode pic state in 64bit in pic_levels."
 #endif
     uint64_t pic_levels;
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index e1d9049b3a..9eb45810de 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -52,7 +52,7 @@ static void piix3_set_irq_level_internal(PIIX3State *piix3, int pirq, int level)
     uint64_t mask;
 
     pic_irq = piix3->dev.config[PIIX_PIRQCA + pirq];
-    if (pic_irq >= PIIX_NUM_PIC_IRQS) {
+    if (pic_irq >= ISA_NUM_IRQS) {
         return;
     }
 
@@ -66,7 +66,7 @@ static void piix3_set_irq_level(PIIX3State *piix3, int pirq, int level)
     int pic_irq;
 
     pic_irq = piix3->dev.config[PIIX_PIRQCA + pirq];
-    if (pic_irq >= PIIX_NUM_PIC_IRQS) {
+    if (pic_irq >= ISA_NUM_IRQS) {
         return;
     }
 
@@ -87,7 +87,7 @@ static PCIINTxRoute piix3_route_intx_pin_to_irq(void *opaque, int pin)
     int irq = piix3->dev.config[PIIX_PIRQCA + pin];
     PCIINTxRoute route;
 
-    if (irq < PIIX_NUM_PIC_IRQS) {
+    if (irq < ISA_NUM_IRQS) {
         route.mode = PCI_INTX_ENABLED;
         route.irq = irq;
     } else {
@@ -119,7 +119,7 @@ static void piix3_write_config(PCIDevice *dev,
 
         pci_bus_fire_intx_routing_notifier(pci_get_bus(&piix3->dev));
         piix3_update_irq_levels(piix3);
-        for (pic_irq = 0; pic_irq < PIIX_NUM_PIC_IRQS; pic_irq++) {
+        for (pic_irq = 0; pic_irq < ISA_NUM_IRQS; pic_irq++) {
             piix3_set_irq_pic(piix3, pic_irq);
         }
     }
-- 
2.39.2


