Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4CE4B8E98
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 17:54:24 +0100 (CET)
Received: from localhost ([::1]:43302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKNZP-0005vX-UC
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 11:54:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN7I-0002JJ-El; Wed, 16 Feb 2022 11:25:20 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:21190
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN7G-0001Tm-Sl; Wed, 16 Feb 2022 11:25:20 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21GGGMNY024393; 
 Wed, 16 Feb 2022 16:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=+QFv0G7jLp7IPbWSNAcbCyXaDEP6GpP0SG7vMuiRsks=;
 b=hRIAFhb03UzuU5i16egxocxE+W6WQ+S5fGm+zHGmLdIT8OtAsMQvLsbgKarRwtBPsa9m
 YB69W4rBYRkF8sUWs77vwd9iE5xI0XqM6ZIo3TcpEkBbozHZUlHPyr13/Cvb9e2JrbuL
 a+DQsCI4swSkEhJSKz8FByd7nJr1BihWkp1SXf6z7qlF6fS4sQRUZLkFXb6VcqC+jUq2
 SY0M1oDg8Io2qM1zyXDyrGtgEOFjIkiNlP9hH5+LI7L0yp5S5srThXas8aIGtoNGV2kT
 zLTrL5oUBRHwCdNwezk1G9qcLUfBcw11VvhX0EmPSPtuKOgmO+p6PHYOLzyaBRed/Shj Jg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e94n485kx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:25:13 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21GGHemS031053;
 Wed, 16 Feb 2022 16:25:13 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e94n485km-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:25:13 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21GGCjrH020849;
 Wed, 16 Feb 2022 16:25:12 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01dal.us.ibm.com with ESMTP id 3e91f6e9fg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:25:12 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21GGPAbC12452104
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 16:25:10 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CB9878094;
 Wed, 16 Feb 2022 16:25:10 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 276BC78070;
 Wed, 16 Feb 2022 16:25:09 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.144.50])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Feb 2022 16:25:08 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/27] target/ppc: cpu_init: Reuse init_proc_604 for the
 604e
Date: Wed, 16 Feb 2022 13:24:18 -0300
Message-Id: <20220216162426.1885923-20-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216162426.1885923-1-farosas@linux.ibm.com>
References: <20220216162426.1885923-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5vs_yGBG0W6iuP9RlNQ8U0ehBwBBzl3P
X-Proofpoint-GUID: -mODufvqlo-1QWtnGW04IzhPls3hZ4Q4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_07,2022-02-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=963 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202160095
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
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

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu_init.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 975257c19b..638e16c583 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -3926,18 +3926,8 @@ POWERPC_FAMILY(604)(ObjectClass *oc, void *data)
 
 static void init_proc_604E(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
-    register_sdr1_sprs(env);
-    register_604_sprs(env);
+    init_proc_604(env);
     register_604e_sprs(env);
-
-    /* Memory management */
-    register_low_BATs(env);
-    init_excp_604(env);
-    env->dcache_line_size = 32;
-    env->icache_line_size = 32;
-    /* Allocate hardware IRQ controller */
-    ppc6xx_irq_init(env_archcpu(env));
 }
 
 POWERPC_FAMILY(604E)(ObjectClass *oc, void *data)
-- 
2.34.1


