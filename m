Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CAD59CBC1
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 00:52:08 +0200 (CEST)
Received: from localhost ([::1]:42506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQGH9-0003ji-Q3
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 18:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oQGA7-0003rm-Bs; Mon, 22 Aug 2022 18:44:51 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:41945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oQGA5-0007wF-QY; Mon, 22 Aug 2022 18:44:51 -0400
Received: by mail-ed1-x530.google.com with SMTP id r4so15786592edi.8;
 Mon, 22 Aug 2022 15:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=stKyWe1aP4GErtwepvDPTmPyOUKRJLsF/b+AUrVbyU4=;
 b=TD5s5qOka1o5m4GLfGGzUpDT1aAKDxmKjDCfe0/LfqvFw0Bs2vFQznTbnupsoXyOXM
 QRRALm5XJdLVkhlXxu9UwWn/17GzPUuMuikp2YTLh9Hze9SRm8j5hysr935P70NQwNrm
 APy7P0ij/P+djAQAlBmTElUBZPU04a+5cn+5aLK6JbYbriku5GEkgKabPZr7iGeQfBc7
 efo/uiCeKMZ7dzwRqyyIKaNLZuFQiy0DvdZQrRm7mKhhUjpctq2M59c2kgeq1iM5wqHX
 IIVI3tEE3IaT22TjuT6lbwKUBfuCnT08i2RJ7rx3aNNts97yEuh6WgjTqHQmuVpSZdkA
 o0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=stKyWe1aP4GErtwepvDPTmPyOUKRJLsF/b+AUrVbyU4=;
 b=4L6coTPVH/T+hejaIOeb3pOD5RAestIqs2MFqEub+09Q2/LqveYuBw0ZrQtqG82Pie
 dhUIWZJFL1yGbwNciUErwSbKFX2aDLNxmIiTJg2JiI4Wjc+nHLBCmgoOg66blApW/emD
 9H94hsUHjtKk1tMFxKNHkK9jItSC2jQzDiksJ+r8zJodTH1SOs8jiBBmFrK2y0XVgUIA
 HEv/YGQo42CtbGbn8jh+QQfLr8xVhMlLLKDFCiw/NOtAgAxDi4nrA1f4C4YK2TvK5sqz
 Gbue5atCYZQc2ACXHCKzNmWVo2flvgJTSelY7ogyolHY15Q0u+bZPagpab4mXIQg4CtL
 acGw==
X-Gm-Message-State: ACgBeo1omb3OO+yflJDCckvaRN2uiNVP8RmHH+BpOnXadK+/VfTLOZa5
 QAKrxdUYRWDf7ueDC11rWZwpcbMgPEY=
X-Google-Smtp-Source: AA6agR4YJ1eY6IGzKTbW3H90Ps1mfJ7gTRBVQ1oTmFrOwV3o1uwj/KLiVHEQpWxfi4nwKjfeDsKzPA==
X-Received: by 2002:aa7:d802:0:b0:445:e618:fae8 with SMTP id
 v2-20020aa7d802000000b00445e618fae8mr1087375edq.182.1661208287879; 
 Mon, 22 Aug 2022 15:44:47 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-183-070-107.77.183.pool.telefonica.de. [77.183.70.107])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a170906768400b0073d7b876621sm2455758ejm.205.2022.08.22.15.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 15:44:47 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 3/9] hw/isa/vt82c686: Prefer pci_address_space() over
 get_system_memory()
Date: Tue, 23 Aug 2022 00:43:49 +0200
Message-Id: <20220822224355.11753-4-shentey@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220822224355.11753-1-shentey@gmail.com>
References: <20220822224355.11753-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x530.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Unlike get_system_memory(), pci_address_space() respects the memory tree
available to the parent device.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 9d12e1cae4..5582c0b179 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -589,7 +589,7 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
 
     qdev_init_gpio_out(dev, &s->cpu_intr, 1);
     isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
-    isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
+    isa_bus = isa_bus_new(dev, pci_address_space(d), pci_address_space_io(d),
                           &error_fatal);
     s->isa_irqs = i8259_init(isa_bus, *isa_irq);
     isa_bus_irqs(isa_bus, s->isa_irqs);
-- 
2.37.2


