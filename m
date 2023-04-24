Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A396ECB51
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 13:30:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pquNl-0006kJ-Nj; Mon, 24 Apr 2023 07:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jiles@quicinc.com>)
 id 1pquNj-0006jy-6Y
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 07:29:19 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jiles@quicinc.com>)
 id 1pquNh-0006WD-0k
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 07:29:18 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33O7U65Z012830; Mon, 24 Apr 2023 11:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=Ov+BWbQ0T7QfaqQWC9kMFVUSHYtsfdhn2vOpirpqt3k=;
 b=a3eTVGM9VJ8jMUaw4mdoUdlZ/PL/OSyisU5pMdlk8N9qmMZTi+uaAO/4fgT+nZM2mque
 nTrPbsLvvL08azApqTvDbuLQKnE8Q2sTYoSM+7MMno8Fjoxms2filbLz78veCyP7snqo
 yMlC3Y13ZDg8KFL3VwF9+Ds0hlZ/z5a/3Bfke1+F3mAGi0QusGJDacHiz5yRY0IOC49n
 tEsXtcewUo3U5MGHtcQPwL7hg8w0ueeQgLWIvTQSw+vWRRlyqjSMts+zXiOr6z3cEVzu
 j1T+GnwP5iLomZaH8Y6NbSEx0P1J5Oe6gWem1SaLnDzxbfaxU+Be03GlNn/jXdeHmbJM YA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q5ndprfaa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 11:29:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33OBTAcd001040
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 11:29:10 GMT
Received: from localhost (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 24 Apr
 2023 04:29:09 -0700
From: Jamie Iles <quic_jiles@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <richard.henderson@linaro.org>, <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2] accel/tcg/tcg-accel-ops-rr: ensure fairness with icount
Date: Mon, 24 Apr 2023 12:29:07 +0100
Message-ID: <20230424112907.26832-1-quic_jiles@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ZU33BYbs03xblh37A_5S14PJ0iuK1ac0
X-Proofpoint-ORIG-GUID: ZU33BYbs03xblh37A_5S14PJ0iuK1ac0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_07,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304240104
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_jiles@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jamie Iles <quic_jiles@quicinc.com>
---

Changes in v2:
 - Rename icount_cpu_timeslice to icount_percpu_budget
 - Add a clarifying comment about caching to rr_cpu_count()

 accel/tcg/tcg-accel-ops-icount.c | 17 ++++++++++++++--
 accel/tcg/tcg-accel-ops-icount.h |  3 ++-
 accel/tcg/tcg-accel-ops-rr.c     | 34 +++++++++++++++++++++++++++++++-
 3 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/tcg-accel-ops-icount.c b/accel/tcg/tcg-accel-ops-icount.c
index 84cc7421be88..e1e8afaf2f99 100644
--- a/accel/tcg/tcg-accel-ops-icount.c
+++ b/accel/tcg/tcg-accel-ops-icount.c
@@ -89,7 +89,20 @@ void icount_handle_deadline(void)
     }
 }
 
-void icount_prepare_for_run(CPUState *cpu)
+/* Distribute the budget evenly across all CPUs */
+int64_t icount_percpu_budget(int cpu_count)
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
+void icount_prepare_for_run(CPUState *cpu, int64_t cpu_budget)
 {
     int insns_left;
 
@@ -101,7 +114,7 @@ void icount_prepare_for_run(CPUState *cpu)
     g_assert(cpu_neg(cpu)->icount_decr.u16.low == 0);
     g_assert(cpu->icount_extra == 0);
 
-    cpu->icount_budget = icount_get_limit();
+    cpu->icount_budget = MIN(icount_get_limit(), cpu_budget);
     insns_left = MIN(0xffff, cpu->icount_budget);
     cpu_neg(cpu)->icount_decr.u16.low = insns_left;
     cpu->icount_extra = cpu->icount_budget - insns_left;
diff --git a/accel/tcg/tcg-accel-ops-icount.h b/accel/tcg/tcg-accel-ops-icount.h
index 1b6fd9c60751..16a301b6dc0b 100644
--- a/accel/tcg/tcg-accel-ops-icount.h
+++ b/accel/tcg/tcg-accel-ops-icount.h
@@ -11,7 +11,8 @@
 #define TCG_ACCEL_OPS_ICOUNT_H
 
 void icount_handle_deadline(void);
-void icount_prepare_for_run(CPUState *cpu);
+void icount_prepare_for_run(CPUState *cpu, int64_t cpu_budget);
+int64_t icount_percpu_budget(int cpu_count);
 void icount_process_data(CPUState *cpu);
 
 void icount_handle_interrupt(CPUState *cpu, int mask);
diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index 290833a37fb2..7114210173df 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -139,6 +139,33 @@ static void rr_force_rcu(Notifier *notify, void *data)
     rr_kick_next_cpu();
 }
 
+/*
+ * Calculate the number of CPUs that we will process in a single iteration of
+ * the main CPU thread loop so that we can fairly distribute the instruction
+ * count across CPUs.
+ *
+ * The CPU count is cached based on the CPU list generation ID to avoid
+ * iterating the list every time.
+ */
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
@@ -185,6 +212,9 @@ static void *rr_cpu_thread_fn(void *arg)
     cpu->exit_request = 1;
 
     while (1) {
+        int cpu_count = rr_cpu_count();
+        int64_t cpu_budget = INT64_MAX;
+
         qemu_mutex_unlock_iothread();
         replay_mutex_lock();
         qemu_mutex_lock_iothread();
@@ -197,6 +227,8 @@ static void *rr_cpu_thread_fn(void *arg)
              * waking up the I/O thread and waiting for completion.
              */
             icount_handle_deadline();
+
+            cpu_budget = icount_percpu_budget(cpu_count);
         }
 
         replay_mutex_unlock();
@@ -218,7 +250,7 @@ static void *rr_cpu_thread_fn(void *arg)
 
                 qemu_mutex_unlock_iothread();
                 if (icount_enabled()) {
-                    icount_prepare_for_run(cpu);
+                    icount_prepare_for_run(cpu, cpu_budget);
                 }
                 r = tcg_cpus_exec(cpu);
                 if (icount_enabled()) {
-- 
2.25.1


