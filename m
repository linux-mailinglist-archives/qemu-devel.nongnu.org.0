Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3AF2DAEC5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:20:39 +0100 (CET)
Received: from localhost ([::1]:60978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpBBs-0001Y3-RJ
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:20:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4Q-0001Rg-66
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:12:54 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:43634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4J-00076m-73
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:12:53 -0500
Received: by mail-wr1-x441.google.com with SMTP id y17so19971531wrr.10
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 06:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NgipyMtEahMK7WxKAqWo98jTa4SOUfBt1SZmHI5R7Fw=;
 b=XuSKzX/Hy3pB1XRsWdwppe3yH982icl+v/tGQ7nNoJ+Z4/DGAlL6V/rY2fRC/mpcAY
 w5nZqaavfYcZym0n6D6dHE5xysBNVQLcxrpyADlHXFAupSsP3lBbirSpyMhoTweMDAQF
 ptWR/mZKzsRwM86PYCoDvgrJ6jz40bmf7RWOSW2hFsslO2xzrtDyW+wp1Qjw8PRz+wnU
 VExVbhWcIWA0uAbyNLw992USM3aWF3aCuQxPqzeWuJq2Iz2N4sYAPyPxHqWItVrMAOkr
 meRTc8CYp68J2pDhAqphIGf+YAxUM2lgg+xg8N+F/GzImXaHUTU8Dpo2MFlknXYdpz1o
 GdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NgipyMtEahMK7WxKAqWo98jTa4SOUfBt1SZmHI5R7Fw=;
 b=caj6ZggTOPlD9U4U3/WRErmGDvroXVJVWux9TAXTaomcH7UFdg/CtoDW9CGmBuSwoj
 bW81InXVUwelFr9dzc5i8Yvne4ans4+M0OTvq9vRl8+uOU+39dHtbWgGTRVB2nF5+aZr
 3RhSc33+KXu8eqzVzmPgkkbzT8pIPvPFDbnn7C+m69j28ms65Bd30SHBhZuEtZCikdLS
 3NkJ7bcgeoCETAXMHoIbUUQv5suEE+hCr1dqWpvVXxSeQpnlF8NMuolevSPdWwnD2qMh
 BHPja8D9q2oMu1UxNjHdoJ77+d417GrDXI/vv1oOfy1FSwDE2TNtj6gQVva8QJ6o5V4S
 g3bQ==
X-Gm-Message-State: AOAM531glAnCU9NCZN8eAfwxneO3EOBaw1vhWV4vqpdiLGMI7yot3RD7
 /r/F92my0t6Fm4kmCDlYs//Zzdx/kRFAZg==
X-Google-Smtp-Source: ABdhPJzh/g0zgBUoNOj/0/PwVAtTiHB57PHGLeK+MaNLYYBZZJsAS/1XmtMOnL/lAwnAXeZn8Bqg+A==
X-Received: by 2002:adf:fd05:: with SMTP id e5mr34704896wrr.225.1608041562286; 
 Tue, 15 Dec 2020 06:12:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w21sm19667319wmi.45.2020.12.15.06.12.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 06:12:41 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/20] hw/openrisc/openrisc_sim: Use IRQ splitter when
 connecting IRQ to multiple CPUs
Date: Tue, 15 Dec 2020 14:12:19 +0000
Message-Id: <20201215141237.17868-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215141237.17868-1-peter.maydell@linaro.org>
References: <20201215141237.17868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
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

openrisc_sim_net_init() attempts to connect the IRQ line from the
ethernet device to both CPUs in an SMP configuration by simply caling
sysbus_connect_irq() for it twice.  This doesn't work, because the
second connection simply overrides the first.

Fix this by creating a TYPE_SPLIT_IRQ to split the IRQ in the SMP
case.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Stafford Horne <shorne@gmail.com>
Message-id: 20201127225127.14770-2-peter.maydell@linaro.org
---
 hw/openrisc/openrisc_sim.c | 13 +++++++++++--
 hw/openrisc/Kconfig        |  1 +
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index d752282e675..a8adf6b70d7 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -34,6 +34,7 @@
 #include "hw/sysbus.h"
 #include "sysemu/qtest.h"
 #include "sysemu/reset.h"
+#include "hw/core/split-irq.h"
 
 #define KERNEL_LOAD_ADDR 0x100
 
@@ -64,8 +65,16 @@ static void openrisc_sim_net_init(hwaddr base, hwaddr descriptors,
 
     s = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(s, &error_fatal);
-    for (i = 0; i < num_cpus; i++) {
-        sysbus_connect_irq(s, 0, cpu_irqs[i][irq_pin]);
+    if (num_cpus > 1) {
+        DeviceState *splitter = qdev_new(TYPE_SPLIT_IRQ);
+        qdev_prop_set_uint32(splitter, "num-lines", num_cpus);
+        qdev_realize_and_unref(splitter, NULL, &error_fatal);
+        for (i = 0; i < num_cpus; i++) {
+            qdev_connect_gpio_out(splitter, i, cpu_irqs[i][irq_pin]);
+        }
+        sysbus_connect_irq(s, 0, qdev_get_gpio_in(splitter, 0));
+    } else {
+        sysbus_connect_irq(s, 0, cpu_irqs[0][irq_pin]);
     }
     sysbus_mmio_map(s, 0, base);
     sysbus_mmio_map(s, 1, descriptors);
diff --git a/hw/openrisc/Kconfig b/hw/openrisc/Kconfig
index 6c1e86884e2..8f284f3ba04 100644
--- a/hw/openrisc/Kconfig
+++ b/hw/openrisc/Kconfig
@@ -3,3 +3,4 @@ config OR1K_SIM
     select SERIAL
     select OPENCORES_ETH
     select OMPIC
+    select SPLIT_IRQ
-- 
2.20.1


