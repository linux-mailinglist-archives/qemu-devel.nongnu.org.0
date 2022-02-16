Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDCA4B940F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 23:52:13 +0100 (CET)
Received: from localhost ([::1]:43326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKT9g-0000Ca-Qh
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 17:52:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKT3l-0007gZ-SG
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 17:46:05 -0500
Received: from [2a00:1450:4864:20::62c] (port=44627
 helo=mail-ej1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKT3k-0003SN-1p
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 17:46:05 -0500
Received: by mail-ej1-x62c.google.com with SMTP id p14so2524411ejf.11
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 14:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iaKovmo4xsO39tfW49QP0TWrwmj7lwWwHGNzCxhGc40=;
 b=PLyLPdVbAc0GWSDjEoJbkmxLcED3z01hnwGR1AuupIRf+3QxTqsyHM8zjIytsZ1gYc
 Vh4B/OIEtKj7ht74TLqsm0g6gsKzDZZEer5Nxj0mImSvYPBHkVHP5UPNTRsT7iIMkQMV
 IZn8utBBUsjvobBY5Vi28hobo/CXgc2zJdB0kqxhLJbqAKoS9pUh5Fq5UbbU5BZBBs1B
 CLW9MEXHj9Y9R0sP0RFnWi81Zagg9SuyygYjUtDfZOH+OoXvHCoA0MYOTbX8VMSSoA9T
 JNmYr1VawjpsMen3ewwYX62sovN4/g5GuqHj84WSGyOdLgA0HBCJrcMF+7lASIH546xf
 vxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iaKovmo4xsO39tfW49QP0TWrwmj7lwWwHGNzCxhGc40=;
 b=g/ioKiA9RNqslVR+jKj9rQ7xpfmjh7MF0SYCzMT/78X8BizU5y6WiXvNCMV73GmJ78
 avOXemGuA8i1tbg+ubKe5XVTcWRkvHGD4wKm3W9x/0CXqaYPtdM1ePY7gQl3cs9+NQJS
 ASDPKzqPB+6Jd9DTTbTtkRrUo8aLs1GahP4m5RpKZOUQFe6QVDo3rdjWk3IAvQqlNeZN
 2VRVhFeCX/ubJWFKN4pkvK99dEhMLqg2YpCZqeg3b7S4A+ITH1H07uqQzUBlzVUrOoEl
 kgYn8UqhBsG1zNaQC9WhnH3iq3OK+dWxtcJ3ep3WUIfMN8xyLBcNhq7v4Ee+iGZwmeof
 Q0Vw==
X-Gm-Message-State: AOAM530I2EInvX2Qngob0cyGGYdcAp2kbhwVINM8+u/F+AQ2knnlyEQP
 WhSNnxaEAyCmeT74clEeiJT5xd+CmJc=
X-Google-Smtp-Source: ABdhPJzDVJZwOjL+sMIMC6w8tbgIAgIrpVo75kmC0YPMslSrHDSCYNid/SMGblAYvoJTnWcyO0/DiQ==
X-Received: by 2002:a17:906:129b:b0:6b7:4609:96d8 with SMTP id
 k27-20020a170906129b00b006b7460996d8mr170042ejb.586.1645051562784; 
 Wed, 16 Feb 2022 14:46:02 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-078-054-075-152.78.54.pool.telefonica.de. [78.54.75.152])
 by smtp.gmail.com with ESMTPSA id t26sm1475820edv.50.2022.02.16.14.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 14:46:02 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/7] hw/isa/piix4: Replace some magic IRQ constants
Date: Wed, 16 Feb 2022 23:45:18 +0100
Message-Id: <20220216224519.157233-7-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220216224519.157233-1-shentey@gmail.com>
References: <20220216224519.157233-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a follow-up on patch "malta: Move PCI interrupt handling from
gt64xxx_pci to piix4". gt64xxx_pci used magic constants, and probably
didn't want to use piix4-specific constants. Now that the interrupt
handing resides in piix4, its constants can be used.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix4.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 2e9b5ccada..f876c71750 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -61,10 +61,10 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
     /* now we change the pic irq level according to the piix irq mappings */
     /* XXX: optimize */
     pic_irq = s->dev.config[PIIX_PIRQCA + irq_num];
-    if (pic_irq < 16) {
+    if (pic_irq < ISA_NUM_IRQS) {
         /* The pic level is the logical OR of all the PCI irqs mapped to it. */
         pic_level = 0;
-        for (i = 0; i < 4; i++) {
+        for (i = 0; i < PIIX_NUM_PIRQS; i++) {
             if (pic_irq == s->dev.config[PIIX_PIRQCA + i]) {
                 pic_level |= pci_bus_get_irq_level(bus, i);
             }
@@ -315,7 +315,7 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
                                NULL, 0, NULL);
     }
 
-    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, 4);
+    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
 
     return dev;
 }
-- 
2.35.1


