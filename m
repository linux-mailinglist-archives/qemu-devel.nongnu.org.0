Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 896D2379E09
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 06:08:57 +0200 (CEST)
Received: from localhost ([::1]:47016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgJhY-0000Go-LP
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 00:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgJfY-0005rI-3J; Tue, 11 May 2021 00:06:52 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:45836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgJfW-0007mP-MN; Tue, 11 May 2021 00:06:51 -0400
Received: by mail-ej1-x631.google.com with SMTP id ga25so1882226ejb.12;
 Mon, 10 May 2021 21:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gLqOqZ9/hNVipazCBPM8wCatNmUEkk15tp7chFUl0Jg=;
 b=UQAMwbCP7+T+EnFzUnwkvL7/cR8cW7w7k4/L6KqF7VwlYIheEkDSjn8a7rbF3AKwF2
 T86v0JEFRfiipHfGDv4/rf6Bs5vO5FnAwheyFwhHcdI5Tsf78kLswFD6wolU8wHRu8wI
 baBzSZLmTNkKkTvK7HdppOFXKR7ztdy/Fe2OypNxU3+phCprX8d6ELrUEqrEA34j4tP9
 8HlCaov1B3tS8aSp6hRncxoDY/zO9RN1mTjqQAxJQVREqvNnkSsmRY4WEyJrivXPtvUD
 g/jLd5gdMKoh7gyEEGlqNoMACkaqpsCQwznhXRzjXsEa7nYueC4QooBWIHVNcE4ff/k6
 WYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gLqOqZ9/hNVipazCBPM8wCatNmUEkk15tp7chFUl0Jg=;
 b=Xynb+la47Y2T+JURixgHBBYDJ57iiVQiuANeSksd0COChf6iN0YvVw/R2yy1loAvox
 tdHywY2lNheW1/2ZvQY+HlTsPNvOpTk9BZucha+1HQfjbXFLfZWuRuyxsGNwWA9Ob1vL
 H8FhaoJ2+DdHI6pQxrXL3dzuEooPXoE8bDY1TfRIQylVbd586dF4Qma/QAAgQjHkbNq5
 zb3L4HyZ7nUF9bK5imPSMWMDaXbz9Yk41uxrkze7d2GtjOldiiM2iPwxROwI8zElEpTt
 8bZmXmB/lJIVgP8+RTJQD+VQhg+DJWNFMJOvkLiXL6Eid/lLJ8f92ErORkFvnz5smiwu
 zmsQ==
X-Gm-Message-State: AOAM5305K4c74JIfRCN+nx9uI97IG0VC1DugfYv9LuiqoJqUaVZZdLJ9
 p8zSXPpPi6UsGynyAOv0U9fjnsyf5ZSLdQ==
X-Google-Smtp-Source: ABdhPJxJ+7S64RfbRelSEWDQMfKj5Bs6NFybyZYbMhL8q/AvHd1OEkHrAAg/8aP0lSDcrnIBguKUrQ==
X-Received: by 2002:a17:907:2cc1:: with SMTP id
 hg1mr29978183ejc.453.1620706008834; 
 Mon, 10 May 2021 21:06:48 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id a24sm13380584edr.74.2021.05.10.21.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 21:06:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] hw/isa/piix4: Fix leak removing unuseful
 qemu_allocate_irqs() call
Date: Tue, 11 May 2021 06:06:21 +0200
Message-Id: <20210511040621.2736981-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210511040621.2736981-1-f4bug@amsat.org>
References: <20210511040621.2736981-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We locally create an input IRQ with qemu_allocate_irqs() to
pass it as output IRQ of the PIC, but its handler simply dispatch
into another of our output IRQ ("intr" output).

Simplify by directly connecting the PIC output to our "intr"
output.

This fixes when using QEMU built with --enable-sanitizers:

  ==338425==ERROR: LeakSanitizer: detected memory leaks

  Direct leak of 8 byte(s) in 1 object(s) allocated from:
    #0 0x5641b361e1df in malloc (qemu-system-mips+0x1b201df)
    #1 0x7f995e683958 in g_malloc (/lib64/libglib-2.0.so.0+0x58958)
    #2 0x5641b5558e36 in qemu_allocate_irqs hw/core/irq.c:66:12
    #3 0x5641b4161817 in piix4_realize hw/isa/piix4.c:171:21
    #4 0x5641b42f077a in pci_qdev_realize hw/pci/pci.c:2114:9
    #5 0x5641b554c802 in device_set_realized hw/core/qdev.c:761:13
    #6 0x5641b5578458 in property_set_bool qom/object.c:2257:5
    #7 0x5641b55709e2 in object_property_set qom/object.c:1402:5
    #8 0x5641b55861c9 in object_property_set_qobject qom/qom-qobject.c:28:10
    #9 0x5641b5571831 in object_property_set_bool qom/object.c:1472:15
   #10 0x5641b55410fd in qdev_realize hw/core/qdev.c:389:12

Fixes: 078778c5a55 ("piix4: Add an i8259 Interrupt Controller as specified in datasheet")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix4.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 0fe7b69bc4c..a16f7a3ef94 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -115,12 +115,6 @@ static const VMStateDescription vmstate_piix4 = {
     }
 };
 
-static void piix4_request_i8259_irq(void *opaque, int irq, int level)
-{
-    PIIX4State *s = opaque;
-    qemu_set_irq(s->cpu_intr, level);
-}
-
 static void piix4_set_i8259_irq(void *opaque, int irq, int level)
 {
     PIIX4State *s = opaque;
@@ -161,7 +155,6 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
 {
     PIIX4State *s = PIIX4_PCI_DEVICE(dev);
     ISABus *isa_bus;
-    qemu_irq *i8259_out_irq;
 
     isa_bus = isa_bus_new(DEVICE(dev), pci_address_space(dev),
                           pci_address_space_io(dev), errp);
@@ -180,8 +173,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
                                         PIIX_RCR_IOPORT, &s->rcr_mem, 1);
 
     /* initialize i8259 pic */
-    i8259_out_irq = qemu_allocate_irqs(piix4_request_i8259_irq, s, 1);
-    s->isa = i8259_init(isa_bus, *i8259_out_irq);
+    s->isa = i8259_init(isa_bus, s->cpu_intr);
 
     /* initialize ISA irqs */
     isa_bus_irqs(isa_bus, s->isa);
-- 
2.26.3


