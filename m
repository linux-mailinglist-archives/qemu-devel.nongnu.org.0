Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7797C66219A
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 10:31:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEoIP-0000zi-Fn; Mon, 09 Jan 2023 04:18:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoIM-0000z8-SH
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:18:18 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoIK-0002ov-2n
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:18:18 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so6774331wml.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 01:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XBZPNJwwwaWX0RjrF0KkQO4XpoIayE+6GXh3agPp5AU=;
 b=HThy/Od9Mw18GjYaLpxMrV0IBibiTJIH/JaBK0A/JuGRaNHin+DU8kmFzbfHDO0YN+
 7jIPVAfQk7CczHZ0wrmUezEpcsdXKchz3kU1xZHH5xq9X+hmrsa3HjuFGg2nXDuR1MT3
 3KSySxx8WvUWBfJ71sEOlg8Saeao9kyKD+89EgYtXmiIgdKQFnI+uUIX3DSr8jFD9K3V
 YW7ukY+orZbwUmi3eELYgmfUSGhRGu5nOvQZt38diMysDx2cJy1yJABVQFQWjteSctmY
 2LQHNAv1Gy35RPZsKj7fsMVEvUsuliOOYP3nJqbgDL0bFRc6XVubktlmW4HemYvtoW7N
 UA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XBZPNJwwwaWX0RjrF0KkQO4XpoIayE+6GXh3agPp5AU=;
 b=sEQREgk2s90K87TC4atpSaHfSNeZxxjsGBkiEODEmiR9BDPLrFTVSK/oiAQmchsXdP
 trVVRtgII0/MeXP4hFdmqTwjGx13BNgXLO70GAABKVt7HOyFFUNATB4E1zyH4IOURUc0
 9vakHH/PJjlOrr93NZdHxbAvjD6P9zh48pWZZJ+Tk/EBg4RduUUeeF9SIZP3C0LrsZvQ
 Qd6+qCeTiQro01m9qf480L9GIBvx0ksSiE72qqLf61Wa8/g6UwDUoJVLdqPKpkp17Mj1
 XiaNy4bIub4aue/Nvd7uFsfXNMvlg7JjclcM1D/qkdtq4R7oiNGxWZoCBAf1M8lcRpsQ
 rpTQ==
X-Gm-Message-State: AFqh2kpwq568l8aSAFtRS1riBbNnGJR2+wdtEUV33DUPvvJtSUwelBUa
 vj0tu9pEihUqgjuOYYcnD6//u5ZXDJZtcXw2
X-Google-Smtp-Source: AMrXdXuDrsfwH2tcylv6oI9mcj1wyAAxWANdkDTDmwCxYZ9GhWE9H/g7/T71ECTXVVBLiekHUyJ0Bg==
X-Received: by 2002:a05:600c:1d89:b0:3d3:5cd6:781 with SMTP id
 p9-20020a05600c1d8900b003d35cd60781mr44990326wms.37.1673255894537; 
 Mon, 09 Jan 2023 01:18:14 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bg24-20020a05600c3c9800b003cfa3a12660sm27714784wmb.1.2023.01.09.01.18.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 01:18:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/5] hw/i2c/versatile_i2c: Use ARM_SBCON_I2C() macro
Date: Mon,  9 Jan 2023 10:17:53 +0100
Message-Id: <20230109091754.79499-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109091754.79499-1-philmd@linaro.org>
References: <20230109091754.79499-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


