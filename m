Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7444A03ED
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 23:49:42 +0100 (CET)
Received: from localhost ([::1]:42590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDa3p-00087I-JQ
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 17:49:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nDZvW-0007jc-4I; Fri, 28 Jan 2022 17:41:08 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:16636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nDZvG-0003Vl-F2; Fri, 28 Jan 2022 17:40:56 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20SM66TA017647; 
 Fri, 28 Jan 2022 22:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=W/C+7XckM9SUNjcu7YumUT653zIA0cvQDkBXn/eEtLM=;
 b=NTIycqhF96bHjeAzdEg+S8Sh3NAGmHOriiUkbmAhFdQnOwppkymItRLEAB3TzjE/QUJb
 x7CijZr4pJC9Ju93DKymMcwyZ2YYlZHO0185cLAOAWcMABuNV7cRopLeEFy+TY/0XxYN
 u8LLgieCxTVfWW/wX5hyTXKThU72aJRq3Zim7uymNhJGop74kGLECrSVHDyjhx9xFJ6l
 pe2TBq3fEYubV77o0JI1PfM5gjxFQz/LFkhQJtcRuIuhB0U7zOgN/4yUc32/OQwzkJgv
 UkY4Nwbb7irVAUXjGeGb4zeAo7etssV6Db1HBNVJ4lV/EOEEQt80F6StsoeUFxcykTjC EA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dvpenu36c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 22:40:39 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20SMUCIZ005034;
 Fri, 28 Jan 2022 22:40:39 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dvpenu367-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 22:40:39 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20SMc2kk028901;
 Fri, 28 Jan 2022 22:40:38 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 3dr9jdthfx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 22:40:38 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20SMebEk32178638
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 22:40:37 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 488C878064;
 Fri, 28 Jan 2022 22:40:37 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B9D4078060;
 Fri, 28 Jan 2022 22:40:35 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.66.85])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 28 Jan 2022 22:40:35 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/11] target/ppc: booke: Instruction storage exception cleanup
Date: Fri, 28 Jan 2022 19:40:13 -0300
Message-Id: <20220128224018.1228062-7-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220128224018.1228062-1-farosas@linux.ibm.com>
References: <20220128224018.1228062-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pLNEhJRQWt11T1u1eikMOU_m6vJ_qO8Z
X-Proofpoint-ORIG-GUID: sPVwEOCoZYQEAN9DNP2HM_C3Qme_NAc8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-28_08,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201280125
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The SRR1 should be set to the MSR value. There are no diagnostic bits
in the SRR1 for BookE.

Note that this fixes a bug where MSR_GS would be set and Linux would
go into KVM code when there's no KVM guest.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index c8bd78d5cb..8340146902 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -836,7 +836,6 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
         break;
     case POWERPC_EXCP_ISI:       /* Instruction storage exception            */
         trace_ppc_excp_isi(msr, env->nip);
-        msr |= env->error_code;
         break;
     case POWERPC_EXCP_EXTERNAL:  /* External input                           */
     {
-- 
2.34.1


