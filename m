Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FB54CA53F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 13:52:31 +0100 (CET)
Received: from localhost ([::1]:54820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPOSz-0005SB-O9
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 07:52:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrP-0001gZ-4A; Wed, 02 Mar 2022 06:09:35 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35010
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrM-0001yS-R4; Wed, 02 Mar 2022 06:09:34 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222ANkE0021018; 
 Wed, 2 Mar 2022 11:09:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej6sr0uma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:09:09 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 222AYdhK027770;
 Wed, 2 Mar 2022 11:09:09 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej6sr0ujw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:09:09 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2ofU009544;
 Wed, 2 Mar 2022 11:09:07 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 3efbfj549k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:09:07 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B94ad33685814
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:09:05 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1B4F4C050;
 Wed,  2 Mar 2022 11:09:04 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F1154C046;
 Wed,  2 Mar 2022 11:09:04 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:09:04 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id B6D9C220294;
 Wed,  2 Mar 2022 12:09:03 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 85/87] spapr_pci_nvlink2.c: use g_autofree in
 spapr_phb_nvgpu_ram_populate_dt()
Date: Wed,  2 Mar 2022 12:08:01 +0100
Message-Id: <20220302110803.849505-86-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: b5aIGndvgLCKmva7weuJrfTr-zSniWOu
X-Proofpoint-GUID: oakizO8YcNsCkAjBFo0gvzT5byvc_p1A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1034 mlxscore=0
 mlxlogscore=641 classifier=spam adjust=0 reason=mlx scancount=1
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
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <20220228175004.8862-13-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/spapr_pci_nvlink2.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/spapr_pci_nvlink2.c b/hw/ppc/spapr_pci_nvlink2.c
index 7fb0cf4d0443..4678c79235f6 100644
--- a/hw/ppc/spapr_pci_nvlink2.c
+++ b/hw/ppc/spapr_pci_nvlink2.c
@@ -320,7 +320,7 @@ void spapr_phb_nvgpu_populate_dt(SpaprPhbState *sphb,=
 void *fdt, int bus_off,
 void spapr_phb_nvgpu_ram_populate_dt(SpaprPhbState *sphb, void *fdt)
 {
     int i, j, linkidx, npuoff;
-    char *npuname;
+    g_autofree char *npuname =3D NULL;
=20
     if (!sphb->nvgpus) {
         return;
@@ -333,11 +333,10 @@ void spapr_phb_nvgpu_ram_populate_dt(SpaprPhbState =
*sphb, void *fdt)
     _FDT(fdt_setprop_cell(fdt, npuoff, "#size-cells", 0));
     /* Advertise NPU as POWER9 so the guest can enable NPU2 contexts */
     _FDT((fdt_setprop_string(fdt, npuoff, "compatible", "ibm,power9-npu"=
)));
-    g_free(npuname);
=20
     for (i =3D 0, linkidx =3D 0; i < sphb->nvgpus->num; ++i) {
         for (j =3D 0; j < sphb->nvgpus->slots[i].linknum; ++j) {
-            char *linkname =3D g_strdup_printf("link@%d", linkidx);
+            g_autofree char *linkname =3D g_strdup_printf("link@%d", lin=
kidx);
             int off =3D fdt_add_subnode(fdt, npuoff, linkname);
=20
             _FDT(off);
@@ -347,7 +346,6 @@ void spapr_phb_nvgpu_ram_populate_dt(SpaprPhbState *s=
phb, void *fdt)
             _FDT((fdt_setprop_cell(fdt, off, "phandle",
                                    PHANDLE_NVLINK(sphb, i, j))));
             _FDT((fdt_setprop_cell(fdt, off, "ibm,npu-link-index", linki=
dx)));
-            g_free(linkname);
             ++linkidx;
         }
     }
@@ -360,7 +358,8 @@ void spapr_phb_nvgpu_ram_populate_dt(SpaprPhbState *s=
phb, void *fdt)
                                                     &error_abort);
         uint64_t size =3D object_property_get_uint(nv_mrobj, "size", NUL=
L);
         uint64_t mem_reg[2] =3D { cpu_to_be64(nvslot->gpa), cpu_to_be64(=
size) };
-        char *mem_name =3D g_strdup_printf("memory@%"PRIx64, nvslot->gpa=
);
+        g_autofree char *mem_name =3D g_strdup_printf("memory@%"PRIx64,
+                                                    nvslot->gpa);
         int off =3D fdt_add_subnode(fdt, 0, mem_name);
=20
         _FDT(off);
@@ -378,7 +377,6 @@ void spapr_phb_nvgpu_ram_populate_dt(SpaprPhbState *s=
phb, void *fdt)
                           sizeof(mem_reg))));
         _FDT((fdt_setprop_cell(fdt, off, "phandle",
                                PHANDLE_GPURAM(sphb, i))));
-        g_free(mem_name);
     }
=20
 }
--=20
2.34.1


