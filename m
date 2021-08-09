Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4283E46F5
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:54:54 +0200 (CEST)
Received: from localhost ([::1]:50744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5jx-00083f-An
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD5bY-0000Ts-SQ; Mon, 09 Aug 2021 09:46:12 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:21870
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD5bW-0000zc-3Z; Mon, 09 Aug 2021 09:46:12 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 179DYQ3w087004; Mon, 9 Aug 2021 09:45:57 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3aa7n08j9t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 09:45:57 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 179Cw6AV015968;
 Mon, 9 Aug 2021 13:45:55 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3a9ht8km7u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 13:45:55 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 179DghcS54329604
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Aug 2021 13:42:43 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24BC352073;
 Mon,  9 Aug 2021 13:45:53 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id C859252050;
 Mon,  9 Aug 2021 13:45:52 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.54.114])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 1519722016C;
 Mon,  9 Aug 2021 15:45:52 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 05/26] ppc/pnv: Distribute RAM among the chips
Date: Mon,  9 Aug 2021 15:45:26 +0200
Message-Id: <20210809134547.689560-6-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809134547.689560-1-clg@kaod.org>
References: <20210809134547.689560-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TSF2VDjKwimTG1eGMtlfdlqpde5FmoUa
X-Proofpoint-ORIG-GUID: TSF2VDjKwimTG1eGMtlfdlqpde5FmoUa
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_04:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 phishscore=0 clxscore=1034 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxlogscore=700 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108090101
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.398,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

But always give the first 1GB to chip 0 as skiboot requires it.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/pnv.c | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 025f01c55744..2f5358b70c95 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -710,6 +710,23 @@ static void pnv_chip_power10_pic_print_info(PnvChip =
*chip, Monitor *mon)
     pnv_psi_pic_print_info(&chip10->psi, mon);
 }
=20
+/* Always give the first 1GB to chip 0 else we won't boot */
+static uint64_t pnv_chip_get_ram_size(PnvMachineState *pnv, int chip_id)
+{
+    MachineState *machine =3D MACHINE(pnv);
+    uint64_t ram_per_chip;
+
+    assert(machine->ram_size >=3D 1 * GiB);
+
+    ram_per_chip =3D machine->ram_size / pnv->num_chips;
+    if (ram_per_chip >=3D 1 * GiB) {
+        return QEMU_ALIGN_DOWN(ram_per_chip, 1 * MiB);
+    }
+
+    ram_per_chip =3D (machine->ram_size - 1 * GiB) / (pnv->num_chips - 1=
);
+    return chip_id =3D=3D 0 ? 1 * GiB : QEMU_ALIGN_DOWN(ram_per_chip, 1 =
* MiB);
+}
+
 static void pnv_init(MachineState *machine)
 {
     const char *bios_name =3D machine->firmware ?: FW_FILE_NAME;
@@ -717,6 +734,7 @@ static void pnv_init(MachineState *machine)
     MachineClass *mc =3D MACHINE_GET_CLASS(machine);
     char *fw_filename;
     long fw_size;
+    uint64_t chip_ram_start =3D 0;
     int i;
     char *chip_typename;
     DriveInfo *pnor =3D drive_get(IF_MTD, 0, 0);
@@ -821,17 +839,16 @@ static void pnv_init(MachineState *machine)
         char chip_name[32];
         Object *chip =3D OBJECT(qdev_new(chip_typename));
         int chip_id =3D i;
+        uint64_t chip_ram_size =3D  pnv_chip_get_ram_size(pnv, chip_id);
=20
         pnv->chips[i] =3D PNV_CHIP(chip);
=20
-        /*
-         * TODO: put all the memory in one node on chip 0 until we find =
a
-         * way to specify different ranges for each chip
-         */
-        if (i =3D=3D 0) {
-            object_property_set_int(chip, "ram-size", machine->ram_size,
-                                    &error_fatal);
-        }
+        /* Distribute RAM among the chips  */
+        object_property_set_int(chip, "ram-start", chip_ram_start,
+                                &error_fatal);
+        object_property_set_int(chip, "ram-size", chip_ram_size,
+                                &error_fatal);
+        chip_ram_start +=3D chip_ram_size;
=20
         snprintf(chip_name, sizeof(chip_name), "chip[%d]", chip_id);
         object_property_add_child(OBJECT(pnv), chip_name, chip);
--=20
2.31.1


