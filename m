Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 486F44CA518
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 13:44:51 +0100 (CET)
Received: from localhost ([::1]:44936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPOLS-0006ck-Fj
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 07:44:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrN-0001ag-Rh; Wed, 02 Mar 2022 06:09:33 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:12220
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrJ-0001wq-7u; Wed, 02 Mar 2022 06:09:32 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2228n1KO014469; 
 Wed, 2 Mar 2022 11:09:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej5d9jm70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:09:02 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 222AlKph015867;
 Wed, 2 Mar 2022 11:09:02 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej5d9jm5s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:09:02 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B37E8017746;
 Wed, 2 Mar 2022 11:09:00 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3egbj19jt7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:09:00 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8wXD17433030
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:58 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17546AE058;
 Wed,  2 Mar 2022 11:08:58 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF589AE051;
 Wed,  2 Mar 2022 11:08:57 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:57 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 00DE4220294;
 Wed,  2 Mar 2022 12:08:56 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 75/87] hw/ppc/spapr.c: fail early if no firmware found in
 machine_init()
Date: Wed,  2 Mar 2022 12:07:51 +0100
Message-Id: <20220302110803.849505-76-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tnQzfTvGHpdEGJcJiYg60Z2E8Au1d22d
X-Proofpoint-ORIG-GUID: cTWVrjx-NLV41-3a21Ll_Xa6aqJHzM2J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 bulkscore=0 impostorscore=0 clxscore=1034 spamscore=0 adultscore=0
 mlxlogscore=783 suspectscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020047
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

The firmware check consists on a file search (qemu_find_file) and load
it via load_imag_targphys(). This validation is not dependent on any
other machine state but it currently being done at the end of
spapr_machine_init(). This means that we can do a lot of stuff and end
up failing at the end for something that we can verify right out of the
gate.

Move this validation to the start of spapr_machine_init() to fail
earlier.  While we're at it, use g_autofree in the 'filename' pointer.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <20220228175004.8862-3-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/spapr.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index c74543ace324..4cc204f90dfe 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2707,15 +2707,25 @@ static void spapr_machine_init(MachineState *mach=
ine)
     MachineClass *mc =3D MACHINE_GET_CLASS(machine);
     const char *bios_default =3D spapr->vof ? FW_FILE_NAME_VOF : FW_FILE=
_NAME;
     const char *bios_name =3D machine->firmware ?: bios_default;
+    g_autofree char *filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, bi=
os_name);
     const char *kernel_filename =3D machine->kernel_filename;
     const char *initrd_filename =3D machine->initrd_filename;
     PCIHostState *phb;
     int i;
     MemoryRegion *sysmem =3D get_system_memory();
     long load_limit, fw_size;
-    char *filename;
     Error *resize_hpt_err =3D NULL;
=20
+    if (!filename) {
+        error_report("Could not find LPAR firmware '%s'", bios_name);
+        exit(1);
+    }
+    fw_size =3D load_image_targphys(filename, 0, FW_MAX_SIZE);
+    if (fw_size <=3D 0) {
+        error_report("Could not load LPAR firmware '%s'", filename);
+        exit(1);
+    }
+
     /*
      * if Secure VM (PEF) support is configured, then initialize it
      */
@@ -2996,18 +3006,6 @@ static void spapr_machine_init(MachineState *machi=
ne)
         }
     }
=20
-    filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
-    if (!filename) {
-        error_report("Could not find LPAR firmware '%s'", bios_name);
-        exit(1);
-    }
-    fw_size =3D load_image_targphys(filename, 0, FW_MAX_SIZE);
-    if (fw_size <=3D 0) {
-        error_report("Could not load LPAR firmware '%s'", filename);
-        exit(1);
-    }
-    g_free(filename);
-
     /* FIXME: Should register things through the MachineState's qdev
      * interface, this is a legacy from the sPAPREnvironment structure
      * which predated MachineState but had a similar function */
--=20
2.34.1


