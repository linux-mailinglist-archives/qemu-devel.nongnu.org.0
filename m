Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B683A346DD9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 00:23:49 +0100 (CET)
Received: from localhost ([::1]:45284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOqNI-0004WM-QN
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 19:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOqEO-0008Ns-7r; Tue, 23 Mar 2021 19:14:36 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOqEM-000519-Kp; Tue, 23 Mar 2021 19:14:35 -0400
Received: by mail-wr1-x435.google.com with SMTP id o16so22550581wrn.0;
 Tue, 23 Mar 2021 16:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HLr1p17rSNE6s/epK0X3L7qBu4x4bjdM2MOJwM+w5LU=;
 b=ClfA1bgLWGfGbOPVfZVtjNcX7qREsxwLSZEwTOEDmPd/CKjLgkjiL5VFSdO7JsdRBw
 /9EnUkW14+OnfDMVGXNdv1LhcZBy5s1B8EBLCj8+rJjbcdHPb1roSOX5jXtSv9ZtSr/1
 BKgMcDCx/KVHiaYnYGS4hY3pOraub2z9FZpHFt+osge42Lwi+ye1SYH9clWrwzYUHLo/
 m8fv3DFhT6s+kp5s2IKRecEo4bKj8s/Z1+3HloP4dVU5/oImG2VN6fNFy6ijG0ViNs5L
 1iCZZOuNz/G9RwRd4QBTGbnFNGWKIhau1DgKQMONq+bBMb7Tvjz3V9500XP8SoXBgNiX
 /TVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HLr1p17rSNE6s/epK0X3L7qBu4x4bjdM2MOJwM+w5LU=;
 b=F5ILtK1gGCkqg5GP28ZJzNo51R0knU5q6naBL+9aqN5lk912wnNZy8eV6OuUPuc1Am
 OgMyjJ5dVYaeFk5gg7ltmzu9ZZd8bvTFLIJXiu88XTN9xoqcFM7mwpEl7ERqmckFfTHc
 zN5knJWUVf0ovsoMDgAP+l6wwLpg01QHf6csfdATOdTIbupm7nXCm6XIPr0UttbNpO5D
 uskDa9333esPCdYBc/lSgZLc0UX5BZN9Sw24vWLZ/nQ+Hur/18wdNoaE7nOulrr7rki8
 R0c2JX1Qlok8w5CycHAIAszdZ6u6i+7T6VYrPHGMdx2RDBVBENkMfDGx7ZOSSUEGKgSS
 FKyQ==
X-Gm-Message-State: AOAM532aY9MfE5UlgY6VO62Ear+r/KeQp09dDOkvZ17qruQioj8uNQ/1
 g9Na92Ea8NbWxHXsifKiH7UjWA6HFTElSA==
X-Google-Smtp-Source: ABdhPJxR152TZrY7emcMOv0lahUfLo2JKSOTlHYMicM7bXla/v2LNsFvLOmazU5uWULI7oekd3uPSg==
X-Received: by 2002:a05:6000:11c1:: with SMTP id
 i1mr281494wrx.215.1616541271285; 
 Tue, 23 Mar 2021 16:14:31 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id x11sm303097wmi.3.2021.03.23.16.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 16:14:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] hw/isa/piix4: Fix leak removing unuseful
 qemu_allocate_irqs() call
Date: Wed, 24 Mar 2021 00:13:58 +0100
Message-Id: <20210323231358.396520-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210323231358.396520-1-f4bug@amsat.org>
References: <20210323231358.396520-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Huacai Chen <chenhuacai@kernel.org>, Greg Kurz <groug@kaod.org>,
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
index a50d97834c7..79ed20e2a1a 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -103,12 +103,6 @@ static const VMStateDescription vmstate_piix4 = {
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
@@ -149,7 +143,6 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
 {
     PIIX4State *s = PIIX4_PCI_DEVICE(dev);
     ISABus *isa_bus;
-    qemu_irq *i8259_out_irq;
 
     isa_bus = isa_bus_new(DEVICE(dev), pci_address_space(dev),
                           pci_address_space_io(dev), errp);
@@ -168,8 +161,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
                                         PIIX_RCR_IOPORT, &s->rcr_mem, 1);
 
     /* initialize i8259 pic */
-    i8259_out_irq = qemu_allocate_irqs(piix4_request_i8259_irq, s, 1);
-    s->isa = i8259_init(isa_bus, *i8259_out_irq);
+    s->isa = i8259_init(isa_bus, s->cpu_intr);
 
     /* initialize ISA irqs */
     isa_bus_irqs(isa_bus, s->isa);
-- 
2.26.2


