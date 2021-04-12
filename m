Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B94135C7E8
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 15:47:56 +0200 (CEST)
Received: from localhost ([::1]:49592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVwux-00007U-Ho
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 09:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVwqf-0004TE-1O
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 09:43:29 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVwqY-0003Nq-Oe
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 09:43:28 -0400
Received: by mail-wr1-x436.google.com with SMTP id w4so9257920wrt.5
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 06:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wq0OT0PY2a3GAqSAuPZbj6T1qul6+1IC1OKz3Ec1t68=;
 b=FdvJnUOt41BmJASNa0XdL8SJcOdHPJwf0l96LYc/Y4/LP0w49SW+lSffJl2eyFIN+A
 DtmS/gx4DV3/Sl3u6qaBnmE6KQ/FsLUt5fSk1U68fFLPx6li8o+D8wPhDNT0XAjDav7b
 Gy5a8X2RURDh/ezoNBazYqyy+iWrO9wzmsvdI2ilqvulpXnJ+NUMjvQXXUdzKbptbFw7
 d4HDAT3nBQYdtO6WCWH6yLTIzMYBWADZhhP3aW80h14MFrIpAFVJ9HQ0dUTX43bJGNoF
 grZ5hRWNUjcW6vB3Uy4Eshq2sb7++iJfpZ6xHgNqhN3ShGGQ/nJ8656X+8JilneqGAOm
 U48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wq0OT0PY2a3GAqSAuPZbj6T1qul6+1IC1OKz3Ec1t68=;
 b=DM3tRXtlAsJTmcFDz3qD8p04IUtPOb/NVZMUsD5gFHJ2/VwIBezm4HWm91cjIjUB75
 Avkd693rwPb4l8hjdV6GCQ5jMADCAloeYvDaapHoe1UuWikT3arDBNwz6MSN1FG+AWkQ
 ghgLR5OW/TUVlW/6pORPtRCwMUwQQE0yvy9PliT2m7x2MNMBPnCINZI4hE6K0AVjSjSx
 h58bRL0rbXRIew3/zKQTg3G1wior7banZmY/Sm1mz+ZPG0UTIe65xpDGI105VyjEpDAQ
 9l4lzF6AbPJBPzecoAnrnpF34pTmdKZD/5l3KK1Or3VGxjX/saiWBzOJxGxAXamK9REm
 kg5w==
X-Gm-Message-State: AOAM532R09KCzmXM4qzZ81XSzwmF/hVpr9Lo05vMHTVlaolkwFXMIytE
 l8d3NwoFSPdQsayfbsz5hUcFog==
X-Google-Smtp-Source: ABdhPJzqe+sfLfUlOdpn2pV/Ndvzk0tgnyFXpaMjT/ZKo450b9GGRjRdhfZ/Hj8qF3EY4e8et7t2kA==
X-Received: by 2002:a05:6000:1a8a:: with SMTP id
 f10mr31054900wry.232.1618235001546; 
 Mon, 12 Apr 2021 06:43:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p16sm19574680wrt.54.2021.04.12.06.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 06:43:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/misc/mps2-scc: Support using CFG0 bit 0 for remapping
Date: Mon, 12 Apr 2021 14:43:16 +0100
Message-Id: <20210412134317.12501-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210412134317.12501-1-peter.maydell@linaro.org>
References: <20210412134317.12501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Kumar Gala <kumar.gala@linaro.org>,
 Kevin Townsend <kevin.townsend@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On some boards, SCC config register CFG0 bit 0 controls whether
parts of the board memory map are remapped. Support this with:
 * a device property scc-cfg0 so the board can specify the
   initial value of the CFG0 register
 * an outbound GPIO line which tracks bit 0 and which the board
   can wire up to provide the remapping

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/mps2-scc.h |  9 +++++++++
 hw/misc/mps2-scc.c         | 13 ++++++++++---
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/include/hw/misc/mps2-scc.h b/include/hw/misc/mps2-scc.h
index ea261ea30d6..3b2d13ac9c3 100644
--- a/include/hw/misc/mps2-scc.h
+++ b/include/hw/misc/mps2-scc.h
@@ -18,8 +18,14 @@
  *  + QOM property "scc-cfg4": value of the read-only CFG4 register
  *  + QOM property "scc-aid": value of the read-only SCC_AID register
  *  + QOM property "scc-id": value of the read-only SCC_ID register
+ *  + QOM property "scc-cfg0": reset value of the CFG0 register
  *  + QOM property array "oscclk": reset values of the OSCCLK registers
  *    (which are accessed via the SYS_CFG channel provided by this device)
+ *  + named GPIO output "remap": this tracks the value of CFG0 register
+ *    bit 0. Boards where this bit controls memory remapping should
+ *    connect this GPIO line to a function performing that mapping.
+ *    Boards where bit 0 has no special function should leave the GPIO
+ *    output disconnected.
  */
 #ifndef MPS2_SCC_H
 #define MPS2_SCC_H
@@ -55,6 +61,9 @@ struct MPS2SCC {
     uint32_t num_oscclk;
     uint32_t *oscclk;
     uint32_t *oscclk_reset;
+    uint32_t cfg0_reset;
+
+    qemu_irq remap;
 };
 
 #endif
diff --git a/hw/misc/mps2-scc.c b/hw/misc/mps2-scc.c
index c56aca86ad5..b3b42a792cd 100644
--- a/hw/misc/mps2-scc.c
+++ b/hw/misc/mps2-scc.c
@@ -23,6 +23,7 @@
 #include "qemu/bitops.h"
 #include "trace.h"
 #include "hw/sysbus.h"
+#include "hw/irq.h"
 #include "migration/vmstate.h"
 #include "hw/registerfields.h"
 #include "hw/misc/mps2-scc.h"
@@ -186,10 +187,13 @@ static void mps2_scc_write(void *opaque, hwaddr offset, uint64_t value,
     switch (offset) {
     case A_CFG0:
         /*
-         * TODO on some boards bit 0 controls RAM remapping;
-         * on others bit 1 is CPU_WAIT.
+         * On some boards bit 0 controls board-specific remapping;
+         * we always reflect bit 0 in the 'remap' GPIO output line,
+         * and let the board wire it up or not as it chooses.
+         * TODO on some boards bit 1 is CPU_WAIT.
          */
         s->cfg0 = value;
+        qemu_set_irq(s->remap, s->cfg0 & 1);
         break;
     case A_CFG1:
         s->cfg1 = value;
@@ -283,7 +287,7 @@ static void mps2_scc_reset(DeviceState *dev)
     int i;
 
     trace_mps2_scc_reset();
-    s->cfg0 = 0;
+    s->cfg0 = s->cfg0_reset;
     s->cfg1 = 0;
     s->cfg2 = 0;
     s->cfg5 = 0;
@@ -308,6 +312,7 @@ static void mps2_scc_init(Object *obj)
 
     memory_region_init_io(&s->iomem, obj, &mps2_scc_ops, s, "mps2-scc", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
+    qdev_init_gpio_out_named(DEVICE(obj), &s->remap, "remap", 1);
 }
 
 static void mps2_scc_realize(DeviceState *dev, Error **errp)
@@ -353,6 +358,8 @@ static Property mps2_scc_properties[] = {
     DEFINE_PROP_UINT32("scc-cfg4", MPS2SCC, cfg4, 0),
     DEFINE_PROP_UINT32("scc-aid", MPS2SCC, aid, 0),
     DEFINE_PROP_UINT32("scc-id", MPS2SCC, id, 0),
+    /* Reset value for CFG0 register */
+    DEFINE_PROP_UINT32("scc-cfg0", MPS2SCC, cfg0_reset, 0),
     /*
      * These are the initial settings for the source clocks on the board.
      * In hardware they can be configured via a config file read by the
-- 
2.20.1


