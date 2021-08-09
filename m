Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9963A3E46E3
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:48:21 +0200 (CEST)
Received: from localhost ([::1]:59282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5dc-0003HA-CK
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD5bU-0000HH-BQ; Mon, 09 Aug 2021 09:46:08 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:2356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD5bS-0000vp-4i; Mon, 09 Aug 2021 09:46:08 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 179DYNmn045987; Mon, 9 Aug 2021 09:45:59 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aa7pvgucs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 09:45:59 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 179DdoDp031160;
 Mon, 9 Aug 2021 13:45:57 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 3a9hehknch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 13:45:56 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 179Djsx548431480
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Aug 2021 13:45:54 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 753D64C072;
 Mon,  9 Aug 2021 13:45:54 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F9344C063;
 Mon,  9 Aug 2021 13:45:54 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  9 Aug 2021 13:45:54 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.54.114])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 68DF622016C;
 Mon,  9 Aug 2021 15:45:53 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 07/26] ppc/xive: Export PQ get/set routines
Date: Mon,  9 Aug 2021 15:45:28 +0200
Message-Id: <20210809134547.689560-8-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809134547.689560-1-clg@kaod.org>
References: <20210809134547.689560-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nhHkeuVkLZuxc1aDtyh-SZdxX_awsONK
X-Proofpoint-GUID: nhHkeuVkLZuxc1aDtyh-SZdxX_awsONK
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_04:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 impostorscore=0 clxscore=1034 adultscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108090101
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

These will be shared with the XIVE2 router.

Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/xive.h    | 4 ++++
 hw/intc/spapr_xive_kvm.c | 8 ++++----
 hw/intc/xive.c           | 6 +++---
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index 445eccfe6b73..7e25c25bfda2 100644
--- a/include/hw/ppc/xive.h
+++ b/include/hw/ppc/xive.h
@@ -261,6 +261,10 @@ static inline hwaddr xive_source_esb_mgmt(XiveSource=
 *xsrc, int srcno)
 #define XIVE_ESB_QUEUED       (XIVE_ESB_VAL_P | XIVE_ESB_VAL_Q)
 #define XIVE_ESB_OFF          XIVE_ESB_VAL_Q
=20
+bool xive_esb_trigger(uint8_t *pq);
+bool xive_esb_eoi(uint8_t *pq);
+uint8_t xive_esb_set(uint8_t *pq, uint8_t value);
+
 /*
  * "magic" Event State Buffer (ESB) MMIO offsets.
  *
diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index c00833116071..3e534b9685bf 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -297,7 +297,7 @@ static uint8_t xive_esb_read(XiveSource *xsrc, int sr=
cno, uint32_t offset)
     return xive_esb_rw(xsrc, srcno, offset, 0, 0) & 0x3;
 }
=20
-static void xive_esb_trigger(XiveSource *xsrc, int srcno)
+static void kvmppc_xive_esb_trigger(XiveSource *xsrc, int srcno)
 {
     uint64_t *addr =3D xsrc->esb_mmap + xive_source_esb_page(xsrc, srcno=
);
=20
@@ -322,7 +322,7 @@ uint64_t kvmppc_xive_esb_rw(XiveSource *xsrc, int src=
no, uint32_t offset,
         offset =3D=3D XIVE_ESB_LOAD_EOI) {
         xive_esb_read(xsrc, srcno, XIVE_ESB_SET_PQ_00);
         if (xsrc->status[srcno] & XIVE_STATUS_ASSERTED) {
-            xive_esb_trigger(xsrc, srcno);
+            kvmppc_xive_esb_trigger(xsrc, srcno);
         }
         return 0;
     } else {
@@ -366,7 +366,7 @@ void kvmppc_xive_source_set_irq(void *opaque, int src=
no, int val)
         }
     }
=20
-    xive_esb_trigger(xsrc, srcno);
+    kvmppc_xive_esb_trigger(xsrc, srcno);
 }
=20
 /*
@@ -533,7 +533,7 @@ static void kvmppc_xive_change_state_handler(void *op=
aque, bool running,
              * generate a trigger.
              */
             if (pq =3D=3D XIVE_ESB_RESET && old_pq =3D=3D XIVE_ESB_QUEUE=
D) {
-                xive_esb_trigger(xsrc, i);
+                kvmppc_xive_esb_trigger(xsrc, i);
             }
         }
=20
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index eeb4e62ba954..5ec61ec14e68 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -816,7 +816,7 @@ void xive_tctx_destroy(XiveTCTX *tctx)
  * XIVE ESB helpers
  */
=20
-static uint8_t xive_esb_set(uint8_t *pq, uint8_t value)
+uint8_t xive_esb_set(uint8_t *pq, uint8_t value)
 {
     uint8_t old_pq =3D *pq & 0x3;
=20
@@ -826,7 +826,7 @@ static uint8_t xive_esb_set(uint8_t *pq, uint8_t valu=
e)
     return old_pq;
 }
=20
-static bool xive_esb_trigger(uint8_t *pq)
+bool xive_esb_trigger(uint8_t *pq)
 {
     uint8_t old_pq =3D *pq & 0x3;
=20
@@ -846,7 +846,7 @@ static bool xive_esb_trigger(uint8_t *pq)
     }
 }
=20
-static bool xive_esb_eoi(uint8_t *pq)
+bool xive_esb_eoi(uint8_t *pq)
 {
     uint8_t old_pq =3D *pq & 0x3;
=20
--=20
2.31.1


