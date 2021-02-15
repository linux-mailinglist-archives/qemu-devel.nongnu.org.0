Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7442331B883
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 12:59:41 +0100 (CET)
Received: from localhost ([::1]:56952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcXU-0000oI-G0
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 06:59:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQN-0007DO-6E
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:19 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:38152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQK-0003vJ-91
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:18 -0500
Received: by mail-wm1-x336.google.com with SMTP id x4so9060386wmi.3
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 03:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oXZJdmuHAUaTxViiBBTMLXgaD9//CuJ3J4es1nlQ2XM=;
 b=rev3AuoTDjhbNSys8k4mFujpcmZqOtgy7mxYuemVCzeox9hVgOoJQSDVdDB0ATvHH4
 leuVEzeqxiIdyVPyX06ip/sTyATmYjBx9SD6xI9HNy1EwNCpfX2OxXUce6nlvcgxlX0I
 6s2DIn9ogiomVwrdXFvRFtfi4QPhEyHJsvmw9YjQVCzWcnfpQ/3Tu8Pf+fIYbYC9dDH/
 SpNOX95jvZETUxgcsu/UCos1j6SpGBtMfgjLOBgmmGwXT3GLO7PrIouT01GDKuFn2dR+
 nVCy3s7f7MY0Nw26d3dILXPyZJPmgNCvPH487w9fDqGypIl2BzXLCprV9WhVVCLl0k37
 pPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oXZJdmuHAUaTxViiBBTMLXgaD9//CuJ3J4es1nlQ2XM=;
 b=jVxGcXv4RX0JJNjXhRE/qh62ufw4cY64S7+er6n6yGy1k0v1Aw6OCGDMMF+FcGH8bl
 Yzy68R2eHL5a0W4w3VyVT9vh45CH9OBHF/rlAh4N9yJx7z2oLMyNhA+7dmc4wJRo/j6B
 a6FhdISOYLd8RTsQxK89+PvS3eR/wRB30o4lomswUH4ZkwGaVIIZy51WaqW+fFnmaZ7E
 Ealn/SQUSUYUqGhsTUiPyt1osYFtXzWz8+Slro/wmo4EfMnpDpi+4jNB0U/XA9YQ2RKk
 QS/h6aS9+kEP9ZGmngabpmwoRaiYVDDWH1WsTwFU2bFWbTsc3CGOqFenHNTF7n50EXcP
 OQYQ==
X-Gm-Message-State: AOAM532Cp6IbQlCV4fvYOH0kTg5aV13XhjaOQFeWEY2m0UNjCJVMnkV6
 mB3PvFdRKp/B2lVYuSrImwG3wA==
X-Google-Smtp-Source: ABdhPJwyPsLj2a7Ts3Lu2dfxTirtHsBABw0xGcGinpNiHPuhiL3ju2++LNzcOKN2izWjTG6fY85iIg==
X-Received: by 2002:a05:600c:2dd0:: with SMTP id
 e16mr14528115wmh.129.1613389934819; 
 Mon, 15 Feb 2021 03:52:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:52:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 07/24] hw/arm/mps2-tz: Make FPGAIO switch and LED config
 per-board
Date: Mon, 15 Feb 2021 11:51:21 +0000
Message-Id: <20210215115138.20465-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Set the FPGAIO num-leds and have-switches properties explicitly
per-board, rather than relying on the defaults.  The AN505 and AN521
both have the same settings as the default values, but the AN524 will
be different.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/mps2-tz.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 9add1453cc2..6e345cf1f09 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -79,6 +79,8 @@ struct MPS2TZMachineClass {
     uint32_t sysclk_frq; /* Main SYSCLK frequency in Hz */
     uint32_t len_oscclk;
     const uint32_t *oscclk;
+    uint32_t fpgaio_num_leds; /* Number of LEDs in FPGAIO LED0 register */
+    bool fpgaio_has_switches; /* Does FPGAIO have SWITCH register? */
     const char *armsse_type;
 };
 
@@ -241,8 +243,11 @@ static MemoryRegion *make_fpgaio(MPS2TZMachineState *mms, void *opaque,
                                  const char *name, hwaddr size)
 {
     MPS2FPGAIO *fpgaio = opaque;
+    MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
 
     object_initialize_child(OBJECT(mms), "fpgaio", fpgaio, TYPE_MPS2_FPGAIO);
+    qdev_prop_set_uint32(DEVICE(fpgaio), "num-leds", mmc->fpgaio_num_leds);
+    qdev_prop_set_bit(DEVICE(fpgaio), "has-switches", mmc->fpgaio_has_switches);
     sysbus_realize(SYS_BUS_DEVICE(fpgaio), &error_fatal);
     return sysbus_mmio_get_region(SYS_BUS_DEVICE(fpgaio), 0);
 }
@@ -687,6 +692,8 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
     mmc->sysclk_frq = 20 * 1000 * 1000; /* 20MHz */
     mmc->oscclk = an505_oscclk;
     mmc->len_oscclk = ARRAY_SIZE(an505_oscclk);
+    mmc->fpgaio_num_leds = 2;
+    mmc->fpgaio_has_switches = false;
     mmc->armsse_type = TYPE_IOTKIT;
 }
 
@@ -705,6 +712,8 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
     mmc->sysclk_frq = 20 * 1000 * 1000; /* 20MHz */
     mmc->oscclk = an505_oscclk; /* AN521 is the same as AN505 here */
     mmc->len_oscclk = ARRAY_SIZE(an505_oscclk);
+    mmc->fpgaio_num_leds = 2;
+    mmc->fpgaio_has_switches = false;
     mmc->armsse_type = TYPE_SSE200;
 }
 
-- 
2.20.1


