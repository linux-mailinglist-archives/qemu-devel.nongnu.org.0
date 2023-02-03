Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F55689C02
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:37:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNx4V-0006ev-72; Fri, 03 Feb 2023 09:29:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4H-0006ao-GA
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:34 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4F-00053d-PZ
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:33 -0500
Received: by mail-wm1-x333.google.com with SMTP id q8so3999534wmo.5
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Li+pWB+M1ny80ksWu15v+SH9Uhscz2fzZUVC1wklHOc=;
 b=JXAzJ6aVeUmX4jW3n9mI3bu2+wJS722OrZm05c5aowDEyyYgjIns4tJnH08sspHz4F
 ImcBWQvlGK+RmFJneHyUPcTJ//dwA662ZZMuQnSEhVgc6UgExAEp9eZpYRgDNwAGqy1c
 w1TVE131EIIFGp8+JYV+ACc5lbukcnPjiLhX2OJW8FPqcK2Nf+NATA4a1bpku8qP/r+c
 UCRBgJ44wW7fvcUzdUT7SBWgYJv9CrreUiMaGwnCCuWhMcsskJHunAuh7hZm0cAuPzVq
 FUfzrO5g9rvqgwMS88kQ2iHJiD20jBL4wEJjmMBj9OrfY1U/ovj1Y4+/jJbgBfxqdTae
 WXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Li+pWB+M1ny80ksWu15v+SH9Uhscz2fzZUVC1wklHOc=;
 b=SmvmmNHhLeuUFKD8jt6v818ll7evXcrO8u8WULDAZBjPeZfr4rjpi3+mackQ96mlnR
 m2jfZO5Dk/PCYOpA+o9zra5A6y6xlSes6Kq/Ph4IBkapzPgCF3T3O4l5dsEZYcvxNdMO
 PUrgOoc1FQQ/0X3Y7VSiMovRpjmxgJBcdTQrlm+f+IGEB42PY3g5Ucc6draCHlADwY6F
 wVQWoD586s6uP1YRAJkiXxVLKeroq3ZNiwLjyrgYonjosWRrF8FgK+itGWTI94SeJZAn
 Pjz7qyGJ7IYkUVSBqhLQ/kOZoCkz2xWsrg6QjHnGMR8V+ni8YVDBta4/RFrFkiut7hFj
 F6Xw==
X-Gm-Message-State: AO0yUKXsCPKvNZyHQhnirC/94uyYuXs96Woa2lgHYvFSrz1mpdZzOxEs
 MERSelTHuqttuDIVqlhlgPg1csWXXha1raiN
X-Google-Smtp-Source: AK7set8scNsUsKKg6zmwS0OB2y2R3PBtX6NAhxv3cb6S8msog7u1gBaSS/FNXFhMaW/3pVb/QCiSBQ==
X-Received: by 2002:a05:600c:314a:b0:3df:ee43:860b with SMTP id
 h10-20020a05600c314a00b003dfee43860bmr731698wmo.23.1675434570103; 
 Fri, 03 Feb 2023 06:29:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm2578492wmf.42.2023.02.03.06.29.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 06:29:29 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/33] hw/arm: Use TYPE_ARM_SMMUV3
Date: Fri,  3 Feb 2023 14:28:55 +0000
Message-Id: <20230203142927.834793-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203142927.834793-1-peter.maydell@linaro.org>
References: <20230203142927.834793-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Use the macro instead of two explicit string literals.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-id: 20230124232059.4017615-1-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/sbsa-ref.c | 3 ++-
 hw/arm/virt.c     | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 4bb444684f4..8378441dbb1 100644
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
index ea2413a0bad..90a7099d3b5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1343,7 +1343,7 @@ static void create_smmu(const VirtMachineState *vms,
         return;
     }
 
-    dev = qdev_new("arm-smmuv3");
+    dev = qdev_new(TYPE_ARM_SMMUV3);
 
     object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
                              &error_abort);
-- 
2.34.1


