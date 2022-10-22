Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 148E36099E3
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 07:37:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omhI4-0006Ri-7v
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 16:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5G-0007EF-5W; Sat, 22 Oct 2022 11:06:46 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5E-0002Ex-J3; Sat, 22 Oct 2022 11:06:45 -0400
Received: by mail-ed1-x535.google.com with SMTP id l22so16106274edj.5;
 Sat, 22 Oct 2022 08:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ABmoX0NxCwxVmKp1ogPkbw+xGj88SbGX6PhBV12lAkI=;
 b=Hj1r6vCYrRgRLGftTqdV8mqQ5+d8m3zR+8PFc0unkbeARj7GhTp7bxv//2xmxKHLsA
 GpEO61Z8cDjv5a46yKiB/P4BgbS2QR+QJL3DFfEZ+sFlJjE8JQqjwmSqfPP04CcNSGwI
 AZUGYQ4CqiBAQG+64/8MM493yG/KkqDj81+oHrxht7qhwdwMrelWf45XZojnsV+IfnYm
 PVrNI4EOqVj+bzWtLwQNO2Zw00iCMvn+jOx2j0DJKOBahJVpQ4szAc6yzc9ErSd06FM1
 mgYTGht9WsyuoQT1W16xPBUYOX5xFqPsB8I++C/bsDemLcq5M7OCWsH0kRqKGVF53g5P
 sJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ABmoX0NxCwxVmKp1ogPkbw+xGj88SbGX6PhBV12lAkI=;
 b=NnTwLkuEto2XufcutwdkhBbPL3hf5J/bsaHS5CJ9j+9UjyUv6tsURm5Lrvbq3H6uKE
 Q63gZoEFht6LGTye2wkL2tLyk7Y8mwP0u15ig7YQtSH6uhwuLQVcVA65AzGycm8TCABg
 FrRHaNGvP3lx6WA3+o/rgTy4OmWjmkWc4P1qJ2r49nij8z+pTXUpaiH1ns94KGslk49e
 kDz/OqoasFKot66Tc0glvXP8W5UMut8DgMK97x3RsGOi8R5dgsPpqrxMuNkgGgvgDWez
 mK8z0zEhJwwLXqtoebCytU2KKYo5Vj3tvs3yS1LMLP2JzMljI0jccXlJ9BxZZafYVQ0U
 w4Cw==
X-Gm-Message-State: ACrzQf1XX5/qBGExVhKMBHiSi8D5TySHXeHGeHJR9KamlaHkevox5UGr
 YA4SyZKuocfXd7/7An8w5+G0nAXqlcAGwg==
X-Google-Smtp-Source: AMsMyM6I/XKIOIh/lSprscY5F8mcom6fQ6I5XDltI1DCG7/9Ox8WcrcgiMy6+xFvm1zhYTLIyYCvOA==
X-Received: by 2002:a05:6402:144a:b0:461:8e34:d07b with SMTP id
 d10-20020a056402144a00b004618e34d07bmr1390756edx.426.1666451202464; 
 Sat, 22 Oct 2022 08:06:42 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:06:41 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 20/43] hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
Date: Sat, 22 Oct 2022 17:04:45 +0200
Message-Id: <20221022150508.26830-21-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PIIX_NUM_PIC_IRQS is assumed to be the same as ISA_NUM_IRQS, otherwise
inconsistencies can occur.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix3.c                | 8 ++++----
 include/hw/southbridge/piix.h | 5 ++---
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index c6a8f1f27d..9de7287589 100644
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
 
@@ -98,7 +98,7 @@ static PCIINTxRoute piix3_route_intx_pin_to_irq(void *opaque, int pin)
     int irq = piix3->dev.config[PIIX_PIRQCA + pin];
     PCIINTxRoute route;
 
-    if (irq < PIIX_NUM_PIC_IRQS) {
+    if (irq < ISA_NUM_IRQS) {
         route.mode = PCI_INTX_ENABLED;
         route.irq = irq;
     } else {
@@ -130,7 +130,7 @@ static void piix3_write_config(PCIDevice *dev,
 
         pci_bus_fire_intx_routing_notifier(pci_get_bus(&piix3->dev));
         piix3_update_irq_levels(piix3);
-        for (pic_irq = 0; pic_irq < PIIX_NUM_PIC_IRQS; pic_irq++) {
+        for (pic_irq = 0; pic_irq < ISA_NUM_IRQS; pic_irq++) {
             piix3_set_irq_pic(piix3, pic_irq);
         }
     }
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index df3e0084c5..ae3b49fe93 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -32,7 +32,6 @@
  */
 #define PIIX_RCR_IOPORT 0xcf9
 
-#define PIIX_NUM_PIC_IRQS       16      /* i8259 * 2 */
 #define PIIX_NUM_PIRQS          4ULL    /* PIRQ[A-D] */
 
 struct PIIXState {
@@ -44,10 +43,10 @@ struct PIIXState {
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
-- 
2.38.1


