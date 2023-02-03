Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D43689C00
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:37:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNx4f-0006jI-Tq; Fri, 03 Feb 2023 09:29:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4U-0006fP-Lo
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:46 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4M-00055T-T2
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:43 -0500
Received: by mail-wm1-x336.google.com with SMTP id k16so4011794wms.2
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hajMqWBba417xljX2PthUn9B4t3yYT0YWGuT0ofiAD4=;
 b=zXafyWWnS/sBsfgec+52+1yPAb5prgixQCW2hETKzQ61js4oR6oA+TDj47pC/shGvS
 gvtk2c8z4XEj/qnkFDw7B6vcU6K204wJPQE3F26T2YqdOYBBBKAQ7wtpDexB0Fwv5nTD
 SYG6w8kG1Fak8EqHgp4RXXmc8/HD3NvSOo5pv7qDQfDPcr8YD7Y+1f8/guyzN8aynwdK
 MICpDZynT/QvYVE37PosFyOHv7nJWQ0nYSY3PXhYLDlPmuzBT9YYr2fEBdilfVBQ6VkW
 DhNj+Ppf5XATy6oyjY5AYLRilwX+4D5BNnm3yZ9Vr9QAsaqMd68BErPelHAydbADy0a5
 /NJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hajMqWBba417xljX2PthUn9B4t3yYT0YWGuT0ofiAD4=;
 b=njjEkUxtTQ8Vb+MoZdOmW1XAkP7xGeR7ZNwOmvZJT+YOJsONbPh/aJWpLI4aC7I2UQ
 x4MAImbJOUfivygufiM+BRCKhJQPiymjwDXEn1wSTV+UaKEs6CNyWWz4U8xEVVrCAH6O
 ewCom0xvspNSmpdphdN9Yrerga6p1ViPUHdDkxp9mpog1PsmMXpOF4MasW59GxHJlNnQ
 GMHfRe0C1S87jHub2EgxUKsqzrf1vWuscuiJwagrsGzZ41Wj9GtncI/mArtc44k+bOOA
 Dtyh6qxnUZh5Iumlws1RJlyPCvj/jGGkQWRqXDVpDik3yWuh/nEVe2IswgUiZSZtAs62
 t+Eg==
X-Gm-Message-State: AO0yUKUyLEDPFGkaAaUv1JWR+hZYCzDeYidMkKiu92svjWm0JW1AqOIM
 Tut9pg8DRcRUWUiiFIk7eRKke1EjpuJ5CNQq
X-Google-Smtp-Source: AK7set+Hjqya6h/mOeagBoP7/kNROEH1zOB2EJiCbIhmeUXrp12eaKXIZvtAk0STL/8+y/gghXw5+g==
X-Received: by 2002:a05:600c:3545:b0:3df:ea9a:21c7 with SMTP id
 i5-20020a05600c354500b003dfea9a21c7mr1827418wmq.33.1675434576722; 
 Fri, 03 Feb 2023 06:29:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm2578492wmf.42.2023.02.03.06.29.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 06:29:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/33] hw/arm/virt: Make accels in GIC finalize logic explicit
Date: Fri,  3 Feb 2023 14:29:03 +0000
Message-Id: <20230203142927.834793-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203142927.834793-1-peter.maydell@linaro.org>
References: <20230203142927.834793-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

From: Alexander Graf <agraf@csgraf.de>

Let's explicitly list out all accelerators that we support when trying to
determine the supported set of GIC versions. KVM was already separate, so
the only missing one is HVF which simply reuses all of TCG's emulation
code and thus has the same compatibility matrix.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221223090107.98888-3-agraf@csgraf.de
[PMM: Added qtest to the list of accelerators]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 28c43d59fbd..ba477282885 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -47,8 +47,10 @@
 #include "sysemu/numa.h"
 #include "sysemu/runstate.h"
 #include "sysemu/tpm.h"
+#include "sysemu/tcg.h"
 #include "sysemu/kvm.h"
 #include "sysemu/hvf.h"
+#include "sysemu/qtest.h"
 #include "hw/loader.h"
 #include "qapi/error.h"
 #include "qemu/bitops.h"
@@ -1929,7 +1931,7 @@ static void finalize_gic_version(VirtMachineState *vms)
         /* KVM w/o kernel irqchip can only deal with GICv2 */
         gics_supported |= VIRT_GIC_VERSION_2_MASK;
         accel_name = "KVM with kernel-irqchip=off";
-    } else {
+    } else if (tcg_enabled() || hvf_enabled() || qtest_enabled())  {
         gics_supported |= VIRT_GIC_VERSION_2_MASK;
         if (module_object_class_by_name("arm-gicv3")) {
             gics_supported |= VIRT_GIC_VERSION_3_MASK;
@@ -1938,6 +1940,9 @@ static void finalize_gic_version(VirtMachineState *vms)
                 gics_supported |= VIRT_GIC_VERSION_4_MASK;
             }
         }
+    } else {
+        error_report("Unsupported accelerator, can not determine GIC support");
+        exit(1);
     }
 
     /*
-- 
2.34.1


