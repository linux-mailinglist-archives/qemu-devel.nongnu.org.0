Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D82784B10FD
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 15:53:33 +0100 (CET)
Received: from localhost ([::1]:47488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIApA-0004BK-OH
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 09:53:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nI93v-0001vs-H4; Thu, 10 Feb 2022 08:00:40 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nI93p-00048g-65; Thu, 10 Feb 2022 08:00:37 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21ACXVwh010331; 
 Thu, 10 Feb 2022 13:00:21 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e4crymycx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:00:21 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21ACvvVf012025;
 Thu, 10 Feb 2022 13:00:19 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3e1gv9r296-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:00:19 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21AD0GsA44433764
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 13:00:17 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C55A642067;
 Thu, 10 Feb 2022 13:00:16 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8AD8942057;
 Thu, 10 Feb 2022 13:00:16 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 10 Feb 2022 13:00:16 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.74.250])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id B73FD22016C;
 Thu, 10 Feb 2022 14:00:15 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 06/42] target/ppc: booke: Data Storage exception cleanup
Date: Thu, 10 Feb 2022 13:59:32 +0100
Message-Id: <20220210130008.2599950-7-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210130008.2599950-1-clg@kaod.org>
References: <20220210130008.2599950-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TXfYQRmBfiRqAaajSqmsSe6-znqm2Msu
X-Proofpoint-ORIG-GUID: TXfYQRmBfiRqAaajSqmsSe6-znqm2Msu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_05,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 clxscore=1034 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 mlxlogscore=868 malwarescore=0 mlxscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202100068
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

There is no DSISR or DAR in BookE. Change to ESR and DEAR.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20220128224018.1228062-6-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/excp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 4753b8152727..c8bd78d5cbb0 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -832,7 +832,7 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int e=
xcp)
=20
         break;
     case POWERPC_EXCP_DSI:       /* Data storage exception              =
     */
-        trace_ppc_excp_dsi(env->spr[SPR_DSISR], env->spr[SPR_DAR]);
+        trace_ppc_excp_dsi(env->spr[SPR_BOOKE_ESR], env->spr[SPR_BOOKE_D=
EAR]);
         break;
     case POWERPC_EXCP_ISI:       /* Instruction storage exception       =
     */
         trace_ppc_excp_isi(msr, env->nip);
--=20
2.34.1


