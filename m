Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D3F11E364
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Dec 2019 13:11:49 +0100 (CET)
Received: from localhost ([::1]:48206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifjnQ-0003Fj-Ah
	for lists+qemu-devel@lfdr.de; Fri, 13 Dec 2019 07:11:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33347)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1ifjcA-0007OL-8b
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 07:00:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1ifjc5-0004Gd-2G
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 07:00:10 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56958)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1ifjc4-0004Fc-TD
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 07:00:04 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBDBukjA195231
 for <qemu-devel@nongnu.org>; Fri, 13 Dec 2019 07:00:04 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wtf71jjsy-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 13 Dec 2019 07:00:02 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <groug@kaod.org>;
 Fri, 13 Dec 2019 11:59:59 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 13 Dec 2019 11:59:57 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBDBxvcK50331858
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Dec 2019 11:59:57 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 006C511C04C;
 Fri, 13 Dec 2019 11:59:57 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C35CD11C04A;
 Fri, 13 Dec 2019 11:59:56 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.185.241])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 13 Dec 2019 11:59:56 +0000 (GMT)
Subject: [PATCH 05/13] ppc/pnv: Introduce PnvMachineClass::dt_power_mgt()
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Fri, 13 Dec 2019 12:59:56 +0100
In-Reply-To: <157623836852.360005.1112241220707384093.stgit@bahia.lan>
References: <157623836852.360005.1112241220707384093.stgit@bahia.lan>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19121311-0020-0000-0000-00000397C4C3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19121311-0021-0000-0000-000021EED233
Message-Id: <157623839642.360005.9243510140436689941.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-13_03:2019-12-13,2019-12-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 adultscore=0 clxscore=1034 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 mlxlogscore=847 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912130097
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
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
Cc: qemu-ppc@nongnu.org, =?utf-8?q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We add an extra node to advertise power management on some machines,
namely powernv9 and powernv10. This is achieved by using the
pnv_is_power9() and pnv_is_power10() helpers.

This can be achieved with QOM. Add a method to the base class for
powernv machines and have it implemented by machine types that
support power management instead.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/pnv.c         |   10 ++++++----
 include/hw/ppc/pnv.h |    8 ++++++--
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 5ac149b149d8..efc00f4cb67a 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -472,7 +472,7 @@ static void pnv_dt_isa(PnvMachineState *pnv, void *fdt)
                        &args);
 }
 
-static void pnv_dt_power_mgt(void *fdt)
+static void pnv_dt_power_mgt(PnvMachineState *pnv, void *fdt)
 {
     int off;
 
@@ -540,9 +540,9 @@ static void *pnv_dt_create(MachineState *machine)
         pnv_dt_bmc_sensors(pnv->bmc, fdt);
     }
 
-    /* Create an extra node for power management on Power9 and Power10 */
-    if (pnv_is_power9(pnv) || pnv_is_power10(pnv)) {
-        pnv_dt_power_mgt(fdt);
+    /* Create an extra node for power management on machines that support it */
+    if (pmc->dt_power_mgt) {
+        pmc->dt_power_mgt(pnv, fdt);
     }
 
     return fdt;
@@ -1710,6 +1710,7 @@ static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
 
     pmc->compat = compat;
     pmc->compat_size = sizeof(compat);
+    pmc->dt_power_mgt = pnv_dt_power_mgt;
 }
 
 static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
@@ -1723,6 +1724,7 @@ static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
 
     pmc->compat = compat;
     pmc->compat_size = sizeof(compat);
+    pmc->dt_power_mgt = pnv_dt_power_mgt;
 }
 
 static void pnv_machine_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index d534746bd493..8a42c199b65c 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -190,6 +190,8 @@ PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
 #define PNV_MACHINE_CLASS(klass) \
     OBJECT_CLASS_CHECK(PnvMachineClass, klass, TYPE_PNV_MACHINE)
 
+typedef struct PnvMachineState PnvMachineState;
+
 typedef struct PnvMachineClass {
     /*< private >*/
     MachineClass parent_class;
@@ -197,9 +199,11 @@ typedef struct PnvMachineClass {
     /*< public >*/
     const char *compat;
     int compat_size;
+
+    void (*dt_power_mgt)(PnvMachineState *pnv, void *fdt);
 } PnvMachineClass;
 
-typedef struct PnvMachineState {
+struct PnvMachineState {
     /*< private >*/
     MachineState parent_obj;
 
@@ -216,7 +220,7 @@ typedef struct PnvMachineState {
     Notifier     powerdown_notifier;
 
     PnvPnor      *pnor;
-} PnvMachineState;
+};
 
 static inline bool pnv_chip_is_power9(const PnvChip *chip)
 {


