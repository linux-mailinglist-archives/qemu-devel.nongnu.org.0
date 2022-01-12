Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 934F648C451
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 14:01:21 +0100 (CET)
Received: from localhost ([::1]:44362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7dFg-0003mq-Lm
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 08:01:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cEy-0006Wg-Cp; Wed, 12 Jan 2022 06:56:32 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33304
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cEv-0007Wx-Fg; Wed, 12 Jan 2022 06:56:31 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CBLNsR019418; 
 Wed, 12 Jan 2022 11:56:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dhx1us80y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:23 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CBb5gL002051;
 Wed, 12 Jan 2022 11:56:23 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dhx1us7yy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:23 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CBmRb9031228;
 Wed, 12 Jan 2022 11:56:21 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 3df289h2vd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:21 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20CBuIX429032860
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 11:56:18 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A2CDBA4E25;
 Wed, 12 Jan 2022 11:56:18 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5EE78A4E12;
 Wed, 12 Jan 2022 11:56:18 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 12 Jan 2022 11:56:18 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.95])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A2FA82201C6;
 Wed, 12 Jan 2022 12:56:17 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 23/34] ppc/pnv: Complete user created PHB3 devices
Date: Wed, 12 Jan 2022 12:55:40 +0100
Message-Id: <20220112115551.987666-24-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112115551.987666-1-clg@kaod.org>
References: <20220112115551.987666-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YRfncmpcVUsHjZpIKunxyz7PkJaoa8bX
X-Proofpoint-ORIG-GUID: G2ST7rxO6GD5c9Fip150nmKYhFm8kToB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1034 phishscore=0 priorityscore=1501
 mlxlogscore=766 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120075
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.398,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PHB3s ared SysBus devices and should be allowed to be dynamically
created.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20220105212338.49899-9-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb3.c | 9 +++++++++
 hw/ppc/pnv.c           | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index a52aedcad31b..7fb35dc03147 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -993,6 +993,9 @@ static void pnv_phb3_realize(DeviceState *dev, Error =
**errp)
=20
     /* User created devices */
     if (!phb->chip) {
+        Error *local_err =3D NULL;
+        BusState *s;
+
         phb->chip =3D pnv_get_chip(pnv, phb->chip_id);
         if (!phb->chip) {
             error_setg(errp, "invalid chip id: %d", phb->chip_id);
@@ -1004,6 +1007,12 @@ static void pnv_phb3_realize(DeviceState *dev, Err=
or **errp)
          * correctly the device tree.
          */
         pnv_chip_parent_fixup(phb->chip, OBJECT(phb), phb->phb_id);
+
+        s =3D qdev_get_parent_bus(DEVICE(phb->chip));
+        if (!qdev_set_parent_bus(DEVICE(phb), s, &local_err)) {
+            error_propagate(errp, local_err);
+            return;
+        }
     }
=20
     if (phb->phb_id >=3D PNV_CHIP_GET_CLASS(phb->chip)->num_phbs) {
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index fa5e7bc75192..8dc63823573e 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1941,6 +1941,8 @@ static void pnv_machine_power8_class_init(ObjectCla=
ss *oc, void *data)
=20
     pmc->compat =3D compat;
     pmc->compat_size =3D sizeof(compat);
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB3);
 }
=20
 static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
--=20
2.31.1


