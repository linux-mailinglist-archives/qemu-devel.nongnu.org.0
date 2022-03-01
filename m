Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2989F4C8D76
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 15:14:47 +0100 (CET)
Received: from localhost ([::1]:55388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP3H4-0006Db-8F
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 09:14:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP34k-0005at-V4; Tue, 01 Mar 2022 09:02:02 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38130
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP34V-0003LF-Mr; Tue, 01 Mar 2022 09:02:02 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 221DDY2O013733; 
 Tue, 1 Mar 2022 13:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=GsosNbU5secFvhVxCQaLMNtcNCZ6t8n3RbMzBe3Yp0A=;
 b=dfLtINwJtbLs1ee7rfgUyEiVMTZcDo7RomquWD3RCnrTBi4uyl5RadPYdvD0tvFJpE8p
 zbYSKwtlygv/n493EpgIo1TguI9XOQw+cmJgUTHstI5FowQiAYT8SjbpFvcJE7EMnsTZ
 rocJ9ZkVnq3yCNWVhdTb0BXQKeCUhE6lYaP237pAcLhfakfZF+9kzotJD1wLfyaYOD3z
 WRQhuzZIUfJrXMcph6dGjAbtynWrX8gIqD3PqGoWNF7pa9hYYR6kiKsdVD0T+kepG+Ok
 I3GA6jWHuc7EtrF+ATGOowihajrqE5WF8h34KpRETFOPsnbntPZLP2niDJss9y0hp41A 0g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ehm6e0xkg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:33 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 221Ds6PX022837;
 Tue, 1 Mar 2022 13:56:33 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ehm6e0xk2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:32 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 221DtZmF030911;
 Tue, 1 Mar 2022 13:56:32 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03wdc.us.ibm.com with ESMTP id 3efbu9w11e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:32 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 221DuVlf20906430
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 13:56:31 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C7EDBE056;
 Tue,  1 Mar 2022 13:56:31 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BCDB8BE054;
 Tue,  1 Mar 2022 13:56:29 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.51.129])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Mar 2022 13:56:29 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/17] target/ppc: Use trace-events instead of CPU_LOG_INT
Date: Tue,  1 Mar 2022 10:56:05 -0300
Message-Id: <20220301135620.2411952-3-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301135620.2411952-1-farosas@linux.ibm.com>
References: <20220301135620.2411952-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gB4Z8_QYEv6xWgFV7Df6meTspYx4lRum
X-Proofpoint-ORIG-GUID: U11q_SkeqVozh-uEzn1LT7yoQJKe9YZt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-01_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxlogscore=942 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203010074
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Part of our exception logging is using qemu_log_mask and part is using
trace-events. Move the remaining users of '-d int' to the trace-events
infrastructure.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 9 ++++++---
 target/ppc/misc_helper.c | 4 ++--
 target/ppc/trace-events  | 2 ++
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index dd1e9c20b9..2b5b1e00d8 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
 #include "qemu/log.h"
+#include "qemu/error-report.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "internal.h"
@@ -1599,9 +1600,11 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp)
         cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
     }
 
-    qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
-                  " => %s (%d) error=%02x\n", env->nip, powerpc_excp_name(excp),
-                  excp, env->error_code);
+    if (qemu_loglevel_mask(CPU_LOG_INT)) {
+        warn_report_once("use -trace ppc_excp* instead of -d int\n");
+    }
+
+    trace_ppc_excp(env->nip, powerpc_excp_name(excp), excp, env->error_code);
 
     switch (env->excp_model) {
     case POWERPC_EXCP_40x:
diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
index 06aa716cab..6bef03b154 100644
--- a/target/ppc/misc_helper.c
+++ b/target/ppc/misc_helper.c
@@ -27,6 +27,7 @@
 #include "mmu-book3s-v3.h"
 
 #include "helper_regs.h"
+#include "trace.h"
 
 /*****************************************************************************/
 /* SPR accesses */
@@ -47,8 +48,7 @@ static void raise_hv_fu_exception(CPUPPCState *env, uint32_t bit,
                                   const char *caller, uint32_t cause,
                                   uintptr_t raddr)
 {
-    qemu_log_mask(CPU_LOG_INT, "HV Facility %d is unavailable (%s)\n",
-                  bit, caller);
+    trace_ppc_excp_hv_fu(bit, caller);
 
     env->spr[SPR_HFSCR] &= ~((target_ulong)FSCR_IC_MASK << FSCR_IC_POS);
 
diff --git a/target/ppc/trace-events b/target/ppc/trace-events
index 0f6af7d73f..064b8f3e1f 100644
--- a/target/ppc/trace-events
+++ b/target/ppc/trace-events
@@ -38,3 +38,5 @@ ppc_excp_inval(uint64_t nip) "Invalid instruction at 0x%" PRIx64
 ppc_excp_print(const char *excp) "%s exception"
 ppc_excp_syscall(unsigned long r0, unsigned long r3, unsigned long r4, unsigned long r5, unsigned long r6, unsigned long r7, unsigned long r8, unsigned long nip) "r0=0x%016" PRIx64 " r3=0x%016" PRIx64 " r4=0x%016" PRIx64 " r5=0x%016" PRIx64 " r6=0x%016" PRIx64 " r7=0x%016" PRIx64 " r8=0x%016" PRIx64 " nip=0x%" PRIx64
 ppc_excp_hypercall(unsigned long r3, unsigned long r4, unsigned long r5, unsigned long r6, unsigned long r7, unsigned long r8, unsigned long r9, unsigned long r10, unsigned long nip) "r3=0x%016" PRIx64 " r4=0x%016" PRIx64 " r5=0x%016" PRIx64 " r6=0x%016" PRIx64 " r7=0x%016" PRIx64 " r8=0x%016" PRIx64 " r9=0x%016" PRIx64 " r10=0x%016" PRIx64 " nip=0x%" PRIx64
+ppc_excp_hv_fu(uint32_t bit, const char* caller) "HV Facility 0x%x is unavailable (%s)"
+ppc_excp(unsigned long nip, const char* name, int excp, uint32_t flags) "Raise exception at 0x%" PRIx64 " => %s (%d) error=0x%02x"
-- 
2.34.1


