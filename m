Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C904E6ADBB2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:22:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZURk-0005wR-KP; Tue, 07 Mar 2023 05:21:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkarthikeyan1509@gmail.com>)
 id 1pZURZ-0005pt-UZ; Tue, 07 Mar 2023 05:21:18 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pkarthikeyan1509@gmail.com>)
 id 1pZURY-0003FP-9p; Tue, 07 Mar 2023 05:21:17 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 me6-20020a17090b17c600b0023816b0c7ceso16061858pjb.2; 
 Tue, 07 Mar 2023 02:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678184474;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Wgj5yCHBB2uTnUrJAR6aIpgh6i8dZtTTVqJfv6vkg+I=;
 b=ieMV+xypKR5gZcHtvU8yigo8Cgx46+ptKXkPL2f9p/ba5EBgP9iYNNvc0eZ6vJQmc8
 yh95I/lYTBPQYccaLE4RNWlR1Eb8lXnLakT/k0kRVCDUVvNRH8kEhOCvB1I2v4xiLrSK
 5r+/ysNvrC7xBblY3fDKmYF30CwOtWwRigt0D1hrdfKGDEiG1Hgb4OiMLwlzRPy3z+w9
 9n26yyfbOLa0tEsPwd93lmI8y49SHgyOEgpmYRAmuW9868eysYFt3tWJEFVSfnl6f9FN
 YPwNnZXEVKLeon81SOvwufzktz3eSozd48dA1vuKs0oBnsUOiBlUJPBpQCFuMR2WgO6b
 W/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678184474;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wgj5yCHBB2uTnUrJAR6aIpgh6i8dZtTTVqJfv6vkg+I=;
 b=3mzAWw0R194AtqpsrUTR0ou+zGkajwoHuGN7SQfq874uscqJPmkPmM0pasMW5+1/ZD
 J+KFXAzAMO92rQMW8D4saeudJP3xNoyHV/Nn32RPHsUsJBpL2ihFUjPPkbf9gJhu/pU5
 InoXo+SkBKFxfe/RhZi4C5E01uT19x5uclldJXGsUUw7gXm9igIufJducdoPRR0hFNn2
 3HC7ntkPDzej60Y8wABibaIJNR4/jXA3Qtkq/cFgerAsRImwX8UwohuxnrKa14STL4ik
 l3s2/EQFkZ7rU7VUpcG8HSPLe4ymsTOOhH8DRlZ0Bvq6qwgwbFoprnm4kzf5rVyr+orG
 A2zQ==
X-Gm-Message-State: AO0yUKUmXv85lLle5X1YrWre+gRHdh8Y5dX9RgfU3vQ8Zt/7bX+SztUC
 Dxrc9QHVe+yOijFv389wz98=
X-Google-Smtp-Source: AK7set8NvaWIeUdap8+GAWb/lATP7DctGD4XpZouWJKu/ggMWE4jUroxhpw1f7+tuSNwUFIT4YYgbw==
X-Received: by 2002:a17:902:e84b:b0:19c:b7da:fc44 with SMTP id
 t11-20020a170902e84b00b0019cb7dafc44mr17359495plg.34.1678184474255; 
 Tue, 07 Mar 2023 02:21:14 -0800 (PST)
Received: from hcl-ThinkPad-T495.. ([2401:4900:1ce1:a87f:e556:a76c:ebd0:7cad])
 by smtp.gmail.com with ESMTPSA id
 i18-20020a170902eb5200b001991e4e0bdcsm8123358pli.233.2023.03.07.02.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 02:21:13 -0800 (PST)
From: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
To: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
Subject: [PATCH v1] Added TMP421 type sensor's support in tiogapass
Date: Tue,  7 Mar 2023 15:49:14 +0530
Message-Id: <20230307101913.3585785-1-pkarthikeyan1509@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=pkarthikeyan1509@gmail.com; helo=mail-pj1-x1030.google.com
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

Added TMP421 type sensor support in tiogapass platform.

Tested: Tested and verified in tiogapass platform.

Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
---
 hw/arm/aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index e985ce85e5..c1843693fa 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -545,7 +545,7 @@ static void tiogapass_bmc_i2c_init(AspeedMachineState *bmc)
     /* TMP421 */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "tmp421", 0x1f);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp421", 0x4f);
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp421", 0x4e); 
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp421", 0x4e);
 }
 
 static void create_pca9552(AspeedSoCState *soc, int bus_id, int addr)
-- 
2.34.1


