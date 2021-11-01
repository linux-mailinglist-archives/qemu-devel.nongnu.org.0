Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 026F744134D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 06:50:27 +0100 (CET)
Received: from localhost ([::1]:53134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhQDB-0000XM-Mj
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 01:50:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>) id 1mhQBZ-00088n-0o
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 01:48:45 -0400
Received: from ma1-aaemail-dr-lapp02.apple.com ([17.171.2.68]:46336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>) id 1mhQBW-0006c1-Ek
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 01:48:43 -0400
Received: from pps.filterd (ma1-aaemail-dr-lapp02.apple.com [127.0.0.1])
 by ma1-aaemail-dr-lapp02.apple.com (8.16.0.42/8.16.0.42) with SMTP id
 1A15h5Oh041294; Sun, 31 Oct 2021 22:48:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=20180706; bh=Y1zY0N6EdjdueZ40cD/nEePOEunTK39IRotn4eurTD8=;
 b=g+oNERf5XlwWU4Kf+Ye4RMV/x9Q0n/SbR5mRkdjhVOuXeSUJwmNXf+EdNx6MX5+PaKvK
 Y9W9LsZ+Sw4/MIrha4BwMWFq305vBdXFTGx8VWKuWRSDJlHfcXJFE7CyQCbV88VXsuPx
 1SNs2Pq1f/afto5tFi45eiuKikvFLn9gjRLITOklVlgpwNdgBVRdzQY7RHpJCC/aj4K/
 i/IwsZFwZWElbXyJ/euva+ToIhOa0EQAUTmqv04iFRog8/vJZDSUGBdThpqX1olUCjo3
 O3JipEywjMwGfst+P06wCPYOSTNNKM2BUtWBTIHIlaEZ9+SYywUy1TVVGPAwncvj8TC6 bg== 
Received: from rn-mailsvcp-mta-lapp04.rno.apple.com
 (rn-mailsvcp-mta-lapp04.rno.apple.com [10.225.203.152])
 by ma1-aaemail-dr-lapp02.apple.com with ESMTP id 3c12qsu1x7-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Sun, 31 Oct 2021 22:48:39 -0700
Received: from rn-mailsvcp-mmp-lapp03.rno.apple.com
 (rn-mailsvcp-mmp-lapp03.rno.apple.com [17.179.253.16])
 by rn-mailsvcp-mta-lapp04.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021)) with ESMTPS id <0R1V005LTPH1SDI0@rn-mailsvcp-mta-lapp04.rno.apple.com>; 
 Sun, 31 Oct 2021 22:48:37 -0700 (PDT)
Received: from process_milters-daemon.rn-mailsvcp-mmp-lapp03.rno.apple.com by
 rn-mailsvcp-mmp-lapp03.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021)) id <0R1V00700P0L3M00@rn-mailsvcp-mmp-lapp03.rno.apple.com>; Sun,
 31 Oct 2021 22:48:37 -0700 (PDT)
X-Va-A: 
X-Va-T-CD: 51115aee971724d6ddf329fb28aa7ad5
X-Va-E-CD: aa3997403212be042c59bdb1ae9eddc6
X-Va-R-CD: ab61f3166d360e417352057db153101c
X-Va-CD: 0
X-Va-ID: f081e66d-63de-4bef-8913-fa0bf22fd0ed
X-V-A: 
X-V-T-CD: 51115aee971724d6ddf329fb28aa7ad5
X-V-E-CD: aa3997403212be042c59bdb1ae9eddc6
X-V-R-CD: ab61f3166d360e417352057db153101c
X-V-CD: 0
X-V-ID: 16403d89-4670-45d7-a371-da4515980c87
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.790
 definitions=2021-11-01_02:2021-10-29,
 2021-11-01 signatures=0
Received: from Camerons-MBP.attlocal.net (unknown [17.11.0.117])
 by rn-mailsvcp-mmp-lapp03.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021))
 with ESMTPSA id <0R1V00C8NPH1XV00@rn-mailsvcp-mmp-lapp03.rno.apple.com>; Sun,
 31 Oct 2021 22:48:37 -0700 (PDT)
From: Cameron Esfahani <dirty@apple.com>
To: qemu-devel@nongnu.org
Cc: r.bolshakov@yadro.com
Subject: [PATCH] hvf: Enable RDTSCP support
Date: Sun, 31 Oct 2021 22:48:36 -0700
Message-id: <20211101054836.21471-1-dirty@apple.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-version: 1.0
Content-transfer-encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.790
 definitions=2021-11-01_02:2021-10-29,
 2021-11-01 signatures=0
Received-SPF: pass client-ip=17.171.2.68; envelope-from=dirty@apple.com;
 helo=ma1-aaemail-dr-lapp02.apple.com
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.736,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pass through RDPID and RDTSCP support in CPUID if host supports it.
Correctly detect if CPU_BASED_TSC_OFFSET and CPU_BASED2_RDTSCP would
be supported in primary and secondary processor-based VM-execution
controls.  Enable RDTSCP in secondary processor controls if RDTSCP
support is indicated in CPUID.

Signed-off-by: Cameron Esfahani <dirty@apple.com>
---
 target/i386/hvf/hvf.c       | 26 +++++++++++++++++---------
 target/i386/hvf/vmcs.h      |  3 ++-
 target/i386/hvf/x86_cpuid.c |  7 ++++---
 3 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 4ba6e82fab..4712fe66d4 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -221,6 +221,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 {
     X86CPU *x86cpu = X86_CPU(cpu);
     CPUX86State *env = &x86cpu->env;
+    uint64_t reqCap;
 
     init_emu();
     init_decoder();
@@ -257,19 +258,26 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     /* set VMCS control fields */
     wvmcs(cpu->hvf->fd, VMCS_PIN_BASED_CTLS,
           cap2ctrl(hvf_state->hvf_caps->vmx_cap_pinbased,
-          VMCS_PIN_BASED_CTLS_EXTINT |
-          VMCS_PIN_BASED_CTLS_NMI |
-          VMCS_PIN_BASED_CTLS_VNMI));
+                   VMCS_PIN_BASED_CTLS_EXTINT |
+                   VMCS_PIN_BASED_CTLS_NMI |
+                   VMCS_PIN_BASED_CTLS_VNMI));
     wvmcs(cpu->hvf->fd, VMCS_PRI_PROC_BASED_CTLS,
           cap2ctrl(hvf_state->hvf_caps->vmx_cap_procbased,
-          VMCS_PRI_PROC_BASED_CTLS_HLT |
-          VMCS_PRI_PROC_BASED_CTLS_MWAIT |
-          VMCS_PRI_PROC_BASED_CTLS_TSC_OFFSET |
-          VMCS_PRI_PROC_BASED_CTLS_TPR_SHADOW) |
+                   VMCS_PRI_PROC_BASED_CTLS_HLT |
+                   VMCS_PRI_PROC_BASED_CTLS_MWAIT |
+                   VMCS_PRI_PROC_BASED_CTLS_TSC_OFFSET |
+                   VMCS_PRI_PROC_BASED_CTLS_TPR_SHADOW) |
           VMCS_PRI_PROC_BASED_CTLS_SEC_CONTROL);
+
+    reqCap = VMCS_PRI_PROC_BASED2_CTLS_APIC_ACCESSES;
+
+    /* Is RDTSCP support in CPUID?  If so, enable it in the VMCS. */
+    if (hvf_get_supported_cpuid(0x80000001, 0, R_EDX) & CPUID_EXT2_RDTSCP) {
+        reqCap |= VMCS_PRI_PROC_BASED2_CTLS_RDTSCP;
+    }
+
     wvmcs(cpu->hvf->fd, VMCS_SEC_PROC_BASED_CTLS,
-          cap2ctrl(hvf_state->hvf_caps->vmx_cap_procbased2,
-                   VMCS_PRI_PROC_BASED2_CTLS_APIC_ACCESSES));
+          cap2ctrl(hvf_state->hvf_caps->vmx_cap_procbased2, reqCap));
 
     wvmcs(cpu->hvf->fd, VMCS_ENTRY_CTLS, cap2ctrl(hvf_state->hvf_caps->vmx_cap_entry,
           0));
diff --git a/target/i386/hvf/vmcs.h b/target/i386/hvf/vmcs.h
index 42de7ebc3a..bb4c764557 100644
--- a/target/i386/hvf/vmcs.h
+++ b/target/i386/hvf/vmcs.h
@@ -354,7 +354,7 @@
 #define VMCS_PRI_PROC_BASED_CTLS_TSC_OFFSET (1 << 3)
 #define VMCS_PRI_PROC_BASED_CTLS_HLT (1 << 7)
 #define VMCS_PRI_PROC_BASED_CTLS_MWAIT         (1 << 10)
-#define VMCS_PRI_PROC_BASED_CTLS_TSC           (1 << 12)
+#define VMCS_PRI_PROC_BASED_CTLS_RDTSC         (1 << 12)
 #define VMCS_PRI_PROC_BASED_CTLS_CR8_LOAD      (1 << 19)
 #define VMCS_PRI_PROC_BASED_CTLS_CR8_STORE     (1 << 20)
 #define VMCS_PRI_PROC_BASED_CTLS_TPR_SHADOW    (1 << 21)
@@ -362,6 +362,7 @@
 #define VMCS_PRI_PROC_BASED_CTLS_SEC_CONTROL   (1 << 31)
 
 #define VMCS_PRI_PROC_BASED2_CTLS_APIC_ACCESSES (1 << 0)
+#define VMCS_PRI_PROC_BASED2_CTLS_RDTSCP        (1 << 3)
 #define VMCS_PRI_PROC_BASED2_CTLS_X2APIC        (1 << 4)
 
 enum task_switch_reason {
diff --git a/target/i386/hvf/x86_cpuid.c b/target/i386/hvf/x86_cpuid.c
index 32b0d131df..b11ddaa349 100644
--- a/target/i386/hvf/x86_cpuid.c
+++ b/target/i386/hvf/x86_cpuid.c
@@ -96,7 +96,8 @@ uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
                 ebx &= ~CPUID_7_0_EBX_INVPCID;
             }
 
-            ecx &= CPUID_7_0_ECX_AVX512_VBMI | CPUID_7_0_ECX_AVX512_VPOPCNTDQ;
+            ecx &= CPUID_7_0_ECX_AVX512_VBMI | CPUID_7_0_ECX_AVX512_VPOPCNTDQ |
+                   CPUID_7_0_ECX_RDPID;
             edx &= CPUID_7_0_EDX_AVX512_4VNNIW | CPUID_7_0_EDX_AVX512_4FMAPS;
         } else {
             ebx = 0;
@@ -133,11 +134,11 @@ uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
                 CPUID_FXSR | CPUID_EXT2_FXSR | CPUID_EXT2_PDPE1GB | CPUID_EXT2_3DNOWEXT |
                 CPUID_EXT2_3DNOW | CPUID_EXT2_LM | CPUID_EXT2_RDTSCP | CPUID_EXT2_NX;
         hv_vmx_read_capability(HV_VMX_CAP_PROCBASED2, &cap);
-        if (!(cap & CPU_BASED2_RDTSCP)) {
+        if (!(cap2ctrl(cap, CPU_BASED2_RDTSCP) & CPU_BASED2_RDTSCP)) {
             edx &= ~CPUID_EXT2_RDTSCP;
         }
         hv_vmx_read_capability(HV_VMX_CAP_PROCBASED, &cap);
-        if (!(cap & CPU_BASED_TSC_OFFSET)) {
+        if (!(cap2ctrl(cap, CPU_BASED_TSC_OFFSET) & CPU_BASED_TSC_OFFSET)) {
             edx &= ~CPUID_EXT2_RDTSCP;
         }
         ecx &= CPUID_EXT3_LAHF_LM | CPUID_EXT3_CMP_LEG | CPUID_EXT3_CR8LEG |
-- 
2.30.1 (Apple Git-130)


