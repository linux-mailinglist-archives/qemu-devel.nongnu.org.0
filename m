Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2F46980BB
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 17:20:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSKTO-0007Ii-AO; Wed, 15 Feb 2023 11:17:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKTE-00077B-I2
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:17:24 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKTC-0008Ix-O0
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:17:24 -0500
Received: by mail-wm1-x32c.google.com with SMTP id n33so7711633wms.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 08:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f+MRzlgMTMYiJqY66hAEGi+hsN4wxcZCLS9p/s8Kgnk=;
 b=lQ0TevdyNpGY7dF7OyzGHWKmSz2e9VoC1iIqBRkWJraIgHiSymXC+ZSJn34EkoZb28
 lBqpUcFfuON5XDuPEXTPIX3Dj/DDrZNJ2qEmpMGB7UGC23SiC8sd6gVl4Jqig37K/+0m
 sS/oklWytHV9s+q/utA5h468kOwBAmuSL5Dh8uBkpj1RNI+oPIup/FDZBhF4GG6gRRCs
 GY4FISPBEwPDpyhK6YJtvmi+8IYOXaIr+POujiD24HuEZ5yDUyU425A7qMrIeCgoarL4
 BsZlG92uqji5l4iAd0bccsWrGlS0U8YgbZXYCZa0Jwxx4MxF6nc72XnBE1zIwyV2o3Bd
 qzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f+MRzlgMTMYiJqY66hAEGi+hsN4wxcZCLS9p/s8Kgnk=;
 b=xDoyBfTm93kddAosbLrriQtjrMbXN+ivohi4Rquc4mk8OeFvRieCPwKGnnbGMKOMJP
 OQCIk+YOB3hw2HG/55vO3yVcb925ZqOFKMyz5P0DksWblL+ENmIaEoeOdteQamFj/9H/
 /TaIQpkE5IElypHnZ8b841IQkjQkbBtjS4HllMlfrnizG2YbsZ1komZhQtGOUO34MZBf
 IOyE+2MoMhJ+kLYXASSkALIfnSUQwsbPQmk9z6VWuDKg64T0kmauHz/ZoxyZ6uq5Rj/j
 DnRJf1bPrge8cvR8oy/R/82vucJuK1US9XO4dXTTBd/CI0StVW9s5+pNa7nMt7yYPz6M
 aguw==
X-Gm-Message-State: AO0yUKUCZ1H05orDAdYby1jiqdEXVgoig6TgORrr5ZCmaIxprATW8Ao8
 bFrqU1guKUzkpTsRGWTJ+LG54wKj6L3INMj6
X-Google-Smtp-Source: AK7set8/oMKXjN1w0vCzRnv3s3cPmFs1V+OKEUufpzpB/vLjmgRoyDFh60ZP20tsUUUl6bACJkO8jA==
X-Received: by 2002:a05:600c:4918:b0:3dc:d5c:76d9 with SMTP id
 f24-20020a05600c491800b003dc0d5c76d9mr2340410wmp.0.1676477841035; 
 Wed, 15 Feb 2023 08:17:21 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a05600c459200b003dc4baaedd3sm2862852wmo.37.2023.02.15.08.17.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 08:17:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-ppc@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 07/18] hw/ide/piix: Ensure IDE output IRQs are wired at
 realization
Date: Wed, 15 Feb 2023 17:16:30 +0100
Message-Id: <20230215161641.32663-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215161641.32663-1-philmd@linaro.org>
References: <20230215161641.32663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
index 9d876dd4a7..b75a4ddcca 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -133,14 +133,17 @@ static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
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
 
-    qemu_irq irq_out = d->irq[i] ? : isa_get_irq(NULL, port_info[i].isairq);
+    if (!d->irq[i]) {
+        error_setg(errp, "output IDE IRQ %u not connected", i);
+        return false;
+    }
+
     ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
     ret = ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
                           port_info[i].iobase2);
@@ -149,7 +152,7 @@ static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
                          object_get_typename(OBJECT(d)), i);
         return false;
     }
-    ide_bus_init_output_irq(&d->bus[i], irq_out);
+    ide_bus_init_output_irq(&d->bus[i], d->irq[i]);
 
     bmdma_init(&d->bus[i], &d->bmdma[i], d);
     d->bmdma[i].bus = &d->bus[i];
-- 
2.38.1


