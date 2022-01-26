Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF8349D024
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 17:58:17 +0100 (CET)
Received: from localhost ([::1]:49046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nClce-0004e3-Mq
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 11:58:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nClNY-0004vD-KU; Wed, 26 Jan 2022 11:42:41 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:8518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nClNV-00059x-PH; Wed, 26 Jan 2022 11:42:40 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20QGNgYb010397; 
 Wed, 26 Jan 2022 16:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=chSXRg7JZTRbvk0eGF5LzkOD3T++Jhk6+Lzt1IZ9tCg=;
 b=VdN+fjpztUmBrdh6qR24Sv+6H3JubtBiFkyC501Ob6syjiBDQ4ejUFPUIll11yvc5Uiq
 LRjGWNfxQyCxK81BrqxRVMDKzFCB2tnaqdcSftMuDZvJIvFV3g8iPMS0L4mL8QHb+UlK
 ozu9wEGPBRrp4uMfPXgVHJRF5EFdMPn94EwR4QHksh90TabEB2obpTfHksSgWlA8xJ94
 iLxBmFRLycWbaGa/kAVz0J7v5ktcBJZiiih3R0of24EmNQcwyKkoZxkSrSTRT6FelkqS
 VL9NqGe9CYSW3APmkHjmSztDqMaNlVkeNoFoMHSCzl4aohLhMNl1N/tjQDLSFCCEC5lI 5Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3du8ryt3qy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jan 2022 16:42:21 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20QGPkTU015685;
 Wed, 26 Jan 2022 16:42:20 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3du8ryt3qm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jan 2022 16:42:20 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20QGaXQb008372;
 Wed, 26 Jan 2022 16:42:20 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 3dr9jawug2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jan 2022 16:42:20 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20QGgJBM31392044
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 16:42:19 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6866178066;
 Wed, 26 Jan 2022 16:42:19 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F51578068;
 Wed, 26 Jan 2022 16:42:17 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.99.130])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 26 Jan 2022 16:42:17 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/8] target/ppc: 74xx: Program exception cleanup
Date: Wed, 26 Jan 2022 13:41:57 -0300
Message-Id: <20220126164200.1048677-6-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126164200.1048677-1-farosas@linux.ibm.com>
References: <20220126164200.1048677-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FSmjxjGhmMlSj6pxKe03L1Tm2w-NRJ4I
X-Proofpoint-GUID: f-ZAZEd1JgOoTcM5qAoaH3wQhkLrCxEQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-26_06,2022-01-26_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201260103
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the BookE ESR setting.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index b9a1d7ae7e..bb17b65dc0 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -650,20 +650,16 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
              * precise in the MSR.
              */
             msr |= 0x00100000;
-            env->spr[SPR_BOOKE_ESR] = ESR_FP;
             break;
         case POWERPC_EXCP_INVAL:
             trace_ppc_excp_inval(env->nip);
             msr |= 0x00080000;
-            env->spr[SPR_BOOKE_ESR] = ESR_PIL;
             break;
         case POWERPC_EXCP_PRIV:
             msr |= 0x00040000;
-            env->spr[SPR_BOOKE_ESR] = ESR_PPR;
             break;
         case POWERPC_EXCP_TRAP:
             msr |= 0x00020000;
-            env->spr[SPR_BOOKE_ESR] = ESR_PTR;
             break;
         default:
             /* Should never occur */
-- 
2.34.1


