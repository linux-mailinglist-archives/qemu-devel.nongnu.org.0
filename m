Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0601B2F6435
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 16:20:52 +0100 (CET)
Received: from localhost ([::1]:37482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l04Qd-0007Xk-2A
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 10:20:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l04Gs-0006fH-Nz; Thu, 14 Jan 2021 10:10:47 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:54333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l04Gp-0004LW-Dg; Thu, 14 Jan 2021 10:10:46 -0500
Received: by mail-pj1-x1034.google.com with SMTP id cq1so3230805pjb.4;
 Thu, 14 Jan 2021 07:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gDI3Lg8zX7Mk9E+XiKTF8U/FUN1ufj38Nn84DY7D9Rg=;
 b=LvmPeXREe/DoGS3uPQpILVOB9giyOrwfc3z0kqGgCfcOOm/Z6ZJTpowkND+VrjA5r2
 Ay4xDha+dF9O/CS7Bc9u/KTpMyzyZhMVBFvwKvyfg1NHh/yTv2QPX/441BN5vjDnnZFq
 5t12+wmy1Qz+ThL71jwLR6Ut1gVUGCnIYxFFdkSoPQqyDlFiBQNG0Dyt9OdwgJAHrPuc
 C94S5QL1mjb9SnoGk8fom/WDi9uQdKZeOlByhlihl2WrK6p9mlsg94YJal/JEy1OGhar
 rsm1LlZuepUPGynuidFJkiqAvlnREuDeuyrwhhIN4q0i6CNMzO7S/fbgK0HeLHxi976e
 OmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gDI3Lg8zX7Mk9E+XiKTF8U/FUN1ufj38Nn84DY7D9Rg=;
 b=M0DEdLOznvyJJD/cqqunXWGz/N/GwYBb4ko5UoG1AMP/1e52oEpSOQTiklwHvFMJEQ
 x0x02aAsNo1wAXxxVfhCg912R6kEgT1h4Ecv/P3GV7NCB4Mb662CJn2S0yJ3BVlP0NHp
 zL9Mui+pH4Wwg4Yuknq7O0e0ExNjTOYUkBS79cW921bLl7qpyEZDmDJanY01O/MVROpm
 5Zi4I7hgRa1eHEcGVmOxYcg769N9jeHPllLlAGXlD1QABKPYrXr9nx7BW5YmR3me4g9U
 /rYaAKA3jvatrmlsnuR0qwrktR0gSwzQhjcF474IsBwDcJWKbb6691zlMH3Kblm5oZey
 ZS9g==
X-Gm-Message-State: AOAM532eKcGQfUo+gZTFbRqIvnCWhFec1FHvIvZwuKCeT5UuEQYwnpY4
 UBWTsXjkOhQh3VEFQzha0mM=
X-Google-Smtp-Source: ABdhPJwd8s1rQrbFIlXUOp+vVfbrBAxw6Rhp0DiXv+myD4YnzixKT6j3/Ym16AkbKV5y14V039QKRQ==
X-Received: by 2002:a17:90a:5914:: with SMTP id
 k20mr5336869pji.199.1610637041843; 
 Thu, 14 Jan 2021 07:10:41 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id w21sm5372051pfq.67.2021.01.14.07.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 07:10:41 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>
Subject: [PATCH 8/9] Revert "aspeed/smc: snoop SPI transfers to fake dummy
 cycles"
Date: Thu, 14 Jan 2021 23:09:01 +0800
Message-Id: <20210114150902.11515-9-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114150902.11515-1-bmeng.cn@gmail.com>
References: <20210114150902.11515-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

This reverts commit f95c4bffdc4c53b29f89762cab4adc5a43f95daf.

The incorrect implementation of dummy cycles in m25p80 model is now
corrected. Revert this commit.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 include/hw/ssi/aspeed_smc.h |   3 -
 hw/ssi/aspeed_smc.c         | 116 +-----------------------------------
 2 files changed, 2 insertions(+), 117 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 16c03fe64f..46f3abf2e7 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -111,9 +111,6 @@ struct AspeedSMCState {
     AddressSpace dram_as;
 
     AspeedSMCFlash *flashes;
-
-    uint8_t snoop_index;
-    uint8_t snoop_dummies;
 };
 
 #endif /* ASPEED_SMC_H */
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 1e78b5232f..0df5d91d19 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -187,9 +187,6 @@
 /* Flash opcodes. */
 #define SPI_OP_READ       0x03    /* Read data bytes (low frequency) */
 
-#define SNOOP_OFF         0xFF
-#define SNOOP_START       0x0
-
 /*
  * Default segments mapping addresses and size for each peripheral per
  * controller. These can be changed when board is initialized with the
@@ -771,104 +768,6 @@ static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigned size)
     return ret;
 }
 
-/*
- * TODO (clg@kaod.org): stolen from xilinx_spips.c. Should move to a
- * common include header.
- */
-typedef enum {
-    READ = 0x3,         READ_4 = 0x13,
-    FAST_READ = 0xb,    FAST_READ_4 = 0x0c,
-    DOR = 0x3b,         DOR_4 = 0x3c,
-    QOR = 0x6b,         QOR_4 = 0x6c,
-    DIOR = 0xbb,        DIOR_4 = 0xbc,
-    QIOR = 0xeb,        QIOR_4 = 0xec,
-
-    PP = 0x2,           PP_4 = 0x12,
-    DPP = 0xa2,
-    QPP = 0x32,         QPP_4 = 0x34,
-} FlashCMD;
-
-static int aspeed_smc_num_dummies(uint8_t command)
-{
-    switch (command) { /* check for dummies */
-    case READ: /* no dummy bytes/cycles */
-    case PP:
-    case DPP:
-    case QPP:
-    case READ_4:
-    case PP_4:
-    case QPP_4:
-        return 0;
-    case FAST_READ:
-    case DOR:
-    case QOR:
-    case DOR_4:
-    case QOR_4:
-        return 1;
-    case DIOR:
-    case FAST_READ_4:
-    case DIOR_4:
-        return 2;
-    case QIOR:
-    case QIOR_4:
-        return 4;
-    default:
-        return -1;
-    }
-}
-
-static bool aspeed_smc_do_snoop(AspeedSMCFlash *fl,  uint64_t data,
-                                unsigned size)
-{
-    AspeedSMCState *s = fl->controller;
-    uint8_t addr_width = aspeed_smc_flash_is_4byte(fl) ? 4 : 3;
-
-    trace_aspeed_smc_do_snoop(fl->id, s->snoop_index, s->snoop_dummies,
-                              (uint8_t) data & 0xff);
-
-    if (s->snoop_index == SNOOP_OFF) {
-        return false; /* Do nothing */
-
-    } else if (s->snoop_index == SNOOP_START) {
-        uint8_t cmd = data & 0xff;
-        int ndummies = aspeed_smc_num_dummies(cmd);
-
-        /*
-         * No dummy cycles are expected with the current command. Turn
-         * off snooping and let the transfer proceed normally.
-         */
-        if (ndummies <= 0) {
-            s->snoop_index = SNOOP_OFF;
-            return false;
-        }
-
-        s->snoop_dummies = ndummies * 8;
-
-    } else if (s->snoop_index >= addr_width + 1) {
-
-        /* The SPI transfer has reached the dummy cycles sequence */
-        for (; s->snoop_dummies; s->snoop_dummies--) {
-            ssi_transfer(s->spi, s->regs[R_DUMMY_DATA] & 0xff);
-        }
-
-        /* If no more dummy cycles are expected, turn off snooping */
-        if (!s->snoop_dummies) {
-            s->snoop_index = SNOOP_OFF;
-        } else {
-            s->snoop_index += size;
-        }
-
-        /*
-         * Dummy cycles have been faked already. Ignore the current
-         * SPI transfer
-         */
-        return true;
-    }
-
-    s->snoop_index += size;
-    return false;
-}
-
 static void aspeed_smc_flash_write(void *opaque, hwaddr addr, uint64_t data,
                                    unsigned size)
 {
@@ -887,10 +786,6 @@ static void aspeed_smc_flash_write(void *opaque, hwaddr addr, uint64_t data,
 
     switch (aspeed_smc_flash_mode(fl)) {
     case CTRL_USERMODE:
-        if (aspeed_smc_do_snoop(fl, data, size)) {
-            break;
-        }
-
         for (i = 0; i < size; i++) {
             ssi_transfer(s->spi, (data >> (8 * i)) & 0xff);
         }
@@ -937,8 +832,6 @@ static void aspeed_smc_flash_update_ctrl(AspeedSMCFlash *fl, uint32_t value)
 
     s->regs[s->r_ctrl0 + fl->id] = value;
 
-    s->snoop_index = unselect ? SNOOP_OFF : SNOOP_START;
-
     aspeed_smc_flash_do_select(fl, unselect);
 }
 
@@ -981,9 +874,6 @@ static void aspeed_smc_reset(DeviceState *d)
     if (s->ctrl->segments == aspeed_segments_fmc) {
         s->regs[s->r_conf] |= (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE0);
     }
-
-    s->snoop_index = SNOOP_OFF;
-    s->snoop_dummies = 0;
 }
 
 static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int size)
@@ -1419,12 +1309,10 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
 
 static const VMStateDescription vmstate_aspeed_smc = {
     .name = "aspeed.smc",
-    .version_id = 2,
-    .minimum_version_id = 2,
+    .version_id = 1,
+    .minimum_version_id = 1,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32_ARRAY(regs, AspeedSMCState, ASPEED_SMC_R_MAX),
-        VMSTATE_UINT8(snoop_index, AspeedSMCState),
-        VMSTATE_UINT8(snoop_dummies, AspeedSMCState),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.25.1


