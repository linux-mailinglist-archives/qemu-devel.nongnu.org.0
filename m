Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC2F662536
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:15:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqxo-00005K-So; Mon, 09 Jan 2023 07:09:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqxf-0008Sd-Bp
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:09:09 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqxd-0005wv-K1
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:09:06 -0500
Received: by mail-wr1-x433.google.com with SMTP id bn26so7956995wrb.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 04:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S4cud4ppXnyk17bEaq5VSmXBPwLOn0gth9utfOZrsBY=;
 b=xxwLSGC2YA4J38rQJxkaIr3adjQI6/fwtFk5BcvV+CdInzBLHgXP1LlQyaZ2izu+tt
 GmaSIRAvIYgmX5+Ez79jXoDL62qe43n5ynDj3Zlmfc72rEKyMkBiajXd4Ab0Qadqrnsm
 nLt2wG0R8zvY8uhIwZQpK/hF6pP9ZA521qSqbZvwfsHAiK3Cvqev1ngQSECnlf7f50tE
 fgOSueXyY/LWBBup/Izy/SwEm77BEZEEdHDxVAYUM/lFkwof/l0MDlmy108Wf4dt4pWB
 wiOG8iEYoqRXMeKlLFNdt+Ph5zKYe/7awBYAtoCIhQFKH7v/31KkcWTVF74XGzjX7SWw
 pI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S4cud4ppXnyk17bEaq5VSmXBPwLOn0gth9utfOZrsBY=;
 b=Ih6pox/iepC//gCIGWrjoehIRlCzuIHn6vA2Ve0ah7G6/a767aAVfTibK3XRbBlhql
 orvyxcMqIPSQp+NnEkMK+u7GR2HcyhQdBBWsUC/O4YH9sb1LJsZUClRLGwcd9bpttdM1
 6zdH3zEAkbhmQ9OfHM9rzvO+cYVnhG0qyDxWbdnS0pdKPoty/Uxk3wfUn+0/mje51V+6
 AKpI+aEHnM4ttatoOAb5ncn2e3bP1LUB+Avnxyb6l3R6Z1UqC64nMlM+e90CIw6LguLt
 i+5iUw7If6WdXirBKxUaHEHaJyWMRXqWZuRegNxncJ9jLPaC6ReJtBGX9jWz59qEEwT2
 nVHg==
X-Gm-Message-State: AFqh2kqtszRXTITTsCwQ4rjRwDuZMJnAnDWs2jLzrWOQWEfzBlFEII8e
 req2vCzM3t5IQsHEbJIWxqrhmml6IOxUybHK
X-Google-Smtp-Source: AMrXdXuQRJ6nn2s2/q32kSx5dlZ9UNJPzPy8o5uFASqTJ0AGPz9SdmNh9WPh3m/l6jximMV2lGPBrw==
X-Received: by 2002:a5d:404b:0:b0:288:9c64:e39 with SMTP id
 w11-20020a5d404b000000b002889c640e39mr26678800wrp.66.1673266144061; 
 Mon, 09 Jan 2023 04:09:04 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a5d4ec1000000b002882600e8a0sm8510550wrv.12.2023.01.09.04.09.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 04:09:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2 06/21] hw/loongarch: Use generic DeviceState instead of
 PFlashCFI01
Date: Mon,  9 Jan 2023 13:08:18 +0100
Message-Id: <20230109120833.3330-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109120833.3330-1-philmd@linaro.org>
References: <20230109120833.3330-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

Nothing here requires access to PFlashCFI01 internal fields:
use the inherited generic DeviceState.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/loongarch/virt.c         | 9 ++++-----
 include/hw/loongarch/virt.h | 3 +--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 66be925068..0655e48c42 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -45,7 +45,7 @@
 #include "sysemu/block-backend.h"
 #include "hw/block/flash.h"
 
-static void virt_flash_create(LoongArchMachineState *lams)
+static DeviceState *virt_flash_create(LoongArchMachineState *lams)
 {
     DeviceState *dev = qdev_new(TYPE_PFLASH_CFI01);
 
@@ -62,14 +62,13 @@ static void virt_flash_create(LoongArchMachineState *lams)
     object_property_add_alias(OBJECT(lams), "pflash",
                               OBJECT(dev), "drive");
 
-    lams->flash = PFLASH_CFI01(dev);
+    return dev;
 }
 
 static void virt_flash_map(LoongArchMachineState *lams,
                            MemoryRegion *sysmem)
 {
-    PFlashCFI01 *flash = lams->flash;
-    DeviceState *dev = DEVICE(flash);
+    DeviceState *dev = lams->flash;
     hwaddr base = VIRT_FLASH_BASE;
     hwaddr size = VIRT_FLASH_SIZE;
 
@@ -904,7 +903,7 @@ static void loongarch_machine_initfn(Object *obj)
     lams->acpi = ON_OFF_AUTO_AUTO;
     lams->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     lams->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
-    virt_flash_create(lams);
+    lams->flash = virt_flash_create(lams);
 }
 
 static bool memhp_type_supported(DeviceState *dev)
diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index f5f818894e..519b25c722 100644
--- a/include/hw/loongarch/virt.h
+++ b/include/hw/loongarch/virt.h
@@ -12,7 +12,6 @@
 #include "hw/boards.h"
 #include "qemu/queue.h"
 #include "hw/intc/loongarch_ipi.h"
-#include "hw/block/flash.h"
 
 #define LOONGARCH_MAX_VCPUS     4
 
@@ -52,7 +51,7 @@ struct LoongArchMachineState {
     int          fdt_size;
     DeviceState *platform_bus_dev;
     PCIBus       *pci_bus;
-    PFlashCFI01  *flash;
+    DeviceState  *flash;
 };
 
 #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("virt")
-- 
2.38.1


