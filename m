Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0BF469460
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 11:53:32 +0100 (CET)
Received: from localhost ([::1]:40786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muBch-0001W5-VS
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 05:53:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muBNJ-0001Hl-Id
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:37:38 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:42661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muBNB-0001oB-14
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:37:37 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.195])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 42125D01203C;
 Mon,  6 Dec 2021 11:37:20 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 6 Dec
 2021 11:37:19 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001e8e50274-1c03-4bfe-be79-142191d3ef66,
 4EE5CA355A73348BB336A65EF5ADB9B11F7CB924) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 10/15] ppc/ppc405: Introduce ppc405_set_default_bootinfo()
Date: Mon, 6 Dec 2021 11:37:07 +0100
Message-ID: <20211206103712.1866296-11-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211206103712.1866296-1-clg@kaod.org>
References: <20211206103712.1866296-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8c17d296-aa0e-46b4-88d7-972627cace2a
X-Ovh-Tracer-Id: 16708354617814780780
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeefgddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This routine is a small helper to cleanup the code. The update of the
flash fields were removed because there are not of any use when booting
from a Linux kernel image. It should be functionally equivalent.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405.h        |  2 +-
 hw/ppc/ppc405_boards.c | 28 +---------------------------
 hw/ppc/ppc405_uc.c     | 41 ++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 42 insertions(+), 29 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index ea48c3626908..6fb8b41bbc77 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -63,7 +63,7 @@ struct ppc4xx_bd_info_t {
 };
 
 /* PowerPC 405 core */
-ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ppc4xx_bd_info_t *bd);
+ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ram_addr_t ram_size);
 
 void ppc4xx_plb_init(CPUPPCState *env);
 void ppc405_ebc_init(CPUPPCState *env);
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index cfed43dba2f3..71a652e2d846 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -142,7 +142,6 @@ static void ref405ep_init(MachineState *machine)
     const char *kernel_filename = machine->kernel_filename;
     const char *kernel_cmdline = machine->kernel_cmdline;
     const char *initrd_filename = machine->initrd_filename;
-    ppc4xx_bd_info_t bd;
     PowerPCCPU *cpu;
     CPUPPCState *env;
     DeviceState *dev;
@@ -221,32 +220,7 @@ static void ref405ep_init(MachineState *machine)
     /* Load kernel */
     linux_boot = (kernel_filename != NULL);
     if (linux_boot) {
-        memset(&bd, 0, sizeof(bd));
-        bd.bi_memstart = PPC405EP_SDRAM_BASE;
-        bd.bi_memsize = machine->ram_size;
-        bd.bi_flashstart = -bios_size;
-        bd.bi_flashsize = -bios_size;
-        bd.bi_flashoffset = 0;
-        bd.bi_sramstart = PPC405EP_SRAM_BASE;
-        bd.bi_sramsize = PPC405EP_SRAM_SIZE;
-        bd.bi_bootflags = 0;
-        bd.bi_intfreq = 133333333;
-        bd.bi_busfreq = 33333333;
-        bd.bi_baudrate = 115200;
-        bd.bi_s_version[0] = 'Q';
-        bd.bi_s_version[1] = 'M';
-        bd.bi_s_version[2] = 'U';
-        bd.bi_s_version[3] = '\0';
-        bd.bi_r_version[0] = 'Q';
-        bd.bi_r_version[1] = 'E';
-        bd.bi_r_version[2] = 'M';
-        bd.bi_r_version[3] = 'U';
-        bd.bi_r_version[4] = '\0';
-        bd.bi_procfreq = 133333333;
-        bd.bi_plb_busfreq = 33333333;
-        bd.bi_pci_busfreq = 33333333;
-        bd.bi_opbfreq = 33333333;
-        bdloc = ppc405_set_bootinfo(env, &bd);
+        bdloc = ppc405_set_bootinfo(env, machine->ram_size);
         env->gpr[3] = bdloc;
         kernel_base = KERNEL_LOAD_ADDR;
         /* now we can load the kernel */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 4ad81695e80a..303af584443d 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -41,7 +41,35 @@
 #include "qapi/error.h"
 #include "trace.h"
 
-ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ppc4xx_bd_info_t *bd)
+static void ppc405_set_default_bootinfo(ppc4xx_bd_info_t *bd,
+                                        ram_addr_t ram_size)
+{
+        memset(bd, 0, sizeof(*bd));
+
+        bd->bi_memstart = PPC405EP_SDRAM_BASE;
+        bd->bi_memsize = ram_size;
+        bd->bi_sramstart = PPC405EP_SRAM_BASE;
+        bd->bi_sramsize = PPC405EP_SRAM_SIZE;
+        bd->bi_bootflags = 0;
+        bd->bi_intfreq = 133333333;
+        bd->bi_busfreq = 33333333;
+        bd->bi_baudrate = 115200;
+        bd->bi_s_version[0] = 'Q';
+        bd->bi_s_version[1] = 'M';
+        bd->bi_s_version[2] = 'U';
+        bd->bi_s_version[3] = '\0';
+        bd->bi_r_version[0] = 'Q';
+        bd->bi_r_version[1] = 'E';
+        bd->bi_r_version[2] = 'M';
+        bd->bi_r_version[3] = 'U';
+        bd->bi_r_version[4] = '\0';
+        bd->bi_procfreq = 133333333;
+        bd->bi_plb_busfreq = 33333333;
+        bd->bi_pci_busfreq = 33333333;
+        bd->bi_opbfreq = 33333333;
+}
+
+static ram_addr_t __ppc405_set_bootinfo(CPUPPCState *env, ppc4xx_bd_info_t *bd)
 {
     CPUState *cs = env_cpu(env);
     ram_addr_t bdloc;
@@ -93,6 +121,17 @@ ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ppc4xx_bd_info_t *bd)
     return bdloc;
 }
 
+ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ram_addr_t ram_size)
+{
+    ppc4xx_bd_info_t bd;
+
+    memset(&bd, 0, sizeof(bd));
+
+    ppc405_set_default_bootinfo(&bd, ram_size);
+
+    return __ppc405_set_bootinfo(env, &bd);
+}
+
 /*****************************************************************************/
 /* Shared peripherals */
 
-- 
2.31.1


