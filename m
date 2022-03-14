Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2054D8D7B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 20:54:40 +0100 (CET)
Received: from localhost ([::1]:47582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTqm7-0000nG-CW
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 15:54:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1nTqhK-0001AB-Gb; Mon, 14 Mar 2022 15:49:43 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:42094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1nTqhI-00036a-3X; Mon, 14 Mar 2022 15:49:41 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22EJlVeL002679; 
 Mon, 14 Mar 2022 19:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=FzASfKyj0eR9/Ww/nhIftsHsBp/NIss97mXU5M92LDw=;
 b=joVBjaO0OhgoMzYmHx7klwyPHkVYLYQRJT031PoSnyZm2KKE2/sM0Q79msojBOD4GgTK
 AwUJC3L/1lF5ZRokM3ZNgEXDiDexad1huaAbyv7ombF6KrJfluL80xEYndRstcnmjyl4
 Os8eY5327bFltQKslyyK8c9DwaXmInCvL4m0RztoTMYeXemlAcEjWe/1SGyzNB7gcnix
 MhVyaspjG4rdlNq14s828v7N7VgJ8rTFuEf+Rni74HW1JM1C+ceJqaIz2lDH5SYhD0/T
 Xt/nBp4ociZFt5HF7TlLIfZWR+VIVS+YASb8wuJVhX59MINXPFi8c51puOlsKEzowK8c NQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3et6ah929x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 19:49:35 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22EJmVr7006314;
 Mon, 14 Mar 2022 19:49:35 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3et6ah929s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 19:49:35 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22EJlApl009552;
 Mon, 14 Mar 2022 19:49:34 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01dal.us.ibm.com with ESMTP id 3erk59ccam-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 19:49:34 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22EJnWCs32964884
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 19:49:32 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 23134112067;
 Mon, 14 Mar 2022 19:49:32 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6234A11206E;
 Mon, 14 Mar 2022 19:49:28 +0000 (GMT)
Received: from li-c92d2ccc-254b-11b2-a85c-a700b5bfb098.ibm.com.com (unknown
 [9.211.32.184]) by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 14 Mar 2022 19:49:28 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH v4 01/11] Update linux headers
Date: Mon, 14 Mar 2022 15:49:10 -0400
Message-Id: <20220314194920.58888-2-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220314194920.58888-1-mjrosato@linux.ibm.com>
References: <20220314194920.58888-1-mjrosato@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nzbBv5zspxk00AnLZbUGpXsMx5DpNqm_
X-Proofpoint-ORIG-GUID: 0AqaTJHA0Eksz6x5jQChjXPBz_OKvOwI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_13,2022-03-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=992 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203140116
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Cc: farman@linux.ibm.com, kvm@vger.kernel.org, pmorel@linux.ibm.com,
 schnelle@linux.ibm.com, cohuck@redhat.com, richard.henderson@linaro.org,
 thuth@redhat.com, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 alex.williamson@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 david@redhat.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a placeholder that pulls in 5.17-rc7 + unmerged kernel changes
required by this item.  A proper header sync can be done once the
associated kernel code merges.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 linux-headers/asm-s390/kvm.h    |  1 +
 linux-headers/asm-x86/kvm.h     |  3 ++
 linux-headers/linux/kvm.h       | 51 +++++++++++++++++++++++++++++++--
 linux-headers/linux/vfio.h      |  6 ++++
 linux-headers/linux/vfio_zdev.h |  6 ++++
 5 files changed, 64 insertions(+), 3 deletions(-)

diff --git a/linux-headers/asm-s390/kvm.h b/linux-headers/asm-s390/kvm.h
index f053b8304a..d8259ff9a1 100644
--- a/linux-headers/asm-s390/kvm.h
+++ b/linux-headers/asm-s390/kvm.h
@@ -130,6 +130,7 @@ struct kvm_s390_vm_cpu_machine {
 #define KVM_S390_VM_CPU_FEAT_PFMFI	11
 #define KVM_S390_VM_CPU_FEAT_SIGPIF	12
 #define KVM_S390_VM_CPU_FEAT_KSS	13
+#define KVM_S390_VM_CPU_FEAT_ZPCI_INTERP 14
 struct kvm_s390_vm_cpu_feat {
 	__u64 feat[16];
 };
diff --git a/linux-headers/asm-x86/kvm.h b/linux-headers/asm-x86/kvm.h
index 2da3316bb5..bf6e96011d 100644
--- a/linux-headers/asm-x86/kvm.h
+++ b/linux-headers/asm-x86/kvm.h
@@ -452,6 +452,9 @@ struct kvm_sync_regs {
 
 #define KVM_STATE_VMX_PREEMPTION_TIMER_DEADLINE	0x00000001
 
+/* attributes for system fd (group 0) */
+#define KVM_X86_XCOMP_GUEST_SUPP	0
+
 struct kvm_vmx_nested_state_data {
 	__u8 vmcs12[KVM_STATE_NESTED_VMX_VMCS_SIZE];
 	__u8 shadow_vmcs12[KVM_STATE_NESTED_VMX_VMCS_SIZE];
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 00af3bc333..8f82e6ff20 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1133,6 +1133,9 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_VM_MOVE_ENC_CONTEXT_FROM 206
 #define KVM_CAP_VM_GPA_BITS 207
 #define KVM_CAP_XSAVE2 208
+#define KVM_CAP_SYS_ATTRIBUTES 209
+#define KVM_CAP_PPC_AIL_MODE_3 210
+#define KVM_CAP_S390_ZPCI_OP 211
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -1623,9 +1626,6 @@ struct kvm_enc_region {
 #define KVM_S390_NORMAL_RESET	_IO(KVMIO,   0xc3)
 #define KVM_S390_CLEAR_RESET	_IO(KVMIO,   0xc4)
 
-/* Available with KVM_CAP_XSAVE2 */
-#define KVM_GET_XSAVE2		  _IOR(KVMIO,  0xcf, struct kvm_xsave)
-
 struct kvm_s390_pv_sec_parm {
 	__u64 origin;
 	__u64 length;
@@ -2047,4 +2047,49 @@ struct kvm_stats_desc {
 
 #define KVM_GET_STATS_FD  _IO(KVMIO,  0xce)
 
+/* Available with KVM_CAP_XSAVE2 */
+#define KVM_GET_XSAVE2		  _IOR(KVMIO,  0xcf, struct kvm_xsave)
+
+/* Available with KVM_CAP_S390_ZPCI_OP */
+#define KVM_S390_ZPCI_OP	  _IOW(KVMIO,  0xd0, struct kvm_s390_zpci_op)
+
+struct kvm_s390_zpci_op {
+	/* in */
+	__u32 fh;		/* target device */
+	__u8  op;		/* operation to perform */
+	__u8  pad[3];
+	union {
+		/* for KVM_S390_ZPCIOP_REG_INT */
+		struct {
+			__u64 ibv;	/* Guest addr of interrupt bit vector */
+			__u64 sb;	/* Guest addr of summary bit */
+			__u32 flags;
+			__u32 noi;	/* Number of interrupts */
+			__u8 isc;	/* Guest interrupt subclass */
+			__u8 sbo;	/* Offset of guest summary bit vector */
+			__u16 pad;
+		} reg_int;
+		/* for KVM_S390_ZPCIOP_REG_IOAT */
+		struct {
+			__u64 iota;	/* I/O Translation settings */
+		} reg_ioat;
+		__u8 reserved[64];
+	} u;
+	/* out */
+	__u32 newfh;		/* updated device handle */
+};
+
+/* types for kvm_s390_zpci_op->op */
+#define KVM_S390_ZPCIOP_INIT		0
+#define KVM_S390_ZPCIOP_END		1
+#define KVM_S390_ZPCIOP_START_INTERP	2
+#define KVM_S390_ZPCIOP_STOP_INTERP	3
+#define KVM_S390_ZPCIOP_REG_INT		4
+#define KVM_S390_ZPCIOP_DEREG_INT	5
+#define KVM_S390_ZPCIOP_REG_IOAT	6
+#define KVM_S390_ZPCIOP_DEREG_IOAT	7
+
+/* flags for kvm_s390_zpci_op->u.reg_int.flags */
+#define KVM_S390_ZPCIOP_REGINT_HOST	(1 << 0)
+
 #endif /* __LINUX_KVM_H */
diff --git a/linux-headers/linux/vfio.h b/linux-headers/linux/vfio.h
index e680594f27..38d43e1205 100644
--- a/linux-headers/linux/vfio.h
+++ b/linux-headers/linux/vfio.h
@@ -52,6 +52,12 @@
 /* Supports the vaddr flag for DMA map and unmap */
 #define VFIO_UPDATE_VADDR		10
 
+/*
+ * The KVM_IOMMU type implies that the hypervisor will control the mappings
+ * rather than userspace
+ */
+#define VFIO_KVM_IOMMU			11
+
 /*
  * The IOCTL interface is designed for extensibility by embedding the
  * structure length (argsz) and flags into structures passed between
diff --git a/linux-headers/linux/vfio_zdev.h b/linux-headers/linux/vfio_zdev.h
index b4309397b6..29351687e9 100644
--- a/linux-headers/linux/vfio_zdev.h
+++ b/linux-headers/linux/vfio_zdev.h
@@ -29,6 +29,9 @@ struct vfio_device_info_cap_zpci_base {
 	__u16 fmb_length;	/* Measurement Block Length (in bytes) */
 	__u8 pft;		/* PCI Function Type */
 	__u8 gid;		/* PCI function group ID */
+	/* End of version 1 */
+	__u32 fh;		/* PCI function handle */
+	/* End of version 2 */
 };
 
 /**
@@ -47,6 +50,9 @@ struct vfio_device_info_cap_zpci_group {
 	__u16 noi;		/* Maximum number of MSIs */
 	__u16 maxstbl;		/* Maximum Store Block Length */
 	__u8 version;		/* Supported PCI Version */
+	/* End of version 1 */
+	__u8 dtsm;		/* Supported IOAT Designations */
+	/* End of version 2 */
 };
 
 /**
-- 
2.27.0


