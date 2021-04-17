Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F777362F42
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 12:34:21 +0200 (CEST)
Received: from localhost ([::1]:53226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXiHM-00048N-73
	for lists+qemu-devel@lfdr.de; Sat, 17 Apr 2021 06:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXiDy-0001Tk-R2; Sat, 17 Apr 2021 06:30:51 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:43656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXiDx-0000ox-BU; Sat, 17 Apr 2021 06:30:50 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 u5-20020a7bcb050000b029010e9316b9d5so15433446wmj.2; 
 Sat, 17 Apr 2021 03:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YqA3p/T6rcC/vVj1HlfKqNVV1sNmO1FDscy1JV4DYeo=;
 b=XI7cLY00hk+yXTbKsmzHu/oYlxDQQudJzwQwG/hcVHrLJn4wjSHjyhSWTAjNoFYuLm
 L62JpBkacfuh/kDvtxF2qpEpmiO4QT+ryMz7V17W0nksdqYlhJS6a/81r30rC7IPTyKT
 40oCZLHrDhuDlKjMNBmvtuPGp1lQi/PSizj2aYJypM/Lo5Z5LiBPASpWWec1JmynZwZ4
 nWeqv0QH3ppLJrdPfv4+ePy2/dOxuDDkl9Dcf6o/Jd1Cy/iz3D8F2D31ovASvesEXPxm
 6x1/rO+U6vfW1vf8dO+4zzyym4ZLtlfg6hCWG79N0N4w8nFDV5c1yNVHuYUz2P5O+dzL
 PJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YqA3p/T6rcC/vVj1HlfKqNVV1sNmO1FDscy1JV4DYeo=;
 b=qb6qoUWX4k0f+0fllzoZsE4BsII7mCpcuvYEaKv04Y4oFWug/dxBZ8fiHmxlBbi8xk
 QKMvnMpFM8ikkm8JSEloPCmrn4uIhwjLZjH8TZLDZrgMf6oX88PTaZSV7nyM7rdgi7Yu
 2o/J9afaf4mBlIrLZWdmFqOsuR9td3IAtSDcGoShzmDmpHCqu2BgjOt/UzSI6IaME2JT
 IAij5VmtwQCDK6SlZJwSrNEZoBB/vWppYhXx4tifHJ8nfgHHbIBL6LSYNOzxhSDRNk6I
 talEWYpYjf7XWTuYUIomYjJMeLhv9K6f+smc9QBBFa8ij17zMchDAkzO5N5ky9AJE3UM
 xW/A==
X-Gm-Message-State: AOAM532RcZX9squRN5RdvhVaNqc0OP08BHnlusWnQcyuaCpCyqN+2Vfw
 ahtaFvAafuxP0zQLMAg24SMbKcGCxdk=
X-Google-Smtp-Source: ABdhPJxucS85w39EI6XBhb6Lg/u6tG6gQyirJ0OQ/luTscbm6jHhfaA04KZn/0WwWJqXRz5Pwewurw==
X-Received: by 2002:a7b:cb42:: with SMTP id v2mr11996034wmj.120.1618655446702; 
 Sat, 17 Apr 2021 03:30:46 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id y17sm14860403wrq.76.2021.04.17.03.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 03:30:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/11] hw/arm/aspeed: Do not sysbus-map mmio flash region
 directly, use alias
Date: Sat, 17 Apr 2021 12:30:20 +0200
Message-Id: <20210417103028.601124-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210417103028.601124-1-f4bug@amsat.org>
References: <20210417103028.601124-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The flash mmio region is exposed as an AddressSpace.
AddressSpaces must not be sysbus-mapped, therefore map
the region using an alias.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[ clg : Fix DMA_FLASH_ADDR() ]
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210312182851.1922972-3-f4bug@amsat.org>
---
 include/hw/ssi/aspeed_smc.h | 1 +
 hw/ssi/aspeed_smc.c         | 7 ++++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 16c03fe64f3..e3c96cecbd8 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -84,6 +84,7 @@ struct AspeedSMCState {
 
     MemoryRegion mmio;
     MemoryRegion mmio_flash;
+    MemoryRegion mmio_flash_alias;
 
     qemu_irq irq;
     int irqline;
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 6f72fb028e5..e06a3b0c5bd 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -179,8 +179,7 @@
  *   0x7FFFFF: 32M bytes
  */
 #define DMA_DRAM_ADDR(s, val)   ((val) & (s)->ctrl->dma_dram_mask)
-#define DMA_FLASH_ADDR(s, val)  ((s)->ctrl->flash_window_base | \
-                                ((val) & (s)->ctrl->dma_flash_mask))
+#define DMA_FLASH_ADDR(s, val)  ((val) & (s)->ctrl->dma_flash_mask)
 #define DMA_LENGTH(val)         ((val) & 0x01FFFFFC)
 
 /* Flash opcodes. */
@@ -1385,7 +1384,9 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
     memory_region_init_io(&s->mmio_flash, OBJECT(s),
                           &aspeed_smc_flash_default_ops, s, name,
                           s->ctrl->flash_window_size);
-    sysbus_init_mmio(sbd, &s->mmio_flash);
+    memory_region_init_alias(&s->mmio_flash_alias, OBJECT(s), name,
+                             &s->mmio_flash, 0, s->ctrl->flash_window_size);
+    sysbus_init_mmio(sbd, &s->mmio_flash_alias);
 
     s->flashes = g_new0(AspeedSMCFlash, s->ctrl->max_peripherals);
 
-- 
2.26.3


