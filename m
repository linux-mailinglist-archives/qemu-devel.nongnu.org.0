Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD81543F462
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 03:35:01 +0200 (CEST)
Received: from localhost ([::1]:45068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgGnM-0001Mf-BV
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 21:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>) id 1mgGlo-0000hj-3l
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 21:33:24 -0400
Received: from ma1-aaemail-dr-lapp03.apple.com ([17.171.2.72]:47684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>) id 1mgGlm-0002P4-B5
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 21:33:23 -0400
Received: from pps.filterd (ma1-aaemail-dr-lapp03.apple.com [127.0.0.1])
 by ma1-aaemail-dr-lapp03.apple.com (8.16.0.42/8.16.0.42) with SMTP id
 19T1IK1u011694; Thu, 28 Oct 2021 18:33:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=20180706; bh=Rz+eAp5LAF9BlAKZtmnAw+XSsbC2MivA/ic2PUQK+24=;
 b=m/P6ua3AjQkr0QRmWdZhQW/swwTQW7MzVNwF7LSvzubFuNKar7wKTqjjchklDT+OpXuB
 Htf/bOlGcJbOckZ+IDuq5E/2hIarWww+qtdLZHvWsEpt0YZyhMQBDRhgt4nExo7EMWi4
 Q1MjgvGq1I6jW2siK4WEvt5Fia+XpHmp8v4I6JHJX8xywfnAbLMWlK4U0fNVqcUNar0X
 /mh/lksx3jF46QAP0BFQ5QHvnYJcVBrbR67LKjVa97ydAQ3PjIyEG0jKVfIsiJaql4ef
 1hBqbdoi/CfCqFPw8hN87AbtZnms9PDCretaQumj6/3DftdlLA/K4U04y5CLbwAdKWic yw== 
Received: from rn-mailsvcp-mta-lapp01.rno.apple.com
 (rn-mailsvcp-mta-lapp01.rno.apple.com [10.225.203.149])
 by ma1-aaemail-dr-lapp03.apple.com with ESMTP id 3bx4hp0m5p-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Thu, 28 Oct 2021 18:33:17 -0700
Received: from rn-mailsvcp-mmp-lapp03.rno.apple.com
 (rn-mailsvcp-mmp-lapp03.rno.apple.com [17.179.253.16])
 by rn-mailsvcp-mta-lapp01.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021)) with ESMTPS id <0R1P00RNLTNGS9F0@rn-mailsvcp-mta-lapp01.rno.apple.com>; 
 Thu, 28 Oct 2021 18:33:16 -0700 (PDT)
Received: from process_milters-daemon.rn-mailsvcp-mmp-lapp03.rno.apple.com by
 rn-mailsvcp-mmp-lapp03.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021)) id <0R1P00E00TI23500@rn-mailsvcp-mmp-lapp03.rno.apple.com>; Thu,
 28 Oct 2021 18:33:16 -0700 (PDT)
X-Va-A: 
X-Va-T-CD: 51115aee971724d6ddf329fb28aa7ad5
X-Va-E-CD: 63538ac241ea19d3da28a3168c892150
X-Va-R-CD: 009c9c705aceca092cf2ec7782c5bb67
X-Va-CD: 0
X-Va-ID: 3a1bacbd-3941-41e0-96d3-570b807f7a4b
X-V-A: 
X-V-T-CD: 51115aee971724d6ddf329fb28aa7ad5
X-V-E-CD: 63538ac241ea19d3da28a3168c892150
X-V-R-CD: 009c9c705aceca092cf2ec7782c5bb67
X-V-CD: 0
X-V-ID: 1879eda1-db9f-422e-8d7f-f4554d2acd55
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.790
 definitions=2021-10-28_06:2021-10-26,
 2021-10-28 signatures=0
Received: from Camerons-MBP.attlocal.net (unknown [17.11.119.166])
 by rn-mailsvcp-mmp-lapp03.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021))
 with ESMTPSA id <0R1P00ZNZTNFBQ00@rn-mailsvcp-mmp-lapp03.rno.apple.com>; Thu,
 28 Oct 2021 18:33:16 -0700 (PDT)
From: Cameron Esfahani <dirty@apple.com>
To: qemu-devel@nongnu.org
Cc: r.bolshakov@yadro.com
Subject: [PATCH] hvf: Use standard CR0 and CR4 register definitions
Date: Thu, 28 Oct 2021 18:33:15 -0700
Message-id: <20211029013315.79207-1-dirty@apple.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-version: 1.0
Content-transfer-encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.790
 definitions=2021-10-28_06:2021-10-26,
 2021-10-28 signatures=0
Received-SPF: pass client-ip=17.171.2.72; envelope-from=dirty@apple.com;
 helo=ma1-aaemail-dr-lapp03.apple.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No need to have our own definitions of these registers.

Signed-off-by: Cameron Esfahani <dirty@apple.com>
---
 target/i386/hvf/vmx.h      | 17 +++++++++--------
 target/i386/hvf/x86.c      |  6 +++---
 target/i386/hvf/x86.h      | 34 ----------------------------------
 target/i386/hvf/x86_mmu.c  |  2 +-
 target/i386/hvf/x86_task.c |  3 ++-
 5 files changed, 15 insertions(+), 47 deletions(-)

diff --git a/target/i386/hvf/vmx.h b/target/i386/hvf/vmx.h
index 6df87116f6..29b7deed3c 100644
--- a/target/i386/hvf/vmx.h
+++ b/target/i386/hvf/vmx.h
@@ -124,10 +124,11 @@ static inline void macvm_set_cr0(hv_vcpuid_t vcpu, uint64_t cr0)
     uint64_t efer = rvmcs(vcpu, VMCS_GUEST_IA32_EFER);
     uint64_t old_cr0 = rvmcs(vcpu, VMCS_GUEST_CR0);
     uint64_t changed_cr0 = old_cr0 ^ cr0;
-    uint64_t mask = CR0_PG | CR0_CD | CR0_NW | CR0_NE | CR0_ET;
+    uint64_t mask = CR0_PG_MASK | CR0_CD_MASK | CR0_NW_MASK |
+                    CR0_NE_MASK | CR0_ET_MASK;
     uint64_t entry_ctls;
 
-    if ((cr0 & CR0_PG) && (rvmcs(vcpu, VMCS_GUEST_CR4) & CR4_PAE) &&
+    if ((cr0 & CR0_PG_MASK) && (rvmcs(vcpu, VMCS_GUEST_CR4) & CR4_PAE_MASK) &&
         !(efer & MSR_EFER_LME)) {
         address_space_read(&address_space_memory,
                            rvmcs(vcpu, VMCS_GUEST_CR3) & ~0x1f,
@@ -142,8 +143,8 @@ static inline void macvm_set_cr0(hv_vcpuid_t vcpu, uint64_t cr0)
     wvmcs(vcpu, VMCS_CR0_SHADOW, cr0);
 
     if (efer & MSR_EFER_LME) {
-        if (changed_cr0 & CR0_PG) {
-            if (cr0 & CR0_PG) {
+        if (changed_cr0 & CR0_PG_MASK) {
+            if (cr0 & CR0_PG_MASK) {
                 enter_long_mode(vcpu, cr0, efer);
             } else {
                 exit_long_mode(vcpu, cr0, efer);
@@ -155,8 +156,8 @@ static inline void macvm_set_cr0(hv_vcpuid_t vcpu, uint64_t cr0)
     }
 
     /* Filter new CR0 after we are finished examining it above. */
-    cr0 = (cr0 & ~(mask & ~CR0_PG));
-    wvmcs(vcpu, VMCS_GUEST_CR0, cr0 | CR0_NE | CR0_ET);
+    cr0 = (cr0 & ~(mask & ~CR0_PG_MASK));
+    wvmcs(vcpu, VMCS_GUEST_CR0, cr0 | CR0_NE_MASK | CR0_ET_MASK);
 
     hv_vcpu_invalidate_tlb(vcpu);
     hv_vcpu_flush(vcpu);
@@ -164,11 +165,11 @@ static inline void macvm_set_cr0(hv_vcpuid_t vcpu, uint64_t cr0)
 
 static inline void macvm_set_cr4(hv_vcpuid_t vcpu, uint64_t cr4)
 {
-    uint64_t guest_cr4 = cr4 | CR4_VMXE;
+    uint64_t guest_cr4 = cr4 | CR4_VMXE_MASK;
 
     wvmcs(vcpu, VMCS_GUEST_CR4, guest_cr4);
     wvmcs(vcpu, VMCS_CR4_SHADOW, cr4);
-    wvmcs(vcpu, VMCS_CR4_MASK, CR4_VMXE);
+    wvmcs(vcpu, VMCS_CR4_MASK, CR4_VMXE_MASK);
 
     hv_vcpu_invalidate_tlb(vcpu);
     hv_vcpu_flush(vcpu);
diff --git a/target/i386/hvf/x86.c b/target/i386/hvf/x86.c
index 2898bb70a8..91a3fe002c 100644
--- a/target/i386/hvf/x86.c
+++ b/target/i386/hvf/x86.c
@@ -119,7 +119,7 @@ bool x86_read_call_gate(struct CPUState *cpu, struct x86_call_gate *idt_desc,
 bool x86_is_protected(struct CPUState *cpu)
 {
     uint64_t cr0 = rvmcs(cpu->hvf->fd, VMCS_GUEST_CR0);
-    return cr0 & CR0_PE;
+    return cr0 & CR0_PE_MASK;
 }
 
 bool x86_is_real(struct CPUState *cpu)
@@ -150,13 +150,13 @@ bool x86_is_long64_mode(struct CPUState *cpu)
 bool x86_is_paging_mode(struct CPUState *cpu)
 {
     uint64_t cr0 = rvmcs(cpu->hvf->fd, VMCS_GUEST_CR0);
-    return cr0 & CR0_PG;
+    return cr0 & CR0_PG_MASK;
 }
 
 bool x86_is_pae_enabled(struct CPUState *cpu)
 {
     uint64_t cr4 = rvmcs(cpu->hvf->fd, VMCS_GUEST_CR4);
-    return cr4 & CR4_PAE;
+    return cr4 & CR4_PAE_MASK;
 }
 
 target_ulong linear_addr(struct CPUState *cpu, target_ulong addr, X86Seg seg)
diff --git a/target/i386/hvf/x86.h b/target/i386/hvf/x86.h
index 782664c2ea..947b98da41 100644
--- a/target/i386/hvf/x86.h
+++ b/target/i386/hvf/x86.h
@@ -42,40 +42,6 @@ typedef struct x86_register {
     };
 } __attribute__ ((__packed__)) x86_register;
 
-typedef enum x86_reg_cr0 {
-    CR0_PE =            (1L << 0),
-    CR0_MP =            (1L << 1),
-    CR0_EM =            (1L << 2),
-    CR0_TS =            (1L << 3),
-    CR0_ET =            (1L << 4),
-    CR0_NE =            (1L << 5),
-    CR0_WP =            (1L << 16),
-    CR0_AM =            (1L << 18),
-    CR0_NW =            (1L << 29),
-    CR0_CD =            (1L << 30),
-    CR0_PG =            (1L << 31),
-} x86_reg_cr0;
-
-typedef enum x86_reg_cr4 {
-    CR4_VME =            (1L << 0),
-    CR4_PVI =            (1L << 1),
-    CR4_TSD =            (1L << 2),
-    CR4_DE  =            (1L << 3),
-    CR4_PSE =            (1L << 4),
-    CR4_PAE =            (1L << 5),
-    CR4_MSE =            (1L << 6),
-    CR4_PGE =            (1L << 7),
-    CR4_PCE =            (1L << 8),
-    CR4_OSFXSR =         (1L << 9),
-    CR4_OSXMMEXCPT =     (1L << 10),
-    CR4_VMXE =           (1L << 13),
-    CR4_SMXE =           (1L << 14),
-    CR4_FSGSBASE =       (1L << 16),
-    CR4_PCIDE =          (1L << 17),
-    CR4_OSXSAVE =        (1L << 18),
-    CR4_SMEP =           (1L << 20),
-} x86_reg_cr4;
-
 /* 16 bit Task State Segment */
 typedef struct x86_tss_segment16 {
     uint16_t link;
diff --git a/target/i386/hvf/x86_mmu.c b/target/i386/hvf/x86_mmu.c
index e9ed0f5aa1..df0b91cd42 100644
--- a/target/i386/hvf/x86_mmu.c
+++ b/target/i386/hvf/x86_mmu.c
@@ -129,7 +129,7 @@ static bool test_pt_entry(struct CPUState *cpu, struct gpt_translation *pt,
 
     uint32_t cr0 = rvmcs(cpu->hvf->fd, VMCS_GUEST_CR0);
     /* check protection */
-    if (cr0 & CR0_WP) {
+    if (cr0 & CR0_WP_MASK) {
         if (pt->write_access && !pte_write_access(pte)) {
             return false;
         }
diff --git a/target/i386/hvf/x86_task.c b/target/i386/hvf/x86_task.c
index 422156128b..e1301599e9 100644
--- a/target/i386/hvf/x86_task.c
+++ b/target/i386/hvf/x86_task.c
@@ -174,7 +174,8 @@ void vmx_handle_task_switch(CPUState *cpu, x68_segment_selector tss_sel, int rea
         //ret = task_switch_16(cpu, tss_sel, old_tss_sel, old_tss_base, &next_tss_desc);
         VM_PANIC("task_switch_16");
 
-    macvm_set_cr0(cpu->hvf->fd, rvmcs(cpu->hvf->fd, VMCS_GUEST_CR0) | CR0_TS);
+    macvm_set_cr0(cpu->hvf->fd, rvmcs(cpu->hvf->fd, VMCS_GUEST_CR0) |
+                                CR0_TS_MASK);
     x86_segment_descriptor_to_vmx(cpu, tss_sel, &next_tss_desc, &vmx_seg);
     vmx_write_segment_descriptor(cpu, &vmx_seg, R_TR);
 
-- 
2.30.1 (Apple Git-130)


