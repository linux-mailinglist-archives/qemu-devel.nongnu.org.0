Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F11795A9D4D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 18:43:39 +0200 (CEST)
Received: from localhost ([::1]:58910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnI3-0000Lr-77
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 12:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn1x-0001nZ-6I
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:01 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:35563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn1v-0001UA-1e
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:00 -0400
Received: by mail-ed1-x536.google.com with SMTP id y64so11483536ede.2
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=BMmSdP4ZZVtB54ezr9h7KI51scbR0FMH6vF9qMiRlSs=;
 b=M5xoyQq+B4UC9JlKPpaQsh3f5Ot4yjahZUg+QRu0nCCXi2fXIh0gTZk5S2+tIZIWWA
 NVtFubYDEDb0zmT6VJRFMptDvfojlSi6+gPttJ2x3W2upaDffMOiIPcEyaibTGhBs7+r
 P9jjHKCjfZ5PBIdhxPh9Yi5qkQIabev6TdJF5ookuAlyZPN++yKl6m4QoLHbqnLBiFUP
 gD7tyAP4svCKuiCgZmviDHj4JxDYsrhcvtlhB2NlL/o2cvFam2fw6V+ByuFBmknr2d/M
 taZ1O520nzK70Yxn0JWErmxCVHTRYg/NZi2q2A2EIoyYUeqgA9emRjvPSKuM+psliLtw
 5jfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=BMmSdP4ZZVtB54ezr9h7KI51scbR0FMH6vF9qMiRlSs=;
 b=nXEHmqnGnqRynpQ1VUtiUX6SVLmj1VP14VET7Q4uHqTZgrRJPbRaz0UcKiB8E03y7K
 FX/rXRGJyL4v71NQ/HJzIEg6GzpaX51+JrMggyAAeCUd9xFg7276YeqQZ1AUmrxeDKVp
 fT9wfjSwH+mVIwTgAd+kUab7JECKO6d47/IzgLxVRw+AsHhlUiZorcwAXZvNqEHLB2HZ
 N1zq61lsoX9/9yhmUPfNQJdoD5GCXJ8+vekxJkQxaONPYyS/30V6ZkkJdXPuKFP1gLKD
 de8pmC5CTg4eOvwD/zWQIDyKM3KAdO5lIskWvOM7+ByiOQfB+u4Tnq4HIe24lW165QMj
 DFkA==
X-Gm-Message-State: ACgBeo1pf20snZdIxsGtCaZaQYuUAr9y7t0qeT1FzA6A77jKso3a2rNT
 otHC3+rBJs7WaT/RJxzz+toQgkHoylA=
X-Google-Smtp-Source: AA6agR4/YWqmay54hSbUrfmVBIk0JW7ouWou6rOnPaiLDXLRXSqFdf5zLdks8OWPYAMGSzJdGEh9Cg==
X-Received: by 2002:a05:6402:190d:b0:447:ed22:4d0d with SMTP id
 e13-20020a056402190d00b00447ed224d0dmr25616390edz.309.1662049618214; 
 Thu, 01 Sep 2022 09:26:58 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:26:57 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 11/42] hw/isa/piix3: Remove extra ';' outside of functions
Date: Thu,  1 Sep 2022 18:25:42 +0200
Message-Id: <20220901162613.6939-12-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/isa/piix3.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index e85dec3200..0117f896d2 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -438,7 +438,7 @@ static void piix3_realize(PCIDevice *dev, Error **errp)
     pci_bus_irqs(pci_bus, piix3_set_irq, pci_slot_get_pirq,
                  piix3, PIIX_NUM_PIRQS);
     pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
-};
+}
 
 static void piix3_class_init(ObjectClass *klass, void *data)
 {
@@ -473,7 +473,7 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
      */
     pci_bus_irqs(pci_bus, xen_piix3_set_irq, xen_pci_slot_get_pirq,
                  piix3, XEN_PIIX_NUM_PIRQS);
-};
+}
 
 static void piix3_xen_class_init(ObjectClass *klass, void *data)
 {
@@ -481,7 +481,7 @@ static void piix3_xen_class_init(ObjectClass *klass, void *data)
 
     k->config_write = piix3_write_config_xen;
     k->realize = piix3_xen_realize;
-};
+}
 
 static const TypeInfo piix3_xen_info = {
     .name          = TYPE_PIIX3_XEN_DEVICE,
-- 
2.37.3


