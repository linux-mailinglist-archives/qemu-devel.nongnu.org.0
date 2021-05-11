Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1801C379E0C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 06:09:48 +0200 (CEST)
Received: from localhost ([::1]:48636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgJiN-0001ND-6k
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 00:09:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgJfF-000557-4X; Tue, 11 May 2021 00:06:33 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:34711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgJfD-0007XG-Iz; Tue, 11 May 2021 00:06:32 -0400
Received: by mail-ej1-x62f.google.com with SMTP id a4so27713105ejk.1;
 Mon, 10 May 2021 21:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vTOhIEGU5UoKl+u/lDdl0FTttUH09wWLJNYzcl7Zsfg=;
 b=dHpTl3xAYidxrCUoyx6Ajsu//Xa2dKaEYXs5yoMyWbGwS5hjzfd9WDllcq0HTzDThn
 cp7gbHdO5w5Qp/12BUx/58ilasNm2HxZMHy7u8SBH6e3xoY0laBlv3TxKypHq7BNYTgQ
 ywcBuTyikZgVB3vQ56fC8P72TQuCWQ15+/dcSTIu5pUHQVQq7cYQYfbXbItxtD9thGzc
 S87SUDP92gKm3qUylBqLU2trdctUz3QN0ju1nAz8pZhH3O5WfNCyd4PJqI8Lzo0GBv3I
 gH2MGd2d/Umvm3fM20fo0KAu1cQ0g7691C4h94gsmwej74IPlSi+1JksLfpBHHULXJiB
 yemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vTOhIEGU5UoKl+u/lDdl0FTttUH09wWLJNYzcl7Zsfg=;
 b=uG3TAKzuVmvuvlMR8nnMS5QmtxeT1Y1O48OBQLtpcoGY6WCzAAXueL2++ewwP+tzOq
 BYHJSRyjfuK87KKk+5h5yTFKS2UGGrT8mOjjAnNm0RhtRFXdnLt6Z7L7lUKLl/isOWCV
 0jKcjurogXou/bjQKTRvyzQU5ay5W7LlHZQ/igGb76VW3/Rk3rOQrvVzPfBNNj8OM8iG
 8ZmgNBUdgFo0UrsQgVj1EG7CUvqBSfmuOcLYpKIW7Qi25h5B+pT12LnmXTlEgpaobV0I
 jDc4Kueft1lNteYwrnM/DbUoBuqU6aDAryeeCpNBdwhuf1HkRoAbI0cGihHVCx/hNZ2x
 yemw==
X-Gm-Message-State: AOAM531A+bMpnJQbIXw6R9lO8MLfsyKWoFDSJS6muOpKiXvDUOZ4f0nw
 QJY+CnK29f2po8k4IGUK+Qs6brMRY6lhoQ==
X-Google-Smtp-Source: ABdhPJzRpRzy0BHkYJ/K5GzCNL7y+GeYrU41iS4lJ3ebUKAjPf6W2T/9XG8wjPvdOKll9PZ0XspbvQ==
X-Received: by 2002:a17:906:91d3:: with SMTP id
 b19mr29404573ejx.242.1620705989724; 
 Mon, 10 May 2021 21:06:29 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id w6sm7668282edc.25.2021.05.10.21.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 21:06:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] hw/isa/i82378: Name output IRQ as 'intr'
Date: Tue, 11 May 2021 06:06:18 +0200
Message-Id: <20210511040621.2736981-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210511040621.2736981-1-f4bug@amsat.org>
References: <20210511040621.2736981-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62f.google.com
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

Named IRQs are easier to understand in the monitor.
Name the single output interrupt as 'intr'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/i82378.c | 2 +-
 hw/ppc/prep.c   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/isa/i82378.c b/hw/isa/i82378.c
index 2a2ff05b937..fd296c8ed7a 100644
--- a/hw/isa/i82378.c
+++ b/hw/isa/i82378.c
@@ -113,7 +113,7 @@ static void i82378_init(Object *obj)
     DeviceState *dev = DEVICE(obj);
     I82378State *s = I82378(obj);
 
-    qdev_init_gpio_out(dev, s->out, 1);
+    qdev_init_gpio_out_named(dev, s->out, "intr", 1);
     qdev_init_gpio_in(dev, i82378_request_pic_irq, 16);
 }
 
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index acfc2a91d8e..f19ec612956 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -280,8 +280,8 @@ static void ibm_40p_init(MachineState *machine)
 
     /* PCI -> ISA bridge */
     i82378_dev = DEVICE(pci_create_simple(pci_bus, PCI_DEVFN(11, 0), "i82378"));
-    qdev_connect_gpio_out(i82378_dev, 0,
-                          cpu->env.irq_inputs[PPC6xx_INPUT_INT]);
+    qdev_connect_gpio_out_named(i82378_dev, "intr", 0,
+                                cpu->env.irq_inputs[PPC6xx_INPUT_INT]);
     sysbus_connect_irq(pcihost, 0, qdev_get_gpio_in(i82378_dev, 15));
     isa_bus = ISA_BUS(qdev_get_child_bus(i82378_dev, "isa.0"));
 
-- 
2.26.3


