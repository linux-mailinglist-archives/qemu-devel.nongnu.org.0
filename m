Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A30A6097A1
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 02:55:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omhei-0001fJ-V9
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 16:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5q-0007Oa-5I; Sat, 22 Oct 2022 11:07:22 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5o-0002Jg-Ng; Sat, 22 Oct 2022 11:07:21 -0400
Received: by mail-ed1-x52b.google.com with SMTP id b12so16126193edd.6;
 Sat, 22 Oct 2022 08:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CodyFwMG0+XS3PFJi4K5DiBGFix1qYFLR29JzDvdEB4=;
 b=NnwDx2xS+Vv2f75q63viz/EOjZGNgV5p3fs4RzktUk7q9cAvoAkcCOjrvFk2OvcyNn
 LwGCh/7OG3tm7dYF48n7Q3IU7EOMP+RV3gGFu2uzxFFlMlbNHNdNdBD+t180SnRpMpCc
 N1iDYe/rCB3y9mcV1YeGJkiaPAW+9F1F1SB6nXjHSN7SGBUgmN4og7vnw8jAOUv2GaUl
 95LXRw/5BERPbkBnPO+7k/z3WZCZcduP2nS4vjKvB4wZZfyNPMp5OwB8CHzO2hxu89Y+
 1OyFJ5+mcquJxvnkwo3jB9dyZLJcN4UwMZ35wj18PgGfCkBSzDcBCvOmDt9FDQGJXGgB
 py4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CodyFwMG0+XS3PFJi4K5DiBGFix1qYFLR29JzDvdEB4=;
 b=gaZaOTeB3Npvpug3tsLVF3WBMSEx4pgFbyu/wsugPI9+gvAf23UFYeiVqpCCGRe4qF
 6S9YtcveWnLmaTYJd87tbqr3Ha2jCdynf3e1yEjczeC9usLWYSi9W5zhrcB4tDivg+8F
 rG0SKQgHIaMrljhBuftRSrrMzMlmX7sv7X/nbBzEfPpr4uFCe0aeQ/QeFVY9ivt+m2rt
 6caoTxSwOsZtNBvuK8Uv2Xb3Ucph+zLpeC9zzBfwQZyNcZ1y2api8ExcqoX1lHrCYBbY
 VZlYDWZsZfYaCvI2x88vkCHX1Y8RVfwU1TGNPBlBZld5iOhPsecsQA0w/xRmzlGIOZQt
 fEeg==
X-Gm-Message-State: ACrzQf0uVRbnmhgB2WST7UJOUfm/3LDZjhLmrsBCm4Rt6CoYggOQFXK6
 RKeSOhYlzNEfCdeS6bIzCTzRSBn08MdVig==
X-Google-Smtp-Source: AMsMyM6k18I2uPBk7EVjxPo0/as1WHSxOol4b68sFNkUtBn6HYC/o/nrPmjPI5My47pGc6CPNV7a+g==
X-Received: by 2002:a17:906:5dda:b0:78d:e7d2:7499 with SMTP id
 p26-20020a1709065dda00b0078de7d27499mr20470091ejv.588.1666451239350; 
 Sat, 22 Oct 2022 08:07:19 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:07:18 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 35/43] hw/isa/piix4: Prefix pci_slot_get_pirq() with
 "piix4_"
Date: Sat, 22 Oct 2022 17:05:00 +0200
Message-Id: <20221022150508.26830-36-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Prefixing with "piix4_" makes the method distinguishable from its
PIIX3 counterpart upon merging and also complies more with QEMU
conventions.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix4.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 2f5b6fc934..dd189fa594 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -63,7 +63,7 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
     }
 }
 
-static int pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
+static int piix4_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
 {
     int slot;
 
@@ -249,7 +249,8 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
                               qdev_get_gpio_in(DEVICE(&s->pic), 9));
     }
 
-    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
+    pci_bus_irqs(pci_bus, piix4_set_irq, piix4_pci_slot_get_pirq, s,
+                 PIIX_NUM_PIRQS);
 }
 
 static void piix4_init(Object *obj)
-- 
2.38.1


