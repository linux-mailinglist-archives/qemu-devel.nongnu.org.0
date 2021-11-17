Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6BA454B84
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 18:02:47 +0100 (CET)
Received: from localhost ([::1]:45500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnOKc-00035L-Cs
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 12:02:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mnO6n-0007rw-0c; Wed, 17 Nov 2021 11:48:29 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mnO6j-000229-L1; Wed, 17 Nov 2021 11:48:28 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AHGgKqv018791; 
 Wed, 17 Nov 2021 16:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=yy8DaN9cAtsPqO9KsE0rQVGqnb7oloCiQi+H9yqlOM0=;
 b=Ft5ls59/kiORUHIVqs/oLbgMIR3aRNtVCYqjNfLbiRHAf/kV3tWCWaSRPKlrLXPSRx8P
 BkTqudQvo+UFpJw5KFKBxeqLK0aIDSx+bfBfyHW42BcVBelRKYjcyGg+NO13P+T4RsKu
 KujS3YK0pP4u3UjPQzDJchjo3ZxrjQoZ2C/8C8u91xe6N2QfDFlNNoIMQU6tddLv+bvQ
 U2CS6nbVv6XVHzZNDwlgO+DOO6TbnRVuiD1VnDCP0UkyIF30ydttmryRHrlsh4uT5ZdH
 VcpZr2hDhK6BTooo89KXVSmhx2WTiYP0H9xuPnAfzZeQMATeK18/FdW08IC3YRzRp3dt sA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cd5ga83sw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 16:48:23 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AHGjAoj025814;
 Wed, 17 Nov 2021 16:48:22 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cd5ga83s3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 16:48:22 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AHGR9Uc018638;
 Wed, 17 Nov 2021 16:48:20 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 3ca4mkava1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 16:48:19 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AHGmGd055968118
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Nov 2021 16:48:17 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DEA8D4204C;
 Wed, 17 Nov 2021 16:48:16 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D57B42045;
 Wed, 17 Nov 2021 16:48:16 +0000 (GMT)
Received: from li-c6ac47cc-293c-11b2-a85c-d421c8e4747b.ibm.com.com (unknown
 [9.171.38.237])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 17 Nov 2021 16:48:16 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH v4 4/5] s390x: CPU topology: CPU topology migration
Date: Wed, 17 Nov 2021 17:48:47 +0100
Message-Id: <20211117164848.310952-5-pmorel@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211117164848.310952-1-pmorel@linux.ibm.com>
References: <20211117164848.310952-1-pmorel@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 50etPL_8XrGkJw8h_k9hcqO3nI-OHlkw
X-Proofpoint-GUID: tg_Iitn9HLu1vKn9qBv0FezY51suSrgF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-17_05,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 bulkscore=0 mlxscore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111170077
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

Both source and target must have the same configuration
regarding the activation of Perform Topology Function
and Store Topology System Information.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
---
 target/s390x/cpu.h                  |  2 ++
 target/s390x/cpu_features_def.h.inc |  1 +
 target/s390x/cpu_models.c           |  2 ++
 target/s390x/gen-features.c         |  3 ++
 target/s390x/kvm/kvm.c              |  6 ++++
 target/s390x/machine.c              | 48 +++++++++++++++++++++++++++++
 6 files changed, 62 insertions(+)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index de05cc48cc..e3ca549774 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -150,6 +150,8 @@ struct CPUS390XState {
     /* currently processed sigp order */
     uint8_t sigp_order;
 
+    /* Using Perform CPU Topology Function*/
+    bool using_ptf;
 };
 
 static inline uint64_t *get_freg(CPUS390XState *cs, int nr)
diff --git a/target/s390x/cpu_features_def.h.inc b/target/s390x/cpu_features_def.h.inc
index e86662bb3b..27e8904978 100644
--- a/target/s390x/cpu_features_def.h.inc
+++ b/target/s390x/cpu_features_def.h.inc
@@ -146,6 +146,7 @@ DEF_FEAT(SIE_CEI, "cei", SCLP_CPU, 43, "SIE: Conditional-external-interception f
 DEF_FEAT(DAT_ENH_2, "dateh2", MISC, 0, "DAT-enhancement facility 2")
 DEF_FEAT(CMM, "cmm", MISC, 0, "Collaborative-memory-management facility")
 DEF_FEAT(AP, "ap", MISC, 0, "AP instructions installed")
+DEF_FEAT(CPU_TOPOLOGY, "cpu_topology", MISC, 0, "CPU Topology available")
 
 /* Features exposed via the PLO instruction. */
 DEF_FEAT(PLO_CL, "plo-cl", PLO, 0, "PLO Compare and load (32 bit in general registers)")
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 11e06cc51f..1f9ea6479d 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -238,6 +238,7 @@ bool s390_has_feat(S390Feat feat)
 
     if (s390_is_pv()) {
         switch (feat) {
+        case S390_FEAT_CPU_TOPOLOGY:
         case S390_FEAT_DIAG_318:
         case S390_FEAT_HPMA2:
         case S390_FEAT_SIE_F2:
@@ -467,6 +468,7 @@ static void check_consistency(const S390CPUModel *model)
         { S390_FEAT_DIAG_318, S390_FEAT_EXTENDED_LENGTH_SCCB },
         { S390_FEAT_NNPA, S390_FEAT_VECTOR },
         { S390_FEAT_RDP, S390_FEAT_LOCAL_TLB_CLEARING },
+        { S390_FEAT_CPU_TOPOLOGY, S390_FEAT_CONFIGURATION_TOPOLOGY },
     };
     int i;
 
diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index 7cb1a6ec10..377d8aad90 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -488,6 +488,7 @@ static uint16_t full_GEN9_GA3[] = {
 static uint16_t full_GEN10_GA1[] = {
     S390_FEAT_EDAT,
     S390_FEAT_CONFIGURATION_TOPOLOGY,
+    S390_FEAT_CPU_TOPOLOGY,
     S390_FEAT_GROUP_MSA_EXT_2,
     S390_FEAT_ESOP,
     S390_FEAT_SIE_PFMFI,
@@ -604,6 +605,8 @@ static uint16_t default_GEN9_GA1[] = {
 static uint16_t default_GEN10_GA1[] = {
     S390_FEAT_EDAT,
     S390_FEAT_GROUP_MSA_EXT_2,
+    S390_FEAT_CONFIGURATION_TOPOLOGY,
+    S390_FEAT_CPU_TOPOLOGY,
 };
 
 #define default_GEN10_GA2 EmptyFeat
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index c17e92fc9c..6ffc697b51 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -612,6 +612,7 @@ int kvm_arch_put_registers(CPUState *cs, int level)
     } else {
         /* prefix is only supported via sync regs */
     }
+
     return 0;
 }
 
@@ -2427,6 +2428,10 @@ void kvm_s390_get_host_cpu_model(S390CPUModel *model, Error **errp)
         clear_bit(S390_FEAT_CMM_NT, model->features);
     }
 
+    if (kvm_check_extension(kvm_state, KVM_CAP_S390_CPU_TOPOLOGY)) {
+        set_bit(S390_FEAT_CPU_TOPOLOGY, model->features);
+    }
+
     /* bpb needs kernel support for migration, VSIE and reset */
     if (!kvm_check_extension(kvm_state, KVM_CAP_S390_BPB)) {
         clear_bit(S390_FEAT_BPB, model->features);
@@ -2535,6 +2540,7 @@ void kvm_s390_apply_cpu_model(const S390CPUModel *model, Error **errp)
         error_setg(errp, "KVM: Error configuring CPU subfunctions: %d", rc);
         return;
     }
+
     /* enable CMM via CMMA */
     if (test_bit(S390_FEAT_CMM, model->features)) {
         kvm_s390_enable_cmma();
diff --git a/target/s390x/machine.c b/target/s390x/machine.c
index 37a076858c..6036e8e856 100644
--- a/target/s390x/machine.c
+++ b/target/s390x/machine.c
@@ -250,6 +250,53 @@ const VMStateDescription vmstate_diag318 = {
     }
 };
 
+static int cpu_topology_presave(void *opaque)
+{
+    S390CPU *cpu = opaque;
+
+    cpu->env.using_ptf = s390_has_feat(S390_FEAT_CPU_TOPOLOGY);
+    return 0;
+}
+
+static int cpu_topology_postload(void *opaque, int version_id)
+{
+    S390CPU *cpu = opaque;
+
+    if ((cpu->env.using_ptf == s390_has_feat(S390_FEAT_CPU_TOPOLOGY)) &&
+        (cpu->env.using_ptf == s390_has_feat(S390_FEAT_CONFIGURATION_TOPOLOGY))) {
+        return 0;
+    }
+    if (cpu->env.using_ptf) {
+        error_report("Target needs CPU Topology enabled");
+    } else {
+        if (s390_has_feat(S390_FEAT_CONFIGURATION_TOPOLOGY)) {
+            error_report("Target is not allowed to enable configuration Topology");
+        }
+        if (s390_has_feat(S390_FEAT_CPU_TOPOLOGY)) {
+            error_report("Target is not allowed to enable CPU Topology");
+        }
+    }
+    return -EINVAL;
+}
+
+static bool cpu_topology_needed(void *opaque)
+{
+    return 1;
+}
+
+const VMStateDescription vmstate_cpu_topology = {
+    .name = "cpu/cpu_topology",
+    .version_id = 1,
+    .pre_save = cpu_topology_presave,
+    .post_load = cpu_topology_postload,
+    .minimum_version_id = 1,
+    .needed = cpu_topology_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_BOOL(env.using_ptf, S390CPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 const VMStateDescription vmstate_s390_cpu = {
     .name = "cpu",
     .post_load = cpu_post_load,
@@ -287,6 +334,7 @@ const VMStateDescription vmstate_s390_cpu = {
         &vmstate_bpbc,
         &vmstate_etoken,
         &vmstate_diag318,
+        &vmstate_cpu_topology,
         NULL
     },
 };
-- 
2.27.0


