Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8C1612D55
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:30:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGnh-0008RL-EB; Sun, 30 Oct 2022 18:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGnd-0008Qn-1a
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:29:01 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGnb-00079Q-IJ
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:29:00 -0400
Received: by mail-wr1-x432.google.com with SMTP id cl5so2012992wrb.9
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O/ZLYSk+OjcEsO3vBVVMrJYzy07G1uKsEbRMLQcl2HQ=;
 b=WrMW5TNsSJaYTNH/LHchTmjkwGWBvgBPef4OVpwyvhHupElyx7G2jlfYUxvF2+kEOG
 NFvLzdDq0a+tyD/bgktezsCIbcl7R2PpsMVd+6AJKer7N+/A8gZF/stpJ+qm7vKFlYEj
 qSsJFepemLGN+EA4zVT32V1BbPgDG+z9q87/kTgG8UgEqtu8Fu7PMAsGukSBB7nM67Uu
 KmfyL6xzFRadmJqq4PGmuQ7SbGjeYrRdQC1WhoLyE1KyK4X1Q8MYJ5ciFsFnwcQd1+gz
 +ZACaOVL709vifeqclOYfqKQvM5iV+Wa9BFYgpWXMWrsL1aURlmnaxJuUqy5+t4k54zk
 /POw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O/ZLYSk+OjcEsO3vBVVMrJYzy07G1uKsEbRMLQcl2HQ=;
 b=TSS7fCTgeQjj++bs0ucbd8m5Qux7Lx4gTMlGthQ572NSWhBbQG0MqI64IKNawCp1j2
 cx4Ex5X/V08oPRhvlioN1nDEq5s9/nrEkaymdEzbmbtCJ1CHjZPENiJuOKBtSVCrPySk
 BkvHHwqrGx+kQwm0mziCWu1G5ghB0tXEbffI2Zc+ZYStWIKV/4bGBkmK0ViiMUDo9yuG
 sEfXTUtvnfqsBrznEK8/o8OniGRjTxDrjumLZFn2unltDlopWymap4A8WLUmP7Rnl9e5
 ZahnjzYaWc29qirIhiveBEdEg8NO5BPph6YODTDjx3KG93Cok+0AuVSvi4QMTAj/2lmb
 bTaQ==
X-Gm-Message-State: ACrzQf0icUHgS9L2GcZEMJbJRzLAoJQ557crEJVTEdwJl+cVTdvbM+XX
 Z0A1mmGX9u0G+7Hd5rR8Ki9JEooN3TAd7A==
X-Google-Smtp-Source: AMsMyM7mOh06WFiH+tKfYZzS4KG3rkDlDETZB1mEHNGivgg/7ED1vDh2oLBgiila6DkZf8ewXUcxTw==
X-Received: by 2002:a5d:6a81:0:b0:236:65a0:e7d9 with SMTP id
 s1-20020a5d6a81000000b0023665a0e7d9mr6048643wru.327.1667168938669; 
 Sun, 30 Oct 2022 15:28:58 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c444b00b003c70191f267sm5460721wmn.39.2022.10.30.15.28.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:28:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 02/55] hw/isa/vt82c686: Resolve unneeded attribute
Date: Sun, 30 Oct 2022 23:27:48 +0100
Message-Id: <20221030222841.42377-3-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

Now that also the super io device is realized in the common realize method,
the isa_bus attribute can be turned into a temporary.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220901114127.53914-3-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 0217c98fe4..9d12e1cae4 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -543,7 +543,6 @@ struct ViaISAState {
     PCIDevice dev;
     qemu_irq cpu_intr;
     qemu_irq *isa_irqs;
-    ISABus *isa_bus;
     ViaSuperIOState via_sio;
 };
 
@@ -585,17 +584,18 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     ViaISAState *s = VIA_ISA(d);
     DeviceState *dev = DEVICE(d);
     qemu_irq *isa_irq;
+    ISABus *isa_bus;
     int i;
 
     qdev_init_gpio_out(dev, &s->cpu_intr, 1);
     isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
-    s->isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
+    isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
                           &error_fatal);
-    s->isa_irqs = i8259_init(s->isa_bus, *isa_irq);
-    isa_bus_irqs(s->isa_bus, s->isa_irqs);
-    i8254_pit_init(s->isa_bus, 0x40, 0, NULL);
-    i8257_dma_init(s->isa_bus, 0);
-    mc146818_rtc_init(s->isa_bus, 2000, NULL);
+    s->isa_irqs = i8259_init(isa_bus, *isa_irq);
+    isa_bus_irqs(isa_bus, s->isa_irqs);
+    i8254_pit_init(isa_bus, 0x40, 0, NULL);
+    i8257_dma_init(isa_bus, 0);
+    mc146818_rtc_init(isa_bus, 2000, NULL);
 
     for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
         if (i < PCI_COMMAND || i >= PCI_REVISION_ID) {
@@ -604,7 +604,7 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     }
 
     /* Super I/O */
-    if (!qdev_realize(DEVICE(&s->via_sio), BUS(s->isa_bus), errp)) {
+    if (!qdev_realize(DEVICE(&s->via_sio), BUS(isa_bus), errp)) {
         return;
     }
 }
-- 
2.37.3


