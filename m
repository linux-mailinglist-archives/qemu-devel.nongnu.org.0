Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F71443712
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 21:14:15 +0100 (CET)
Received: from localhost ([::1]:40606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi0Ag-0008IN-H4
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 16:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1mi08F-0006CJ-5D; Tue, 02 Nov 2021 16:11:43 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:62296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1mi08C-0006Y6-W1; Tue, 02 Nov 2021 16:11:42 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A2HfSNX008741; 
 Tue, 2 Nov 2021 20:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zKPpm5Iq6xETccc9tKcOumnFyqqsmfnY0IJDOKfmuiY=;
 b=qK8G78HvyyZyEEh4YJpitZIAz56bZDbmlMP1rsf6/eB3qB2TUedGz1UCNEex06S9X2+m
 K8gzaZgpw+dFPQTd+3JqhTrOHkCjzIwXoFSG2hX/6LIy01SUghVLJ17UTIZEQLinBtd3
 UnCsS3iICJx3/O7HfvFe4pZU/g538tkYZ7BM7QbL6BprbhKCZqx/QdEaZuO6bNLleJXN
 y0LnIxvjJVX1JjuulSt4enQOKzY9IrtmCIFuafXrCot4f5SVVZ5Ol/xjMh6ZE8QO+DtM
 hud/9qQDIbC0UXgPzaC8eao2EwskFox4Jky15PCaqQCIXUCtn3R+Tb6u//xZlAxiQNv2 Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c35qetbdf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 20:11:37 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A2Jpkeg031609;
 Tue, 2 Nov 2021 20:11:36 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c35qetbcs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 20:11:36 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A2K3Wh6013393;
 Tue, 2 Nov 2021 20:11:34 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 3c0wajnnsv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 20:11:34 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1A2K56ok63766882
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Nov 2021 20:05:06 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFF054C04A;
 Tue,  2 Nov 2021 20:11:30 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2B134C046;
 Tue,  2 Nov 2021 20:11:30 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue,  2 Nov 2021 20:11:30 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id 7E611E213C; Tue,  2 Nov 2021 21:11:30 +0100 (CET)
From: Eric Farman <farman@linux.ibm.com>
To: Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [RFC PATCH v2 2/2] s390x: Implement the USER_SIGP_BUSY capability
Date: Tue,  2 Nov 2021 21:11:22 +0100
Message-Id: <20211102201122.3188108-3-farman@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102201122.3188108-1-farman@linux.ibm.com>
References: <20211102201122.3188108-1-farman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: S2w9nUsqs_VQVFeaS-PlvkEhHPVO8Q6H
X-Proofpoint-GUID: nMU1T2i49s6t8kOF0SHqXqNg9ZieFt5a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_08,2021-11-02_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111020106
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
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
Cc: Eric Farman <farman@linux.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With the USER_SIGP capability, the kernel will pass most (but not all)
SIGP orders to userspace for processing. But that means that the kernel
is unable to determine if/when the order has been completed by userspace,
and could potentially return an incorrect answer (CC1 with status bits
versus CC2 indicating BUSY) for one of the remaining in-kernel orders.

With a new USER_SIGP_BUSY capability, the kernel will automatically
flag a vcpu as busy for a SIGP order, and block further orders directed
to the same vcpu until userspace resets it to indicate the order has
been fully processed.

Let's use the new capability in QEMU.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
---
 target/s390x/cpu-sysemu.c    |  7 +++++++
 target/s390x/cpu.h           |  4 ++++
 target/s390x/kvm/kvm.c       |  9 ++++++++
 target/s390x/kvm/kvm_s390x.h |  1 +
 target/s390x/sigp.c          | 40 ++++++++++++++++++++++++++++++++++++
 5 files changed, 61 insertions(+)

diff --git a/target/s390x/cpu-sysemu.c b/target/s390x/cpu-sysemu.c
index 5471e01ee8..9b01662226 100644
--- a/target/s390x/cpu-sysemu.c
+++ b/target/s390x/cpu-sysemu.c
@@ -254,6 +254,13 @@ unsigned int s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu)
     return s390_count_running_cpus();
 }
 
+void s390_cpu_reset_sigp_busy(S390CPU *cpu)
+{
+    if (kvm_enabled()) {
+        kvm_s390_vcpu_reset_busy(cpu);
+    }
+}
+
 int s390_set_memory_limit(uint64_t new_limit, uint64_t *hw_limit)
 {
     if (kvm_enabled()) {
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index ca3845d023..ca7f8fe3fe 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -780,11 +780,15 @@ int s390_assign_subch_ioeventfd(EventNotifier *notifier, uint32_t sch_id,
                                 int vq, bool assign);
 #ifndef CONFIG_USER_ONLY
 unsigned int s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu);
+void s390_cpu_reset_sigp_busy(S390CPU *cpu);
 #else
 static inline unsigned int s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu)
 {
     return 0;
 }
+static inline void s390_cpu_reset_sigp_busy(S390CPU *cpu)
+{
+}
 #endif /* CONFIG_USER_ONLY */
 static inline uint8_t s390_cpu_get_state(S390CPU *cpu)
 {
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 5b1fdb55c4..e177ef1d26 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -360,6 +360,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     cap_protected = kvm_check_extension(s, KVM_CAP_S390_PROTECTED);
 
     kvm_vm_enable_cap(s, KVM_CAP_S390_USER_SIGP, 0);
+    kvm_vm_enable_cap(s, KVM_CAP_S390_USER_SIGP_BUSY, 0);
     kvm_vm_enable_cap(s, KVM_CAP_S390_VECTOR_REGISTERS, 0);
     kvm_vm_enable_cap(s, KVM_CAP_S390_USER_STSI, 0);
     if (ri_allowed()) {
@@ -2558,6 +2559,14 @@ void kvm_s390_stop_interrupt(S390CPU *cpu)
     kvm_s390_vcpu_interrupt(cpu, &irq);
 }
 
+void kvm_s390_vcpu_reset_busy(S390CPU *cpu)
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
index 05a5e1e6f4..64ce220f1b 100644
--- a/target/s390x/kvm/kvm_s390x.h
+++ b/target/s390x/kvm/kvm_s390x.h
@@ -45,5 +45,6 @@ void kvm_s390_crypto_reset(void);
 void kvm_s390_restart_interrupt(S390CPU *cpu);
 void kvm_s390_stop_interrupt(S390CPU *cpu);
 void kvm_s390_set_diag318(CPUState *cs, uint64_t diag318_info);
+void kvm_s390_vcpu_reset_busy(S390CPU *cpu);
 
 #endif /* KVM_S390X_H */
diff --git a/target/s390x/sigp.c b/target/s390x/sigp.c
index 51c727834c..44291b34be 100644
--- a/target/s390x/sigp.c
+++ b/target/s390x/sigp.c
@@ -43,6 +43,7 @@ static void sigp_sense(S390CPU *dst_cpu, SigpInfo *si)
     if (!tcg_enabled()) {
         /* handled in KVM */
         set_sigp_status(si, SIGP_STAT_INVALID_ORDER);
+        s390_cpu_reset_sigp_busy(dst_cpu);
         return;
     }
 
@@ -58,6 +59,7 @@ static void sigp_sense(S390CPU *dst_cpu, SigpInfo *si)
         }
         set_sigp_status(si, status);
     }
+    s390_cpu_reset_sigp_busy(dst_cpu);
 }
 
 static void sigp_external_call(S390CPU *src_cpu, S390CPU *dst_cpu, SigpInfo *si)
@@ -67,6 +69,7 @@ static void sigp_external_call(S390CPU *src_cpu, S390CPU *dst_cpu, SigpInfo *si)
     if (!tcg_enabled()) {
         /* handled in KVM */
         set_sigp_status(si, SIGP_STAT_INVALID_ORDER);
+        s390_cpu_reset_sigp_busy(dst_cpu);
         return;
     }
 
@@ -76,6 +79,7 @@ static void sigp_external_call(S390CPU *src_cpu, S390CPU *dst_cpu, SigpInfo *si)
     } else {
         set_sigp_status(si, SIGP_STAT_EXT_CALL_PENDING);
     }
+    s390_cpu_reset_sigp_busy(dst_cpu);
 }
 
 static void sigp_emergency(S390CPU *src_cpu, S390CPU *dst_cpu, SigpInfo *si)
@@ -83,11 +87,13 @@ static void sigp_emergency(S390CPU *src_cpu, S390CPU *dst_cpu, SigpInfo *si)
     if (!tcg_enabled()) {
         /* handled in KVM */
         set_sigp_status(si, SIGP_STAT_INVALID_ORDER);
+        s390_cpu_reset_sigp_busy(dst_cpu);
         return;
     }
 
     cpu_inject_emergency_signal(dst_cpu, src_cpu->env.core_id);
     si->cc = SIGP_CC_ORDER_CODE_ACCEPTED;
+    s390_cpu_reset_sigp_busy(dst_cpu);
 }
 
 static void sigp_start(CPUState *cs, run_on_cpu_data arg)
@@ -97,11 +103,13 @@ static void sigp_start(CPUState *cs, run_on_cpu_data arg)
 
     if (s390_cpu_get_state(cpu) != S390_CPU_STATE_STOPPED) {
         si->cc = SIGP_CC_ORDER_CODE_ACCEPTED;
+        s390_cpu_reset_sigp_busy(cpu);
         return;
     }
 
     s390_cpu_set_state(S390_CPU_STATE_OPERATING, cpu);
     si->cc = SIGP_CC_ORDER_CODE_ACCEPTED;
+    s390_cpu_reset_sigp_busy(cpu);
 }
 
 static void sigp_stop(CPUState *cs, run_on_cpu_data arg)
@@ -111,12 +119,14 @@ static void sigp_stop(CPUState *cs, run_on_cpu_data arg)
 
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
@@ -145,6 +155,7 @@ static void sigp_stop_and_store_status(CPUState *cs, run_on_cpu_data arg)
         /* already stopped, just store the status */
         cpu_synchronize_state(cs);
         s390_store_status(cpu, S390_STORE_STATUS_DEF_ADDR, true);
+        s390_cpu_reset_sigp_busy(cpu);
         break;
     }
     si->cc = SIGP_CC_ORDER_CODE_ACCEPTED;
@@ -159,6 +170,7 @@ static void sigp_store_status_at_address(CPUState *cs, run_on_cpu_data arg)
     /* cpu has to be stopped */
     if (s390_cpu_get_state(cpu) != S390_CPU_STATE_STOPPED) {
         set_sigp_status(si, SIGP_STAT_INCORRECT_STATE);
+        s390_cpu_reset_sigp_busy(cpu);
         return;
     }
 
@@ -166,9 +178,11 @@ static void sigp_store_status_at_address(CPUState *cs, run_on_cpu_data arg)
 
     if (s390_store_status(cpu, address, false)) {
         set_sigp_status(si, SIGP_STAT_INVALID_PARAMETER);
+        s390_cpu_reset_sigp_busy(cpu);
         return;
     }
     si->cc = SIGP_CC_ORDER_CODE_ACCEPTED;
+    s390_cpu_reset_sigp_busy(cpu);
 }
 
 #define ADTL_SAVE_LC_MASK  0xfUL
@@ -183,18 +197,21 @@ static void sigp_store_adtl_status(CPUState *cs, run_on_cpu_data arg)
     if (!s390_has_feat(S390_FEAT_VECTOR) &&
         !s390_has_feat(S390_FEAT_GUARDED_STORAGE)) {
         set_sigp_status(si, SIGP_STAT_INVALID_ORDER);
+        s390_cpu_reset_sigp_busy(cpu);
         return;
     }
 
     /* cpu has to be stopped */
     if (s390_cpu_get_state(cpu) != S390_CPU_STATE_STOPPED) {
         set_sigp_status(si, SIGP_STAT_INCORRECT_STATE);
+        s390_cpu_reset_sigp_busy(cpu);
         return;
     }
 
     /* address must be aligned to length */
     if (addr & (len - 1)) {
         set_sigp_status(si, SIGP_STAT_INVALID_PARAMETER);
+        s390_cpu_reset_sigp_busy(cpu);
         return;
     }
 
@@ -202,6 +219,7 @@ static void sigp_store_adtl_status(CPUState *cs, run_on_cpu_data arg)
     if (!s390_has_feat(S390_FEAT_GUARDED_STORAGE) &&
         lc != 0) {
         set_sigp_status(si, SIGP_STAT_INVALID_PARAMETER);
+        s390_cpu_reset_sigp_busy(cpu);
         return;
     }
 
@@ -212,6 +230,7 @@ static void sigp_store_adtl_status(CPUState *cs, run_on_cpu_data arg)
         lc != 11 &&
         lc != 12) {
         set_sigp_status(si, SIGP_STAT_INVALID_PARAMETER);
+        s390_cpu_reset_sigp_busy(cpu);
         return;
     }
 
@@ -219,9 +238,11 @@ static void sigp_store_adtl_status(CPUState *cs, run_on_cpu_data arg)
 
     if (s390_store_adtl_status(cpu, addr, len)) {
         set_sigp_status(si, SIGP_STAT_INVALID_PARAMETER);
+        s390_cpu_reset_sigp_busy(cpu);
         return;
     }
     si->cc = SIGP_CC_ORDER_CODE_ACCEPTED;
+    s390_cpu_reset_sigp_busy(cpu);
 }
 
 static void sigp_restart(CPUState *cs, run_on_cpu_data arg)
@@ -246,6 +267,7 @@ static void sigp_restart(CPUState *cs, run_on_cpu_data arg)
         break;
     }
     si->cc = SIGP_CC_ORDER_CODE_ACCEPTED;
+    s390_cpu_reset_sigp_busy(cpu);
 }
 
 static void sigp_initial_cpu_reset(CPUState *cs, run_on_cpu_data arg)
@@ -258,6 +280,7 @@ static void sigp_initial_cpu_reset(CPUState *cs, run_on_cpu_data arg)
     scc->reset(cs, S390_CPU_RESET_INITIAL);
     cpu_synchronize_post_reset(cs);
     si->cc = SIGP_CC_ORDER_CODE_ACCEPTED;
+    s390_cpu_reset_sigp_busy(cpu);
 }
 
 static void sigp_cpu_reset(CPUState *cs, run_on_cpu_data arg)
@@ -270,6 +293,7 @@ static void sigp_cpu_reset(CPUState *cs, run_on_cpu_data arg)
     scc->reset(cs, S390_CPU_RESET_NORMAL);
     cpu_synchronize_post_reset(cs);
     si->cc = SIGP_CC_ORDER_CODE_ACCEPTED;
+    s390_cpu_reset_sigp_busy(cpu);
 }
 
 static void sigp_set_prefix(CPUState *cs, run_on_cpu_data arg)
@@ -284,12 +308,14 @@ static void sigp_set_prefix(CPUState *cs, run_on_cpu_data arg)
                                     sizeof(struct LowCore), false,
                                     MEMTXATTRS_UNSPECIFIED)) {
         set_sigp_status(si, SIGP_STAT_INVALID_PARAMETER);
+        s390_cpu_reset_sigp_busy(cpu);
         return;
     }
 
     /* cpu has to be stopped */
     if (s390_cpu_get_state(cpu) != S390_CPU_STATE_STOPPED) {
         set_sigp_status(si, SIGP_STAT_INCORRECT_STATE);
+        s390_cpu_reset_sigp_busy(cpu);
         return;
     }
 
@@ -297,6 +323,7 @@ static void sigp_set_prefix(CPUState *cs, run_on_cpu_data arg)
     tlb_flush(cs);
     cpu_synchronize_post_init(cs);
     si->cc = SIGP_CC_ORDER_CODE_ACCEPTED;
+    s390_cpu_reset_sigp_busy(cpu);
 }
 
 static void sigp_cond_emergency(S390CPU *src_cpu, S390CPU *dst_cpu,
@@ -310,6 +337,7 @@ static void sigp_cond_emergency(S390CPU *src_cpu, S390CPU *dst_cpu,
     if (!tcg_enabled()) {
         /* handled in KVM */
         set_sigp_status(si, SIGP_STAT_INVALID_ORDER);
+        s390_cpu_reset_sigp_busy(dst_cpu);
         return;
     }
 
@@ -331,6 +359,7 @@ static void sigp_cond_emergency(S390CPU *src_cpu, S390CPU *dst_cpu,
     }
 
     si->cc = SIGP_CC_ORDER_CODE_ACCEPTED;
+    s390_cpu_reset_sigp_busy(dst_cpu);
 }
 
 static void sigp_sense_running(S390CPU *dst_cpu, SigpInfo *si)
@@ -338,12 +367,14 @@ static void sigp_sense_running(S390CPU *dst_cpu, SigpInfo *si)
     if (!tcg_enabled()) {
         /* handled in KVM */
         set_sigp_status(si, SIGP_STAT_INVALID_ORDER);
+        s390_cpu_reset_sigp_busy(dst_cpu);
         return;
     }
 
     /* sensing without locks is racy, but it's the same for real hw */
     if (!s390_has_feat(S390_FEAT_SENSE_RUNNING_STATUS)) {
         set_sigp_status(si, SIGP_STAT_INVALID_ORDER);
+        s390_cpu_reset_sigp_busy(dst_cpu);
         return;
     }
 
@@ -353,6 +384,7 @@ static void sigp_sense_running(S390CPU *dst_cpu, SigpInfo *si)
     } else {
         si->cc = SIGP_CC_ORDER_CODE_ACCEPTED;
     }
+    s390_cpu_reset_sigp_busy(dst_cpu);
 }
 
 static int handle_sigp_single_dst(S390CPU *cpu, S390CPU *dst_cpu, uint8_t order,
@@ -420,6 +452,7 @@ static int handle_sigp_single_dst(S390CPU *cpu, S390CPU *dst_cpu, uint8_t order,
         break;
     default:
         set_sigp_status(&si, SIGP_STAT_INVALID_ORDER);
+        s390_cpu_reset_sigp_busy(dst_cpu);
     }
 
     return si.cc;
@@ -444,6 +477,12 @@ int handle_sigp(CPUS390XState *env, uint8_t order, uint64_t r1, uint64_t r3)
     int ret;
 
     if (qemu_mutex_trylock(&qemu_sigp_mutex)) {
+        if (order != SIGP_SET_ARCH) {
+            dst_cpu = s390_cpu_addr2state(env->regs[r3]);
+            if (dst_cpu) {
+                s390_cpu_reset_sigp_busy(dst_cpu);
+            }
+        }
         ret = SIGP_CC_BUSY;
         goto out;
     }
@@ -487,6 +526,7 @@ void do_stop_interrupt(CPUS390XState *env)
     }
     env->sigp_order = 0;
     env->pending_int &= ~INTERRUPT_STOP;
+    s390_cpu_reset_sigp_busy(cpu);
 }
 
 void s390_init_sigp(void)
-- 
2.25.1


