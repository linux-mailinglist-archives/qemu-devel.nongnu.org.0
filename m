Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0929C50BF15
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:54:34 +0200 (CEST)
Received: from localhost ([::1]:42320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxUH-0007qb-5e
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwbG-0000r7-7u
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:42 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:35730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwbD-000853-Dj
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:41 -0400
Received: by mail-il1-x12d.google.com with SMTP id e1so5430179ile.2
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zhY6IsLbZViijjLfLFhbBpoo7RTXZotmcRSvMZEYx1c=;
 b=NKcDwOEr2i1tlg3h4XZFkT1Y5EInQjldUZk2NrXRQMzxCkbGY/UUNIsMk0FUedxXEN
 flb9/I4i9oyb4F/R1iBiplvr5geCI9dA4fj5ZMf3BvsLReg0DIW4eucxonNMAlNBF3r1
 0P/fZh1AxmaA7JIAw9msgvvE+tMhCfSPDMrjVB3iRYIzaGkw6cxUhZ6oMWKQN35xUT8W
 B2d+M228ERFiCG0LtZNNUmEb29SzOg8iVBm5PkfMCsR05OR56mMcUEXGC2uAFii+Hpqa
 CvwBsHjjGns/84eifWL2r9PeTEO5rU19GfMtxOzIjLxLL9BUZSYitlToI5b2qjLgYSZd
 ExsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zhY6IsLbZViijjLfLFhbBpoo7RTXZotmcRSvMZEYx1c=;
 b=oAnfFOeyXTzBqUIjimLKFY2HvqVSg6nx0f6LGguvIDIMUjz4RtuVgvD9KPsUyP2njR
 fGrnCa9uIfkCFiKYHxI6X63dX+2KTs+pbs8s/36u9zjGqQ1cGZXk4rUvdaVO5C1kktrr
 riLD48n3jY+zrwwetaSIoQuqy/Jb3MTpFynbD2W2PIolXScjAERadS96oyyhVed28Gdm
 J2s9jhSltGIlh+rzMtd9r+253UNkMe1n+XfzwbcwxQyADU2qXLJiJ1IjVoXardVgjhpt
 bZ+mPpZHiHcGuWviT+HFXVuGG4g1rFtRcrQT0a49E21cDCqhinsLwgH1rtl1Zm8qzI2m
 FKcQ==
X-Gm-Message-State: AOAM533DvD7bBel5tHFEi+aeglxCIgsxq/c9uvYUgKmKFugRqLgmAHL0
 mvyCNBhlzAasG+kVaAreYtyG8bvBZIXuA2Ji
X-Google-Smtp-Source: ABdhPJxduo9s5JE2iHnDQGWAVo0+rxDpBe6+Y/mEn/rztu805rS31v4EckPMEIEI4NHnxJewfzdi5w==
X-Received: by 2002:a05:6e02:1c48:b0:2cc:1ee7:98e8 with SMTP id
 d8-20020a056e021c4800b002cc1ee798e8mr2279499ilg.52.1650646658312; 
 Fri, 22 Apr 2022 09:57:38 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a6b8b17000000b00649a2634725sm816380iod.17.2022.04.22.09.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:57:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 65/68] hw/nios2: Move memory regions into Nios2Machine
Date: Fri, 22 Apr 2022 09:52:35 -0700
Message-Id: <20220422165238.1971496-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12d.google.com
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
Message-Id: <20220421151735.31996-62-richard.henderson@linaro.org>
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


