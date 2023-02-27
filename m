Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 711EA6A4306
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 14:37:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWdeV-00056e-Lo; Mon, 27 Feb 2023 08:34:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWddv-0004zd-Jf; Mon, 27 Feb 2023 08:34:24 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWddr-0007fQ-Tl; Mon, 27 Feb 2023 08:34:14 -0500
Received: by mail-ed1-x52b.google.com with SMTP id d30so25862945eda.4;
 Mon, 27 Feb 2023 05:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RwQ27/eMfpymF6hg7GwyOuyo/R5GZYPcbaoXe8Jhs2M=;
 b=Eda89c4sgPoJgXV9spOiekecADfiDs3tSE3TgzIwiTx6w96kWXgWQB3IkbNSOEKxdJ
 265g41pFrxfWSS1/LItH+8LQ8evxtGMs2ZpNkLFXjb+6TvEZTr4N+97u4q8dGQSfkLC4
 VbeQJnPbChu3Q1oDu4FJv2y7QsY8o9rAmz/z7tePntNQ1RwEqb4fNA2rYOj4fUHOHFUo
 H3140RCOKk83tMXxe6YwFyv8nV5WigPQtDQTTQ+KVRJtDwBYGINkwrcRyEJlsqfEo2GG
 3ERYG0i8cNUBdSf4Ge0krQ2hPDAezpn/hZlZSAAMrCdIKAi3hzlBnaIaXOb08LEKYE/J
 P1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RwQ27/eMfpymF6hg7GwyOuyo/R5GZYPcbaoXe8Jhs2M=;
 b=uxf4a/iRwTRl/WimF9E+0TD8cV718H9KyU/aKDhRib1hxpTABa5d1sD5XwBKCueeqM
 wbZMAvM55B8qcHYpoAn+tUE2YBVYN5l4rN9BLC8CKK1jkeNC560r7KnIihlJvafIFA/3
 8FTRi7X7chsBXcS9s7MK+RqKmqL0HpoPSkSnEg5jAz6jGYAbzBi9pZUYXGhbZMFHN9Zt
 ivgqRtPlAf8bzrGJzUKJ9sCjywYxbVYlFaEYDthkVdMChg4NWp64rlwOiMewM3ceyzaK
 UM81zxv+xFFMWBA+pErLzQ7TqTFvvYPf5iAMaK/OcrE5QhT+L0vNdoxtp6N4VABCFtUW
 JDjw==
X-Gm-Message-State: AO0yUKVho4biNIkK3/Z0J5Y81zXSw2qr25x1b3pFC5U01LyY9keWrg3s
 DYftkXUfwr6a8c84V9xeSykikOpf2Gw=
X-Google-Smtp-Source: AK7set/l2NHybf/7arOh49ZKiCr9WS9sdGHb3H2naAMUxfgW0xiZkOifPR6eOacgxgkUtZuMouzj/w==
X-Received: by 2002:a17:906:80d6:b0:87f:89f2:c012 with SMTP id
 a22-20020a17090680d600b0087f89f2c012mr35124909ejx.24.1677504840997; 
 Mon, 27 Feb 2023 05:34:00 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-154-008.78.55.pool.telefonica.de. [78.55.154.8])
 by smtp.gmail.com with ESMTPSA id
 gx16-20020a1709068a5000b008b69aa62efcsm3253603ejc.62.2023.02.27.05.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 05:34:00 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Huacai Chen <chenhuacai@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Rene Engel <ReneEngel80@emailn.de>
Subject: [PATCH v4 4/7] hw/isa/vt82c686: Declare gpio inputs so it can be
 connected in board code
Date: Mon, 27 Feb 2023 14:33:22 +0100
Message-Id: <20230227133325.22023-5-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230227133325.22023-1-shentey@gmail.com>
References: <20230227133325.22023-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: BALATON Zoltan <balaton@eik.bme.hu>

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Tested-by: Rene Engel <ReneEngel80@emailn.de>
---
 hw/isa/vt82c686.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 7aea97365f..84b5c5e64f 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -653,6 +653,7 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     int i;
 
     qdev_init_gpio_out(dev, &s->cpu_intr, 1);
+    qdev_init_gpio_in_named(dev, via_isa_set_pci_irq, "pirq", PCI_NUM_PINS);
     isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
     isa_bus = isa_bus_new(dev, pci_address_space(d), pci_address_space_io(d),
                           errp);
-- 
2.39.2


