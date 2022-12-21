Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED976534A8
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 18:11:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p82U2-0003fg-W6; Wed, 21 Dec 2022 12:02:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82Su-0002sz-8p; Wed, 21 Dec 2022 12:01:13 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82Sr-0008Fd-Ku; Wed, 21 Dec 2022 12:01:11 -0500
Received: by mail-ed1-x532.google.com with SMTP id i9so22890496edj.4;
 Wed, 21 Dec 2022 09:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eg1AOHmdL1Cl4vboNxtnJSqnyjTIOrRgcvAXGTNsXzk=;
 b=konPZvSgi6DaQUPsBNQTSiP3O0sj6eqbOTW4ojHjNrocKusVEZLIHD5EqDlleQY3wn
 R8LZ5+zZSRWEA4I34x2jyEtaVntaV18vpdTAVJ4L1tc5WemJhpil6nTW4JhDO6Nu820o
 qUuz7TZfH3TvtThQR4lhQ8GwrDFCS2eOtV1+a72AnnoHC4ByIwejYs2ItFrpk0NgKA+C
 G2aopaN8sN+U/vSwSbRKVa24hJPd7jshn0WMBiVQiaNYu1sOhjoSlQIiuzfZ4kiNwMRU
 xKhoaVUHVrQLOtJ44jHPDI0aboWmPLRI9clIOut9JNYEJcyd6cBHhvtITSdFlRTvXOfc
 ND7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eg1AOHmdL1Cl4vboNxtnJSqnyjTIOrRgcvAXGTNsXzk=;
 b=ptDiYWMkOghMTDFKK2lXi1s1pwEEdsFAP4RFhEYFFjTs03iq+vjQRyJFhgDUds8ol7
 0ORD1ZebmZfAcLC/HYC/Ljx34WXc0rb9ca7WH6wZTbKgDEwP/19J0OH1uCeAbc6LTDr+
 cpwlXBD0NvgmK7HKEBPM33TD83C83tcvqRztCUuK86HWa+it8SRDZX/mnH6CzS5x61rC
 /50lOAjgkRNFL15t3e7rZJziZHlbV+u44kiSPRycLsvZbT6ASCVSputy6+dqZk2NtIRB
 eDNBP2Wq7B9v8xD7DWUSE49S0WD1OBodCP81CQBDKTeCV0OIomGlG2kbxjmZAYATNjnw
 TNdA==
X-Gm-Message-State: AFqh2krjMHYsSW1qBGdaXLzP7FKQvJmVTWljY1uBdJlJf4u1d4pOsUaj
 oDx2ztraodj33pbCMyitw97dVoi8M5w=
X-Google-Smtp-Source: AMrXdXs020RZ0NinIem7j8fSIJbSFtj28SJiGqPVJ4Fb5lQiY5aSrYCE/iUwHzJloNBxr/cW89XXQQ==
X-Received: by 2002:a05:6402:360f:b0:474:47ce:ee8e with SMTP id
 el15-20020a056402360f00b0047447ceee8emr2194521edb.30.1671642065522; 
 Wed, 21 Dec 2022 09:01:05 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-092-224-051-061.92.224.pool.telefonica.de. [92.224.51.61])
 by smtp.gmail.com with ESMTPSA id
 n14-20020aa7db4e000000b0047466e46662sm7204019edt.39.2022.12.21.09.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 09:01:05 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 16/30] hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
Date: Wed, 21 Dec 2022 17:59:49 +0100
Message-Id: <20221221170003.2929-17-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221170003.2929-1-shentey@gmail.com>
References: <20221221170003.2929-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x532.google.com
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
 hw/isa/piix3.c                | 8 ++++----
 include/hw/southbridge/piix.h | 5 ++---
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index c33a3faa2f..a1fd1e0d3e 100644
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
2.39.0


