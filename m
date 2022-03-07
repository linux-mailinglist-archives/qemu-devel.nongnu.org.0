Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A70614D0067
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 14:47:59 +0100 (CET)
Received: from localhost ([::1]:45270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRDiP-00066i-10
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 08:47:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRDeo-0004CS-3y
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:44:14 -0500
Received: from [2607:f8b0:4864:20::62a] (port=37651
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRDel-0006s0-0A
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:44:12 -0500
Received: by mail-pl1-x62a.google.com with SMTP id n2so4284276plf.4
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 05:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m5DGgo+E7BroNY51ivtexNtcI1JQgvQ9mCnqaaS1YQ8=;
 b=fjz48lM/gOrtphLD6jsM/d5Ly8eC7SQHdx8YZNwNjztpcxRRXa8c6bFuFQmeZUyfpH
 BlHUtapU+05rpHDM8Z2BIAFn9SjyvLDJH2o5ZoyiVRIbNUiRoE6G/85DginjlI+oljyK
 40J5DcaVxacBm/N9IsWn+PRfRSj5oHmgLj/gEHZc27+LM6hAethwzCtaQOGG3cnBN7d3
 zFW6VMo8iWSH7d/4ahRbn5r0CA6WxKgGtxiRyRn/lR1UEuF2PkkkMkQrYVxhj9v5lGYP
 Q0fDmv6ZtaGLQmA8uWQguqPvR9f1uo7uiAUAfi8WTig2kHT7vjJP805QuA3z/Ou1ScvS
 zifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m5DGgo+E7BroNY51ivtexNtcI1JQgvQ9mCnqaaS1YQ8=;
 b=laY/2ewikteBYRp0SBpGt/RaxkPbsAkFkV9pq1Cnl4e13gNDUqqSRou7oklSGcMMlj
 p1OQTOw1fxy/x75jZdg5Dxzr/xrZL5wnhg3wvYVAoVzwP+2paZ24pYxmtxdWU0ZvXrdw
 fBWLNbDrq02HP4ApRjd36ZXsPwZPjMUHCZkZIg20f1NxvjigZBN7YhfpA5lYubTTGFwK
 /SiGzh5xkv63uaeMoWegbQu2fiK1PaUtdqKoZoIAxjLFBL9UZ6oKZZTO1IgKLH1fhc/W
 ofq2SnsD56HDsvJLVh+kdU8Ttr/a24xLxTx0v3bBlXhURqjFSphP5P/emluNZL8Bhe7p
 pCcA==
X-Gm-Message-State: AOAM533LUoS9bIw6aMx6qzxecyZnDTeTCsapKG78oSGzUCceuVDOZ6FL
 Lv2YXmN8AfwMbx2bFkeJ/+KGslldUOM=
X-Google-Smtp-Source: ABdhPJyk7KtN3B6TqPmcC30HqMnYgMto8P1mNeL7hU0UlI6OfV6twkpq2vE0PJeKt9xDXgcZ1b8EDQ==
X-Received: by 2002:a17:90b:4b47:b0:1be:fccf:d1a8 with SMTP id
 mi7-20020a17090b4b4700b001befccfd1a8mr12912290pjb.33.1646660648250; 
 Mon, 07 Mar 2022 05:44:08 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ng5-20020a17090b1a8500b001bf4296a042sm7956705pjb.55.2022.03.07.05.44.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 05:44:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: Bernhard Beschow <shentey@gmail.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 01/13] hw/mips/gt64xxx_pci: Fix PCI IRQ levels to be preserved
 during migration
Date: Mon,  7 Mar 2022 14:43:41 +0100
Message-Id: <20220307134353.1950-2-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
References: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

Based on commit e735b55a8c11dd455e31ccd4420e6c9485191d0c:

  piix_pci: eliminate PIIX3State::pci_irq_levels

  PIIX3State::pci_irq_levels are redundant which is already tracked by
  PCIBus layer. So eliminate them.

The IRQ levels in the PCIBus layer are already preserved during
migration. By reusing them and rather than having a redundant implementation
the bug is avoided in the first place.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220217101924.15347-2-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/gt64xxx_pci.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index c7480bd019..4cbd0911f5 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -1006,14 +1006,11 @@ static int gt64120_pci_map_irq(PCIDevice *pci_dev, int irq_num)
     }
 }
 
-static int pci_irq_levels[4];
-
 static void gt64120_pci_set_irq(void *opaque, int irq_num, int level)
 {
     int i, pic_irq, pic_level;
     qemu_irq *pic = opaque;
-
-    pci_irq_levels[irq_num] = level;
+    PCIBus *bus = pci_get_bus(piix4_dev);
 
     /* now we change the pic irq level according to the piix irq mappings */
     /* XXX: optimize */
@@ -1023,7 +1020,7 @@ static void gt64120_pci_set_irq(void *opaque, int irq_num, int level)
         pic_level = 0;
         for (i = 0; i < 4; i++) {
             if (pic_irq == piix4_dev->config[PIIX_PIRQCA + i]) {
-                pic_level |= pci_irq_levels[i];
+                pic_level |= pci_bus_get_irq_level(bus, i);
             }
         }
         qemu_set_irq(pic[pic_irq], pic_level);
-- 
2.34.1


