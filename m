Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DB8454B9D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 18:07:53 +0100 (CET)
Received: from localhost ([::1]:60134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnOPY-0004oe-Vr
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 12:07:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mnO6o-0007wS-8q; Wed, 17 Nov 2021 11:48:30 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:16306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mnO6l-00022T-Gg; Wed, 17 Nov 2021 11:48:29 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AHFgjfX009864; 
 Wed, 17 Nov 2021 16:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=gGMmjw0HGpyvrO8NgFhsXxBf3NZ5Zgx5xH10To2smKU=;
 b=Q9kNnvzMEDTVv0eUIYFGXHriboFlKuXntIDg1tiQabEz3YVbtXRWxjcwrjPa3tVyxmd5
 k8OPqyl4Bx+TS3vvNRko6QHOOmOt1xBUVVMOkQ6oeVXecS1BTC0AJ0mT7KqNPchIn3er
 E2Vg8HtcDIt9SpKgFiYOIH8oGDevDAoTsNfRS816P8x8+SZn9m4OYp8/dFvTUg+6lh/m
 EJWmbUXsIwa4YrRYpK9vjBU0YfgDh7kGZuLGIUExi2yuQ2mfSjNUD3fWogWPzL/TRGpw
 lLdHWkt6mPvHD5XvYaLNnt0WS+0SnASwmRN3YcvjUe7sJxOxX3o0zWH51eIOqu1SZVsr +g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cd4mc1gyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 16:48:24 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AHFj1a9015614;
 Wed, 17 Nov 2021 16:48:23 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cd4mc1gy8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 16:48:23 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AHGRAFa023771;
 Wed, 17 Nov 2021 16:48:20 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3ca4mk4e57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 16:48:20 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AHGmHiK21103006
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Nov 2021 16:48:17 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C37B42042;
 Wed, 17 Nov 2021 16:48:17 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F238942045;
 Wed, 17 Nov 2021 16:48:16 +0000 (GMT)
Received: from li-c6ac47cc-293c-11b2-a85c-d421c8e4747b.ibm.com.com (unknown
 [9.171.38.237])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 17 Nov 2021 16:48:16 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH v4 5/5] s390x: kvm: topology: interception of PTF instruction
Date: Wed, 17 Nov 2021 17:48:48 +0100
Message-Id: <20211117164848.310952-6-pmorel@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211117164848.310952-1-pmorel@linux.ibm.com>
References: <20211117164848.310952-1-pmorel@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4mUwYgnbgqpCk2b91FNcKRjR0L-IJ9eJ
X-Proofpoint-GUID: BvDhJqMFC4cJSEE12xtg-CV5V3ubmEUR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-17_05,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111170077
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the host supports the CPU topology facility, the PTF
instruction with function code 2 is interpreted by the SIE,
provided that the userland hypervizor activates the interpretation
by using the KVM_CAP_S390_CPU_TOPOLOGY KVM extension.

The PTF instructions with function code 0 and 1 are intercepted
and must be emulated by the userland hypervizor.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
---
 hw/s390x/s390-virtio-ccw.c         | 50 ++++++++++++++++++++++++++++++
 include/hw/s390x/s390-virtio-ccw.h |  6 ++++
 target/s390x/kvm/kvm.c             | 15 +++++++++
 3 files changed, 71 insertions(+)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 8b624c2e0c..6218352e68 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -408,6 +408,56 @@ static void s390_pv_prepare_reset(S390CcwMachineState *ms)
     s390_pv_prep_reset();
 }
 
+/*
+ * s390_handle_ptf:
+ *
+ * @register 1: contains the function code
+ *
+ * Function codes 0 and 1 handle the CPU polarization.
+ * We assume an horizontal topology, the only one supported currently
+ * by Linux, consequently we answer to function code 0, requesting
+ * horizontal polarization that it is already the current polarization
+ * and reject vertical polarization request without further explanation.
+ *
+ * Function code 2 is handling topology changes and is interpreted
+ * by the SIE.
+ */
+int s390_handle_ptf(S390CPU *cpu, uint8_t r1, uintptr_t ra)
+{
+    CPUS390XState *env = &cpu->env;
+    uint64_t reg = env->regs[r1];
+    uint8_t fc = reg & S390_TOPO_FC_MASK;
+
+    if (!s390_has_feat(S390_FEAT_CONFIGURATION_TOPOLOGY)) {
+        s390_program_interrupt(env, PGM_OPERATION, ra);
+        return 0;
+    }
+
+    if (env->psw.mask & PSW_MASK_PSTATE) {
+        s390_program_interrupt(env, PGM_PRIVILEGED, ra);
+        return 0;
+    }
+
+    if (reg & ~S390_TOPO_FC_MASK) {
+        s390_program_interrupt(env, PGM_SPECIFICATION, ra);
+        return 0;
+    }
+
+    switch (fc) {
+    case 0:    /* Horizontal polarization is already set */
+        env->regs[r1] |= S390_PTF_REASON_DONE;
+        return 2;
+    case 1:    /* Vertical polarization is not supported */
+        env->regs[r1] |= S390_PTF_REASON_NONE;
+        return 2;
+    default:
+        /* Note that fc == 2 is interpreted by the SIE */
+        s390_program_interrupt(env, PGM_SPECIFICATION, ra);
+    }
+
+    return 0;
+}
+
 static void s390_machine_reset(MachineState *machine)
 {
     S390CcwMachineState *ms = S390_CCW_MACHINE(machine);
diff --git a/include/hw/s390x/s390-virtio-ccw.h b/include/hw/s390x/s390-virtio-ccw.h
index 3331990e02..ac4b4a92e7 100644
--- a/include/hw/s390x/s390-virtio-ccw.h
+++ b/include/hw/s390x/s390-virtio-ccw.h
@@ -30,6 +30,12 @@ struct S390CcwMachineState {
     uint8_t loadparm[8];
 };
 
+#define S390_PTF_REASON_NONE (0x00 << 8)
+#define S390_PTF_REASON_DONE (0x01 << 8)
+#define S390_PTF_REASON_BUSY (0x02 << 8)
+#define S390_TOPO_FC_MASK 0xffUL
+int s390_handle_ptf(S390CPU *cpu, uint8_t r1, uintptr_t ra);
+
 struct S390CcwMachineClass {
     /*< private >*/
     MachineClass parent_class;
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 6ffc697b51..42eda0faee 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -98,6 +98,7 @@
 
 #define PRIV_B9_EQBS                    0x9c
 #define PRIV_B9_CLP                     0xa0
+#define PRIV_B9_PTF                     0xa2
 #define PRIV_B9_PCISTG                  0xd0
 #define PRIV_B9_PCILG                   0xd2
 #define PRIV_B9_RPCIT                   0xd3
@@ -363,6 +364,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     kvm_vm_enable_cap(s, KVM_CAP_S390_USER_SIGP, 0);
     kvm_vm_enable_cap(s, KVM_CAP_S390_VECTOR_REGISTERS, 0);
     kvm_vm_enable_cap(s, KVM_CAP_S390_USER_STSI, 0);
+    kvm_vm_enable_cap(s, KVM_CAP_S390_CPU_TOPOLOGY, 0);
     if (ri_allowed()) {
         if (kvm_vm_enable_cap(s, KVM_CAP_S390_RI, 0) == 0) {
             cap_ri = 1;
@@ -1454,6 +1456,16 @@ static int kvm_mpcifc_service_call(S390CPU *cpu, struct kvm_run *run)
     }
 }
 
+static int kvm_handle_ptf(S390CPU *cpu, struct kvm_run *run)
+{
+    uint8_t r1 = (run->s390_sieic.ipb >> 20) & 0x0f;
+    int ret;
+
+    ret = s390_handle_ptf(cpu, r1, RA_IGNORED);
+    setcc(cpu, ret);
+    return 0;
+}
+
 static int handle_b9(S390CPU *cpu, struct kvm_run *run, uint8_t ipa1)
 {
     int r = 0;
@@ -1471,6 +1483,9 @@ static int handle_b9(S390CPU *cpu, struct kvm_run *run, uint8_t ipa1)
     case PRIV_B9_RPCIT:
         r = kvm_rpcit_service_call(cpu, run);
         break;
+    case PRIV_B9_PTF:
+        r = kvm_handle_ptf(cpu, run);
+        break;
     case PRIV_B9_EQBS:
         /* just inject exception */
         r = -1;
-- 
2.27.0


