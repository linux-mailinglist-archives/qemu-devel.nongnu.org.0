Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A13F16FEF1
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 13:27:14 +0100 (CET)
Received: from localhost ([::1]:43556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6vmT-0005ed-8t
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 07:27:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53429)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1j6vgV-0002WS-If
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 07:21:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1j6vgT-00084S-6B
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 07:21:02 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:9486)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1j6vgS-00081p-Ue
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 07:21:01 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01QCKqfw100739
 for <qemu-devel@nongnu.org>; Wed, 26 Feb 2020 07:21:00 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydq6w3evn-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 26 Feb 2020 07:20:59 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Wed, 26 Feb 2020 12:20:57 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 26 Feb 2020 12:20:54 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 01QCKr0s42991942
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Feb 2020 12:20:53 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE5D611C04C;
 Wed, 26 Feb 2020 12:20:53 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0134211C064;
 Wed, 26 Feb 2020 12:20:53 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.152.224.212])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 26 Feb 2020 12:20:52 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/18] s390x: Add SIDA memory ops
Date: Wed, 26 Feb 2020 07:20:29 -0500
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200226122038.61481-1-frankja@linux.ibm.com>
References: <20200226122038.61481-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022612-0028-0000-0000-000003DE2592
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022612-0029-0000-0000-000024A34158
Message-Id: <20200226122038.61481-10-frankja@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-26_04:2020-02-26,
 2020-02-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=763 clxscore=1015 mlxscore=0 adultscore=0 impostorscore=0
 phishscore=0 suspectscore=1 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2002260092
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Protected guests save the instruction control blocks in the SIDA
instead of QEMU/KVM directly accessing the guest's memory.

Let's introduce new functions to access the SIDA.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 linux-headers/linux/kvm.h |  2 ++
 target/s390x/cpu.h        |  7 ++++++-
 target/s390x/kvm.c        | 25 +++++++++++++++++++++++++
 target/s390x/kvm_s390x.h  |  2 ++
 target/s390x/mmu_helper.c | 14 ++++++++++++++
 5 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index e36f761194..c30344ab00 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -483,6 +483,8 @@ struct kvm_s390_mem_op {
 /* types for kvm_s390_mem_op->op */
 #define KVM_S390_MEMOP_LOGICAL_READ	0
 #define KVM_S390_MEMOP_LOGICAL_WRITE	1
+#define KVM_S390_MEMOP_SIDA_READ	2
+#define KVM_S390_MEMOP_SIDA_WRITE	3
 /* flags for kvm_s390_mem_op->flags */
 #define KVM_S390_MEMOP_F_CHECK_ONLY		(1ULL << 0)
 #define KVM_S390_MEMOP_F_INJECT_EXCEPTION	(1ULL << 1)
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index acff5c9a65..c9bbb51214 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -824,7 +824,12 @@ int s390_cpu_virt_mem_rw(S390CPU *cpu, vaddr laddr, uint8_t ar, void *hostbuf,
 #define s390_cpu_virt_mem_check_write(cpu, laddr, ar, len)   \
         s390_cpu_virt_mem_rw(cpu, laddr, ar, NULL, len, true)
 void s390_cpu_virt_mem_handle_exc(S390CPU *cpu, uintptr_t ra);
-
+int s390_cpu_pv_mem_rw(S390CPU *cpu, unsigned int offset,  void *hostbuf,
+                       int len, bool is_write);
+#define s390_cpu_pv_mem_read(cpu, offset, dest, len)    \
+        s390_cpu_pv_mem_rw(cpu, offset, dest, len, false)
+#define s390_cpu_pv_mem_write(cpu, offset, dest, len)       \
+        s390_cpu_pv_mem_rw(cpu, offset, dest, len, true)
 
 /* sigp.c */
 int s390_cpu_restart(S390CPU *cpu);
diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
index eec0b92479..cdcd538b4f 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm.c
@@ -154,6 +154,7 @@ static int cap_ri;
 static int cap_gs;
 static int cap_hpage_1m;
 static int cap_vcpu_resets;
+static int cap_protected;
 
 static int active_cmma;
 
@@ -346,6 +347,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     cap_mem_op = kvm_check_extension(s, KVM_CAP_S390_MEM_OP);
     cap_s390_irq = kvm_check_extension(s, KVM_CAP_S390_INJECT_IRQ);
     cap_vcpu_resets = kvm_check_extension(s, KVM_CAP_S390_VCPU_RESETS);
+    cap_protected = kvm_check_extension(s, KVM_CAP_S390_PROTECTED);
 
     if (!kvm_check_extension(s, KVM_CAP_S390_GMAP)
         || !kvm_check_extension(s, KVM_CAP_S390_COW)) {
@@ -846,6 +848,29 @@ int kvm_s390_mem_op(S390CPU *cpu, vaddr addr, uint8_t ar, void *hostbuf,
     return ret;
 }
 
+int kvm_s390_mem_op_pv(S390CPU *cpu, uint64_t offset, void *hostbuf,
+                       int len, bool is_write)
+{
+    struct kvm_s390_mem_op mem_op = {
+        .sida_offset = offset,
+        .size = len,
+        .op = is_write ? KVM_S390_MEMOP_SIDA_WRITE
+                       : KVM_S390_MEMOP_SIDA_READ,
+        .buf = (uint64_t)hostbuf,
+    };
+    int ret;
+
+    if (!cap_mem_op || !cap_protected) {
+        return -ENOSYS;
+    }
+
+    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_S390_MEM_OP, &mem_op);
+    if (ret < 0) {
+        error_report("KVM_S390_MEM_OP failed: %s", strerror(-ret));
+    }
+    return ret;
+}
+
 /*
  * Legacy layout for s390:
  * Older S390 KVM requires the topmost vma of the RAM to be
diff --git a/target/s390x/kvm_s390x.h b/target/s390x/kvm_s390x.h
index 0b21789796..9c38f6ccce 100644
--- a/target/s390x/kvm_s390x.h
+++ b/target/s390x/kvm_s390x.h
@@ -19,6 +19,8 @@ void kvm_s390_vcpu_interrupt(S390CPU *cpu, struct kvm_s390_irq *irq);
 void kvm_s390_access_exception(S390CPU *cpu, uint16_t code, uint64_t te_code);
 int kvm_s390_mem_op(S390CPU *cpu, vaddr addr, uint8_t ar, void *hostbuf,
                     int len, bool is_write);
+int kvm_s390_mem_op_pv(S390CPU *cpu, vaddr addr, void *hostbuf, int len,
+                       bool is_write);
 void kvm_s390_program_interrupt(S390CPU *cpu, uint16_t code);
 int kvm_s390_set_cpu_state(S390CPU *cpu, uint8_t cpu_state);
 void kvm_s390_vcpu_interrupt_pre_save(S390CPU *cpu);
diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
index c9f3f34750..ec8befbdc8 100644
--- a/target/s390x/mmu_helper.c
+++ b/target/s390x/mmu_helper.c
@@ -474,6 +474,20 @@ static int translate_pages(S390CPU *cpu, vaddr addr, int nr_pages,
     return 0;
 }
 
+int s390_cpu_pv_mem_rw(S390CPU *cpu, unsigned int offset, void *hostbuf,
+                       int len, bool is_write)
+{
+    int ret;
+
+    if (kvm_enabled()) {
+        ret = kvm_s390_mem_op_pv(cpu, offset, hostbuf, len, is_write);
+    } else {
+        /* Protected Virtualization is a KVM/Hardware only feature */
+        g_assert_not_reached();
+    }
+    return ret;
+}
+
 /**
  * s390_cpu_virt_mem_rw:
  * @laddr:     the logical start address
-- 
2.20.1


