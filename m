Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCB44F18FC
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 17:56:59 +0200 (CEST)
Received: from localhost ([::1]:35832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbP4c-0004H4-JN
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 11:56:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOv6-0004nG-Sf
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:47:09 -0400
Received: from [2a00:1450:4864:20::335] (port=35759
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOv2-0000SM-Rx
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:47:07 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso8023585wma.0
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 08:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/ybpyebdsKXu6Z/sQb8m6WBpeq9LatpodBVjfwkZK/E=;
 b=bfRH93kg97sAp7ZOkYA8Lt0CdEKMw0DLiAhBVEa9qXnd6I+eAmBMgxpKfKV6OVqGIm
 UAVtCQsxIqtULVL8gGrF79EDirZuBcLLV23t8J5GLhoZzgkz9EiWBUKiB6g4cpTDOGBY
 6vdUVKyjaWsYded2SHBx7tDP35MHifvkUZAfK9NpfYwezt6xZzjOFdRQza++vW1/bDhR
 8Uts00udYyPudCtF9ysLP5w1qL4/4pxwDLQxwtbws1YtYPQgS2CWFqwV7QUWQ0WZEa05
 wSIh6CtvJ/GbdgVs2+jdfAjOETdbn5DeEnMoCMrN22XWqvmM/sSJ44WbnRo9KPUfZeAQ
 WRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/ybpyebdsKXu6Z/sQb8m6WBpeq9LatpodBVjfwkZK/E=;
 b=aOwt3/gQ05/+w8pkPtC8tq8wkwIIpXrTzXk/CELoUz998nQHf3f/EBl0yxksxiMMns
 UJbDRWNersSmiH/ASNHEdnklSSPir/O1HU9C7QraC2CeJ43Q0G+e0akvZlvZoMybVkuB
 HDI3Ge1b2uQliQhgetf/9Ac0JAE+kKbTG/nVbv7uIC4uwd1P1NDodS1rF2d4qoL7S2Gg
 Fg5rqnvOT1sRobp8FOtnnlrvXvCu2de3W2VU7kQ3H398A1ZbgGHlbk5yZCc1BNh5B9lG
 iW2ZCxetMRO/4J13BdqperAQCxD/7x93GptA2CuRWdAW896Jkh9BgysagPsik5b1uZu5
 boqA==
X-Gm-Message-State: AOAM532fYf2p1nrtnbbdZYkQfCpmNeE+bNqkBEAn4WqiDHKvlwZtw7Yp
 PzGR3ISnPU+9vLV48OKDv1Of5m2r2KrEnA==
X-Google-Smtp-Source: ABdhPJwyFW8UH62/CgPhZiIFNWTXd6fbWrLFE4EvK3lN+ku1ul+ou3+zYYoNDifGpPlstO2hb2Xsfg==
X-Received: by 2002:a1c:ed01:0:b0:38b:5a39:220c with SMTP id
 l1-20020a1ced01000000b0038b5a39220cmr19629486wmh.167.1649087223481; 
 Mon, 04 Apr 2022 08:47:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a056000184800b002040e925afasm11731347wri.59.2022.04.04.08.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 08:47:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.1 03/18] hw/arm/exynos4210: Put a9mpcore device into
 state struct
Date: Mon,  4 Apr 2022 16:46:43 +0100
Message-Id: <20220404154658.565020-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404154658.565020-1-peter.maydell@linaro.org>
References: <20220404154658.565020-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The exynos4210 SoC mostly creates its child devices as if it were
board code.  This includes the a9mpcore object.  Switch that to a
new-style "embedded in the state struct" creation, because in the
next commit we're going to want to refer to the object again further
down in the exynos4210_realize() function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I don't propose to try to do a full conversion of every child
device; I'm only going to do them where it makes a subsequent
commit a bit nicer, like this one.
---
 include/hw/arm/exynos4210.h |  2 ++
 hw/arm/exynos4210.c         | 11 ++++++-----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index 3999034053e..215c039b414 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -26,6 +26,7 @@
 
 #include "hw/or-irq.h"
 #include "hw/sysbus.h"
+#include "hw/cpu/a9mpcore.h"
 #include "target/arm/cpu-qom.h"
 #include "qom/object.h"
 
@@ -103,6 +104,7 @@ struct Exynos4210State {
     I2CBus *i2c_if[EXYNOS4210_I2C_NUMBER];
     qemu_or_irq pl330_irq_orgate[EXYNOS4210_NUM_DMA];
     qemu_or_irq cpu_irq_orgate[EXYNOS4210_NCPUS];
+    A9MPPrivState a9mpcore;
 };
 
 #define TYPE_EXYNOS4210_SOC "exynos4210"
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index dfc0a4eec25..ef4d646eb91 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -244,17 +244,16 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
     }
 
     /* Private memory region and Internal GIC */
-    dev = qdev_new(TYPE_A9MPCORE_PRIV);
-    qdev_prop_set_uint32(dev, "num-cpu", EXYNOS4210_NCPUS);
-    busdev = SYS_BUS_DEVICE(dev);
-    sysbus_realize_and_unref(busdev, &error_fatal);
+    qdev_prop_set_uint32(DEVICE(&s->a9mpcore), "num-cpu", EXYNOS4210_NCPUS);
+    busdev = SYS_BUS_DEVICE(&s->a9mpcore);
+    sysbus_realize(busdev, &error_fatal);
     sysbus_mmio_map(busdev, 0, EXYNOS4210_SMP_PRIVATE_BASE_ADDR);
     for (n = 0; n < EXYNOS4210_NCPUS; n++) {
         sysbus_connect_irq(busdev, n,
                            qdev_get_gpio_in(DEVICE(&s->cpu_irq_orgate[n]), 0));
     }
     for (n = 0; n < EXYNOS4210_INT_GIC_NIRQ; n++) {
-        s->irqs.int_gic_irq[n] = qdev_get_gpio_in(dev, n);
+        s->irqs.int_gic_irq[n] = qdev_get_gpio_in(DEVICE(&s->a9mpcore), n);
     }
 
     /* Cache controller */
@@ -489,6 +488,8 @@ static void exynos4210_init(Object *obj)
         g_autofree char *name = g_strdup_printf("cpu-irq-orgate%d", i);
         object_initialize_child(obj, name, &s->cpu_irq_orgate[i], TYPE_OR_IRQ);
     }
+
+    object_initialize_child(obj, "a9mpcore", &s->a9mpcore, TYPE_A9MPCORE_PRIV);
 }
 
 static void exynos4210_class_init(ObjectClass *klass, void *data)
-- 
2.25.1


