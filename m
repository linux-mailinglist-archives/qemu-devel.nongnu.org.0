Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A00482297
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 08:41:12 +0100 (CET)
Received: from localhost ([::1]:33302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3CXH-00013C-Nm
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 02:41:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n3COF-0006Zi-4a; Fri, 31 Dec 2021 02:31:51 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:7160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n3COD-0002tn-4Y; Fri, 31 Dec 2021 02:31:50 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BV7S0Wl010346; 
 Fri, 31 Dec 2021 07:31:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d9rv2kxyk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Dec 2021 07:31:30 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BV7SgKK013867;
 Fri, 31 Dec 2021 07:31:30 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d9rv2kxxw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Dec 2021 07:31:29 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BV78ZQt002460;
 Fri, 31 Dec 2021 07:31:27 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3d5txb8nxy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Dec 2021 07:31:27 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BV7VPti47972676
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Dec 2021 07:31:25 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 069E6A4060;
 Fri, 31 Dec 2021 07:31:25 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ADAA4A405B;
 Fri, 31 Dec 2021 07:31:24 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 31 Dec 2021 07:31:24 +0000 (GMT)
Received: from yukon.home (unknown [9.171.29.114])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 8AE712201BB;
 Fri, 31 Dec 2021 08:31:23 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] target/ppc: Check effective address validity
Date: Fri, 31 Dec 2021 08:31:22 +0100
Message-Id: <20211231073122.3183583-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CIdEwlmRMIHPr8gZl208NR1-JbXJnHVM
X-Proofpoint-GUID: 0sisZ_8g-__Tfju92d2OhTKfv1mCYLQ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-31_02,2021-12-30_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=792 suspectscore=0 clxscore=1034 phishscore=0 spamscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112310034
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 7
X-Spam_score: 0.7
X-Spam_bar: /
X-Spam_report: (0.7 / 5.0 requ) RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For Radix translation, the EA range is 64-bits. when EA(2:11) are
nonzero, a segment interrupt should occur.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/mmu-radix64.h | 1 +
 target/ppc/mmu-radix64.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/target/ppc/mmu-radix64.h b/target/ppc/mmu-radix64.h
index b70357cf345c..4c768aa5cc74 100644
--- a/target/ppc/mmu-radix64.h
+++ b/target/ppc/mmu-radix64.h
@@ -5,6 +5,7 @@
=20
 /* Radix Quadrants */
 #define R_EADDR_MASK            0x3FFFFFFFFFFFFFFF
+#define R_EADDR_VALID_MASK      0xC00FFFFFFFFFFFFF
 #define R_EADDR_QUADRANT        0xC000000000000000
 #define R_EADDR_QUADRANT0       0x0000000000000000
 #define R_EADDR_QUADRANT1       0x4000000000000000
diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index d10ae001d7c9..040c055bff65 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -32,6 +32,11 @@ static bool ppc_radix64_get_fully_qualified_addr(const=
 CPUPPCState *env,
                                                  vaddr eaddr,
                                                  uint64_t *lpid, uint64_=
t *pid)
 {
+    /* When EA(2:11) are nonzero, raise a segment interrupt */
+    if (eaddr & ~R_EADDR_VALID_MASK) {
+        return false;
+    }
+
     if (msr_hv) { /* MSR[HV] -> Hypervisor/bare metal */
         switch (eaddr & R_EADDR_QUADRANT) {
         case R_EADDR_QUADRANT0:
--=20
2.31.1


