Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3676E262D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 16:49:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnKjF-00021B-Kb; Fri, 14 Apr 2023 10:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jiles@quicinc.com>)
 id 1pnH1i-0000sl-2i
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 06:51:34 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jiles@quicinc.com>)
 id 1pnH1X-0008FA-2G
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 06:51:33 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33EA3LSK032510; Fri, 14 Apr 2023 10:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=2NUbSBUsS+EYhJjVNWitJATWfcrLbVKn3jS2Y+nWvPw=;
 b=E9oUhj9YgXM2M/oRLUpcmL0p8ooI9DZ36pxu5ehmZ/Rh9vsAajEixSaOOGrZgqLVoleg
 7Yyh9+xsIHq/BrcJLqCewD/1WyyEuR15iOUUec3EkON5OxklCX+8iv7DlII6jeb4hB0C
 V/OtBpJXRLaCryKGSmDLo/+oTstAw2y/SuuyZAVvA97MdZ9OglqAflV6RN53e4/zMj1R
 aAHMHTTuNAYiQ3Qm+mBH+tacxyqcazm6HWMmBxOerZLhujUa73RkHR7JjofGrEPGtkfa
 b33siu1sXth/gs1J1m4qpxtgGS4ACK2LfISbMCoiCvWCh4AUGJFh/UXRmt61N0eIs1D1 xg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3py20e0gef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Apr 2023 10:51:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33EApESN003036
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Apr 2023 10:51:14 GMT
Received: from localhost (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 14 Apr
 2023 03:51:13 -0700
From: Jamie Iles <quic_jiles@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <richard.henderson@linaro.org>, <pbonzini@redhat.com>
Subject: [PATCH] accel/tcg/tcg-accel-ops-rr: ensure fairness with icount
Date: Fri, 14 Apr 2023 11:51:11 +0100
Message-ID: <20230414105111.30708-1-quic_jiles@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: JslXgVlEIj5HXeRGZWaFNPF-zTpgmgCf
X-Proofpoint-ORIG-GUID: JslXgVlEIj5HXeRGZWaFNPF-zTpgmgCf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-14_04,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1011 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304140097
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_jiles@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 14 Apr 2023 10:48:42 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The round-robin scheduler will iterate over the CPU list with an
assigned budget until the next timer expiry and may exit early because
of a TB exit.  This is fine under normal operation but with icount
enabled and SMP it is possible for a CPU to be starved of run time and
the system live-locks.

For example, booting a riscv64 platform with '-icount
shift=0,align=off,sleep=on -smp 2' we observe a livelock once the kernel
has timers enabled and starts performing TLB shootdowns.  In this case
we have CPU 0 in M-mode with interrupts disabled sending an IPI to CPU
1.  As we enter the TCG loop, we assign the icount budget to next timer
interrupt to CPU 0 and begin executing where the guest is sat in a busy
loop exhausting all of the budget before we try to execute CPU 1 which
is the target of the IPI but CPU 1 is left with no budget with which to
execute and the process repeats.

We try here to add some fairness by splitting the budget across all of
the CPUs on the thread fairly before entering each one.  The CPU count
is cached on CPU list generation ID to avoid iterating the list on each
loop iteration.  With this change it is possible to boot an SMP rv64
guest with icount enabled and no hangs.

Signed-off-by: Jamie Iles <quic_jiles@quicinc.com>
---
 accel/tcg/tcg-accel-ops-icount.c | 16 ++++++++++++++--
 accel/tcg/tcg-accel-ops-icount.h |  3 ++-
 accel/tcg/tcg-accel-ops-rr.c     | 26 +++++++++++++++++++++++++-
 3 files changed, 41 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/tcg-accel-ops-icount.c b/accel/tcg/tcg-accel-ops-icount.c
index 84cc7421be88..a7ffc8a68bad 100644
--- a/accel/tcg/tcg-accel-ops-icount.c
+++ b/accel/tcg/tcg-accel-ops-icount.c
@@ -89,7 +89,19 @@ void icount_handle_deadline(void)
     }
 }
 
-void icount_prepare_for_run(CPUState *cpu)
+int64_t icount_cpu_timeslice(int cpu_count)
+{
+    int64_t limit = icount_get_limit();
+    int64_t timeslice = limit / cpu_count;
+
+    if (timeslice == 0) {
+        timeslice = limit;
+    }
+
+    return timeslice;
+}
+
+void icount_prepare_for_run(CPUState *cpu, int64_t timeslice)
 {
     int insns_left;
 
@@ -101,7 +113,7 @@ void icount_prepare_for_run(CPUState *cpu)
     g_assert(cpu_neg(cpu)->icount_decr.u16.low == 0);
     g_assert(cpu->icount_extra == 0);
 
-    cpu->icount_budget = icount_get_limit();
+    cpu->icount_budget = MIN(icount_get_limit(), timeslice);
     insns_left = MIN(0xffff, cpu->icount_budget);
     cpu_neg(cpu)->icount_decr.u16.low = insns_left;
     cpu->icount_extra = cpu->icount_budget - insns_left;
diff --git a/accel/tcg/tcg-accel-ops-icount.h b/accel/tcg/tcg-accel-ops-icount.h
index 1b6fd9c60751..e8785a0e196d 100644
--- a/accel/tcg/tcg-accel-ops-icount.h
+++ b/accel/tcg/tcg-accel-ops-icount.h
@@ -11,7 +11,8 @@
 #define TCG_ACCEL_OPS_ICOUNT_H
 
 void icount_handle_deadline(void);
-void icount_prepare_for_run(CPUState *cpu);
+void icount_prepare_for_run(CPUState *cpu, int64_t timeslice);
+int64_t icount_cpu_timeslice(int cpu_count);
 void icount_process_data(CPUState *cpu);
 
 void icount_handle_interrupt(CPUState *cpu, int mask);
diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index 290833a37fb2..bccb3670a656 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -139,6 +139,25 @@ static void rr_force_rcu(Notifier *notify, void *data)
     rr_kick_next_cpu();
 }
 
+static int rr_cpu_count(void)
+{
+    static unsigned int last_gen_id = ~0;
+    static int cpu_count;
+    CPUState *cpu;
+
+    cpu_list_lock();
+    if (cpu_list_generation_id_get() != last_gen_id) {
+        cpu_count = 0;
+        CPU_FOREACH(cpu) {
+            ++cpu_count;
+        }
+        last_gen_id = cpu_list_generation_id_get();
+    }
+    cpu_list_unlock();
+
+    return cpu_count;
+}
+
 /*
  * In the single-threaded case each vCPU is simulated in turn. If
  * there is more than a single vCPU we create a simple timer to kick
@@ -185,6 +204,9 @@ static void *rr_cpu_thread_fn(void *arg)
     cpu->exit_request = 1;
 
     while (1) {
+        int cpu_count = rr_cpu_count();
+        int64_t icount_timeslice = INT64_MAX;
+
         qemu_mutex_unlock_iothread();
         replay_mutex_lock();
         qemu_mutex_lock_iothread();
@@ -197,6 +219,8 @@ static void *rr_cpu_thread_fn(void *arg)
              * waking up the I/O thread and waiting for completion.
              */
             icount_handle_deadline();
+
+            icount_timeslice = icount_cpu_timeslice(cpu_count);
         }
 
         replay_mutex_unlock();
@@ -218,7 +242,7 @@ static void *rr_cpu_thread_fn(void *arg)
 
                 qemu_mutex_unlock_iothread();
                 if (icount_enabled()) {
-                    icount_prepare_for_run(cpu);
+                    icount_prepare_for_run(cpu, icount_timeslice);
                 }
                 r = tcg_cpus_exec(cpu);
                 if (icount_enabled()) {
-- 
2.25.1


