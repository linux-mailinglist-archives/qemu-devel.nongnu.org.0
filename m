Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 750636A1121
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 21:24:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVI7f-0005gK-Mt; Thu, 23 Feb 2023 15:23:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pVI7d-0005dx-0l; Thu, 23 Feb 2023 15:23:21 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pVI7a-0002Qz-Th; Thu, 23 Feb 2023 15:23:20 -0500
Received: by mail-ed1-x52c.google.com with SMTP id ec43so46189968edb.8;
 Thu, 23 Feb 2023 12:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xl/DOZlATxgugred1fzKweHRfgNnXhLpLoX6XzlsSKs=;
 b=EwGyEtpQcr22iKMwSRSZG9l8gby+lVOVC1kWg/U6t6mlf9fY6qdLRfzzaM/98oJF87
 cAi+xYVEx0MrdFlHcmJOgo9c+z/WXVdK9/0Ph2/GGb4WULqQfxJ13kGmgJC94QzOF2Qn
 SzeEYR1sTRxf10As+uh1EYCkxkYXN2rXVF/IoSPEy/Y0YOqwKcD34JScotwByuLi4THx
 4NMSjBaFlAzcUgW+NNw6Nycv6mD6aubWWjYIRXPgsBr7PCEnAqsaSWpJsqPl/qg73XEl
 fwlJT7WljUh1gL+n9cywCiFAJIcsHKFvBNIGvZiDcMbznYJB7q/fxTLlGCTF+q51+04W
 CsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xl/DOZlATxgugred1fzKweHRfgNnXhLpLoX6XzlsSKs=;
 b=dKoFTl7Me44Vp80Q0Gsky7du6Yc1LngSbf3hfpGyCwnjaOoj83P2Up3jdmrwNkbHWe
 e8Qum0/BLDF3FTznyOXrDFDb0f6YTHzRLRNDQuk5uLH9pEnT97E8zxd7Q68eVTYa1ldF
 1XgBBVMr2sCBBJhPgI4TyTH81r5UODM7kn4Kue1O0UxUZrs6lenIiiLHeuLH7Rws5yFY
 uAFoJg+/M7w9vMjF2gfJ6HemrgVG6aIuWOhtBviSkZEP8Av3zs+vfcA8rVc338RP49yx
 0PwHmTz5nmLqiNm9eYlIZdLljG6oaYIAWH4t4hQUrNQIgVh2PMPt3YDHznHFYxOt7QH3
 l5+A==
X-Gm-Message-State: AO0yUKWKL0sY4SfGkfs/J5qAVlTuNIv8F+HbHse+VbfSSIQu0zfq/GRg
 zOhFwjBlKFcNjcMkiFUP3pcjBLACZuw=
X-Google-Smtp-Source: AK7set/axJJhhqaHR8D4J8kKy3qGwLFgA8T3J0uMjYkDADEZi3Sr2EGnO763CxAFTAEXWwkevTlYOA==
X-Received: by 2002:a17:906:16d9:b0:886:221b:44e5 with SMTP id
 t25-20020a17090616d900b00886221b44e5mr19882768ejd.62.1677183795403; 
 Thu, 23 Feb 2023 12:23:15 -0800 (PST)
Received: from osoxes.fritz.box (pd9ed7433.dip0.t-ipconnect.de.
 [217.237.116.51]) by smtp.gmail.com with ESMTPSA id
 jj1-20020a170907984100b008d606b1bbb1sm5200917ejc.9.2023.02.23.12.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 12:23:15 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 3/5] hw/usb/vt82c686-uhci-pci: Use PCI IRQ routing
Date: Thu, 23 Feb 2023 21:20:51 +0100
Message-Id: <20230223202053.117050-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223202053.117050-1-shentey@gmail.com>
References: <20230223202053.117050-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
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

According to the PCI specification, PCI_INTERRUPT_LINE shall have no
effect on hardware operations. Now that the VIA south bridges implement
the internal PCI interrupt router let's be more conformant to the PCI
specification.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/usb/vt82c686-uhci-pci.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/hw/usb/vt82c686-uhci-pci.c b/hw/usb/vt82c686-uhci-pci.c
index 46a901f56f..b4884c9011 100644
--- a/hw/usb/vt82c686-uhci-pci.c
+++ b/hw/usb/vt82c686-uhci-pci.c
@@ -1,17 +1,7 @@
 #include "qemu/osdep.h"
-#include "hw/irq.h"
 #include "hw/isa/vt82c686.h"
 #include "hcd-uhci.h"
 
-static void uhci_isa_set_irq(void *opaque, int irq_num, int level)
-{
-    UHCIState *s = opaque;
-    uint8_t irq = pci_get_byte(s->dev.config + PCI_INTERRUPT_LINE);
-    if (irq > 0 && irq < 15) {
-        via_isa_set_irq(pci_get_function_0(&s->dev), irq, level);
-    }
-}
-
 static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
 {
     UHCIState *s = UHCI(dev);
@@ -25,8 +15,6 @@ static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
     pci_set_long(pci_conf + 0xc0, 0x00002000);
 
     usb_uhci_common_realize(dev, errp);
-    object_unref(s->irq);
-    s->irq = qemu_allocate_irq(uhci_isa_set_irq, s, 0);
 }
 
 static UHCIInfo uhci_info[] = {
-- 
2.39.2


