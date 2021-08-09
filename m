Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 277513E4731
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 16:06:24 +0200 (CEST)
Received: from localhost ([::1]:54974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5v5-0005aA-64
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 10:06:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD5bh-0000wQ-Fx; Mon, 09 Aug 2021 09:46:21 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD5bf-00018D-Oe; Mon, 09 Aug 2021 09:46:21 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 179DYNiN045951; Mon, 9 Aug 2021 09:46:07 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aa7pvgufg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 09:46:06 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 179DLjjs002122;
 Mon, 9 Aug 2021 13:46:04 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 3a9ht8umck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 13:46:04 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 179Dk1ra22675812
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Aug 2021 13:46:01 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 93ECCAE05A;
 Mon,  9 Aug 2021 13:46:01 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FFF8AE053;
 Mon,  9 Aug 2021 13:46:01 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  9 Aug 2021 13:46:01 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.54.114])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 86A6B22016C;
 Mon,  9 Aug 2021 15:46:00 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 17/26] ppc/xive2: Add support for notification injection on
 ESB pages
Date: Mon,  9 Aug 2021 15:45:38 +0200
Message-Id: <20210809134547.689560-18-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809134547.689560-1-clg@kaod.org>
References: <20210809134547.689560-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3sTuD9khzkcqev9F6Xfo8T1KIl2ruLp_
X-Proofpoint-GUID: 3sTuD9khzkcqev9F6Xfo8T1KIl2ruLp_
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

This is an internal offset used to inject triggers when the PQ state
bits are not controlled locally. Such as for LSIs when the PHB5 are
using the Address-Based Interrupt Trigger mode and on the END.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/xive.h |  1 +
 hw/intc/xive.c        |  9 +++++++++
 hw/intc/xive2.c       | 10 ++++++++++
 3 files changed, 20 insertions(+)

diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index db7641165484..33a52963cb12 100644
--- a/include/hw/ppc/xive.h
+++ b/include/hw/ppc/xive.h
@@ -278,6 +278,7 @@ uint8_t xive_esb_set(uint8_t *pq, uint8_t value);
 #define XIVE_ESB_STORE_EOI      0x400 /* Store */
 #define XIVE_ESB_LOAD_EOI       0x000 /* Load */
 #define XIVE_ESB_GET            0x800 /* Load */
+#define XIVE_ESB_INJECT         0x800 /* Store */
 #define XIVE_ESB_SET_PQ_00      0xc00 /* Load */
 #define XIVE_ESB_SET_PQ_01      0xd00 /* Load */
 #define XIVE_ESB_SET_PQ_10      0xe00 /* Load */
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index b817ee8e3704..5ecd0bb21c31 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -1077,6 +1077,15 @@ static void xive_source_esb_write(void *opaque, hw=
addr addr,
         notify =3D xive_source_esb_eoi(xsrc, srcno);
         break;
=20
+    /*
+     * This is an internal offset used to inject triggers when the PQ
+     * state bits are not controlled locally. Such as for LSIs when
+     * under ABT mode.
+     */
+    case XIVE_ESB_INJECT ... XIVE_ESB_INJECT + 0x3FF:
+        notify =3D true;
+        break;
+
     case XIVE_ESB_SET_PQ_00 ... XIVE_ESB_SET_PQ_00 + 0x0FF:
     case XIVE_ESB_SET_PQ_01 ... XIVE_ESB_SET_PQ_01 + 0x0FF:
     case XIVE_ESB_SET_PQ_10 ... XIVE_ESB_SET_PQ_10 + 0x0FF:
diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
index 55400628467b..775b9199a5b1 100644
--- a/hw/intc/xive2.c
+++ b/hw/intc/xive2.c
@@ -669,6 +669,16 @@ static void xive2_end_source_write(void *opaque, hwa=
ddr addr,
         notify =3D xive_esb_eoi(&pq);
         break;
=20
+    case XIVE_ESB_INJECT ... XIVE_ESB_INJECT + 0x3FF:
+        if (end_esmask =3D=3D END2_W1_ESe) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "XIVE: END %x/%x can not EQ inject on ESe\n",
+                           end_blk, end_idx);
+            return;
+        }
+        notify =3D true;
+        break;
+
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "XIVE: invalid END ESB write addr=
 %d\n",
                       offset);
--=20
2.31.1


