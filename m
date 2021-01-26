Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6517D30448D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 18:14:19 +0100 (CET)
Received: from localhost ([::1]:53212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Rv0-0002cz-ET
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 12:14:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1l4RsE-0000qc-VO; Tue, 26 Jan 2021 12:11:26 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:17084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1l4RsC-0007BZ-Pj; Tue, 26 Jan 2021 12:11:26 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10QH1dbM128401; Tue, 26 Jan 2021 12:11:09 -0500
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36apmqs5dw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jan 2021 12:11:09 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10QGwd1U008951;
 Tue, 26 Jan 2021 17:11:08 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 368be89j46-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jan 2021 17:11:07 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10QHB55E44433744
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jan 2021 17:11:05 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53DF8A4054;
 Tue, 26 Jan 2021 17:11:05 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 191C6A4066;
 Tue, 26 Jan 2021 17:11:05 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 26 Jan 2021 17:11:05 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-70-48.uk.ibm.com [9.145.70.48])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 6223922010B;
 Tue, 26 Jan 2021 18:11:04 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 5/7] ppc/pnv: Discard internal BMC initialization when BMC is
 external
Date: Tue, 26 Jan 2021 18:10:57 +0100
Message-Id: <20210126171059.307867-6-clg@kaod.org>
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
 lowpriorityscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1034 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2101260086
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

The PowerNV machine can be run with an external IPMI BMC device
connected to a remote QEMU machine acting as BMC, using these options :

  -chardev socket,id=3Dipmi0,host=3Dlocalhost,port=3D9002,reconnect=3D10 =
\
  -device ipmi-bmc-extern,id=3Dbmc0,chardev=3Dipmi0 \
  -device isa-ipmi-bt,bmc=3Dbmc0,irq=3D10 \
  -nodefaults

In that case, some aspects of the BMC initialization should be
skipped, since they rely on the simulator interface.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/pnv_bmc.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
index 86d16b493539..b9bf5735ea0f 100644
--- a/hw/ppc/pnv_bmc.c
+++ b/hw/ppc/pnv_bmc.c
@@ -51,6 +51,11 @@ typedef struct OemSel {
 #define SOFT_OFF        0x00
 #define SOFT_REBOOT     0x01
=20
+static bool pnv_bmc_is_simulator(IPMIBmc *bmc)
+{
+    return object_dynamic_cast(OBJECT(bmc), TYPE_IPMI_BMC_SIMULATOR);
+}
+
 static void pnv_gen_oem_sel(IPMIBmc *bmc, uint8_t reboot)
 {
     /* IPMI SEL Event are 16 bytes long */
@@ -79,6 +84,10 @@ void pnv_dt_bmc_sensors(IPMIBmc *bmc, void *fdt)
     const struct ipmi_sdr_compact *sdr;
     uint16_t nextrec;
=20
+    if (!pnv_bmc_is_simulator(bmc)) {
+        return;
+    }
+
     offset =3D fdt_add_subnode(fdt, 0, "bmc");
     _FDT(offset);
=20
@@ -243,6 +252,10 @@ static const IPMINetfn hiomap_netfn =3D {
=20
 void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor)
 {
+    if (!pnv_bmc_is_simulator(bmc)) {
+        return;
+    }
+
     object_ref(OBJECT(pnor));
     object_property_add_const_link(OBJECT(bmc), "pnor", OBJECT(pnor));
=20
@@ -286,7 +299,7 @@ static int bmc_find(Object *child, void *opaque)
=20
 IPMIBmc *pnv_bmc_find(Error **errp)
 {
-    ForeachArgs args =3D { TYPE_IPMI_BMC_SIMULATOR, NULL };
+    ForeachArgs args =3D { TYPE_IPMI_BMC, NULL };
     int ret;
=20
     ret =3D object_child_foreach_recursive(object_get_root(), bmc_find, =
&args);
--=20
2.26.2


