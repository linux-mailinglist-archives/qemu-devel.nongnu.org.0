Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB324F1934
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 18:12:43 +0200 (CEST)
Received: from localhost ([::1]:45002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbPJp-0004ZU-RY
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 12:12:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOvD-0004xL-TV
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:47:16 -0400
Received: from [2a00:1450:4864:20::434] (port=33543
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOv8-0000UV-MZ
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:47:13 -0400
Received: by mail-wr1-x434.google.com with SMTP id c7so15264114wrd.0
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 08:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oWAhaXBe9lqNR7p1VSt+0MfxhqXZeJdWi0giFNs4AEs=;
 b=lbX8/YRWvzFHR4ZzMc56InuCEyFSTntBuLsq5vXGEGsUb6Gp16jV5GIGjHB7WJhMiR
 8/8hhXzMPpxqIxiF16DNOe7LWyzADn1fIO3cvpsibbp4DrKpN0Q/xncg3QrHaGaqaNZT
 SBJswxq3E4t90J3nXEJf6P2ELg6IEXXTdYr7310vtQgkOaxQF8B+eePUIq4uqo7TFhWw
 DNS8mrSfbS8LNlldF4kgQPVxqBKdfNYKTWrXcuugqsQiPuiR4uaPazKQ6N9BauOsJpFf
 DgKLH+G2ULkbrSfVi7QYUqt2yWWMuaiJsPh+lvQ55F09NzIUnGz5lwoV2Dnj2W8ZCIex
 iFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oWAhaXBe9lqNR7p1VSt+0MfxhqXZeJdWi0giFNs4AEs=;
 b=XqW9U/ji2bgRDB+8BYa6h6Wgt5FXomIcH5gEs5wSHOAENlg2TttJFM192+tJvJDlmf
 3plt3joFz3QBvtoHEhRcuqNACD6IeD3LlcQt7OfmPRMg8DJVFuThT7fn/QegN0SdaNgi
 HDm2kMBM27wGIm6xtlDgjUkCItBjRk/XdLJ08lJOGrdzuU0pc5g/pNAKcTx7P2U+z/fr
 RzSUK7mnchbXjLYSRE7XsTkO18VEfOPKwB+yQW2WoEFnP+B3smN9bLn3UJwv3C2KmydT
 /Kga1++iHfre5SfzHTjn/8J9L4UPMxuTxTi6mUyoCghPGRxXkTkKY9G+gohwvOvFkeJG
 H4hw==
X-Gm-Message-State: AOAM530f5yZBDZGUwPEphCEgWque1dp1YyZrAqW1sEmBSHvz7C2lWOq2
 9bXybC+yID66ZqEzUfKTFefqgw==
X-Google-Smtp-Source: ABdhPJzu8MN7u/vxyAbogMwCJRPmQesL4Mlaq5lJpYBzUu6SAmq4AjaQLtE9bERCFypvwqFgFv/+3A==
X-Received: by 2002:adf:e346:0:b0:205:97d0:50db with SMTP id
 n6-20020adfe346000000b0020597d050dbmr269874wrj.257.1649087229391; 
 Mon, 04 Apr 2022 08:47:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a056000184800b002040e925afasm11731347wri.59.2022.04.04.08.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 08:47:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.1 09/18] hw/arm/exynos4210: Drop ext_gic_irq[] from
 Exynos4210Irq struct
Date: Mon,  4 Apr 2022 16:46:49 +0100
Message-Id: <20220404154658.565020-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404154658.565020-1-peter.maydell@linaro.org>
References: <20220404154658.565020-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only time we use the ext_gic_irq[] array in the Exynos4210Irq
struct is during realize of the SoC -- we initialize it with the
input IRQs of the external GIC device, and then connect those to
outputs of other devices further on in realize (including in the
exynos4210_init_board_irqs() function).  Now that the ext_gic object
is easily accessible as s->ext_gic we can make the connections
directly from one device to the other without going via this array.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/exynos4210.h |  1 -
 hw/arm/exynos4210.c         | 12 ++++++------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index f35ae90000f..08f52c511ff 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -83,7 +83,6 @@
 typedef struct Exynos4210Irq {
     qemu_irq int_combiner_irq[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
     qemu_irq ext_combiner_irq[EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ];
-    qemu_irq ext_gic_irq[EXYNOS4210_EXT_GIC_NIRQ];
 } Exynos4210Irq;
 
 struct Exynos4210State {
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 2058df9aecf..5a41af089f9 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -257,6 +257,7 @@ static void exynos4210_init_board_irqs(Exynos4210State *s)
 {
     uint32_t grp, bit, irq_id, n;
     Exynos4210Irq *is = &s->irqs;
+    DeviceState *extgicdev = DEVICE(&s->ext_gic);
 
     for (n = 0; n < EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ; n++) {
         irq_id = 0;
@@ -272,7 +273,8 @@ static void exynos4210_init_board_irqs(Exynos4210State *s)
         }
         if (irq_id) {
             s->irq_table[n] = qemu_irq_split(is->int_combiner_irq[n],
-                    is->ext_gic_irq[irq_id - 32]);
+                                             qdev_get_gpio_in(extgicdev,
+                                                              irq_id - 32));
         } else {
             s->irq_table[n] = qemu_irq_split(is->int_combiner_irq[n],
                     is->ext_combiner_irq[n]);
@@ -287,7 +289,8 @@ static void exynos4210_init_board_irqs(Exynos4210State *s)
 
         if (irq_id) {
             s->irq_table[n] = qemu_irq_split(is->int_combiner_irq[n],
-                    is->ext_gic_irq[irq_id - 32]);
+                                             qdev_get_gpio_in(extgicdev,
+                                                              irq_id - 32));
         }
     }
 }
@@ -466,9 +469,6 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
         sysbus_connect_irq(busdev, n,
                            qdev_get_gpio_in(DEVICE(&s->cpu_irq_orgate[n]), 1));
     }
-    for (n = 0; n < EXYNOS4210_EXT_GIC_NIRQ; n++) {
-        s->irqs.ext_gic_irq[n] = qdev_get_gpio_in(DEVICE(&s->ext_gic), n);
-    }
 
     /* Internal Interrupt Combiner */
     dev = qdev_new("exynos4210.combiner");
@@ -487,7 +487,7 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
     busdev = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(busdev, &error_fatal);
     for (n = 0; n < EXYNOS4210_MAX_INT_COMBINER_OUT_IRQ; n++) {
-        sysbus_connect_irq(busdev, n, s->irqs.ext_gic_irq[n]);
+        sysbus_connect_irq(busdev, n, qdev_get_gpio_in(DEVICE(&s->ext_gic), n));
     }
     exynos4210_combiner_get_gpioin(&s->irqs, dev, 1);
     sysbus_mmio_map(busdev, 0, EXYNOS4210_EXT_COMBINER_BASE_ADDR);
-- 
2.25.1


