Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C95954E57F6
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 18:56:25 +0100 (CET)
Received: from localhost ([::1]:57130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX5Dc-0005xA-UO
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 13:56:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nX4ub-00017i-7J
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:36:45 -0400
Received: from [2607:f8b0:4864:20::1029] (port=42533
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nX4uK-0005Xj-RQ
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:36:44 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 o3-20020a17090a3d4300b001c6bc749227so2544050pjf.1
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 10:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2EsJ9w4OtAe62QE/DTZfa1jMS0xrU6YKS1g+C71i9i0=;
 b=zCGPEDVJ5j3EC41nOk4QuQmCLFTk53zzMU3Ql176m0Y1S2MTJ5ZY2xhCTiRzMotFvl
 npA2hcQUbmlUwa4GmLxdaXLuc0jdskSRZPgPzahpxNK0aRzCJbOQqGP+BD5+Bs8CvsG6
 SmjcuZzbkkYZXau5WnywH9kompyxYEO8JvDbmYXi+7KdHIwsD0uHHec0x10Mt5thUk/Z
 Pu4taNH5E65PH+SQGttNQu0PlQ0ab8yco8Kx9OZjfCTSS8kH6t1L6W4Td6aYL+FMaGxm
 iS1py578GyQtem+63rKDUL+jXPbLyozBrhdrlN4OcfY7A8HzpXAGQJ5ZQ4A/QXQBp7Gp
 qyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2EsJ9w4OtAe62QE/DTZfa1jMS0xrU6YKS1g+C71i9i0=;
 b=GSwOqKMkbVORvSJ3PKJzPEg2a8NciBN8V1DpSLfaa94+AB+skKuypbUqTfSuKrYgVQ
 155ch5o1NulcB5WKTUXOnbioQAtD8XmFuNTy2i9PTx5geU+zqj4oY4LLGWpGFfS9+B6A
 hI353PnjGcYU1E5Y4IQAOe9BKwKSCgGpgQupxISmkdrB1Z1A0TKImTBiuSKtI1KFzzp5
 bcRlyKJbvCLX0C5a/l3MzZiOs9b0wx0+T0cYVSY9I6z4JPXXRFHbbIN+/uVLOQWH5qi9
 pDlfQ/vA3OVFrpLoUIXk47pkgZ0jlbpEC2lxIadokh+mbZ4Ocn7IvRqeQTpa7htwU/Jk
 Hz/w==
X-Gm-Message-State: AOAM533tA9nmYhiJvkJv+pBbYtTCaMp4l44kw8oXdD7Z895Jporr2qpV
 eocGMkZuiD9aUNfZUEWhNr/RPzmTXGW2DA==
X-Google-Smtp-Source: ABdhPJwAlNcxtavjyj0HOqkLfXf9kkDhzB7jQYB+HGNIcmPI2f6EL5/iuD8dxf0dSjpsvlcqG+LDwA==
X-Received: by 2002:a17:90a:7ac2:b0:1bf:3573:179b with SMTP id
 b2-20020a17090a7ac200b001bf3573179bmr892742pjl.216.1648056987360; 
 Wed, 23 Mar 2022 10:36:27 -0700 (PDT)
Received: from dev.lizongyuan.local ([103.177.44.11])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a056a0014d300b004fae5e3970csm553239pfu.35.2022.03.23.10.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 10:36:26 -0700 (PDT)
From: Zongyuan Li <zongyuan.li@smartx.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/5] hw/intc/exynos4210_gic: replace 'qemu_split_irq' with
 'TYPE_SPLIT_IRQ'
Date: Thu, 24 Mar 2022 01:35:42 +0800
Message-Id: <20220323173543.146442-5-zongyuan.li@smartx.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20220323173543.146442-1-zongyuan.li@smartx.com>
References: <20220323173543.146442-1-zongyuan.li@smartx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1029;
 envelope-from=zongyuan.li@smartx.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:Exynos" <qemu-arm@nongnu.org>, Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
---
 hw/intc/exynos4210_gic.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index bc73d1f115..d8ecb9fae3 100644
--- a/hw/intc/exynos4210_gic.c
+++ b/hw/intc/exynos4210_gic.c
@@ -29,6 +29,8 @@
 #include "hw/qdev-properties.h"
 #include "hw/arm/exynos4210.h"
 #include "qom/object.h"
+#include "hw/hw.h"
+#include "hw/core/split-irq.h"
 
 enum ExtGicId {
     EXT_GIC_ID_MDMA_LCD0 = 66,
@@ -209,6 +211,23 @@ qemu_irq *exynos4210_init_irq(Exynos4210Irq *s)
             EXYNOS4210_MAX_INT_COMBINER_IN_IRQ);
 }
 
+
+static qemu_irq split_irq(qemu_irq out1, qemu_irq out2) {
+    DeviceState *splitter = qdev_new(TYPE_SPLIT_IRQ);
+
+    qdev_prop_set_uint32(splitter, "num-lines", 2);
+
+    if (!qdev_realize_and_unref(splitter, NULL, &error_fatal)) {
+        hw_error("exynos4210.combiner: unable to realize split irq device");
+        return NULL;
+    }
+
+    qdev_connect_gpio_out(splitter, 0, out1);
+    qdev_connect_gpio_out(splitter, 1, out2);
+
+    return qdev_get_gpio_in(splitter, 0);
+}
+
 /*
  * Initialize board IRQs.
  * These IRQs contain splitted Int/External Combiner and External Gic IRQs.
@@ -230,10 +249,10 @@ void exynos4210_init_board_irqs(Exynos4210Irq *s)
             irq_id = EXT_GIC_ID_MCT_G1;
         }
         if (irq_id) {
-            s->board_irqs[n] = qemu_irq_split(s->int_combiner_irq[n],
+            s->board_irqs[n] = split_irq(s->int_combiner_irq[n],
                     s->ext_gic_irq[irq_id-32]);
         } else {
-            s->board_irqs[n] = qemu_irq_split(s->int_combiner_irq[n],
+            s->board_irqs[n] = split_irq(s->int_combiner_irq[n],
                     s->ext_combiner_irq[n]);
         }
     }
@@ -245,7 +264,7 @@ void exynos4210_init_board_irqs(Exynos4210Irq *s)
                      EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ][bit];
 
         if (irq_id) {
-            s->board_irqs[n] = qemu_irq_split(s->int_combiner_irq[n],
+            s->board_irqs[n] = split_irq(s->int_combiner_irq[n],
                     s->ext_gic_irq[irq_id-32]);
         }
     }
-- 
2.34.0


