Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FDB3C99A3
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 09:28:12 +0200 (CEST)
Received: from localhost ([::1]:37522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3vn1-00032F-63
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 03:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8230c157d=alistair.francis@wdc.com>)
 id 1m3vcM-00065E-SG
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 03:17:12 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:27200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8230c157d=alistair.francis@wdc.com>)
 id 1m3vcJ-0003UP-1d
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 03:17:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1626333427; x=1657869427;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W42T9tCGl/VZPfz3tvGyGRPlXKy+CcWqs/dXc2q7Ppo=;
 b=NKPxtVBkkLcGrkuDNPzxVm03dn3DOfqqwccMefgC7xrPHAWsJQr3x7Fu
 zIm+VqQ/OtykrstFTPACBOij1rqdRF8xxc9Iqy31NDo8GtTwtx0uynlpx
 IHSsJB5v56pFKdT3ANxzSEnp8mlW76xIeahHlT9UtFKjHB398nUk3nnFT
 6bqbjXk1yDmfc9W3KG4kv68q1OTgnt33gXPWmOT/98Toa9TnbxeeRBeiE
 QdD+c3SUjoZgiLIsj296SvWkl4nRTEYOwChGOFAnB7UbX3HNO+jr/GSyY
 P6qd/7BBHTCRqSX4gJ/YSp18y1W+tuADhQhbesn4LSVzYkFr71XI/VsvM A==;
IronPort-SDR: t8ZFm/KKVHeTFqs25mecyTKKhmmBbfziUIg9vFFUSvVSemiTFdmRB2uNt6QUalsvgg6OICKiHe
 /5kxv781EOwLllp9PMAQeX8hR3DKncDuYWxF5iL0nh9VFlgQ8AAruA2WOIvdy2Jsu1dhPSw0+A
 CFmKgiqgam9RH3Yq87lXPNHqiz2bX9YMTVRWiauj+26wxteaOhnJ2PIosQdLRvuJEvODyZWX/1
 2VetnCAJz6nG8QzofcKOoZ2TDA/UVrxjmOxgWqbLNYAQbW5vq09xpkg0CYqMn+tiGc/yCbvGKK
 hQg=
X-IronPort-AV: E=Sophos;i="5.84,240,1620662400"; d="scan'208";a="175212311"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jul 2021 15:16:43 +0800
IronPort-SDR: NklwrFWerG3SjhPaW0Tdm9B+5ssc4zWD9JZ+EdDS6PdT3v+LLhe+uQofwiJx87rqKVrWjdr/U0
 MvMZzEFgg3+f4eI1LTgm8aSgYJJWksU30z9LO3TiCy0eJz5RMcC6PLGvXpTpSdyN50Tt2Gu6Ay
 pPXyE3yA2pMvoFWAmszMUCcdGxYlwPqE+cDhYcJzHALn7a4Pw/N5iGCmLFEn66dwx+FzQGBqCO
 BAWT2QJYepFs8eBLERMB0YbojK9Z4fKqlLywELUbdfysNPbTGZghutvUCPeDRV/uJF2v6kGkho
 qwjVasshwVViLn/mBpxtoZLR
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 23:54:46 -0700
IronPort-SDR: jW56WcnafIJqpSvVjxtpIUvERU9SEar+a14wre2PFr7xqlw7olta8twcZ+FVjhMXpwrHfeSGfo
 UPlv9Gjz4uw86cmCclGdrvfvZkzbnvHB1SE+CS3MrGcTzf4uKgMD0hO8eIxg1UfwI5VLNt/Qyq
 rShM6f3bLlWLEvhid9auExZaC5dLCT/wn4jwCm+XutN67OqODaOnv3J7Em4M8KUA1Dz9NyNtFx
 wswV9rw3+p68MzewRG5mvfW97UTphWUU7wQs83qQB9ICqwt0nF5YxQpcTMgCmHgHUa7WiIJpQy
 Ukg=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.248])
 by uls-op-cesaip02.wdc.com with ESMTP; 15 Jul 2021 00:16:44 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL v2 12/12] hw/riscv/boot: Check the error of fdt_pack()
Date: Thu, 15 Jul 2021 00:16:40 -0700
Message-Id: <20210715071640.232070-13-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210715071640.232070-1-alistair.francis@wdc.com>
References: <20210715071640.232070-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=8230c157d=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity reports that we don't check the error result of fdt_pack(), so
let's save the result and assert that it is 0.

Fixes: Coverity CID 1458136
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 07325315b49d5555269f76094e4bc5296e0643b9.1626303527.git.alistair.francis@wdc.com
---
 hw/riscv/boot.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 0d38bb7426..993bf89064 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -182,7 +182,7 @@ uint32_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
 {
     uint32_t temp, fdt_addr;
     hwaddr dram_end = dram_base + mem_size;
-    int fdtsize = fdt_totalsize(fdt);
+    int ret, fdtsize = fdt_totalsize(fdt);
 
     if (fdtsize <= 0) {
         error_report("invalid device-tree");
@@ -198,7 +198,9 @@ uint32_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
     temp = MIN(dram_end, 3072 * MiB);
     fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 16 * MiB);
 
-    fdt_pack(fdt);
+    ret = fdt_pack(fdt);
+    /* Should only fail if we've built a corrupted tree */
+    g_assert(ret == 0);
     /* copy in the device tree */
     qemu_fdt_dumpdtb(fdt, fdtsize);
 
-- 
2.31.1


