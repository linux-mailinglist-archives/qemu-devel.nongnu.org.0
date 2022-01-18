Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D8D4928F1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 15:56:38 +0100 (CET)
Received: from localhost ([::1]:53432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9puX-00061j-H7
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 09:56:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDw-0004V0-Ga; Tue, 18 Jan 2022 08:08:32 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:41078
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDn-0000Hf-Dj; Tue, 18 Jan 2022 08:08:26 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20ICT5Fe021742; 
 Tue, 18 Jan 2022 13:07:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dnqv4huhe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:54 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20ID091T027874;
 Tue, 18 Jan 2022 13:07:54 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dnqv4hugj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:54 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20ID7d5i025814;
 Tue, 18 Jan 2022 13:07:52 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3dknw9mhcp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:52 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20ID7oGk47645090
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 13:07:50 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E71E7A405C;
 Tue, 18 Jan 2022 13:07:49 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A23F7A405B;
 Tue, 18 Jan 2022 13:07:49 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 18 Jan 2022 13:07:49 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.52.153])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id E3E8922016C;
 Tue, 18 Jan 2022 14:07:48 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 26/31] ppc/pnv: make PECs create and realize PHB4s
Date: Tue, 18 Jan 2022 14:07:25 +0100
Message-Id: <20220118130730.1927983-27-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118130730.1927983-1-clg@kaod.org>
References: <20220118130730.1927983-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: swzg27YjwpFx4sqvuKmZ7fit3PV0iJbD
X-Proofpoint-ORIG-GUID: 6L7n_NjBgXvHFON_tXSpb9EmdrLYXttV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-18_03,2022-01-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1034
 impostorscore=0 priorityscore=1501 spamscore=0 mlxlogscore=599
 suspectscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201180081
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.322,
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

From: Daniel Henrique Barboza <danielhb413@gmail.com>

This patch changes the design of the PEC device to create and realize PHB=
4s
instead of PecStacks. After all the recent changes, PHB4s now contain all
the information needed for their proper functioning, not relying on PecSt=
ack
in any capacity.

All changes are being made in a single patch to avoid renaming parts of
the PecState and leaving the code in a strange way. E.g. rename
PecClass->num_stacks to num_phbs, which would then read a
pnv_pec_num_stacks[] array. To avoid mixing the old and new design more
than necessary it's clearer to do these changes in a single step.

The name changes made are:

- in PnvPhb4PecState:
  * rename 'num_stacks' to 'num_phbs'
  * remove the pec->stacks[] array. Current code relies on the
pec->stacks[] obj acting as a simple container, without ever accessing
pec->stacks[] for any other purpose. Instead of converting this into a
pec->phbs[] array, remove it

- in PnvPhb4PecClass, rename *num_stacks to *num_phbs;

- pnv_pec_num_stacks[] is renamed to pnv_pec_num_phbs[].

The logical changes:

- pnv_pec_default_phb_realize():
  * init and set the properties of the PnvPHB4 qdev
  * do not use stack->phb anymore;

- pnv_pec_realize():
  * use the new default_phb_realize() to init/realize each PHB if
running with defaults;

- pnv_pec_instance_init(): removed since we're creating the PHBs during
pec_realize();

- pnv_phb4_get_stack():
  * renamed to pnv_phb4_get_pec() and returns a PnvPhb4PecState*;

- pnv_phb4_realize(): use 'phb->pec' instead of 'stack'.

This design change shouldn't caused any behavioral change in the runtime
of the machine.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20220114180719.52117-7-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb4.h |  8 ++---
 hw/pci-host/pnv_phb4.c         | 26 ++++++--------
 hw/pci-host/pnv_phb4_pec.c     | 66 ++++++++++------------------------
 3 files changed, 31 insertions(+), 69 deletions(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb=
4.h
index 2be56b7afde1..e750165e7703 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -200,10 +200,8 @@ struct PnvPhb4PecState {
     uint64_t pci_regs[PHB4_PEC_PCI_REGS_COUNT];
     MemoryRegion pci_regs_mr;
=20
-    /* Stacks */
-    #define PHB4_PEC_MAX_STACKS     3
-    uint32_t num_stacks;
-    PnvPhb4PecStack stacks[PHB4_PEC_MAX_STACKS];
+    /* PHBs */
+    uint32_t num_phbs;
=20
     PnvChip *chip;
 };
@@ -221,7 +219,7 @@ struct PnvPhb4PecClass {
     const char *stk_compat;
     int stk_compat_size;
     uint64_t version;
-    const uint32_t *num_stacks;
+    const uint32_t *num_phbs;
 };
=20
 #endif /* PCI_HOST_PNV_PHB4_H */
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 2efd34518e7f..3dc3c70cb2d4 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -884,7 +884,7 @@ static int pnv_phb4_get_phb_stack_no(PnvPHB4 *phb)
     int stack_no =3D phb->phb_id;
=20
     while (index--) {
-        stack_no -=3D pecc->num_stacks[index];
+        stack_no -=3D pecc->num_phbs[index];
     }
=20
     return stack_no;
@@ -1383,7 +1383,7 @@ int pnv_phb4_pec_get_phb_id(PnvPhb4PecState *pec, i=
nt stack_index)
     int offset =3D 0;
=20
     while (index--) {
-        offset +=3D pecc->num_stacks[index];
+        offset +=3D pecc->num_phbs[index];
     }
=20
     return offset + stack_index;
@@ -1534,8 +1534,8 @@ static void pnv_phb4_instance_init(Object *obj)
     object_initialize_child(obj, "source", &phb->xsrc, TYPE_XIVE_SOURCE)=
;
 }
=20
-static PnvPhb4PecStack *pnv_phb4_get_stack(PnvChip *chip, PnvPHB4 *phb,
-                                           Error **errp)
+static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
+                                         Error **errp)
 {
     Pnv9Chip *chip9 =3D PNV9_CHIP(chip);
     int chip_id =3D phb->chip_id;
@@ -1544,14 +1544,14 @@ static PnvPhb4PecStack *pnv_phb4_get_stack(PnvChi=
p *chip, PnvPHB4 *phb,
=20
     for (i =3D 0; i < chip->num_pecs; i++) {
         /*
-         * For each PEC, check the amount of stacks it supports
-         * and see if the given phb4 index matches a stack.
+         * For each PEC, check the amount of phbs it supports
+         * and see if the given phb4 index matches an index.
          */
         PnvPhb4PecState *pec =3D &chip9->pecs[i];
=20
-        for (j =3D 0; j < pec->num_stacks; j++) {
+        for (j =3D 0; j < pec->num_phbs; j++) {
             if (index =3D=3D pnv_phb4_pec_get_phb_id(pec, j)) {
-                return &pec->stacks[j];
+                return pec;
             }
         }
     }
@@ -1576,7 +1576,6 @@ static void pnv_phb4_realize(DeviceState *dev, Erro=
r **errp)
     if (!phb->pec) {
         PnvMachineState *pnv =3D PNV_MACHINE(qdev_get_machine());
         PnvChip *chip =3D pnv_get_chip(pnv, phb->chip_id);
-        PnvPhb4PecStack *stack;
         PnvPhb4PecClass *pecc;
         BusState *s;
=20
@@ -1585,18 +1584,13 @@ static void pnv_phb4_realize(DeviceState *dev, Er=
ror **errp)
             return;
         }
=20
-        stack =3D pnv_phb4_get_stack(chip, phb, &local_err);
+        phb->pec =3D pnv_phb4_get_pec(chip, phb, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
             return;
         }
=20
-        /*
-         * All other phb properties but 'pec' ad 'version' are
-         * already set.
-         */
-        object_property_set_link(OBJECT(phb), "pec", OBJECT(stack->pec),
-                                 &error_abort);
+        /* All other phb properties are already set */
         pecc =3D PNV_PHB4_PEC_GET_CLASS(phb->pec);
         object_property_set_int(OBJECT(phb), "version", pecc->version,
                                 &error_fatal);
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index d6405d6ca336..852816b9f83b 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -112,41 +112,28 @@ static const MemoryRegionOps pnv_pec_pci_xscom_ops =
=3D {
     .endianness =3D DEVICE_BIG_ENDIAN,
 };
=20
-static void pnv_pec_default_phb_realize(PnvPhb4PecStack *stack,
+static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
                                         int stack_no,
                                         Error **errp)
 {
-    PnvPhb4PecState *pec =3D stack->pec;
+    PnvPHB4 *phb =3D PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
     PnvPhb4PecClass *pecc =3D PNV_PHB4_PEC_GET_CLASS(pec);
     int phb_id =3D pnv_phb4_pec_get_phb_id(pec, stack_no);
=20
-    stack->phb =3D PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
-
-    object_property_set_link(OBJECT(stack->phb), "pec", OBJECT(pec),
+    object_property_set_link(OBJECT(phb), "pec", OBJECT(pec),
                              &error_abort);
-    object_property_set_int(OBJECT(stack->phb), "chip-id", pec->chip_id,
+    object_property_set_int(OBJECT(phb), "chip-id", pec->chip_id,
                             &error_fatal);
-    object_property_set_int(OBJECT(stack->phb), "index", phb_id,
+    object_property_set_int(OBJECT(phb), "index", phb_id,
                             &error_fatal);
-    object_property_set_int(OBJECT(stack->phb), "version", pecc->version=
,
+    object_property_set_int(OBJECT(phb), "version", pecc->version,
                             &error_fatal);
=20
-    if (!sysbus_realize(SYS_BUS_DEVICE(stack->phb), errp)) {
+    if (!sysbus_realize(SYS_BUS_DEVICE(phb), errp)) {
         return;
     }
 }
=20
-static void pnv_pec_instance_init(Object *obj)
-{
-    PnvPhb4PecState *pec =3D PNV_PHB4_PEC(obj);
-    int i;
-
-    for (i =3D 0; i < PHB4_PEC_MAX_STACKS; i++) {
-        object_initialize_child(obj, "stack[*]", &pec->stacks[i],
-                                TYPE_PNV_PHB4_PEC_STACK);
-    }
-}
-
 static void pnv_pec_realize(DeviceState *dev, Error **errp)
 {
     PnvPhb4PecState *pec =3D PNV_PHB4_PEC(dev);
@@ -159,29 +146,13 @@ static void pnv_pec_realize(DeviceState *dev, Error=
 **errp)
         return;
     }
=20
-    pec->num_stacks =3D pecc->num_stacks[pec->index];
-
-    /* Create stacks */
-    for (i =3D 0; i < pec->num_stacks; i++) {
-        PnvPhb4PecStack *stack =3D &pec->stacks[i];
-        Object *stk_obj =3D OBJECT(stack);
-
-        object_property_set_link(stk_obj, "pec", OBJECT(pec), &error_abo=
rt);
+    pec->num_phbs =3D pecc->num_phbs[pec->index];
=20
-        if (defaults_enabled()) {
-            pnv_pec_default_phb_realize(stack, i, errp);
+    /* Create PHBs if running with defaults */
+    if (defaults_enabled()) {
+        for (i =3D 0; i < pec->num_phbs; i++) {
+            pnv_pec_default_phb_realize(pec, i, errp);
         }
-
-        /*
-         * qdev gets angry if we don't realize 'stack' here, even
-         * if stk_realize() is now empty.
-         */
-        if (!qdev_realize(DEVICE(stk_obj), NULL, errp)) {
-            return;
-        }
-    }
-    for (; i < PHB4_PEC_MAX_STACKS; i++) {
-        object_unparent(OBJECT(&pec->stacks[i]));
     }
=20
     /* Initialize the XSCOM regions for the PEC registers */
@@ -227,7 +198,7 @@ static int pnv_pec_dt_xscom(PnvXScomInterface *dev, v=
oid *fdt,
     _FDT((fdt_setprop(fdt, offset, "compatible", pecc->compat,
                       pecc->compat_size)));
=20
-    for (i =3D 0; i < pec->num_stacks; i++) {
+    for (i =3D 0; i < pec->num_phbs; i++) {
         int phb_id =3D pnv_phb4_pec_get_phb_id(pec, i);
         int stk_offset;
=20
@@ -263,11 +234,11 @@ static uint32_t pnv_pec_xscom_nest_base(PnvPhb4PecS=
tate *pec)
 }
=20
 /*
- * PEC0 -> 1 stack
- * PEC1 -> 2 stacks
- * PEC2 -> 3 stacks
+ * PEC0 -> 1 phb
+ * PEC1 -> 2 phb
+ * PEC2 -> 3 phbs
  */
-static const uint32_t pnv_pec_num_stacks[] =3D { 1, 2, 3 };
+static const uint32_t pnv_pec_num_phbs[] =3D { 1, 2, 3 };
=20
 static void pnv_pec_class_init(ObjectClass *klass, void *data)
 {
@@ -292,14 +263,13 @@ static void pnv_pec_class_init(ObjectClass *klass, =
void *data)
     pecc->stk_compat =3D stk_compat;
     pecc->stk_compat_size =3D sizeof(stk_compat);
     pecc->version =3D PNV_PHB4_VERSION;
-    pecc->num_stacks =3D pnv_pec_num_stacks;
+    pecc->num_phbs =3D pnv_pec_num_phbs;
 }
=20
 static const TypeInfo pnv_pec_type_info =3D {
     .name          =3D TYPE_PNV_PHB4_PEC,
     .parent        =3D TYPE_DEVICE,
     .instance_size =3D sizeof(PnvPhb4PecState),
-    .instance_init =3D pnv_pec_instance_init,
     .class_init    =3D pnv_pec_class_init,
     .class_size    =3D sizeof(PnvPhb4PecClass),
     .interfaces    =3D (InterfaceInfo[]) {
--=20
2.31.1


