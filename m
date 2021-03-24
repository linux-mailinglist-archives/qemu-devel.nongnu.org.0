Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B911E347FF2
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:01:40 +0100 (CET)
Received: from localhost ([::1]:42876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP7p5-00082a-NN
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:01:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP7in-0004Po-73; Wed, 24 Mar 2021 13:55:09 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:38789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP7ih-0008SM-KF; Wed, 24 Mar 2021 13:55:06 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 m20-20020a7bcb940000b029010cab7e5a9fso1695310wmi.3; 
 Wed, 24 Mar 2021 10:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H3nW2fhq4tUhZ3Vvu7VChClLWULSqHl3aIZiVAgZl48=;
 b=HLJz6+N7z3qLzZpsOytXuudojOy7zcI46T25LK51YVPN8OFWMttecEZa4zAcKfYkYn
 eDSai13tSWTfifZPwfDrcHfpT0ZVq/5TBofvSPRp3JD++S4XYdhMQXiyqfEpfhyOw+rW
 ZUthg+vfQ01H/UHuw2ovzt6pSAEx2d7s2xcZwRzL1iPE2+MnqBcuSlVukp0oHtwKFX+R
 LLylu7jNyo3+iKjzjVTxmUD0/uyGd3JXe063eNlVof7oy4KK/AHOgZECDKlBymjUKt0j
 dkCiOZi+6b+XBQ9Z6TmV1/dF+a3v9aqbPiIhufQHZuASN+E934dza5ZbDN+J255Wtbjw
 2ymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=H3nW2fhq4tUhZ3Vvu7VChClLWULSqHl3aIZiVAgZl48=;
 b=JAhbNJtMULy9nppjh4ypOTgNfJrPNRhFPBdpeB5yeWkdSo1FUiLHgEYHW1m8yO0+LU
 +qAa1T66si4tGYwTugncWnWhI4kWX4pzFzD81mpaIGCnxJ9IU1dAmPK7hFSR0lg+sdkw
 a3BdtbeOO76f/nNqik7OxkOPfsJWozuRTxWlrGPuraIzU3pmgmHoz37pcHTdqJtTBPa7
 AUSTLbYAhMok1wSpFsSWd8QCTDfL/w7q8TFLfLmYwkyrt1pqH4n4geAIIatqqqlwVqlf
 wsrTF4GoXuojyYOfLg2YZ5VF9xDnabqnUBjPK9gYPy3c5jOh28nbJtrSSjejCfjPVHZu
 GWrg==
X-Gm-Message-State: AOAM530uKbLyNrSUYz/CVZAgpAG0AyLnyxS6aRa2HgcxqCPqUx/Vo+bd
 /bRA+QOKHVFifkXXTCy8mgNxgLpoDGDauQ==
X-Google-Smtp-Source: ABdhPJxRhE7jfH+j6IsC9LcffKswiJr4A8z1X0ONV6ij4g4Kpz4BULvp8pfcrDeV4ptiP1LKBrnIRA==
X-Received: by 2002:a05:600c:22d9:: with SMTP id
 25mr4010708wmg.108.1616608501298; 
 Wed, 24 Mar 2021 10:55:01 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id t8sm4347774wrr.10.2021.03.24.10.55.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 10:55:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] hw/isa/vt82c686: Simplify removing unuseful
 qemu_allocate_irqs() call
Date: Wed, 24 Mar 2021 18:54:34 +0100
Message-Id: <20210324175438.680310-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210324175438.680310-1-f4bug@amsat.org>
References: <20210324175438.680310-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
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


