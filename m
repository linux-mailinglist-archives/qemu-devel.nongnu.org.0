Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE74A4A4724
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 13:29:25 +0100 (CET)
Received: from localhost ([::1]:56206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEVoD-0000XN-2i
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 07:29:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUZ0-0006BC-Rr; Mon, 31 Jan 2022 06:09:41 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUYy-00053d-3u; Mon, 31 Jan 2022 06:09:38 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20VB3MTG008361; 
 Mon, 31 Jan 2022 11:08:21 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dx5a8gyxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:20 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20VB2BAg020626;
 Mon, 31 Jan 2022 11:08:18 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma01fra.de.ibm.com with ESMTP id 3dvw791u1s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:18 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20VB8G8931064332
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 11:08:16 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 156BCAE04D;
 Mon, 31 Jan 2022 11:08:16 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC6FCAE053;
 Mon, 31 Jan 2022 11:08:15 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 31 Jan 2022 11:08:15 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.57.185])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id BD32A220149;
 Mon, 31 Jan 2022 12:08:14 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 02/41] target/ppc: 603: fix restore of GPRs 0-3 on rfi
Date: Mon, 31 Jan 2022 12:07:32 +0100
Message-Id: <20220131110811.619053-3-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131110811.619053-1-clg@kaod.org>
References: <20220131110811.619053-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: p8XCBmS88gvI6c0Y546pOMRELSJqBSKu
X-Proofpoint-GUID: p8XCBmS88gvI6c0Y546pOMRELSJqBSKu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_04,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=879
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 clxscore=1034 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201310074
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
 Cedric Le Goater <clg@kaod.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

After a TLB miss exception, GPRs 0-3 must be restored on rfi.

This is managed by hreg_store_msr() which is called by do_rfi()

However, hreg_store_msr() does it if MSR[TGPR] is unset in the
passed MSR value.

The problem is that do_rfi() is given the content of SRR1 as
the value to be set in MSR, but TGPR bit is not part of SRR1
and that bit is used for something else and is sometimes set
to 1, leading to hreg_store_msr() not restoring GPRs.

So, do the same way as for POW bit, force clearing it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Cedric Le Goater <clg@kaod.org>
Cc: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20220120103824.239573-1-christophe.leroy@csgroup.eu>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/excp_helper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index bc646c67a0f5..980f62fd7964 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1164,6 +1164,10 @@ static void do_rfi(CPUPPCState *env, target_ulong =
nip, target_ulong msr)
     /* MSR:POW cannot be set by any form of rfi */
     msr &=3D ~(1ULL << MSR_POW);
=20
+    /* MSR:TGPR cannot be set by any form of rfi */
+    if (env->flags & POWERPC_FLAG_TGPR)
+        msr &=3D ~(1ULL << MSR_TGPR);
+
 #if defined(TARGET_PPC64)
     /* Switching to 32-bit ? Crop the nip */
     if (!msr_is_64bit(env, msr)) {
--=20
2.34.1


