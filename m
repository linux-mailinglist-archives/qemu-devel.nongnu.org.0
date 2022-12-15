Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E115264DC52
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 14:35:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5nhV-00077G-HA; Thu, 15 Dec 2022 07:51:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5nh0-0006pC-UA
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:32 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngz-00047E-25
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:30 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso1755936wmo.1
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Dw6wotKA3haXzI9jka+bFUKrg99kB/zH8+x+4g05lKY=;
 b=HzPCvfdq1cqVR7NokUtxiCHf1oyOrpsFIQgq78dPQk5/Rk8PAUG6/IvHDLcTcJRrHS
 PGrQ+yF6FAleCmo2WuhxcOXT5SmfdybPBhx7FSUxhFyq78/iS/QnzuOmNX3uMyjsmy/H
 sQf0UcDM5FW4YwWgvFmDzT7J2U/U5hNsGaWxuHfyLYOy8zWUOV4X+V/M5EOkaxSD6CYt
 /pDVqcNxIwGZbbN4x89kjiHrwRitzrYtz42XpNRW9MLIyK4UC2OmM2cZy0MBYsMsFpNw
 BeIBykf2vnagXLIxhgdbhKTPU+TCGd+3dNKp4zaLY7OES7RvzrbDh3eOYZJcWKg8N1+t
 0bCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dw6wotKA3haXzI9jka+bFUKrg99kB/zH8+x+4g05lKY=;
 b=GFUTBkBonb1wToz52chLETWtjxMknU8k7fee1WVxG0h/VxnXzMYrzQW/TAdblOZQHe
 Ot90PTjV0gtpGM5fprMaShM0hFB/cpdiRV+4f5ctooSIkDQf4W5jjj++AtaZrnbyu+qm
 rDyuvVAZe3XS3YbAMq9zcrtTQNu9UqTDx25nKhm0rC+WArPvrwdm7uVZ4rYKt0dbZpHi
 KFEFNzecWg4TW1ecC/EijsLt0K0xWnv/PrlQaSDRpr+tlZguw2DgAHRDCTnjbYBXmJKB
 nQynBhfMEO1Vkf0ke7zzsGWAFXXg+dPN9vWQHpvXQGAUr69Rj5D572IOzxqBPafAixuR
 54lg==
X-Gm-Message-State: ANoB5plTpGa8CfTV7KgkGFdTbGXYkOKjZxbjAPeT9+b6G3HK6c1VkJxA
 8GDzwSMqqBq1PPFQbZALw3XFinSOTg8eQfvK
X-Google-Smtp-Source: AA0mqf6rBfvXlk2mC78/9AkPawAQ0YGsxqxBx0F2TA41uE2ZpK26HRJsbcwNmx/ZUdZonrPPSFujTw==
X-Received: by 2002:a05:600c:4e91:b0:3d1:dc6f:b1a4 with SMTP id
 f17-20020a05600c4e9100b003d1dc6fb1a4mr29960606wmq.5.1671108628328; 
 Thu, 15 Dec 2022 04:50:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b003cfd64b6be1sm8388787wmq.27.2022.12.15.04.50.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 04:50:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/29] hw/arm: Convert TYPE_ARM_SMMUV3 to 3-phase reset
Date: Thu, 15 Dec 2022 12:49:58 +0000
Message-Id: <20221215125009.980128-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215125009.980128-1-peter.maydell@linaro.org>
References: <20221215125009.980128-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

Convert the TYPE_ARM_SMMUV3 device to 3-phase reset.  The legacy
reset method doesn't do anything that's invalid in the hold phase, so
the conversion only requires changing it to a hold phase method, and
using the 3-phase versions of the "save the parent reset method and
chain to it" code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20221109161444.3397405-3-peter.maydell@linaro.org
---
 include/hw/arm/smmuv3.h |  2 +-
 hw/arm/smmuv3.c         | 12 ++++++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
index c641e60735e..f1921fdf9e7 100644
--- a/include/hw/arm/smmuv3.h
+++ b/include/hw/arm/smmuv3.h
@@ -77,7 +77,7 @@ struct SMMUv3Class {
     /*< public >*/
 
     DeviceRealize parent_realize;
-    DeviceReset   parent_reset;
+    ResettablePhases parent_phases;
 };
 
 #define TYPE_ARM_SMMUV3   "arm-smmuv3"
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index daa80e9c7b6..955b89c8d59 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1431,12 +1431,14 @@ static void smmu_init_irq(SMMUv3State *s, SysBusDevice *dev)
     }
 }
 
-static void smmu_reset(DeviceState *dev)
+static void smmu_reset_hold(Object *obj)
 {
-    SMMUv3State *s = ARM_SMMUV3(dev);
+    SMMUv3State *s = ARM_SMMUV3(obj);
     SMMUv3Class *c = ARM_SMMUV3_GET_CLASS(s);
 
-    c->parent_reset(dev);
+    if (c->parent_phases.hold) {
+        c->parent_phases.hold(obj);
+    }
 
     smmuv3_init_regs(s);
 }
@@ -1520,10 +1522,12 @@ static void smmuv3_instance_init(Object *obj)
 static void smmuv3_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     SMMUv3Class *c = ARM_SMMUV3_CLASS(klass);
 
     dc->vmsd = &vmstate_smmuv3;
-    device_class_set_parent_reset(dc, smmu_reset, &c->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, smmu_reset_hold, NULL,
+                                       &c->parent_phases);
     c->parent_realize = dc->realize;
     dc->realize = smmu_realize;
 }
-- 
2.25.1


