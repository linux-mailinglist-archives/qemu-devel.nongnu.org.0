Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 327634B8E1B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 17:36:49 +0100 (CET)
Received: from localhost ([::1]:40360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKNIO-0000q0-8z
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 11:36:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN7B-0001uq-D8; Wed, 16 Feb 2022 11:25:13 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:27240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN79-0001R3-BO; Wed, 16 Feb 2022 11:25:13 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21GFkQww021642; 
 Wed, 16 Feb 2022 16:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=P7c+PQA+CnSmSEKRz8y9SPdfgozLT79qm9JRzTDfT2Q=;
 b=QC8GuQHuOdROsjOajbzaAqRZ8x6ol6D4Q1Pz554mMevBRWWW4JqwBcskNsAHAO0GfaO2
 hTG4/zLSaU+QQledgNHEUVsyaYdv/WCF9Y6DGbs0xirON0P8rg68ZJZNPUCYZABdcelC
 sUJI0vYj7KVrPCRQq9S1d4JVHDX7n/yc9rZ4itGYfryLmj3XXe5+CiTZhsB2GOrr1BzM
 1ayR1FYWTzMBq3j0nAsIEIngLYq1BLNnLP95CNGRiSIe8GkVOy9YJ5H0be9Tf8x/YNCb
 u3WfllWzxDVnnMnlbuud7yxRIdN61y+tvuHU/yFAp2mFC0cI8iweylM8cn7CblQ3lCOV yA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e9473s1jp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:25:05 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21GFlVwf031386;
 Wed, 16 Feb 2022 16:25:05 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e9473s1jc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:25:05 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21GGBrwj022953;
 Wed, 16 Feb 2022 16:25:04 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 3e64hcfyd2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:25:04 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21GGP2Ax14024978
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 16:25:03 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E08E97807C;
 Wed, 16 Feb 2022 16:25:02 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67E517806B;
 Wed, 16 Feb 2022 16:25:01 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.144.50])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Feb 2022 16:25:01 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/27] target/ppc: cpu_init: Move 755 L2 cache SPRs into a
 function
Date: Wed, 16 Feb 2022 13:24:14 -0300
Message-Id: <20220216162426.1885923-16-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216162426.1885923-1-farosas@linux.ibm.com>
References: <20220216162426.1885923-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xmK7dxsEdPTKolgv9TIvoIRJP1iJzsuN
X-Proofpoint-ORIG-GUID: YSdfDbqZIIPYlb3EHctcNuDH3A9uwdbc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_07,2022-02-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 spamscore=0 clxscore=1015 mlxlogscore=999 adultscore=0 impostorscore=0
 mlxscore=0 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202160095
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

This is just to have 755-specific registers contained into a function,
intead of leaving them open-coded in init_proc_755. It makes init_proc
easier to read and keeps later patches that touch this code a bit
cleaner.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu_init.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index ea4ed19bde..d6e19e9cf0 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -503,6 +503,20 @@ static void register_745_sprs(CPUPPCState *env)
                  0x00000000);
 }
 
+static void register_755_sprs(CPUPPCState *env)
+{
+    /* L2 cache control */
+    spr_register(env, SPR_L2CR, "L2CR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, spr_access_nop,
+                 0x00000000);
+
+    spr_register(env, SPR_L2PMCR, "L2PMCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
 /* SPR common to all 7xx PowerPC implementations */
 static void register_7xx_sprs(CPUPPCState *env)
 {
@@ -4549,16 +4563,8 @@ static void init_proc_755(CPUPPCState *env)
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
     register_745_sprs(env);
-    /* L2 cache control */
-    spr_register(env, SPR_L2CR, "L2CR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, spr_access_nop,
-                 0x00000000);
+    register_755_sprs(env);
 
-    spr_register(env, SPR_L2PMCR, "L2PMCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
     /* Thermal management */
     register_thrm_sprs(env);
 
-- 
2.34.1


