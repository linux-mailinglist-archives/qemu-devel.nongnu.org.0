Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C356669B6E
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:08:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKmf-0000vx-R5; Fri, 13 Jan 2023 09:11:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmS-0000r4-6V
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:40 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmO-0003ev-2F
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:38 -0500
Received: by mail-wm1-x32b.google.com with SMTP id o15so15343177wmr.4
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XgUpRbLEF+TsYOwo2xS2TZOAlQ8tINZlq3JwSHfJySY=;
 b=zsQJIt8nDE4bsd6HP0z+LJLPSCid8M1PsLIbtzL7Ta98r//HB9MXfIOAMuG5lT/DIi
 RvHCl4a1SR+fohZelqoBR2kchAamJOnkUx9t28iKBZWthy5n6pYFb1NZePi6YUHcVLVb
 zg56V+n8cKmsVNEhPd/lT/gRSytODbOVaDzk3Ar8GbrJkXI49FbVF1GotQMiHlAkf1x6
 vMxwsLMP06TkF8ciwYl8lyCKp/NDy/LfFqXnxoVsXNCDloBoPt7iexqn9jsP1s3OoyUl
 KEedr2CaN2yGRCM5WG0yhrD+u+ul6GcxWPM4K2U03AAt1o3HeKp9+AP0Yd9lyvLUABU2
 gWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XgUpRbLEF+TsYOwo2xS2TZOAlQ8tINZlq3JwSHfJySY=;
 b=nJZzmjhENP1PQI6AoEtzW57p34ZREiORT1JxlTvTt44EIMTqFgn3EqglnfeOBzBh/9
 MdBE02WzSciouAxf0T4pQqRKPdYwShbbJI+8GSNyax78FXHuniKgqEJnvdmG7qMEwaNZ
 vuwS43ADfvBqfEJ4dqXRFmW1Lw4PmSTMV/wtDVMctBraizZM51YHMRCSbGRbwzbOEOA3
 4A2BNGXVhqZyFV9XI4CuuSG7mKi9nxsnLR9zbJgcqfZDQSal+Z8OUPHBgILB6tnDzhrN
 YtmRj3JWpI6V0o32NdoZYE5WMfvO1kfC0fDLlk5ht4I69h0UPWF6oIeG0673TvZiXFLG
 LWWQ==
X-Gm-Message-State: AFqh2kp2GVQFtmoTl/AE4KTlytVOQxHJCkqhLehit2T9pDczVZohIvi1
 bL4rwdyLGT7kBRsWVbvo7Z5n9QqDllvLE4gY
X-Google-Smtp-Source: AMrXdXsa8wXCBueeDW0LHOvPSvPMWQTuxIk81gngdtqq9L1q4LmdTqPx1KDmKnJVhZj/tFmSQtB61A==
X-Received: by 2002:a7b:cb89:0:b0:3d2:2101:1f54 with SMTP id
 m9-20020a7bcb89000000b003d221011f54mr58122689wmi.4.1673619094258; 
 Fri, 13 Jan 2023 06:11:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/38] hw/arm: Add AXP209 to Cubieboard
Date: Fri, 13 Jan 2023 14:10:55 +0000
Message-Id: <20230113141126.535646-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
References: <20230113141126.535646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Strahinja Jankovic <strahinjapjankovic@gmail.com>

SPL Boot for Cubieboard expects AXP209 connected to I2C0 bus.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20221226220303.14420-6-strahinja.p.jankovic@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/cubieboard.c | 6 ++++++
 hw/arm/Kconfig      | 1 +
 2 files changed, 7 insertions(+)

diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index 5e3372a3c7b..dca257620d0 100644
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
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 3e9b2a23fd5..19d6b9d95f5 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -327,6 +327,7 @@ config ALLWINNER_A10
     select ALLWINNER_A10_DRAMC
     select ALLWINNER_EMAC
     select ALLWINNER_I2C
+    select AXP209_PMU
     select SERIAL
     select UNIMP
 
-- 
2.34.1


