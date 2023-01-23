Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE951677CB9
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 14:40:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJwzy-00068v-Ut; Mon, 23 Jan 2023 08:36:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzZ-0005x3-Kw
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:15 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzX-0002Om-8Z
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:09 -0500
Received: by mail-wm1-x32a.google.com with SMTP id g10so9034903wmo.1
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 05:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1+71eOJG8GsVCLoNEVtR5oknFA2XfD2q/R1m6fbM4mk=;
 b=BfeyaEPIc6ygebMNcOOg0E4x2DBgG++njx7YJFtUZw9M4Yf70xGwed8oaSNEUxq7Y0
 KJDD+RAz+Z+MBbSnZFSxZRWh5xor49yyjnt3gGWRx00VksAyTMJRCWS2W/81zUAQLFio
 pwOavWsBs7wxs9nAfGdohAVpIV3Ads/EqqGgGqhiomyaYHmLgbfCd7SavA1ZIMY/FQEp
 orWE7KRbqfQBl6mRpBCHrvPqrwloZ3eJNAIb5FTx/aHolpkVl+eIp3Wqpe3MZp7TT8ZS
 JtAjnH4rrDaosOfyHwVrhw5Mp5k7dE6eIwtnRi9FjoalYvL3fSRh5kYaBitfxwMqHDNg
 Bppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1+71eOJG8GsVCLoNEVtR5oknFA2XfD2q/R1m6fbM4mk=;
 b=WrDfkdJ6jXYloQGggoUYgj/+4UxSQjZQIczYDzVqxpz7voMVNmholIoo0TiIXJosk3
 uRS79EnmtWPRLEaAQs/GqHrvn8OYMTAQ51rx6UaUlUZmRb1ISOZLOYbf1oQyfPCfoKVP
 69/U6fCLSot4FbB5tm5BQQ/TUY4+l7qjZb0K7a5hcy4V5qWNUq/OKn3IpfKyltHCgX7I
 KrqIGvxtNOGCUia60IZ+3KCJHNqGbeOnuMq+Nmg9vcAhWXYzwjO0KBCCSpdJlvIVSlzK
 IWWKouC6ATA/3Hlwh1sR7+sbyiZ1z3qUf2KZnzAaEK+w3ZNsSuXpbof6gr6H/6f880xf
 g+FQ==
X-Gm-Message-State: AFqh2kr2S8V8T8TxtHLlaqETa9J40Tv599OB4mznM9CILmw2WxDl5b2c
 3ATaEVrWb9V1TPE3I4Gw7bf/MmM9PZqIQTbs
X-Google-Smtp-Source: AMrXdXvLnIBEHTVE89A58EDfvxfQeHAeidk6WnkffHZw+xP+Od0OaDFh4+B+9hfWkBWKIRHoqStFzw==
X-Received: by 2002:a05:600c:995:b0:3da:f4f5:ad0e with SMTP id
 w21-20020a05600c099500b003daf4f5ad0emr23642433wmp.9.1674480965646; 
 Mon, 23 Jan 2023 05:36:05 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a05600c34d300b003a6125562e1sm10817457wmq.46.2023.01.23.05.36.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:36:05 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/26] hw/i2c/versatile_i2c: Use ARM_SBCON_I2C() macro
Date: Mon, 23 Jan 2023 13:35:38 +0000
Message-Id: <20230123133553.2171158-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123133553.2171158-1-peter.maydell@linaro.org>
References: <20230123133553.2171158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

ARM_SBCON_I2C() macro and ArmSbconI2CState typedef are
already declared via the QOM DECLARE_INSTANCE_CHECKER()
macro in "hw/i2c/arm_sbcon_i2c.h". Drop the VERSATILE_I2C
declarations from versatile_i2c.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230110082508.24038-5-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i2c/versatile_i2c.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/i2c/versatile_i2c.c b/hw/i2c/versatile_i2c.c
index b95c70608b2..d19df62265a 100644
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
2.34.1


