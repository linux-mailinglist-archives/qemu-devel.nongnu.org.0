Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB98477EEB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 22:38:29 +0100 (CET)
Received: from localhost ([::1]:58314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxySK-0006gx-L8
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 16:38:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLu-0003v2-Lg; Thu, 16 Dec 2021 15:27:46 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLo-0007Tz-RN; Thu, 16 Dec 2021 15:27:46 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGJNcTw016323; 
 Thu, 16 Dec 2021 20:26:59 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cyqbjarwr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:59 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKDCO6019530;
 Thu, 16 Dec 2021 20:26:57 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3cy78ek0r5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:56 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BGKQsbl40829346
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:26:54 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FE364204B;
 Thu, 16 Dec 2021 20:26:54 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44A6842045;
 Thu, 16 Dec 2021 20:26:54 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 16 Dec 2021 20:26:54 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 79FD8220238;
 Thu, 16 Dec 2021 21:26:53 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 057/101] target/ppc: Fix MPCxxx FPU interrupt address
Date: Thu, 16 Dec 2021 21:25:30 +0100
Message-Id: <20211216202614.414266-58-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fSzoA1pLQWlyFAm_K_JRJxUtd7V2RiiY
X-Proofpoint-ORIG-GUID: fSzoA1pLQWlyFAm_K_JRJxUtd7V2RiiY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=666 impostorscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 priorityscore=1501 clxscore=1034 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112160109
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

The Floating-point Unavailable and Decrementer interrupts are being
registered at the same 0x900 address. The FPU should be at 0x800
instead.

Verified on MPC555, MPC860 and MPC885 user manuals.

Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20211208123029.2052625-2-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu_init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index ed0e2136d9c8..7e61994e3596 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -2155,7 +2155,7 @@ static void init_excp_MPC5xx(CPUPPCState *env)
     env->excp_vectors[POWERPC_EXCP_EXTERNAL] =3D 0x00000500;
     env->excp_vectors[POWERPC_EXCP_ALIGN]    =3D 0x00000600;
     env->excp_vectors[POWERPC_EXCP_PROGRAM]  =3D 0x00000700;
-    env->excp_vectors[POWERPC_EXCP_FPU]      =3D 0x00000900;
+    env->excp_vectors[POWERPC_EXCP_FPU]      =3D 0x00000800;
     env->excp_vectors[POWERPC_EXCP_DECR]     =3D 0x00000900;
     env->excp_vectors[POWERPC_EXCP_SYSCALL]  =3D 0x00000C00;
     env->excp_vectors[POWERPC_EXCP_TRACE]    =3D 0x00000D00;
@@ -2182,7 +2182,7 @@ static void init_excp_MPC8xx(CPUPPCState *env)
     env->excp_vectors[POWERPC_EXCP_EXTERNAL] =3D 0x00000500;
     env->excp_vectors[POWERPC_EXCP_ALIGN]    =3D 0x00000600;
     env->excp_vectors[POWERPC_EXCP_PROGRAM]  =3D 0x00000700;
-    env->excp_vectors[POWERPC_EXCP_FPU]      =3D 0x00000900;
+    env->excp_vectors[POWERPC_EXCP_FPU]      =3D 0x00000800;
     env->excp_vectors[POWERPC_EXCP_DECR]     =3D 0x00000900;
     env->excp_vectors[POWERPC_EXCP_SYSCALL]  =3D 0x00000C00;
     env->excp_vectors[POWERPC_EXCP_TRACE]    =3D 0x00000D00;
--=20
2.31.1


