Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C66D2C6D62
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 23:53:06 +0100 (CET)
Received: from localhost ([::1]:37780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kimbw-0002aA-R3
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 17:53:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kimaW-0001hE-2E
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 17:51:36 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:34680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kimaS-00058F-SN
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 17:51:35 -0500
Received: by mail-wr1-x442.google.com with SMTP id k14so7087789wrn.1
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 14:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3uZMzY6oF54xbyAFQYKRwpZtvEnzb9HX015RCXLfpWQ=;
 b=pjVUY+14jFJUqdJgZAS0vDYpiuya/0xywop/R3q2NQVYRM/Ni426uAmoNWSzE6O4R7
 UIVPmyz11JuIoIzjHA3jhNZElKAuuOfGWkrVxX5RD8qwaiE07DKaKfbZgUQHlKA/Nij9
 jkmaGafUnUYJgxD7iP875NDm7+k5UgGR/O8jLU0LruVnEmA8PyCo2WYCditxhlFeB04x
 qWuCE3a/dVwYOQRUmd/QGiaCVD4/3mSEjZnWFTx8g6ALEDG8qNNgg9Bw9dxxpMgAxm7/
 IOmB0GQ0vEL67khtI3mVFGIEdibV+Q+6vsYxC9ZzMQxZib7RSG87SAZHMze+7QNukJrr
 /B9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3uZMzY6oF54xbyAFQYKRwpZtvEnzb9HX015RCXLfpWQ=;
 b=MFgYQQeXwJli+FQd41f5IyEly4We4tyifeiFBtl/uq24yHLzfns/nfkI0OL71m+qVC
 1pn4YfXRMmrX8bYDJ67Kqca11u8mGmjbG7khHqTfgCpCnhtD6BblHoM3bgRBzI94OY4O
 CQaP4AHSizHzYKmsrg9faqpyusF2qxNiGIQS7TMl4yS9EzycnvqrwmfhwqkAKFXenpKu
 Yu7bzE5n27fCaPKdU0JioPi0x23fXqDlUTmAO2pjkjK72B6raG5aXRH+VXYz31rbFH1L
 njt3MRhh9GQNRAhloR2a0vFxXARtHckCzR7Z3EjdGrwzzL4FBJjcjAVIQjSuVwMJvLcM
 XCDg==
X-Gm-Message-State: AOAM533wvTjnh5ohbbiXFq1NchMgxlDos0JeDSywKY098a76YaNeIZua
 bksODPoFbDQLb5MqQhhRIkaHaPN+iBOhzg==
X-Google-Smtp-Source: ABdhPJwG0+NWSdaIsrx6NgiJtvPXBQ9DVp2JFa5+9LRh7pYaA1eJxNDb2LWEUJYgAUJ5qENe8EW2ag==
X-Received: by 2002:adf:f9c6:: with SMTP id w6mr13433437wrr.273.1606517490828; 
 Fri, 27 Nov 2020 14:51:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q16sm17429756wrn.13.2020.11.27.14.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 14:51:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/openrisc/openrisc_sim: Use IRQ splitter when
 connecting IRQ to multiple CPUs
Date: Fri, 27 Nov 2020 22:51:25 +0000
Message-Id: <20201127225127.14770-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201127225127.14770-1-peter.maydell@linaro.org>
References: <20201127225127.14770-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
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
Cc: Stafford Horne <shorne@gmail.com>, Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

openrisc_sim_net_init() attempts to connect the IRQ line from the
ethernet device to both CPUs in an SMP configuration by simply caling
sysbus_connect_irq() for it twice.  This doesn't work, because the
second connection simply overrides the first.

Fix this by creating a TYPE_SPLIT_IRQ to split the IRQ in the SMP
case.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


