Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5A94D114D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:49:50 +0100 (CET)
Received: from localhost ([::1]:59668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUbN-0006vU-JO
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:49:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU9W-0005uH-Q1
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:21:02 -0500
Received: from [2607:f8b0:4864:20::1034] (port=51713
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU9V-0006Xg-8z
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:21:02 -0500
Received: by mail-pj1-x1034.google.com with SMTP id cx5so16375373pjb.1
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DMNogBo/Kmk7IgcnHHoL3FUufdrXvnJqRT/umHXihDs=;
 b=HWatyJz204oF44MoMKtm7Ufic6IHXHs2KzYu9Wxc3Krxk5KVzAsd6aVlUzhtmGSdip
 og8wcV06YdUJIu26t7Kvv9Viks2hSio3UewOQUc9N0cIkOTdKkwjZ8h1xRgoiq/s/38z
 syiJoWdxqm0GliWQvHvL3S1Mg8Y2q4krIUUP185t+6T5wCQYew4ilDB7d0IsKM+XlBxW
 OJQpwRmkIR+Oln57as6Zu+8gwYsx4w8K6Q0J2YlwEEtA0GV1NCvTHtHhrEB/RzBEj4Y0
 z3NHbiOZsoPHUvMQVcBxzSTw+g15M/mnKycpLOzr2JdSC68yr45+8hcdY6LfQ2fPxGfx
 kCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DMNogBo/Kmk7IgcnHHoL3FUufdrXvnJqRT/umHXihDs=;
 b=ULJG11s/fSBAZErbFFdvk8jJaKg06IkzONXT3xXvMLqhbVV60orkm1Zd979uH6cudl
 AfBCcyBsW2XSvmveCeCqX1cnP0MO5/kufm7bN6g27g2KUmDemVaGvBa1jlrQ7asNJZaZ
 vQwK7LeAApKFgN0eIyiHrbCt6AvVF3XhxcB/PIESRlKa53RPWWr8ul5iWrcBoBnQFaag
 dwIcLJwRS16MzIPWkC5T0lBBM7Ipmd5ereVmmr5H32vBSaEt0z72ecxoGcv2fkig1U+4
 BaBdFWOvS8MorkGzK0udON7tNZuNK3ydnbPGqDE+nNe6oNP9V8pqi8lg+lXN95HSITcQ
 QL9g==
X-Gm-Message-State: AOAM533aAbfSCK2QA9MBclx0m9VkzaDq0TY/mRKaswBe+RpFWcwrvw5U
 aQS2uvX0tkwJ0eXYXySoTvc76scwkYZT0A==
X-Google-Smtp-Source: ABdhPJykXn+KzEP/qwhM9T81rVhv6bOiWLkq1CryfXwxwJvUleAoRQD3cYGXsgAHdIBnK9oFGlaLuA==
X-Received: by 2002:a17:902:d4c5:b0:151:e69d:89fa with SMTP id
 o5-20020a170902d4c500b00151e69d89famr9726638plg.139.1646724060013; 
 Mon, 07 Mar 2022 23:21:00 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm13790899pfp.90.2022.03.07.23.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:20:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 32/33] hw/nios2: Move memory regions into Nios2Machine
Date: Mon,  7 Mar 2022 21:20:04 -1000
Message-Id: <20220308072005.307955-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308072005.307955-1-richard.henderson@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert to contiguous allocation, as much as possible so far.
The two timer objects are not exposed for subobject allocation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/nios2/10m50_devboard.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/hw/nios2/10m50_devboard.c b/hw/nios2/10m50_devboard.c
index f245e0baa8..f4931b8a67 100644
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
@@ -51,10 +56,6 @@ static void nios2_10m50_ghrd_init(MachineState *machine)
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
@@ -63,22 +64,22 @@ static void nios2_10m50_ghrd_init(MachineState *machine)
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


