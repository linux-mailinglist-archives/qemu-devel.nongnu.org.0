Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6347710D442
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Nov 2019 11:36:17 +0100 (CET)
Received: from localhost ([::1]:56858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iaddI-0001Wf-Ed
	for lists+qemu-devel@lfdr.de; Fri, 29 Nov 2019 05:36:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48171)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1iactV-00032E-71
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 04:48:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1iactQ-0004XR-Rp
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 04:48:55 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:13630)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1iactQ-0004Gz-Jj
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 04:48:52 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAT9mR6F118074
 for <qemu-devel@nongnu.org>; Fri, 29 Nov 2019 04:48:48 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wjah7ft25-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 29 Nov 2019 04:48:45 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Fri, 29 Nov 2019 09:48:41 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 29 Nov 2019 09:48:39 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xAT9mbIC44564904
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Nov 2019 09:48:37 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B0B3A4053;
 Fri, 29 Nov 2019 09:48:37 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7ABE5A4051;
 Fri, 29 Nov 2019 09:48:35 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.188.128])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 29 Nov 2019 09:48:35 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/13] s390x: protvirt: Add new VCPU reset functions
Date: Fri, 29 Nov 2019 04:48:04 -0500
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191129094809.26684-1-frankja@linux.ibm.com>
References: <20191129094809.26684-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19112909-0016-0000-0000-000002CDD4FC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19112909-0017-0000-0000-0000332FBEE4
Message-Id: <20191129094809.26684-9-frankja@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-29_02:2019-11-29,2019-11-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 mlxscore=0 suspectscore=1 impostorscore=0 clxscore=1015 bulkscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911290086
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
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
Cc: thuth@redhat.com, pmorel@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, mihajlov@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CPU resets for protected guests need to be done via Ultravisor
calls. Hence we need a way to issue these calls for each reset.

As we formerly had only one reset function and it was called for
initial, as well as for the clear reset, we now need a new interface.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 target/s390x/cpu.c       | 14 ++++++++++++--
 target/s390x/kvm-stub.c  | 10 +++++++++-
 target/s390x/kvm.c       | 38 ++++++++++++++++++++++++++++++++------
 target/s390x/kvm_s390x.h |  4 +++-
 4 files changed, 56 insertions(+), 10 deletions(-)

diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index bd39cb54b7..52fefa1586 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -131,8 +131,18 @@ static void s390_cpu_reset(CPUState *s, cpu_reset_type type)
     }
 
     /* Reset state inside the kernel that we cannot access yet from QEMU. */
-    if (kvm_enabled() && type != S390_CPU_RESET_NORMAL) {
-        kvm_s390_reset_vcpu(cpu);
+    if (kvm_enabled()) {
+        switch (type) {
+        case S390_CPU_RESET_CLEAR:
+            kvm_s390_reset_vcpu_clear(cpu);
+            break;
+        case S390_CPU_RESET_INITIAL:
+            kvm_s390_reset_vcpu_initial(cpu);
+            break;
+        case S390_CPU_RESET_NORMAL:
+            kvm_s390_reset_vcpu_normal(cpu);
+            break;
+        }
     }
 }
 
diff --git a/target/s390x/kvm-stub.c b/target/s390x/kvm-stub.c
index 5152e2bdf1..c4cd497f85 100644
--- a/target/s390x/kvm-stub.c
+++ b/target/s390x/kvm-stub.c
@@ -83,7 +83,15 @@ void kvm_s390_cmma_reset(void)
 {
 }
 
-void kvm_s390_reset_vcpu(S390CPU *cpu)
+void kvm_s390_reset_vcpu_initial(S390CPU *cpu)
+{
+}
+
+void kvm_s390_reset_vcpu_clear(S390CPU *cpu)
+{
+}
+
+void kvm_s390_reset_vcpu_normal(S390CPU *cpu)
 {
 }
 
diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
index b802d02ff5..5b1ed3acb4 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm.c
@@ -154,6 +154,7 @@ static int cap_ri;
 static int cap_gs;
 static int cap_hpage_1m;
 static int cap_protvirt;
+static int cap_vcpu_resets;
 
 static int active_cmma;
 
@@ -346,6 +347,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     cap_mem_op = kvm_check_extension(s, KVM_CAP_S390_MEM_OP);
     cap_s390_irq = kvm_check_extension(s, KVM_CAP_S390_INJECT_IRQ);
     cap_protvirt = kvm_check_extension(s, KVM_CAP_S390_PROTECTED);
+    cap_vcpu_resets = kvm_check_extension(s, KVM_CAP_S390_VCPU_RESETS);
 
     if (!kvm_check_extension(s, KVM_CAP_S390_GMAP)
         || !kvm_check_extension(s, KVM_CAP_S390_COW)) {
@@ -407,20 +409,44 @@ int kvm_arch_destroy_vcpu(CPUState *cs)
     return 0;
 }
 
-void kvm_s390_reset_vcpu(S390CPU *cpu)
+static void kvm_s390_reset_vcpu(S390CPU *cpu, unsigned long type)
 {
     CPUState *cs = CPU(cpu);
 
-    /* The initial reset call is needed here to reset in-kernel
-     * vcpu data that we can't access directly from QEMU
-     * (i.e. with older kernels which don't support sync_regs/ONE_REG).
-     * Before this ioctl cpu_synchronize_state() is called in common kvm
-     * code (kvm-all) */
+    /*
+     * The reset call is needed here to reset in-kernel vcpu data that
+     * we can't access directly from QEMU (i.e. with older kernels
+     * which don't support sync_regs/ONE_REG).  Before this ioctl
+     * cpu_synchronize_state() is called in common kvm code
+     * (kvm-all).
+     */
+    if (cap_vcpu_resets) {
+        if (kvm_vcpu_ioctl(cs, KVM_S390_VCPU_RESET, type)) {
+            error_report("CPU reset type %ld failed on CPU %i",
+                         type, cs->cpu_index);
+        }
+        return;
+    }
     if (kvm_vcpu_ioctl(cs, KVM_S390_INITIAL_RESET, NULL)) {
         error_report("Initial CPU reset failed on CPU %i", cs->cpu_index);
     }
 }
 
+void kvm_s390_reset_vcpu_initial(S390CPU *cpu)
+{
+    kvm_s390_reset_vcpu(cpu, KVM_S390_VCPU_RESET_INITIAL);
+}
+
+void kvm_s390_reset_vcpu_clear(S390CPU *cpu)
+{
+    kvm_s390_reset_vcpu(cpu, KVM_S390_VCPU_RESET_CLEAR);
+}
+
+void kvm_s390_reset_vcpu_normal(S390CPU *cpu)
+{
+    kvm_s390_reset_vcpu(cpu, KVM_S390_VCPU_RESET_NORMAL);
+}
+
 static int can_sync_regs(CPUState *cs, int regs)
 {
     return cap_sync_regs && (cs->kvm_run->kvm_valid_regs & regs) == regs;
diff --git a/target/s390x/kvm_s390x.h b/target/s390x/kvm_s390x.h
index caf985955b..0b21789796 100644
--- a/target/s390x/kvm_s390x.h
+++ b/target/s390x/kvm_s390x.h
@@ -34,7 +34,9 @@ int kvm_s390_assign_subch_ioeventfd(EventNotifier *notifier, uint32_t sch,
                                     int vq, bool assign);
 int kvm_s390_cmma_active(void);
 void kvm_s390_cmma_reset(void);
-void kvm_s390_reset_vcpu(S390CPU *cpu);
+void kvm_s390_reset_vcpu_clear(S390CPU *cpu);
+void kvm_s390_reset_vcpu_normal(S390CPU *cpu);
+void kvm_s390_reset_vcpu_initial(S390CPU *cpu);
 int kvm_s390_set_mem_limit(uint64_t new_limit, uint64_t *hw_limit);
 void kvm_s390_set_max_pagesize(uint64_t pagesize, Error **errp);
 void kvm_s390_crypto_reset(void);
-- 
2.20.1


