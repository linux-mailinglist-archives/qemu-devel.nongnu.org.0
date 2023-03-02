Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 429FE6A8C18
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 23:44:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXrcX-0007GD-1z; Thu, 02 Mar 2023 17:41:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrcV-0007FA-Hp
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:41:51 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrcS-0008U5-PA
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:41:51 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so2819510wmb.5
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 14:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677796907;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DSE7g2BGvjGKtD0MrBQHAr8f/88wxlLX0Z9UtPjGoiE=;
 b=x8OyNtl42W3kRLnt0EIbxe7d6QFch/H29Le8lQ3VDmQbDCIPzgZi5WK1sz9gSEZjJq
 mUVK6QIzmWi7VVP8qjpa3uECzIZFbaHUndVa+HXNQazZixFa5gn2oZgqhU4eOb8M3Pz1
 /o5Of5vmRfv+RdRbP1KvV7Ej78bnLZfzW4v5Cq+jBa5XwUbeMzNXFlyagATVmykvipw0
 9aV0G7m3Ka8XHGcPG/MkSN7CO9k9A17QR42bdRVpGewQ/+O9zcXRM9iP4f7mp5cCVUhC
 QuASqTcAKk1eK+whJ/Fg4VqUCV2fBuYP5Dvso4cDkSIQiXO/dFtkolnTZCNxvc9fzv2H
 j6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677796907;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DSE7g2BGvjGKtD0MrBQHAr8f/88wxlLX0Z9UtPjGoiE=;
 b=h9VXD7eAbj/lw7T4DP/B1DmJl/zDEagNQ+OQV6d5lthDoEALttfmtlBQjlMkOyl3yY
 fE7OU4ZVkbhCrCGrE0f+ctgCiEGSHrgk19ghK2dv+FRlmkAk7W0z+aZLtAe5Qk0NDVoY
 ULrb3K3sUU4H04EVLjDioBdHaBU/ooJqnMwUinjOaUfzensiIRtd4lFIpk+xkPdg0bfG
 4gisOst0p7cCNzvm1Lp6vqkBba99LlpWDOBFQjLPdetcAr37aZwBa2MzzliFf/FKjIcG
 gL/vrw0o6wPAkh1n1fX68GPlmef2IgGr56qNn4dZrzvhGENEDZXf8Ol2oZK81MQ99VM5
 UnRA==
X-Gm-Message-State: AO0yUKVQYrCMAtax1+RGNoBe6/vAg8gAmkRzsOqQYooo/ytDnkuK7S/t
 pKYJu4VUZTX3YN6OsCqTWHx/2U9165TXlenE
X-Google-Smtp-Source: AK7set/Pe0tWpwEmAhuXUa++sIw0dBHE7X1ZbUblKTXsZJ76QFcTcF24giJac6BUF25mGMU3OPdRGA==
X-Received: by 2002:a05:600c:3583:b0:3eb:399d:ab1d with SMTP id
 p3-20020a05600c358300b003eb399dab1dmr8994045wmq.16.1677796907307; 
 Thu, 02 Mar 2023 14:41:47 -0800 (PST)
Received: from localhost.localdomain (43.red-95-127-39.staticip.rima-tde.net.
 [95.127.39.43]) by smtp.gmail.com with ESMTPSA id
 h12-20020a05600c314c00b003dfee43863fsm4595726wmo.26.2023.03.02.14.41.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Mar 2023 14:41:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org
Subject: [PATCH v3 06/18] hw/ide/piix: Ensure IDE output IRQs are wired at
 realization
Date: Thu,  2 Mar 2023 23:40:46 +0100
Message-Id: <20230302224058.43315-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230302224058.43315-1-philmd@linaro.org>
References: <20230302224058.43315-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

Ensure both IDE output IRQ lines are wired.

We can remove the last use of isa_get_irq(NULL).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/piix.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index cb527553e2..91424e5249 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -134,14 +134,17 @@ static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
     static const struct {
         int iobase;
         int iobase2;
-        int isairq;
     } port_info[] = {
-        {0x1f0, 0x3f6, 14},
-        {0x170, 0x376, 15},
+        {0x1f0, 0x3f6},
+        {0x170, 0x376},
     };
     int ret;
 
-    qemu_irq irq_out = d->isa_irq[i] ? : isa_get_irq(NULL, port_info[i].isairq);
+    if (!d->isa_irq[i]) {
+        error_setg(errp, "output IDE IRQ %u not connected", i);
+        return false;
+    }
+
     ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
     ret = ide_bus_init_ioport_isa(&d->bus[i], NULL, port_info[i].iobase,
                                   port_info[i].iobase2);
@@ -150,7 +153,7 @@ static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
                          object_get_typename(OBJECT(d)), i);
         return false;
     }
-    ide_bus_init_output_irq(&d->bus[i], irq_out);
+    ide_bus_init_output_irq(&d->bus[i], d->isa_irq[i]);
 
     bmdma_init(&d->bus[i], &d->bmdma[i], d);
     d->bmdma[i].bus = &d->bus[i];
-- 
2.38.1


