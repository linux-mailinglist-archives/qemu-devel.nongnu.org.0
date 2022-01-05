Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798E5485072
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 10:55:27 +0100 (CET)
Received: from localhost ([::1]:42230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n530w-0000I0-K9
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 04:55:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n52xj-0006ze-KC; Wed, 05 Jan 2022 04:52:07 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:15226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n52xh-0003fv-Pa; Wed, 05 Jan 2022 04:52:07 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2058oEKv031003; 
 Wed, 5 Jan 2022 09:51:49 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcp2quray-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 09:51:49 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2059oqgO025027;
 Wed, 5 Jan 2022 09:51:47 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 3daek9f07g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 09:51:47 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2059pj1i48169370
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Jan 2022 09:51:45 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 06F1D52050;
 Wed,  5 Jan 2022 09:51:45 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id B99B552052;
 Wed,  5 Jan 2022 09:51:44 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.19])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 041F02201EB;
 Wed,  5 Jan 2022 10:51:43 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/ppc: Add popcntb instruction to POWER5+ processors
Date: Wed,  5 Jan 2022 10:51:41 +0100
Message-Id: <20220105095142.3990430-2-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220105095142.3990430-1-clg@kaod.org>
References: <20220105095142.3990430-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hQFzafWgcyCTov45gHz4dcJvWbbN-d7p
X-Proofpoint-ORIG-GUID: hQFzafWgcyCTov45gHz4dcJvWbbN-d7p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_02,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 mlxscore=0
 mlxlogscore=990 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1034
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201050063
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

popcntb instruction was added in ISA v2.02. Add support for POWER5+
processors since they implement ISA v2.03.

PPC970 CPUs implement v2.01 and do not support popcntb.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu_init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index cc93bff3fac4..f15a52259c90 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6957,6 +6957,7 @@ POWERPC_FAMILY(POWER5P)(ObjectClass *oc, void *data=
)
                        PPC_MEM_SYNC | PPC_MEM_EIEIO |
                        PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
                        PPC_64B |
+                       PPC_POPCNTB |
                        PPC_SEGMENT_64B | PPC_SLBI;
     pcc->insns_flags2 =3D PPC2_FP_CVT_S64;
     pcc->msr_mask =3D (1ull << MSR_SF) |
--=20
2.31.1


