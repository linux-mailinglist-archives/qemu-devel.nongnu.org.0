Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D794DDA9A
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:34:10 +0100 (CET)
Received: from localhost ([::1]:44192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVCk5-0005r8-VK
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:34:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZh-0006eh-VH
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:25 -0400
Received: from [2a00:1450:4864:20::336] (port=46781
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZg-0002CV-8n
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:25 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so4779166wmp.5
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 06:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=skh7ZtJM7j+brlaef0ORPlmyZxfZeY2D1B+dwRbY6ME=;
 b=l/gtrMwX1wFNaIiBvsPsebThq51ArwbZpQosJ5s3AEuYRBtHrPy6oTfgaSuOoW5M04
 5oxexEblsKNHSQn86qOf7r6VhmjMheikZe5rGeJx6oaQZoVAZ0TZIdJZgWd3Y0PKBIoz
 cyok2D84Iyd4Qo0m+Kn9jiQE4EkpzPjTQoDgHefu+ixsn17AXHiFTHFDYIlIrM0oQOoG
 xn/gyEuaRQho1lUTao/74XaX8D5/BimBDRGZmnmutAg1wwB6lkG35d6ab5WBVtFMtBV6
 F2ykkVO8MoZqjEYWxWSKFSE3So4D8Pos9Xjx1k9w8+lRyBOVs2BnGu+gTLTeV+jgrsoz
 ANWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=skh7ZtJM7j+brlaef0ORPlmyZxfZeY2D1B+dwRbY6ME=;
 b=BJAoyx7N/vtYn7D4BuaF7uzHEFNi5lDJA1Du4c2Ty+30xKnccTN/L6Dhnp2SOOg9HL
 90x0LchIBsj+yR6i9PAXAYYKU0ZBmBrhnPU7CzRfIBp6f4yfgZR0FjW1FU8sbbvKl8QQ
 HTLcGOWJ1FZgQIMFvEJiGvnULp80f5LO3s3DfDQusjZGQP6khb4stqUfDBdT6uSa1X9F
 kqbzFssK0j3+4gYViJhhaF0WFDAs97Pok6JMBCJnFqyUyLEziOFztbjJyJJz+i9yrAkz
 yA13K1RyeyGQ9ipsIzFz0x1visnaBMQDnZ0Dg1KKdkLFAcc5z5O4yutfvcz3I3im4iXN
 IHOA==
X-Gm-Message-State: AOAM531etUm5Yc2P4uWQmVNRflkcNugBnsho8AV7PFP7pinnoxf0yhth
 35+NKC3JJLBDcgviG24lKwo0eaokdXsqQw==
X-Google-Smtp-Source: ABdhPJzSLCWieR3a9cvO3gB83+RbYT515kcW9v2C2PzJ5UtnwwyziakTnk1vYR5tfsRRkkl/t2Lgxg==
X-Received: by 2002:a7b:cb83:0:b0:37e:bc50:3c6b with SMTP id
 m3-20020a7bcb83000000b0037ebc503c6bmr15830209wmi.67.1647609802873; 
 Fri, 18 Mar 2022 06:23:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a05600015cf00b00203e324347bsm6316599wry.102.2022.03.18.06.23.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 06:23:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/21] hw/arm/xlnx-zynqmp: Add an unimplemented SERDES area
Date: Fri, 18 Mar 2022 13:22:58 +0000
Message-Id: <20220318132306.3254960-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318132306.3254960-1-peter.maydell@linaro.org>
References: <20220318132306.3254960-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add an unimplemented SERDES (Serializer/Deserializer) area.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Message-id: 20220316164645.2303510-2-edgar.iglesias@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/xlnx-zynqmp.h | 2 +-
 hw/arm/xlnx-zynqmp.c         | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 9424f81c377..0552ba18b41 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -85,7 +85,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
 /*
  * Unimplemented mmio regions needed to boot some images.
  */
-#define XLNX_ZYNQMP_NUM_UNIMP_AREAS 1
+#define XLNX_ZYNQMP_NUM_UNIMP_AREAS 2
 
 struct XlnxZynqMPState {
     /*< private >*/
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 6d0e4116db7..47324cdc441 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -52,6 +52,10 @@
 #define QSPI_DMA_ADDR       0xff0f0800
 #define NUM_QSPI_IRQ_LINES  2
 
+/* Serializer/Deserializer.  */
+#define SERDES_ADDR         0xfd400000
+#define SERDES_SIZE         0x20000
+
 #define DP_ADDR             0xfd4a0000
 #define DP_IRQ              113
 
@@ -284,6 +288,7 @@ static void xlnx_zynqmp_create_unimp_mmio(XlnxZynqMPState *s)
         hwaddr size;
     } unimp_areas[ARRAY_SIZE(s->mr_unimp)] = {
         { .name = "apu", APU_ADDR, APU_SIZE },
+        { .name = "serdes", SERDES_ADDR, SERDES_SIZE },
     };
     unsigned int nr;
 
-- 
2.25.1


