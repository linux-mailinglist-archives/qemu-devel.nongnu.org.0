Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7803F6A8C14
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 23:43:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXrcQ-0007Ba-A2; Thu, 02 Mar 2023 17:41:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrcN-00079W-SG
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:41:43 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrcL-0008Rs-2P
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:41:43 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so2844206wms.2
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 14:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677796892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+sfyAsKb/ybApqIFl07T9s+7iUFCDW80zwk8fRCVEAE=;
 b=xu1rjB7YD8DjZWjxzi3BvlMN8UixTnVYDqagQlFTxx2InrN87xWrEjkJp069tuj7Bz
 CxCQMD6hNI2YHq+JwGw0t3NrUUBdZOipfiA3z7a7BQxVUJJOWERZehqGQvhVf8KMhQLy
 fhV/jRictU1DOTTReu77WjZBTgZGBkQ7F/JKWDhvP3VrpglK/OTY6UsET+CtU3MPGa44
 l/IUBYI2w5GPoVB9II3ocN2mXZtoAs4dxwvtJBg4Gv5sxd0k9OAMpwsTHjcPstW6z9st
 1nGVu16OalqMzqfW1utxpjSRJVc0Ypo8j5QOq23tpKOImzT5RCGXPDNWLJxbYNh9uLRt
 nB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677796892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+sfyAsKb/ybApqIFl07T9s+7iUFCDW80zwk8fRCVEAE=;
 b=Zozx7WbSyz4txfS3voJdpK2Qjs6egntBPpTt4J/x2+Ri2OTgz9fCbd5dQhuPxgK8s7
 ri/2x+q+P9P+LP4Y2tuNHI64ns3GevI9E7V559DO8mhD9NdvsKWL6sReLlVx/kBvU06S
 pGL7eDk6ym3ML9JVhOVXbH3IRScu34+cZhwfoHdhyfo3kxacUFZXHYEkfyzCIlwBfr9n
 YXBOwLhWTWDj3wOExNQXfrEzuu8sPxBAFG0XzFDPn9DUIXdqqD9R9Ywp2Z/jpC+4mQ4d
 hswb8AQD+xb39OOM1ItgvPlOepEs9yPEa0jDzk0lmmKVi71BHN8YJAuc6RIuuGDXkajD
 H3uQ==
X-Gm-Message-State: AO0yUKXeNuHS3JlDItOC2/PGyA7TjEztAwrWzTn0T5ISeIHIUfjnYfOR
 I+5lzQUkuoQNKCA5Dqp4CcM1XL6K0RTQQhxr
X-Google-Smtp-Source: AK7set8SWvk0HWg5p/Zd2njTCKsAOYJMTaC75KODxQ5MiBsOXZLVWHVmhLXt0tld7ks3knru+bb7dA==
X-Received: by 2002:a05:600c:3422:b0:3e2:20c7:6544 with SMTP id
 y34-20020a05600c342200b003e220c76544mr8899029wmp.19.1677796892714; 
 Thu, 02 Mar 2023 14:41:32 -0800 (PST)
Received: from localhost.localdomain (43.red-95-127-39.staticip.rima-tde.net.
 [95.127.39.43]) by smtp.gmail.com with ESMTPSA id
 x17-20020adfdcd1000000b002c5804b6afasm497341wrm.67.2023.03.02.14.41.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Mar 2023 14:41:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH v3 04/18] hw/isa/piix4: Wire PIIX4 IDE ouput IRQs to ISA bus
 IRQs 14/15
Date: Thu,  2 Mar 2023 23:40:44 +0100
Message-Id: <20230302224058.43315-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230302224058.43315-1-philmd@linaro.org>
References: <20230302224058.43315-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

piix4_realize() initialized an array of 16 ISA IRQs in
PIIX4State::isa[], use it to wire the IDE output IRQs.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/piix4.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index e0b149f8eb..702b458a3e 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -229,6 +229,8 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
 
     /* IDE */
     qdev_prop_set_int32(DEVICE(&s->ide), "addr", dev->devfn + 1);
+    qdev_connect_gpio_out_named(DEVICE(&s->ide), "ide-irq", 0, s->isa[14]);
+    qdev_connect_gpio_out_named(DEVICE(&s->ide), "ide-irq", 1, s->isa[15]);
     if (!qdev_realize(DEVICE(&s->ide), BUS(pci_bus), errp)) {
         return;
     }
-- 
2.38.1


