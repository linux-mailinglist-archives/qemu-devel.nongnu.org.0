Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEB7476039
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:07:09 +0100 (CET)
Received: from localhost ([::1]:59830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxYgG-0003qg-Kr
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:07:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiT-0005Mg-2x; Wed, 15 Dec 2021 12:05:21 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiQ-0004nC-9h; Wed, 15 Dec 2021 12:05:20 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfZtm026304; 
 Wed, 15 Dec 2021 17:04:48 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cygtrwvyf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:47 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH2fri010809;
 Wed, 15 Dec 2021 17:04:45 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 3cy7vvf1s2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:45 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFH4gYx45285676
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:04:42 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 745A3A405B;
 Wed, 15 Dec 2021 17:04:42 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39F50A405C;
 Wed, 15 Dec 2021 17:04:42 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:42 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 82409220247;
 Wed, 15 Dec 2021 18:04:41 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 069/102] ppc/ppc405: Rework FW load
Date: Wed, 15 Dec 2021 18:03:24 +0100
Message-Id: <20211215170357.321643-57-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: B_tZMEmdBgCwkpFlBHhyd5PAQY9ND1cC
X-Proofpoint-GUID: B_tZMEmdBgCwkpFlBHhyd5PAQY9ND1cC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=824 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1034 bulkscore=0 adultscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150098
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


