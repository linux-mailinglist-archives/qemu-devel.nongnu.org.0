Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE3D573195
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 10:52:52 +0200 (CEST)
Received: from localhost ([::1]:46840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBY72-0007sl-1C
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 04:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oBXZe-0005fF-VZ
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 04:18:24 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:38910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oBXZd-0004mw-Eg
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 04:18:22 -0400
Received: by mail-ed1-x52c.google.com with SMTP id fd6so13101247edb.5
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 01:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CtEBZbRNGv3Mai7FOzAgJwZ0F0IikxgieiRPuuAt06E=;
 b=dCrbAFU0MTFdebpwFf7Qg9CIM65Sr6ww6TZTSqdz9uaaDNsZ/sHHylf6+FID1GYsZ8
 G+cR9MdqVM+k28x9F0oCaIwiXkHvq3V7ZRrEmpH3fP3ZC0DtvE38NU3lclrDUApKfOpI
 uHAwt9bjIG+REvFnjwHVqd44oG2E9Z611f2iDbS/1ZdFUZ4fZujyWC8daCuTKUZdCQko
 t5MoW8f2VyD5m8g2LTu2ZjOKB6qkWm1dHpWHYwNgE1kbrI8cK5bLmv5HtEGMxEyU6DdP
 f8pr+rVANdmyoO1Jdg5IUXsscMZYBY3jHfGCROA5dHKQwL37IXeCS1l/Jm2/j1b5KdAu
 c3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CtEBZbRNGv3Mai7FOzAgJwZ0F0IikxgieiRPuuAt06E=;
 b=abNCZNIQh2KjQQYLNRcYQK4eVfC0cJ99ICeUJ9JOcHijrx+j4FpCGNIU1/4swDkBq6
 STfzx2bqQQ2u9OzbSyvZU8RI5/hbbNBRDZK1dyvUfCsEpM1PZwAz3GJt9ZtI/d7GTpoD
 62gRBiHvP0RyE5O88LNs4sq7ImoNXimsx7y8dL0OQ314+3GH1Tyw2EFzgx+UAiKZQeR1
 XmGWEJMPt3nV5NJM/0B8r3PQfTespySlUlKIdiebjbOAPhbi0jIgAEuQg0RE285wDq+D
 7X+oULyycySNilHJTk0CIkb7RlExu+Tg910kBQRXUX5TQP4ty9FCYn2rgIigwPwvwo8P
 4idA==
X-Gm-Message-State: AJIora/qOOqN3+Cb6JD6u//D+KgiePa917eApQAYFcVIWN4hKQAX3T2S
 DOY27975VSyrqNnXwTb7z9fc2T7TEiw=
X-Google-Smtp-Source: AGRyM1urcMIuoFLrTB3kI+8KZifwxU0xT+UkW7itnIi3cBSy0Y+QCOzvHh1e4ANWtWpOh06Fl18Kbw==
X-Received: by 2002:a05:6402:2287:b0:43b:a9d:ab1 with SMTP id
 cw7-20020a056402228700b0043b0a9d0ab1mr3045712edb.325.1657700300682; 
 Wed, 13 Jul 2022 01:18:20 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-183-210-047.77.183.pool.telefonica.de. [77.183.210.47])
 by smtp.gmail.com with ESMTPSA id
 w13-20020aa7dccd000000b00435a62d35b5sm7483431edu.45.2022.07.13.01.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 01:18:20 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 11/11] hw/isa/piix3: Remove extra ';' outside of functions
Date: Wed, 13 Jul 2022 10:17:35 +0200
Message-Id: <20220713081735.112016-12-shentey@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220713081735.112016-1-shentey@gmail.com>
References: <20220713081735.112016-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
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

Fixes the "extra-semi" clang-tidy check.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix3.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 56a741c192..3cfd6eafcd 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -442,7 +442,7 @@ static void piix3_realize(PCIDevice *dev, Error **errp)
     pci_bus_irqs(pci_bus, piix3_set_irq, pci_slot_get_pirq,
                  piix3, PIIX_NUM_PIRQS);
     pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
-};
+}
 
 static void piix3_class_init(ObjectClass *klass, void *data)
 {
@@ -477,7 +477,7 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
      */
     pci_bus_irqs(pci_bus, xen_piix3_set_irq, xen_pci_slot_get_pirq,
                  piix3, XEN_PIIX_NUM_PIRQS);
-};
+}
 
 static void piix3_xen_class_init(ObjectClass *klass, void *data)
 {
@@ -485,7 +485,7 @@ static void piix3_xen_class_init(ObjectClass *klass, void *data)
 
     k->config_write = piix3_write_config_xen;
     k->realize = piix3_xen_realize;
-};
+}
 
 static const TypeInfo piix3_xen_info = {
     .name          = TYPE_PIIX3_XEN_DEVICE,
-- 
2.37.1


