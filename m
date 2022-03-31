Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E034EE405
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 00:27:52 +0200 (CEST)
Received: from localhost ([::1]:60938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na3Gh-0002Uy-6Q
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 18:27:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1na39V-0008WD-Al; Thu, 31 Mar 2022 18:20:25 -0400
Received: from [2a00:1450:4864:20::12d] (port=42704
 helo=mail-lf1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1na39T-0001Qg-Oe; Thu, 31 Mar 2022 18:20:25 -0400
Received: by mail-lf1-x12d.google.com with SMTP id d5so1602086lfj.9;
 Thu, 31 Mar 2022 15:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oUWjO9X6FioG7CEd8HdVxMlq6SisXj3KorxzLNrTPkM=;
 b=Z585ttuLoYYjlDzfCSOMZ8BwaBPqlf+ri64xN2ecRZyCz9j9TPxSaHy4U8ldM84pW8
 0LI8CbbQecPTwn1axtQxaqcxhwP/YgwR8l20E8XK7v2JyhaPxu1zvJ7LZNJ7XVmvebUB
 6auCzirtJgWP439wROoZ//xh3Fwm1rKuxw4qUjuRBnW24iSQo+4yn4je6eARJvgEBhgg
 TlUZvqz2AYynRBGH/YjRFLR9ExykUQ34Jv5fYJTDBYBbvh9UWAWFv6QuAZ9Tz7sDEkih
 /RncO/cscwPLL1u0jFIph+yt7UYPjr5x+CUL0o/FVe3SpeT9/xaMlsHEuwzzb8TACYPZ
 B0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oUWjO9X6FioG7CEd8HdVxMlq6SisXj3KorxzLNrTPkM=;
 b=jZ8FMC2fR7eik7dBMj3og21/rhsFNN08u1fWgDHRvZ7jTotLOOBtr72IgxIIqKxPJv
 cOkcdbPmW3VEUjJrm/sqBUNVzUMRd47A8Tb65saLFhEPFVDGN9sUHJ51ZGQeUAzMVaa9
 0ONHpRqzaIMkXeHfZk4sBjbQNIRgDgYqwS6RhwnRnac7iWKJswGzO9M+amwID0mXoNRj
 wQVbww3+RS0n63vlnLPVv7lgSYtPNWnZB/SZp7bie6VtPcnYTMU/vqBsv0AyOd/KpXYt
 kdYJhcjBER3JROB17Fx0NSDMAmlVVvNgrRvJM0DJMwGtEJll8gqxE6kZ2PHveZNLQyNp
 X4Tg==
X-Gm-Message-State: AOAM5326PYdDVutIbGryV/N1f8ncXQJ5YWXv+vMKvj5tVe4wNiphcvOn
 dBnuhDnqU8/TWbMypey4VFi803n8UGPTqg==
X-Google-Smtp-Source: ABdhPJw333fIiJaypQlwRQ0Jxb0aDCBNUFz1dLrc6I4Z2WI9740QDxNHum07ffpmXxoh/YE4bTrmGQ==
X-Received: by 2002:a05:6512:c24:b0:44a:7434:9836 with SMTP id
 z36-20020a0565120c2400b0044a74349836mr12345785lfu.128.1648765221404; 
 Thu, 31 Mar 2022 15:20:21 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a056512312800b0044acfa17863sm58875lfd.64.2022.03.31.15.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 15:20:20 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/2] hw/arm/xlnx-zynqmp: Connect 4 TTC timers
Date: Fri,  1 Apr 2022 00:20:17 +0200
Message-Id: <20220331222017.2914409-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331222017.2914409-1-edgar.iglesias@gmail.com>
References: <20220331222017.2914409-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 asifsiddiqui120@gmail.com, edgar.iglesias@amd.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, f4bug@amsat.org, francisco.iglesias@xilinx.com,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Connect the 4 TTC timers on the ZynqMP.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 include/hw/arm/xlnx-zynqmp.h |  4 ++++
 hw/arm/xlnx-zynqmp.c         | 22 ++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 9d9a9d0bf9..85fd9f53da 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -41,6 +41,7 @@
 #include "hw/or-irq.h"
 #include "hw/misc/xlnx-zynqmp-apu-ctrl.h"
 #include "hw/misc/xlnx-zynqmp-crf.h"
+#include "hw/timer/cadence_ttc.h"
 
 #define TYPE_XLNX_ZYNQMP "xlnx-zynqmp"
 OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
@@ -84,6 +85,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
 #define XLNX_ZYNQMP_MAX_RAM_SIZE (XLNX_ZYNQMP_MAX_LOW_RAM_SIZE + \
                                   XLNX_ZYNQMP_MAX_HIGH_RAM_SIZE)
 
+#define XLNX_ZYNQMP_NUM_TTC 4
+
 /*
  * Unimplemented mmio regions needed to boot some images.
  */
@@ -128,6 +131,7 @@ struct XlnxZynqMPState {
     qemu_or_irq qspi_irq_orgate;
     XlnxZynqMPAPUCtrl apu_ctrl;
     XlnxZynqMPCRF crf;
+    CadenceTTCState ttc[XLNX_ZYNQMP_NUM_TTC];
 
     char *boot_cpu;
     ARMCPU *boot_cpu_ptr;
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 5bfe285a19..375309e68e 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -68,6 +68,9 @@
 #define APU_ADDR            0xfd5c0000
 #define APU_IRQ             153
 
+#define TTC0_ADDR           0xFF110000
+#define TTC0_IRQ            36
+
 #define IPI_ADDR            0xFF300000
 #define IPI_IRQ             64
 
@@ -316,6 +319,24 @@ static void xlnx_zynqmp_create_crf(XlnxZynqMPState *s, qemu_irq *gic)
     sysbus_connect_irq(sbd, 0, gic[CRF_IRQ]);
 }
 
+static void xlnx_zynqmp_create_ttc(XlnxZynqMPState *s, qemu_irq *gic)
+{
+    SysBusDevice *sbd;
+    int i, irq;
+
+    for (i = 0; i < XLNX_ZYNQMP_NUM_TTC; i++) {
+        object_initialize_child(OBJECT(s), "ttc[*]", &s->ttc[i],
+                                TYPE_CADENCE_TTC);
+        sbd = SYS_BUS_DEVICE(&s->ttc[i]);
+
+        sysbus_realize(sbd, &error_fatal);
+        sysbus_mmio_map(sbd, 0, TTC0_ADDR + i * 0x10000);
+        for (irq = 0; irq < 3; irq++) {
+            sysbus_connect_irq(sbd, irq, gic[TTC0_IRQ + i * 3 + irq]);
+        }
+    }
+}
+
 static void xlnx_zynqmp_create_unimp_mmio(XlnxZynqMPState *s)
 {
     static const struct UnimpInfo {
@@ -721,6 +742,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     xlnx_zynqmp_create_efuse(s, gic_spi);
     xlnx_zynqmp_create_apu_ctrl(s, gic_spi);
     xlnx_zynqmp_create_crf(s, gic_spi);
+    xlnx_zynqmp_create_ttc(s, gic_spi);
     xlnx_zynqmp_create_unimp_mmio(s);
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_GDMA_CH; i++) {
-- 
2.25.1


