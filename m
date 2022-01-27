Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8C249EC6D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 21:24:37 +0100 (CET)
Received: from localhost ([::1]:41446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDBJs-0001YR-39
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 15:24:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nDB84-0006oq-1h; Thu, 27 Jan 2022 15:12:25 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:41674
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nDB7q-0007Ba-R0; Thu, 27 Jan 2022 15:12:22 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20RJt2qh020936; 
 Thu, 27 Jan 2022 20:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=22GqxeDv3fS5GfHa81msE5mkxyE665kwrJe56cabqfw=;
 b=ElKw38z8rSE4jQCxBDxBY3acjCOZUDwrdSqnT0cQ2y06ozNtnhGBei4V2FDZWEZF11Ft
 iv75GcCppaQ7v/3FvFppusbh1t2WhoCMKLwxvQuJ7YixnK39zyYx2xR/peQf3AAHA6bX
 7WJEHqBRWeKyd8AvmXxjsUm4stJ7T1X9ztDzonwY1+vScDx6spi4AEn6ZV6KLG4QynEM
 yiKW0mILKvCkKQpnvtKsjjihMyRq9Gwlio/oWNH8qQfHI2mY1gyqtdn2xsdtrzTNta5L
 G+PqBfI+j+/dQ9BU4vLcKFfec26AM41IoORXzW/kx850SVnzAZXFSEm4ZYOG+bhG73Dn wQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dv1sugn8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 20:11:52 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20RJutMK028761;
 Thu, 27 Jan 2022 20:11:52 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dv1sugn8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 20:11:52 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20RK8ahd032441;
 Thu, 27 Jan 2022 20:11:51 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 3dr9jc30hw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 20:11:51 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20RKBorL27984364
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 20:11:50 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96925112062;
 Thu, 27 Jan 2022 20:11:50 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B377011206B;
 Thu, 27 Jan 2022 20:11:47 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.129.51])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 27 Jan 2022 20:11:47 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/8] target/ppc: 74xx: System Reset interrupt cleanup
Date: Thu, 27 Jan 2022 17:11:15 -0300
Message-Id: <20220127201116.1154733-8-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127201116.1154733-1-farosas@linux.ibm.com>
References: <20220127201116.1154733-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 05eEPSsry-sYiLGDTpeCi4TlKPRudDoi
X-Proofpoint-ORIG-GUID: 2_oPtZI5Cwq03gTH6Tqgvy8fMhMHpqjY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_03,2022-01-27_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 mlxscore=0 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 mlxlogscore=774 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201270116
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, mark.cave-ayland@ilande.co.uk, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The whole power saving states logic seems to be dependent on HV mode,
which don't exist for 74xx so I'm removing it all and leaving the
abort message.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 396e25ed35..b7921c0956 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -703,23 +703,9 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_DECR:      /* Decrementer exception                    */
         break;
     case POWERPC_EXCP_RESET:     /* System reset exception                   */
-        /* A power-saving exception sets ME, otherwise it is unchanged */
         if (msr_pow) {
-            /* indicate that we resumed from power save mode */
-            msr |= 0x10000;
-            new_msr |= ((target_ulong)1 << MSR_ME);
-        }
-        if (env->msr_mask & MSR_HVB) {
-            /*
-             * ISA specifies HV, but can be delivered to guest with HV
-             * clear (e.g., see FWNMI in PAPR, NMI injection in QEMU).
-             */
-            new_msr |= (target_ulong)MSR_HVB;
-        } else {
-            if (msr_pow) {
-                cpu_abort(cs, "Trying to deliver power-saving system reset "
-                          "exception %d with no HV support\n", excp);
-            }
+            cpu_abort(cs, "Trying to deliver power-saving system reset "
+                      "exception %d with no HV support\n", excp);
         }
         break;
     case POWERPC_EXCP_TRACE:     /* Trace exception                          */
-- 
2.34.1


