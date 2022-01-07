Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05654487F0A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 23:41:43 +0100 (CET)
Received: from localhost ([::1]:54636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5xva-0005J6-5c
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 17:41:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n5xh3-0002hU-4F; Fri, 07 Jan 2022 17:26:41 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:62278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n5xh1-0006ik-Ja; Fri, 07 Jan 2022 17:26:40 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 207M7WxN008102; 
 Fri, 7 Jan 2022 22:26:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=fgcqP2+spGFib+e2n1p58RXG6hZI3lTa1DErVa5FmIM=;
 b=PXxj3CFxcvpe51xbB4PKiAkq/Jvpr++o8jRfa3FqEa0oIVKPqqIv4g1f/74BU4gr3Bxp
 Dbz0xeFGW1yBHI6VELYzVeS0/AkCXnQYZcoE6KECpacUWC4p6Q6Y/W7WHUwZ5fyu5uWt
 i0qR4tG44r6TCgVVBkhzojnkEpwVChzacc/gulhZI47CG1UILdLeBUOHkyWj4oZxTL8O
 7tCpFVOpuC/AdGaiixlihg6PNbUayQCA/ZlYzWTkt3UFoaifp1QJRAo8SW2ljg1OwGgF
 y11a5bZM6bt1BLPWIvd/fh9tT+QBfo2lq8R/1d26arndTxh8c7wwX68Fg6YcX6XWC6cU nQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de4wgb2x3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 22:26:24 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 207MQOAt007373;
 Fri, 7 Jan 2022 22:26:24 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de4wgb2wn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 22:26:24 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 207MHsUi002437;
 Fri, 7 Jan 2022 22:26:22 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02wdc.us.ibm.com with ESMTP id 3de5rq7tsw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 22:26:22 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 207MQMsg34603464
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Jan 2022 22:26:22 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 165E6BE05D;
 Fri,  7 Jan 2022 22:26:22 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F173BE056;
 Fri,  7 Jan 2022 22:26:20 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.59.174])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  7 Jan 2022 22:26:20 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/8] target/ppc: Use ppc_interrupts_little_endian in
 powerpc_excp
Date: Fri,  7 Jan 2022 19:25:59 -0300
Message-Id: <20220107222601.4101511-7-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220107222601.4101511-1-farosas@linux.ibm.com>
References: <20220107222601.4101511-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6tMJcMMXlPtBKmW1dJ6ATsYB886K1QJX
X-Proofpoint-GUID: uuHnsb_kfO5xPolQ8RiJFb2Q7lIL2BNS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_10,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=806 priorityscore=1501
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201070130
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ppc_interrupts_little_endian function is now suitable for
determining the endianness of interrupts for all CPUs.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/excp_helper.c | 29 +----------------------------
 1 file changed, 1 insertion(+), 28 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 3a430f23d6..3b4123bc65 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -832,36 +832,9 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp)
      * Sort out endianness of interrupt, this differs depending on the
      * CPU, the HV mode, etc...
      */
-#ifdef TARGET_PPC64
-    if (excp_model == POWERPC_EXCP_POWER7) {
-        if (!(new_msr & MSR_HVB) && (env->spr[SPR_LPCR] & LPCR_ILE)) {
-            new_msr |= (target_ulong)1 << MSR_LE;
-        }
-    } else if (excp_model == POWERPC_EXCP_POWER8) {
-        if (new_msr & MSR_HVB) {
-            if (env->spr[SPR_HID0] & HID0_HILE) {
-                new_msr |= (target_ulong)1 << MSR_LE;
-            }
-        } else if (env->spr[SPR_LPCR] & LPCR_ILE) {
-            new_msr |= (target_ulong)1 << MSR_LE;
-        }
-    } else if (excp_model == POWERPC_EXCP_POWER9 ||
-               excp_model == POWERPC_EXCP_POWER10) {
-        if (new_msr & MSR_HVB) {
-            if (env->spr[SPR_HID0] & HID0_POWER9_HILE) {
-                new_msr |= (target_ulong)1 << MSR_LE;
-            }
-        } else if (env->spr[SPR_LPCR] & LPCR_ILE) {
-            new_msr |= (target_ulong)1 << MSR_LE;
-        }
-    } else if (msr_ile) {
+    if (ppc_interrupts_little_endian(cpu, !!(new_msr & MSR_HVB))) {
         new_msr |= (target_ulong)1 << MSR_LE;
     }
-#else
-    if (msr_ile) {
-        new_msr |= (target_ulong)1 << MSR_LE;
-    }
-#endif
 
 #if defined(TARGET_PPC64)
     if (excp_model == POWERPC_EXCP_BOOKE) {
-- 
2.33.1


