Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E363BD03E
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 13:32:58 +0200 (CEST)
Received: from localhost ([::1]:50880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0jJx-000233-NM
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 07:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bharata@linux.ibm.com>)
 id 1m0jCM-0005WR-2i; Tue, 06 Jul 2021 07:25:06 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bharata@linux.ibm.com>)
 id 1m0jCE-0001BC-UG; Tue, 06 Jul 2021 07:25:05 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166B3tN2158147; Tue, 6 Jul 2021 07:24:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=EFpTeWZd3Swt2Pc9CFe/LlCzJL04Gi2mRwe1D9iA7RA=;
 b=KwyZcN8ToLRjPPybymHUtQVV1f10A8jbxzKQLwifOosM0eokSXAkAR6qA6PIOilnNC14
 NfKPZojatp7WeHbYqV8IYb0+nJnGtrlm+xM8+oMkGlfX71MJkSTOoZNEsYeFRXrSR7y8
 3I8LwdTQV58GX/hpYMWwLzAm8uV912IlWfE58G2Uy5MKxdLlwH2hpJVrxrMSJHGJZXiD
 rf/gXesib9k83ucGevCXgcY4GjWGqH+0ZObIpgIkPudJUNugTPJXRXocnM06kpVhM921
 2p5JLcoP1hNJT/VBZDfeea+7D94mF1ELp3KRnd7Gy9wJ12U1kAEob2uh+eocgRM6gwkd lA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39mkg04wnx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Jul 2021 07:24:53 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 166BHAWV017718;
 Tue, 6 Jul 2021 11:24:51 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 39jfh88net-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Jul 2021 11:24:50 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 166BOm5127394532
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Jul 2021 11:24:48 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3BF7042047;
 Tue,  6 Jul 2021 11:24:48 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5538542042;
 Tue,  6 Jul 2021 11:24:47 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.199.34.138])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  6 Jul 2021 11:24:47 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/2] target/ppc: Support for H_RPT_INVALIDATE hcall
Date: Tue,  6 Jul 2021 16:54:40 +0530
Message-Id: <20210706112440.1449562-3-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706112440.1449562-1-bharata@linux.ibm.com>
References: <20210706112440.1449562-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Afo4Z9yeYdXMEt1se99cZJmrMNPKQMrL
X-Proofpoint-ORIG-GUID: Afo4Z9yeYdXMEt1se99cZJmrMNPKQMrL
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-06_06:2021-07-02,
 2021-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=514 mlxscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107060054
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
Cc: Bharata B Rao <bharata@linux.ibm.com>, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If KVM_CAP_RPT_INVALIDATE KVM capability is enabled, then

- indicate the availability of H_RPT_INVALIDATE hcall to the guest via
  ibm,hypertas-functions property.
- Enable the hcall

Both the above are done only if the new sPAPR machine capability
cap-rpt-invalidate is set.

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
 hw/ppc/spapr.c         |  6 ++++++
 hw/ppc/spapr_caps.c    | 41 +++++++++++++++++++++++++++++++++++++++++
 include/hw/ppc/spapr.h |  8 ++++++--
 target/ppc/kvm.c       | 12 ++++++++++++
 target/ppc/kvm_ppc.h   | 12 ++++++++++++
 5 files changed, 77 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 4dd90b75cc..2b96b03673 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -880,6 +880,10 @@ static void spapr_dt_rtas(SpaprMachineState *spapr, void *fdt)
     add_str(hypertas, "hcall-copy");
     add_str(hypertas, "hcall-debug");
     add_str(hypertas, "hcall-vphn");
+    if (spapr_get_cap(spapr, SPAPR_CAP_RPT_INVALIDATE) == SPAPR_CAP_ON) {
+        add_str(hypertas, "hcall-rpt-invalidate");
+    }
+
     add_str(qemu_hypertas, "hcall-memop1");
 
     if (!kvm_enabled() || kvmppc_spapr_use_multitce()) {
@@ -2018,6 +2022,7 @@ static const VMStateDescription vmstate_spapr = {
         &vmstate_spapr_cap_ccf_assist,
         &vmstate_spapr_cap_fwnmi,
         &vmstate_spapr_fwnmi,
+        &vmstate_spapr_cap_rpt_invalidate,
         NULL
     }
 };
@@ -4573,6 +4578,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
     smc->default_caps.caps[SPAPR_CAP_LARGE_DECREMENTER] = SPAPR_CAP_ON;
     smc->default_caps.caps[SPAPR_CAP_CCF_ASSIST] = SPAPR_CAP_ON;
     smc->default_caps.caps[SPAPR_CAP_FWNMI] = SPAPR_CAP_ON;
+    smc->default_caps.caps[SPAPR_CAP_RPT_INVALIDATE] = SPAPR_CAP_OFF;
     spapr_caps_add_properties(smc);
     smc->irq = &spapr_irq_dual;
     smc->dr_phb_enabled = true;
diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
index d0c419b392..ed7c077a0d 100644
--- a/hw/ppc/spapr_caps.c
+++ b/hw/ppc/spapr_caps.c
@@ -582,6 +582,37 @@ static void cap_fwnmi_apply(SpaprMachineState *spapr, uint8_t val,
     }
 }
 
+static void cap_rpt_invalidate_apply(SpaprMachineState *spapr,
+                                     uint8_t val, Error **errp)
+{
+    ERRP_GUARD();
+
+    if (!val) {
+        /* capability disabled by default */
+        return;
+    }
+
+    if (tcg_enabled()) {
+        error_setg(errp, "No H_RPT_INVALIDATE support in TCG");
+        error_append_hint(errp,
+                          "Try appending -machine cap-rpt-invalidate=off\n");
+    } else if (kvm_enabled()) {
+        if (!kvmppc_has_cap_mmu_radix()) {
+            error_setg(errp, "H_RPT_INVALIDATE only supported on Radix");
+            return;
+        }
+
+        if (!kvmppc_has_cap_rpt_invalidate()) {
+            error_setg(errp,
+                       "KVM implementation does not support H_RPT_INVALIDATE");
+            error_append_hint(errp,
+                              "Try appending -machine cap-rpt-invalidate=off\n");
+        } else {
+            kvmppc_enable_h_rpt_invalidate();
+        }
+    }
+}
+
 SpaprCapabilityInfo capability_table[SPAPR_CAP_NUM] = {
     [SPAPR_CAP_HTM] = {
         .name = "htm",
@@ -690,6 +721,15 @@ SpaprCapabilityInfo capability_table[SPAPR_CAP_NUM] = {
         .type = "bool",
         .apply = cap_fwnmi_apply,
     },
+    [SPAPR_CAP_RPT_INVALIDATE] = {
+        .name = "rpt-invalidate",
+        .description = "Allow H_RPT_INVALIDATE",
+        .index = SPAPR_CAP_RPT_INVALIDATE,
+        .get = spapr_cap_get_bool,
+        .set = spapr_cap_set_bool,
+        .type = "bool",
+        .apply = cap_rpt_invalidate_apply,
+    },
 };
 
 static SpaprCapabilities default_caps_with_cpu(SpaprMachineState *spapr,
@@ -830,6 +870,7 @@ SPAPR_CAP_MIG_STATE(nested_kvm_hv, SPAPR_CAP_NESTED_KVM_HV);
 SPAPR_CAP_MIG_STATE(large_decr, SPAPR_CAP_LARGE_DECREMENTER);
 SPAPR_CAP_MIG_STATE(ccf_assist, SPAPR_CAP_CCF_ASSIST);
 SPAPR_CAP_MIG_STATE(fwnmi, SPAPR_CAP_FWNMI);
+SPAPR_CAP_MIG_STATE(rpt_invalidate, SPAPR_CAP_RPT_INVALIDATE);
 
 void spapr_caps_init(SpaprMachineState *spapr)
 {
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index f05219f75e..b18d407c1a 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -74,8 +74,10 @@ typedef enum {
 #define SPAPR_CAP_CCF_ASSIST            0x09
 /* Implements PAPR FWNMI option */
 #define SPAPR_CAP_FWNMI                 0x0A
+/* Support H_RPT_INVALIDATE */
+#define SPAPR_CAP_RPT_INVALIDATE        0x0B
 /* Num Caps */
-#define SPAPR_CAP_NUM                   (SPAPR_CAP_FWNMI + 1)
+#define SPAPR_CAP_NUM                   (SPAPR_CAP_RPT_INVALIDATE + 1)
 
 /*
  * Capability Values
@@ -542,8 +544,9 @@ struct SpaprMachineState {
 #define H_SCM_UNBIND_MEM        0x3F0
 #define H_SCM_UNBIND_ALL        0x3FC
 #define H_SCM_HEALTH            0x400
+#define H_RPT_INVALIDATE        0x448
 
-#define MAX_HCALL_OPCODE        H_SCM_HEALTH
+#define MAX_HCALL_OPCODE        H_RPT_INVALIDATE
 
 /* The hcalls above are standardized in PAPR and implemented by pHyp
  * as well.
@@ -932,6 +935,7 @@ extern const VMStateDescription vmstate_spapr_cap_nested_kvm_hv;
 extern const VMStateDescription vmstate_spapr_cap_large_decr;
 extern const VMStateDescription vmstate_spapr_cap_ccf_assist;
 extern const VMStateDescription vmstate_spapr_cap_fwnmi;
+extern const VMStateDescription vmstate_spapr_cap_rpt_invalidate;
 
 static inline uint8_t spapr_get_cap(SpaprMachineState *spapr, int cap)
 {
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 104a308abb..dc93b99189 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -89,6 +89,7 @@ static int cap_ppc_count_cache_flush_assist;
 static int cap_ppc_nested_kvm_hv;
 static int cap_large_decr;
 static int cap_fwnmi;
+static int cap_rpt_invalidate;
 
 static uint32_t debug_inst_opcode;
 
@@ -152,6 +153,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         exit(1);
     }
 
+    cap_rpt_invalidate = kvm_vm_check_extension(s, KVM_CAP_PPC_RPT_INVALIDATE);
     kvm_ppc_register_host_cpu_type();
 
     return 0;
@@ -2040,6 +2042,11 @@ void kvmppc_enable_h_page_init(void)
     kvmppc_enable_hcall(kvm_state, H_PAGE_INIT);
 }
 
+void kvmppc_enable_h_rpt_invalidate(void)
+{
+    kvmppc_enable_hcall(kvm_state, H_RPT_INVALIDATE);
+}
+
 void kvmppc_set_papr(PowerPCCPU *cpu)
 {
     CPUState *cs = CPU(cpu);
@@ -2551,6 +2558,11 @@ int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable)
     return 0;
 }
 
+int kvmppc_has_cap_rpt_invalidate(void)
+{
+    return cap_rpt_invalidate;
+}
+
 PowerPCCPUClass *kvm_ppc_get_host_cpu_class(void)
 {
     uint32_t host_pvr = mfpvr();
diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
index 989f61ace0..ee9325bf9a 100644
--- a/target/ppc/kvm_ppc.h
+++ b/target/ppc/kvm_ppc.h
@@ -24,6 +24,7 @@ void kvmppc_enable_logical_ci_hcalls(void);
 void kvmppc_enable_set_mode_hcall(void);
 void kvmppc_enable_clear_ref_mod_hcalls(void);
 void kvmppc_enable_h_page_init(void);
+void kvmppc_enable_h_rpt_invalidate(void);
 void kvmppc_set_papr(PowerPCCPU *cpu);
 int kvmppc_set_compat(PowerPCCPU *cpu, uint32_t compat_pvr);
 void kvmppc_set_mpic_proxy(PowerPCCPU *cpu, int mpic_proxy);
@@ -71,6 +72,7 @@ bool kvmppc_has_cap_nested_kvm_hv(void);
 int kvmppc_set_cap_nested_kvm_hv(int enable);
 int kvmppc_get_cap_large_decr(void);
 int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable);
+int kvmppc_has_cap_rpt_invalidate(void);
 int kvmppc_enable_hwrng(void);
 int kvmppc_put_books_sregs(PowerPCCPU *cpu);
 PowerPCCPUClass *kvm_ppc_get_host_cpu_class(void);
@@ -150,6 +152,11 @@ static inline void kvmppc_enable_h_page_init(void)
 {
 }
 
+static inline void kvmppc_enable_h_rpt_invalidate(void)
+{
+    g_assert_not_reached();
+}
+
 static inline void kvmppc_set_papr(PowerPCCPU *cpu)
 {
 }
@@ -381,6 +388,11 @@ static inline int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable)
     return -1;
 }
 
+static inline int kvmppc_has_cap_rpt_invalidate(void)
+{
+    return false;
+}
+
 static inline int kvmppc_enable_hwrng(void)
 {
     return -1;
-- 
2.31.1


