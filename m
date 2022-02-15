Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7E44B7A4D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 23:14:43 +0100 (CET)
Received: from localhost ([::1]:50114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK65q-0003qY-RZ
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 17:14:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK5b9-0004X8-8O; Tue, 15 Feb 2022 16:42:59 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK5av-0002Zw-30; Tue, 15 Feb 2022 16:42:58 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FKb2pd015734; 
 Tue, 15 Feb 2022 21:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ChAxaUvgtLNqU1xrxF9ibulKT5jxcWLW4tGCnY84Z1g=;
 b=mg/wvWkv0A7VrvnIIUxj0rHP/2t+pI+eX0HBvl/1N5ne7QfLFhCKqos2lCH/0nTD9xHT
 pHzg/2KYaxg9vVhb5SxRTqfmjpTTbVobeq18V+gjPZJsZq7o3XwSoIeTbibvsY29oUzi
 bxSrS+1wakpZ5a7Z2PLlhBvZis19Xw1lrKGVzYMpyepoQt1P5JmCpSy+uqDRw2fvrsL+
 wn9zkH+wj5xjS26fYA62psdINGkFK16YzKk8PrsaUuODUrcvzdQEUs9uGAdJ429itif3
 LW+1vZfqvex6dT85LZ38RcRu6O9M99n4gc2yj/vsmTXUp2SiakIPsviyvFVEhHep3mbW 1g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8jn62g2j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:38 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21FLP26x032129;
 Tue, 15 Feb 2022 21:42:37 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8jn62g29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:37 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21FLNqQb030880;
 Tue, 15 Feb 2022 21:42:36 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04dal.us.ibm.com with ESMTP id 3e64hc2u0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:36 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21FLgZ8V29295036
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 21:42:35 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 90958BE056;
 Tue, 15 Feb 2022 21:42:35 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CCBCBE04F;
 Tue, 15 Feb 2022 21:42:34 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.143.123])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 15 Feb 2022 21:42:33 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/27] target/ppc: cpu_init: Reuse init_proc_745 for the 755
Date: Tue, 15 Feb 2022 18:41:41 -0300
Message-Id: <20220215214148.1848266-21-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215214148.1848266-1-farosas@linux.ibm.com>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tJdndnxE-uCHQmAkOz4TJTsr44fTpU9V
X-Proofpoint-ORIG-GUID: DVDhbH8PN-XyQ4m_ieoQbYuHPBzCUDtH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_06,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 mlxlogscore=889 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202150122
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The init_proc_755 function is identical to the 745 one except for the
L2 cache registers. I think it is worth it to make them share code.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu_init.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 32f99373dc..b4913e25de 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -4548,24 +4548,8 @@ POWERPC_FAMILY(745)(ObjectClass *oc, void *data)
 
 static void init_proc_755(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
-    register_sdr1_sprs(env);
-    register_7xx_sprs(env);
-    register_755_sprs(env);
+    init_proc_745(env);
     register_755_L2_cache_sprs(env);
-
-    /* Thermal management */
-    register_thrm_sprs(env);
-
-    /* Memory management */
-    register_low_BATs(env);
-    register_high_BATs(env);
-    register_6xx_7xx_soft_tlb(env, 64, 2);
-    init_excp_7x5(env);
-    env->dcache_line_size = 32;
-    env->icache_line_size = 32;
-    /* Allocate hardware IRQ controller */
-    ppc6xx_irq_init(env_archcpu(env));
 }
 
 POWERPC_FAMILY(755)(ObjectClass *oc, void *data)
-- 
2.34.1


