Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC8C29EE71
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 15:38:14 +0100 (CET)
Received: from localhost ([::1]:58744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kY949-0001QG-Ld
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 10:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=56447669b=alistair.francis@wdc.com>)
 id 1kY8se-0002HR-Ez
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 10:26:20 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:42880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=56447669b=alistair.francis@wdc.com>)
 id 1kY8sc-0005fB-Ci
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 10:26:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1603981578; x=1635517578;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=az4hi+7Qmy3zzRkU/t2y0reaYkYBTtPhn+llQuZih24=;
 b=o6wAd/c5AzAIwTEWdakYZSvLyl5maNRFOJ7ZrvMp1hDE+SHiigGHx0f2
 zzXCY6Q94Ut8VLJ6OgE4cgUFXr/yr6IxEU9kPXbhboLr51Ku/LFDGVQ07
 tpb5eMOqPRBbE+ZceLyzJkmK+8WtSFbVbROAQm6TIoQUoXta/AdBSuWu0
 UjIM3ixFS1jkHntTquBzjfy8k6FUF0uWQJUbPve4DQHgW1N3k7BKLowse
 EphyTqX5utle6AgbbR5ey10urzRO0hCInEQ20UIO5MKtSF7uZplmnxSwv
 3eTs/kIfyie12zj1EAWZr4TChU4bIMnW8HI+FkeU2vMt853EtM7tTX1ph Q==;
IronPort-SDR: VZLxYLfq3n1XlzYzt5x//GdhP7yO7dSLqjlt7/pmtk3obPA4EzmuGhtKPvaxXpmj/mC5O8BdFo
 QCmwcvEnz+/dN1j9t0oRaVGxKRApyshve9RRWdJPVSeAKaVTmzN361dY6OqqDKGXGJozEIvcWb
 QkoJueXXjgbmUJArIJi4puULdZypwiInIT3S8d71Zu/asoCUWPrbOTtcitQbnCTtsYNXwwCTlo
 3AP+1UfiFloneSwZ8nWLHzIIRLd+i7S9n4yzLC7f65TJQvmiJ+MVRAJLIelt0GA+CM5I06ae+F
 ThI=
X-IronPort-AV: E=Sophos;i="5.77,430,1596470400"; d="scan'208";a="151317901"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 29 Oct 2020 22:25:30 +0800
IronPort-SDR: uheujDzYhSNLTg1WDhWsM21zKRrGxoEfZYB5bPB639FtlRQSQ5RJWehi2n6lW+4OrICsV1zplk
 kFHPiOUNwJGKRrWGulXrANY2/89NtGJfcbBdHBL+eE4/Br3jSaK8k4sncmPgvda0lShQN8WSdC
 xvwrlxMaKXQ+qAOaQXJ+cPEJjHaoS6D0caAPO2XAVlCZuIWc3RgaHqtqWUGWaT04Mc2lvGDd7i
 UpkRc4NZ5vUxwsOe984ILz3GZmv5XaGDA8paP4p8At8Qhdfnu9hKGqQnox0LtLnqX17OFbFUeA
 3WXkuLb4JlC2GUEzoWhSV9QU
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 07:11:45 -0700
IronPort-SDR: v/xFBFPApyHGcUEfDu8K3XMM8/NTUxLMmVcwjRIzcadrQyJ4a4Q+HxdpVXkXGLYif7gLDsGSuC
 VVD4bLf1f7lgZ/K9m6p9ahvKGKph0ms5mc1R9FwCzo43CQDED0TYSBHoqbrBeeNQzdJySz9yJ6
 vyYGvuQKazZSRPu2v0yJlgeR31P+p9nVUnSoW6+56d131o73BRyYp8VzS3q65sw0SpoXN9vd0E
 /r+jiHM08wSFFbZRqBC4Ww8hswXJN10L9WCmgm+qtmh6n6P388NQVjzOR96QDDTnFejGPGNNj5
 3yk=
WDCIronportException: Internal
Received: from usa003000.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.60.131])
 by uls-op-cesaip01.wdc.com with ESMTP; 29 Oct 2020 07:25:31 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 16/18] hw/riscv: microchip_pfsoc: Map the reserved memory at
 address 0
Date: Thu, 29 Oct 2020 07:13:56 -0700
Message-Id: <20201029141358.3102636-17-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029141358.3102636-1-alistair.francis@wdc.com>
References: <20201029141358.3102636-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=56447669b=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 10:25:26
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Somehow HSS needs to access address 0 [1] for the DDR calibration data
which is in the chipset's reserved memory. Let's map it.

[1] See the config_copy() calls in various places in ddr_setup() in
    the HSS source codes.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 1603863010-15807-9-git-send-email-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/microchip_pfsoc.h |  1 +
 hw/riscv/microchip_pfsoc.c         | 11 ++++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
index 245c82db61..f34a6b3fd7 100644
--- a/include/hw/riscv/microchip_pfsoc.h
+++ b/include/hw/riscv/microchip_pfsoc.h
@@ -74,6 +74,7 @@ typedef struct MicrochipIcicleKitState {
                  TYPE_MICROCHIP_ICICLE_KIT_MACHINE)
 
 enum {
+    MICROCHIP_PFSOC_RSVD0,
     MICROCHIP_PFSOC_DEBUG,
     MICROCHIP_PFSOC_E51_DTIM,
     MICROCHIP_PFSOC_BUSERR_UNIT0,
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index bc908e07d9..44a84732ac 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -90,7 +90,8 @@ static const struct MemmapEntry {
     hwaddr base;
     hwaddr size;
 } microchip_pfsoc_memmap[] = {
-    [MICROCHIP_PFSOC_DEBUG] =           {        0x0,     0x1000 },
+    [MICROCHIP_PFSOC_RSVD0] =           {        0x0,      0x100 },
+    [MICROCHIP_PFSOC_DEBUG] =           {      0x100,      0xf00 },
     [MICROCHIP_PFSOC_E51_DTIM] =        {  0x1000000,     0x2000 },
     [MICROCHIP_PFSOC_BUSERR_UNIT0] =    {  0x1700000,     0x1000 },
     [MICROCHIP_PFSOC_BUSERR_UNIT1] =    {  0x1701000,     0x1000 },
@@ -176,6 +177,7 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
     MicrochipPFSoCState *s = MICROCHIP_PFSOC(dev);
     const struct MemmapEntry *memmap = microchip_pfsoc_memmap;
     MemoryRegion *system_memory = get_system_memory();
+    MemoryRegion *rsvd0_mem = g_new(MemoryRegion, 1);
     MemoryRegion *e51_dtim_mem = g_new(MemoryRegion, 1);
     MemoryRegion *l2lim_mem = g_new(MemoryRegion, 1);
     MemoryRegion *envm_data = g_new(MemoryRegion, 1);
@@ -195,6 +197,13 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
     qdev_realize(DEVICE(&s->e_cluster), NULL, &error_abort);
     qdev_realize(DEVICE(&s->u_cluster), NULL, &error_abort);
 
+    /* Reserved Memory at address 0 */
+    memory_region_init_ram(rsvd0_mem, NULL, "microchip.pfsoc.rsvd0_mem",
+                           memmap[MICROCHIP_PFSOC_RSVD0].size, &error_fatal);
+    memory_region_add_subregion(system_memory,
+                                memmap[MICROCHIP_PFSOC_RSVD0].base,
+                                rsvd0_mem);
+
     /* E51 DTIM */
     memory_region_init_ram(e51_dtim_mem, NULL, "microchip.pfsoc.e51_dtim_mem",
                            memmap[MICROCHIP_PFSOC_E51_DTIM].size, &error_fatal);
-- 
2.28.0


