Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C39CA31E43D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 03:15:34 +0100 (CET)
Received: from localhost ([::1]:34896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCYqr-0003FN-Ry
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 21:15:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6763bdb70=alistair.francis@wdc.com>)
 id 1lCYci-0007Dc-0s
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 21:00:56 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:40590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6763bdb70=alistair.francis@wdc.com>)
 id 1lCYcg-0008KW-Ar
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 21:00:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1613613655; x=1645149655;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mtSembfhG/capK6ZcbDvP3BY8g5NzPUihQLfovnwlLc=;
 b=eq74QzpXfJRZ7VJeNeby/IG2GgpaIZrM97B4LYt2ESZhD1X1QX0lbKLg
 mqWCN1zEuuGXLILtGODz3UG+zOoMgRAyGMHQqJU4ac6vR0xIqaY+a0dbs
 BYU5QRdD+Jszbv9bbf+qSVIGioYIchAV566o0F2Evm2iNp9BjABVHrqsg
 PaX4PF2aGnBwM94kUQpZMSqEuSSu8h+2hNFbxDAmmX6IAh9lnteL3pKOX
 e3PhieAUNWN2vEH/S7scm3RQ4WIzwwIKr91ixNOrhLnAJ/lQGW97CkoyI
 s27hIFpMlfMpYZ402DSqbIO5UYmY2PE436r8oSs5px4WezhH6ifk4bHeg g==;
IronPort-SDR: z9g1NoHABgEVdQGcwAU+3jSw7izPRhxpUopCWEZNAJ656P6f0XB46RsjkUO90VufXIPVVTmAac
 6atHFsyvrIE28EMdHSfAuassJpRrgQTkQVtJHyUIpVccrYiaHUrqSeZp53lVIO8ywY8e7GnV0q
 nDJBKgzfeAftda/8cMIg2Rnwi22RBUw4o++OdIADZvZb0/vucImhtjTPyzEiujEDEU4ljrkxeL
 C2pRpvP8cn6mukaZuMxdLVucSOncgL1aympM1KcCXJfZuhPSBEseR5aBHPGddlApr4lzSri4I6
 q2o=
X-IronPort-AV: E=Sophos;i="5.81,185,1610380800"; d="scan'208";a="161392149"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Feb 2021 10:00:02 +0800
IronPort-SDR: l2ypGekaZHu3fCJv0nbPM/srAg9kvS6dD7sPbLpTDn67OLsfG1Jd2lzotj6hsobAlsmdxSohF5
 juP3LBqO9x4Wh/2mGYNE8TuUOozPXrf2saT5U87Iw05e4rCcP47cDgwuMERz+6rTzR6ZZJg4/P
 xOuu4MqbLKJOhzlP6vtoNPp/IZdODjcskGvBv+zL6ti/+L6/300KzdBji+GKB0dkkSobDnUYUV
 uuEQquuQPhXtxFeSSJPRd3ggn9F4IpG3638inHmt0PbbF2jjN1Ev0VWdLG5XFKDSXDfB2AWATr
 GJUQHOsmVvNGhubJ5snKPkps
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 17:43:31 -0800
IronPort-SDR: W3ptCJpp+ihupaUJfl9MzAe4SdFKn7+GSIwcQ0vqkl7MZ3QJhphFVMLCf+rL5DQTolVLZ79xqi
 48KmWLPfXMmiwZABHjCR3dQCjz+xkfgTsb6TLVqjRFr5GdTEH5qrCp/LXyHxx2pFiu/9mFHCX4
 RR2CrgwigHAY45NGyo8WEZtMIkchAldRjWhl3lc437svVNIOGVbEzYzh0QfJJU2VvIyGjskt8t
 e0gLZ5tgo/W4aja+8NF22ZP2u2exeFv5SokrGi5Dd08qGWjZ9GdgMZXuNXAv8YtOmQPHzDAb9H
 7R0=
WDCIronportException: Internal
Received: from cn57xfd72.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.43])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Feb 2021 18:00:01 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 18/19] hw/riscv: virt: Limit RAM size in a 32-bit system
Date: Wed, 17 Feb 2021 17:59:33 -0800
Message-Id: <20210218015934.1623959-19-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210218015934.1623959-1-alistair.francis@wdc.com>
References: <20210218015934.1623959-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=6763bdb70=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

RV32 supports 34-bit physical address hence the maximum RAM size
should be limitted. Limit the RAM size to 10 GiB, which leaves
some room for PCIe high mmio space.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210122122958.12311-4-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 1d05bb3ef9..4f44509360 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -590,6 +590,19 @@ static void virt_machine_init(MachineState *machine)
         }
     }
 
+    /* limit RAM size in a 32-bit system */
+    if (riscv_is_32bit(&s->soc[0])) {
+        /*
+         * Cast machine->ram_size to 64-bit for 32-bit host,
+         * to make the build on 32-bit host happy.
+         */
+        if ((uint64_t)(machine->ram_size) > 10 * GiB) {
+            /* 32-bit host won't have a chance to execute here */
+            machine->ram_size = 10 * GiB;
+            error_report("Limitting RAM size to 10 GiB");
+        }
+    }
+
     /* register system main memory (actual RAM) */
     memory_region_init_ram(main_mem, NULL, "riscv_virt_board.ram",
                            machine->ram_size, &error_fatal);
-- 
2.30.0


