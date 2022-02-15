Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0174B7A22
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 23:01:27 +0100 (CET)
Received: from localhost ([::1]:46840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK5t1-0007HE-0Y
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 17:01:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK5b0-00048F-RT; Tue, 15 Feb 2022 16:42:50 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:32114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK5av-0002aS-5E; Tue, 15 Feb 2022 16:42:50 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FKdQIA009381; 
 Tue, 15 Feb 2022 21:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=4o4XoIwuVEVM+JmYVcm8ohDSuvI4TA2/87XtCUxTvNs=;
 b=U+NG6hkZ+0Kd6MBbWyAEtjkyz/GAQ+4R+KvJY13bjB2KFZWvkmkRyp2hLtsKCoTMXqDy
 dUJOFisDiNT9bv827ZBvuf0fx4dw8DXQ1GDXNAMOImhBrZwj5R9X/rsL4uCjFKV0IDe5
 /bk9HXFHBvt/bQxmHGEEj5PuCl6trB1WMDw8p4SvfwiKwae9U8VAgCrIXIIkX0bNRVRC
 Dm48WZe9ueajYRq5oXzniTVwBkmyNNYUFV4keA6WsHUgJq2GDYvii791mtRQjEJBA1/m
 qQMiquZM61blQqLrL67UuJenN+gtv2ImiAuUGJJTJi74xfLBvkj8Mk0U41XeGmRrMx5I sA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8jreagbp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:39 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21FKxu96017649;
 Tue, 15 Feb 2022 21:42:39 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8jreagbd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:39 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21FLgHiA016031;
 Tue, 15 Feb 2022 21:42:38 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 3e64hb2pfx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:38 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21FLgcPm18153912
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 21:42:38 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DCC83BE058;
 Tue, 15 Feb 2022 21:42:37 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19702BE053;
 Tue, 15 Feb 2022 21:42:36 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.143.123])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 15 Feb 2022 21:42:35 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/27] target/ppc: cpu_init: Rename software TLB function
Date: Tue, 15 Feb 2022 18:41:42 -0300
Message-Id: <20220215214148.1848266-22-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215214148.1848266-1-farosas@linux.ibm.com>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EpOa_rGwHGF_pf4pOvR74XkakBGL8gDb
X-Proofpoint-ORIG-GUID: PJVcYDpAb1_F5Z4Qgi_hVtK1n-zcPd37
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_06,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 mlxlogscore=605 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202150122
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

With the removal of the 7450 software TLB code, the only software TLBs
that we support currently are the 6xx and 7xx, so there's no need for
this function to indicate that in its name anymore.

Also, it's best to use a generic name for functions that are shared
and only mention the specific CPU name when the function applies only
to that (or similar) CPUs.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu_init.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index b4913e25de..3e687d0301 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -428,7 +428,7 @@ static void register_high_BATs(CPUPPCState *env)
 }
 
 /* Softare table search registers */
-static void register_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways)
+static void register_soft_tlb_sprs(CPUPPCState *env, int nb_tlbs, int nb_ways)
 {
 #if !defined(CONFIG_USER_ONLY)
     env->nb_tlb = nb_tlbs;
@@ -3029,7 +3029,7 @@ static void init_proc_G2(CPUPPCState *env)
     /* Memory management */
     register_low_BATs(env);
     register_high_BATs(env);
-    register_6xx_7xx_soft_tlb(env, 64, 2);
+    register_soft_tlb_sprs(env, 64, 2);
     init_excp_G2(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -3738,7 +3738,7 @@ static void init_proc_603(CPUPPCState *env)
 
     /* Memory management */
     register_low_BATs(env);
-    register_6xx_7xx_soft_tlb(env, 64, 2);
+    register_soft_tlb_sprs(env, 64, 2);
     init_excp_603(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -4499,7 +4499,7 @@ static void init_proc_745(CPUPPCState *env)
     /* Memory management */
     register_low_BATs(env);
     register_high_BATs(env);
-    register_6xx_7xx_soft_tlb(env, 64, 2);
+    register_soft_tlb_sprs(env, 64, 2);
     init_excp_7x5(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
-- 
2.34.1


