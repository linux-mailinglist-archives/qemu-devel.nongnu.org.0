Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D795A86D0
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:35:41 +0200 (CEST)
Received: from localhost ([::1]:55666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTUx-00062u-Dp
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:35:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSp3-0004QM-49; Wed, 31 Aug 2022 14:52:21 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:44006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSp0-00089U-JE; Wed, 31 Aug 2022 14:52:19 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 92-20020a9d0be5000000b0063946111607so10862041oth.10; 
 Wed, 31 Aug 2022 11:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=HH7yYjawwNwarTxu9E0AvdnUoyWYlYh4OWc0LbQzLpg=;
 b=CDI+WcVkdRY/1XjM6uZwpN6AjI6H3R/CvnHGwB71MG2TSTrHVmRxPmvThHkjWnL6MF
 HBCjKee08kbK554nB6si29dzle8KlZ5irIg3H++brzSxYAMuWNTIbtMImocq16pJz5pL
 6eveUmxJ/Mo8izbKv4tdowAkwb7dyudPJ2RUx677hygHdWZxYFxvKClnGpEYD+XzTphS
 8CjscCF6DZZUpruhwk5E5495vzSLF0clRq87rrpl9LQTXSJVnyMsViZIceZJrqbgzpcd
 w7JCz2zW6eyrjyv4CuJmEZnhYogkuEvAUEBsu3yQNxXOASDRUMBYkThuSm0UYl+OFR/v
 TVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=HH7yYjawwNwarTxu9E0AvdnUoyWYlYh4OWc0LbQzLpg=;
 b=FvuUOtzXmC+X2Nt/Z1A+ITlWIOGjPRhDbgDONiQ/A3dzuvlKSeiOxpgvPeQOu2n9Pp
 WrXq9xUBmZl0rhl9r9QICTrPwEQOrizrl/mLPDcZ/lgI7kIwMYm+1bIlVmgiTgUI9m0E
 4NB4MRmP57p3jYcDO5N2jJYA6rK/3Z1HLrdR2FC+XI7wvk0zNHvVXxq3NtOzK4b20s/K
 r5+gNN16oGUEJt76lV0b8gGCToxQ2m/xJGIDdk+gSnBT2PfKmhx+rkt/AHlu22OE8nL6
 /G2vjtyJ4LZo8FXdNmiVgWBhfOeVEq8P8FsXwe8xBYdA86Yqm8Qj0aF9dVuwDrCm6zmx
 J8sg==
X-Gm-Message-State: ACgBeo3kfNwgv2DvhoensBUfaTgxoIdQJ3HOlsFJzBG91R/szgtxnG/P
 9ux+wWTZ4f8yfOcuWOAmH4rWsfeCGgw=
X-Google-Smtp-Source: AA6agR7JJLihR28MTytnDCO/rJIyoChGtjDhRbgi6ax52PqJCS3loRxQBMQ/fvb9oappd4zCc1tRIA==
X-Received: by 2002:a05:6830:2b0e:b0:638:8646:51ee with SMTP id
 l14-20020a0568302b0e00b00638864651eemr10663109otv.31.1661971936220; 
 Wed, 31 Aug 2022 11:52:16 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:52:15 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PULL 33/60] ppc/ppc405: Move SRAM under the ref405ep machine
Date: Wed, 31 Aug 2022 15:50:07 -0300
Message-Id: <20220831185034.23240-34-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

It doesn't belong to the generic machine nor the SoC. Fix a typo in
the name while we are at it.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <20220809153904.485018-5-clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc405_boards.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index f4794ba40c..381f39aa94 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -235,7 +235,6 @@ static void ppc405_init(MachineState *machine)
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     const char *kernel_filename = machine->kernel_filename;
     PowerPCCPU *cpu;
-    MemoryRegion *sram = g_new(MemoryRegion, 1);
     MemoryRegion *ram_memories = g_new(MemoryRegion, 2);
     hwaddr ram_bases[2], ram_sizes[2];
     MemoryRegion *sysmem = get_system_memory();
@@ -260,11 +259,6 @@ static void ppc405_init(MachineState *machine)
     cpu = ppc405ep_init(sysmem, ram_memories, ram_bases, ram_sizes,
                         33333333, &uicdev, kernel_filename == NULL ? 0 : 1);
 
-    /* allocate SRAM */
-    memory_region_init_ram(sram, NULL, "ef405ep.sram", PPC405EP_SRAM_SIZE,
-                           &error_fatal);
-    memory_region_add_subregion(sysmem, PPC405EP_SRAM_BASE, sram);
-
     /* allocate and load BIOS */
     if (machine->firmware) {
         MemoryRegion *bios = g_new(MemoryRegion, 1);
@@ -328,9 +322,15 @@ static void ref405ep_init(MachineState *machine)
 {
     DeviceState *dev;
     SysBusDevice *s;
+    MemoryRegion *sram = g_new(MemoryRegion, 1);
 
     ppc405_init(machine);
 
+    /* allocate SRAM */
+    memory_region_init_ram(sram, NULL, "ref405ep.sram", PPC405EP_SRAM_SIZE,
+                           &error_fatal);
+    memory_region_add_subregion(get_system_memory(), PPC405EP_SRAM_BASE, sram);
+
     /* Register FPGA */
     ref405ep_fpga_init(get_system_memory(), PPC405EP_FPGA_BASE);
     /* Register NVRAM */
-- 
2.37.2


