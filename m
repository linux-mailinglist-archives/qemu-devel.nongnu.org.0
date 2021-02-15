Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 511AB31B873
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 12:56:11 +0100 (CET)
Received: from localhost ([::1]:43362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcU6-0003bH-At
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 06:56:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQ4-0006hh-A8
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:01 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQ1-0003mJ-3T
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:00 -0500
Received: by mail-wr1-x42c.google.com with SMTP id v1so8500039wrd.6
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 03:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4jVa3xe/kMi+C9vLk6K1uU55ZtyS+eyTIRH5FY6nhOc=;
 b=EJyJbHanGn5ZHrQvGMNFGCH/jR86jTMdJZRO08nuBk2ZqRG1BvS2ZH18f9zdxNyWg8
 jD2jw3l0PgxuOQgi+SiO0KpXwYK5gt1C5lAQ+KFzP+GlpiXEiJ9X42vZf/Cq5UIInOvp
 GM6idh78MFt0yvNXwiV+iIwEMrI0uMPXKSy1wh37Ep7vkqPw/zx1Vu82Niq9YKp0jmK5
 ULM9FoAQtzCIXi46+BQVyuPMaLEdo2qFtDgFwl9q+Qx9l7oDx/7GeJONTVRDCB8S/BH8
 ZPh+Revu877iZLLcW38ijp+bUpLNg5MWwjemiYtPTH2FOn3rIfHKleQMaPhTuDB0aJRo
 B90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4jVa3xe/kMi+C9vLk6K1uU55ZtyS+eyTIRH5FY6nhOc=;
 b=BTYaSpA7tgu8LJwvHBMAGYh4ijNie0UUX1QH9v/X9dLWk0L5L4kNkPiKj6WBwMQhvy
 3Xtvq9NvtZm+1KV1c9NX9kZWDtScFvgxTZBLx+wjt9AL/EvLWzSFra634zfrdIEri4Lx
 jwKM5bkbcz/t2ndh/fD0F7HgVHDaObbi892skESPQc2NP7fxTeQsNFvBoK5NZo90UiQn
 NKJ5RW6ruAhyXeLsLUjMihNc0qrYPh8mTUrA33IgwqxIJnkbmLCdsZFwsymcGwdICz6I
 RHQXF4WycaSqxQcJye5U4/86MHSG2tkRQsA20l3UhGoAU/+9MluZzd5Ife+qU+9D2mUM
 L0mQ==
X-Gm-Message-State: AOAM530cnesm7ZghfuRX69rGFKQSRCFZQybgT/Gerg/2f7xwamzauCxV
 QVB8l7NZ3toZxux53pQmmJehCEBfDwsiVQ==
X-Google-Smtp-Source: ABdhPJx7hiTV86qckulmNoY6OcJpUgAvWXDqKWZJWGdkrZoWIP+gwJfNu1JvCUovZwnS8hP0M+m2tQ==
X-Received: by 2002:a5d:62ce:: with SMTP id o14mr12036703wrv.174.1613389914687; 
 Mon, 15 Feb 2021 03:51:54 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:51:54 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 01/24] hw/arm/mps2-tz: Make SYSCLK frequency board-specific
Date: Mon, 15 Feb 2021 11:51:15 +0000
Message-Id: <20210215115138.20465-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

The AN524 has a different SYSCLK frequency from the AN505 and AN521;
make the SYSCLK frequency a field in the MPS2TZMachineClass rather
than a compile-time constant so we can support the AN524.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/mps2-tz.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 90caa914934..82ce6262817 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -76,6 +76,7 @@ struct MPS2TZMachineClass {
     MachineClass parent;
     MPS2TZFPGAType fpga_type;
     uint32_t scc_id;
+    uint32_t sysclk_frq; /* Main SYSCLK frequency in Hz */
     const char *armsse_type;
 };
 
@@ -111,8 +112,6 @@ struct MPS2TZMachineState {
 
 OBJECT_DECLARE_TYPE(MPS2TZMachineState, MPS2TZMachineClass, MPS2TZ_MACHINE)
 
-/* Main SYSCLK frequency in Hz */
-#define SYSCLK_FRQ 20000000
 /* Slow 32Khz S32KCLK frequency in Hz */
 #define S32KCLK_FRQ (32 * 1000)
 
@@ -186,6 +185,7 @@ static MemoryRegion *make_unimp_dev(MPS2TZMachineState *mms,
 static MemoryRegion *make_uart(MPS2TZMachineState *mms, void *opaque,
                                const char *name, hwaddr size)
 {
+    MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
     CMSDKAPBUART *uart = opaque;
     int i = uart - &mms->uart[0];
     int rxirqno = i * 2;
@@ -196,7 +196,7 @@ static MemoryRegion *make_uart(MPS2TZMachineState *mms, void *opaque,
 
     object_initialize_child(OBJECT(mms), name, uart, TYPE_CMSDK_APB_UART);
     qdev_prop_set_chr(DEVICE(uart), "chardev", serial_hd(i));
-    qdev_prop_set_uint32(DEVICE(uart), "pclk-frq", SYSCLK_FRQ);
+    qdev_prop_set_uint32(DEVICE(uart), "pclk-frq", mmc->sysclk_frq);
     sysbus_realize(SYS_BUS_DEVICE(uart), &error_fatal);
     s = SYS_BUS_DEVICE(uart);
     sysbus_connect_irq(s, 0, get_sse_irq_in(mms, txirqno));
@@ -403,7 +403,7 @@ static void mps2tz_common_init(MachineState *machine)
 
     /* These clocks don't need migration because they are fixed-frequency */
     mms->sysclk = clock_new(OBJECT(machine), "SYSCLK");
-    clock_set_hz(mms->sysclk, SYSCLK_FRQ);
+    clock_set_hz(mms->sysclk, mmc->sysclk_frq);
     mms->s32kclk = clock_new(OBJECT(machine), "S32KCLK");
     clock_set_hz(mms->s32kclk, S32KCLK_FRQ);
 
@@ -670,6 +670,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
     mmc->fpga_type = FPGA_AN505;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
     mmc->scc_id = 0x41045050;
+    mmc->sysclk_frq = 20 * 1000 * 1000; /* 20MHz */
     mmc->armsse_type = TYPE_IOTKIT;
 }
 
@@ -685,6 +686,7 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
     mmc->fpga_type = FPGA_AN521;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
     mmc->scc_id = 0x41045210;
+    mmc->sysclk_frq = 20 * 1000 * 1000; /* 20MHz */
     mmc->armsse_type = TYPE_SSE200;
 }
 
-- 
2.20.1


