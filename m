Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B1E62699B
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 14:36:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otqf9-0005ke-Qs; Sat, 12 Nov 2022 08:35:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1otqet-0005jK-LV; Sat, 12 Nov 2022 08:34:57 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1otqer-000200-1w; Sat, 12 Nov 2022 08:34:54 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 63AADB80011;
 Sat, 12 Nov 2022 13:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A11A9C433C1;
 Sat, 12 Nov 2022 13:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668260089;
 bh=ucZIK505ZtDyzzz0K328UJVnxDQxGSgcDAVeyDd2RLE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BbKp0hLUzfb6Dqfka2cbrCZhbYg/kAvrC5pNquP6GsU7WWxUK1XBhCtLH9sFQcNBy
 7JR9NNogVFyP6Sg9ugyMnc4gZTGT8iTTUkWqsMG8c1OYhd7QMPSS8wizpItUJnfCQB
 oHktHOdmt1aqxWLNq8AjC6Nr54nMkfr7ex7EIMZqQ9HlbABxrb9cf1NrpijQDQpK7O
 LRXn9oPwcy/jw7DCbsHSsou0nruyS5V98LvFINBp/I03N/qpx2fHKkwyAvUzlY1E+y
 4F2FEnQExbYJ1CqzxdLYELycu8L3k3LerApwBDZ5L0VWEF+p0epolfZjK1gb6vFjPh
 VmiByHgjCmIZw==
From: Conor Dooley <conor@kernel.org>
To: Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/3] hw/misc/pfsoc: add fabric clocks to ioscb
Date: Sat, 12 Nov 2022 13:34:13 +0000
Message-Id: <20221112133414.262448-2-conor@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221112133414.262448-1-conor@kernel.org>
References: <20221112133414.262448-1-conor@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=conor@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

From: Conor Dooley <conor.dooley@microchip.com>

On PolarFire SoC, some peripherals (eg the PCI root port) are clocked by
"Clock Conditioning Circuitry" in the FPGA. The specific clock depends
on the FPGA bitstream & can be locked to one particular {D,P}LL - in the
Icicle Kit Reference Design v2022.09 or later this is/will be the case.

Linux v6.1+ will have a driver for this peripheral and devicetrees that
previously relied on "fixed-frequency" clock nodes have been switched
over to clock-controller nodes. The IOSCB region is represented in QEMU,
but the specific region of it that the CCCs occupy has not so v6.1-rcN
kernels fail to boot in QEMU.

Add the regions as unimplemented so that the status-quo in terms of boot
is maintained.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 hw/misc/mchp_pfsoc_ioscb.c         | 6 ++++++
 include/hw/misc/mchp_pfsoc_ioscb.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/hw/misc/mchp_pfsoc_ioscb.c b/hw/misc/mchp_pfsoc_ioscb.c
index f4fd55a0e5..f976e42f72 100644
--- a/hw/misc/mchp_pfsoc_ioscb.c
+++ b/hw/misc/mchp_pfsoc_ioscb.c
@@ -33,6 +33,7 @@
  */
 #define IOSCB_WHOLE_REG_SIZE        0x10000000
 #define IOSCB_SUBMOD_REG_SIZE       0x1000
+#define IOSCB_CCC_REG_SIZE          0x2000000
 
 /*
  * There are many sub-modules in the IOSCB module.
@@ -45,6 +46,7 @@
 #define IOSCB_LANE23_BASE           0x06510000
 #define IOSCB_CTRL_BASE             0x07020000
 #define IOSCB_CFG_BASE              0x07080000
+#define IOSCB_CCC_BASE              0x08000000
 #define IOSCB_PLL_MSS_BASE          0x0E001000
 #define IOSCB_CFM_MSS_BASE          0x0E002000
 #define IOSCB_PLL_DDR_BASE          0x0E010000
@@ -168,6 +170,10 @@ static void mchp_pfsoc_ioscb_realize(DeviceState *dev, Error **errp)
                           "mchp.pfsoc.ioscb.cfg", IOSCB_SUBMOD_REG_SIZE);
     memory_region_add_subregion(&s->container, IOSCB_CFG_BASE, &s->cfg);
 
+    memory_region_init_io(&s->ccc, OBJECT(s), &mchp_pfsoc_dummy_ops, s,
+                          "mchp.pfsoc.ioscb.ccc", IOSCB_CCC_REG_SIZE);
+    memory_region_add_subregion(&s->container, IOSCB_CCC_BASE, &s->ccc);
+
     memory_region_init_io(&s->pll_mss, OBJECT(s), &mchp_pfsoc_pll_ops, s,
                           "mchp.pfsoc.ioscb.pll_mss", IOSCB_SUBMOD_REG_SIZE);
     memory_region_add_subregion(&s->container, IOSCB_PLL_MSS_BASE, &s->pll_mss);
diff --git a/include/hw/misc/mchp_pfsoc_ioscb.h b/include/hw/misc/mchp_pfsoc_ioscb.h
index 9235523e33..687b213742 100644
--- a/include/hw/misc/mchp_pfsoc_ioscb.h
+++ b/include/hw/misc/mchp_pfsoc_ioscb.h
@@ -30,6 +30,7 @@ typedef struct MchpPfSoCIoscbState {
     MemoryRegion lane23;
     MemoryRegion ctrl;
     MemoryRegion cfg;
+    MemoryRegion ccc;
     MemoryRegion pll_mss;
     MemoryRegion cfm_mss;
     MemoryRegion pll_ddr;
-- 
2.37.2


