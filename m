Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1821059CBD2
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 00:57:24 +0200 (CEST)
Received: from localhost ([::1]:54142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQGMF-0004TK-3X
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 18:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oQGAF-0004CE-9W; Mon, 22 Aug 2022 18:44:59 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:35369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oQGAC-00080p-QN; Mon, 22 Aug 2022 18:44:58 -0400
Received: by mail-ej1-x62c.google.com with SMTP id n7so5945322ejh.2;
 Mon, 22 Aug 2022 15:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=4YQ2htG9jiUyLtO23/aR5kFL2iQ06T5w6h1p3z+Yfms=;
 b=pq35VYLpxBD5anMw58EaRV5kg8yMakrwEi8OyjR2PLstliT5lGl+Uo4ub5g23Q/Pag
 eUjZGMWZrWkXKQ0orA8NQEG8GNhT2jYNjGV7Ez3YQ5UD5c3AHaABJGP56hbIlnJM4QEN
 8BRg8COQHXHCKih9lTXOO0ZVoF5rlqpc7O0Svgvg9lg+3b1dngIe7yBaVRd8PgluRkqq
 +/Of59oe8Ca6rcLW7AnofGnndqkPwYXRsxNZNSsRJHfnEWEBK2HAqVABLnDv4TIyv8yI
 WJeodlKYiRtrJhOIJlBCRf75UeX5Q8I/3ZqAyouiR4rVwjlDJ6Coi9886aaM6du2QVtR
 vDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=4YQ2htG9jiUyLtO23/aR5kFL2iQ06T5w6h1p3z+Yfms=;
 b=1i4KdC1PAR3qp/MhmlQtHfr5a4lwbQUihNSE7lD/91ZgGpD9j/pemzfNamunKpwa8g
 repzOdLbvU5jQPKhn/RZqUqiganU+oE8NynHO1qTN3kr4nTsw1vwzlQZIaB3m/Z59LQl
 Ty7ZrtrmqSBeWYHXeDrrbaFIdwVWGkhRuu/8AInNTBdpLybL2SvDQeAYnnlc+fngp0E2
 LbSUZWPRiAT+BejJKwrwnXXV1174Y1NCilhoyAZqvNlnP9+2mt5kAv7PxWFC4Rp/5Ob2
 6FEFcWuypNgVj0TR4hrKWFcyRv1NkHTtn7Diu0/p3FyLyMfVzR+HZkCWwnhckVifvwYh
 fUOA==
X-Gm-Message-State: ACgBeo19b/SVLuTXu0eZ59oPPUlar3mNFiMNqM8yaR13fFBHwGmMq0q8
 9gaCpN+zbU7Aw940DzJGq6k95auQOKc=
X-Google-Smtp-Source: AA6agR4DNdf/lvaQ22xSRNqBkCqVnyqvsJfAENguy0TkiLPE7XZanO35MN1qblVj6kCxFLN/1S/0Ig==
X-Received: by 2002:a17:907:7e96:b0:73d:75f2:339 with SMTP id
 qb22-20020a1709077e9600b0073d75f20339mr5974097ejc.277.1661208293978; 
 Mon, 22 Aug 2022 15:44:53 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-183-070-107.77.183.pool.telefonica.de. [77.183.70.107])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a170906768400b0073d7b876621sm2455758ejm.205.2022.08.22.15.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 15:44:53 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 9/9] hw/isa/vt82c686: Reuse errp
Date: Tue, 23 Aug 2022 00:43:55 +0200
Message-Id: <20220822224355.11753-10-shentey@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220822224355.11753-1-shentey@gmail.com>
References: <20220822224355.11753-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
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

Rather than terminating abruptly, make use of the already present errp and
propagate the error to the caller.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index ee745d5d49..15aa5b39f1 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -612,7 +612,12 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     qdev_init_gpio_out(dev, &s->cpu_intr, 1);
     isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
     isa_bus = isa_bus_new(dev, pci_address_space(d), pci_address_space_io(d),
-                          &error_fatal);
+                          errp);
+
+    if (!isa_bus) {
+        return;
+    }
+
     s->isa_irqs = i8259_init(isa_bus, *isa_irq);
     isa_bus_irqs(isa_bus, s->isa_irqs);
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
-- 
2.37.2


