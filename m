Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 748734C8D4A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 15:06:54 +0100 (CET)
Received: from localhost ([::1]:36374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP39R-0001I7-Io
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 09:06:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP2zv-0006Hy-2P; Tue, 01 Mar 2022 08:57:03 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:17768
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP2zt-00025l-8a; Tue, 01 Mar 2022 08:57:02 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 221DgYdp003461; 
 Tue, 1 Mar 2022 13:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=GXSuQCow1IOeQZcKuP+cHB7qsqoqywsNO2XyyIhEDaA=;
 b=lL55UhNuZMs1QVrZnlfm2cRSxcMmFDq4zFDPGyxsNIPgx5c5oe9zOHsKb4bnt/Nq4yCc
 72DRu+vwZutUQWTx9BGf9M4QH8FaZ25nUWo7DC7SXJH/vk8Xh352Y8c57dYpL2JyYwY3
 yitsJdOzBsuKkCS2IORbEgo0JsqUEUWC4iARUwsHCv9Seddcd9kHtCBeWFObeu6feJAk
 viW8me337sJbGpRfNl428y5jlJyv94iDl3bMftGYks1A6PT1JBniiufopJmv/SZeNCpk
 +CUrCM4wjIfuIbQ3tX9m5ECVSg47MGMMqaVWdjwD08XCcEQ1oFiMPFQnI7U1dJKELa4e 1A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ehmku09vu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:50 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 221Djbd2010723;
 Tue, 1 Mar 2022 13:56:49 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ehmku09vb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:49 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 221DtRZT030873;
 Tue, 1 Mar 2022 13:56:49 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 3efbu9w13j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:49 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 221DulSq40698354
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 13:56:48 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB8DCBE054;
 Tue,  1 Mar 2022 13:56:47 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 58146BE04F;
 Tue,  1 Mar 2022 13:56:46 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.51.129])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Mar 2022 13:56:46 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/17] target/ppc: Expose some excp_helper functions
Date: Tue,  1 Mar 2022 10:56:13 -0300
Message-Id: <20220301135620.2411952-11-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301135620.2411952-1-farosas@linux.ibm.com>
References: <20220301135620.2411952-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LfqsVomC7w6OGaM8lKjG175aiYmqYC1X
X-Proofpoint-ORIG-GUID: dXlkHLpYtjTGUg4EQ3VMH9Qq-H8Abw0b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-01_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2203010074
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

The next patches will move the powerpc_excp_foo functions into the
proper cpu_foo.c files. This patch makes visible some functions that
are common to all of them.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu.h         | 5 +++++
 target/ppc/excp_helper.c | 8 ++++----
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 1b687521c7..c7bb10b0bf 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -175,6 +175,11 @@ enum {
     POWERPC_EXCP_TRAP          = 0x40,
 };
 
+const char *powerpc_excp_name(int excp);
+void powerpc_set_excp_state(PowerPCCPU *cpu,
+                            target_ulong vector, target_ulong msr);
+void powerpc_reset_excp_state(PowerPCCPU *cpu);
+
 #define PPC_INPUT(env) ((env)->bus_model)
 
 /*****************************************************************************/
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 2b5b1e00d8..07190d785a 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -36,7 +36,7 @@
 /* Exception processing */
 #if !defined(CONFIG_USER_ONLY)
 
-static const char *powerpc_excp_name(int excp)
+const char *powerpc_excp_name(int excp)
 {
     switch (excp) {
     case POWERPC_EXCP_CRITICAL: return "CRITICAL";
@@ -335,7 +335,7 @@ static void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp, target_ulong msr,
 }
 #endif
 
-static void powerpc_reset_excp_state(PowerPCCPU *cpu)
+void powerpc_reset_excp_state(PowerPCCPU *cpu)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
@@ -345,8 +345,8 @@ static void powerpc_reset_excp_state(PowerPCCPU *cpu)
     env->error_code = 0;
 }
 
-static void powerpc_set_excp_state(PowerPCCPU *cpu, target_ulong vector,
-                                   target_ulong msr)
+void powerpc_set_excp_state(PowerPCCPU *cpu, target_ulong vector,
+                            target_ulong msr)
 {
     CPUPPCState *env = &cpu->env;
 
-- 
2.34.1


