Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798535BD3F8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 19:41:30 +0200 (CEST)
Received: from localhost ([::1]:42618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaKls-0001Qb-GN
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 13:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangjian.3032@bytedance.com>)
 id 1oaKT6-000678-5A
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:22:04 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:34708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangjian.3032@bytedance.com>)
 id 1oaKT4-0000SY-6a
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:22:03 -0400
Received: by mail-pf1-x436.google.com with SMTP id e68so279783pfe.1
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 10:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=MKmFcMrw4Ulwq9cX8g5pa2zrdMnwEk2YgEPM3gKsVrk=;
 b=HjTdgNPCZXM7/6uZ0EmISXGtj9hxf1BHyFx1d7UwNdvRY716bWI1z+DMFaqYhwNLpO
 UXHvuABvNUrleednyx+BKWH5MzT7k6nEA45p5XBaJEL22l4PH0kErqwS+rILXnRPcKjq
 YiFlRf1hValSa03QIeFQr96wp97OZUasrmfPiH2eWaNe0VnJA6kVaVP9Xi+tsyyVNhVy
 oz4Ylqg5hHCHVlrzIE42IjKPHAXA1yJcF3skmD0+W3wKHzgqNNxTOdlMo9Yvq5qGGrxF
 JiPydpQ4YmouurWslf9C8Uwv3wF5JdJeIjOf9UaFFsiTFv6AjNOLc8KpAN1qLe8eGuxS
 niNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=MKmFcMrw4Ulwq9cX8g5pa2zrdMnwEk2YgEPM3gKsVrk=;
 b=Ms4Too77SONIQPfgTpxckLelayJWqBWu/7xDJYBSW4zj+Bwq/QGKQtVknSLE945DGU
 Yiov325JEKVwTPcsHIqusQfHj23MVEY30AzZCJJ2GUA1fl3BiHy8URPqXj4Tv8Oyj8JO
 KXSVc78R5ucc/3mE+UXLriXewjN+78NkrW76GZZJXgffaEFL2VwLSEJnh8T49WEFpEwn
 ixZPxBE6TqWK826iK8CkTgLHNd0eSMDRWz/W85W5XpaLXzmUpC0DAV0bpvhUSIAllVcQ
 owCJJEvYws4VJryoeZCb0B+R6kh3p+TNlpjfuQl3PDGogZIk694vqHmyfrjE2Z3/YsPB
 mzhQ==
X-Gm-Message-State: ACrzQf1PMc5d9bm2vOurSKE6z4Vso4RkV3Qx6x8hGdDPZky3dUmFSYh8
 hq4cu1rYiT8oG/k1OItJG3dThQ==
X-Google-Smtp-Source: AMsMyM4ipJpI15LcyguA/KFzeiSJDxpw1El9Zh4rMYlAvx8Zi6kIB1hugKHKG9MfVHJ79NBQRuwnDg==
X-Received: by 2002:a05:6a00:180d:b0:540:ec09:293 with SMTP id
 y13-20020a056a00180d00b00540ec090293mr19611543pfa.3.1663608120887; 
 Mon, 19 Sep 2022 10:22:00 -0700 (PDT)
Received: from localhost ([49.7.199.22]) by smtp.gmail.com with ESMTPSA id
 x1-20020aa79a41000000b00536b2483aedsm18849161pfj.199.2022.09.19.10.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 10:22:00 -0700 (PDT)
From: Jian Zhang <zhangjian.3032@bytedance.com>
To: peter.maydell@linaro.org, clg@kaod.org, andrew@aj.id.au, joel@jms.id.au,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: yulei.sh@bytedance.com, tangyiwei.2022@bytedance.com,
 chentingting.2150@bytedance.com, yuhao.17@bytedance.com,
 wangxiaohua.1217@bytedance.com, xiening.xll@bytedance.com,
 Jian Zhang <zhangjian.3032@bytedance.com>
Subject: [PATCH 3/3] hw/arm/aspeed: g220a: Add host-power device
Date: Tue, 20 Sep 2022 01:21:12 +0800
Message-Id: <20220919172112.2706026-4-zhangjian.3032@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220919172112.2706026-1-zhangjian.3032@bytedance.com>
References: <20220919172112.2706026-1-zhangjian.3032@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=zhangjian.3032@bytedance.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 19 Sep 2022 13:29:46 -0400
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

Add power-button/power-good gpio connect between g220a BMC machind(soc
gpio) and host.

Tested:
In qemu, use g220a image

~# ipmitool power status
Chassis Power is off

~# ipmitool power on
Chassis Power Control: Up/On

~# ipmitool power status
Chassis Power is on

~# ipmitool power off
Chassis Power Control: Down/Off

~# ipmitool power status
Chassis Power is off

Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
---
 hw/arm/aspeed.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 952fa11ca2..80a98b8d74 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -28,6 +28,7 @@
 #include "hw/qdev-clock.h"
 #include "sysemu/sysemu.h"
 #include "hw/arm/fby35.h"
+#include "hw/misc/host_power.h"
 
 static struct arm_boot_info aspeed_board_binfo = {
     .board_id = -1, /* device-tree-only board */
@@ -723,6 +724,24 @@ static void g220a_bmc_i2c_init(AspeedMachineState *bmc)
     };
     smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 4), 0x57,
                           eeprom_buf);
+
+    /* Add a host-power device */
+    HostPowerState *power = host_power_create_simple(OBJECT(bmc));
+
+    /*
+     * connect the power button(in) to soc(out)
+     * the power button in g220a is 215
+     */
+    qdev_connect_gpio_out(DEVICE(&bmc->soc.gpio), 215,
+                          qdev_get_gpio_in_named(DEVICE(power),
+                                                 "power-button", 0));
+
+    /*
+     * connect the power good signal(out) to soc(in)
+     * the power good in g220a is 209
+     */
+    qdev_connect_gpio_out_named(DEVICE(power), "power-good", 0,
+                                qdev_get_gpio_in(DEVICE(&bmc->soc.gpio), 209));
 }
 
 static void aspeed_eeprom_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
-- 
2.25.1


