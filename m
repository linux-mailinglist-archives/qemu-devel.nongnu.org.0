Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9772AD948
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 15:51:34 +0100 (CET)
Received: from localhost ([::1]:53516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcUzd-0008RN-Fy
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 09:51:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vitaly.wool@konsulko.com>)
 id 1kcTQZ-0002r8-Q7
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 08:11:17 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:34010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vitaly.wool@konsulko.com>)
 id 1kcTQX-0003pA-Mp
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 08:11:15 -0500
Received: by mail-wr1-x444.google.com with SMTP id r17so8692510wrw.1
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 05:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kV4V4rqDZ/SmR+lPDCg7xvRUAHH605C5i6IqmHbKvvc=;
 b=moEBkomBD9/2o3jlLrE9M5E1tyGmcIdMgvueRfiFXr4PESrOxkW1C0HPkLn0Q1qjMk
 hCsZohvGfuV+Q9aDRJUBvoaLIxgnDpMQ8Ar/mqTVGRcU9mYtm1CEgotv+stHljJTQkmH
 +0iW2vyB/P7+2TfQCq0N4Oq2nTc24boOXZ490=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kV4V4rqDZ/SmR+lPDCg7xvRUAHH605C5i6IqmHbKvvc=;
 b=MYcrGD5O5gWelh+mUYI1FmTh3SRqUkWpDkWTXKuxojCXIbVLyqY1zRSITKHSs5MDvf
 KwLNrb+MySfLPx3DZY3/GQsdZbG3uyIVDnu4YxQfREEM2HMf9gSYnXvPyPr1pw8fPZVR
 tzSL0lpE3w+WvvKUwjGDqE2RLKWOhfskgriAALsjVT3LzNE8EPJIcWG4ItnYosmHqRsL
 6hJRfTTCZAE/qq9bhda0FEiz7F3XQcAOKRBSgZ8OGMKGM9rBiE+jgIoVx1z+5v8ARjB3
 R4US2bFlnW8MMUJkRj2Yeu1OGORFN0NZ11S9woEvx1K2txew2ZOH8gPmZnI3Q9Tkx2Pv
 799g==
X-Gm-Message-State: AOAM5303yhsaM/eS/4babAWgm8awMhAAG0gaVVoPeVE8qpABWAtPLXyu
 7WS7YnzrWwo8Gt66Eew9vXX32m8dqcVep6QT
X-Google-Smtp-Source: ABdhPJw2i+aHsNfb6M7KcHqu7IJBquB9c8mZbVSa9EeIDyt9Js+9fu0seTyNCk8piFbMTCY+DmQurQ==
X-Received: by 2002:adf:f88c:: with SMTP id u12mr15367745wrp.209.1605013869948; 
 Tue, 10 Nov 2020 05:11:09 -0800 (PST)
Received: from lootbox.konsulko.bg (lan.nucleusys.com. [92.247.61.126])
 by smtp.gmail.com with ESMTPSA id w186sm2923850wmb.26.2020.11.10.05.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 05:11:09 -0800 (PST)
From: Vitaly Wool <vitaly.wool@konsulko.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Microchip: add QSPI NOR flash
Date: Tue, 10 Nov 2020 15:10:46 +0200
Message-Id: <20201110131046.28426-1-vitaly.wool@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=vitaly.wool@konsulko.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 10 Nov 2020 09:47:15 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Vitaly Wool <vitaly.wool@konsulko.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add QSPI NOR flash definition for Microchip PolarFire SoC.

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
---
 hw/riscv/microchip_pfsoc.c         | 21 +++++++++++++++++++++
 include/hw/riscv/microchip_pfsoc.h |  3 +++
 2 files changed, 24 insertions(+)

diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 4627179cd3..d1f4a1fe6f 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -90,6 +90,8 @@ static const struct MemmapEntry {
     [MICROCHIP_PFSOC_MMUART2] =         { 0x20102000,     0x1000 },
     [MICROCHIP_PFSOC_MMUART3] =         { 0x20104000,     0x1000 },
     [MICROCHIP_PFSOC_MMUART4] =         { 0x20106000,     0x1000 },
+    [MICROCHIP_PFSOC_SPI0] =            { 0x20108000,     0x1000 },
+    [MICROCHIP_PFSOC_SPI1] =            { 0x20109000,     0x1000 },
     [MICROCHIP_PFSOC_GEM0] =            { 0x20110000,     0x2000 },
     [MICROCHIP_PFSOC_GEM1] =            { 0x20112000,     0x2000 },
     [MICROCHIP_PFSOC_GPIO0] =           { 0x20120000,     0x1000 },
@@ -97,6 +99,7 @@ static const struct MemmapEntry {
     [MICROCHIP_PFSOC_GPIO2] =           { 0x20122000,     0x1000 },
     [MICROCHIP_PFSOC_ENVM_CFG] =        { 0x20200000,     0x1000 },
     [MICROCHIP_PFSOC_ENVM_DATA] =       { 0x20220000,    0x20000 },
+    [MICROCHIP_PFSOC_QSPI_XIP] =        { 0x21000000,  0x1000000 },
     [MICROCHIP_PFSOC_IOSCB_CFG] =       { 0x37080000,     0x1000 },
     [MICROCHIP_PFSOC_DRAM] =            { 0x80000000,        0x0 },
 };
@@ -147,6 +150,7 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
     MemoryRegion *e51_dtim_mem = g_new(MemoryRegion, 1);
     MemoryRegion *l2lim_mem = g_new(MemoryRegion, 1);
     MemoryRegion *envm_data = g_new(MemoryRegion, 1);
+    MemoryRegion *xip_mem = g_new(MemoryRegion, 1);
     char *plic_hart_config;
     size_t plic_hart_config_len;
     NICInfo *nd;
@@ -302,6 +306,15 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
         qdev_set_nic_properties(DEVICE(&s->gem1), nd);
     }
 
+    /* SPI */
+    create_unimplemented_device("microchip.pfsoc.spi0",
+        memmap[MICROCHIP_PFSOC_SPI0].base,
+        memmap[MICROCHIP_PFSOC_SPI0].size);
+
+    create_unimplemented_device("microchip.pfsoc.spi1",
+        memmap[MICROCHIP_PFSOC_SPI1].base,
+        memmap[MICROCHIP_PFSOC_SPI1].size);
+
     object_property_set_int(OBJECT(&s->gem0), "revision", GEM_REVISION, errp);
     object_property_set_int(OBJECT(&s->gem0), "phy-addr", 8, errp);
     sysbus_realize(SYS_BUS_DEVICE(&s->gem0), errp);
@@ -337,6 +350,14 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
                                 memmap[MICROCHIP_PFSOC_ENVM_DATA].base,
                                 envm_data);
 
+    /* QSPI Flash */
+    memory_region_init_rom(xip_mem, OBJECT(dev), "microchip.pfsoc.xip",
+                           memmap[MICROCHIP_PFSOC_QSPI_XIP].size,
+                           &error_fatal);
+    memory_region_add_subregion(system_memory,
+                                memmap[MICROCHIP_PFSOC_QSPI_XIP].base,
+                                xip_mem);
+
     /* IOSCBCFG */
     create_unimplemented_device("microchip.pfsoc.ioscb.cfg",
         memmap[MICROCHIP_PFSOC_IOSCB_CFG].base,
diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
index 8bfc7e1a85..28d6f389ec 100644
--- a/include/hw/riscv/microchip_pfsoc.h
+++ b/include/hw/riscv/microchip_pfsoc.h
@@ -87,6 +87,8 @@ enum {
     MICROCHIP_PFSOC_MMUART2,
     MICROCHIP_PFSOC_MMUART3,
     MICROCHIP_PFSOC_MMUART4,
+    MICROCHIP_PFSOC_SPI0,
+    MICROCHIP_PFSOC_SPI1,
     MICROCHIP_PFSOC_GEM0,
     MICROCHIP_PFSOC_GEM1,
     MICROCHIP_PFSOC_GPIO0,
@@ -94,6 +96,7 @@ enum {
     MICROCHIP_PFSOC_GPIO2,
     MICROCHIP_PFSOC_ENVM_CFG,
     MICROCHIP_PFSOC_ENVM_DATA,
+    MICROCHIP_PFSOC_QSPI_XIP,
     MICROCHIP_PFSOC_IOSCB_CFG,
     MICROCHIP_PFSOC_DRAM,
 };
-- 
2.20.1


