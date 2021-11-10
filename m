Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A163C44CAC1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 21:47:09 +0100 (CET)
Received: from localhost ([::1]:42178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkuUu-0008IY-Q4
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 15:47:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1mkuTZ-0006kf-IL; Wed, 10 Nov 2021 15:45:45 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43382
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1mkuTX-0007VA-F8; Wed, 10 Nov 2021 15:45:45 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AAJCmBp007108; 
 Wed, 10 Nov 2021 20:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=YO5WyYeSFNlyjKKVQNGcz7idJt1e8d9nlxgMyxky6p8=;
 b=D+2dZ9GD0AnOV3a9e4ABXwUM3FKdKbuesQXqia7YtYd2v/yOZfLytEtKsVn7UTJabUhe
 KJxWgj4xR1gH+iEMBbxBsCnNfGadk8P9MYgN1Smeu+W0CrTVfzMIXzgVYX0LYsDedBWN
 gr3YDAdbiGzBdAPQvdrLcYxvwYNzwa3Rui9vQfXgn/4XO6PvwBc9O7LZv9BqxF91dLA6
 R1vCbvNXzf1O90AK+3T2O/7nvufOq/aQpQb3k7p9OJaU9YkzxzJkwDiqWnZUFxvZQBqM
 uOjNLjnC5cm+TocaBIIwoq7gSXzGCDB65oOiQwksQziry3jYe4nEPE+oUm5TDMxye50P 5w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c8ghn7b1j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Nov 2021 20:45:39 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AAKLStZ028502;
 Wed, 10 Nov 2021 20:45:38 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c8ghn7b13-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Nov 2021 20:45:38 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AAKdBOT020056;
 Wed, 10 Nov 2021 20:45:36 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3c5hbapfm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Nov 2021 20:45:36 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AAKjXXP48234884
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Nov 2021 20:45:33 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A0AA4C074;
 Wed, 10 Nov 2021 20:45:32 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BA8B4C058;
 Wed, 10 Nov 2021 20:45:32 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 10 Nov 2021 20:45:32 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id 2D3E2E03A2; Wed, 10 Nov 2021 21:45:32 +0100 (CET)
From: Eric Farman <farman@linux.ibm.com>
To: Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: [RFC PATCH v3 2/2] s390x: Implement the USER_SIGP_BUSY capability
Date: Wed, 10 Nov 2021 21:45:28 +0100
Message-Id: <20211110204528.1378524-3-farman@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211110204528.1378524-1-farman@linux.ibm.com>
References: <20211110204528.1378524-1-farman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0H11YDGysV7N1GJtzgKCcqvVxU-0_lKE
X-Proofpoint-GUID: GEZkoMIK6gtKYUEh50okkKKkpITKfIMV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-10_13,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 mlxscore=0 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111100098
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: Eric Farman <farman@linux.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With the USER_SIGP capability, the kernel will pass most (but not all)
SIGP orders to userspace for processing. But that means that the kernel
is unable to determine if/when the order has been completed by userspace,
and could potentially return an incorrect answer (CC1 with status bits
versus CC2 indicating BUSY) for one of the remaining in-kernel orders.

With a new USER_SIGP_BUSY capability, userspace can tell the kernel when
it is started processing a SIGP order and when it has finished, such that
the in-kernel orders can be returned with the BUSY condition between the
two IOCTLs.

Let's use the new capability in QEMU.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
---
 target/s390x/cpu-sysemu.c    | 15 +++++++++++++++
 target/s390x/cpu.c           |  1 +
 target/s390x/cpu.h           |  8 ++++++++
 target/s390x/kvm/kvm.c       | 16 ++++++++++++++++
 target/s390x/kvm/kvm_s390x.h |  2 ++
 target/s390x/sigp.c          | 19 ++++++++++++++++++-
 6 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/target/s390x/cpu-sysemu.c b/target/s390x/cpu-sysemu.c
index 5471e01ee8..60dff5bcd9 100644
--- a/target/s390x/cpu-sysemu.c
+++ b/target/s390x/cpu-sysemu.c
@@ -254,6 +254,21 @@ unsigned int s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu)
     return s390_count_running_cpus();
 }
 
+int s390_cpu_set_sigp_busy(S390CPU *cpu)
+{
+    if (kvm_enabled()) {
+        return kvm_s390_vcpu_set_sigp_busy(cpu);
+    }
+    return 0;
+}
+
+void s390_cpu_reset_sigp_busy(S390CPU *cpu)
+{
+    if (kvm_enabled()) {
+        kvm_s390_vcpu_reset_sigp_busy(cpu);
+    }
+}
+
 int s390_set_memory_limit(uint64_t new_limit, uint64_t *hw_limit)
 {
     if (kvm_enabled()) {
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 7b7b05f1d3..b5fdca05cf 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -115,6 +115,7 @@ static void s390_cpu_reset(CPUState *s, cpu_reset_type type)
 
     scc->parent_reset(dev);
     cpu->env.sigp_order = 0;
+    s390_cpu_reset_sigp_busy(cpu);
     s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
 
     switch (type) {
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index ca3845d023..ef3d3a5b10 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -780,11 +780,19 @@ int s390_assign_subch_ioeventfd(EventNotifier *notifier, uint32_t sch_id,
                                 int vq, bool assign);
 #ifndef CONFIG_USER_ONLY
 unsigned int s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu);
+int s390_cpu_set_sigp_busy(S390CPU *cpu);
+void s390_cpu_reset_sigp_busy(S390CPU *cpu);
 #else
 static inline unsigned int s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu)
 {
     return 0;
 }
+static inline int s390_cpu_set_sigp_busy(S390CPU *cpu)
+{
+}
+static inline void s390_cpu_reset_sigp_busy(S390CPU *cpu)
+{
+}
 #endif /* CONFIG_USER_ONLY */
 static inline uint8_t s390_cpu_get_state(S390CPU *cpu)
 {
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 5b1fdb55c4..533747de34 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -360,6 +360,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     cap_protected = kvm_check_extension(s, KVM_CAP_S390_PROTECTED);
 
     kvm_vm_enable_cap(s, KVM_CAP_S390_USER_SIGP, 0);
+    kvm_vm_enable_cap(s, KVM_CAP_S390_USER_SIGP_BUSY, 0);
     kvm_vm_enable_cap(s, KVM_CAP_S390_VECTOR_REGISTERS, 0);
     kvm_vm_enable_cap(s, KVM_CAP_S390_USER_STSI, 0);
     if (ri_allowed()) {
@@ -2558,6 +2559,21 @@ void kvm_s390_stop_interrupt(S390CPU *cpu)
     kvm_s390_vcpu_interrupt(cpu, &irq);
 }
 
+int kvm_s390_vcpu_set_sigp_busy(S390CPU *cpu)
+{
+    CPUState *cs = CPU(cpu);
+
+    return kvm_vcpu_ioctl(cs, KVM_S390_VCPU_SET_SIGP_BUSY);
+}
+
+void kvm_s390_vcpu_reset_sigp_busy(S390CPU *cpu)
+{
+    CPUState *cs = CPU(cpu);
+
+    /* Don't care about the response from this */
+    kvm_vcpu_ioctl(cs, KVM_S390_VCPU_RESET_SIGP_BUSY);
+}
+
 bool kvm_arch_cpu_check_are_resettable(void)
 {
     return true;
diff --git a/target/s390x/kvm/kvm_s390x.h b/target/s390x/kvm/kvm_s390x.h
index 05a5e1e6f4..de148b68c4 100644
--- a/target/s390x/kvm/kvm_s390x.h
+++ b/target/s390x/kvm/kvm_s390x.h
@@ -45,5 +45,7 @@ void kvm_s390_crypto_reset(void);
 void kvm_s390_restart_interrupt(S390CPU *cpu);
 void kvm_s390_stop_interrupt(S390CPU *cpu);
 void kvm_s390_set_diag318(CPUState *cs, uint64_t diag318_info);
+int kvm_s390_vcpu_set_sigp_busy(S390CPU *cpu);
+void kvm_s390_vcpu_reset_sigp_busy(S390CPU *cpu);
 
 #endif /* KVM_S390X_H */
diff --git a/target/s390x/sigp.c b/target/s390x/sigp.c
index 51c727834c..8f191df42a 100644
--- a/target/s390x/sigp.c
+++ b/target/s390x/sigp.c
@@ -111,12 +111,14 @@ static void sigp_stop(CPUState *cs, run_on_cpu_data arg)
 
     if (s390_cpu_get_state(cpu) != S390_CPU_STATE_OPERATING) {
         si->cc = SIGP_CC_ORDER_CODE_ACCEPTED;
+        s390_cpu_reset_sigp_busy(cpu);
         return;
     }
 
     /* disabled wait - sleeping in user space */
     if (cs->halted) {
         s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
+        s390_cpu_reset_sigp_busy(cpu);
     } else {
         /* execute the stop function */
         cpu->env.sigp_order = SIGP_STOP;
@@ -139,12 +141,13 @@ static void sigp_stop_and_store_status(CPUState *cs, run_on_cpu_data arg)
     case S390_CPU_STATE_OPERATING:
         cpu->env.sigp_order = SIGP_STOP_STORE_STATUS;
         cpu_inject_stop(cpu);
-        /* store will be performed in do_stop_interrup() */
+        /* store will be performed in do_stop_interrupt() */
         break;
     case S390_CPU_STATE_STOPPED:
         /* already stopped, just store the status */
         cpu_synchronize_state(cs);
         s390_store_status(cpu, S390_STORE_STATUS_DEF_ADDR, true);
+        s390_cpu_reset_sigp_busy(cpu);
         break;
     }
     si->cc = SIGP_CC_ORDER_CODE_ACCEPTED;
@@ -375,6 +378,10 @@ static int handle_sigp_single_dst(S390CPU *cpu, S390CPU *dst_cpu, uint8_t order,
         return SIGP_CC_BUSY;
     }
 
+    if (s390_cpu_set_sigp_busy(dst_cpu) == -EBUSY) {
+        return SIGP_CC_BUSY;
+    }
+
     switch (order) {
     case SIGP_SENSE:
         sigp_sense(dst_cpu, &si);
@@ -422,6 +429,15 @@ static int handle_sigp_single_dst(S390CPU *cpu, S390CPU *dst_cpu, uint8_t order,
         set_sigp_status(&si, SIGP_STAT_INVALID_ORDER);
     }
 
+    switch (order) {
+    case SIGP_STOP:
+    case SIGP_STOP_STORE_STATUS:
+        /* These orders will clean up the indicator when they are finished */
+        break;
+    default:
+        s390_cpu_reset_sigp_busy(dst_cpu);
+    }
+
     return si.cc;
 }
 
@@ -487,6 +503,7 @@ void do_stop_interrupt(CPUS390XState *env)
     }
     env->sigp_order = 0;
     env->pending_int &= ~INTERRUPT_STOP;
+    s390_cpu_reset_sigp_busy(cpu);
 }
 
 void s390_init_sigp(void)
-- 
2.25.1


