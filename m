Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 073573E0F4B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 09:34:37 +0200 (CEST)
Received: from localhost ([::1]:58768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBXtk-00029T-4A
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 03:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bharata@linux.ibm.com>)
 id 1mBXs3-0008Ab-IX; Thu, 05 Aug 2021 03:32:55 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bharata@linux.ibm.com>)
 id 1mBXrz-0005bG-DH; Thu, 05 Aug 2021 03:32:51 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1757WZ8X037281; Thu, 5 Aug 2021 03:32:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=J9lg/ZpnkwL7P+Or1wYEByMbCs6/xcZOlad586YtqW8=;
 b=b5hzq6IU3ottu4+j8g72gzVbGC0JmC2AkNpFbKfUGwm8f0cS29pkGq5LbYRFdHp0OIgK
 4uUT0hTA6TNfs4F1ggoSVHZuREuvZ7qCe1yE10xHmII5wuDiVBHzwKnjEHUC63lJtdKo
 Kqvb/eExaVG7BToOu48fISk39FRGKnqo0gU/ZEDmHyVXXpa02R3garplI9ead/ShShBH
 Z5FjTJBfU0BvhGJlI4vLy4lw0rS+lL1sHNVyDHJ72O+RtsFg8pEfM058CtxqUhELCyr1
 OLbaJ0M+dDfaOIdozc3JhxBuPO1ZmcYVORYtMSEjL9PjMLkXgTN9xXxXLff8moaFFYwa /A== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a89fmbaww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 03:32:40 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1757Refk015278;
 Thu, 5 Aug 2021 07:32:38 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 3a4x58hp91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 07:32:38 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1757WYOs51511562
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Aug 2021 07:32:34 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC05A5207B;
 Thu,  5 Aug 2021 07:32:34 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.102.2.73])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 617F252051;
 Thu,  5 Aug 2021 07:32:33 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v0 1/2] spapr: Add H_REG_SNS hcall
Date: Thu,  5 Aug 2021 13:02:27 +0530
Message-Id: <20210805073228.502292-2-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210805073228.502292-1-bharata@linux.ibm.com>
References: <20210805073228.502292-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Vs7vZe4cnuzZcDbV4WcGX4K1bh8qWEiF
X-Proofpoint-GUID: Vs7vZe4cnuzZcDbV4WcGX4K1bh8qWEiF
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-05_02:2021-08-04,
 2021-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108050044
Received-SPF: pass client-ip=148.163.156.1; envelope-from=bharata@linux.ibm.com;
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
Cc: aneesh.kumar@linux.ibm.com, Bharata B Rao <bharata@linux.ibm.com>,
 qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for H_REG_SNS hcall so that asynchronous page
fault mechanism can be supported on PowerKVM guests.

This hcall essentially issues KVM_PPC_SET_SNS to let the
host map and pin the memory containing the Subvention
Notification Structure. It also claims SPAPR_IRQ_SNS to
be used as subvention notification interrupt.

Note: Updates to linux-headers/linux/kvm.h are temporary
pending headers update.

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
 hw/ppc/spapr.c                  |  3 ++
 hw/ppc/spapr_hcall.c            | 56 +++++++++++++++++++++++++++++++++
 include/hw/ppc/spapr.h          |  3 ++
 include/hw/ppc/spapr_irq.h      |  1 +
 linux-headers/asm-powerpc/kvm.h |  6 ++++
 linux-headers/linux/kvm.h       |  1 +
 target/ppc/kvm.c                | 14 +++++++++
 target/ppc/kvm_ppc.h            | 10 ++++++
 8 files changed, 94 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 81699d4f8b..5f1f75826d 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2830,6 +2830,9 @@ static void spapr_machine_init(MachineState *machine)
 
         /* Enable H_PAGE_INIT */
         kvmppc_enable_h_page_init();
+
+        /* Enable H_REG_SNS */
+        kvmppc_enable_h_reg_sns();
     }
 
     /* map RAM */
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 0e9a5b2e40..957edecb13 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1405,6 +1405,59 @@ static target_ulong h_update_dt(PowerPCCPU *cpu, SpaprMachineState *spapr,
     return H_SUCCESS;
 }
 
+static target_ulong deregister_sns(PowerPCCPU *cpu, SpaprMachineState *spapr)
+{
+    spapr->sns_addr = -1;
+    spapr->sns_len = 0;
+    spapr_irq_free(spapr, SPAPR_IRQ_SNS, 1);
+
+    return H_SUCCESS;
+}
+
+static target_ulong h_reg_sns(PowerPCCPU *cpu, SpaprMachineState *spapr,
+                              target_ulong opcode, target_ulong *args)
+{
+    target_ulong addr = args[0];
+    target_ulong len = args[1];
+
+    if (addr == -1) {
+        return deregister_sns(cpu, spapr);
+    }
+
+    /*
+     * If SNS area is already registered, can't register again before
+     * deregistering it first.
+     */
+    if (spapr->sns_addr == -1) {
+        return H_PARAMETER;
+    }
+
+    if (!QEMU_IS_ALIGNED(addr, 4096)) {
+        return H_PARAMETER;
+    }
+
+    if (len < 256) {
+        return H_P2;
+    }
+
+    /* TODO: SNS area is not allowed to cross a page boundary */
+
+    /* KVM_PPC_SET_SNS ioctl */
+    if (kvmppc_set_sns_reg(addr, len)) {
+        return H_PARAMETER;
+    }
+
+    /* Record SNS addr and len */
+    spapr->sns_addr = addr;
+    spapr->sns_len = len;
+
+    /* Register irq source for sending ESN notification */
+    spapr_irq_claim(spapr, SPAPR_IRQ_SNS, false, &error_fatal);
+    args[1] = SPAPR_IRQ_SNS; /* irq no in R5 */
+
+    return H_SUCCESS;
+}
+
 static spapr_hcall_fn papr_hypercall_table[(MAX_HCALL_OPCODE / 4) + 1];
 static spapr_hcall_fn kvmppc_hypercall_table[KVMPPC_HCALL_MAX - KVMPPC_HCALL_BASE + 1];
 static spapr_hcall_fn svm_hypercall_table[(SVM_HCALL_MAX - SVM_HCALL_BASE) / 4 + 1];
@@ -1545,6 +1598,9 @@ static void hypercall_register_types(void)
     spapr_register_hypercall(KVMPPC_H_CAS, h_client_architecture_support);
 
     spapr_register_hypercall(KVMPPC_H_UPDATE_DT, h_update_dt);
+
+    /* SNS memory area registration */
+    spapr_register_hypercall(H_REG_SNS, h_reg_sns);
 }
 
 type_init(hypercall_register_types)
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 637652ad16..934f9e066e 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -252,6 +252,8 @@ struct SpaprMachineState {
     uint32_t numa_assoc_array[MAX_NODES + NVGPU_MAX_NUM][NUMA_ASSOC_SIZE];
 
     Error *fwnmi_migration_blocker;
+    uint64_t sns_addr;
+    uint64_t sns_len;
 };
 
 #define H_SUCCESS         0
@@ -549,6 +551,7 @@ struct SpaprMachineState {
 #define H_SCM_UNBIND_MEM        0x3F0
 #define H_SCM_UNBIND_ALL        0x3FC
 #define H_SCM_HEALTH            0x400
+#define H_REG_SNS               0x41C
 #define H_RPT_INVALIDATE        0x448
 
 #define MAX_HCALL_OPCODE        H_RPT_INVALIDATE
diff --git a/include/hw/ppc/spapr_irq.h b/include/hw/ppc/spapr_irq.h
index c22a72c9e2..26c680f065 100644
--- a/include/hw/ppc/spapr_irq.h
+++ b/include/hw/ppc/spapr_irq.h
@@ -21,6 +21,7 @@
 #define SPAPR_XIRQ_BASE      XICS_IRQ_BASE /* 0x1000 */
 #define SPAPR_IRQ_EPOW       (SPAPR_XIRQ_BASE + 0x0000)
 #define SPAPR_IRQ_HOTPLUG    (SPAPR_XIRQ_BASE + 0x0001)
+#define SPAPR_IRQ_SNS        (SPAPR_XIRQ_BASE + 0x0002)
 #define SPAPR_IRQ_VIO        (SPAPR_XIRQ_BASE + 0x0100)  /* 256 VIO devices */
 #define SPAPR_IRQ_PCI_LSI    (SPAPR_XIRQ_BASE + 0x0200)  /* 32+ PHBs devices */
 
diff --git a/linux-headers/asm-powerpc/kvm.h b/linux-headers/asm-powerpc/kvm.h
index 9f18fa090f..d72739126a 100644
--- a/linux-headers/asm-powerpc/kvm.h
+++ b/linux-headers/asm-powerpc/kvm.h
@@ -470,6 +470,12 @@ struct kvm_ppc_cpu_char {
 #define KVM_PPC_CPU_BEHAV_BNDS_CHK_SPEC_BAR	(1ULL << 61)
 #define KVM_PPC_CPU_BEHAV_FLUSH_COUNT_CACHE	(1ull << 58)
 
+/* For KVM_PPC_SET_SNS */
+struct kvm_ppc_sns_reg {
+	__u64 addr;
+	__u64 len;
+};
+
 /* Per-vcpu XICS interrupt controller state */
 #define KVM_REG_PPC_ICP_STATE	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x8c)
 
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index bcaf66cc4d..a76945fcbc 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1458,6 +1458,7 @@ struct kvm_s390_ucas_mapping {
 #define KVM_SET_PMU_EVENT_FILTER  _IOW(KVMIO,  0xb2, struct kvm_pmu_event_filter)
 #define KVM_PPC_SVM_OFF		  _IO(KVMIO,  0xb3)
 #define KVM_ARM_MTE_COPY_TAGS	  _IOR(KVMIO,  0xb4, struct kvm_arm_copy_mte_tags)
+#define KVM_PPC_SET_SNS		  _IOR(KVMIO,  0xb5, struct kvm_ppc_sns_reg)
 
 /* ioctl for vm fd */
 #define KVM_CREATE_DEVICE	  _IOWR(KVMIO,  0xe0, struct kvm_create_device)
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index dc93b99189..330985c8a0 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -2047,6 +2047,11 @@ void kvmppc_enable_h_rpt_invalidate(void)
     kvmppc_enable_hcall(kvm_state, H_RPT_INVALIDATE);
 }
 
+void kvmppc_enable_h_reg_sns(void)
+{
+    kvmppc_enable_hcall(kvm_state, H_REG_SNS);
+}
+
 void kvmppc_set_papr(PowerPCCPU *cpu)
 {
     CPUState *cs = CPU(cpu);
@@ -2959,3 +2964,12 @@ bool kvm_arch_cpu_check_are_resettable(void)
 {
     return true;
 }
+
+int kvmppc_set_sns_reg(target_ulong addr, target_ulong len)
+{
+    struct kvm_ppc_sns_reg sns_reg;
+
+    sns_reg.addr = addr;
+    sns_reg.len = len;
+    return kvm_vm_ioctl(kvm_state, KVM_PPC_SET_SNS, &sns_reg);
+}
diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
index ee9325bf9a..c22bc3253e 100644
--- a/target/ppc/kvm_ppc.h
+++ b/target/ppc/kvm_ppc.h
@@ -25,6 +25,7 @@ void kvmppc_enable_set_mode_hcall(void);
 void kvmppc_enable_clear_ref_mod_hcalls(void);
 void kvmppc_enable_h_page_init(void);
 void kvmppc_enable_h_rpt_invalidate(void);
+void kvmppc_enable_h_reg_sns(void);
 void kvmppc_set_papr(PowerPCCPU *cpu);
 int kvmppc_set_compat(PowerPCCPU *cpu, uint32_t compat_pvr);
 void kvmppc_set_mpic_proxy(PowerPCCPU *cpu, int mpic_proxy);
@@ -87,6 +88,7 @@ void kvmppc_set_reg_ppc_online(PowerPCCPU *cpu, unsigned int online);
 void kvmppc_set_reg_tb_offset(PowerPCCPU *cpu, int64_t tb_offset);
 
 int kvm_handle_nmi(PowerPCCPU *cpu, struct kvm_run *run);
+int kvmppc_set_sns_reg(target_ulong addr, target_ulong len);
 
 #else
 
@@ -157,6 +159,10 @@ static inline void kvmppc_enable_h_rpt_invalidate(void)
     g_assert_not_reached();
 }
 
+static inline void kvmppc_enable_h_reg_sns(void)
+{
+}
+
 static inline void kvmppc_set_papr(PowerPCCPU *cpu)
 {
 }
@@ -430,6 +436,10 @@ static inline bool kvmppc_pvr_workaround_required(PowerPCCPU *cpu)
     return false;
 }
 
+int kvmppc_set_sns_reg(target_ulong addr, target_ulong len)
+{
+    return -ENOSYS;
+}
 #endif
 
 #ifndef CONFIG_KVM
-- 
2.31.1


