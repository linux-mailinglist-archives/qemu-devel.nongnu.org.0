Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0300467A6CD
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 00:22:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKSbK-0002d4-MW; Tue, 24 Jan 2023 18:21:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKSbG-0002co-VN
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 18:21:11 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKSbB-0005B4-EI
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 18:21:10 -0500
Received: by mail-pl1-x632.google.com with SMTP id a18so3732880plm.2
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 15:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1ERJ2Ch1QZiTxrD9CCXUoOLeDzJoYJb8Lu3vpv52E10=;
 b=IvVXzOWZqdG2xbBkAQTJGgVIz6AyY9O0CWAl5upP91Ioh3sqUxgzCb9KvFkXYqGaDE
 KPKj0tRTKmTC/F/7mI3z0g0yg2n18Ln9k+T7P+jH1Q3gDqNhzfvkKCsOjVD/8KP5S5uL
 hCbevRSHDC4gYSEXDC5z6Sxg/V0sdl72ojAGc6Coh9VPyABJUQBp20HxmoAJiFZPqZId
 mgbDaIOD+IT8UC0Bc/13SSaeUu1C9beagBcqurrePJKLKMkNyi8jchLNxrNggzuXQAT/
 O7JpjRVeUwslyv3DnIOnxS+lT9w/Mv7I3wBcctJWeHOG9+E4kqQmKOesRMhsCisLf8lK
 D9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1ERJ2Ch1QZiTxrD9CCXUoOLeDzJoYJb8Lu3vpv52E10=;
 b=Dx2KXo6wLBCBooOi090ere32QENTuZ/LLxWIlijN3VyoV8JqwOHrUHsXtKG6Uuzgjd
 r3UGnODHAiwruROIbAFEdmLcXGGaFt+xwMaTseFOcDe92Kbmc7U+I85I/ld5YM0D0fwT
 HvhPE1qua3t3HTF4PrKzwy/PnIlkxphhzZx83Vv7qTOogu9st8ay15QulXvBBaNDde92
 C+NstbJdk4p0nrooPzhU2Sr4MxxZ75czETt33GXYYd7Xy5guV7IZiTMVGATHlkNaPh+l
 E9DBxg8IMOxisz1wzY5l9mAnD3dOznWslAu8I7T7acdD4OILPa5SCq30PRd/w31K3GK9
 pvEA==
X-Gm-Message-State: AFqh2koho+A9FVSdvWMKXKtO1/pzYhWb883olrLTWHcNfDZoJ0ogJjrM
 nHqOC/sLz4fWL2/V3q4+3Q5YaN1ZJbO+lQHB
X-Google-Smtp-Source: AMrXdXtAnfAuWGzBb9XNGzcaQs0oPparmfnpgErJcHC0glWpT3ul65B8wB2DOlI8tyLmZlTdUVS1yw==
X-Received: by 2002:a17:902:b713:b0:194:3fa4:3f46 with SMTP id
 d19-20020a170902b71300b001943fa43f46mr29383782pls.29.1674602463713; 
 Tue, 24 Jan 2023 15:21:03 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a623809000000b0056c2e497b02sm2194090pfa.173.2023.01.24.15.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 15:21:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH] hw/arm: Use TYPE_ARM_SMMUV3
Date: Tue, 24 Jan 2023 13:20:59 -1000
Message-Id: <20230124232059.4017615-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

Use the macro instead of two explicit string literals.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/sbsa-ref.c | 3 ++-
 hw/arm/virt.c     | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 4bb444684f..8378441dbb 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -29,6 +29,7 @@
 #include "exec/hwaddr.h"
 #include "kvm_arm.h"
 #include "hw/arm/boot.h"
+#include "hw/arm/smmuv3.h"
 #include "hw/block/flash.h"
 #include "hw/boards.h"
 #include "hw/ide/internal.h"
@@ -574,7 +575,7 @@ static void create_smmu(const SBSAMachineState *sms, PCIBus *bus)
     DeviceState *dev;
     int i;
 
-    dev = qdev_new("arm-smmuv3");
+    dev = qdev_new(TYPE_ARM_SMMUV3);
 
     object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
                              &error_abort);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 5f1fddd210..d103de8c2e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1344,7 +1344,7 @@ static void create_smmu(const VirtMachineState *vms,
         return;
     }
 
-    dev = qdev_new("arm-smmuv3");
+    dev = qdev_new(TYPE_ARM_SMMUV3);
 
     object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
                              &error_abort);
-- 
2.34.1


