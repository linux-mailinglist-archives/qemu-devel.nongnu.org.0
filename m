Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7B020023D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 08:55:46 +0200 (CEST)
Received: from localhost ([::1]:50916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmAwE-0006TI-13
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 02:55:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4324eb4de=alistair.francis@wdc.com>)
 id 1jmAcY-0006fE-TT
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 02:35:28 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4324eb4de=alistair.francis@wdc.com>)
 id 1jmAcT-00028a-1c
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 02:35:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1592548521; x=1624084521;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=40P3DW1BoMOW1mFaEB7dGJKmFgq1glT568GPf37xRf8=;
 b=AS2N96V4lidLp/NWomAJqCeLfHnK7aka8wdd7GlWPGehW7inypY3RLfu
 4E3soUI9oLgGcPq8EiIuDPdaKyOHR6C1mfFJCvHS3LFBlViMa8j75/6pG
 fATLC/zsgpdxLHzB/qnEP0kONHu32T3JJ11sBry5/zKjRQExFAu4yyq6+
 RbuhVLn8NZAx+fWydwQUBqACsWEjcrrLElCZj+qDvQkBnn1SZczpsm5M7
 lt+i/4XaqURwHOWWJaYBAv831VPDTHpLQRA0hw/ZZPOb8YZe/W4+/6Gtb
 8iU10vZOCqp93BeE7ZGUQ5WWqx8gSsra3/Y5StCFOmAQ+OFbXmk4cg51K w==;
IronPort-SDR: SFXnUOETJCnsAHwZNpt6OwHcOYXHYaK4Z8tEp5UJBoRJszsFx0kX+UtGuALIOVk9WRw5tvAW7n
 /38vWCpFFsdf8cutpEeYlVD0RQQWMqB2Q2KVvDETIFmrB5sOMX44OaojhB4YV53QeFwkAAAyXR
 55191tEKcdRODuRqP0fcsDGGgLW4nrAvH6r243KMR52mG8Hbx0znqDpQsGkyxRzg3YMbCBBiXj
 A469iY8GzuZtdtytgurxT54EKeiR7UHoRoqXY+tFnLV7LvTIhfFZKbzaWyG4dKwKbD2j8HxuSI
 4WE=
X-IronPort-AV: E=Sophos;i="5.75,253,1589212800"; d="scan'208";a="141781954"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Jun 2020 14:34:33 +0800
IronPort-SDR: Z7frXQL2b7esHXEyeBQLLRf3XtEDgHHGBeCkNY98VOvs4s7U1s0cWouzRliweeYzXrMz9n02g9
 lPIr6r1zzwA1GZJHytyXqFyKvp8FrNink=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2020 23:23:44 -0700
IronPort-SDR: SJnI9BVAQ99QVYzP4vWYC8rpyTRlreg73sPXVuTc46xjGZE56UtwIa6JueGBz8ota5cn+PjtQ5
 hycnHpc4eFhQ==
WDCIronportException: Internal
Received: from unknown (HELO risc6-mainframe.hgst.com) ([10.86.58.142])
 by uls-op-cesaip02.wdc.com with ESMTP; 18 Jun 2020 23:34:32 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 30/32] hw/riscv: sifive_u: Support different boot source per
 MSEL pin state
Date: Thu, 18 Jun 2020 23:25:16 -0700
Message-Id: <20200619062518.1718523-31-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200619062518.1718523-1-alistair.francis@wdc.com>
References: <20200619062518.1718523-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=4324eb4de=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 02:34:29
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

SiFive FU540 SoC supports booting from several sources, which are
controlled using the Mode Select (MSEL[3:0]) pins on the chip.
Typically, the boot process runs through several stages before it
begins execution of user-provided programs.

The SoC supports booting from memory-mapped QSPI flash, which is
how start_in_flash property is used for at present. This matches
MSEL = 1 configuration (QSPI0).

Typical booting flows involve the Zeroth Stage Boot Loader (ZSBL).
It's not necessary for QEMU to implement the full ZSBL ROM codes,
because we know ZSBL downloads the next stage program into the L2
LIM at address 0x8000000 and executes from there. We can bypass
the whole ZSBL execution and use "-bios" to load the next stage
program directly if MSEL indicates a ZSBL booting flow.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 1592268641-7478-4-git-send-email-bmeng.cn@gmail.com
Message-Id: <1592268641-7478-4-git-send-email-bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/sifive_u.h |  6 ++++++
 hw/riscv/sifive_u.c         | 39 +++++++++++++++++++++++++++++--------
 2 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index f6d10ebfb6..27dc35e0a3 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -111,6 +111,12 @@ enum {
     SIFIVE_U_RTCCLK_FREQ = 1000000
 };
 
+enum {
+    MSEL_MEMMAP_QSPI0_FLASH = 1,
+    MSEL_L2LIM_QSPI0_FLASH = 6,
+    MSEL_L2LIM_QSPI2_SD = 11
+};
+
 #define SIFIVE_U_MANAGEMENT_CPU_COUNT   1
 #define SIFIVE_U_COMPUTE_CPU_COUNT      4
 
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 2a8c8c8829..2560c1ce4e 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -405,8 +405,34 @@ static void sifive_u_machine_init(MachineState *machine)
     /* create device tree */
     create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
 
-    riscv_find_and_load_firmware(machine, BIOS_FILENAME,
-                                 memmap[SIFIVE_U_DRAM].base, NULL);
+    if (s->start_in_flash) {
+        /*
+         * If start_in_flash property is given, assign s->msel to a value
+         * that representing booting from QSPI0 memory-mapped flash.
+         *
+         * This also means that when both start_in_flash and msel properties
+         * are given, start_in_flash takes the precedence over msel.
+         *
+         * Note this is to keep backward compatibility not to break existing
+         * users that use start_in_flash property.
+         */
+        s->msel = MSEL_MEMMAP_QSPI0_FLASH;
+    }
+
+    switch (s->msel) {
+    case MSEL_MEMMAP_QSPI0_FLASH:
+        start_addr = memmap[SIFIVE_U_FLASH0].base;
+        break;
+    case MSEL_L2LIM_QSPI0_FLASH:
+    case MSEL_L2LIM_QSPI2_SD:
+        start_addr = memmap[SIFIVE_U_L2LIM].base;
+        break;
+    default:
+        start_addr = memmap[SIFIVE_U_DRAM].base;
+        break;
+    }
+
+    riscv_find_and_load_firmware(machine, BIOS_FILENAME, start_addr, NULL);
 
     if (machine->kernel_filename) {
         uint64_t kernel_entry = riscv_load_kernel(machine->kernel_filename,
@@ -424,13 +450,9 @@ static void sifive_u_machine_init(MachineState *machine)
         }
     }
 
-    if (s->start_in_flash) {
-        start_addr = memmap[SIFIVE_U_FLASH0].base;
-    }
-
     /* reset vector */
     uint32_t reset_vec[8] = {
-        0x00000000,
+        s->msel,                       /* MSEL pin state */
         0x00000297,                    /* 1:  auipc  t0, %pcrel_hi(dtb) */
         0x01c28593,                    /*     addi   a1, t0, %pcrel_lo(1b) */
         0xf1402573,                    /*     csrr   a0, mhartid  */
@@ -502,7 +524,8 @@ static void sifive_u_machine_instance_init(Object *obj)
                              sifive_u_machine_set_start_in_flash);
     object_property_set_description(obj, "start-in-flash",
                                     "Set on to tell QEMU's ROM to jump to "
-                                    "flash. Otherwise QEMU will jump to DRAM");
+                                    "flash. Otherwise QEMU will jump to DRAM "
+                                    "or L2LIM depending on the msel value");
 
     s->msel = 0;
     object_property_add(obj, "msel", "uint32",
-- 
2.27.0


