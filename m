Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC07483D33
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 08:51:27 +0100 (CET)
Received: from localhost ([::1]:46766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4ebO-0005xF-71
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 02:51:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4eIP-0005pq-Px; Tue, 04 Jan 2022 02:31:57 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:40892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4eIM-0008GV-VT; Tue, 04 Jan 2022 02:31:49 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20438eoj001115; 
 Tue, 4 Jan 2022 07:31:37 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dc8xyyfkj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 07:31:37 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2047O2s9009492;
 Tue, 4 Jan 2022 07:31:35 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3daek9y5hy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 07:31:35 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2047MmsW47382998
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Jan 2022 07:22:48 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20EAC42047;
 Tue,  4 Jan 2022 07:31:33 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D884942045;
 Tue,  4 Jan 2022 07:31:32 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  4 Jan 2022 07:31:32 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.19])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 1CB5A220144;
 Tue,  4 Jan 2022 08:31:32 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 14/26] ppc/ppc405: Fix timer initialization
Date: Tue,  4 Jan 2022 08:31:09 +0100
Message-Id: <20220104073121.3784280-15-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220104073121.3784280-1-clg@kaod.org>
References: <20220104073121.3784280-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RBcT9joH2noUvrwoaY8iX3owX20o4hTG
X-Proofpoint-ORIG-GUID: RBcT9joH2noUvrwoaY8iX3owX20o4hTG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_04,2022-01-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 phishscore=0 mlxlogscore=616 priorityscore=1501 clxscore=1034
 impostorscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201040049
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Timers are already initialized in ppc4xx_init(). No need to do it a
second time with a wrong set.

Fixes: d715ea961254 ("PPC: 405: Fix ppc405ep initialization")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20211222064025.1541490-7-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20220103063441.3424853-8-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405_uc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index ec97b22bd019..8aacd275a652 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1461,8 +1461,6 @@ PowerPCCPU *ppc405ep_init(MemoryRegion *address_spa=
ce_mem,
     ppc4xx_pob_init(env);
     /* OBP arbitrer */
     ppc4xx_opba_init(0xef600600);
-    /* Initialize timers */
-    ppc_booke_timers_init(cpu, sysclk, 0);
     /* Universal interrupt controller */
     uicdev =3D qdev_new(TYPE_PPC_UIC);
     uicsbd =3D SYS_BUS_DEVICE(uicdev);
--=20
2.31.1


