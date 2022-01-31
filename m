Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFFF4A4445
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 12:32:13 +0100 (CET)
Received: from localhost ([::1]:44590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEUuq-0007lO-TA
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 06:32:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUYe-00060x-6Y; Mon, 31 Jan 2022 06:09:18 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:23454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUYb-00053O-3n; Mon, 31 Jan 2022 06:09:15 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20V98Y2j019350; 
 Mon, 31 Jan 2022 11:08:20 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dx66b8abr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:19 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20VB2MpP018213;
 Mon, 31 Jan 2022 11:08:17 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 3dvw799ueh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:17 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20VB8Fvh40304900
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 11:08:15 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 344DD4C040;
 Mon, 31 Jan 2022 11:08:15 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D44B54C046;
 Mon, 31 Jan 2022 11:08:14 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 31 Jan 2022 11:08:14 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.57.185])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 042322201C1;
 Mon, 31 Jan 2022 12:08:13 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 01/41] spapr: Force 32bit when resetting a core
Date: Mon, 31 Jan 2022 12:07:31 +0100
Message-Id: <20220131110811.619053-2-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131110811.619053-1-clg@kaod.org>
References: <20220131110811.619053-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 69UHk-AKW-NoaKy3ItjFb64aWp8pHUVs
X-Proofpoint-ORIG-GUID: 69UHk-AKW-NoaKy3ItjFb64aWp8pHUVs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_04,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1034
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 mlxscore=0 mlxlogscore=620 priorityscore=1501 phishscore=0 adultscore=0
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexey Kardashevskiy <aik@ozlabs.ru>

"PowerPC Processor binding to IEEE 1275" says in
"8.2.1. Initial Register Values" that the initial state is defined as
32bit so do it for both SLOF and VOF.

This should not cause behavioral change as SLOF switches to 64bit very
early anyway. As nothing enforces LE anywhere, this drops it for VOF.

The goal is to make VOF work with TCG as otherwise it barfs with
qemu: fatal: TCG hflags mismatch (current:0x6c000004 rebuilt:0x6c000000)

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20220107072423.2278113-1-aik@ozlabs.ru>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/spapr_cpu_core.c | 5 +++++
 hw/ppc/spapr_vof.c      | 2 --
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index a57ba70a8781..a781e97f8d1d 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -37,6 +37,11 @@ static void spapr_reset_vcpu(PowerPCCPU *cpu)
=20
     cpu_reset(cs);
=20
+    /*
+     * "PowerPC Processor binding to IEEE 1275" defines the initial MSR =
state
+     * as 32bit (MSR_SF=3D0) in "8.2.1. Initial Register Values".
+     */
+    env->msr &=3D ~(1ULL << MSR_SF);
     env->spr[SPR_HIOR] =3D 0;
=20
     lpcr =3D env->spr[SPR_LPCR];
diff --git a/hw/ppc/spapr_vof.c b/hw/ppc/spapr_vof.c
index 40ce8fe0037c..a33f940c32bb 100644
--- a/hw/ppc/spapr_vof.c
+++ b/hw/ppc/spapr_vof.c
@@ -88,8 +88,6 @@ void spapr_vof_reset(SpaprMachineState *spapr, void *fd=
t, Error **errp)
     spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
                               stack_ptr, spapr->initrd_base,
                               spapr->initrd_size);
-    /* VOF is 32bit BE so enforce MSR here */
-    first_ppc_cpu->env.msr &=3D ~((1ULL << MSR_SF) | (1ULL << MSR_LE));
=20
     /*
      * At this point the expected allocation map is:
--=20
2.34.1


