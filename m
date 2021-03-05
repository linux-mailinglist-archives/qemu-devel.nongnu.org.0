Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D5D32F1E1
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:53:44 +0100 (CET)
Received: from localhost ([::1]:60688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEdz-0001fi-Nw
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:53:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3R-00073q-QL
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:57 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3B-0007ev-IA
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:57 -0500
Received: by mail-wr1-x430.google.com with SMTP id f12so2877145wrx.8
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pmtyp4YEm82FhXKcdDUENPsiBIPIDcSVA5UvXxaAEr0=;
 b=wYx+IfH/Dwtr8Fq73XK/QcQ1058nIBFxsuQW10h4TFsuBqIUl5FL6IWdfNR2uILUlZ
 n0HMCMgAasC1MNZm3hs6NIrFB225vHg5lJbjvlhm9aORCvzwjZ3xU8p5zk0bkvus2GVL
 lMifo/AJbkex1RfeiC2EAhaCWRTwmf6VyaEn9di+xwMo/KQLE0CKLJy8GfZz6VyOxM4/
 fserY25rHwnsABU5rDqDnUYpwsdCC49mF2+ukdFjvWwKmBiy+uNo5jUvB2Oc0zCC1kvb
 b8btpCL8fPJqpIggmtOK8lxx+qXAS9vKjIt+nyA4gacoQdq/KDKa0w2EiB8PsGE4M8hP
 0/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pmtyp4YEm82FhXKcdDUENPsiBIPIDcSVA5UvXxaAEr0=;
 b=KqQoCVqbo2VGxz2E7iVcD4XyroUy2xeB8R8QJWmAFrryJC4Gzq7I2dxZQW/tzoBMKh
 VMjqhx9rajMVu1cFRJDuITyoIa6R+SKtrX4IVC405VtEkTcTl2EkuXuGiQ4Ga4b5FnoR
 R3m1pW+uSoyZDBf/Q7FvHcjn3e6ob/K5yFdzSwT45245tpkkfRGwt9E78Vl2UOLd510/
 6hblz9koC0zxID0TTetr1iLYVTJWIA1co4YKpHiaFSZiFw4oqotBSTTwJaAkeGJu7HYV
 CYdftAsuhsRaT6fkR1Y6UtLU2lxbGeRYOcrlc9XK0ZbGO/9DijsQv4spPSzW4r8+KFLe
 1yZw==
X-Gm-Message-State: AOAM533aC1gDMMzey1M+F7CkGjmmMsNt33jvITdJ1ykyZ5LN5CWWnm9E
 flDO4rWBNcYV7Tn4chPE7m6LBjbPmK4xRA==
X-Google-Smtp-Source: ABdhPJx/dxeFqG5k6BA1XAMPZWYGoHNecPLL1z4ISFTgvy7B9rFVAE0WzV9tZUbW+8SQKn4nv0GYVg==
X-Received: by 2002:a5d:6c66:: with SMTP id r6mr10378774wrz.407.1614964537941; 
 Fri, 05 Mar 2021 09:15:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/49] hw/arm/mps2-tz: Make the OSCCLK settings be configurable
 per-board
Date: Fri,  5 Mar 2021 17:14:55 +0000
Message-Id: <20210305171515.1038-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The AN505 and AN511 happen to share the same OSCCLK values, but the
AN524 will have a different set (and more of them), so split the
settings out to be per-board.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210215115138.20465-5-peter.maydell@linaro.org
---
 hw/arm/mps2-tz.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 976f5f5c682..0fce4f9395c 100644
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
+    uint32_t i;
 
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
+        g_autofree char *propname = g_strdup_printf("oscclk[%u]", i);
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


