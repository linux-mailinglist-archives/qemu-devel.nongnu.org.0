Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A19946EB9DB
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 17:09:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqEpz-0001no-Rc; Sat, 22 Apr 2023 11:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqEpx-0001nP-Ks; Sat, 22 Apr 2023 11:07:42 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqEpv-00058u-4x; Sat, 22 Apr 2023 11:07:41 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-94ed7e49541so385144866b.1; 
 Sat, 22 Apr 2023 08:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682176056; x=1684768056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b8FU5hEdyUG1gEzln+YagVoC38jrfeZglvWjzJu20O8=;
 b=q3nT0FEYTML7k4HE4QPlxZf5OBN+CFrO2Rqr11Cs3wzl1xOzD4KOF00nX5prevlW31
 hRyIJ6xg83rR94fy6Y2GeDUChoPAwybmkL9J5pgzg/E76B4/P8wH8yKTyM/IRREZ5PKu
 +mMCCh4hUnzKMIVHrJy4r4bD7uGH2Ko00WLeg+ZOoXwDWCZWf01zz7WK1EBCmlCdvk42
 A8pM0YEGIj+lJ+llPb6ZqIq2yyUeOSgdKr2PbnaUKrIfbBNLFBGnR1Pj0y8GMB+Zrjue
 HnUlkl2JEcdLnm9/V2kK91IDfSJcK3ZGE1N+0tuJ+3T5FCIB40EcrmfkWVNml2PYJD8W
 kQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682176056; x=1684768056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b8FU5hEdyUG1gEzln+YagVoC38jrfeZglvWjzJu20O8=;
 b=DQ4LL9fsSfdm1+KEOyPpIxwuwMp5Bd+KBVp3EhvGd7JNBqvBhEZKeO4DH+YR1Du1Ww
 vXcUhZ3BmkQLI6L11UmkYPIWuGPJqByDLP2Bxd8LVXAY2FgcuHamvx4/ndafNBtS2RtA
 mtS03kZAULAW9KTbvHkvZhxPj3q8Ts/EsK49WX5Hd0Da1rxXnAdwRb1+TRQ4lHLnxorZ
 Aimmuk0wc/uhu2a7TUgaQRcd9E2XtQAQUjFkRuP6GRNbYrrrwmlzC3fJHfVou6/slLzf
 b+iqpmmI/fp1FSQh0oaT74nW7iVxnnv/bLtLyepktkCd8j9BfuGjqUHUe5RxpP5Bd1oP
 ITww==
X-Gm-Message-State: AAQBX9dPevRX6qvXawH4RGkwpMVz7nvBY/8MZ9pHrfhFLieQKRr/YI8Y
 G1T1yzarm/WY7MznqSYuwNxfrEP6Iz4=
X-Google-Smtp-Source: AKy350atB+0M36WkTU75VUbOflfQEjL4rLPPUgVwX0IiEzkI+ytwyDCEbsrTY26/tcaK9R1T0n1wuA==
X-Received: by 2002:a17:906:1912:b0:94e:1764:b09b with SMTP id
 a18-20020a170906191200b0094e1764b09bmr5744182eje.45.1682176056518; 
 Sat, 22 Apr 2023 08:07:36 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-191-017-015.77.191.pool.telefonica.de. [77.191.17.15])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a170906844700b0094f7b713e40sm3300108ejy.126.2023.04.22.08.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 08:07:36 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 01/13] hw/ide/pci: Expose legacy interrupts as GPIOs
Date: Sat, 22 Apr 2023 17:07:16 +0200
Message-Id: <20230422150728.176512-2-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230422150728.176512-1-shentey@gmail.com>
References: <20230422150728.176512-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Exposing the legacy IDE interrupts as GPIOs allows them to be connected in the
parent device through qdev_connect_gpio_out(), i.e. without accessing private
data of TYPE_PCI_IDE.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ide/pci.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index fc9224bbc9..942e216b9b 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -522,10 +522,18 @@ void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d)
     bm->pci_dev = d;
 }
 
+static void pci_ide_init(Object *obj)
+{
+    PCIIDEState *d = PCI_IDE(obj);
+
+    qdev_init_gpio_out(DEVICE(d), d->isa_irq, ARRAY_SIZE(d->isa_irq));
+}
+
 static const TypeInfo pci_ide_type_info = {
     .name = TYPE_PCI_IDE,
     .parent = TYPE_PCI_DEVICE,
     .instance_size = sizeof(PCIIDEState),
+    .instance_init = pci_ide_init,
     .abstract = true,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-- 
2.40.0


