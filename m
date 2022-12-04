Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28583641F13
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 20:09:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1uL9-00020Z-5K; Sun, 04 Dec 2022 14:07:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uL7-0001zs-GQ; Sun, 04 Dec 2022 14:07:49 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uL5-0001ey-Ul; Sun, 04 Dec 2022 14:07:49 -0500
Received: by mail-ed1-x52f.google.com with SMTP id z92so13113585ede.1;
 Sun, 04 Dec 2022 11:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c8grMbME18Qpbp0IUFjkcz55as3asZan9rfItqTASvQ=;
 b=cwK35B56DokNxXbHnhc4ffWGBR8pyg9qtPEmfO16CgswT4i+jDgqzkMip4IZipc/+W
 GQpOlCS2BJhIfa7wZ+0h1nsQo/DpsEVErVJKsT5SnU3mM8rsMW0CYxIo8Wc4cq3tgkEW
 pM2nmIlAhzpt3tLeiUks0DdLxqbFN9rwhL2kXi/giUdGKhMo2P4YSXTkFrPLhHWhuved
 kEc8IzZjcb0uywcnbMXxEGqxXgcjLdXYxjMlROijFI73luOEff0B4b6j/809SX0vaqsi
 Wap5st/r31uzcTlmIyAfmFUOwVHTa8BVv2xXmg37m7JpT0WKwPUaeAV0qumNZKW5BUYO
 LATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c8grMbME18Qpbp0IUFjkcz55as3asZan9rfItqTASvQ=;
 b=gdqOXAbRC1CYbTg4Z1x3MDrMU0S7M6blky+leYfjA+UK7y48uyo5xQ5lsix8diEHkK
 E7/qx5nH3E1sNO+2Fqk4+vuNIFiYktmPK3IMEAxewQ5XfOsfldxCIfhKd5R4bxV/me6c
 ksSDdD0iS8qym9XDOYZP6EeXEbWTI8Kfjy3y9rRGr8+iALhglICPji0QuBlX2DQx91Cp
 GLWDSweYgkfI1MX7F7LGno6YmYO4XICUVXJzNkarz9xhrb9dEVGJoGLCOqtLkKnVSBhA
 bhoAiZurDhgUD9rN5Bfyb6sOorrcyV46zgpl2nfVUp8hC4InL8LPToTqZgNBvZCLW2Fx
 QfUQ==
X-Gm-Message-State: ANoB5pmej6WTCIoVFzUvxxbwhLh3H+hEisdbdIWtp3BtUi6HmcP32akt
 TbPfAJc7FzXtUbjb7tzpbb+ksgRyTug=
X-Google-Smtp-Source: AA0mqf7sqpXHmMhPa0tAHWib3+OSOC3rVSKHeoMxV63HK7v2XGPip2LKkR2XhntPlAU9trUlcxZD6w==
X-Received: by 2002:aa7:c719:0:b0:46a:bfd0:f816 with SMTP id
 i25-20020aa7c719000000b0046abfd0f816mr8765398edq.277.1670180865980; 
 Sun, 04 Dec 2022 11:07:45 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-089-012-182-051.89.12.pool.telefonica.de. [89.12.182.51])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b00782ee6b34f2sm5359835ejg.183.2022.12.04.11.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 11:07:45 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 15/32] hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
Date: Sun,  4 Dec 2022 20:05:36 +0100
Message-Id: <20221204190553.3274-16-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204190553.3274-1-shentey@gmail.com>
References: <20221204190553.3274-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
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
Message-Id: <20221022150508.26830-21-shentey@gmail.com>
---
 hw/isa/piix3.c                | 8 ++++----
 include/hw/southbridge/piix.h | 5 ++---
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 0341284199..7ee706243a 100644
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
index c4e6e9f827..39c31da9ad 100644
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


