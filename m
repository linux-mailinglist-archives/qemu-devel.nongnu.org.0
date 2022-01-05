Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FA6485A3E
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 21:49:10 +0100 (CET)
Received: from localhost ([::1]:48734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5DDZ-0004D4-Un
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 15:49:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n5D5n-0002qM-78; Wed, 05 Jan 2022 15:41:07 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n5D5l-0001Kk-IG; Wed, 05 Jan 2022 15:41:06 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 205IwZY4004437; 
 Wed, 5 Jan 2022 20:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Ee+M3QO+a+IVKglZim3hxS99fdRE3su3CGXvYX8hylc=;
 b=Q4hjUYq9THHRc6kbwYK0PyLv5zZy5odPtu1vd8++/oNYuPdrZbyzbtqpcFWM4VFaVZY5
 LLc2ceHqOTFXxT/oONldSnqLS31TBihV++yncg6tiT4STtiIL6ZV4yOld1bPKXXKXxqY
 mzU84tZtcJLR5AbFx3yOqx1VCFZoP7eNfvi19+XfQ5IJqODBkzE+NuKcSceN9Uje0/4d
 3bpedvZXjj5wrpM2np6tLANkz3zehany1lMVnp/jQb1JXuFMI4alvySdrbbDDLF8EY0H
 q+vs6hFtmla6lkcmvN0qOtR7BBp+Ljbed+zCTTWQsXCwQMryHpsX60kAhMLUsxLDpR/a GA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcqcqpcxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 20:40:52 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 205KGjfY001647;
 Wed, 5 Jan 2022 20:40:52 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcqcqpcx5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 20:40:52 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 205KU4Ev031219;
 Wed, 5 Jan 2022 20:40:51 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03wdc.us.ibm.com with ESMTP id 3dcv2rcwyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 20:40:51 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 205KeoFb34013566
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Jan 2022 20:40:50 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D7F87805E;
 Wed,  5 Jan 2022 20:40:50 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A2EE878060;
 Wed,  5 Jan 2022 20:40:48 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.59.200])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  5 Jan 2022 20:40:48 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/7] target/ppc: Use ppc_interrupts_little_endian in
 powerpc_excp
Date: Wed,  5 Jan 2022 17:40:28 -0300
Message-Id: <20220105204029.4058500-7-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220105204029.4058500-1-farosas@linux.ibm.com>
References: <20220105204029.4058500-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: F5Vk65G6ayCTpIgGB-cX_HZMLUM9dqK2
X-Proofpoint-ORIG-GUID: BXxzR_HNM9hUmjlZzG2oNo1-NNGZOMYO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_06,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 mlxlogscore=756 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201050133
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
---
 target/ppc/excp_helper.c | 29 +----------------------------
 1 file changed, 1 insertion(+), 28 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 92953af896..d16bdf9283 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -833,36 +833,9 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp)
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


