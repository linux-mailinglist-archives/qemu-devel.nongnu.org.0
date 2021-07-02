Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B51373BA18A
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:44:48 +0200 (CEST)
Received: from localhost ([::1]:54180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzJTL-00007t-Ky
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzJLO-0002EV-VI
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:36:34 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzJLN-0003zK-IB
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:36:34 -0400
Received: by mail-wr1-x42e.google.com with SMTP id i8so12583961wrc.0
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7A/j/FYlYSZh3luNW3Um8CEXczwC9yclCtiX6mQrEkk=;
 b=gJI0detEXXLTl/G77/lBfTmHYiZ/XWAZ42aKTylylRnSLpOQUxkbRB856WuF/GxkIs
 vmtb+sOg5N2RnfUIsOypf2qG1VFs/fN+xAjwnnclgNUmWCnKDdmMlW+mWPaqTfkAhwSx
 IVoXqwzC0io8DkwqGyM4J/nFPTMMt24f5yC/qsUizrhLBHTLMArdRQY2d2fe1N0KL7vr
 qa6BtZpGubKqS/KS4dknOZy6S5RumlfTLuPwOh7s/kHFKmxvbMOqcz0Hn0sBRgtIlKUS
 ciLCAkucBLXmdZoEb9Pn23Lt6c9t51qN098XqdGJjU/c0/q/8aZLDFE6XhHN+vGhqcr9
 O03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7A/j/FYlYSZh3luNW3Um8CEXczwC9yclCtiX6mQrEkk=;
 b=YAqme29aGgRyG/AXKkxUC6N/Tg8kV68GJ6ARDRqRKnvCHFdJ/IuKDDxiA42eCvO8CI
 /qMvXvrEL95XanN6wGz5LcmfcL+/MuE9RuSWP5jyBDW6hLv07tLAOYzJ+VIbx/TVbsNB
 d+Ncu57u++t0xE5ikqdaqZ13fTnnzb+jYqiF6a1xhhKoL7wfpg82vPJDGxP96flq8VpI
 qW0riALH1OZQnHAsJN7Af7TkQA30QkSm2mD6j90IbXImhDxWusbGrkP0IV0Xfm2vNHvN
 YW5lXYRkon2kahCMMAz54tUV7eyTWhMj2CEl14MHOazoR09xSeyyDMhScob5xypBK3Ge
 Qo5Q==
X-Gm-Message-State: AOAM532Sj5dZpi3cBUvqVeDFCngnvSBPuFhtY8a1mUWUeSmi7kOWE6yx
 zaPXQehpa9ne5iUALKH2LINePC1kaFsnx2XS
X-Google-Smtp-Source: ABdhPJwS8nEeA1Ovh/xQ9nm1AetIMf/pLFXH7rZQfY6uwbpsF/gsoBepbpNuxQmiF1lh/APxyDOcFg==
X-Received: by 2002:adf:fb51:: with SMTP id c17mr6191200wrs.106.1625232991992; 
 Fri, 02 Jul 2021 06:36:31 -0700 (PDT)
Received: from x1w.Ascou-CH1 (pop.92-184-108-23.mobile.abo.orange.fr.
 [92.184.108.23])
 by smtp.gmail.com with ESMTPSA id t11sm3398734wrz.7.2021.07.02.06.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:36:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/18] hw/pci-host/bonito: Trace PCI config accesses smaller
 than 32-bit
Date: Fri,  2 Jul 2021 15:35:44 +0200
Message-Id: <20210702133557.60317-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210702133557.60317-1-f4bug@amsat.org>
References: <20210702133557.60317-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the datasheet section "5.7.5. Accessing PCI configuration space"
the address must be 32-bit aligned. Trace eventual accesses not
aligned to 32-bit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210624202747.1433023-3-f4bug@amsat.org>
---
 hw/pci-host/bonito.c     | 8 ++++++++
 hw/pci-host/trace-events | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index afb3d1f81d5..751fdcec689 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -52,6 +52,7 @@
 #include "hw/misc/unimp.h"
 #include "hw/registerfields.h"
 #include "qom/object.h"
+#include "trace.h"
 
 /* #define DEBUG_BONITO */
 
@@ -185,6 +186,7 @@ FIELD(BONGENCFG, PCIQUEUE,      12, 1)
 #define BONITO_PCICONF_IDSEL_OFFSET    11
 #define BONITO_PCICONF_FUN_MASK        0x700    /* [10:8] */
 #define BONITO_PCICONF_FUN_OFFSET      8
+#define BONITO_PCICONF_REG_MASK_DS     (~3)         /* Per datasheet */
 #define BONITO_PCICONF_REG_MASK        0xFC
 #define BONITO_PCICONF_REG_OFFSET      0
 
@@ -495,6 +497,9 @@ static void bonito_spciconf_write(void *opaque, hwaddr addr, uint64_t val,
     if (pciaddr == 0xffffffff) {
         return;
     }
+    if (addr & ~BONITO_PCICONF_REG_MASK_DS) {
+        trace_bonito_spciconf_small_access(addr, size);
+    }
 
     /* set the pci address in s->config_reg */
     phb->config_reg = (pciaddr) | (1u << 31);
@@ -521,6 +526,9 @@ static uint64_t bonito_spciconf_read(void *opaque, hwaddr addr, unsigned size)
     if (pciaddr == 0xffffffff) {
         return MAKE_64BIT_MASK(0, size * 8);
     }
+    if (addr & ~BONITO_PCICONF_REG_MASK_DS) {
+        trace_bonito_spciconf_small_access(addr, size);
+    }
 
     /* set the pci address in s->config_reg */
     phb->config_reg = (pciaddr) | (1u << 31);
diff --git a/hw/pci-host/trace-events b/hw/pci-host/trace-events
index f4b3a50cb0b..630e9fcc5e7 100644
--- a/hw/pci-host/trace-events
+++ b/hw/pci-host/trace-events
@@ -1,5 +1,8 @@
 # See docs/devel/tracing.rst for syntax documentation.
 
+# bonito.c
+bonito_spciconf_small_access(uint64_t addr, unsigned size) "PCI config address is smaller then 32-bit, addr: 0x%"PRIx64", size: %u"
+
 # grackle.c
 grackle_set_irq(int irq_num, int level) "set_irq num %d level %d"
 
-- 
2.31.1


