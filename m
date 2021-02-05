Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC87310F2E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 18:55:42 +0100 (CET)
Received: from localhost ([::1]:36604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85KX-0000Qm-M2
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 12:55:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84TG-0006bq-KU
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:00:40 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:54108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84T3-0003zK-Cn
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:00:36 -0500
Received: by mail-wm1-x336.google.com with SMTP id j11so6564364wmi.3
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=g+EZctwruwxJ+bIOTViWFK3zdYVscML+NxpdSxKPVAo=;
 b=Qvp1pu4u+vQKimrApKXyxwfCm/A3lbHEMeMumikqS/kes2ckAZiLYMYis9DgDtPnuV
 sAUxp9ba40f0HUl5kqgedpLD8Rcr6YJrrYrjaEJ9OM+ftu/DC1K5s60/PRBUcDqhSSdp
 LbYmxV6TN06Z8J1GW8cbf0PbcXxeAyEcVIEorL6BoJuP4/kNUptADtLhN50z1q2b6wgx
 vw1SkZgeLe7aDBipIDUU4YMPqvno26U+mlzSVFZLt/TN+Xla4yu8N/+amQdqeUQl209c
 LvrUrfN7S2rSUH7/JjLFyn/kHDGguVo+gKT7Rl2ze2VEa/270LAWSuJYESCaf9Qn9oxD
 vp8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g+EZctwruwxJ+bIOTViWFK3zdYVscML+NxpdSxKPVAo=;
 b=LmozJUo3qHDnHA+cXP/CjVneo8xyPVsI1b6R1eh9qsHqH1JmGmDigxqatu+dPlDFYw
 q6Pz3QL29RcHje43bpdkFIbOo9eKAMkF2fWwrDjnlC1wkmo2TqvY2Dk4otwbQM86I3qy
 niQMK7NZfCj/gyhlaUG2gWcDzza5fqwtbFVFVDXzTKi3XW362Xwu1np2vx0f3uEUDzG9
 M/brke7EFzUIqfNTMLwKhFo63jAoAcuEXDCc4HjgYttoe5mN32Tm2vVK/jCRzNgI4oyc
 QmUtRsTay9I79gRKXRQB0T8hr/zuYNxERigRVeANgHMFPXfnGOdXug+3LLwbMnCKGlD2
 fCcw==
X-Gm-Message-State: AOAM531gnDl+NzOoM9zQ6xqb9pnbNE15/wnOpdirqKhI/NWcHdg80qFk
 FoYMHo7aFqjUVjjRjKd45TbzjA==
X-Google-Smtp-Source: ABdhPJyJI+24ZSsT72N9vbEpG1HnwbDWVFUEVkUK1ECZDF0tZyMXEj6Spu+2w00GiAlUK0SjUMuEKQ==
X-Received: by 2002:a1c:2905:: with SMTP id p5mr4288589wmp.156.1612544422513; 
 Fri, 05 Feb 2021 09:00:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l11sm12200010wrt.23.2021.02.05.09.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:00:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 01/24] hw/arm/mps2-tz: Make SYSCLK frequency board-specific
Date: Fri,  5 Feb 2021 16:59:56 +0000
Message-Id: <20210205170019.25319-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205170019.25319-1-peter.maydell@linaro.org>
References: <20210205170019.25319-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

The AN524 has a different SYSCLK frequency from the AN505 and AN521;
make the SYSCLK frequency a field in the MPS2TZMachineClass rather
than a compile-time constant so we can support the AN524.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


