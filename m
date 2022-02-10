Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2634B1263
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 17:10:49 +0100 (CET)
Received: from localhost ([::1]:59896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIC1t-0004PD-Fj
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 11:10:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nI941-00021K-1K; Thu, 10 Feb 2022 08:00:51 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59462
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nI93s-0004BM-Gk; Thu, 10 Feb 2022 08:00:43 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21AC8bSd032367; 
 Thu, 10 Feb 2022 13:00:33 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e4cb7duhe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:00:32 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21ACvtMH006246;
 Thu, 10 Feb 2022 13:00:30 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 3e1ggjp69h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:00:30 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21AD0RKe33227234
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 13:00:27 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2E68AE061;
 Thu, 10 Feb 2022 13:00:26 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B01F0AE057;
 Thu, 10 Feb 2022 13:00:26 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 10 Feb 2022 13:00:26 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.74.250])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id E519A2201DC;
 Thu, 10 Feb 2022 14:00:25 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 19/42] target/ppc: 6xx: Machine Check exception cleanup
Date: Thu, 10 Feb 2022 13:59:45 +0100
Message-Id: <20220210130008.2599950-20-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210130008.2599950-1-clg@kaod.org>
References: <20220210130008.2599950-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ra8cAKaSLJPhVk6dwPayCeEkuHCDjdCz
X-Proofpoint-GUID: Ra8cAKaSLJPhVk6dwPayCeEkuHCDjdCz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_05,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=777 phishscore=0 impostorscore=0
 mlxscore=0 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1034
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202100068
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.146,
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

There's no MSR_HV in the 6xx CPUs.

Also remove the 40x and BookE code.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20220203200957.1434641-6-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/excp_helper.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index e27e1c3c705f..734170d4c2ef 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -612,34 +612,10 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int e=
xcp)
             cs->halted =3D 1;
             cpu_interrupt_exittb(cs);
         }
-        if (env->msr_mask & MSR_HVB) {
-            /*
-             * ISA specifies HV, but can be delivered to guest with HV
-             * clear (e.g., see FWNMI in PAPR).
-             */
-            new_msr |=3D (target_ulong)MSR_HVB;
-        }
=20
         /* machine check exceptions don't have ME set */
         new_msr &=3D ~((target_ulong)1 << MSR_ME);
=20
-        /* XXX: should also have something loaded in DAR / DSISR */
-        switch (excp_model) {
-        case POWERPC_EXCP_40x:
-            srr0 =3D SPR_40x_SRR2;
-            srr1 =3D SPR_40x_SRR3;
-            break;
-        case POWERPC_EXCP_BOOKE:
-            /* FIXME: choose one or the other based on CPU type */
-            srr0 =3D SPR_BOOKE_MCSRR0;
-            srr1 =3D SPR_BOOKE_MCSRR1;
-
-            env->spr[SPR_BOOKE_CSRR0] =3D env->nip;
-            env->spr[SPR_BOOKE_CSRR1] =3D msr;
-            break;
-        default:
-            break;
-        }
         break;
     case POWERPC_EXCP_DSI:       /* Data storage exception              =
     */
         trace_ppc_excp_dsi(env->spr[SPR_DSISR], env->spr[SPR_DAR]);
--=20
2.34.1


