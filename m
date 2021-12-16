Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD1C477F8D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 22:49:03 +0100 (CET)
Received: from localhost ([::1]:52658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxycY-00058P-B7
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 16:49:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLt-0003s8-Tv; Thu, 16 Dec 2021 15:27:45 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:36984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLo-0007Ti-OG; Thu, 16 Dec 2021 15:27:45 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGIU6K9038660; 
 Thu, 16 Dec 2021 20:27:08 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cymkwfksk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:27:07 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKCjID011781;
 Thu, 16 Dec 2021 20:27:05 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3cy7k3j3xh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:27:05 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BGKR2Iw43385112
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:27:02 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92B0442049;
 Thu, 16 Dec 2021 20:27:02 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 593684203F;
 Thu, 16 Dec 2021 20:27:02 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 16 Dec 2021 20:27:02 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id AD03F220238;
 Thu, 16 Dec 2021 21:27:01 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 069/101] ppc/ppc405: Rework FW load
Date: Thu, 16 Dec 2021 21:25:42 +0100
Message-Id: <20211216202614.414266-70-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LnnSDhTsUprCkZyv_aOIZiCPku0_wWgu
X-Proofpoint-ORIG-GUID: LnnSDhTsUprCkZyv_aOIZiCPku0_wWgu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 clxscore=1034 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 mlxlogscore=812 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160109
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
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

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20211206103712.1866296-10-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405_boards.c | 45 +++++++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 25 deletions(-)

diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index a385e8f15070..cfed43dba2f3 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -139,24 +139,19 @@ static void ref405ep_fpga_init(MemoryRegion *sysmem=
, uint32_t base)
 static void ref405ep_init(MachineState *machine)
 {
     MachineClass *mc =3D MACHINE_GET_CLASS(machine);
-    const char *bios_name =3D machine->firmware ?: BIOS_FILENAME;
     const char *kernel_filename =3D machine->kernel_filename;
     const char *kernel_cmdline =3D machine->kernel_cmdline;
     const char *initrd_filename =3D machine->initrd_filename;
-    char *filename;
     ppc4xx_bd_info_t bd;
     PowerPCCPU *cpu;
     CPUPPCState *env;
     DeviceState *dev;
     SysBusDevice *s;
-    MemoryRegion *bios;
     MemoryRegion *sram =3D g_new(MemoryRegion, 1);
     ram_addr_t bdloc;
     MemoryRegion *ram_memories =3D g_new(MemoryRegion, 2);
     hwaddr ram_bases[2], ram_sizes[2];
-    long bios_size;
-    //int phy_addr =3D 0;
-    //static int phy_addr =3D 1;
+    long bios_size =3D -1;
     target_ulong kernel_base, initrd_base;
     long kernel_size, initrd_size;
     int linux_boot;
@@ -190,31 +185,31 @@ static void ref405ep_init(MachineState *machine)
     memory_region_add_subregion(sysmem, PPC405EP_SRAM_BASE, sram);
=20
     /* allocate and load BIOS */
-    {
-        bios =3D g_new(MemoryRegion, 1);
+    if (machine->firmware) {
+        MemoryRegion *bios =3D g_new(MemoryRegion, 1);
+        g_autofree char *filename;
+
         memory_region_init_rom(bios, NULL, "ef405ep.bios", BIOS_SIZE,
                                &error_fatal);
=20
-        filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
-        if (filename) {
-            bios_size =3D load_image_size(filename,
-                                        memory_region_get_ram_ptr(bios),
-                                        BIOS_SIZE);
-            g_free(filename);
-            if (bios_size < 0) {
-                error_report("Could not load PowerPC BIOS '%s'", bios_na=
me);
-                exit(1);
-            }
-            bios_size =3D (bios_size + 0xfff) & ~0xfff;
-            memory_region_add_subregion(sysmem, (uint32_t)(-bios_size), =
bios);
-        } else if (!qtest_enabled() || kernel_filename !=3D NULL) {
-            error_report("Could not load PowerPC BIOS '%s'", bios_name);
+        filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, machine->firmwa=
re);
+        if (!filename) {
+            error_report("Could not find firmware '%s'", machine->firmwa=
re);
+            exit(1);
+        }
+
+        bios_size =3D load_image_size(filename,
+                                    memory_region_get_ram_ptr(bios),
+                                    BIOS_SIZE);
+        if (bios_size < 0) {
+            error_report("Could not load PowerPC BIOS '%s'", machine->fi=
rmware);
             exit(1);
-        } else {
-            /* Avoid an uninitialized variable warning */
-            bios_size =3D -1;
         }
+
+        bios_size =3D (bios_size + 0xfff) & ~0xfff;
+        memory_region_add_subregion(sysmem, (uint32_t)(-bios_size), bios=
);
     }
+
     /* Register FPGA */
     ref405ep_fpga_init(sysmem, PPC405EP_FPGA_BASE);
     /* Register NVRAM */
--=20
2.31.1


