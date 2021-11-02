Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 676164435A8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 19:34:45 +0100 (CET)
Received: from localhost ([::1]:59970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhycO-0005qL-Hl
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 14:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhyTQ-0005i9-0e
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:25:28 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:45009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhyTN-0004DT-Hq
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:25:27 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id v2so13840029qve.11
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 11:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CLouTaodPxEP08iPvDZkl4yjeSN0JJ+7RsZ1lYxtnnA=;
 b=EkrysGitq5Dc6xFTL4fB0OTrYzN2Zf33Ax0D9kw4awVpYf2vx24e7bDzrAnwPOycj2
 oSzyPtgET6S0J+K0+MdOdp1snjhn7LApP/XQydez8bA4gJQlTVeD5pUPn9vjSdjruPbo
 WYRBgUH6RG/riK1jURXouorBvULfwYmOaHqtzpsUwFBCsiN2DU8DVLyR3+npBc1w+YmK
 founxa93htvWgg4m6rameSPb+fO+peM0VGKQr+Yg6guMJWgOJM1ByaYwVCp/L5l7K5mV
 EdefqWhgTI3x3YnEKOrAw4A7nJE7rfA3wEFjC5ZRW5l/Hj8KJgFybPHaE4xGxE7UPwHk
 jpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CLouTaodPxEP08iPvDZkl4yjeSN0JJ+7RsZ1lYxtnnA=;
 b=zMgnet9DQed4KnD+yqWSZbXxH085PIorPZklCp/aWeeGgEFyy6THWXVPL3HwOW7OEL
 fx3DvmXaRinKRTEnQ0fxeRdmx6rllKV+wI+FAMCoFT928oDtrJiFhE6lnsv3kUdpgJ/t
 oS2VcbD5k533faoA6xmeb0gUEo22C1/GT7BfCpBNA2joSFIficJ3YK2DPY9p2Bc/+5zI
 MomZRN33E8N2HsXvpvgDenDYfGR8jTTCyACNavwX2Pgr0snYko2BT7schDJgbVcA8GoC
 rGUOyCu9ZabtBkQU11BRulOdYz6TQOuiItzp5Ia1rRzIDJ5xszI3Dpr77a13ogxL06pi
 4wBw==
X-Gm-Message-State: AOAM531FPDktr1FhPR8Oj7hO2Fuvp2JL3bAFeEfR+PzVo1hybhho31D9
 gIeDIguLYSmkehYD3PQyV4R3hKYnNM7vWw==
X-Google-Smtp-Source: ABdhPJzB7g6QY2wmeL6N+IizyGe9F7C8Ydg1Xjr+IXwk0fa6Qhb2vV3ipyjd8tW3YIGRRMI17a21eA==
X-Received: by 2002:a05:6214:e41:: with SMTP id
 o1mr37483193qvc.0.1635877522649; 
 Tue, 02 Nov 2021 11:25:22 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id y9sm13701081qko.74.2021.11.02.11.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 11:25:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 03/12] hw/arm: Attach MMC to quanta-gbs-bmc
Date: Tue,  2 Nov 2021 14:25:10 -0400
Message-Id: <20211102182519.320319-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102182519.320319-1-richard.henderson@linaro.org>
References: <20211102182519.320319-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
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
Cc: Hao Wu <wuhaotsh@google.com>, Tyrone Ting <kfting@nuvoton.com>,
 Shengtan Mao <stmao@google.com>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shengtan Mao <stmao@google.com>

Signed-off-by: Shengtan Mao <stmao@google.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20211008002628.1958285-4-wuhaotsh@google.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/npcm7xx_boards.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index a656169f61..dec7d16ae5 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -27,6 +27,9 @@
 #include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qemu/units.h"
+#include "sysemu/blockdev.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/block-backend.h"
 
 #define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
 #define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
@@ -81,6 +84,22 @@ static void npcm7xx_connect_dram(NPCM7xxState *soc, MemoryRegion *dram)
                              &error_abort);
 }
 
+static void sdhci_attach_drive(SDHCIState *sdhci)
+{
+        DriveInfo *di = drive_get_next(IF_SD);
+        BlockBackend *blk = di ? blk_by_legacy_dinfo(di) : NULL;
+
+        BusState *bus = qdev_get_child_bus(DEVICE(sdhci), "sd-bus");
+        if (bus == NULL) {
+            error_report("No SD bus found in SOC object");
+            exit(1);
+        }
+
+        DeviceState *carddev = qdev_new(TYPE_SD_CARD);
+        qdev_prop_set_drive_err(carddev, "drive", blk, &error_fatal);
+        qdev_realize_and_unref(carddev, bus, &error_fatal);
+}
+
 static NPCM7xxState *npcm7xx_create_soc(MachineState *machine,
                                         uint32_t hw_straps)
 {
@@ -355,6 +374,7 @@ static void quanta_gbs_init(MachineState *machine)
                           drive_get(IF_MTD, 0, 0));
 
     quanta_gbs_i2c_init(soc);
+    sdhci_attach_drive(&soc->mmc.sdhci);
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.25.1


