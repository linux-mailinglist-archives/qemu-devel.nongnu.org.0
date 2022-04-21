Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E62DA50A504
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:09:10 +0200 (CEST)
Received: from localhost ([::1]:57360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZMf-00039H-UQ
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYdJ-0005nx-6I
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:22:20 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:45040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYdH-0007H3-In
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:22:12 -0400
Received: by mail-io1-xd2e.google.com with SMTP id e194so5608995iof.11
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uXPKs9vHAqlXB8nQgyfaDgoubOKDwBOyrE632ndwYX0=;
 b=eTL9vDS8xUIZsYn1SmVmQmlRh6mXMl08SYuS1562eBbYh6hUL1aZQR2uwudldUE49m
 iZzPVvOtBj99eukStVCxcN5V5R8CVR+Rc5T4wZLgpFKXpTb5djdTRqkH1/Wk7zrlAA/v
 ZffSDwEN8Bh2Ga4ZpRu88k3x2wFO/7AcdkNlvIGcVvJA0jI6M17TkwacUD5vjy2/ws3u
 AbpWbR2YrqNha47LHaNSzoJnTtr4gdrWkBiSzpsESEypEb1RzCYqWKdYnIxdrB3wsYa0
 qxD5VkoqtvUMPZtMg9ediEBtRpIQ0+hRPs2RSc3OcfsTwtkqLFGj0G+QIAYsqQEZk8HQ
 9mNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uXPKs9vHAqlXB8nQgyfaDgoubOKDwBOyrE632ndwYX0=;
 b=QcMZ7Np41HvTWSE9VgAmCQM4lSzXJOQYY8zTkLmXygfp5KqudqiSInSH0WRjForwnr
 hXU1n+X4ngyGjg+IPgNo4juMFSO7CUy3GQoe464sqUjyp3HfFDs645spAHJZgyiOdvCz
 f6AD+n1Z9jstSjw0wvDXU69hVE3AC6iZtscP3aY3dgwVLGidG7+m/iD2qNxK4h6MArm7
 3k79HB7sS5Ci/GUfmIv6Tc8J9Z4YmjbTc4zCA/LUGbVJmgZHfMomR6nbTFnDtoJDoQcN
 FlJqJNRCkAEqqenEv7bZ7sDhTXyk9jIQp0cs2hi5OmsQesWp7EL7Hpn2OC71gUqcNjo1
 Lflw==
X-Gm-Message-State: AOAM530ZK9DCMOgk3kUo2AEVr4ADHAXkJrQLKgiP5TeVirgmHy7S2pYJ
 fGlh6zl6ziExcLn7RngcZKDqaemrsgf7lw==
X-Google-Smtp-Source: ABdhPJy7lh7jNhm0img+ZX+P35yFPBMQ18cluF3k7e/BfggUdURj/QjLYG7oMPRDsxKxY9++CSlD/w==
X-Received: by 2002:a02:271f:0:b0:326:af4:3f0c with SMTP id
 g31-20020a02271f000000b003260af43f0cmr57003jaa.300.1650554529815; 
 Thu, 21 Apr 2022 08:22:09 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a926e01000000b002cc52449a19sm3985402ilc.35.2022.04.21.08.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:22:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 61/64] hw/nios2: Move memory regions into Nios2Machine
Date: Thu, 21 Apr 2022 08:17:32 -0700
Message-Id: <20220421151735.31996-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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
2.34.1


