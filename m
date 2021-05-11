Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B41E37A49E
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:30:34 +0200 (CEST)
Received: from localhost ([::1]:55610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPer-0000kb-ES
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:30:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPVK-0008TF-4L
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:20:48 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPVG-0006X1-2t
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:20:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728437; x=1652264437;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DnxGqkqryW4nT1B8CpFaIJuKOwmq2qmaWP3zHuKVDz0=;
 b=FiseQIvsW/peAfo+q8GMVpnkBMkjUg4P0/E056mQTR19pL1dLeykFzWB
 rcZfMpv3j0xz0MLfYzXX/QhnhL7eGernp96P0dT95MS7ElNfleTPlOEXq
 jnlmQPqNd78bVYIihp6I6Q6A5WwghnQ3UIqxs5fb0Ug9RzCOpikss1Z0N
 bJ7t/uV/4rQ6qCr23NkzLcRyRCPe2oj7aqwypL3/9ZqAJL2mEgx3qJPiU
 5LyEUJRSq3QxnjbF52Ya37h/LGuXJ9vVjs+CBQKOavUjIIEf+bxgnSHLY
 TdcbvGMaM3ck4AHBUqZqqhbGmhj0SJF0whHBowdicZWEUrPjtXv6XdGZH g==;
IronPort-SDR: awQFzsygtpFHz+49AL/JNC7+D0gPrgD8pTmVL6Xys6zseCdsszYOWPgCyd5Yfzuc5se46Xmwvl
 jtnJC6tiBxreoggsDAgJS+7JbgN9ddIKdy2DL/LoJYHdJWI6jSoypvL8RJPHjGD23iWSvUuKzG
 goZ0RJqrWfrXfO8/6ulq6tGIWaYabcJdpYdfs2r4RuJWm9plmeywO3bF96Sauz/gs8UrqzhhPt
 aoN5pWXyobqTzRWI7OTZSwBR7kXi7ckIsH3LU6/gOvQ1P23YiWeWrT6stVxu78nBHCRPrRGeuc
 +7s=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735369"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:20:27 +0800
IronPort-SDR: DAupdVK0ZTEJ1xJCfNhr8DNLyi0cRISPZi5ESeN1rngevVvUG9eWKmoC2ctoqyAd3SQWbtH3GH
 yuNIiGf0vW9aarYwzdLQLRMrBsYq9f5xXsZcG9AoXwhMwE8ayu/6mMgLLRhx43ARLsCBgt+Bki
 vmB8uDN3buzpdYR4GxC7cDMUjFQIXUlhYTYyDmRmu23f3RUJUmyRGIyq3lmfGuggEDfaeZNvOB
 CNtV23AYdZ3Ag8nz0GFX7XOyxfikh9T80gd/1ybuMLC7QW9DFMWoJyvVeImJAMrypEvdA3RdFP
 TvQeNPy+lzfWyYinv4TZaLoJ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:00:26 -0700
IronPort-SDR: XqTf3haPtZ9pokFci2GTKlQXZE0cg1aT7NonH2PMA2V82ECdCUBzKjvHC8XwxieeFbXCE9+lh1
 u8JslvGQtZXpM5cRKbYmocq1AqXpv606D8sWJhtgYPRcsmlpL7se0/y5VijcWNyad/0Si928Bn
 Yka0uITmyhZrxcndQqUj/6Hp58Vs46XJYjoNkz4uN3qa5DQ7VoBQXRzeBPwL6quqiN6vSCssGJ
 Son+XzKUzCkxNtN+ncxaGh7vGzZmWcnizMMiyslRxUzJMx4gA9xq8rwxG/3SCj7CQUhXywYsks
 TMI=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:20:26 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 08/42] hw/riscv: Connect Shakti UART to Shakti platform
Date: Tue, 11 May 2021 20:19:17 +1000
Message-Id: <20210511101951.165287-9-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511101951.165287-1-alistair.francis@wdc.com>
References: <20210511101951.165287-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7584e029c=alistair.francis@wdc.com;
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
Cc: Vijai Kumar K <vijai@behindbytes.com>, alistair23@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vijai Kumar K <vijai@behindbytes.com>

Connect one shakti uart to the shakti_c machine.

Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210401181457.73039-5-vijai@behindbytes.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/shakti_c.h | 2 ++
 hw/riscv/shakti_c.c         | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/include/hw/riscv/shakti_c.h b/include/hw/riscv/shakti_c.h
index 8ffc2b0213..50a2b79086 100644
--- a/include/hw/riscv/shakti_c.h
+++ b/include/hw/riscv/shakti_c.h
@@ -21,6 +21,7 @@
 
 #include "hw/riscv/riscv_hart.h"
 #include "hw/boards.h"
+#include "hw/char/shakti_uart.h"
 
 #define TYPE_RISCV_SHAKTI_SOC "riscv.shakti.cclass.soc"
 #define RISCV_SHAKTI_SOC(obj) \
@@ -33,6 +34,7 @@ typedef struct ShaktiCSoCState {
     /*< public >*/
     RISCVHartArrayState cpus;
     DeviceState *plic;
+    ShaktiUartState uart;
     MemoryRegion rom;
 
 } ShaktiCSoCState;
diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index 6e6e63d153..18f70fadaa 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -128,6 +128,13 @@ static void shakti_c_soc_state_realize(DeviceState *dev, Error **errp)
         SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
         SIFIVE_CLINT_TIMEBASE_FREQ, false);
 
+    qdev_prop_set_chr(DEVICE(&(sss->uart)), "chardev", serial_hd(0));
+    if (!sysbus_realize(SYS_BUS_DEVICE(&sss->uart), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&sss->uart), 0,
+                    shakti_c_memmap[SHAKTI_C_UART].base);
+
     /* ROM */
     memory_region_init_rom(&sss->rom, OBJECT(dev), "riscv.shakti.c.rom",
                            shakti_c_memmap[SHAKTI_C_ROM].size, &error_fatal);
@@ -146,6 +153,7 @@ static void shakti_c_soc_instance_init(Object *obj)
     ShaktiCSoCState *sss = RISCV_SHAKTI_SOC(obj);
 
     object_initialize_child(obj, "cpus", &sss->cpus, TYPE_RISCV_HART_ARRAY);
+    object_initialize_child(obj, "uart", &sss->uart, TYPE_SHAKTI_UART);
 
     /*
      * CPU type is fixed and we are not supporting passing from commandline yet.
-- 
2.31.1


