Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EFA612D60
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:31:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGnt-0008Vg-JL; Sun, 30 Oct 2022 18:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGnr-0008U8-Gu
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:29:15 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGnq-0007Af-2n
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:29:15 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 bg9-20020a05600c3c8900b003bf249616b0so7056169wmb.3
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sgob2DTV4yAjngl8pPPaS8z8Lhpa9ohpj9WgZyyzlGA=;
 b=x9XLFA0+Wtuy7mlU0e0ZVq+GaNNO+5os2SSiwXiPkpYJUrNNKRlfzWUa/PUWaiENEx
 GS6oyXWq9oKPp4R6+1vZZioiCmX/BVCDdaXm+pA0o9cKSWZkw0di8+KoVJ1w/kDGbCZP
 DGcuiKUiBa3f4R3DPeOUs8M1GffjBgqMrNVQL94f7t2X6gOH49vLffQti8e3KmWZ4vrb
 Gm+60etsVygHf2hUUkCM+evACgtnlkba4WuQ8f3gR8wFDnqDuDzAmHqqqaQ1piEHqwKW
 T6sDcOhYFem4Dd9rHVGU/fcPhG7ylUses2IL2RZu9kLX5PqFTWorzwHdRoVPFtyG+yy2
 Ad/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sgob2DTV4yAjngl8pPPaS8z8Lhpa9ohpj9WgZyyzlGA=;
 b=Amt7o4n+lHVRrifl12gbGT56cXT7/qOYKB4HNVw/iQXimVYGk6UM4Eio5xw71mmhrf
 WDnloqwbWSUeed0lOAsmqXR23qM0enrShCz7cscxqItDNoa9k8F8pVVf7u8szSlEAvc+
 dKPlBlvEcZfpLO4XrHqfpqWoAA0Ed1GR6yw8qLP26mNGKDdjhcgf5NZghIt5wbgccGES
 AFIO8bFgYxzeIzK0aF55KhqolU/kYqmdlyTQLI7lInmgpEMi7LqrjzrljtageDISgjks
 z7DzdkkrLGEmnXqAL+U3xykeK8pKYGLrLShBchF3YbKnTg+Q3K8ctVRUbHtNZZQ9BwRw
 2Oxg==
X-Gm-Message-State: ACrzQf3ycAZsVbM0aZkPjJ5VsMaVJnjfWJy1HSahlLZMNpCDt1Qvbiaa
 54C34Eaxd6lNLPv+IxPOngrleflUc1Dg+w==
X-Google-Smtp-Source: AMsMyM67AGk8y9c0osHws4tn4j7MJY7vcXi7etnWOAZqLCbyK4Iy+jDHXciARDayPRSBsHQMGzIH9g==
X-Received: by 2002:a05:600c:3594:b0:3ca:f978:5b97 with SMTP id
 p20-20020a05600c359400b003caf9785b97mr6360316wmq.64.1667168952426; 
 Sun, 30 Oct 2022 15:29:12 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h3-20020adffa83000000b0022ae401e9e0sm5209025wrr.78.2022.10.30.15.29.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:29:12 -0700 (PDT)
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
Subject: [PULL 04/55] hw/isa/vt82c686: Reuse errp
Date: Sun, 30 Oct 2022 23:27:50 +0100
Message-Id: <20221030222841.42377-5-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

Rather than terminating abruptly, make use of the already present errp and
propagate the error to the caller.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220901114127.53914-5-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 5582c0b179..37e37b3855 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -590,7 +590,12 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
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
2.37.3


