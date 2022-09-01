Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7035A9D88
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 18:53:12 +0200 (CEST)
Received: from localhost ([::1]:54390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnRH-00042B-SY
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 12:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2E-000273-0U
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:18 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:36352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2B-0001WK-7X
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:17 -0400
Received: by mail-ej1-x62c.google.com with SMTP id h5so24263079ejb.3
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=aEiXff7OiFXrmi8L5xjrdBt3NWxVbOQq4p04MAx7S14=;
 b=eNaF7sVVpjzebv4wNeYqtT54M+VxUm9kFcpisYANACYp1S/fq4rRvmuZE1RTl+P8YJ
 lbe+r++FLSO4WuGTsXIULCnDVVdidQCws4ut9FMo5O3+fQENGTtyWlTZ9vqODIPja9Jd
 8vw9JZ3Zgc8eqmw85W8FrVwgT/vBB3e1uFkrTke2BYdxw/CMWj7oOi1sA03bTiliqNEW
 Irc/PcYKNPY+kc+kMdHzR4Lf2NUvJLI+dxZOHZrhDj8yEBOAomsG57P7kKKRzlHHWd4U
 ZrROdS1kYn7oWgMkokq0GPTdoL7IVnUZt+iuFm6rG2JU4FLJb+aTXesuO2b1YeiHldjY
 P12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=aEiXff7OiFXrmi8L5xjrdBt3NWxVbOQq4p04MAx7S14=;
 b=5b+PFwNdFyEfSTQIfUMZZILqvryICpuCU6XMcpuQIH3EqFmfXdn9HLS94TqzVrDAlM
 kNfTKiiDa5NfkXr3/iMOEZX7NnweG+xGfFgMcfMThp/JXPSnEm+yGn2R3Op3+5hlOFrZ
 N2ORmRcAPafOLxDQqxIRl6+JtM25+UUKozmyUzHvVabVoyEaUu1LLfY2OFhj4rV7fJsw
 lXSt3bUkE/r3Z8HZ1A5UlbS7ci/u6XdQhyAMT+NjuR+jZ72YQ0ZNGIyt9Cag4v8XRIIQ
 imhEozKff9sY/1r+EqIJn8xmLj0nu47kwpngP8kcG6ZUoyq83YPim0f44XNO7jX3Sx/v
 Cr7Q==
X-Gm-Message-State: ACgBeo1USIukoRdoqphU7BTY18h7yD7uABkmukDBh/nqDk+uKticiYVU
 urwWyHy5/wQnZ6fSn0sr2VUGzdADBuo=
X-Google-Smtp-Source: AA6agR4KxDg2X4gR6JDn1wTARgrmMK65buDEo/8kpjA0pHxSiSUx/awH5Y92hzhV67JmWJL4ukCC8A==
X-Received: by 2002:a17:907:7fac:b0:741:4247:d856 with SMTP id
 qk44-20020a1709077fac00b007414247d856mr17782242ejc.565.1662049623761; 
 Thu, 01 Sep 2022 09:27:03 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:27:03 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 17/42] hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
Date: Thu,  1 Sep 2022 18:25:48 +0200
Message-Id: <20220901162613.6939-18-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
index a4a5f33d6e..ae1df8e73e 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -51,7 +51,7 @@ static void piix3_set_irq_level_internal(PIIX3State *piix3, int pirq, int level)
     uint64_t mask;
 
     pic_irq = piix3->dev.config[PIIX_PIRQCA + pirq];
-    if (pic_irq >= PIIX_NUM_PIC_IRQS) {
+    if (pic_irq >= ISA_NUM_IRQS) {
         return;
     }
 
@@ -65,7 +65,7 @@ static void piix3_set_irq_level(PIIX3State *piix3, int pirq, int level)
     int pic_irq;
 
     pic_irq = piix3->dev.config[PIIX_PIRQCA + pirq];
-    if (pic_irq >= PIIX_NUM_PIC_IRQS) {
+    if (pic_irq >= ISA_NUM_IRQS) {
         return;
     }
 
@@ -97,7 +97,7 @@ static PCIINTxRoute piix3_route_intx_pin_to_irq(void *opaque, int pin)
     int irq = piix3->dev.config[PIIX_PIRQCA + pin];
     PCIINTxRoute route;
 
-    if (irq < PIIX_NUM_PIC_IRQS) {
+    if (irq < ISA_NUM_IRQS) {
         route.mode = PCI_INTX_ENABLED;
         route.irq = irq;
     } else {
@@ -129,7 +129,7 @@ static void piix3_write_config(PCIDevice *dev,
 
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
2.37.3


