Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CA2207CE5
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 22:25:34 +0200 (CEST)
Received: from localhost ([::1]:47938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joBxd-0000CH-V0
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 16:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1joBvy-0006Ms-Hd; Wed, 24 Jun 2020 16:23:50 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48224
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1joBvt-00031z-NA; Wed, 24 Jun 2020 16:23:50 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05OK1Oaw189279; Wed, 24 Jun 2020 16:23:44 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31uwyyempt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2020 16:23:44 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05OKMGvC061223;
 Wed, 24 Jun 2020 16:23:44 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31uwyyemph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2020 16:23:44 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05OKK5qs022034;
 Wed, 24 Jun 2020 20:23:43 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04wdc.us.ibm.com with ESMTP id 31uury6je2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2020 20:23:43 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05OKNhn825035130
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Jun 2020 20:23:43 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A43DAE05C;
 Wed, 24 Jun 2020 20:23:43 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB8E6AE060;
 Wed, 24 Jun 2020 20:23:42 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.198.108])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 24 Jun 2020 20:23:42 +0000 (GMT)
From: Collin Walling <walling@linux.ibm.com>
To: qemu-devel@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 8/8] s390: guest support for diagnose 0x318
Date: Wed, 24 Jun 2020 16:23:12 -0400
Message-Id: <20200624202312.28349-9-walling@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200624202312.28349-1-walling@linux.ibm.com>
References: <20200624202312.28349-1-walling@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-24_15:2020-06-24,
 2020-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 cotscore=-2147483648 mlxlogscore=999
 phishscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006240128
Received-SPF: pass client-ip=148.163.158.5; envelope-from=walling@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 16:23:44
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: thuth@redhat.com, frankja@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com, mst@redhat.com,
 svens@linux.ibm.com, pbonzini@redhat.com, mihajlov@linux.ibm.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DIAGNOSE 0x318 (diag318) is an s390 instruction that allows the storage
of diagnostic information that is collected by the firmware in the case
of hardware/firmware service events.

QEMU handles the instruction by storing the info in the CPU state. A
subsequent register sync will communicate the data to the hypervisor.

QEMU handles the migration via a VM State Description.

This feature depends on the Extended-Length SCCB (els) feature. If
els is not present, then a warning will be printed and the SCLP bit
that allows the Linux kernel to execute the instruction will not be
set.

Availability of this instruction is determined by byte 134 (aka fac134)
bit 0 of the SCLP Read Info block. This coincidentally expands into the
space used for CPU entries, which means VMs running with the diag318
capability may not be able to read information regarding all CPUs
unless the guest kernel supports an extended-length SCCB.

This feature is not supported in protected virtualization mode.

Signed-off-by: Collin Walling <walling@linux.ibm.com>
Acked-by: Janosch Frank <frankja@linux.ibm.com>
---
 hw/s390x/sclp.c                     |  5 +++++
 include/hw/s390x/sclp.h             |  3 +++
 target/s390x/cpu.h                  |  2 ++
 target/s390x/cpu_features.h         |  1 +
 target/s390x/cpu_features_def.inc.h |  3 +++
 target/s390x/cpu_models.c           |  1 +
 target/s390x/gen-features.c         |  1 +
 target/s390x/kvm.c                  | 31 +++++++++++++++++++++++++++++
 target/s390x/machine.c              | 17 ++++++++++++++++
 9 files changed, 64 insertions(+)

diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
index 2e83b4f598..03068d7380 100644
--- a/hw/s390x/sclp.c
+++ b/hw/s390x/sclp.c
@@ -150,6 +150,11 @@ static void read_SCP_info(SCLPDevice *sclp, SCCB *sccb)
     s390_get_feat_block(S390_FEAT_TYPE_SCLP_CONF_CHAR_EXT,
                          read_info->conf_char_ext);
 
+    if (s390_has_feat(S390_FEAT_EXTENDED_LENGTH_SCCB)) {
+        s390_get_feat_block(S390_FEAT_TYPE_SCLP_FAC134,
+                            &read_info->fac134);
+    }
+
     read_info->facilities = cpu_to_be64(SCLP_HAS_CPU_INFO |
                                         SCLP_HAS_IOA_RECONFIG);
 
diff --git a/include/hw/s390x/sclp.h b/include/hw/s390x/sclp.h
index ef2d63eae9..ccb9f0a676 100644
--- a/include/hw/s390x/sclp.h
+++ b/include/hw/s390x/sclp.h
@@ -133,6 +133,9 @@ typedef struct ReadInfo {
     uint16_t highest_cpu;
     uint8_t  _reserved5[124 - 122];     /* 122-123 */
     uint32_t hmfai;
+    uint8_t  _reserved7[134 - 128];     /* 128-133 */
+    uint8_t  fac134;
+    uint8_t  _reserved8[144 - 135];     /* 135-143 */
     struct CPUEntry entries[];
 } QEMU_PACKED ReadInfo;
 
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 035427521c..f875ebf0f4 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -112,6 +112,8 @@ struct CPUS390XState {
     uint16_t external_call_addr;
     DECLARE_BITMAP(emergency_signals, S390_MAX_CPUS);
 
+    uint64_t diag318_info;
+
     /* Fields up to this point are cleared by a CPU reset */
     struct {} end_reset_fields;
 
diff --git a/target/s390x/cpu_features.h b/target/s390x/cpu_features.h
index da695a8346..f74f7fc3a1 100644
--- a/target/s390x/cpu_features.h
+++ b/target/s390x/cpu_features.h
@@ -23,6 +23,7 @@ typedef enum {
     S390_FEAT_TYPE_STFL,
     S390_FEAT_TYPE_SCLP_CONF_CHAR,
     S390_FEAT_TYPE_SCLP_CONF_CHAR_EXT,
+    S390_FEAT_TYPE_SCLP_FAC134,
     S390_FEAT_TYPE_SCLP_CPU,
     S390_FEAT_TYPE_MISC,
     S390_FEAT_TYPE_PLO,
diff --git a/target/s390x/cpu_features_def.inc.h b/target/s390x/cpu_features_def.inc.h
index 1c04cc18f4..f82b4b5ec1 100644
--- a/target/s390x/cpu_features_def.inc.h
+++ b/target/s390x/cpu_features_def.inc.h
@@ -122,6 +122,9 @@ DEF_FEAT(SIE_CMMA, "cmma", SCLP_CONF_CHAR_EXT, 1, "SIE: Collaborative-memory-man
 DEF_FEAT(SIE_PFMFI, "pfmfi", SCLP_CONF_CHAR_EXT, 9, "SIE: PFMF interpretation facility")
 DEF_FEAT(SIE_IBS, "ibs", SCLP_CONF_CHAR_EXT, 10, "SIE: Interlock-and-broadcast-suppression facility")
 
+/* Features exposed via SCLP SCCB Facilities byte 134 (bit numbers relative to byte-134) */
+DEF_FEAT(DIAG_318, "diag318", SCLP_FAC134, 0, "Control program name and version codes")
+
 /* Features exposed via SCLP CPU info. */
 DEF_FEAT(SIE_F2, "sief2", SCLP_CPU, 4, "SIE: interception format 2 (Virtual SIE)")
 DEF_FEAT(SIE_SKEY, "skey", SCLP_CPU, 5, "SIE: Storage-key facility")
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 2fa609bffe..034673be54 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -827,6 +827,7 @@ static void check_consistency(const S390CPUModel *model)
         { S390_FEAT_PTFF_STOE, S390_FEAT_MULTIPLE_EPOCH },
         { S390_FEAT_PTFF_STOUE, S390_FEAT_MULTIPLE_EPOCH },
         { S390_FEAT_AP_QUEUE_INTERRUPT_CONTROL, S390_FEAT_AP },
+        { S390_FEAT_DIAG_318, S390_FEAT_EXTENDED_LENGTH_SCCB },
     };
     int i;
 
diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index 6857f657fb..a1f0a6f3c6 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -523,6 +523,7 @@ static uint16_t full_GEN12_GA1[] = {
     S390_FEAT_AP_FACILITIES_TEST,
     S390_FEAT_AP,
     S390_FEAT_EXTENDED_LENGTH_SCCB,
+    S390_FEAT_DIAG_318,
 };
 
 static uint16_t full_GEN12_GA2[] = {
diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
index a2d5ad78f6..b79feeba9f 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm.c
@@ -105,6 +105,7 @@
 
 #define DIAG_TIMEREVENT                 0x288
 #define DIAG_IPL                        0x308
+#define DIAG_SET_CONTROL_PROGRAM_CODES  0x318
 #define DIAG_KVM_HYPERCALL              0x500
 #define DIAG_KVM_BREAKPOINT             0x501
 
@@ -602,6 +603,11 @@ int kvm_arch_put_registers(CPUState *cs, int level)
         cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_ETOKEN;
     }
 
+    if (can_sync_regs(cs, KVM_SYNC_DIAG318)) {
+        cs->kvm_run->s.regs.diag318 = env->diag318_info;
+        cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_DIAG318;
+    }
+
     /* Finally the prefix */
     if (can_sync_regs(cs, KVM_SYNC_PREFIX)) {
         cs->kvm_run->s.regs.prefix = env->psa;
@@ -741,6 +747,10 @@ int kvm_arch_get_registers(CPUState *cs)
         }
     }
 
+    if (can_sync_regs(cs, KVM_SYNC_DIAG318)) {
+        env->diag318_info = cs->kvm_run->s.regs.diag318;
+    }
+
     return 0;
 }
 
@@ -1601,6 +1611,19 @@ static int handle_sw_breakpoint(S390CPU *cpu, struct kvm_run *run)
     return -ENOENT;
 }
 
+static void handle_diag_318(S390CPU *cpu, struct kvm_run *run)
+{
+    uint64_t reg = (run->s390_sieic.ipa & 0x00f0) >> 4;
+    uint64_t diag318_info = run->s.regs.gprs[reg];
+
+    cpu->env.diag318_info = diag318_info;
+
+    if (can_sync_regs(CPU(cpu), KVM_SYNC_DIAG318)) {
+        run->s.regs.diag318 = diag318_info;
+        run->kvm_dirty_regs |= KVM_SYNC_DIAG318;
+    }
+}
+
 #define DIAG_KVM_CODE_MASK 0x000000000000ffff
 
 static int handle_diag(S390CPU *cpu, struct kvm_run *run, uint32_t ipb)
@@ -1620,6 +1643,9 @@ static int handle_diag(S390CPU *cpu, struct kvm_run *run, uint32_t ipb)
     case DIAG_IPL:
         kvm_handle_diag_308(cpu, run);
         break;
+    case DIAG_SET_CONTROL_PROGRAM_CODES:
+        handle_diag_318(cpu, run);
+        break;
     case DIAG_KVM_HYPERCALL:
         r = handle_hypercall(cpu, run);
         break;
@@ -2464,6 +2490,11 @@ void kvm_s390_get_host_cpu_model(S390CPUModel *model, Error **errp)
      */
     set_bit(S390_FEAT_EXTENDED_LENGTH_SCCB, model->features);
 
+    /* DIAGNOSE 0x318 is not supported under protected virtualization */
+    if (!s390_is_pv() && kvm_check_extension(kvm_state, KVM_CAP_S390_DIAG318)) {
+        set_bit(S390_FEAT_DIAG_318, model->features);
+    }
+
     /* strip of features that are not part of the maximum model */
     bitmap_and(model->features, model->features, model->def->full_feat,
                S390_FEAT_MAX);
diff --git a/target/s390x/machine.c b/target/s390x/machine.c
index 549bb6c280..5b4e82f1ab 100644
--- a/target/s390x/machine.c
+++ b/target/s390x/machine.c
@@ -234,6 +234,22 @@ const VMStateDescription vmstate_etoken = {
     }
 };
 
+static bool diag318_needed(void *opaque)
+{
+    return s390_has_feat(S390_FEAT_DIAG_318);
+}
+
+const VMStateDescription vmstate_diag318 = {
+    .name = "cpu/diag318",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = diag318_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(env.diag318_info, S390CPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 const VMStateDescription vmstate_s390_cpu = {
     .name = "cpu",
     .post_load = cpu_post_load,
@@ -270,6 +286,7 @@ const VMStateDescription vmstate_s390_cpu = {
         &vmstate_gscb,
         &vmstate_bpbc,
         &vmstate_etoken,
+        &vmstate_diag318,
         NULL
     },
 };
-- 
2.26.2


