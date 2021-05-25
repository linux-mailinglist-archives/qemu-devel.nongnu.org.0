Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1E139049C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:08:32 +0200 (CEST)
Received: from localhost ([::1]:35616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYfW-0002sX-UR
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYap-0001ew-D6
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:39 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:38757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYal-000424-M1
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:39 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 u4-20020a05600c00c4b02901774b80945cso13673386wmm.3
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rpnTEDIo4iU06An2eSXnRBQX8UaDcyoG2Icf284+cKM=;
 b=hYFeRq5vuLOnHD9wHb6aHlSY/yqiIvSouaUg8XimyMO5T11bg5otNy04hp+pw5u2u5
 +jUhjG5LEbtJglFGSAc9LqaSXw4qEcRzT0YA9d/FXmiEWk3GlQi/hcxFYXvZVBH8Wgg3
 LFxiz9O1FqRALboiQwB0uUL8Wt40bik1xJNkoWd7eXksBety5/bsb2LpmIUs7jvPHZEj
 dZH9YwheAA4L2XzJ5nVh6+3OpPKWHXbGhpFhX/4CcyFb0FkDnLPlapx5ERwiJ7uqi2dD
 1JSfWupwahnExuouvFeLutmor8lcILK8sXKto6iMz6Zbm3Ui2/tu+6dRwWraymD1Vv+Z
 i/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rpnTEDIo4iU06An2eSXnRBQX8UaDcyoG2Icf284+cKM=;
 b=RXosv/eQ2GJ1AMNtWICZego0MZZe0vVolzAeCenLyXDKlskt9Lf+RHs2P9Y5z9w7K2
 B6KtvglHYE0z29A23KC655S+zbnyHcORzBHepANBkZxgCRlKMJYWBtZsqafSGHKlE7pD
 r4zmQA73sDlQ0vGw95UCXB41hiQJKvBtmqZdYVrpqJvFVrFqnIMYRHYarHdFuaXVanTJ
 8n5Mzn+118h7jEeNfGkDWwKbcYRUv/tdFoidwXisytdxRRRiGe+ElPZiELepoTMpj83f
 3NLLPfZBBFzEGvsp0P3koHQOj6zrtIpTM7x9ETCZTBuTpOsEWFPC3Az0G/mulLulCKcZ
 ewsQ==
X-Gm-Message-State: AOAM530+uH2MaS6LQN3AGy8DqE2NCk5wyeVwD89dW/Lkw7guh+RAElaS
 ouTHgyGO8tXOF6xp2JdkZ7RALMhzmVSMsaT2
X-Google-Smtp-Source: ABdhPJwB5LY+jtmKjnKvnjBMxrEiZomz9oc3F2mqW9Xl4/n3Rwyfmk+5O1xToW/xn8Jhs1A38IYZkg==
X-Received: by 2002:a7b:c93a:: with SMTP id h26mr4273443wml.141.1621955014271; 
 Tue, 25 May 2021 08:03:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.03.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:03:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 004/114] hw/arm/mps2-tz: Make SRAM_ADDR_WIDTH board-specific
Date: Tue, 25 May 2021 16:01:34 +0100
Message-Id: <20210525150324.32370-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

The AN547 sets the SRAM_ADDR_WIDTH for the SSE-300 to 21;
since this is not the default value for the SSE-300, model this
in mps2-tz.c as a per-board value.

Reported-by: Devaraj Ranganna <devaraj.ranganna@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210510190844.17799-3-peter.maydell@linaro.org
---
 hw/arm/mps2-tz.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 77ff83acb06..f2595b1c7f7 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -123,6 +123,7 @@ struct MPS2TZMachineClass {
     int numirq; /* Number of external interrupts */
     int uart_overflow_irq; /* number of the combined UART overflow IRQ */
     uint32_t init_svtor; /* init-svtor setting for SSE */
+    uint32_t sram_addr_width; /* SRAM_ADDR_WIDTH setting for SSE */
     const RAMInfo *raminfo;
     const char *armsse_type;
 };
@@ -806,6 +807,7 @@ static void mps2tz_common_init(MachineState *machine)
                              OBJECT(system_memory), &error_abort);
     qdev_prop_set_uint32(iotkitdev, "EXP_NUMIRQ", mmc->numirq);
     qdev_prop_set_uint32(iotkitdev, "init-svtor", mmc->init_svtor);
+    qdev_prop_set_uint32(iotkitdev, "SRAM_ADDR_WIDTH", mmc->sram_addr_width);
     qdev_connect_clock_in(iotkitdev, "MAINCLK", mms->sysclk);
     qdev_connect_clock_in(iotkitdev, "S32KCLK", mms->s32kclk);
     sysbus_realize(SYS_BUS_DEVICE(&mms->iotkit), &error_fatal);
@@ -1263,6 +1265,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
     mmc->numirq = 92;
     mmc->uart_overflow_irq = 47;
     mmc->init_svtor = 0x10000000;
+    mmc->sram_addr_width = 15;
     mmc->raminfo = an505_raminfo;
     mmc->armsse_type = TYPE_IOTKIT;
     mps2tz_set_default_ram_info(mmc);
@@ -1290,6 +1293,7 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
     mmc->numirq = 92;
     mmc->uart_overflow_irq = 47;
     mmc->init_svtor = 0x10000000;
+    mmc->sram_addr_width = 15;
     mmc->raminfo = an505_raminfo; /* AN521 is the same as AN505 here */
     mmc->armsse_type = TYPE_SSE200;
     mps2tz_set_default_ram_info(mmc);
@@ -1317,6 +1321,7 @@ static void mps3tz_an524_class_init(ObjectClass *oc, void *data)
     mmc->numirq = 95;
     mmc->uart_overflow_irq = 47;
     mmc->init_svtor = 0x10000000;
+    mmc->sram_addr_width = 15;
     mmc->raminfo = an524_raminfo;
     mmc->armsse_type = TYPE_SSE200;
     mps2tz_set_default_ram_info(mmc);
@@ -1349,6 +1354,7 @@ static void mps3tz_an547_class_init(ObjectClass *oc, void *data)
     mmc->numirq = 96;
     mmc->uart_overflow_irq = 48;
     mmc->init_svtor = 0x00000000;
+    mmc->sram_addr_width = 21;
     mmc->raminfo = an547_raminfo;
     mmc->armsse_type = TYPE_SSE300;
     mps2tz_set_default_ram_info(mmc);
-- 
2.20.1


