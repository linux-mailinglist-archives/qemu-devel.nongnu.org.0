Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C35ED397BE0
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 23:49:27 +0200 (CEST)
Received: from localhost ([::1]:48434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loCGM-0005Bf-G0
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 17:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1loCE7-0001js-Ol; Tue, 01 Jun 2021 17:47:07 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49050
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1loCE5-0004L3-Pq; Tue, 01 Jun 2021 17:47:07 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 151LZ4du008232; Tue, 1 Jun 2021 17:46:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=FnsaOC4D7Yh9fRvenSTiJG+0WYku/Lut/jlSYrzuTlU=;
 b=IAZTUHJNOBv4QJZ1Y5XX3JkMMWpo71FvrEJuWK+nzS1N/3Ii8h7hIhE4dCjC4b5d922N
 1a0dl2LxRSqM3mnMSWNiZfXFyxUa41SAl3HAUhcieiG3yaN8eW/WLR2OdkUVPX1kM0xV
 +tS6yOBgQgtXd5uaSEy/r/9TzzDyEGgVvmSjGmSaFEDDp9O+yf82HM37onDIutLXz7Si
 IzjqkKJcc4OsVtcM8l+0Wv9L97H+wPrSAiL8VdAlK6btJBv8KlW+q1QLH8EB8tuoe8Z7
 Fsl5nx2Vx7J75s7Lpf0NtE8bLGJt29HVv12dXv4PEvU6GNlGaO5Rh3rgUrxmxScl14to uQ== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38wu1a39kb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 17:46:57 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 151LgiWr019169;
 Tue, 1 Jun 2021 21:46:57 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02wdc.us.ibm.com with ESMTP id 38ud89jqm0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 21:46:57 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 151LkuQo16712142
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Jun 2021 21:46:56 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0D9078063;
 Tue,  1 Jun 2021 21:46:55 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96B6278060;
 Tue,  1 Jun 2021 21:46:54 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.142.192])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Jun 2021 21:46:54 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/5] target/ppc: powerpc_excp: Move lpes code to where it
 is used
Date: Tue,  1 Jun 2021 18:46:45 -0300
Message-Id: <20210601214649.785647-2-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210601214649.785647-1-farosas@linux.ibm.com>
References: <20210601214649.785647-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: D3jdj7F9pvVVCm1JuJO9Bgd8eZb_7YSo
X-Proofpoint-ORIG-GUID: D3jdj7F9pvVVCm1JuJO9Bgd8eZb_7YSo
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-01_12:2021-06-01,
 2021-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106010143
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 47 +++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 04418054f5..5ea8503b46 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -333,7 +333,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
     CPUPPCState *env = &cpu->env;
     target_ulong msr, new_msr, vector;
     int srr0, srr1, asrr0, asrr1, lev = -1;
-    bool lpes0;
 
     qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
                   " => %08x (%02x)\n", env->nip, excp, env->error_code);
@@ -365,27 +364,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
         excp = powerpc_reset_wakeup(cs, env, excp, &msr);
     }
 
-    /*
-     * Exception targeting modifiers
-     *
-     * LPES0 is supported on POWER7/8/9
-     * LPES1 is not supported (old iSeries mode)
-     *
-     * On anything else, we behave as if LPES0 is 1
-     * (externals don't alter MSR:HV)
-     */
-#if defined(TARGET_PPC64)
-    if (excp_model == POWERPC_EXCP_POWER7 ||
-        excp_model == POWERPC_EXCP_POWER8 ||
-        excp_model == POWERPC_EXCP_POWER9 ||
-        excp_model == POWERPC_EXCP_POWER10) {
-        lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
-    } else
-#endif /* defined(TARGET_PPC64) */
-    {
-        lpes0 = true;
-    }
-
     /*
      * Hypervisor emulation assistance interrupt only exists on server
      * arch 2.05 server or later. We also don't want to generate it if
@@ -473,8 +451,32 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
         msr |= env->error_code;
         break;
     case POWERPC_EXCP_EXTERNAL:  /* External input                           */
+    {
+        bool lpes0;
+
         cs = CPU(cpu);
 
+        /*
+         * Exception targeting modifiers
+         *
+         * LPES0 is supported on POWER7/8/9
+         * LPES1 is not supported (old iSeries mode)
+         *
+         * On anything else, we behave as if LPES0 is 1
+         * (externals don't alter MSR:HV)
+         */
+#if defined(TARGET_PPC64)
+        if (excp_model == POWERPC_EXCP_POWER7 ||
+            excp_model == POWERPC_EXCP_POWER8 ||
+            excp_model == POWERPC_EXCP_POWER9 ||
+            excp_model == POWERPC_EXCP_POWER10) {
+            lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
+        } else
+#endif /* defined(TARGET_PPC64) */
+        {
+            lpes0 = true;
+        }
+
         if (!lpes0) {
             new_msr |= (target_ulong)MSR_HVB;
             new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
@@ -486,6 +488,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
             env->spr[SPR_BOOKE_EPR] = ldl_phys(cs->as, env->mpic_iack);
         }
         break;
+    }
     case POWERPC_EXCP_ALIGN:     /* Alignment exception                      */
         /* Get rS/rD and rA from faulting opcode */
         /*
-- 
2.29.2


