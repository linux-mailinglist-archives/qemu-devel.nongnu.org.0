Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D819346DD8
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 00:22:13 +0100 (CET)
Received: from localhost ([::1]:42592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOqLk-0002IM-DS
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 19:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOqEH-0008FI-Px; Tue, 23 Mar 2021 19:14:29 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:47013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOqEG-0004xL-8q; Tue, 23 Mar 2021 19:14:29 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 z6-20020a1c4c060000b029010f13694ba2so202289wmf.5; 
 Tue, 23 Mar 2021 16:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H3nW2fhq4tUhZ3Vvu7VChClLWULSqHl3aIZiVAgZl48=;
 b=HhD/7PiD3VuVTRqb0OsjHRj3STq4HcxELVrplIFwXwvIZrNTwwuMBw5UMRurz+OOZs
 Rj1K90t538c7lNQ/k/PD4yNCR27slQN9jRHgI8aO4T7fI8I5gVqh9edm/VzpqBw08o94
 P2nCQs6st32UTNcJxphDl/IpMtWtEnTNqwzqLFF8bpQQT9fcUq2HypTfQjhS55rLy0UZ
 6zzI8p/xm61PhvHH+eaARc74Pmh2eebwB22vFaeEifr4lP67mcNuawr41y4EMHhSXLvF
 eeKao1DjJnZqOnP0OlNVaRBD+mgYwyJlaudELv29V7/ivXX+4RiLNKeWX6d15y3/UZ6B
 R2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=H3nW2fhq4tUhZ3Vvu7VChClLWULSqHl3aIZiVAgZl48=;
 b=f6DOwxX3oZzlYQIQ6DRmkEFDPbVaqaXOXu6KprNB+2UKE+KXRyOTG+MinE3dG2UEkb
 x1MY9/B4CGNUpHzugpJgsVMv7DbRXxmF57hq6kbclUSXSXMUDD/hxN17NcnkNBgrYh0A
 Fujq3bN/O/HBf+VzLK3zsXljlmKe7MR5E3Mayl/Llvn1RspoQFdwnI1e32cC43jgz1wq
 2EuAZu0by8XnegLmgx2XOZtlmUGI60mD9BQ5b4ulpSTmvnCDB3+ljfljVWIoakaXUF6g
 jRQlfXDl0lKjVpQXjIEIJSq9u7QLnNSoCglmsWHSIHiQi7GThmae+V9DIx9Q5tl406mo
 KxHA==
X-Gm-Message-State: AOAM531mzcGb7ZTrPhm6mkjUuwe3V5WNwR3qhENwh8J9MdCOJwWMV9Wx
 mVEjeNkMRmKLcMvMTxBOBVQqq5AkSLKKVA==
X-Google-Smtp-Source: ABdhPJxsyfIQePvUJVTHBefqmzdLhI900lK1TZ6dnYJvuwKqwy+c91hPulZlKQMwn+4r3v7bn8ultA==
X-Received: by 2002:a05:600c:3556:: with SMTP id
 i22mr268581wmq.116.1616541266275; 
 Tue, 23 Mar 2021 16:14:26 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id y18sm446698wrq.61.2021.03.23.16.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 16:14:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/6] hw/isa/vt82c686: Simplify removing unuseful
 qemu_allocate_irqs() call
Date: Wed, 24 Mar 2021 00:13:57 +0100
Message-Id: <20210323231358.396520-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210323231358.396520-1-f4bug@amsat.org>
References: <20210323231358.396520-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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

Instead of creating an input IRQ with qemu_allocate_irqs()
to pass it as output IRQ of the PIC, with its handler simply
dispatching into the "intr" output IRQ, simplify by directly
connecting the PIC to the "intr" named output.

Fixes: 3dc31cb8490 ("vt82c686: Move creation of ISA devices to the ISA bridge")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 87473ec121f..3dc3454858e 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -323,12 +323,6 @@ struct VT82C686BISAState {
     SuperIOConfig superio_cfg;
 };
 
-static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
-{
-    VT82C686BISAState *s = opaque;
-    qemu_set_irq(s->cpu_intr, level);
-}
-
 static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
                                    uint32_t val, int len)
 {
@@ -384,14 +378,12 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
     VT82C686BISAState *s = VT82C686B_ISA(d);
     DeviceState *dev = DEVICE(d);
     ISABus *isa_bus;
-    qemu_irq *isa_irq;
     int i;
 
     qdev_init_gpio_out_named(dev, &s->cpu_intr, "intr", 1);
-    isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
     isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
                           &error_fatal);
-    isa_bus_irqs(isa_bus, i8259_init(isa_bus, *isa_irq));
+    isa_bus_irqs(isa_bus, i8259_init(isa_bus, s->cpu_intr));
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
     i8257_dma_init(isa_bus, 0);
     isa_create_simple(isa_bus, TYPE_VT82C686B_SUPERIO);
-- 
2.26.2


