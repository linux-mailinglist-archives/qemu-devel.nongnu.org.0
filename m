Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 159B52EF537
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 16:56:03 +0100 (CET)
Received: from localhost ([::1]:44084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxu7O-0008AV-5C
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 10:56:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtor-00052Q-8b
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:53 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtoo-0002yT-KU
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:53 -0500
Received: by mail-wr1-x431.google.com with SMTP id q18so9457891wrn.1
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 07:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3psp3ieItsXSg+BAwR517+P8wNoT4jZliP7RqS9B40A=;
 b=EhtsMVltRcc4ZwpAc7rVPMhrDszTP2tHtbqHLguqOGHPPBb4E5XkAPb0bXBHnAU2MS
 RSELFu0nUZoTDncYMPliuFBGJIs/BBSL2yzX7BWfBhtNY2mPinqYxiWgIgCFGw1J9dBc
 EtJk3EvHGkmJZjQkeWdd3BcbGwV3momIhTjklwsySLMYvjaQz2OJVzmlaRYQNzbAic1A
 FSLYvtYd9CRIr9aKWpnQfmbZ21So89l3NRDce5/hwLxY7GF5gRATGiFBx9/fjdB9KbhM
 Mcj6UAfJxVUC8AFiJ2XPZyY29A5mvB4ulYZzo7s7IMCGWhROoX4lHEbeHWvKEYTrzzKJ
 oMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3psp3ieItsXSg+BAwR517+P8wNoT4jZliP7RqS9B40A=;
 b=YkKPx20PHef06QnvZ4uBKjoggOHxfcqIobGwHiqORjOnigNC/7hZBImYj+bfTY9tyi
 Vqp/bEeASZ45PvTS/p0m3SlxVRV76AN2mwZYxjnaEbAzg+rD0bpAOAJmO2g8yFtvmOpe
 2+wXrclojgQH3x//RHjsF5DbjLXtdPOrIdAZceSEznBIe+/J5B+r2hcsU6NfCTFv6W7i
 Nz+cp4bid0NkwcLxO2xeRRW/GRMkoZxcw/M5AetPn9obHVGY/cCLZHy8rR0lvWqwS0pm
 NvOQuoB2opHOD3KIKHEVDREXCCZoCCSuHgdqy5Cc1ftVzMcLNPO8jlbH1NNngcwYX/h1
 0QXg==
X-Gm-Message-State: AOAM531cRMOIDt9y7G7hdsPnxrT3F2uUSbv0MbB+2wDEjkEP5aF8wOkw
 jD+WIik6d/xuPF4/d280kljeHDl3ougvyQ==
X-Google-Smtp-Source: ABdhPJzWpDyAHZ71V/jA0H0xrbdfSccIc3MOCCdZtIwnsSK4+e0SzqjvZYna8ShPU5mzaLpPOP2JqQ==
X-Received: by 2002:adf:e54a:: with SMTP id z10mr4300850wrm.1.1610120208548;
 Fri, 08 Jan 2021 07:36:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f9sm15887572wrw.81.2021.01.08.07.36.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 07:36:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/23] exynos4210_mct: Use ptimer_free() in the finalize
 function to avoid memleaks
Date: Fri,  8 Jan 2021 15:36:17 +0000
Message-Id: <20210108153621.3868-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108153621.3868-1-peter.maydell@linaro.org>
References: <20210108153621.3868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

From: Gan Qixin <ganqixin@huawei.com>

When running device-introspect-test, a memory leak occurred in the
exynos4210_mct_init function, so use ptimer_free() in the finalize function to
avoid it.

ASAN shows memory leak stack:

Indirect leak of 96 byte(s) in 1 object(s) allocated from:
    #0 0xffffab97e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
    #1 0xffffab256800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
    #2 0xaaabf555db78 in ptimer_init /qemu/hw/core/ptimer.c:432
    #3 0xaaabf56b01a0 in exynos4210_mct_init /qemu/hw/timer/exynos4210_mct.c:1505
    #4 0xaaabf6339f6c in object_initialize_with_type /qemu/qom/object.c:515
    #5 0xaaabf633a1e0 in object_new_with_type /qemu/qom/object.c:729
    #6 0xaaabf6375e40 in qmp_device_list_properties /qemu/qom/qom-qmp-cmds.c:153
    #7 0xaaabf653d8ec in qmp_marshal_device_list_properties /qemu/qapi/qapi-commands-qdev.c:59
    #8 0xaaabf6587d08 in do_qmp_dispatch_bh /qemu/qapi/qmp-dispatch.c:110
    #9 0xaaabf6552708 in aio_bh_call /qemu/util/async.c:136
    #10 0xaaabf6552708 in aio_bh_poll /qemu/util/async.c:164
    #11 0xaaabf655f19c in aio_dispatch /qemu/util/aio-posix.c:381
    #12 0xaaabf65523f4 in aio_ctx_dispatch /qemu/util/async.c:306

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Gan Qixin <ganqixin@huawei.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/exynos4210_mct.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index 439053acd2a..d0e53439968 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -1530,6 +1530,19 @@ static void exynos4210_mct_init(Object *obj)
     sysbus_init_mmio(dev, &s->iomem);
 }
 
+static void exynos4210_mct_finalize(Object *obj)
+{
+    int i;
+    Exynos4210MCTState *s = EXYNOS4210_MCT(obj);
+
+    ptimer_free(s->g_timer.ptimer_frc);
+
+    for (i = 0; i < 2; i++) {
+        ptimer_free(s->l_timer[i].tick_timer.ptimer_tick);
+        ptimer_free(s->l_timer[i].ptimer_frc);
+    }
+}
+
 static void exynos4210_mct_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -1543,6 +1556,7 @@ static const TypeInfo exynos4210_mct_info = {
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(Exynos4210MCTState),
     .instance_init = exynos4210_mct_init,
+    .instance_finalize = exynos4210_mct_finalize,
     .class_init    = exynos4210_mct_class_init,
 };
 
-- 
2.20.1


