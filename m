Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 872133BA171
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:43:31 +0200 (CEST)
Received: from localhost ([::1]:49520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzJS6-0005Ky-IR
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzJMD-0004Lq-09
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:37:25 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzJMB-0004IC-HP
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:37:24 -0400
Received: by mail-wr1-x42c.google.com with SMTP id a8so836057wrp.5
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CpqtyrEBgGp2q4wqDOzQhvyghW20BSPg8kexiW49YjQ=;
 b=brjstrgbDbMKkqR75WF8H/ykYRSyX1VZzBTJts8CHFOvXwcT/6rFHYDuIOYSY7R3Xj
 7qEqCpzfVgwhoNaIXldQstroytDz9yvh2QK55FLaeMSUN820QaxAeX0D5q79QlC3enP9
 H0PIthmmRCgyA3lF18ZcFaQJIdia0jzTOz9ZuRuRpef+opIaA4k4pELjAl8k4YzHKaBw
 kJhHQQ/Nx/7eqUeerxchAx9wYS+kZ5psU583ar6N/gLRnRbprzJK9jnK9+RwucgWHNkI
 A7dCvxt7V5e34LGYM9m7/WWDaltSkvANfmlVjcq7DITZ2wbokG5h9WjkD6VuQ44ehtDq
 T2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CpqtyrEBgGp2q4wqDOzQhvyghW20BSPg8kexiW49YjQ=;
 b=XqlowFjnis4cerGAJfxjnIyTpxnW1Rx3RZwR7xkzHxcu3HHuAJbzFDvPTBaV08OgpG
 B9rI2uLTJuYuO0lMgNhBz/96z+v/86BvgF9+wYnHPYMiuMVKlzG+OW5UrMXnOfQtXte1
 F2KsSGZxPFd7zSNVjSWaK57qin6lg19bt84Ck65td+ShU4f7GPEFwa4dq4yH9w7M4ixi
 B7tIgy5E5mo4N73dDkh6v+BGmkbfAtPietXL16mazIySh0yKAZUyvhVL0MXIblTtsbjF
 vyjy9cl6G9xQOGtkgBwFEBim95WWqTgHybBscAf0EkaXyG/kosaMFGraPle5B6nWzwt7
 IK6g==
X-Gm-Message-State: AOAM532zuVbxT+NKrdv8FYSTohXBKoHo7vteGuzWw003zzvfXhsBeG89
 KsbXFt7JyU+EGQMyqtlG8G0rAHFlx+RCE9wr
X-Google-Smtp-Source: ABdhPJzAzFLDTf+pnaaSJqPc0qK4DsyEbvN2Gnlfr8IiI4ef5N6FeOjz0JPZJMT1cyjUTyi+M624TQ==
X-Received: by 2002:a5d:524e:: with SMTP id k14mr6091871wrc.390.1625233042168; 
 Fri, 02 Jul 2021 06:37:22 -0700 (PDT)
Received: from x1w.Ascou-CH1 (pop.92-184-108-23.mobile.abo.orange.fr.
 [92.184.108.23])
 by smtp.gmail.com with ESMTPSA id n12sm3782890wmq.5.2021.07.02.06.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:37:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/18] dp8393x: remove onboard PROM containing MAC address and
 checksum
Date: Fri,  2 Jul 2021 15:35:53 +0200
Message-Id: <20210702133557.60317-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210702133557.60317-1-f4bug@amsat.org>
References: <20210702133557.60317-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Finn Thain <fthain@linux-m68k.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

According to the datasheet the dp8393x chipset does not contain any NVRAM capable
of storing a MAC address or checksum. Now that both the MIPS jazz and m68k q800
boards generate the PROM region and checksum themselves, remove the generated
PROM from the dp8393x device itself.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Finn Thain <fthain@linux-m68k.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210625065401.30170-6-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/dp8393x.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index ea5b22f6802..252c0a26641 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -30,8 +30,6 @@
 #include "qom/object.h"
 #include "trace.h"
 
-#define SONIC_PROM_SIZE 0x1000
-
 static const char *reg_names[] = {
     "CR", "DCR", "RCR", "TCR", "IMR", "ISR", "UTDA", "CTDA",
     "TPS", "TFC", "TSA0", "TSA1", "TFS", "URDA", "CRDA", "CRBA0",
@@ -157,7 +155,6 @@ struct dp8393xState {
     NICConf conf;
     NICState *nic;
     MemoryRegion mmio;
-    MemoryRegion prom;
 
     /* Registers */
     uint8_t cam[16][6];
@@ -966,16 +963,12 @@ static void dp8393x_instance_init(Object *obj)
     dp8393xState *s = DP8393X(obj);
 
     sysbus_init_mmio(sbd, &s->mmio);
-    sysbus_init_mmio(sbd, &s->prom);
     sysbus_init_irq(sbd, &s->irq);
 }
 
 static void dp8393x_realize(DeviceState *dev, Error **errp)
 {
     dp8393xState *s = DP8393X(dev);
-    int i, checksum;
-    uint8_t *prom;
-    Error *local_err = NULL;
 
     address_space_init(&s->as, s->dma_mr, "dp8393x");
     memory_region_init_io(&s->mmio, OBJECT(dev), &dp8393x_ops, s,
@@ -986,23 +979,6 @@ static void dp8393x_realize(DeviceState *dev, Error **errp)
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
 
     s->watchdog = timer_new_ns(QEMU_CLOCK_VIRTUAL, dp8393x_watchdog, s);
-
-    memory_region_init_rom(&s->prom, OBJECT(dev), "dp8393x-prom",
-                           SONIC_PROM_SIZE, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        return;
-    }
-    prom = memory_region_get_ram_ptr(&s->prom);
-    checksum = 0;
-    for (i = 0; i < 6; i++) {
-        prom[i] = s->conf.macaddr.a[i];
-        checksum += prom[i];
-        if (checksum > 0xff) {
-            checksum = (checksum + 1) & 0xff;
-        }
-    }
-    prom[7] = 0xff - checksum;
 }
 
 static const VMStateDescription vmstate_dp8393x = {
-- 
2.31.1


