Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D89594B79C2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 22:49:56 +0100 (CET)
Received: from localhost ([::1]:46204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK5hr-00044U-VZ
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 16:49:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK5af-0003gk-Dz; Tue, 15 Feb 2022 16:42:29 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:1144
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK5ac-0002WB-EQ; Tue, 15 Feb 2022 16:42:29 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FLCJ0g028119; 
 Tue, 15 Feb 2022 21:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Ak3OGe62O3jP4hU+4ysVhE0GpKofFgRZKG+M5gW7/Rg=;
 b=FawbYTaBNo+dVuqUQtyI+D3rYxCNjgIz86ws8qYmOscKmmhOXxxK0TupwL0gA5BDoUvk
 SnUZGmy3F41wQt74WsnvIU4CCP8c03PLYxvAnaTZlInwqFH7aL+K0SVmnJs2GU8ddUbK
 OOiLkRPlNIxb8oAAMzELcPIXjlyi6nncpfBeq8bxlVBPfZsCUOcxDJPu+8i04eWsEAbu
 32/R2ge72HUAEhoDmWQw4cyPPUBKVZ4JEBifSTPgUQ9zR63lb/+7I03PUMNkgwXKGeVA
 tnRnvlISRQg7rY0OfQVUrQleQVEvLMWKh6tM46XaCIsFwXUXFJn/tcIj9SUPaCIM8KxF fA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e8kvtrmn4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:15 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21FLa6uW016174;
 Tue, 15 Feb 2022 21:42:14 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e8kvtrmmv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:14 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21FLNRwG003748;
 Tue, 15 Feb 2022 21:42:14 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01wdc.us.ibm.com with ESMTP id 3e877fhb9s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:14 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21FLgDRU33685770
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 21:42:13 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 126A6BE054;
 Tue, 15 Feb 2022 21:42:13 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 995BEBE04F;
 Tue, 15 Feb 2022 21:42:11 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.143.123])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 15 Feb 2022 21:42:11 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/27] target/ppc: cpu_init: Decouple G2 SPR registration from
 755
Date: Tue, 15 Feb 2022 18:41:29 -0300
Message-Id: <20220215214148.1848266-9-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215214148.1848266-1-farosas@linux.ibm.com>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SYtCsLefQSEbIHaVDF28uf6cfOSML7RW
X-Proofpoint-ORIG-GUID: JhGMQMNZJOgGu7KsRTrq_fTSDouvCLV8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_06,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202150122
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

We're considering these two to be in different CPU families (6xx and
7xx), so keep their SPR registration separate.

The code was copied into register_G2_sprs and the common function was
renamed to apply only to the 755.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu_init.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 29f25e093f..6a367f2bbc 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -466,8 +466,7 @@ static void register_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways
 #endif
 }
 
-/* SPR common to MPC755 and G2 */
-static void register_G2_755_sprs(CPUPPCState *env)
+static void register_755_sprs(CPUPPCState *env)
 {
     /* SGPRs */
     spr_register(env, SPR_SPRG4, "SPRG4",
@@ -783,6 +782,23 @@ static void register_G2_sprs(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
 
+    /* SGPRs */
+    spr_register(env, SPR_SPRG4, "SPRG4",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SPRG5, "SPRG5",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SPRG6, "SPRG6",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SPRG7, "SPRG7",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
 }
 
 static void register_74xx_sprs(CPUPPCState *env)
@@ -2852,7 +2868,6 @@ static void init_proc_G2(CPUPPCState *env)
 {
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
-    register_G2_755_sprs(env);
     register_G2_sprs(env);
 
     /* Memory management */
@@ -4474,7 +4489,7 @@ static void init_proc_745(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    register_G2_755_sprs(env);
+    register_755_sprs(env);
     /* Thermal management */
     register_thrm_sprs(env);
     /* Hardware implementation registers */
@@ -4547,7 +4562,7 @@ static void init_proc_755(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    register_G2_755_sprs(env);
+    register_755_sprs(env);
     /* L2 cache control */
     spr_register(env, SPR_L2CR, "L2CR",
                  SPR_NOACCESS, SPR_NOACCESS,
-- 
2.34.1


