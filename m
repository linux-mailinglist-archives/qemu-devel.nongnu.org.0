Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1643FD88F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:18:49 +0200 (CEST)
Received: from localhost ([::1]:55438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLOGW-0005rS-AB
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcc-0007E5-8K
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:35 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcV-00060F-AE
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:31 -0400
Received: by mail-wr1-x436.google.com with SMTP id q14so3764045wrp.3
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NiuR82k4Z/QjftRCChwntyHfqleW/Hw4RZMhUwxUflY=;
 b=xa9vyP1JVJ4TEgbnufk9mPKhIKrw98RYG+Y4LJ2VSMISGNiYY0NVXXhehuos36e13A
 uhXFYua7enGxO6o5v8wniksbPfKu3hXRrxPa+CbRK9Xd1MXXrPMhOs44P2+OySGaaYfF
 Rfe2Ag/LtWYrnI9YGjtEoqICr9NFjhnjqFq+gNWbMkaXv2cbBAjaEHhLn3yw/Iu8aGX8
 c+XQyS7Le2pC8m47ImFPShfbk4L2VEEH9ipGJleK2RnpiJ4rRQoWF2zxnIwn9v3JyPyz
 EPUPZ78v+FVeZboEB2K44PK7tCKXh4CJ+0J6eFPO3a0I27a18kruJqaFYE8TNdUVuzy+
 G42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NiuR82k4Z/QjftRCChwntyHfqleW/Hw4RZMhUwxUflY=;
 b=dL8tyydrFQ2UG+x1mnOQTqmcd1VWmvfCOd5cKR/aNGFvpjjsKtVOfd/akVQLmK5lCy
 IGDshdjESmPXcAblxUyTa+GmLGuSbIkeb/7dHN3rzDLltrAyo1RMFpnEAwk/mhdlnDzz
 QFGsrMAaYCtYJVb/+1OKJEnIDEngU6f+TZPYPA/+q1mPSU9kMd3V9ZFtnL2OeVKjO8mx
 97gNt4s+JdWHKDu4Yo30Ius9hAmdIsI536KajaTcCemHfgSb+k317dN7yUk1+ljdHW1d
 i+ynaNB4BGjm9Lb2ztPKLC0qqDPZnYx4omVGrqe/bVg+1Om/NF2kNBiHBsLvQvmuaddB
 6Mcg==
X-Gm-Message-State: AOAM532ID82+xydeGrNY8QdzychwcCAm2Ku3xY7k+PGZIPxRpRGVR5LS
 2t+Hm7bhijkQbeub5IkTz2bs4vAULdgaIA==
X-Google-Smtp-Source: ABdhPJy1VZee5qV1EJg4x3GXXaoancIXeCXq7dvUoXm4yLPsyBkmwqExaHh9qxrmaTjUrBupyZtWvw==
X-Received: by 2002:adf:b7c1:: with SMTP id t1mr37470496wre.387.1630492644655; 
 Wed, 01 Sep 2021 03:37:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 43/51] hw/arm/stellaris: Wire sysclk up to armv7m
Date: Wed,  1 Sep 2021 11:36:45 +0100
Message-Id: <20210901103653.13435-44-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Connect the sysclk to the armv7m object.  This board's SoC does not
connect up the systick reference clock, so we don't need to connect a
refclk.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alexandre Iooss <erdnaxe@crans.org>
Message-id: 20210812093356.1946-18-peter.maydell@linaro.org
---
 hw/arm/stellaris.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index bf24abd44fd..8c8bd39e2fe 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1322,7 +1322,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     DeviceState *ssys_dev;
     int i;
     int j;
-    uint8_t *macaddr;
+    const uint8_t *macaddr;
 
     MemoryRegion *sram = g_new(MemoryRegion, 1);
     MemoryRegion *flash = g_new(MemoryRegion, 1);
@@ -1364,6 +1364,9 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     qdev_prop_set_uint32(nvic, "num-irq", NUM_IRQ_LINES);
     qdev_prop_set_string(nvic, "cpu-type", ms->cpu_type);
     qdev_prop_set_bit(nvic, "enable-bitband", true);
+    qdev_connect_clock_in(nvic, "cpuclk",
+                          qdev_get_clock_out(ssys_dev, "SYSCLK"));
+    /* This SoC does not connect the systick reference clock */
     object_property_set_link(OBJECT(nvic), "memory",
                              OBJECT(get_system_memory()), &error_abort);
     /* This will exit with an error if the user passed us a bad cpu_type */
-- 
2.20.1


