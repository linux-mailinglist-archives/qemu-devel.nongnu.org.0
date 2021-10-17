Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA035430CDC
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 01:14:42 +0200 (CEST)
Received: from localhost ([::1]:43224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcFMX-0000zo-Qt
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 19:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF2f-0005Xh-D8
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:54:09 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF2d-0000oA-Qb
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:54:09 -0400
Received: by mail-wr1-x432.google.com with SMTP id u18so37967435wrg.5
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 15:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V8ZpI5eO1h5iZyQqojzaX5rdJOdSqouiAi2NLl6N19U=;
 b=i8K4MIUhuL69gV0amn+Bu5Engg+HX4IJp3tuegO4JN/zRQRaGD5AnSytXDTEd0tZId
 Wdreg05TApJhy5S/miE6XcPJ2o1VLm0BYgr2pAv02FRIwfqxzIPJ54epu9M3Gq/G5Gsb
 tUBgbqgw9UNJmMEI/a3Ub/XmK309kNkSkWTtWvJJbRt2QgVKYtzOZwYrikqPABqhRttB
 eC+TZjT21iELb9q+T3OorZ/PJl6x24QReN6BWLuRzPmTnlsB7o8yHUGL8aqjWYCwAUtO
 dHEK82P6ElcfqqMAqysqbkDqolt6SZ57BRijzsiB/+j4Zd0fLAgGwvaCBWbwSjHI4aP5
 TYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=V8ZpI5eO1h5iZyQqojzaX5rdJOdSqouiAi2NLl6N19U=;
 b=jW8nDb6DSxykkt15J1FSI10ujObDTJFKD58XVaeeqLXlYDz+amPrxLaNdww5cOYFtA
 mUk9GM6k9cfMbPS1EoTHC3YRN7VmHZmZa9b5VZILamQW9zV7vvz4Co/NyNTSyVUCpUN2
 GGwiOnW+IQQBKxclmLOVynYdo1EzUvN3CjcjniBkpRGhvC7Iq5T+1myfVrj+1qMiLEjz
 ufOSTvTczf4KItq0SNZ9E2QK/a9fQMTy5/C+ozn6NntQP4HTEtBnwap8V2VUZKX39ucq
 GgGFkNqcmOwlESIncUX1lGZEoNPN/zxG3M4DmnY9HNt34rw8HF354bkeTztcF8eD9YiX
 x3mQ==
X-Gm-Message-State: AOAM533wgwPskD7ZR1BdUA51zDunEFZryWL8Vt1PfxPqbd8Ce6wzlhV3
 jOgbQbA0sNQjWhwypi7N3WNtchWaLj4=
X-Google-Smtp-Source: ABdhPJy41G201ju9RbwW6oYBMdL7QE84d2plvvZBAFeLXzSaTAxnHQqfhYGUWJGNh6v6zD/uPMfOfw==
X-Received: by 2002:adf:a294:: with SMTP id s20mr31838342wra.34.1634511246456; 
 Sun, 17 Oct 2021 15:54:06 -0700 (PDT)
Received: from x1w.. (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id p8sm10491575wmg.15.2021.10.17.15.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 15:54:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/17] vt82c686: Add a method to VIA_ISA to raise ISA interrupts
Date: Mon, 18 Oct 2021 00:52:44 +0200
Message-Id: <20211017225245.2618892-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211017225245.2618892-1-f4bug@amsat.org>
References: <20211017225245.2618892-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Other functions in the VT82xx chips need to raise ISA interrupts. Keep
a reference to them in the device state and add via_isa_set_irq() to
allow setting their state.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <778c04dc2c8affac060b8edf9e8d7dab3c3e04eb.1634259980.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/isa/vt82c686.h |  4 ++++
 hw/isa/vt82c686.c         | 10 +++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
index 0f01aaa4710..56ac141be38 100644
--- a/include/hw/isa/vt82c686.h
+++ b/include/hw/isa/vt82c686.h
@@ -1,6 +1,8 @@
 #ifndef HW_VT82C686_H
 #define HW_VT82C686_H
 
+#include "hw/pci/pci.h"
+
 #define TYPE_VT82C686B_ISA "vt82c686b-isa"
 #define TYPE_VT82C686B_PM "vt82c686b-pm"
 #define TYPE_VT8231_ISA "vt8231-isa"
@@ -8,4 +10,6 @@
 #define TYPE_VIA_AC97 "via-ac97"
 #define TYPE_VIA_MC97 "via-mc97"
 
+void via_isa_set_irq(PCIDevice *d, int n, int level);
+
 #endif
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 5b41539f2cd..8f656251b8d 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -542,6 +542,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(ViaISAState, VIA_ISA)
 struct ViaISAState {
     PCIDevice dev;
     qemu_irq cpu_intr;
+    qemu_irq *isa_irqs;
     ISABus *isa_bus;
     ViaSuperIOState *via_sio;
 };
@@ -567,6 +568,12 @@ static const TypeInfo via_isa_info = {
     },
 };
 
+void via_isa_set_irq(PCIDevice *d, int n, int level)
+{
+    ViaISAState *s = VIA_ISA(d);
+    qemu_set_irq(s->isa_irqs[n], level);
+}
+
 static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
 {
     ViaISAState *s = opaque;
@@ -584,7 +591,8 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
     s->isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
                           &error_fatal);
-    isa_bus_irqs(s->isa_bus, i8259_init(s->isa_bus, *isa_irq));
+    s->isa_irqs = i8259_init(s->isa_bus, *isa_irq);
+    isa_bus_irqs(s->isa_bus, s->isa_irqs);
     i8254_pit_init(s->isa_bus, 0x40, 0, NULL);
     i8257_dma_init(s->isa_bus, 0);
     mc146818_rtc_init(s->isa_bus, 2000, NULL);
-- 
2.31.1


