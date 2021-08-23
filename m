Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAAE3F4C41
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 16:20:59 +0200 (CEST)
Received: from localhost ([::1]:52154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIAot-0006Zk-0N
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 10:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mIAl1-0006kB-Ot
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 10:16:59 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:29526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mIAky-0000vC-82
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 10:16:59 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17NE43Uh038923; Mon, 23 Aug 2021 10:16:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=o7ArqVFIJaqWyG1hnlql/TDzqNvAqFGSabuNt3jUimo=;
 b=ZUlWBfHnTngn1z0jGrqH4+XEvKRBQ/pDyAg6UeZM/WDlYAVGMritJ5KRruBvnYwp/J5K
 2p+fuP/2LAuKpjQa9rNThQVts99UGg3HWU5oAtC1UQtmJWx6dWSR7fKxGg3+25UgRY3w
 BvdlMyh2fJUeCsuc4TOFFbDt8zDeOTn7y9FIR8d8HXAupkuyF1P+c8ZCqcLygpM47Zxi
 RTivXiIiH810DzBj8IkWTGUHFJhjWKwJBT2yMr4Aa+R3LjGTEMAWfmT3rwzJR7a7KrUw
 dOqvNbzufYmqFfIr4pYvEqNfxLDGkrKx8omD0KlgQoaLwplShvqt5cZBmOYJmvd9pa8i Fw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3amb23cqe0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 10:16:51 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17NE4Owh041046;
 Mon, 23 Aug 2021 10:16:51 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3amb23cqdk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 10:16:51 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17NEDEPi004324;
 Mon, 23 Aug 2021 14:16:50 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03dal.us.ibm.com with ESMTP id 3ajs4bkpsk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 14:16:50 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17NEGmDd32112896
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Aug 2021 14:16:48 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AFF8111206D;
 Mon, 23 Aug 2021 14:16:48 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 773DA112065;
 Mon, 23 Aug 2021 14:16:48 +0000 (GMT)
Received: from amdrome1.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 23 Aug 2021 14:16:48 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 08/12] migration: Allow resetting the mirror vcpu to
 the MH entry point
Date: Mon, 23 Aug 2021 10:16:32 -0400
Message-Id: <20210823141636.65975-9-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210823141636.65975-1-dovmurik@linux.ibm.com>
References: <20210823141636.65975-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KLGBT5ldUhEL0BR4xrQz8qKGBhV2mrsc
X-Proofpoint-ORIG-GUID: bWCoUe1krCpRm0x9ZAQil9B2J2xTY1hU
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-23_03:2021-08-23,
 2021-08-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108230098
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Steve Rutherford <srutherford@google.com>,
 James Bottomley <jejb@linux.ibm.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a function to reset the mirror vcpu so it'll start directly at the
entry point of the migration handler.

Note: In the patch below the GDT and EIP values are hard-coded to fit
the OVMF migration handler entry point implementation we currently have.
These values can be exposed in the OVMF GUID table and can be discovered
from there instead of being hard-coded here.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
---
 migration/confidential-ram.h |   2 +
 migration/confidential-ram.c | 112 +++++++++++++++++++++++++++++++++++
 2 files changed, 114 insertions(+)

diff --git a/migration/confidential-ram.h b/migration/confidential-ram.h
index 9a1027bdaf..af046f95cc 100644
--- a/migration/confidential-ram.h
+++ b/migration/confidential-ram.h
@@ -18,4 +18,6 @@ int cgs_mh_save_encrypted_page(QEMUFile *f, ram_addr_t src_gpa, uint32_t size,
 
 int cgs_mh_load_encrypted_page(QEMUFile *f, ram_addr_t dest_gpa);
 
+void cgs_mh_reset_mirror_vcpu(CPUState *s);
+
 #endif
diff --git a/migration/confidential-ram.c b/migration/confidential-ram.c
index 30002448b9..6e41cba878 100644
--- a/migration/confidential-ram.c
+++ b/migration/confidential-ram.c
@@ -8,6 +8,8 @@
 #include "io/channel.h"
 #include "qapi/error.h"
 #include "exec/memory.h"
+#include "sysemu/kvm.h"
+#include "kvm/kvm_i386.h"
 #include "trace.h"
 #include "confidential-ram.h"
 
@@ -225,3 +227,113 @@ int cgs_mh_load_encrypted_page(QEMUFile *f, ram_addr_t dest_gpa)
     }
     return ret;
 }
+
+void cgs_mh_reset_mirror_vcpu(CPUState *s)
+{
+    X86CPU *cpu = X86_CPU(s);
+    CPUX86State *env = &cpu->env;
+    uint64_t xcr0;
+    int i;
+
+    memset(env, 0, offsetof(CPUX86State, end_reset_fields));
+
+    env->old_exception = -1;
+
+    /* init to reset state */
+
+    env->hflags2 |= HF2_GIF_MASK;
+    env->hflags &= ~HF_GUEST_MASK;
+    env->hflags |= HF_CS32_MASK | HF_SS32_MASK | HF_PE_MASK | HF_MP_MASK;
+
+    cpu_x86_update_cr0(env, 0x00010033);
+    env->a20_mask = ~0x0;
+    env->smbase = 0x30000;
+    env->msr_smi_count = 0;
+
+    /* The GDT is hard-coded to the one setup by OVMF */
+    env->gdt.base = 0x823600;
+    env->gdt.limit = 0x0047;
+    env->ldt.limit = 0xffff;
+    env->ldt.flags = DESC_P_MASK | (2 << DESC_TYPE_SHIFT);
+    env->tr.limit = 0xffff;
+    env->tr.flags = DESC_P_MASK | (11 << DESC_TYPE_SHIFT);
+
+    cpu_x86_load_seg_cache(env, R_CS, 0x38, 0, 0xffffffff,
+                           DESC_B_MASK | DESC_P_MASK | DESC_S_MASK |
+                           DESC_CS_MASK | DESC_R_MASK | DESC_A_MASK);
+    cpu_x86_load_seg_cache(env, R_DS, 0x30, 0, 0xffffffff,
+                           DESC_B_MASK | DESC_P_MASK | DESC_S_MASK |
+                           DESC_W_MASK | DESC_A_MASK);
+    cpu_x86_load_seg_cache(env, R_ES, 0x30, 0, 0xffffffff,
+                           DESC_B_MASK | DESC_P_MASK | DESC_S_MASK |
+                           DESC_W_MASK | DESC_A_MASK);
+    cpu_x86_load_seg_cache(env, R_SS, 0x30, 0, 0xffffffff,
+                           DESC_B_MASK | DESC_P_MASK | DESC_S_MASK |
+                           DESC_W_MASK | DESC_A_MASK);
+    cpu_x86_load_seg_cache(env, R_FS, 0x30, 0, 0xffffffff,
+                           DESC_B_MASK | DESC_P_MASK | DESC_S_MASK |
+                           DESC_W_MASK | DESC_A_MASK);
+    cpu_x86_load_seg_cache(env, R_GS, 0x30, 0, 0xffffffff,
+                           DESC_B_MASK | DESC_P_MASK | DESC_S_MASK |
+                           DESC_W_MASK | DESC_A_MASK);
+
+    /* The EIP is hard-coded to the OVMF migration handler entry point */
+    env->eip = 0x823000;
+    /* env->regs[R_EDX] = env->cpuid_version; */
+
+    env->eflags = 0x2;
+
+    /* FPU init */
+    for (i = 0; i < 8; i++) {
+        env->fptags[i] = 1;
+    }
+    cpu_set_fpuc(env, 0x37f);
+
+    env->mxcsr = 0x1f80;
+    /* All units are in INIT state.  */
+    env->xstate_bv = 0;
+
+    env->pat = 0x0007040600070406ULL;
+    env->msr_ia32_misc_enable = MSR_IA32_MISC_ENABLE_DEFAULT;
+    if (env->features[FEAT_1_ECX] & CPUID_EXT_MONITOR) {
+        env->msr_ia32_misc_enable |= MSR_IA32_MISC_ENABLE_MWAIT;
+    }
+
+    memset(env->dr, 0, sizeof(env->dr));
+    env->dr[6] = DR6_FIXED_1;
+    env->dr[7] = DR7_FIXED_1;
+    cpu_breakpoint_remove_all(s, BP_CPU);
+    cpu_watchpoint_remove_all(s, BP_CPU);
+
+    xcr0 = XSTATE_FP_MASK;
+    env->xcr0 = xcr0;
+    cpu_x86_update_cr4(env, 0x00000668);
+
+    /*
+     * SDM 11.11.5 requires:
+     *  - IA32_MTRR_DEF_TYPE MSR.E = 0
+     *  - IA32_MTRR_PHYSMASKn.V = 0
+     * All other bits are undefined.  For simplification, zero it all.
+     */
+    env->mtrr_deftype = 0;
+    memset(env->mtrr_var, 0, sizeof(env->mtrr_var));
+    memset(env->mtrr_fixed, 0, sizeof(env->mtrr_fixed));
+
+    env->interrupt_injected = -1;
+    env->exception_nr = -1;
+    env->exception_pending = 0;
+    env->exception_injected = 0;
+    env->exception_has_payload = false;
+    env->exception_payload = 0;
+    env->nmi_injected = false;
+#if !defined(CONFIG_USER_ONLY)
+    /* We hard-wire the BSP to the first CPU. */
+    apic_designate_bsp(cpu->apic_state, s->cpu_index == 0);
+
+    s->halted = !cpu_is_bsp(cpu);
+
+    if (kvm_enabled()) {
+        kvm_arch_reset_vcpu(cpu);
+    }
+#endif
+}
-- 
2.20.1


