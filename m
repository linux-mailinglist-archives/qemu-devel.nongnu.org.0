Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 321CE65653C
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Dec 2022 23:05:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9vZI-0004pW-A0; Mon, 26 Dec 2022 17:03:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p9vZ7-0004lY-5z; Mon, 26 Dec 2022 17:03:25 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p9vZ5-0003Xk-M9; Mon, 26 Dec 2022 17:03:24 -0500
Received: by mail-ed1-x52a.google.com with SMTP id s5so16834605edc.12;
 Mon, 26 Dec 2022 14:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TYI62dQf9gn0f4gFAtfVXUEo9pYy6Fucsvct1OnfuTc=;
 b=bk88Xr9fTVl9PQX5obcmZzFU9vnDki9yIH/ycPwhg9JtaDy/pu47pPLVMQGlX4cZVM
 R0cuSRiYF85+xEatKACoM60C2VrgFtdOsBnAjS8e4lcJdn4+1G+RZbDN6OW/hblAPZMU
 brwtA2V9d/flXcEt2E3RrUfnpRMY16KOguHkl1u401NtEcYRYaRmliKWnV6Duh7NE+hm
 uquqNLNmVSxAaNQSZ0sZgAapN4LnXpkPI8ycsI7LqYJRQMoaH1OAJSCktQa0D76pGEVU
 ChtWU/Yrehhj8e541RKMCbM187WvJ14CkpxO0QRu3K3acnSIyHuRYgwVVvACy6C1T4r9
 GAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TYI62dQf9gn0f4gFAtfVXUEo9pYy6Fucsvct1OnfuTc=;
 b=Nj8QJ+srNLTynXRXuwONAy4zINK4nai9rsaZkYMMmcCMpLnaJeAOYsFZ9Ezuto6VmX
 pcNXDYhwtgGa+megybizaBX4PpDqgGM54lpG2tiH8U+vRx9P6gAR63sETrb3FzF4QvRx
 eQeejzE2Yv59RedI8wciVlO1Awb1jiTE6g2RyqnIz8RX76W8DhJCfeDVErzcHUcrpJiJ
 /18wefYe8JLl8CH+n38FIQ+j5eHKLIGkj4N5aUXsNvbMnJmqjmQq6S2YVZs6K8lLBqSE
 g+LtKD99L6EHxJZJjAm+sFv0HpSaWK8SgpEc1qD3f+pSz7v0NI8fQJtyeg0swXI0Aikq
 O7Hw==
X-Gm-Message-State: AFqh2kq0/l9oA9OXMjTlKGtdzcR/B5GzGwPCzNZaBKFNGTYkrwjvxeYg
 tyv+g6jNWjFXqQDCPhM6gqw=
X-Google-Smtp-Source: AMrXdXvtePPlzvqgHuO4XUVQoacAZlP0x/QpGldp3qNIoSxgQ1BI1jxJMos3Fq30xDqrvvGjpOwI/w==
X-Received: by 2002:a05:6402:1217:b0:461:e5d1:73c5 with SMTP id
 c23-20020a056402121700b00461e5d173c5mr14762064edw.32.1672092201825; 
 Mon, 26 Dec 2022 14:03:21 -0800 (PST)
Received: from penguin.lxd ([87.116.176.120])
 by smtp.googlemail.com with ESMTPSA id
 u1-20020aa7d541000000b0046951b43e84sm5111467edr.55.2022.12.26.14.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Dec 2022 14:03:21 -0800 (PST)
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
X-Google-Original-From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH v3 5/7] hw/arm: Add AXP209 to Cubieboard
Date: Mon, 26 Dec 2022 23:03:01 +0100
Message-Id: <20221226220303.14420-6-strahinja.p.jankovic@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221226220303.14420-1-strahinja.p.jankovic@gmail.com>
References: <20221226220303.14420-1-strahinja.p.jankovic@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

SPL Boot for Cubieboard expects AXP209 connected to I2C0 bus.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/Kconfig      | 1 +
 hw/arm/cubieboard.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index eefe1fd134..da6741f112 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -323,6 +323,7 @@ config ALLWINNER_A10
     select ALLWINNER_A10_DRAMC
     select ALLWINNER_EMAC
     select ALLWINNER_I2C
+    select AXP209_PMU
     select SERIAL
     select UNIMP
 
diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index 5e3372a3c7..dca257620d 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -20,6 +20,7 @@
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "hw/arm/allwinner-a10.h"
+#include "hw/i2c/i2c.h"
 
 static struct arm_boot_info cubieboard_binfo = {
     .loader_start = AW_A10_SDRAM_BASE,
@@ -34,6 +35,7 @@ static void cubieboard_init(MachineState *machine)
     BlockBackend *blk;
     BusState *bus;
     DeviceState *carddev;
+    I2CBus *i2c;
 
     /* BIOS is not supported by this board */
     if (machine->firmware) {
@@ -80,6 +82,10 @@ static void cubieboard_init(MachineState *machine)
         exit(1);
     }
 
+    /* Connect AXP 209 */
+    i2c = I2C_BUS(qdev_get_child_bus(DEVICE(&a10->i2c0), "i2c"));
+    i2c_slave_create_simple(i2c, "axp209_pmu", 0x34);
+
     /* Retrieve SD bus */
     di = drive_get(IF_SD, 0, 0);
     blk = di ? blk_by_legacy_dinfo(di) : NULL;
-- 
2.30.2


