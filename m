Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF33669B55
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:03:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKnJ-0001VP-81; Fri, 13 Jan 2023 09:12:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKml-00012r-LR
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:59 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmh-0003ev-90
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:59 -0500
Received: by mail-wm1-x32b.google.com with SMTP id o15so15343644wmr.4
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=q7Emin5LoBOaXo/950Rc6TydbfuLbLjEQel5QAMzT6A=;
 b=mEuXM2hct2dEW5utDYoRtPTqEuWsT9sH9phsJtBzs8FLdQPs8kzWwMw5jF2SmZBydW
 M86ZBxCMUW/KaJjAsXL0wNe7WiasEqfGnOMsJjXlU42/n9THAFhfjVi4nJntWXfFXUMD
 6h0Tmwq78oneu4elrTu1atiQQ8qhOOGgjzIhAefXLL2fC/NnI2JyjWHi/tC33UrNPQy1
 hDOErl6BzHJ1TUBm7IhQJMnZdRsg+ihd0fIZBAG/CiKS3w4TG+NtbEiO2CoeFdYoKOSz
 rhLC/2CH6aI6rUs/IlHjR3MDz1fQhHS/nT2hfnFxP00SXId260NmW1Vcl6rkd1pOMTs0
 EeiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q7Emin5LoBOaXo/950Rc6TydbfuLbLjEQel5QAMzT6A=;
 b=tSAH3WgqpJTXUwh5EimMUEXpa68FbdHZCMMXYf2i2qDiMsZ1yMy65zbZS6hnWAm/dr
 6HlCAznmzvouD8z6PO9DBpE3zfcDbU51KkGilW7FiC5mCZDt4ucaw3+Kotroas8bwCul
 jtHpW9JNYtxg4oj0Sa6gPxMHFVw1JyPV+S6mCvk3/mbEexOpXptB7kHdcXqrtQScO5x2
 aGZUHs+oDhtwmKm/0Av+IDYe/ik2dvFIa1TJ4UoJAHTdE/odBW3y3tkhul2YDD2HUyYu
 CUdiOqlPENVhUtshObZ16GnsM2qIhdQe0r2U+eCC0+erNp3JoWP4htyxEhzDPC7+ib04
 dv/w==
X-Gm-Message-State: AFqh2kql9fBAFQRcb8++y5zr64VwNA2J5nFKg7c9854aFCbt776LEtZZ
 U2oC4IMaxIebaN7S3b54EPd/BRnjgxvL41dy
X-Google-Smtp-Source: AMrXdXvVsa63hYOMfyDyHTafy/qickl3yWGdGJ7cJ3J36mOH2P8B4kARThNDkp6ky6qQSn1g7+aLRg==
X-Received: by 2002:a1c:6a16:0:b0:3c6:f732:bf6f with SMTP id
 f22-20020a1c6a16000000b003c6f732bf6fmr58470016wmc.13.1673619108534; 
 Fri, 13 Jan 2023 06:11:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/38] hw/arm/pxa: Avoid forward-declaring PXA2xxI2CState
Date: Fri, 13 Jan 2023 14:11:12 +0000
Message-Id: <20230113141126.535646-25-peter.maydell@linaro.org>
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

To avoid forward-declaring PXA2xxI2CState, declare
PXA2XX_I2C before its use in pxa2xx_i2c_init() prototype.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230109140306.23161-2-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/pxa.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/hw/arm/pxa.h b/include/hw/arm/pxa.h
index ba8f49e48ed..54eb895e42a 100644
--- a/include/hw/arm/pxa.h
+++ b/include/hw/arm/pxa.h
@@ -119,14 +119,14 @@ void pxa27x_register_keypad(PXA2xxKeyPadState *kp,
                             const struct keymap *map, int size);
 
 /* pxa2xx.c */
-typedef struct PXA2xxI2CState PXA2xxI2CState;
+#define TYPE_PXA2XX_I2C "pxa2xx_i2c"
+OBJECT_DECLARE_SIMPLE_TYPE(PXA2xxI2CState, PXA2XX_I2C)
+
 PXA2xxI2CState *pxa2xx_i2c_init(hwaddr base,
                 qemu_irq irq, uint32_t page_size);
 I2CBus *pxa2xx_i2c_bus(PXA2xxI2CState *s);
 
-#define TYPE_PXA2XX_I2C "pxa2xx_i2c"
 typedef struct PXA2xxI2SState PXA2xxI2SState;
-OBJECT_DECLARE_SIMPLE_TYPE(PXA2xxI2CState, PXA2XX_I2C)
 
 #define TYPE_PXA2XX_FIR "pxa2xx-fir"
 OBJECT_DECLARE_SIMPLE_TYPE(PXA2xxFIrState, PXA2XX_FIR)
-- 
2.34.1


