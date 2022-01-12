Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4DB48C4B7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 14:22:46 +0100 (CET)
Received: from localhost ([::1]:40604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7daO-0006dt-Nf
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 08:22:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cF5-0006dy-12; Wed, 12 Jan 2022 06:56:42 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:11652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cEp-0007Ve-0w; Wed, 12 Jan 2022 06:56:38 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CBqYsb012485; 
 Wed, 12 Jan 2022 11:56:17 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhxgf8293-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:16 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CBm1LT026902;
 Wed, 12 Jan 2022 11:56:15 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3df289tmjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:14 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20CBl8oh48103926
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 11:47:08 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9F9E11C099;
 Wed, 12 Jan 2022 11:56:11 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F98D11C09A;
 Wed, 12 Jan 2022 11:56:11 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 12 Jan 2022 11:56:11 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.95])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id B6BA62201C6;
 Wed, 12 Jan 2022 12:56:10 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 13/34] target/ppc: Use ppc_interrupts_little_endian in
 powerpc_excp
Date: Wed, 12 Jan 2022 12:55:30 +0100
Message-Id: <20220112115551.987666-14-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112115551.987666-1-clg@kaod.org>
References: <20220112115551.987666-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LeMxgh8KenFqiq3r2U-mpkjiNO748PB6
X-Proofpoint-GUID: LeMxgh8KenFqiq3r2U-mpkjiNO748PB6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 spamscore=0 impostorscore=0 clxscore=1034 mlxlogscore=555
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120075
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

The ppc_interrupts_little_endian function is now suitable for
determining the endianness of interrupts for all CPUs.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20220107222601.4101511-7-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/excp_helper.c | 29 +----------------------------
 1 file changed, 1 insertion(+), 28 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 3a430f23d6f3..3b4123bc6590 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -832,36 +832,9 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp)
      * Sort out endianness of interrupt, this differs depending on the
      * CPU, the HV mode, etc...
      */
-#ifdef TARGET_PPC64
-    if (excp_model =3D=3D POWERPC_EXCP_POWER7) {
-        if (!(new_msr & MSR_HVB) && (env->spr[SPR_LPCR] & LPCR_ILE)) {
-            new_msr |=3D (target_ulong)1 << MSR_LE;
-        }
-    } else if (excp_model =3D=3D POWERPC_EXCP_POWER8) {
-        if (new_msr & MSR_HVB) {
-            if (env->spr[SPR_HID0] & HID0_HILE) {
-                new_msr |=3D (target_ulong)1 << MSR_LE;
-            }
-        } else if (env->spr[SPR_LPCR] & LPCR_ILE) {
-            new_msr |=3D (target_ulong)1 << MSR_LE;
-        }
-    } else if (excp_model =3D=3D POWERPC_EXCP_POWER9 ||
-               excp_model =3D=3D POWERPC_EXCP_POWER10) {
-        if (new_msr & MSR_HVB) {
-            if (env->spr[SPR_HID0] & HID0_POWER9_HILE) {
-                new_msr |=3D (target_ulong)1 << MSR_LE;
-            }
-        } else if (env->spr[SPR_LPCR] & LPCR_ILE) {
-            new_msr |=3D (target_ulong)1 << MSR_LE;
-        }
-    } else if (msr_ile) {
-        new_msr |=3D (target_ulong)1 << MSR_LE;
-    }
-#else
-    if (msr_ile) {
+    if (ppc_interrupts_little_endian(cpu, !!(new_msr & MSR_HVB))) {
         new_msr |=3D (target_ulong)1 << MSR_LE;
     }
-#endif
=20
 #if defined(TARGET_PPC64)
     if (excp_model =3D=3D POWERPC_EXCP_BOOKE) {
--=20
2.31.1


