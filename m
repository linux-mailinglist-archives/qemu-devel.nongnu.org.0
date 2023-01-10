Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B2B663CA7
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 10:21:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF9wt-0005cf-7F; Tue, 10 Jan 2023 03:25:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF9wq-0005bM-Ij
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:25:32 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF9wp-0004eX-2S
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:25:32 -0500
Received: by mail-wr1-x42f.google.com with SMTP id z5so9821261wrt.6
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 00:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yDI+NMLY3kwFwk/S7hyFI2p4AMTGBHGEpIPdQhrWZDA=;
 b=fcz5Ry+qWpo+SNgb49kngVWkzWmmab32dwHA4AbVp//EPjzQ/d1OCwBeG02Hp8Qg4i
 Pbayxa1fvcmbW7FdkntSNOBbMmoOXWfwIHgYDPRaoFIEkdBg94Iz0JRC4uoq2WbHu6MJ
 0A1NzMg/DrkdyNC1jx6VMgKejSyObyz1kSBQkuYLMaouxWB6az0fM2tyyOaJbasczxkj
 Tw6guBfl11wj8fQpGX+E/tXiB1woVGaSzMVbtNClt1JKo4vHv6/dnwMyTAZ9uU5MtK+S
 4PzRagd3mWZ7MVleDh/2v0/FPM/rtoohSK9yv+kC/SyXh/CU88K/AlOr6Hp+DmxrbPxu
 TmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yDI+NMLY3kwFwk/S7hyFI2p4AMTGBHGEpIPdQhrWZDA=;
 b=xfF25rL3syd45MfPO6mnLP//tmeKFtl38tritUA8MxhSRcj4ddI2JPwRBGo5mH3WBY
 C+uxdP7adTiYeqZn08YZk76/cSqovRVzujVVm7JAb4r98p5u5BjfQID5j4To7LyPYPw8
 2lUORddMujGjELG/P5u/BHWroQvHQbVR5GUKJhJfQIrGT9s2VXkWm02gHvTtKUzp5HyE
 ADb9ei3GJJQqmqdafKjzZ4ELfG5iDFzUmgovIazBtAr+nOcpEDRDiI1PzUdxDvPrJgIn
 JmQgCl8Z2hGohyxI40cJVsKTo/leJZJ4s9oP9w9OACwTKkvBKYhz/4ZOevIe0Jxl5qZr
 XpFg==
X-Gm-Message-State: AFqh2ko5AOYJgQKyGl+bGXlfbXrb/mPz6EucWCdBGuSwB54dgAkGWAMI
 cu5/0LrWeZo3jR8DmmUUXP54FKOK2ZisU3nJ
X-Google-Smtp-Source: AMrXdXvZs/lA5kpg1VvyYpCoqYeN+kHa1uDUMRKx8ZCfwDkWl+JvGpAinGdM5qzyj3NwVvOujWTy2Q==
X-Received: by 2002:adf:fe0a:0:b0:2bd:6ddc:3a44 with SMTP id
 n10-20020adffe0a000000b002bd6ddc3a44mr779612wrr.62.1673339129539; 
 Tue, 10 Jan 2023 00:25:29 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 u14-20020adfdd4e000000b002366e3f1497sm10663791wrm.6.2023.01.10.00.25.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 00:25:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 4/5] hw/i2c/versatile_i2c: Use ARM_SBCON_I2C() macro
Date: Tue, 10 Jan 2023 09:25:07 +0100
Message-Id: <20230110082508.24038-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110082508.24038-1-philmd@linaro.org>
References: <20230110082508.24038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

ARM_SBCON_I2C() macro and ArmSbconI2CState typedef are
already declared via the QOM DECLARE_INSTANCE_CHECKER()
macro in "hw/i2c/arm_sbcon_i2c.h". Drop the VERSATILE_I2C
declarations from versatile_i2c.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/i2c/versatile_i2c.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/i2c/versatile_i2c.c b/hw/i2c/versatile_i2c.c
index b95c70608b..d19df62265 100644
--- a/hw/i2c/versatile_i2c.c
+++ b/hw/i2c/versatile_i2c.c
@@ -29,11 +29,6 @@
 #include "qemu/module.h"
 #include "qom/object.h"
 
-typedef ArmSbconI2CState VersatileI2CState;
-DECLARE_INSTANCE_CHECKER(ArmSbconI2CState, VERSATILE_I2C,
-                         TYPE_ARM_SBCON_I2C)
-
-
 
 REG32(CONTROL_GET, 0)
 REG32(CONTROL_SET, 0)
@@ -86,7 +81,7 @@ static const MemoryRegionOps versatile_i2c_ops = {
 static void versatile_i2c_init(Object *obj)
 {
     DeviceState *dev = DEVICE(obj);
-    ArmSbconI2CState *s = VERSATILE_I2C(obj);
+    ArmSbconI2CState *s = ARM_SBCON_I2C(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     I2CBus *bus;
 
-- 
2.38.1


