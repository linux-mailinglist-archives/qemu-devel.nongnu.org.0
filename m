Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C219446B08
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 23:48:00 +0100 (CET)
Received: from localhost ([::1]:45032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj807-0001ZJ-5V
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 18:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1mj7zD-0000qf-Du; Fri, 05 Nov 2021 18:47:03 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:24532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1mj7zB-0007RI-Ks; Fri, 05 Nov 2021 18:47:03 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A5MkgQA017519; 
 Fri, 5 Nov 2021 22:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=i8PNt3p2l2EpzeRZv1YyW4if6IG2rT/vgw/O/uyLsVQ=;
 b=GVC4EVqndfF+Sguu0GnQOPxQnbaYnn7A+jMX9g0ni1rM82ciLm14DzEvjXQWpkQBuBsX
 +eBauWfwvjHKA0xVBCaL3NmvxR3UJ90L6nGY1o8Oc5rjZR0u9DIgBiQTMzF+MWOzXjvm
 cLCDpzs7l2UwgDpU7Fl9UD1TIMCssym6OnPrXJCPs2t40Ir9F+w91nkh3fBsAyhCy5/w
 7P28bpDJPFwDvDO1qAiuP3vHwIIQHaELsZsk9hCDdNkfCdrxytpAUYhGhvgSWJ4BQ5Bc
 XG/m4KKo26Xk33RKBVnFZNaufcEjlIbIZNWsDaF3YGEvXl5CDH0Z79QgQ4+WvGq6Feya XA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c5dq2805h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Nov 2021 22:46:58 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A5MkwCS017847;
 Fri, 5 Nov 2021 22:46:58 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c5dq2805a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Nov 2021 22:46:58 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A5MbQn5016376;
 Fri, 5 Nov 2021 22:46:57 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 3c4t4eu6yv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Nov 2021 22:46:57 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A5MkuLa39453156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Nov 2021 22:46:56 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 77101BE04F;
 Fri,  5 Nov 2021 22:46:56 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A2FF2BE056;
 Fri,  5 Nov 2021 22:46:55 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.160.106.35])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  5 Nov 2021 22:46:55 +0000 (GMT)
From: Collin Walling <walling@linux.ibm.com>
To: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] s390x: kvm: adjust diag318 resets to retain data
Date: Fri,  5 Nov 2021 18:46:46 -0400
Message-Id: <20211105224646.803661-1-walling@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: H8E30G_Aqd6fWcTBYifB7ZwrtMghoh8-
X-Proofpoint-ORIG-GUID: ZXgUN75yPU_mh4Zvop1f6p7kNQCoaAVC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-05_03,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 phishscore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 clxscore=1011 mlxscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111050121
Received-SPF: pass client-ip=148.163.158.5; envelope-from=walling@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: borntraeger@de.ibm.com, thuth@redhat.com, cohuck@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The CPNC portion of the diag 318 data is erroneously reset during an
initial CPU reset caused by SIGP. Let's go ahead and relocate the
diag318_info field within the CPUS390XState struct such that it is
only zeroed during a clear reset. This way, the CPNC will be retained
for each VCPU in the configuration after the diag 318 instruction
has been invoked by the kernel.

Additionally, the diag 318 data reset is handled via the CPU reset
code. The set_diag318 code can be merged into the handler function
and the helper functions can consequently be removed.

Signed-off-by: Collin Walling <walling@linux.ibm.com>
---
 hw/s390x/s390-virtio-ccw.c   |  3 ---
 target/s390x/cpu-sysemu.c    |  7 -------
 target/s390x/cpu.h           |  5 ++---
 target/s390x/kvm/kvm.c       | 19 +++++--------------
 target/s390x/kvm/kvm_s390x.h |  1 -
 5 files changed, 7 insertions(+), 28 deletions(-)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 653587ea62..51dcb83b0c 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -489,9 +489,6 @@ static void s390_machine_reset(MachineState *machine)
         g_assert_not_reached();
     }
 
-    CPU_FOREACH(t) {
-        run_on_cpu(t, s390_do_cpu_set_diag318, RUN_ON_CPU_HOST_ULONG(0));
-    }
     s390_ipl_clear_reset_request();
 }
 
diff --git a/target/s390x/cpu-sysemu.c b/target/s390x/cpu-sysemu.c
index 5471e01ee8..6d9f6d4402 100644
--- a/target/s390x/cpu-sysemu.c
+++ b/target/s390x/cpu-sysemu.c
@@ -299,10 +299,3 @@ void s390_enable_css_support(S390CPU *cpu)
         kvm_s390_enable_css_support(cpu);
     }
 }
-
-void s390_do_cpu_set_diag318(CPUState *cs, run_on_cpu_data arg)
-{
-    if (kvm_enabled()) {
-        kvm_s390_set_diag318(cs, arg.host_ulong);
-    }
-}
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 3153d053e9..1b94b91d87 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -63,6 +63,8 @@ struct CPUS390XState {
     uint64_t etoken;       /* etoken */
     uint64_t etoken_extension; /* etoken extension */
 
+    uint64_t diag318_info;
+
     /* Fields up to this point are not cleared by initial CPU reset */
     struct {} start_initial_reset_fields;
 
@@ -118,8 +120,6 @@ struct CPUS390XState {
     uint16_t external_call_addr;
     DECLARE_BITMAP(emergency_signals, S390_MAX_CPUS);
 
-    uint64_t diag318_info;
-
 #if !defined(CONFIG_USER_ONLY)
     uint64_t tlb_fill_tec;   /* translation exception code during tlb_fill */
     int tlb_fill_exc;        /* exception number seen during tlb_fill */
@@ -780,7 +780,6 @@ int s390_set_memory_limit(uint64_t new_limit, uint64_t *hw_limit);
 void s390_set_max_pagesize(uint64_t pagesize, Error **errp);
 void s390_cmma_reset(void);
 void s390_enable_css_support(S390CPU *cpu);
-void s390_do_cpu_set_diag318(CPUState *cs, run_on_cpu_data arg);
 int s390_assign_subch_ioeventfd(EventNotifier *notifier, uint32_t sch_id,
                                 int vq, bool assign);
 #ifndef CONFIG_USER_ONLY
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 5b1fdb55c4..ed9c477b6f 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -1576,18 +1576,6 @@ static int handle_sw_breakpoint(S390CPU *cpu, struct kvm_run *run)
     return -ENOENT;
 }
 
-void kvm_s390_set_diag318(CPUState *cs, uint64_t diag318_info)
-{
-    CPUS390XState *env = &S390_CPU(cs)->env;
-
-    /* Feat bit is set only if KVM supports sync for diag318 */
-    if (s390_has_feat(S390_FEAT_DIAG_318)) {
-        env->diag318_info = diag318_info;
-        cs->kvm_run->s.regs.diag318 = diag318_info;
-        cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_DIAG318;
-    }
-}
-
 static void handle_diag_318(S390CPU *cpu, struct kvm_run *run)
 {
     uint64_t reg = (run->s390_sieic.ipa & 0x00f0) >> 4;
@@ -1604,8 +1592,11 @@ static void handle_diag_318(S390CPU *cpu, struct kvm_run *run)
     }
 
     CPU_FOREACH(t) {
-        run_on_cpu(t, s390_do_cpu_set_diag318,
-                   RUN_ON_CPU_HOST_ULONG(diag318_info));
+        CPUS390XState *env = &S390_CPU(t)->env;
+
+        env->diag318_info = diag318_info;
+        t->kvm_run->s.regs.diag318 = diag318_info;
+        t->kvm_run->kvm_dirty_regs |= KVM_SYNC_DIAG318;
     }
 }
 
diff --git a/target/s390x/kvm/kvm_s390x.h b/target/s390x/kvm/kvm_s390x.h
index 05a5e1e6f4..8c244ee84d 100644
--- a/target/s390x/kvm/kvm_s390x.h
+++ b/target/s390x/kvm/kvm_s390x.h
@@ -44,6 +44,5 @@ void kvm_s390_set_max_pagesize(uint64_t pagesize, Error **errp);
 void kvm_s390_crypto_reset(void);
 void kvm_s390_restart_interrupt(S390CPU *cpu);
 void kvm_s390_stop_interrupt(S390CPU *cpu);
-void kvm_s390_set_diag318(CPUState *cs, uint64_t diag318_info);
 
 #endif /* KVM_S390X_H */
-- 
2.31.1


