Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D08544D4651
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:54:02 +0100 (CET)
Received: from localhost ([::1]:59168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHMn-0002uD-US
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:54:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSH0u-0002Y2-9p
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:31:25 -0500
Received: from [2607:f8b0:4864:20::533] (port=42570
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSH0s-0008U2-Hs
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:31:23 -0500
Received: by mail-pg1-x533.google.com with SMTP id o8so4487759pgf.9
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k4ozRW6iziM8OJ2TKPPCOH7wy/AQ7zg7VeU+iBKaQYA=;
 b=j4lwk9V1TdTmTDoAFxfTNgp6AGeLFbXKuUZn5R82+4y+UIvpqL8WKEhFQIFWVF2a3v
 z281tf0lirswi4TUjXIuaIcRbFAGMzAFZBfIz216ffOtl9GfLFkgRWqpEupCapbWtPWZ
 +hWZQN95ZDYQQO0jG6/Cc7p3RaGt0G7887ylQxiKIQg9zFCrLrv0NvDh0D56/CPo/tYO
 jPORA0m5XmtK7a/FRLSoFssWQ0eEvJEwWlycIMbYbkbG/Bk40VloOpHjvPnVo8xYBt1n
 edIo4xlUxPOc8OLZs7c9506TWnFn5vEIFYAqB7uCK5j/vPrMmZ+VZjWTulBqQ0jm5LCj
 1xqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k4ozRW6iziM8OJ2TKPPCOH7wy/AQ7zg7VeU+iBKaQYA=;
 b=WbW9u729+EoNojWIYx+e57D7sSR1/tWGayxr0bPEGLR2RKfKaAaVSdHtReMF4aCAKI
 7NX8HHCicHV+0vhjC+uLQ4oKuPGopzUo+3bJuxgiNLGes034crPZKxOA7T0p8VaRTP+9
 2dJpEDxFx26sS1fELPB9vckf0DGkureqR1PO/tRAUVDSo6K/yScVetsCWnuTzdBf/Pcs
 UwtV+jGEh13QM7r+STnVMQs/zubIYr63m7hyL4XHUHdjn/DRaVGjJhO+E/TGb+87hyP4
 v+oc2AJ48CNSxOwropL34LL3z1nqT/edfP/IHz4OTLVlGf4jmAmHnPaGWemOo0c2Vws4
 LddA==
X-Gm-Message-State: AOAM530CIBGtNT+8iUbJ3H0vJg61NS/OjXAo5Ql5dTfZZeBTlN2yqM9G
 Hlxp7IP5vrTDf1FxesB5ocO6RAJx2sbiBw==
X-Google-Smtp-Source: ABdhPJxL2RAZxl70B5/iDO4JeTn9MTW52OvI7IOl1Szq9bLJ5VC54FSzvvlrNrveWLmer9VnKSAXhA==
X-Received: by 2002:a62:30c4:0:b0:4f7:2b29:984 with SMTP id
 w187-20020a6230c4000000b004f72b290984mr4597010pfw.11.1646911881286; 
 Thu, 10 Mar 2022 03:31:21 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 e14-20020a056a001a8e00b004f75cf1ab6csm6011246pfv.206.2022.03.10.03.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:31:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 47/48] hw/nios2: Move memory regions into Nios2Machine
Date: Thu, 10 Mar 2022 03:27:24 -0800
Message-Id: <20220310112725.570053-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert to contiguous allocation, as much as possible so far.
The two timer objects are not exposed for subobject allocation.

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/nios2/10m50_devboard.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/hw/nios2/10m50_devboard.c b/hw/nios2/10m50_devboard.c
index bdc3ffd50d..dda4ab2bf5 100644
--- a/hw/nios2/10m50_devboard.c
+++ b/hw/nios2/10m50_devboard.c
@@ -38,6 +38,11 @@
 
 struct Nios2MachineState {
     MachineState parent_obj;
+
+    MemoryRegion phys_tcm;
+    MemoryRegion phys_tcm_alias;
+    MemoryRegion phys_ram;
+    MemoryRegion phys_ram_alias;
 };
 
 #define TYPE_NIOS2_MACHINE  MACHINE_TYPE_NAME("10m50-ghrd")
@@ -47,13 +52,10 @@ OBJECT_DECLARE_TYPE(Nios2MachineState, MachineClass, NIOS2_MACHINE)
 
 static void nios2_10m50_ghrd_init(MachineState *machine)
 {
+    Nios2MachineState *nms = NIOS2_MACHINE(machine);
     Nios2CPU *cpu;
     DeviceState *dev;
     MemoryRegion *address_space_mem = get_system_memory();
-    MemoryRegion *phys_tcm = g_new(MemoryRegion, 1);
-    MemoryRegion *phys_tcm_alias = g_new(MemoryRegion, 1);
-    MemoryRegion *phys_ram = g_new(MemoryRegion, 1);
-    MemoryRegion *phys_ram_alias = g_new(MemoryRegion, 1);
     ram_addr_t tcm_base = 0x0;
     ram_addr_t tcm_size = 0x1000;    /* 1 kiB, but QEMU limit is 4 kiB */
     ram_addr_t ram_base = 0x08000000;
@@ -62,22 +64,22 @@ static void nios2_10m50_ghrd_init(MachineState *machine)
     int i;
 
     /* Physical TCM (tb_ram_1k) with alias at 0xc0000000 */
-    memory_region_init_ram(phys_tcm, NULL, "nios2.tcm", tcm_size,
+    memory_region_init_ram(&nms->phys_tcm, NULL, "nios2.tcm", tcm_size,
                            &error_abort);
-    memory_region_init_alias(phys_tcm_alias, NULL, "nios2.tcm.alias",
-                             phys_tcm, 0, tcm_size);
-    memory_region_add_subregion(address_space_mem, tcm_base, phys_tcm);
+    memory_region_init_alias(&nms->phys_tcm_alias, NULL, "nios2.tcm.alias",
+                             &nms->phys_tcm, 0, tcm_size);
+    memory_region_add_subregion(address_space_mem, tcm_base, &nms->phys_tcm);
     memory_region_add_subregion(address_space_mem, 0xc0000000 + tcm_base,
-                                phys_tcm_alias);
+                                &nms->phys_tcm_alias);
 
     /* Physical DRAM with alias at 0xc0000000 */
-    memory_region_init_ram(phys_ram, NULL, "nios2.ram", ram_size,
+    memory_region_init_ram(&nms->phys_ram, NULL, "nios2.ram", ram_size,
                            &error_abort);
-    memory_region_init_alias(phys_ram_alias, NULL, "nios2.ram.alias",
-                             phys_ram, 0, ram_size);
-    memory_region_add_subregion(address_space_mem, ram_base, phys_ram);
+    memory_region_init_alias(&nms->phys_ram_alias, NULL, "nios2.ram.alias",
+                             &nms->phys_ram, 0, ram_size);
+    memory_region_add_subregion(address_space_mem, ram_base, &nms->phys_ram);
     memory_region_add_subregion(address_space_mem, 0xc0000000 + ram_base,
-                                phys_ram_alias);
+                                &nms->phys_ram_alias);
 
     /* Create CPU -- FIXME */
     cpu = NIOS2_CPU(cpu_create(TYPE_NIOS2_CPU));
-- 
2.25.1


