Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754F31FFE2A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 00:29:44 +0200 (CEST)
Received: from localhost ([::1]:34082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jm32V-0006wn-J8
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 18:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1jm31F-0006Ae-20; Thu, 18 Jun 2020 18:28:25 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:63530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1jm31C-0007dJ-WB; Thu, 18 Jun 2020 18:28:24 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05IM1f72090452; Thu, 18 Jun 2020 18:28:21 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ra0w5uxw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 18:28:21 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05IMHOXu141041;
 Thu, 18 Jun 2020 18:28:21 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ra0w5uxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 18:28:21 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05IMJQKI022271;
 Thu, 18 Jun 2020 22:23:19 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 31q6bdf2p4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 22:23:19 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05IMNHrt13107600
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Jun 2020 22:23:17 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CBADAC6055;
 Thu, 18 Jun 2020 22:23:17 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4CB8C605B;
 Thu, 18 Jun 2020 22:23:16 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.159.16])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 18 Jun 2020 22:23:16 +0000 (GMT)
From: Collin Walling <walling@linux.ibm.com>
To: qemu-devel@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v3 6/8] s390/sclp: add extended-length sccb support for kvm
 guest
Date: Thu, 18 Jun 2020 18:22:56 -0400
Message-Id: <20200618222258.23287-7-walling@linux.ibm.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200618222258.23287-1-walling@linux.ibm.com>
References: <20200618222258.23287-1-walling@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-18_21:2020-06-18,
 2020-06-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 impostorscore=0 bulkscore=0 cotscore=-2147483648 lowpriorityscore=0
 mlxscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006180164
Received-SPF: pass client-ip=148.163.158.5; envelope-from=walling@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 16:57:19
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

As more features and facilities are added to the Read SCP Info (RSCPI)
response, more space is required to store them. The space used to store
these new features intrudes on the space originally used to store CPU
entries. This means as more features and facilities are added to the
RSCPI response, less space can be used to store CPU entries.

With the Extended-Length SCCB (ELS) facility, a KVM guest can execute
the RSCPI command and determine if the SCCB is large enough to store a
complete reponse. If it is not large enough, then the required length
will be set in the SCCB header.

The caller of the SCLP command is responsible for creating a
large-enough SCCB to store a complete response. Proper checking should
be in place, and the caller should execute the command once-more with
the large-enough SCCB.

This facility also enables an extended SCCB for the Read CPU Info
(RCPUI) command.

When this facility is enabled, the boundary violation response cannot
be a result from the RSCPI, RSCPI Forced, or RCPUI commands.

In order to tolerate kernels that do not yet have full support for this
feature, a "fixed" offset to the start of the CPU Entries within the
Read SCP Info struct is set to allow for the original 248 max entries
when this feature is disabled.

Additionally, this is introduced as a CPU feature to protect the guest
from migrating to a machine that does not support storing an extended
SCCB. This could otherwise hinder the VM from being able to read all
available CPU entries after migration (such as during re-ipl).

Signed-off-by: Collin Walling <walling@linux.ibm.com>
---
 hw/s390x/sclp.c                     | 21 ++++++++++++++++++++-
 include/hw/s390x/sclp.h             |  1 +
 target/s390x/cpu_features_def.inc.h |  1 +
 target/s390x/gen-features.c         |  1 +
 target/s390x/kvm.c                  |  8 ++++++++
 5 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
index 0dfbe6e5ec..f7c49e339e 100644
--- a/hw/s390x/sclp.c
+++ b/hw/s390x/sclp.c
@@ -56,6 +56,18 @@ static bool sccb_has_valid_boundary(uint64_t sccb_addr, uint32_t code,
     uint64_t sccb_boundary = (sccb_addr & PAGE_MASK) + PAGE_SIZE;
 
     switch (code & SCLP_CMD_CODE_MASK) {
+    case SCLP_CMDW_READ_SCP_INFO:
+    case SCLP_CMDW_READ_SCP_INFO_FORCED:
+    case SCLP_CMDW_READ_CPU_INFO:
+        /*
+         * An extended-length SCCB is only allowed for Read SCP/CPU Info and
+         * is allowed to exceed the 4k boundary. The respective commands will
+         * set the length field to the required length if an insufficient
+         * SCCB length is provided.
+         */
+        if (s390_has_feat(S390_FEAT_EXTENDED_LENGTH_SCCB)) {
+            return true;
+        }
     default:
         if (sccb_max_addr < sccb_boundary) {
             return true;
@@ -72,6 +84,10 @@ static bool sccb_sufficient_len(SCCB *sccb, int num_cpus, int data_len)
 
     if (be16_to_cpu(sccb->h.length) < required_len) {
         sccb->h.response_code = cpu_to_be16(SCLP_RC_INSUFFICIENT_SCCB_LENGTH);
+        if (s390_has_feat(S390_FEAT_EXTENDED_LENGTH_SCCB) &&
+            sccb->h.control_mask[2] & SCLP_VARIABLE_LENGTH_RESPONSE) {
+            sccb->h.length = required_len;
+        }
         return false;
     }
     return true;
@@ -101,7 +117,9 @@ static void prepare_cpu_entries(MachineState *ms, CPUEntry *entry, int *count)
  */
 static inline int get_read_scp_info_data_len(void)
 {
-    return offsetof(ReadInfo, entries);
+    return s390_has_feat(S390_FEAT_EXTENDED_LENGTH_SCCB) ?
+           offsetof(ReadInfo, entries) :
+           SCLP_READ_SCP_INFO_FIXED_CPU_OFFSET;
 }
 
 /* Provide information about the configuration, CPUs and storage */
@@ -116,6 +134,7 @@ static void read_SCP_info(SCLPDevice *sclp, SCCB *sccb)
     CPUEntry *entries_start = (void *)sccb + data_len;
 
     if (!sccb_sufficient_len(sccb, machine->possible_cpus->len, data_len)) {
+        warn_report("insufficient sccb size to store read scp info response");
         return;
     }
 
diff --git a/include/hw/s390x/sclp.h b/include/hw/s390x/sclp.h
index 822eff4396..ef2d63eae9 100644
--- a/include/hw/s390x/sclp.h
+++ b/include/hw/s390x/sclp.h
@@ -110,6 +110,7 @@ typedef struct CPUEntry {
     uint8_t reserved1;
 } QEMU_PACKED CPUEntry;
 
+#define SCLP_READ_SCP_INFO_FIXED_CPU_OFFSET     128
 typedef struct ReadInfo {
     SCCBHeader h;
     uint16_t rnmax;
diff --git a/target/s390x/cpu_features_def.inc.h b/target/s390x/cpu_features_def.inc.h
index 5942f81f16..1c04cc18f4 100644
--- a/target/s390x/cpu_features_def.inc.h
+++ b/target/s390x/cpu_features_def.inc.h
@@ -97,6 +97,7 @@ DEF_FEAT(GUARDED_STORAGE, "gs", STFL, 133, "Guarded-storage facility")
 DEF_FEAT(VECTOR_PACKED_DECIMAL, "vxpd", STFL, 134, "Vector packed decimal facility")
 DEF_FEAT(VECTOR_ENH, "vxeh", STFL, 135, "Vector enhancements facility")
 DEF_FEAT(MULTIPLE_EPOCH, "mepoch", STFL, 139, "Multiple-epoch facility")
+DEF_FEAT(EXTENDED_LENGTH_SCCB, "els", STFL, 140, "Extended-length SCCB facility")
 DEF_FEAT(TEST_PENDING_EXT_INTERRUPTION, "tpei", STFL, 144, "Test-pending-external-interruption facility")
 DEF_FEAT(INSERT_REFERENCE_BITS_MULT, "irbm", STFL, 145, "Insert-reference-bits-multiple facility")
 DEF_FEAT(MSA_EXT_8, "msa8-base", STFL, 146, "Message-security-assist-extension-8 facility (excluding subfunctions)")
diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index 8ddeebc544..6857f657fb 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -522,6 +522,7 @@ static uint16_t full_GEN12_GA1[] = {
     S390_FEAT_AP_QUEUE_INTERRUPT_CONTROL,
     S390_FEAT_AP_FACILITIES_TEST,
     S390_FEAT_AP,
+    S390_FEAT_EXTENDED_LENGTH_SCCB,
 };
 
 static uint16_t full_GEN12_GA2[] = {
diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
index f2f75d2a57..a2d5ad78f6 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm.c
@@ -2456,6 +2456,14 @@ void kvm_s390_get_host_cpu_model(S390CPUModel *model, Error **errp)
         KVM_S390_VM_CRYPTO_ENABLE_APIE)) {
         set_bit(S390_FEAT_AP, model->features);
     }
+
+    /*
+     * Extended-Length SCCB is handled entirely within QEMU.
+     * For PV guests this is completely fenced by the Ultravisor, as Service
+     * Call error checking and STFLE interpretation are handled via SIE.
+     */
+    set_bit(S390_FEAT_EXTENDED_LENGTH_SCCB, model->features);
+
     /* strip of features that are not part of the maximum model */
     bitmap_and(model->features, model->features, model->def->full_feat,
                S390_FEAT_MAX);
-- 
2.21.3


