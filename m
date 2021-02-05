Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D96310F69
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 19:04:00 +0100 (CET)
Received: from localhost ([::1]:56560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85SZ-0000cJ-FA
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 13:03:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84TZ-0006kM-Uz
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:00:58 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:34278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84T8-00041a-Nh
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:00:57 -0500
Received: by mail-wm1-x32b.google.com with SMTP id o10so8223197wmc.1
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FHr6FuqE0B2b9d2HJA4DI+zb7En8n9XfTjpsu+vmnps=;
 b=VwtlGJvqc9vzrrtxKLU+wWrLnXTjlDfg0aroLhg4kM1G3UF0A8Z4NgDMZ9mYx/1fBg
 RCj8pWT1J6SogJaBttzVilfetr05xULGMdAfbCenKz8G92aSaQmaPViZhO2ZxtpT+tUp
 l9YcYGvE7uKWs27P4csHIGkWs3vCdfXY52/ZNd17YGHY69p/gb4ASNOHtmanPAMACbb+
 ytBqkBAbse4qGtcxToac1I0l4SbIqjw9gomjNWbwVWkObH34A6L1piRGLYeoZGr43P/w
 TScjOuZ75Xnetq9YJxCBX/n3OX9qXHfTNH8jswv7EsBN1zte7D0bVWcGz3uXFe67ahbs
 kkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FHr6FuqE0B2b9d2HJA4DI+zb7En8n9XfTjpsu+vmnps=;
 b=o0pyHJXj90k53I1OxCd3X28gSzKD/z+BRnfWbjMqhhzcM9Z/Td5s55S1sGhZk7ziJy
 H+QAd8WfZkZxq1o/wTA+/bEHjsJ2BYezQhrlAEKN6Md8DxesIqA0gXoO8D/vI61kdtCT
 Oj82hK0lz00LQUpg9PZNu3TSw6/MzA/qUUe6ZymXXtpu2CYGkbdHH6pefGuPtCyTCWk7
 nBS3RDmVK2Q0F65wtg88CUDCR9oq9DAW2njTiWLRkV/RLtm2eC4cvcT2JPPSTcrs3qnp
 erYusCGNPFu5aJS5Rr5lMTMwRYVJTXsm9fyqyoUyA0wAQDrv8oFFz7qRA2/tQmF70VzF
 7eag==
X-Gm-Message-State: AOAM532cO9cprDRSmVMXQCVTUMpSUfRkXjsqQQtoydo6Rr/jdfPoEodT
 hBZHHiKdkzsb7L9TFCMVqM1oyIAmJkAocw==
X-Google-Smtp-Source: ABdhPJzO8461YBBzNNJZgcfXlkxRXibCIejMuMAm0szLwSMhmwceM2Pv3abohSEFdFb9voabClranw==
X-Received: by 2002:a05:600c:3504:: with SMTP id
 h4mr4444267wmq.168.1612544425124; 
 Fri, 05 Feb 2021 09:00:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l11sm12200010wrt.23.2021.02.05.09.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:00:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 04/24] hw/arm/mps2-tz: Make the OSCCLK settings be
 configurable per-board
Date: Fri,  5 Feb 2021 16:59:59 +0000
Message-Id: <20210205170019.25319-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205170019.25319-1-peter.maydell@linaro.org>
References: <20210205170019.25319-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


