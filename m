Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F454838C0
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 23:15:06 +0100 (CET)
Received: from localhost ([::1]:58342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4Vbd-0001jC-Ir
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 17:15:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n4VV7-00050C-S2; Mon, 03 Jan 2022 17:08:21 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n4VV6-00022O-98; Mon, 03 Jan 2022 17:08:21 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 203Igi6j014100; 
 Mon, 3 Jan 2022 22:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=IYDpOdIfccKYPQKZFDKk2RnjZA4r8rEzn1vdcmd2S1U=;
 b=QwnIzq1SsZ6eyliVJRnpbpfSrm/WPcnVbFgNiO5f8hYMeOY82od1LsvqfTRICr4k9i7d
 U/bM0mmak4GId2dcaBsXySJ21XyycrIAGJ6pALMYUtUhuulsVFsG960hGjb5znRFUaID
 U/xN9wMiggTcLNrDNCCc7JbhH5r9uMCY4A+4lvOHCqG1rZhGWOkODyIoDSTWy0syT6vT
 P6qY3FAkaZTWRhMyo/ka7pEYTL00RV1dSzV1rs4cGF2K+iZILfuqO40ShzCpFgW2O+fO
 hjY6yzvKczkyBD6cjEN5RiUL2YLPBjiuwrcWAdbCw9zj00JnPAQdRZSLp/d81ZSiSoGS GA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dc6nrje5s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 22:08:14 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 203M1YWH022305;
 Mon, 3 Jan 2022 22:08:14 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dc6nrje5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 22:08:14 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 203LwUDv001156;
 Mon, 3 Jan 2022 22:08:13 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04dal.us.ibm.com with ESMTP id 3daekar3xu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 22:08:13 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 203M8CYE31719834
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Jan 2022 22:08:12 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D83878063;
 Mon,  3 Jan 2022 22:08:12 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC29978067;
 Mon,  3 Jan 2022 22:08:10 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.145.159])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  3 Jan 2022 22:08:10 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 9/9] target/ppc: Introduce a wrapper for powerpc_excp
Date: Mon,  3 Jan 2022 19:07:46 -0300
Message-Id: <20220103220746.3916246-10-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220103220746.3916246-1-farosas@linux.ibm.com>
References: <20220103220746.3916246-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xkp5j1QbU59JLlNnCOIIhT9OEgyWL8YS
X-Proofpoint-ORIG-GUID: NTDAeX2_RTNADVa5dIbIWgMAhN4S_qiD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-03_08,2022-01-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 bulkscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201030147
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index a4787c3ae2..15c492a934 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -336,7 +336,7 @@ static inline void powerpc_set_excp_state(PowerPCCPU *cpu,
  * Note that this function should be greatly optimized when called
  * with a constant excp, from ppc_hw_interrupt
  */
-static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
+static inline void powerpc_excp_legacy(PowerPCCPU *cpu, int excp)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
@@ -805,6 +805,16 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
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


