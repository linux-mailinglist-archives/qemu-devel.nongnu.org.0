Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28276565142
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 11:48:33 +0200 (CEST)
Received: from localhost ([::1]:60248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Igy-0005bG-77
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 05:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITg-0000sV-5R
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:48 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:35534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITb-0004z5-Ri
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:47 -0400
Received: by mail-pl1-x62f.google.com with SMTP id y18so80327plb.2
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 02:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G3YYIcUnrqd5oHhpbi/6tYWybx050Cnw/0reTDM7VDw=;
 b=cRI917d9EF7H0tnPAS8QeSKiJEj1Gdl3YxJCXt3auSsTMZkipfmNCLapfX3B3MGezb
 zMu+0Akah70W47/0sVc7/awfyKe2tqQL1RyiJfTBAV0YtSHTOwHlA9zfO41lcv1fNMLY
 PGBfQOhpK2acvR9E42aea0y7Ltape8+1PoiA54RyWgAH/wciivrkgz/5gQ8CYjV02sXk
 nS35RtIk3KrRVz38TN/r796WIwsPygu7Yy/buG9fS0oENkFJvMZMI9YExVwZ2FOBPWg9
 fCK+iJoxb66SjQmMcEgdjVyPc/YP3d+DhWwNwZOXswmQeskAZLcUbZYGA9RPFwan86BQ
 1K/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G3YYIcUnrqd5oHhpbi/6tYWybx050Cnw/0reTDM7VDw=;
 b=EHaWoKUumugeMZTGTQXG4m9pCYGMQiEZNWS+u4MxFcqOlaIuR7fDYaoCowzSbgskUo
 /K99NDV/T2EZl4OUR2IMT4r3bc+jqHVGJd+S/lw+JenStfzh9tiyCAvmgYqSvAowtQNZ
 9Ngef+e4hjEIeWf9eYjM1s3J+JbVt5J45ZjlEZykgCsYpd7Ee0/K50N0KQDErKLijJQm
 C9FJ8PkLzsphHeuZIhRWXQrthRv2/MUXkU5XBdIHSGC05qTTfDI7bRsmShfYsqivpU0o
 /y3XMgNxiD+nf34FeWLxRyVNEqy0PBIGsM5Q1ykmks2IP1iMv/6sbPQGIEEvtPQdSoJZ
 n8oQ==
X-Gm-Message-State: AJIora/8pEExLLwU12y10/pGzlB17FLjjhTAN4pYNsBCEZCtlKKCamEa
 tA8hFO1fP4sN6CCIk72nEbPtl39moUgdvkn/
X-Google-Smtp-Source: AGRyM1vR1crBTuKG6RQ+wbsq5T/ZZIvc+NCRcrUTNBjxihzw0Jz3apiIbvay9FEL/SVfjD/UKylWjg==
X-Received: by 2002:a17:90b:38c2:b0:1ed:474a:a668 with SMTP id
 nn2-20020a17090b38c200b001ed474aa668mr33517579pjb.201.1656927282644; 
 Mon, 04 Jul 2022 02:34:42 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 z5-20020aa79e45000000b00525b7f3e906sm15353355pfq.27.2022.07.04.02.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 02:34:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mao Bibo <maobibo@loongson.cn>
Subject: [PULL 14/23] hw/intc/loongarch_pch_msi: Fix msi vector convertion
Date: Mon,  4 Jul 2022 15:03:48 +0530
Message-Id: <20220704093357.983255-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220704093357.983255-1-richard.henderson@linaro.org>
References: <20220704093357.983255-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

From: Mao Bibo <maobibo@loongson.cn>

Loongarch pch msi intc connects to extioi controller, the range of irq
number is 64-255.  Add a property for irqbase, so that we can compute
the irq offset from the view of pch_msi controller with the method:

  msi vector (from view of upper extioi intc) - irqbase

Signed-off-by: Mao Bibo <maobibo@loongson.cn>
Message-Id: <20220701030740.2469162-1-maobibo@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/intc/loongarch_pch_msi.h |  2 ++
 hw/intc/loongarch_pch_msi.c         | 22 ++++++++++++++++++++--
 hw/loongarch/loongson3.c            |  1 +
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/include/hw/intc/loongarch_pch_msi.h b/include/hw/intc/loongarch_pch_msi.h
index f668bfca7a..6d67560dea 100644
--- a/include/hw/intc/loongarch_pch_msi.h
+++ b/include/hw/intc/loongarch_pch_msi.h
@@ -17,4 +17,6 @@ struct LoongArchPCHMSI {
     SysBusDevice parent_obj;
     qemu_irq pch_msi_irq[PCH_MSI_IRQ_NUM];
     MemoryRegion msi_mmio;
+    /* irq base passed to upper extioi intc */
+    unsigned int irq_base;
 };
diff --git a/hw/intc/loongarch_pch_msi.c b/hw/intc/loongarch_pch_msi.c
index 74bcdbdb48..b36d6d76e4 100644
--- a/hw/intc/loongarch_pch_msi.c
+++ b/hw/intc/loongarch_pch_msi.c
@@ -23,9 +23,14 @@ static uint64_t loongarch_msi_mem_read(void *opaque, hwaddr addr, unsigned size)
 static void loongarch_msi_mem_write(void *opaque, hwaddr addr,
                                     uint64_t val, unsigned size)
 {
-    LoongArchPCHMSI *s = LOONGARCH_PCH_MSI(opaque);
-    int irq_num = val & 0xff;
+    LoongArchPCHMSI *s = (LoongArchPCHMSI *)opaque;
+    int irq_num;
 
+    /*
+     * vector number is irq number from upper extioi intc
+     * need subtract irq base to get msi vector offset
+     */
+    irq_num = (val & 0xff) - s->irq_base;
     trace_loongarch_msi_set_irq(irq_num);
     assert(irq_num < PCH_MSI_IRQ_NUM);
     qemu_set_irq(s->pch_msi_irq[irq_num], 1);
@@ -58,11 +63,24 @@ static void loongarch_pch_msi_init(Object *obj)
     qdev_init_gpio_in(DEVICE(obj), pch_msi_irq_handler, PCH_MSI_IRQ_NUM);
 }
 
+static Property loongarch_msi_properties[] = {
+    DEFINE_PROP_UINT32("msi_irq_base", LoongArchPCHMSI, irq_base, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void loongarch_pch_msi_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, loongarch_msi_properties);
+}
+
 static const TypeInfo loongarch_pch_msi_info = {
     .name          = TYPE_LOONGARCH_PCH_MSI,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(LoongArchPCHMSI),
     .instance_init = loongarch_pch_msi_init,
+    .class_init    = loongarch_pch_msi_class_init,
 };
 
 static void loongarch_pch_msi_register_types(void)
diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index bd20ebbb78..403dd91e11 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -267,6 +267,7 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
     }
 
     pch_msi = qdev_new(TYPE_LOONGARCH_PCH_MSI);
+    qdev_prop_set_uint32(pch_msi, "msi_irq_base", PCH_MSI_IRQ_START);
     d = SYS_BUS_DEVICE(pch_msi);
     sysbus_realize_and_unref(d, &error_fatal);
     sysbus_mmio_map(d, 0, LS7A_PCH_MSI_ADDR_LOW);
-- 
2.34.1


