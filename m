Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 771CE304526
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 18:25:27 +0100 (CET)
Received: from localhost ([::1]:44862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4S5m-0003Fv-8C
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 12:25:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1l4RsK-000161-QN; Tue, 26 Jan 2021 12:11:32 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:14972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1l4RsJ-0007E9-5a; Tue, 26 Jan 2021 12:11:32 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10QH3Xgn126253; Tue, 26 Jan 2021 12:11:10 -0500
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36amnnnn56-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jan 2021 12:11:10 -0500
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10QGw6DN030717;
 Tue, 26 Jan 2021 17:11:09 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 368be81hse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jan 2021 17:11:08 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 10QHAxVT26411358
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jan 2021 17:10:59 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9775842041;
 Tue, 26 Jan 2021 17:11:06 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6773C42049;
 Tue, 26 Jan 2021 17:11:06 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 26 Jan 2021 17:11:06 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-70-48.uk.ibm.com [9.145.70.48])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id AF2A822010B;
 Tue, 26 Jan 2021 18:11:05 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 7/7] ppc/pnv: Introduce a LPC FW memory region attribute to
 map the PNOR
Date: Tue, 26 Jan 2021 18:10:59 +0100
Message-Id: <20210126171059.307867-8-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210126171059.307867-1-clg@kaod.org>
References: <20210126171059.307867-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-26_09:2021-01-26,
 2021-01-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 clxscore=1034 mlxlogscore=621 bulkscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101260088
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This to map the PNOR from the machine init handler directly and finish
the cleanup of the LPC model.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/pnv.h |  1 +
 hw/ppc/pnv.c         | 11 +++++++++++
 hw/ppc/pnv_lpc.c     |  7 -------
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index ee7eda3e0102..d69cee17b232 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -58,6 +58,7 @@ struct PnvChip {
     MemoryRegion xscom;
     AddressSpace xscom_as;
=20
+    MemoryRegion *fw_mr;
     gchar        *dt_isa_nodename;
 };
=20
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index e500c2e2437e..50810df83815 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -871,6 +871,14 @@ static void pnv_init(MachineState *machine)
         pnv_ipmi_bt_init(pnv->isa_bus, pnv->bmc, 10);
     }
=20
+    /*
+     * The PNOR is mapped on the LPC FW address space by the BMC.
+     * Since we can not reach the remote BMC machine with LPC memops,
+     * map it always for now.
+     */
+    memory_region_add_subregion(pnv->chips[0]->fw_mr, PNOR_SPI_OFFSET,
+                                &pnv->pnor->mmio);
+
     /*
      * OpenPOWER systems use a IPMI SEL Event message to notify the
      * host to powerdown
@@ -1150,6 +1158,7 @@ static void pnv_chip_power8_realize(DeviceState *de=
v, Error **errp)
     qdev_realize(DEVICE(&chip8->lpc), NULL, &error_fatal);
     pnv_xscom_add_subregion(chip, PNV_XSCOM_LPC_BASE, &chip8->lpc.xscom_=
regs);
=20
+    chip->fw_mr =3D &chip8->lpc.isa_fw;
     chip->dt_isa_nodename =3D g_strdup_printf("/xscom@%" PRIx64 "/isa@%x=
",
                                             (uint64_t) PNV_XSCOM_BASE(ch=
ip),
                                             PNV_XSCOM_LPC_BASE);
@@ -1479,6 +1488,7 @@ static void pnv_chip_power9_realize(DeviceState *de=
v, Error **errp)
     memory_region_add_subregion(get_system_memory(), PNV9_LPCM_BASE(chip=
),
                                 &chip9->lpc.xscom_regs);
=20
+    chip->fw_mr =3D &chip9->lpc.isa_fw;
     chip->dt_isa_nodename =3D g_strdup_printf("/lpcm-opb@%" PRIx64 "/lpc=
@0",
                                             (uint64_t) PNV9_LPCM_BASE(ch=
ip));
=20
@@ -1592,6 +1602,7 @@ static void pnv_chip_power10_realize(DeviceState *d=
ev, Error **errp)
     memory_region_add_subregion(get_system_memory(), PNV10_LPCM_BASE(chi=
p),
                                 &chip10->lpc.xscom_regs);
=20
+    chip->fw_mr =3D &chip10->lpc.isa_fw;
     chip->dt_isa_nodename =3D g_strdup_printf("/lpcm-opb@%" PRIx64 "/lpc=
@0",
                                             (uint64_t) PNV10_LPCM_BASE(c=
hip));
 }
diff --git a/hw/ppc/pnv_lpc.c b/hw/ppc/pnv_lpc.c
index 11739e397b27..bcbca3db9743 100644
--- a/hw/ppc/pnv_lpc.c
+++ b/hw/ppc/pnv_lpc.c
@@ -824,7 +824,6 @@ ISABus *pnv_lpc_isa_create(PnvLpcController *lpc, boo=
l use_cpld, Error **errp)
     ISABus *isa_bus;
     qemu_irq *irqs;
     qemu_irq_handler handler;
-    PnvMachineState *pnv =3D PNV_MACHINE(qdev_get_machine());
=20
     /* let isa_bus_new() create its own bridge on SysBus otherwise
      * devices specified on the command line won't find the bus and
@@ -850,11 +849,5 @@ ISABus *pnv_lpc_isa_create(PnvLpcController *lpc, bo=
ol use_cpld, Error **errp)
=20
     isa_bus_irqs(isa_bus, irqs);
=20
-    /*
-     * TODO: Map PNOR on the LPC FW address space on demand ?
-     */
-    memory_region_add_subregion(&lpc->isa_fw, PNOR_SPI_OFFSET,
-                                &pnv->pnor->mmio);
-
     return isa_bus;
 }
--=20
2.26.2


