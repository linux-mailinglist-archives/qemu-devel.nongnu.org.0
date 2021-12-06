Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAB0469417
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 11:45:00 +0100 (CET)
Received: from localhost ([::1]:49036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muBUR-0004V8-VD
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 05:45:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muBNG-0001DJ-4H
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:37:35 -0500
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192]:56871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muBNA-0001o3-Fu
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:37:32 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.128])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id D29DC20177;
 Mon,  6 Dec 2021 10:37:19 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 6 Dec
 2021 11:37:19 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001f99c8639-755a-4673-8694-b5f51c9d612f,
 4EE5CA355A73348BB336A65EF5ADB9B11F7CB924) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 09/15] ppc/ppc405: Rework FW load
Date: Mon, 6 Dec 2021 11:37:06 +0100
Message-ID: <20211206103712.1866296-10-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211206103712.1866296-1-clg@kaod.org>
References: <20211206103712.1866296-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e4a71384-e246-4db6-8961-6809932320e5
X-Ovh-Tracer-Id: 16708073145341086572
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeefgddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU installs a custom U-Boot in-memory descriptor to share board
information with Linux, which means that the QEMU machine was
initially designed to support booting Linux directly without using the
loaded FW. But, it's not that simple because the CPU still starts at
address 0xfffffffc where nothing is currently mapped. Support must
have been broken these last years.

Since we can not find a "ppc405_rom.bin" firmware file, request one to
be specified on the command line. A consequence of this change is that
the machine can be booted directly from Linux without any FW being
loaded. This is still broken and the CPU start address will be fixed
in the next changes.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405_boards.c | 45 +++++++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 25 deletions(-)

diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index a385e8f15070..cfed43dba2f3 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -139,24 +139,19 @@ static void ref405ep_fpga_init(MemoryRegion *sysmem, uint32_t base)
 static void ref405ep_init(MachineState *machine)
 {
     MachineClass *mc = MACHINE_GET_CLASS(machine);
-    const char *bios_name = machine->firmware ?: BIOS_FILENAME;
     const char *kernel_filename = machine->kernel_filename;
     const char *kernel_cmdline = machine->kernel_cmdline;
     const char *initrd_filename = machine->initrd_filename;
-    char *filename;
     ppc4xx_bd_info_t bd;
     PowerPCCPU *cpu;
     CPUPPCState *env;
     DeviceState *dev;
     SysBusDevice *s;
-    MemoryRegion *bios;
     MemoryRegion *sram = g_new(MemoryRegion, 1);
     ram_addr_t bdloc;
     MemoryRegion *ram_memories = g_new(MemoryRegion, 2);
     hwaddr ram_bases[2], ram_sizes[2];
-    long bios_size;
-    //int phy_addr = 0;
-    //static int phy_addr = 1;
+    long bios_size = -1;
     target_ulong kernel_base, initrd_base;
     long kernel_size, initrd_size;
     int linux_boot;
@@ -190,31 +185,31 @@ static void ref405ep_init(MachineState *machine)
     memory_region_add_subregion(sysmem, PPC405EP_SRAM_BASE, sram);
 
     /* allocate and load BIOS */
-    {
-        bios = g_new(MemoryRegion, 1);
+    if (machine->firmware) {
+        MemoryRegion *bios = g_new(MemoryRegion, 1);
+        g_autofree char *filename;
+
         memory_region_init_rom(bios, NULL, "ef405ep.bios", BIOS_SIZE,
                                &error_fatal);
 
-        filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
-        if (filename) {
-            bios_size = load_image_size(filename,
-                                        memory_region_get_ram_ptr(bios),
-                                        BIOS_SIZE);
-            g_free(filename);
-            if (bios_size < 0) {
-                error_report("Could not load PowerPC BIOS '%s'", bios_name);
-                exit(1);
-            }
-            bios_size = (bios_size + 0xfff) & ~0xfff;
-            memory_region_add_subregion(sysmem, (uint32_t)(-bios_size), bios);
-        } else if (!qtest_enabled() || kernel_filename != NULL) {
-            error_report("Could not load PowerPC BIOS '%s'", bios_name);
+        filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, machine->firmware);
+        if (!filename) {
+            error_report("Could not find firmware '%s'", machine->firmware);
+            exit(1);
+        }
+
+        bios_size = load_image_size(filename,
+                                    memory_region_get_ram_ptr(bios),
+                                    BIOS_SIZE);
+        if (bios_size < 0) {
+            error_report("Could not load PowerPC BIOS '%s'", machine->firmware);
             exit(1);
-        } else {
-            /* Avoid an uninitialized variable warning */
-            bios_size = -1;
         }
+
+        bios_size = (bios_size + 0xfff) & ~0xfff;
+        memory_region_add_subregion(sysmem, (uint32_t)(-bios_size), bios);
     }
+
     /* Register FPGA */
     ref405ep_fpga_init(sysmem, PPC405EP_FPGA_BASE);
     /* Register NVRAM */
-- 
2.31.1


