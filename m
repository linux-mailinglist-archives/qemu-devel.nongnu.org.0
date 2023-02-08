Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E698868E4C3
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 01:09:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPY0v-0005kI-1b; Tue, 07 Feb 2023 19:08:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPY0t-0005iO-6A
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 19:08:39 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPY0q-0008Tt-AY
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 19:08:38 -0500
Received: by mail-wr1-x434.google.com with SMTP id h16so15165199wrz.12
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 16:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fopVAIyIRlKFxEEYJZbUN+t4EvUshH8xvbQAPi6kQOU=;
 b=yXL4BqCfFe9IFC+dxPqn3+KW66QtcTHRWOM77VSC9Rub9DevrR852DDbmTbEiBUYrr
 L/x1MIzUlub5vPHWLmtJo7pooTOtlJD4oq4k/iepx2zvr560HJJgvTBm5UmaIACsntzl
 6beAE0huNHyFCBb1xpeTKyqMiF5yYYgeqY7Y+nGJMdBISPHdCvQu7q6aBSRWHv7QWW4/
 yRUpymJd+kNgCayYLKL5W/f4D6VCj5iPCgx8Nq5Uck7AIJCno4+niidtrP6mGQb3IiCj
 /D7aCXBUp8JhvAdD5yxZMaTttF9VgVu3VnomJyMZxI8tTKpXVoEC4UuaVRxdOYrxxbBn
 cZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fopVAIyIRlKFxEEYJZbUN+t4EvUshH8xvbQAPi6kQOU=;
 b=zQh4xObaIYSJzPRediSuRfBlk6bp+3HsAaiauOhk7W2IR4Br0OVsVMwXvra+lFn7TT
 IYfuRW5iBFKwc6OF1puVD/Vvl8O+Fad1w+itDqmO6f1c7cm3jKE7Sy64FC7UySl3PdaG
 PUWr6yI2GyZEAkpnWW59kT5Dk6IVzlg+Kl2iLWtOywWX/ifM4kOs9uOSsU8/eAi79Ghx
 x4s11MNrT/KFyjYgK7wyQR1cm/P7NQ/tXsz8Jgk/BR5Gn7Ll6gBSQhzKsEEHdkLGSaO3
 VhJi9VlNoFlrK8McuzCLxWphD3bC8fgCyTNsQgGE5pbwjPuSof60S1FUn07iE7FwSRTf
 uyHg==
X-Gm-Message-State: AO0yUKVCFtTPBb/0mdElioIJHyssgvDDH1IA1QODI44JOwkkkfjf7wtT
 YN5npemJv0MHs53o7KsOnFlhOAlr9H1PUj5s
X-Google-Smtp-Source: AK7set+ufZE4hqb3Rz9Hh1pIeXhnnl4GV6N1rygy7cfgwnEOE7MX6WkS0d+WQHZkDGA40oDLLTI+4w==
X-Received: by 2002:adf:fb82:0:b0:2bf:dab7:8f9f with SMTP id
 a2-20020adffb82000000b002bfdab78f9fmr3617454wrr.65.1675814893048; 
 Tue, 07 Feb 2023 16:08:13 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l4-20020adff484000000b002c3ed120cf8sm4975045wro.61.2023.02.07.16.08.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Feb 2023 16:08:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/7] hw/ide/piix: Use generic ide_init_ioport()
Date: Wed,  8 Feb 2023 01:07:41 +0100
Message-Id: <20230208000743.79415-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230208000743.79415-1-philmd@linaro.org>
References: <20230208000743.79415-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

TYPE_PIIX3_IDE is a PCI function inheriting from QOM
TYPE_PCI_DEVICE. To be able to call the ISA specific
ide_init_ioport_isa(), we call this function passing
a NULL ISADevice argument. Remove this hack by calling
the recently added generic ide_init_ioport(), which
doesn't expect any ISADevice.

Inspired-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/piix.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index a587541bb2..1cd4389611 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -136,15 +136,13 @@ static int pci_piix_init_ports(PCIIDEState *d)
         {0x1f0, 0x3f6, 14},
         {0x170, 0x376, 15},
     };
-    int i, ret;
+    int i;
 
     for (i = 0; i < 2; i++) {
         ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
-        ret = ide_init_ioport_isa(&d->bus[i], NULL,
-                                  port_info[i].iobase, port_info[i].iobase2);
-        if (ret) {
-            return ret;
-        }
+        ide_init_ioport(&d->bus[i], OBJECT(d),
+                        pci_address_space_io(PCI_DEVICE(d)),
+                        port_info[i].iobase, port_info[i].iobase2);
         ide_init2(&d->bus[i], isa_get_irq(NULL, port_info[i].isairq));
 
         bmdma_init(&d->bus[i], &d->bmdma[i], d);
-- 
2.38.1


