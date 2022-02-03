Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BA84A90EF
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 23:58:12 +0100 (CET)
Received: from localhost ([::1]:44780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFl3L-0007wq-27
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 17:58:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nFkoq-0000cG-92; Thu, 03 Feb 2022 17:43:12 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nFkon-0004Tt-Lz; Thu, 03 Feb 2022 17:43:10 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 213MVlV3003009; 
 Thu, 3 Feb 2022 22:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=rwDT6IYBScJW4qtHj+pJWG0bEQ69Ps1MekAH46gFgrc=;
 b=CxEu9pgV4jYr5WaCwN28fc4nriGCiI8ZHgsM0Qt0oCOOw5CV607yCLhhbr8nd1fqMfg0
 4WwSDO9NqoPpt92Ekb1iK83ohi1v5wwoGrGgFG+LPibchv+snTj7vQsWe7o4GJSvxBJK
 FTSaA02jX6ptoxfj5vUqjB/NnJP57bELsKXj/xNwrC1S82xPsmpGRIAVUnD3ZNYCSxHT
 U9xIUc43+n2Kg1jj0H4Rf8Zi7/sMjuE1Cnx6FtPX8OyjxAx1lc+q7eYxGLJP98IRs5F8
 cRQw3hn3s8GeUbWJ2YsQaWVb0a+uu8O9XtPRD4L5NWwwcRqMgPjb4Hk0cX0V58YHyYKf CQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0qx3r6gj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 22:43:03 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 213MWMo1004227;
 Thu, 3 Feb 2022 22:43:02 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0qx3r6ga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 22:43:02 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 213MgXPK011934;
 Thu, 3 Feb 2022 22:43:01 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02wdc.us.ibm.com with ESMTP id 3e0r0jr2nm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 22:43:01 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 213Mh0MG36634974
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Feb 2022 22:43:00 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6989BE053;
 Thu,  3 Feb 2022 22:43:00 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4CBD0BE056;
 Thu,  3 Feb 2022 22:42:59 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.67.28])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  3 Feb 2022 22:42:59 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/10] target/ppc: 7xx: Machine Check exception cleanup
Date: Thu,  3 Feb 2022 19:42:40 -0300
Message-Id: <20220203224246.1446652-5-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203224246.1446652-1-farosas@linux.ibm.com>
References: <20220203224246.1446652-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zgtLLA-RJABoOdUCN7hPuK68q3BeXLLX
X-Proofpoint-ORIG-GUID: VqKzmB6Kj9gwl_rjX1KIoGxFc4gyxa0-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_07,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=936 malwarescore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030132
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's no MSR_HV in the 7xx.

Also remove 40x and BookE code.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 358c3f6206..4996b96616 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -802,34 +802,10 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
             cs->halted = 1;
             cpu_interrupt_exittb(cs);
         }
-        if (env->msr_mask & MSR_HVB) {
-            /*
-             * ISA specifies HV, but can be delivered to guest with HV
-             * clear (e.g., see FWNMI in PAPR).
-             */
-            new_msr |= (target_ulong)MSR_HVB;
-        }
 
         /* machine check exceptions don't have ME set */
         new_msr &= ~((target_ulong)1 << MSR_ME);
 
-        /* XXX: should also have something loaded in DAR / DSISR */
-        switch (excp_model) {
-        case POWERPC_EXCP_40x:
-            srr0 = SPR_40x_SRR2;
-            srr1 = SPR_40x_SRR3;
-            break;
-        case POWERPC_EXCP_BOOKE:
-            /* FIXME: choose one or the other based on CPU type */
-            srr0 = SPR_BOOKE_MCSRR0;
-            srr1 = SPR_BOOKE_MCSRR1;
-
-            env->spr[SPR_BOOKE_CSRR0] = env->nip;
-            env->spr[SPR_BOOKE_CSRR1] = msr;
-            break;
-        default:
-            break;
-        }
         break;
     case POWERPC_EXCP_DSI:       /* Data storage exception                   */
         trace_ppc_excp_dsi(env->spr[SPR_DSISR], env->spr[SPR_DAR]);
-- 
2.34.1


