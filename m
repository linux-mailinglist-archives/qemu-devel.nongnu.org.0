Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 503962F95A6
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 22:55:44 +0100 (CET)
Received: from localhost ([::1]:43106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1G1P-0007Ov-DC
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 16:55:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=64494dccb=alistair.francis@wdc.com>)
 id 1l1Fzx-0005hB-Nv
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 16:54:13 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:21687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=64494dccb=alistair.francis@wdc.com>)
 id 1l1Fzw-0005UJ-15
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 16:54:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610920452; x=1642456452;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LPHatuc1HExLszmOMM95DV77X3WQJxDJU0s5O2Qiim8=;
 b=Qtuq6C4b5OJRU8pWue7CP7392XfXFkNgXrV2O/rwfauSPsZ37Yaeui+j
 U/gY3i3HtPk6U648aOJVI+4onehjptCZu211ueiu9Ho2xDCh/wdujqtmV
 YO2Us8/2BndYMY1rst1XHXBnS+9oHk+16RcdAfWhGNDYcFo9xgLrxBjcw
 g6ohbOKZdESqTBUDVFP/5mqe0+Kmm4sNqqnJkQ1qLm7YZDUZWx2LUCz70
 TppDW43JrbTmo5H8EdrFFNc6nNhPogJLNWAjq3uVKIer9lU0e/ZUkP6KP
 jOabqnAkPLPn5qsmZhpuvhc08r0WvGJRvL5zgB9PHJUNcdI5TAHLuRxFu A==;
IronPort-SDR: cqP0B+TxGnSGyj731/3maUZCgUQyoD42fwTQIlEdngsYlI48BSrvXSF2YNPZlTebRW4e52MpaH
 gGr4ATwIp2+LI87nWcnr8jqQ8NRDyUGPPeRsSTid1cjlo7jHMTJs44KXCFW9cDOGt08Gs/dkWA
 UfvDsmHbdjCK8ESxvzPl5BV9rllPzxFphQGSBh7ZzQ4kjsrCLHoeBJwSzfoIHq2DLgZJ+mbLkj
 mCW5I0czKlzikp7NEbePE1qDueUmbItMqucd5Cx4pFhbQ6tgyG3xdWCAqaGB8RxpJstFmmXpR4
 4ls=
X-IronPort-AV: E=Sophos;i="5.79,355,1602518400"; d="scan'208";a="157645965"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jan 2021 05:54:06 +0800
IronPort-SDR: JHfC+4pmrL09DwZ2xZftUVrpPCtgLm3X8D/Y7t/PViPjBr500sMMaoCPU5wTZY1RtfuI+dDvjJ
 2Ercj08NYP/iCt+9rFRyzPrJ5eWYS1keLZ3mGtYxGcSXZobSvhLvulAJL6ud6bGTV9uorKExLf
 kYdfxCjvk2njxNN5qFJQP3WIWBjoZze6couYhOUrwm442Yhvy9LfvowCPR0BP9zd/Snx3PJ2mo
 JPmn4mApbToCI2Asl15yFPFeGAU3sBaM2TXm5ooYWWJERPv2K1hhby+FhVq9NZpS0bfZmpgK1n
 BYeBKoQ99b2qdZCdrGyW/WuE
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2021 13:38:45 -0800
IronPort-SDR: zW7bMo7S6XPG1ric94Ag67aoDxrl6GPv0qE8m4u11/CkU2AxErwmo9Ikl+TMDIB3MH5BTYPgO0
 62GjhC966kIqJDps5vh8ftde150JGPszZlLwM07/2jZyOvHqUk7l72MLALs7ePVyxzV8zbeo0k
 xHnfgJ6wDUo70DziVsEpM3EhVqHivqzEFsKHqUhELardi7syzbesoUd3irrgZ+qDnz19n95F4S
 WYQwCTEQ796NlXsDF/5o+Od24eSn+w26nKKiYWNzXqiTj52NQQNDffZEhEo2RsnW/L1wu8F1r+
 lMo=
WDCIronportException: Internal
Received: from 7l95g12.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.251])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Jan 2021 13:54:06 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 04/12] RISC-V: Place DTB at 3GB boundary instead of 4GB
Date: Sun, 17 Jan 2021 13:53:55 -0800
Message-Id: <20210117215403.2277103-5-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210117215403.2277103-1-alistair.francis@wdc.com>
References: <20210117215403.2277103-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=64494dccb=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Atish Patra <atish.patra@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Atish Patra <atish.patra@wdc.com>

Currently, we place the DTB at 2MB from 4GB or end of DRAM which ever is
lesser. However, Linux kernel can address only 1GB of memory for RV32.
Thus, it can not map anything beyond 3GB (assuming 2GB is the starting address).
As a result, it can not process DT and panic if opensbi dynamic firmware
is used. While at it, place the DTB further away to avoid in memory placement
issues in future.

Fix this by placing the DTB at 16MB from 3GB or end of DRAM whichever is lower.

Fixes: 66b1205bc5ab ("RISC-V: Copy the fdt in dram instead of ROM")

Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Message-id: 20210107091127.3407870-1-atish.patra@wdc.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/boot.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 83586aef41..10a601b4dc 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -194,11 +194,11 @@ uint32_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
     /*
      * We should put fdt as far as possible to avoid kernel/initrd overwriting
      * its content. But it should be addressable by 32 bit system as well.
-     * Thus, put it at an aligned address that less than fdt size from end of
-     * dram or 4GB whichever is lesser.
+     * Thus, put it at an 16MB aligned address that less than fdt size from the
+     * end of dram or 3GB whichever is lesser.
      */
-    temp = MIN(dram_end, 4096 * MiB);
-    fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
+    temp = MIN(dram_end, 3072 * MiB);
+    fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 16 * MiB);
 
     fdt_pack(fdt);
     /* copy in the device tree */
-- 
2.29.2


