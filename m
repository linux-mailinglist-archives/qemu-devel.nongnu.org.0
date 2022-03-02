Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6844CA4DA
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 13:32:01 +0100 (CET)
Received: from localhost ([::1]:54748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPO9A-0001Wa-PC
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 07:32:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrK-0001Va-TT; Wed, 02 Mar 2022 06:09:30 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:15954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrG-0001vm-Vf; Wed, 02 Mar 2022 06:09:30 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2229rbQ7026374; 
 Wed, 2 Mar 2022 11:08:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej6bpsevg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:56 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 222A1kl3022377;
 Wed, 2 Mar 2022 11:08:56 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej6bpsetn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:56 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2dZ6022351;
 Wed, 2 Mar 2022 11:08:53 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 3efbu9d1wq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:53 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8pxv58720600
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:51 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B10D11C05C;
 Wed,  2 Mar 2022 11:08:51 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0185611C054;
 Wed,  2 Mar 2022 11:08:51 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:50 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 5629C2201C1;
 Wed,  2 Mar 2022 12:08:50 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 64/87] ppc/xive2: Add support for notification injection on ESB
 pages
Date: Wed,  2 Mar 2022 12:07:40 +0100
Message-Id: <20220302110803.849505-65-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pW-WEy-PEIk5D-lnkmM7ZuTZS4dT_LTC
X-Proofpoint-ORIG-GUID: MkhQEix0zMMJtcfLhPTegoqgo-8MZFBc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 spamscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020047
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an internal offset used to inject triggers when the PQ state
bits are not controlled locally. Such as for LSIs when the PHB5 are
using the Address-Based Interrupt Trigger mode and on the END.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/xive.h |  1 +
 hw/intc/xive.c        |  9 +++++++++
 hw/intc/xive2.c       | 10 ++++++++++
 3 files changed, 20 insertions(+)

diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index b8ab0bf7490f..875c7f639689 100644
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
index f15f98588a71..0d98b9539cd9 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -1061,6 +1061,15 @@ static void xive_source_esb_write(void *opaque, hw=
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
index 8f278f3bf680..2836bbdc83fc 100644
--- a/hw/intc/xive2.c
+++ b/hw/intc/xive2.c
@@ -659,6 +659,16 @@ static void xive2_end_source_write(void *opaque, hwa=
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
2.34.1


