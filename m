Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012F231B879
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 12:58:10 +0100 (CET)
Received: from localhost ([::1]:50406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcW1-0006XV-1n
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 06:58:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQD-0006nI-2c
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:09 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:37483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQA-0003qy-1K
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:08 -0500
Received: by mail-wr1-x430.google.com with SMTP id v15so8506810wrx.4
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 03:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PJ5Ra3RoZTdSQMlk8tvN9OiLpHO5i6WdVZO2RyHhEAs=;
 b=GYvhHamxOYpdFGBeN6ym5PzbLQ4e1nXVeGAiIvPxdpvIB4XExT5eCOoIRQMkBlp/tW
 1FGxIs3Z2qnxL4Q3dzxI2iWYLhhjMNW44cFLlljEILeMfn+OP+rjxeEfiICFo8po36Tw
 oHsDQhCJz1jTXqiqnHqgvg1Hg96ao6078pDdg+AV//iLpD1I5XpAXTqtrILPnUQkF+uf
 ZYidsf9CBzZrIWJMngcNq/X0BaJfSwxYAH5gOPlCMS6FPxLpvuV2cgVlFgzqtmU8InoP
 brc7FDmhrna+d0bwog+ez6W1SXcKTZ+L90APG1MmhG6cM5FsV567qR/8YSeNYUvl79BL
 xbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PJ5Ra3RoZTdSQMlk8tvN9OiLpHO5i6WdVZO2RyHhEAs=;
 b=kvPe14y5E3BVvckAFyTxLHWer128Wo7iFTLzJ+6lxyssIsckHf75neFZHd5k6l1VDG
 mfxJG3f46IjnHkH39w5hN91pSXY9F+FRkKu/wN1e1PNvzzwSqVd6GN9owLxkOX7+XZ2G
 VbhJ1XuOxsQfEHljhtGmGvrBNodVS5BlEgNCkS0AHSsMg9nFX0cR7E3XfkplyVnFvbvd
 yk4SDeP9i/jY17rozktZV7wClucEhuSKPZ2FbL8X6Tj0ba+CuiW9Xwmv17catM0OZiIL
 bP/cXA1Jb9oJScqIHuR59DZBQA+f6aHad2mSu00LiN4zcUWgu9ghXoTj1sB0F+gK+fR5
 1/EQ==
X-Gm-Message-State: AOAM532inadQON70YdMLHnmwngiy0Qe+eJ9ZcN2zIChmJzWxxAlarqBy
 zL4eIadGj3woMCckOsE7fGpksw==
X-Google-Smtp-Source: ABdhPJzS4Y3IzQNIQy3CZ2nVoQe2BrRbmGm1WofmRhgrqRbiZervKwhJtPUdOM3WVyy4o2COvMINdg==
X-Received: by 2002:adf:b611:: with SMTP id f17mr18119562wre.8.1613389924860; 
 Mon, 15 Feb 2021 03:52:04 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:52:04 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 04/24] hw/arm/mps2-tz: Make the OSCCLK settings be
 configurable per-board
Date: Mon, 15 Feb 2021 11:51:18 +0000
Message-Id: <20210215115138.20465-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The AN505 and AN511 happen to share the same OSCCLK values, but the
AN524 will have a different set (and more of them), so split the
settings out to be per-board.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/mps2-tz.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 976f5f5c682..9add1453cc2 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -77,6 +77,8 @@ struct MPS2TZMachineClass {
     MPS2TZFPGAType fpga_type;
     uint32_t scc_id;
     uint32_t sysclk_frq; /* Main SYSCLK frequency in Hz */
+    uint32_t len_oscclk;
+    const uint32_t *oscclk;
     const char *armsse_type;
 };
 
@@ -115,6 +117,12 @@ OBJECT_DECLARE_TYPE(MPS2TZMachineState, MPS2TZMachineClass, MPS2TZ_MACHINE)
 /* Slow 32Khz S32KCLK frequency in Hz */
 #define S32KCLK_FRQ (32 * 1000)
 
+static const uint32_t an505_oscclk[] = {
+    40000000,
+    24580000,
+    25000000,
+};
+
 /* Create an alias of an entire original MemoryRegion @orig
  * located at @base in the memory map.
  */
@@ -213,17 +221,18 @@ static MemoryRegion *make_scc(MPS2TZMachineState *mms, void *opaque,
     MPS2SCC *scc = opaque;
     DeviceState *sccdev;
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
+    int i;
 
     object_initialize_child(OBJECT(mms), "scc", scc, TYPE_MPS2_SCC);
     sccdev = DEVICE(scc);
     qdev_prop_set_uint32(sccdev, "scc-cfg4", 0x2);
     qdev_prop_set_uint32(sccdev, "scc-aid", 0x00200008);
     qdev_prop_set_uint32(sccdev, "scc-id", mmc->scc_id);
-    /* This will need to be per-FPGA image eventually */
-    qdev_prop_set_uint32(sccdev, "len-oscclk", 3);
-    qdev_prop_set_uint32(sccdev, "oscclk[0]", 40000000);
-    qdev_prop_set_uint32(sccdev, "oscclk[1]", 24580000);
-    qdev_prop_set_uint32(sccdev, "oscclk[2]", 25000000);
+    qdev_prop_set_uint32(sccdev, "len-oscclk", mmc->len_oscclk);
+    for (i = 0; i < mmc->len_oscclk; i++) {
+        g_autofree char *propname = g_strdup_printf("oscclk[%d]", i);
+        qdev_prop_set_uint32(sccdev, propname, mmc->oscclk[i]);
+    }
     sysbus_realize(SYS_BUS_DEVICE(scc), &error_fatal);
     return sysbus_mmio_get_region(SYS_BUS_DEVICE(sccdev), 0);
 }
@@ -676,6 +685,8 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
     mmc->scc_id = 0x41045050;
     mmc->sysclk_frq = 20 * 1000 * 1000; /* 20MHz */
+    mmc->oscclk = an505_oscclk;
+    mmc->len_oscclk = ARRAY_SIZE(an505_oscclk);
     mmc->armsse_type = TYPE_IOTKIT;
 }
 
@@ -692,6 +703,8 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
     mmc->scc_id = 0x41045210;
     mmc->sysclk_frq = 20 * 1000 * 1000; /* 20MHz */
+    mmc->oscclk = an505_oscclk; /* AN521 is the same as AN505 here */
+    mmc->len_oscclk = ARRAY_SIZE(an505_oscclk);
     mmc->armsse_type = TYPE_SSE200;
 }
 
-- 
2.20.1


