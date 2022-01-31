Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 577004A46F0
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 13:24:54 +0100 (CET)
Received: from localhost ([::1]:49650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEVjp-0004Rp-Et
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 07:24:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUZ0-0006B9-QY; Mon, 31 Jan 2022 06:09:41 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUYy-00054f-1w; Mon, 31 Jan 2022 06:09:38 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20VA4ms6005157; 
 Mon, 31 Jan 2022 11:08:25 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dwv2wqu1t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:25 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20VB2Oa9011126;
 Mon, 31 Jan 2022 11:08:23 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 3dvw791vaf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:23 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20VB8KQg44958090
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 11:08:20 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A1A311C050;
 Mon, 31 Jan 2022 11:08:20 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2640811C04C;
 Mon, 31 Jan 2022 11:08:20 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 31 Jan 2022 11:08:20 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.57.185])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 498F32201C1;
 Mon, 31 Jan 2022 12:08:19 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 07/41] ppc/xive: check return value of ldq_be_dma()
Date: Mon, 31 Jan 2022 12:07:37 +0100
Message-Id: <20220131110811.619053-8-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131110811.619053-1-clg@kaod.org>
References: <20220131110811.619053-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ezsarR_oLbr6VIwqq0co3N6sOILKFhXk
X-Proofpoint-GUID: ezsarR_oLbr6VIwqq0co3N6sOILKFhXk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_04,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=823 suspectscore=0 spamscore=0 clxscore=1034
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201310074
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ldq_be_dma() routine was recently changed to return a result of
the transaction. Use it when loading the virtual structure descriptors
in the XIVE PowerNV model.

Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20220124081635.3672439-1-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/intc/pnv_xive.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
index bb207514f2dd..621b20a03f5f 100644
--- a/hw/intc/pnv_xive.c
+++ b/hw/intc/pnv_xive.c
@@ -172,7 +172,12 @@ static uint64_t pnv_xive_vst_addr_indirect(PnvXive *=
xive, uint32_t type,
=20
     /* Get the page size of the indirect table. */
     vsd_addr =3D vsd & VSD_ADDRESS_MASK;
-    ldq_be_dma(&address_space_memory, vsd_addr, &vsd, MEMTXATTRS_UNSPECI=
FIED);
+    if (ldq_be_dma(&address_space_memory, vsd_addr, &vsd,
+                    MEMTXATTRS_UNSPECIFIED)) {
+        xive_error(xive, "VST: failed to access %s entry %x @0x%" PRIx64=
,
+                   info->name, idx, vsd_addr);
+        return 0;
+    }
=20
     if (!(vsd & VSD_ADDRESS_MASK)) {
 #ifdef XIVE_DEBUG
@@ -195,8 +200,12 @@ static uint64_t pnv_xive_vst_addr_indirect(PnvXive *=
xive, uint32_t type,
     /* Load the VSD we are looking for, if not already done */
     if (vsd_idx) {
         vsd_addr =3D vsd_addr + vsd_idx * XIVE_VSD_SIZE;
-        ldq_be_dma(&address_space_memory, vsd_addr, &vsd,
-                   MEMTXATTRS_UNSPECIFIED);
+        if (ldq_be_dma(&address_space_memory, vsd_addr, &vsd,
+                       MEMTXATTRS_UNSPECIFIED)) {
+            xive_error(xive, "VST: failed to access %s entry %x @0x%"
+                       PRIx64, info->name, vsd_idx, vsd_addr);
+            return 0;
+        }
=20
         if (!(vsd & VSD_ADDRESS_MASK)) {
 #ifdef XIVE_DEBUG
@@ -543,7 +552,12 @@ static uint64_t pnv_xive_vst_per_subpage(PnvXive *xi=
ve, uint32_t type)
=20
     /* Get the page size of the indirect table. */
     vsd_addr =3D vsd & VSD_ADDRESS_MASK;
-    ldq_be_dma(&address_space_memory, vsd_addr, &vsd, MEMTXATTRS_UNSPECI=
FIED);
+    if (ldq_be_dma(&address_space_memory, vsd_addr, &vsd,
+                   MEMTXATTRS_UNSPECIFIED)) {
+        xive_error(xive, "VST: failed to access %s entry @0x%" PRIx64,
+                   info->name, vsd_addr);
+        return 0;
+    }
=20
     if (!(vsd & VSD_ADDRESS_MASK)) {
 #ifdef XIVE_DEBUG
--=20
2.34.1


