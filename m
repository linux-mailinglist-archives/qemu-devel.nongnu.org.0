Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BD44B9D4F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 11:38:18 +0100 (CET)
Received: from localhost ([::1]:37026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKeAz-00062L-Ap
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 05:38:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKdtn-0006mD-V8
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 05:20:31 -0500
Received: from [2a00:1450:4864:20::62f] (port=45654
 helo=mail-ej1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKdti-0002xX-FU
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 05:20:31 -0500
Received: by mail-ej1-x62f.google.com with SMTP id lw4so5977164ejb.12
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 02:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FjZmcHcFQKseAEVMH4Ldpagp8bK5okxSN4jEauQ21es=;
 b=T/zdlWgqFdWgjcvqcxQbDRYX4+f9EoDx0XsHHhsO26b5pOQQk3qzfpi/8UPF5uBkW1
 hAVOdrC0xuqPUTVGnzuY3RleCqHD+a/SWgzBHc9u1VSSKBYbOd/pK8XWxjY0K9dnNEJs
 qfAmxZx0oMosOEVj/FnNIgiU5AIOe779G2OyMu+4Ck61osOrloU6DitJtSDL0OT4yACT
 5NisdHeXXQFDiKBLjAHz0XtqtdTbtapHpBB9GZpX/H75a44p7wrCHhptRbsdi1miUGil
 Z3bXV+d8psQ5K4JlnDgIhR4KPjvcUzkQQ6zt0yzk2sUNyy2feGwZSxUNgM3vUtfZCedR
 sVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FjZmcHcFQKseAEVMH4Ldpagp8bK5okxSN4jEauQ21es=;
 b=WQIcD7EEiwyFukynROo1FXzIvykZoTvgYXaNCQCMVsMlSUqbVgn7IG2InNtyUXQHXq
 1ZH/afb6wLXQY8w3/AilNuHHuQB0lzLABcrr2KB0ox5jvwn3rsW+pR8+Uc22NDE7PaSf
 SrOSp0uAip0+SLA+VtgOBuWj2g3VQi70m6zvhLICXO6HtS/8pkAkEfheKg+cKI4n8U2W
 Ik6Wyz2lm3f908wxxVjT0xzb6Vvk7WN7n2zUaWUobuGy7JfQICPOqoLS3GS9LYmziVZP
 ezoASuhGP7aVr/h9etm85A2qlXIcLYmbRpAj3mY0RqyqJB77JmWztgbB5esBU2qWqXL3
 a11Q==
X-Gm-Message-State: AOAM530K9y+ssuAZI8EYX2RKbJldGIFhShdLXZP13UcIAfDuleiX2Fck
 RPw5TpHU8K7FumNaKntlExCLtj5016g=
X-Google-Smtp-Source: ABdhPJzzmAg+CrxJh8DQsa0IZkMhEbsQqZsVyZx4lKAgXWuYgael47xlOO47u4uznbQpqo4PDO5Ekw==
X-Received: by 2002:a17:906:bc46:b0:6cd:e855:18fc with SMTP id
 s6-20020a170906bc4600b006cde85518fcmr1703398ejv.263.1645093225042; 
 Thu, 17 Feb 2022 02:20:25 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-198-236.77.183.pool.telefonica.de. [77.183.198.236])
 by smtp.gmail.com with ESMTPSA id u26sm986753ejg.196.2022.02.17.02.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 02:20:24 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 6/7] hw/isa/piix4: Replace some magic IRQ constants
Date: Thu, 17 Feb 2022 11:19:23 +0100
Message-Id: <20220217101924.15347-7-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217101924.15347-1-shentey@gmail.com>
References: <20220217101924.15347-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a follow-up on patch "malta: Move PCI interrupt handling from
gt64xxx_pci to piix4". gt64xxx_pci used magic constants, and probably
didn't want to use piix4-specific constants. Now that the interrupt
handing resides in piix4, its constants can be used.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/isa/piix4.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 2e9b5ccada..f876c71750 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -61,10 +61,10 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
     /* now we change the pic irq level according to the piix irq mappings */
     /* XXX: optimize */
     pic_irq = s->dev.config[PIIX_PIRQCA + irq_num];
-    if (pic_irq < 16) {
+    if (pic_irq < ISA_NUM_IRQS) {
         /* The pic level is the logical OR of all the PCI irqs mapped to it. */
         pic_level = 0;
-        for (i = 0; i < 4; i++) {
+        for (i = 0; i < PIIX_NUM_PIRQS; i++) {
             if (pic_irq == s->dev.config[PIIX_PIRQCA + i]) {
                 pic_level |= pci_bus_get_irq_level(bus, i);
             }
@@ -315,7 +315,7 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
                                NULL, 0, NULL);
     }
 
-    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, 4);
+    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
 
     return dev;
 }
-- 
2.35.1


