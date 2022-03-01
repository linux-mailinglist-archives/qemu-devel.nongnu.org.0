Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 175554C8D23
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 14:59:42 +0100 (CET)
Received: from localhost ([::1]:50588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP32S-0008PS-8U
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 08:59:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP2zd-0005f5-2P; Tue, 01 Mar 2022 08:56:45 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:10388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP2zb-00022c-7M; Tue, 01 Mar 2022 08:56:44 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 221DBqrn032633; 
 Tue, 1 Mar 2022 13:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=sZ0HIjKjxTnflZ/xf+1R0NjOgPxuWt0UAPwtBEa5K3U=;
 b=Wf4NefDPFv6Sm0IVJEipEgvf+dyM2Ctg33qJjDa7GS6lyhD1MPF/p31nPhIg9/uAV7Gm
 FXA082vnnF9J8ZCG7TTxhbTlbac+qw/Rnw8H1ZRM/yQ8qn4UGdARV8x4DUR39fWx5Bjs
 ArkEHnOzwDkZaA0OiOTT33SapZ/SzCg5vreC6uKuLwnU9x6o9h1FbSSDZEjAImJs8Is6
 yJB9U9rOucb3WKFPyhumQAeys/lSpNneAEqUqWfbiQdYPurui4Qy6sbaGdOzvUr7gWq1
 yB8+pQuITjYELZriYTWidwNQFGeBaR3ka5vNCTPxUQUM9Ch9l0fGRXguZjTn3uKYZS99 8g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ehm5es000-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:31 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 221DmSGj019323;
 Tue, 1 Mar 2022 13:56:31 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ehm5eryya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:31 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 221DtmGo030100;
 Tue, 1 Mar 2022 13:56:30 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02wdc.us.ibm.com with ESMTP id 3efbu9w0tf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:30 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 221DuTMa28180896
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 13:56:29 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52388BE058;
 Tue,  1 Mar 2022 13:56:29 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF3BABE053;
 Tue,  1 Mar 2022 13:56:27 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.51.129])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Mar 2022 13:56:27 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/17] target/ppc: Add a tracepoint for System Calls
Date: Tue,  1 Mar 2022 10:56:04 -0300
Message-Id: <20220301135620.2411952-2-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301135620.2411952-1-farosas@linux.ibm.com>
References: <20220301135620.2411952-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: R31JGdENjXO1fDnEE3nmTiLdcn06pWiM
X-Proofpoint-GUID: Cb1DgGEM7jPFx6IpikqeeT4NrKcP2m8J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-01_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203010074
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

This replaces the old dump_syscall qemu_log print with a
tracepoint. One immediate effect of this is that we can now avoid
flooding the console with syscall prints when debugging.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 53 ++++++----------------------------------
 target/ppc/trace-events  |  2 ++
 target/ppc/trace.h       | 18 ++++++++++++++
 3 files changed, 27 insertions(+), 46 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index d3e2cfcd71..dd1e9c20b9 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -105,33 +105,6 @@ static const char *powerpc_excp_name(int excp)
     }
 }
 
-static void dump_syscall(CPUPPCState *env)
-{
-    qemu_log_mask(CPU_LOG_INT, "syscall r0=%016" PRIx64
-                  " r3=%016" PRIx64 " r4=%016" PRIx64 " r5=%016" PRIx64
-                  " r6=%016" PRIx64 " r7=%016" PRIx64 " r8=%016" PRIx64
-                  " nip=" TARGET_FMT_lx "\n",
-                  ppc_dump_gpr(env, 0), ppc_dump_gpr(env, 3),
-                  ppc_dump_gpr(env, 4), ppc_dump_gpr(env, 5),
-                  ppc_dump_gpr(env, 6), ppc_dump_gpr(env, 7),
-                  ppc_dump_gpr(env, 8), env->nip);
-}
-
-static void dump_hcall(CPUPPCState *env)
-{
-    qemu_log_mask(CPU_LOG_INT, "hypercall r3=%016" PRIx64
-                  " r4=%016" PRIx64 " r5=%016" PRIx64 " r6=%016" PRIx64
-                  " r7=%016" PRIx64 " r8=%016" PRIx64 " r9=%016" PRIx64
-                  " r10=%016" PRIx64 " r11=%016" PRIx64 " r12=%016" PRIx64
-                  " nip=" TARGET_FMT_lx "\n",
-                  ppc_dump_gpr(env, 3), ppc_dump_gpr(env, 4),
-                  ppc_dump_gpr(env, 5), ppc_dump_gpr(env, 6),
-                  ppc_dump_gpr(env, 7), ppc_dump_gpr(env, 8),
-                  ppc_dump_gpr(env, 9), ppc_dump_gpr(env, 10),
-                  ppc_dump_gpr(env, 11), ppc_dump_gpr(env, 12),
-                  env->nip);
-}
-
 static void ppc_excp_debug_sw_tlb(CPUPPCState *env, int excp)
 {
     const char *es;
@@ -502,7 +475,7 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
         }
         break;
     case POWERPC_EXCP_SYSCALL:   /* System call exception                    */
-        dump_syscall(env);
+        trace_ppc_syscall(env, 0);
 
         /*
          * We need to correct the NIP which in this case is supposed
@@ -646,7 +619,7 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
         }
         break;
     case POWERPC_EXCP_SYSCALL:   /* System call exception                    */
-        dump_syscall(env);
+        trace_ppc_syscall(env, 0);
 
         /*
          * We need to correct the NIP which in this case is supposed
@@ -822,11 +795,7 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
     {
         int lev = env->error_code;
 
-        if (lev == 1 && cpu->vhyp) {
-            dump_hcall(env);
-        } else {
-            dump_syscall(env);
-        }
+        trace_ppc_syscall(env, lev);
 
         /*
          * We need to correct the NIP which in this case is supposed
@@ -1007,11 +976,7 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
     {
         int lev = env->error_code;
 
-        if ((lev == 1) && cpu->vhyp) {
-            dump_hcall(env);
-        } else {
-            dump_syscall(env);
-        }
+        trace_ppc_syscall(env, lev);
 
         /*
          * We need to correct the NIP which in this case is supposed
@@ -1206,7 +1171,7 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
         }
         break;
     case POWERPC_EXCP_SYSCALL:   /* System call exception                    */
-        dump_syscall(env);
+        trace_ppc_syscall(env, 0);
 
         /*
          * We need to correct the NIP which in this case is supposed
@@ -1467,11 +1432,7 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_SYSCALL:   /* System call exception                    */
         lev = env->error_code;
 
-        if ((lev == 1) && cpu->vhyp) {
-            dump_hcall(env);
-        } else {
-            dump_syscall(env);
-        }
+        trace_ppc_syscall(env, lev);
 
         /*
          * We need to correct the NIP which in this case is supposed
@@ -1492,7 +1453,7 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
         break;
     case POWERPC_EXCP_SYSCALL_VECTORED: /* scv exception                     */
         lev = env->error_code;
-        dump_syscall(env);
+        trace_ppc_syscall(env, 0);
         env->nip += 4;
         new_msr |= env->msr & ((target_ulong)1 << MSR_EE);
         new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
diff --git a/target/ppc/trace-events b/target/ppc/trace-events
index 53b107f56e..0f6af7d73f 100644
--- a/target/ppc/trace-events
+++ b/target/ppc/trace-events
@@ -36,3 +36,5 @@ ppc_excp_isi(uint64_t msr, uint64_t nip) "ISI exception: msr=0x%016" PRIx64 " ni
 ppc_excp_fp_ignore(void) "Ignore floating point exception"
 ppc_excp_inval(uint64_t nip) "Invalid instruction at 0x%" PRIx64
 ppc_excp_print(const char *excp) "%s exception"
+ppc_excp_syscall(unsigned long r0, unsigned long r3, unsigned long r4, unsigned long r5, unsigned long r6, unsigned long r7, unsigned long r8, unsigned long nip) "r0=0x%016" PRIx64 " r3=0x%016" PRIx64 " r4=0x%016" PRIx64 " r5=0x%016" PRIx64 " r6=0x%016" PRIx64 " r7=0x%016" PRIx64 " r8=0x%016" PRIx64 " nip=0x%" PRIx64
+ppc_excp_hypercall(unsigned long r3, unsigned long r4, unsigned long r5, unsigned long r6, unsigned long r7, unsigned long r8, unsigned long r9, unsigned long r10, unsigned long nip) "r3=0x%016" PRIx64 " r4=0x%016" PRIx64 " r5=0x%016" PRIx64 " r6=0x%016" PRIx64 " r7=0x%016" PRIx64 " r8=0x%016" PRIx64 " r9=0x%016" PRIx64 " r10=0x%016" PRIx64 " nip=0x%" PRIx64
diff --git a/target/ppc/trace.h b/target/ppc/trace.h
index a9e8962828..49adcfc1e6 100644
--- a/target/ppc/trace.h
+++ b/target/ppc/trace.h
@@ -1 +1,19 @@
 #include "trace/trace-target_ppc.h"
+
+static inline void trace_ppc_syscall(CPUPPCState *env, int lev)
+{
+    PowerPCCPU *cpu = env_archcpu(env);
+
+    if (lev == 1 && cpu->vhyp) {
+        trace_ppc_excp_hypercall(ppc_dump_gpr(env, 3), ppc_dump_gpr(env, 4),
+                                 ppc_dump_gpr(env, 5), ppc_dump_gpr(env, 6),
+                                 ppc_dump_gpr(env, 7), ppc_dump_gpr(env, 8),
+                                 ppc_dump_gpr(env, 9), ppc_dump_gpr(env, 10),
+                                 env->nip);
+    } else {
+        trace_ppc_excp_syscall(ppc_dump_gpr(env, 0), ppc_dump_gpr(env, 3),
+                               ppc_dump_gpr(env, 4), ppc_dump_gpr(env, 5),
+                               ppc_dump_gpr(env, 6), ppc_dump_gpr(env, 7),
+                               ppc_dump_gpr(env, 8), env->nip);
+    }
+}
-- 
2.34.1


