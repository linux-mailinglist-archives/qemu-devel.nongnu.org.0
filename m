Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE2A485A3F
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 21:50:52 +0100 (CET)
Received: from localhost ([::1]:51354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5DFD-00062o-R4
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 15:50:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n5D5o-0002rx-HU; Wed, 05 Jan 2022 15:41:09 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n5D5m-0001UU-UW; Wed, 05 Jan 2022 15:41:08 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 205IBmNl030275; 
 Wed, 5 Jan 2022 20:40:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=VbYgCA48pX8H7Pxh3aL6Xrxo43DKLYiZLktJpL3NgDw=;
 b=Sb0xQUzia1NIhvllbUuRYJTM+9qM5iXMNr7ZTiI+iGXNDUuKVQxpV3eH88L7QcuOmWLZ
 0QFEtqq0KFMbfSRfIEbXj/vI8sVbaQoj0zFYmXKyR62ag5tavr5RZwIeMO+euu/An8VD
 JlI9I4EWXDWi2nLw1n2356Ym+5rOHfcdj7gnUH9PgyFhVpKFzsB8fA4SQK21oGavLDSv
 TqcMdcd5yXtlfjDY+UrJOJVGCjJH2MelkBSxDFswkFUdBdyfFdR7VOhXQ7o0sklPNaeD
 q5DGeAHg9tnY55qSH+4+jjXrONDvEi7CL4+H3tk/4UpNTSX1ieYf8P7TZoy7lf/fyS3n Cw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcp2r813q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 20:40:54 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 205KFWE9015744;
 Wed, 5 Jan 2022 20:40:53 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcp2r813j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 20:40:53 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 205KVuLa002927;
 Wed, 5 Jan 2022 20:40:53 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma05wdc.us.ibm.com with ESMTP id 3daekbdv8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 20:40:53 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 205Keq1N34079162
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Jan 2022 20:40:52 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 536BC78064;
 Wed,  5 Jan 2022 20:40:52 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AECE378066;
 Wed,  5 Jan 2022 20:40:50 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.59.200])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  5 Jan 2022 20:40:50 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/7] target/ppc: Introduce a wrapper for powerpc_excp
Date: Wed,  5 Jan 2022 17:40:29 -0300
Message-Id: <20220105204029.4058500-8-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220105204029.4058500-1-farosas@linux.ibm.com>
References: <20220105204029.4058500-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9SiuIVpQ8RbrrpR3cBmypVsQEQqT1Xw9
X-Proofpoint-ORIG-GUID: ZCH6t-dQFk5jJ6uS4OyvvF-vMbU1F9aC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_06,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201050133
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Next patches will split powerpc_excp in multiple family specific
handlers. This patch adds a wrapper to make the transition clearer.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index d16bdf9283..ea854a868e 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -397,7 +397,7 @@ static void powerpc_set_excp_state(PowerPCCPU *cpu,
  * Note that this function should be greatly optimized when called
  * with a constant excp, from ppc_hw_interrupt
  */
-static void powerpc_excp(PowerPCCPU *cpu, int excp)
+static inline void powerpc_excp_legacy(PowerPCCPU *cpu, int excp)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
@@ -868,6 +868,16 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp)
     powerpc_set_excp_state(cpu, vector, new_msr);
 }
 
+static void powerpc_excp(PowerPCCPU *cpu, int excp)
+{
+    CPUPPCState *env = &cpu->env;
+
+    switch (env->excp_model) {
+    default:
+        powerpc_excp_legacy(cpu, excp);
+    }
+}
+
 void ppc_cpu_do_interrupt(CPUState *cs)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
-- 
2.33.1


