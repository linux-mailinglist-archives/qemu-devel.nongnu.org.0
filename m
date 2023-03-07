Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F2D6ADB1B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 10:54:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZU1P-0004wV-A8; Tue, 07 Mar 2023 04:54:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkarthikeyan1509@gmail.com>)
 id 1pZU1M-0004vg-M4; Tue, 07 Mar 2023 04:54:12 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pkarthikeyan1509@gmail.com>)
 id 1pZU1J-0007IS-Qt; Tue, 07 Mar 2023 04:54:12 -0500
Received: by mail-pl1-x62f.google.com with SMTP id u5so13442323plq.7;
 Tue, 07 Mar 2023 01:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678182848;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Gar5A1AJfOE69mmKOm2TvYUZQ5MGJesm/0b7czDpb8g=;
 b=WqJ16vCwpMcT1axp8Rn2s/glbjw/ZMsEEVotNWXCcikYNhxkUvd+pxnL44Jv7UjoDI
 Yhin7tHggl1v1Q72cBB/8ivi06KPB20SS+SlMmy8Wuk9Qmet9mUsGjWIfwXdAUsXkHng
 HYnjDHt+ZWfctJR2kSHo0D4IYCE/pBWTUqUnzOpAcUaY2ozEdYrLAKZJJ4X1kd4pGQZP
 CxXwPkbHeGU3dFsuB0QnMmd0KbONOS8vaU30U196BmBYw3/RkLKtym++efliWxr1vGmt
 S9R47f0kZoB6dZVvsxzDLWEcOEKeELkJ2Baqsg5IONAFEKSyd/5Y5/o01e0sLMvUJ9z8
 XoMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678182848;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gar5A1AJfOE69mmKOm2TvYUZQ5MGJesm/0b7czDpb8g=;
 b=KD1F1aOPsqixL4S4vJgW0TzEXPoBaVqtJLKMdCAoyq+woE7Qv8IKCzAMUuOwY3U0wd
 TQDLZEiZl//VUR72J1Vx4DWKODs5x+HpF5+Ormjb9A3YeQownyiImJN/UMDILDVPaVzl
 g+G6u2+M/tTQTyxUpzbZ0WR4OmDrf3dNKOX9mWhb/xEKc+irlj0sbG8XYw+e3BgeaBDo
 7Eal9jGA0Ny+u1r1G51Wzd79Kd0rEKH9hhybhN2ACBHcQaGcBe88fkDRDfoDZuUd6b+u
 fpTAnw/RfYnLoacrfQnsFH1/k8PwZYhxd0dAkSeDVLMD1uUIlhcjtIC6Vi0vOYay0t3W
 tetg==
X-Gm-Message-State: AO0yUKUY66osUE6VgWeLSgFWS7gOunan9H1V7kTrJSeyQdu2pEpkNUq7
 7yHASuQ47D00NQogKIJsR0FM+caI/2jYZA==
X-Google-Smtp-Source: AK7set/YVJTdEEQX5FQY+Qr4V3/v6IsV1kDD+nUE3E6dyQ3XdvBNYr1qkmNpumsHN7crpREPRbclBQ==
X-Received: by 2002:a05:6a20:1613:b0:c7:60d1:81a1 with SMTP id
 l19-20020a056a20161300b000c760d181a1mr16470681pzj.28.1678182847803; 
 Tue, 07 Mar 2023 01:54:07 -0800 (PST)
Received: from hcl-ThinkPad-T495.. ([2401:4900:1ce1:a87f:e556:a76c:ebd0:7cad])
 by smtp.gmail.com with ESMTPSA id
 11-20020aa7910b000000b005ad9e050512sm7551706pfh.121.2023.03.07.01.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 01:54:07 -0800 (PST)
From: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
To: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
Subject: [PATCH v1] Added TMP421 type sensor's support in yosemitev2
Date: Tue,  7 Mar 2023 15:22:40 +0530
Message-Id: <20230307095239.3583613-1-pkarthikeyan1509@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=pkarthikeyan1509@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Added TMP421 type support in yosemite v2 platform.

Tested: Tested and verified in yosemite V2 platform.

Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
---
 hw/arm/aspeed.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 86601cb1a5..7b5e603bc4 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -524,6 +524,11 @@ static void yosemitev2_bmc_i2c_init(AspeedMachineState *bmc)
     at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 4), 0x51, 128 * KiB);
     at24c_eeprom_init_rom(aspeed_i2c_get_bus(&soc->i2c, 8), 0x51, 128 * KiB,
                           yosemitev2_bmc_fruid, yosemitev2_bmc_fruid_len);
+    /* TMP421 */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), "tmp421", 0x1f);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp421", 0x4e);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp421", 0x4f);
+
 }
 
 static void romulus_bmc_i2c_init(AspeedMachineState *bmc)
-- 
2.34.1


