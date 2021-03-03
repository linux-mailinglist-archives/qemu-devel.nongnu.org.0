Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D53A32B9E4
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:33:47 +0100 (CET)
Received: from localhost ([::1]:58530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWJe-0004Bs-Ev
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:33:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWAa-0007sP-L7
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:24:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWAT-000109-Fm
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:24:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614795856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zbl5ln6j4TQbN8eSMfKjFDrfgLqqJBTprqPvaHJIAzA=;
 b=A18DFvuFsn5oSzrEsZxyoSA0CCCvuvhbVhWK1de9NkbuusTFyAwIPS8sHxj4ea8F2WTwUK
 HpOyePnJw3PGW7pp9hqLZkPgVVZZAGQGnu2vb4QnnA9K8VoCP0MV6JtyAA1sNRqhtet1P5
 YrON5JYTrL3RiB3whaXUy0Bsry67DyE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-T3vDk2cBPfGxIXNHVhsEdw-1; Wed, 03 Mar 2021 13:24:15 -0500
X-MC-Unique: T3vDk2cBPfGxIXNHVhsEdw-1
Received: by mail-wm1-f70.google.com with SMTP id a65so2180600wmh.1
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:24:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zbl5ln6j4TQbN8eSMfKjFDrfgLqqJBTprqPvaHJIAzA=;
 b=YhBeDklymBXbYypeRY+eLOFsG1M+8DXd+fZmxdjZNhaz2yAmjvvuBbn8m65cP4M+lf
 3mUxJzud0km4JGoMlFt/+l5803cVaUdCbej/cyQ7+ZN3yp9SbXdPqaqQepKfIFBUGKsY
 crNluZ36RZErl40onTya37GDPuHEnfGZDzAXfWjnYu+YcYXz7d5aMCxBqmRhL0KZ0D00
 Na+QLzskoh0jgQt0qhFCoIJdCTDFBPGReJFcIUI9N6sxtv1BnHQy4RmdIWt7SWvldLeC
 H5m/jHM+SRvNsKFYIx3q+W02V/pCPH9XDX7WQ7yHJwcevjYNeKzEBOrRZOj/HV1qpzD4
 LO+A==
X-Gm-Message-State: AOAM533lrcErumA94VbaaqFLlHF3ARxTzzNagSIqsiNpL94/JpH3d2NF
 h8Mre5uEfou8kTiXtniD/yiO2m8DMICl29d46FBY+AzWSAm8YZAeL+nfmcqPMV2oP9UKR8dDKDH
 Ccq2mc0kgdTRDVm5TdItHYelM6TmJJF2sChNyJpgH1WYYIWDIn3XPRh1DQgFV2N2C
X-Received: by 2002:a1c:df46:: with SMTP id w67mr270312wmg.176.1614795853304; 
 Wed, 03 Mar 2021 10:24:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx28e4WRX9tuACTD8hzn37Sbo31xMuLH6rW9MrGPqhW3u/fo4zuJ5oZN3ZY4y1xZWsTnmDfOg==
X-Received: by 2002:a1c:df46:: with SMTP id w67mr270263wmg.176.1614795852910; 
 Wed, 03 Mar 2021 10:24:12 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h20sm6759660wmb.1.2021.03.03.10.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:24:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 17/19] accel/hvf: Reduce deref by declaring 'hv_vcpuid_t
 hvf_fd' on stack
Date: Wed,  3 Mar 2021 19:22:17 +0100
Message-Id: <20210303182219.1631042-18-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303182219.1631042-1-philmd@redhat.com>
References: <20210303182219.1631042-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In order to make the next commits easier to review,
declare 'hvf_fd' on the stack when it is used in various
places in a function.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/hvf/hvf.c       |  95 ++++++++--------
 target/i386/hvf/x86_descr.c |  19 ++--
 target/i386/hvf/x86hvf.c    | 209 ++++++++++++++++++------------------
 3 files changed, 166 insertions(+), 157 deletions(-)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 3c5c9c8197e..effee39ee9b 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -504,6 +504,7 @@ int hvf_init_vcpu(CPUState *cpu)
 
     X86CPU *x86cpu = X86_CPU(cpu);
     CPUX86State *env = &x86cpu->env;
+    hv_vcpuid_t hvf_fd;
     int r;
 
     /* init cpu signals */
@@ -532,9 +533,10 @@ int hvf_init_vcpu(CPUState *cpu)
         }
     }
 
-    r = hv_vcpu_create((hv_vcpuid_t *)&cpu->hvf_fd, HV_VCPU_DEFAULT);
+    r = hv_vcpu_create(&hvf_fd, HV_VCPU_DEFAULT);
     cpu->vcpu_dirty = true;
     assert_hvf_ok(r);
+    cpu->hvf_fd = (int)hvf_fd
 
     if (hv_vmx_read_capability(HV_VMX_CAP_PINBASED,
         &hvf_state->hvf_caps->vmx_cap_pinbased)) {
@@ -554,43 +556,43 @@ int hvf_init_vcpu(CPUState *cpu)
     }
 
     /* set VMCS control fields */
-    wvmcs(cpu->hvf_fd, VMCS_PIN_BASED_CTLS,
+    wvmcs(hvf_fd, VMCS_PIN_BASED_CTLS,
           cap2ctrl(hvf_state->hvf_caps->vmx_cap_pinbased,
           VMCS_PIN_BASED_CTLS_EXTINT |
           VMCS_PIN_BASED_CTLS_NMI |
           VMCS_PIN_BASED_CTLS_VNMI));
-    wvmcs(cpu->hvf_fd, VMCS_PRI_PROC_BASED_CTLS,
+    wvmcs(hvf_fd, VMCS_PRI_PROC_BASED_CTLS,
           cap2ctrl(hvf_state->hvf_caps->vmx_cap_procbased,
           VMCS_PRI_PROC_BASED_CTLS_HLT |
           VMCS_PRI_PROC_BASED_CTLS_MWAIT |
           VMCS_PRI_PROC_BASED_CTLS_TSC_OFFSET |
           VMCS_PRI_PROC_BASED_CTLS_TPR_SHADOW) |
           VMCS_PRI_PROC_BASED_CTLS_SEC_CONTROL);
-    wvmcs(cpu->hvf_fd, VMCS_SEC_PROC_BASED_CTLS,
+    wvmcs(hvf_fd, VMCS_SEC_PROC_BASED_CTLS,
           cap2ctrl(hvf_state->hvf_caps->vmx_cap_procbased2,
                    VMCS_PRI_PROC_BASED2_CTLS_APIC_ACCESSES));
 
-    wvmcs(cpu->hvf_fd, VMCS_ENTRY_CTLS, cap2ctrl(hvf_state->hvf_caps->vmx_cap_entry,
+    wvmcs(hvf_fd, VMCS_ENTRY_CTLS, cap2ctrl(hvf_state->hvf_caps->vmx_cap_entry,
           0));
-    wvmcs(cpu->hvf_fd, VMCS_EXCEPTION_BITMAP, 0); /* Double fault */
+    wvmcs(hvf_fd, VMCS_EXCEPTION_BITMAP, 0); /* Double fault */
 
-    wvmcs(cpu->hvf_fd, VMCS_TPR_THRESHOLD, 0);
+    wvmcs(hvf_fd, VMCS_TPR_THRESHOLD, 0);
 
     x86cpu = X86_CPU(cpu);
     x86cpu->env.xsave_buf = qemu_memalign(4096, 4096);
 
-    hv_vcpu_enable_native_msr(cpu->hvf_fd, MSR_STAR, 1);
-    hv_vcpu_enable_native_msr(cpu->hvf_fd, MSR_LSTAR, 1);
-    hv_vcpu_enable_native_msr(cpu->hvf_fd, MSR_CSTAR, 1);
-    hv_vcpu_enable_native_msr(cpu->hvf_fd, MSR_FMASK, 1);
-    hv_vcpu_enable_native_msr(cpu->hvf_fd, MSR_FSBASE, 1);
-    hv_vcpu_enable_native_msr(cpu->hvf_fd, MSR_GSBASE, 1);
-    hv_vcpu_enable_native_msr(cpu->hvf_fd, MSR_KERNELGSBASE, 1);
-    hv_vcpu_enable_native_msr(cpu->hvf_fd, MSR_TSC_AUX, 1);
-    hv_vcpu_enable_native_msr(cpu->hvf_fd, MSR_IA32_TSC, 1);
-    hv_vcpu_enable_native_msr(cpu->hvf_fd, MSR_IA32_SYSENTER_CS, 1);
-    hv_vcpu_enable_native_msr(cpu->hvf_fd, MSR_IA32_SYSENTER_EIP, 1);
-    hv_vcpu_enable_native_msr(cpu->hvf_fd, MSR_IA32_SYSENTER_ESP, 1);
+    hv_vcpu_enable_native_msr(hvf_fd, MSR_STAR, 1);
+    hv_vcpu_enable_native_msr(hvf_fd, MSR_LSTAR, 1);
+    hv_vcpu_enable_native_msr(hvf_fd, MSR_CSTAR, 1);
+    hv_vcpu_enable_native_msr(hvf_fd, MSR_FMASK, 1);
+    hv_vcpu_enable_native_msr(hvf_fd, MSR_FSBASE, 1);
+    hv_vcpu_enable_native_msr(hvf_fd, MSR_GSBASE, 1);
+    hv_vcpu_enable_native_msr(hvf_fd, MSR_KERNELGSBASE, 1);
+    hv_vcpu_enable_native_msr(hvf_fd, MSR_TSC_AUX, 1);
+    hv_vcpu_enable_native_msr(hvf_fd, MSR_IA32_TSC, 1);
+    hv_vcpu_enable_native_msr(hvf_fd, MSR_IA32_SYSENTER_CS, 1);
+    hv_vcpu_enable_native_msr(hvf_fd, MSR_IA32_SYSENTER_EIP, 1);
+    hv_vcpu_enable_native_msr(hvf_fd, MSR_IA32_SYSENTER_ESP, 1);
 
     return 0;
 }
@@ -695,6 +697,7 @@ int hvf_vcpu_exec(CPUState *cpu)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
     CPUX86State *env = &x86_cpu->env;
+    hv_vcpuid_t hvf_fd = (hv_vcpuid_t)cpu_state->hvf_fd;
     int ret = 0;
     uint64_t rip = 0;
 
@@ -719,20 +722,20 @@ int hvf_vcpu_exec(CPUState *cpu)
             return EXCP_HLT;
         }
 
-        hv_return_t r  = hv_vcpu_run(cpu->hvf_fd);
+        hv_return_t r  = hv_vcpu_run(hvf_fd);
         assert_hvf_ok(r);
 
         /* handle VMEXIT */
-        uint64_t exit_reason = rvmcs(cpu->hvf_fd, VMCS_EXIT_REASON);
-        uint64_t exit_qual = rvmcs(cpu->hvf_fd, VMCS_EXIT_QUALIFICATION);
-        uint32_t ins_len = (uint32_t)rvmcs(cpu->hvf_fd,
+        uint64_t exit_reason = rvmcs(hvf_fd, VMCS_EXIT_REASON);
+        uint64_t exit_qual = rvmcs(hvf_fd, VMCS_EXIT_QUALIFICATION);
+        uint32_t ins_len = (uint32_t)rvmcs(hvf_fd,
                                            VMCS_EXIT_INSTRUCTION_LENGTH);
 
-        uint64_t idtvec_info = rvmcs(cpu->hvf_fd, VMCS_IDT_VECTORING_INFO);
+        uint64_t idtvec_info = rvmcs(hvf_fd, VMCS_IDT_VECTORING_INFO);
 
         hvf_store_events(cpu, ins_len, idtvec_info);
-        rip = rreg(cpu->hvf_fd, HV_X86_RIP);
-        env->eflags = rreg(cpu->hvf_fd, HV_X86_RFLAGS);
+        rip = rreg(hvf_fd, HV_X86_RIP);
+        env->eflags = rreg(hvf_fd, HV_X86_RFLAGS);
 
         qemu_mutex_lock_iothread();
 
@@ -762,7 +765,7 @@ int hvf_vcpu_exec(CPUState *cpu)
         case EXIT_REASON_EPT_FAULT:
         {
             hvf_slot *slot;
-            uint64_t gpa = rvmcs(cpu->hvf_fd, VMCS_GUEST_PHYSICAL_ADDRESS);
+            uint64_t gpa = rvmcs(hvf_fd, VMCS_GUEST_PHYSICAL_ADDRESS);
 
             if (((idtvec_info & VMCS_IDT_VEC_VALID) == 0) &&
                 ((exit_qual & EXIT_QUAL_NMIUDTI) != 0)) {
@@ -807,7 +810,7 @@ int hvf_vcpu_exec(CPUState *cpu)
                 store_regs(cpu);
                 break;
             } else if (!string && !in) {
-                RAX(env) = rreg(cpu->hvf_fd, HV_X86_RAX);
+                RAX(env) = rreg(hvf_fd, HV_X86_RAX);
                 hvf_handle_io(env, port, &RAX(env), 1, size, 1);
                 macvm_set_rip(cpu, rip + ins_len);
                 break;
@@ -823,21 +826,21 @@ int hvf_vcpu_exec(CPUState *cpu)
             break;
         }
         case EXIT_REASON_CPUID: {
-            uint32_t rax = (uint32_t)rreg(cpu->hvf_fd, HV_X86_RAX);
-            uint32_t rbx = (uint32_t)rreg(cpu->hvf_fd, HV_X86_RBX);
-            uint32_t rcx = (uint32_t)rreg(cpu->hvf_fd, HV_X86_RCX);
-            uint32_t rdx = (uint32_t)rreg(cpu->hvf_fd, HV_X86_RDX);
+            uint32_t rax = (uint32_t)rreg(hvf_fd, HV_X86_RAX);
+            uint32_t rbx = (uint32_t)rreg(hvf_fd, HV_X86_RBX);
+            uint32_t rcx = (uint32_t)rreg(hvf_fd, HV_X86_RCX);
+            uint32_t rdx = (uint32_t)rreg(hvf_fd, HV_X86_RDX);
 
             if (rax == 1) {
                 /* CPUID1.ecx.OSXSAVE needs to know CR4 */
-                env->cr[4] = rvmcs(cpu->hvf_fd, VMCS_GUEST_CR4);
+                env->cr[4] = rvmcs(hvf_fd, VMCS_GUEST_CR4);
             }
             hvf_cpu_x86_cpuid(env, rax, rcx, &rax, &rbx, &rcx, &rdx);
 
-            wreg(cpu->hvf_fd, HV_X86_RAX, rax);
-            wreg(cpu->hvf_fd, HV_X86_RBX, rbx);
-            wreg(cpu->hvf_fd, HV_X86_RCX, rcx);
-            wreg(cpu->hvf_fd, HV_X86_RDX, rdx);
+            wreg(hvf_fd, HV_X86_RAX, rax);
+            wreg(hvf_fd, HV_X86_RBX, rbx);
+            wreg(hvf_fd, HV_X86_RCX, rcx);
+            wreg(hvf_fd, HV_X86_RDX, rdx);
 
             macvm_set_rip(cpu, rip + ins_len);
             break;
@@ -845,16 +848,16 @@ int hvf_vcpu_exec(CPUState *cpu)
         case EXIT_REASON_XSETBV: {
             X86CPU *x86_cpu = X86_CPU(cpu);
             CPUX86State *env = &x86_cpu->env;
-            uint32_t eax = (uint32_t)rreg(cpu->hvf_fd, HV_X86_RAX);
-            uint32_t ecx = (uint32_t)rreg(cpu->hvf_fd, HV_X86_RCX);
-            uint32_t edx = (uint32_t)rreg(cpu->hvf_fd, HV_X86_RDX);
+            uint32_t eax = (uint32_t)rreg(hvf_fd, HV_X86_RAX);
+            uint32_t ecx = (uint32_t)rreg(hvf_fd, HV_X86_RCX);
+            uint32_t edx = (uint32_t)rreg(hvf_fd, HV_X86_RDX);
 
             if (ecx) {
                 macvm_set_rip(cpu, rip + ins_len);
                 break;
             }
             env->xcr0 = ((uint64_t)edx << 32) | eax;
-            wreg(cpu->hvf_fd, HV_X86_XCR0, env->xcr0 | 1);
+            wreg(hvf_fd, HV_X86_XCR0, env->xcr0 | 1);
             macvm_set_rip(cpu, rip + ins_len);
             break;
         }
@@ -893,11 +896,11 @@ int hvf_vcpu_exec(CPUState *cpu)
 
             switch (cr) {
             case 0x0: {
-                macvm_set_cr0(cpu->hvf_fd, RRX(env, reg));
+                macvm_set_cr0(hvf_fd, RRX(env, reg));
                 break;
             }
             case 4: {
-                macvm_set_cr4(cpu->hvf_fd, RRX(env, reg));
+                macvm_set_cr4(hvf_fd, RRX(env, reg));
                 break;
             }
             case 8: {
@@ -933,7 +936,7 @@ int hvf_vcpu_exec(CPUState *cpu)
             break;
         }
         case EXIT_REASON_TASK_SWITCH: {
-            uint64_t vinfo = rvmcs(cpu->hvf_fd, VMCS_IDT_VECTORING_INFO);
+            uint64_t vinfo = rvmcs(hvf_fd, VMCS_IDT_VECTORING_INFO);
             x68_segment_selector sel = {.sel = exit_qual & 0xffff};
             vmx_handle_task_switch(cpu, sel, (exit_qual >> 30) & 0x3,
              vinfo & VMCS_INTR_VALID, vinfo & VECTORING_INFO_VECTOR_MASK, vinfo
@@ -946,8 +949,8 @@ int hvf_vcpu_exec(CPUState *cpu)
             break;
         }
         case EXIT_REASON_RDPMC:
-            wreg(cpu->hvf_fd, HV_X86_RAX, 0);
-            wreg(cpu->hvf_fd, HV_X86_RDX, 0);
+            wreg(hvf_fd, HV_X86_RAX, 0);
+            wreg(hvf_fd, HV_X86_RDX, 0);
             macvm_set_rip(cpu, rip + ins_len);
             break;
         case VMX_REASON_VMCALL:
diff --git a/target/i386/hvf/x86_descr.c b/target/i386/hvf/x86_descr.c
index 9f539e73f6d..1c6220baa0d 100644
--- a/target/i386/hvf/x86_descr.c
+++ b/target/i386/hvf/x86_descr.c
@@ -75,20 +75,23 @@ void vmx_write_segment_selector(struct CPUState *cpu, x68_segment_selector selec
 
 void vmx_read_segment_descriptor(struct CPUState *cpu, struct vmx_segment *desc, X86Seg seg)
 {
-    desc->sel = rvmcs(cpu->hvf_fd, vmx_segment_fields[seg].selector);
-    desc->base = rvmcs(cpu->hvf_fd, vmx_segment_fields[seg].base);
-    desc->limit = rvmcs(cpu->hvf_fd, vmx_segment_fields[seg].limit);
-    desc->ar = rvmcs(cpu->hvf_fd, vmx_segment_fields[seg].ar_bytes);
+    hv_vcpuid_t hvf_fd = (hv_vcpuid_t)cpu_state->hvf_fd;
+
+    desc->sel = rvmcs(hvf_fd, vmx_segment_fields[seg].selector);
+    desc->base = rvmcs(hvf_fd, vmx_segment_fields[seg].base);
+    desc->limit = rvmcs(hvf_fd, vmx_segment_fields[seg].limit);
+    desc->ar = rvmcs(hvf_fd, vmx_segment_fields[seg].ar_bytes);
 }
 
 void vmx_write_segment_descriptor(CPUState *cpu, struct vmx_segment *desc, X86Seg seg)
 {
     const struct vmx_segment_field *sf = &vmx_segment_fields[seg];
+    hv_vcpuid_t hvf_fd = (hv_vcpuid_t)cpu_state->hvf_fd;
 
-    wvmcs(cpu->hvf_fd, sf->base, desc->base);
-    wvmcs(cpu->hvf_fd, sf->limit, desc->limit);
-    wvmcs(cpu->hvf_fd, sf->selector, desc->sel);
-    wvmcs(cpu->hvf_fd, sf->ar_bytes, desc->ar);
+    wvmcs(hvf_fd, sf->base, desc->base);
+    wvmcs(hvf_fd, sf->limit, desc->limit);
+    wvmcs(hvf_fd, sf->selector, desc->sel);
+    wvmcs(hvf_fd, sf->ar_bytes, desc->ar);
 }
 
 void x86_segment_descriptor_to_vmx(struct CPUState *cpu, x68_segment_selector selector, struct x86_segment_descriptor *desc, struct vmx_segment *vmx_desc)
diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
index 0d7533742eb..2f291f2ad53 100644
--- a/target/i386/hvf/x86hvf.c
+++ b/target/i386/hvf/x86hvf.c
@@ -89,21 +89,22 @@ void hvf_put_xsave(CPUState *cpu_state)
 void hvf_put_segments(CPUState *cpu_state)
 {
     CPUX86State *env = &X86_CPU(cpu_state)->env;
+    hv_vcpuid_t hvf_fd = (hv_vcpuid_t)cpu_state->hvf_fd;
     struct vmx_segment seg;
     
-    wvmcs(cpu_state->hvf_fd, VMCS_GUEST_IDTR_LIMIT, env->idt.limit);
-    wvmcs(cpu_state->hvf_fd, VMCS_GUEST_IDTR_BASE, env->idt.base);
+    wvmcs(hvf_fd, VMCS_GUEST_IDTR_LIMIT, env->idt.limit);
+    wvmcs(hvf_fd, VMCS_GUEST_IDTR_BASE, env->idt.base);
 
-    wvmcs(cpu_state->hvf_fd, VMCS_GUEST_GDTR_LIMIT, env->gdt.limit);
-    wvmcs(cpu_state->hvf_fd, VMCS_GUEST_GDTR_BASE, env->gdt.base);
+    wvmcs(hvf_fd, VMCS_GUEST_GDTR_LIMIT, env->gdt.limit);
+    wvmcs(hvf_fd, VMCS_GUEST_GDTR_BASE, env->gdt.base);
 
-    /* wvmcs(cpu_state->hvf_fd, VMCS_GUEST_CR2, env->cr[2]); */
-    wvmcs(cpu_state->hvf_fd, VMCS_GUEST_CR3, env->cr[3]);
+    /* wvmcs(hvf_fd, VMCS_GUEST_CR2, env->cr[2]); */
+    wvmcs(hvf_fd, VMCS_GUEST_CR3, env->cr[3]);
     vmx_update_tpr(cpu_state);
-    wvmcs(cpu_state->hvf_fd, VMCS_GUEST_IA32_EFER, env->efer);
+    wvmcs(hvf_fd, VMCS_GUEST_IA32_EFER, env->efer);
 
-    macvm_set_cr4(cpu_state->hvf_fd, env->cr[4]);
-    macvm_set_cr0(cpu_state->hvf_fd, env->cr[0]);
+    macvm_set_cr4(hvf_fd, env->cr[4]);
+    macvm_set_cr0(hvf_fd, env->cr[0]);
 
     hvf_set_segment(cpu_state, &seg, &env->segs[R_CS], false);
     vmx_write_segment_descriptor(cpu_state, &seg, R_CS);
@@ -129,31 +130,29 @@ void hvf_put_segments(CPUState *cpu_state)
     hvf_set_segment(cpu_state, &seg, &env->ldt, false);
     vmx_write_segment_descriptor(cpu_state, &seg, R_LDTR);
     
-    hv_vcpu_flush(cpu_state->hvf_fd);
+    hv_vcpu_flush(hvf_fd);
 }
     
 void hvf_put_msrs(CPUState *cpu_state)
 {
     CPUX86State *env = &X86_CPU(cpu_state)->env;
+    hv_vcpuid_t hvf_fd = (hv_vcpuid_t)cpu_state->hvf_fd;
 
-    hv_vcpu_write_msr(cpu_state->hvf_fd, MSR_IA32_SYSENTER_CS,
-                      env->sysenter_cs);
-    hv_vcpu_write_msr(cpu_state->hvf_fd, MSR_IA32_SYSENTER_ESP,
-                      env->sysenter_esp);
-    hv_vcpu_write_msr(cpu_state->hvf_fd, MSR_IA32_SYSENTER_EIP,
-                      env->sysenter_eip);
+    hv_vcpu_write_msr(hvf_fd, MSR_IA32_SYSENTER_CS, env->sysenter_cs);
+    hv_vcpu_write_msr(hvf_fd, MSR_IA32_SYSENTER_ESP, env->sysenter_esp);
+    hv_vcpu_write_msr(hvf_fd, MSR_IA32_SYSENTER_EIP, env->sysenter_eip);
 
-    hv_vcpu_write_msr(cpu_state->hvf_fd, MSR_STAR, env->star);
+    hv_vcpu_write_msr(hvf_fd, MSR_STAR, env->star);
 
 #ifdef TARGET_X86_64
-    hv_vcpu_write_msr(cpu_state->hvf_fd, MSR_CSTAR, env->cstar);
-    hv_vcpu_write_msr(cpu_state->hvf_fd, MSR_KERNELGSBASE, env->kernelgsbase);
-    hv_vcpu_write_msr(cpu_state->hvf_fd, MSR_FMASK, env->fmask);
-    hv_vcpu_write_msr(cpu_state->hvf_fd, MSR_LSTAR, env->lstar);
+    hv_vcpu_write_msr(hvf_fd, MSR_CSTAR, env->cstar);
+    hv_vcpu_write_msr(hvf_fd, MSR_KERNELGSBASE, env->kernelgsbase);
+    hv_vcpu_write_msr(hvf_fd, MSR_FMASK, env->fmask);
+    hv_vcpu_write_msr(hvf_fd, MSR_LSTAR, env->lstar);
 #endif
 
-    hv_vcpu_write_msr(cpu_state->hvf_fd, MSR_GSBASE, env->segs[R_GS].base);
-    hv_vcpu_write_msr(cpu_state->hvf_fd, MSR_FSBASE, env->segs[R_FS].base);
+    hv_vcpu_write_msr(hvf_fd, MSR_GSBASE, env->segs[R_GS].base);
+    hv_vcpu_write_msr(hvf_fd, MSR_FSBASE, env->segs[R_FS].base);
 }
 
 
@@ -173,7 +172,7 @@ void hvf_get_xsave(CPUState *cpu_state)
 void hvf_get_segments(CPUState *cpu_state)
 {
     CPUX86State *env = &X86_CPU(cpu_state)->env;
-
+    hv_vcpuid_t hvf_fd = (hv_vcpuid_t)cpu_state->hvf_fd;
     struct vmx_segment seg;
 
     env->interrupt_injected = -1;
@@ -202,72 +201,74 @@ void hvf_get_segments(CPUState *cpu_state)
     vmx_read_segment_descriptor(cpu_state, &seg, R_LDTR);
     hvf_get_segment(&env->ldt, &seg);
 
-    env->idt.limit = rvmcs(cpu_state->hvf_fd, VMCS_GUEST_IDTR_LIMIT);
-    env->idt.base = rvmcs(cpu_state->hvf_fd, VMCS_GUEST_IDTR_BASE);
-    env->gdt.limit = rvmcs(cpu_state->hvf_fd, VMCS_GUEST_GDTR_LIMIT);
-    env->gdt.base = rvmcs(cpu_state->hvf_fd, VMCS_GUEST_GDTR_BASE);
+    env->idt.limit = rvmcs(hvf_fd, VMCS_GUEST_IDTR_LIMIT);
+    env->idt.base = rvmcs(hvf_fd, VMCS_GUEST_IDTR_BASE);
+    env->gdt.limit = rvmcs(hvf_fd, VMCS_GUEST_GDTR_LIMIT);
+    env->gdt.base = rvmcs(hvf_fd, VMCS_GUEST_GDTR_BASE);
 
-    env->cr[0] = rvmcs(cpu_state->hvf_fd, VMCS_GUEST_CR0);
+    env->cr[0] = rvmcs(hvf_fd, VMCS_GUEST_CR0);
     env->cr[2] = 0;
-    env->cr[3] = rvmcs(cpu_state->hvf_fd, VMCS_GUEST_CR3);
-    env->cr[4] = rvmcs(cpu_state->hvf_fd, VMCS_GUEST_CR4);
+    env->cr[3] = rvmcs(hvf_fd, VMCS_GUEST_CR3);
+    env->cr[4] = rvmcs(hvf_fd, VMCS_GUEST_CR4);
     
-    env->efer = rvmcs(cpu_state->hvf_fd, VMCS_GUEST_IA32_EFER);
+    env->efer = rvmcs(hvf_fd, VMCS_GUEST_IA32_EFER);
 }
 
 void hvf_get_msrs(CPUState *cpu_state)
 {
     CPUX86State *env = &X86_CPU(cpu_state)->env;
+    hv_vcpuid_t hvf_fd = (hv_vcpuid_t)cpu_state->hvf_fd;
     uint64_t tmp;
     
-    hv_vcpu_read_msr(cpu_state->hvf_fd, MSR_IA32_SYSENTER_CS, &tmp);
+    hv_vcpu_read_msr(hvf_fd, MSR_IA32_SYSENTER_CS, &tmp);
     env->sysenter_cs = tmp;
     
-    hv_vcpu_read_msr(cpu_state->hvf_fd, MSR_IA32_SYSENTER_ESP, &tmp);
+    hv_vcpu_read_msr(hvf_fd, MSR_IA32_SYSENTER_ESP, &tmp);
     env->sysenter_esp = tmp;
 
-    hv_vcpu_read_msr(cpu_state->hvf_fd, MSR_IA32_SYSENTER_EIP, &tmp);
+    hv_vcpu_read_msr(hvf_fd, MSR_IA32_SYSENTER_EIP, &tmp);
     env->sysenter_eip = tmp;
 
-    hv_vcpu_read_msr(cpu_state->hvf_fd, MSR_STAR, &env->star);
+    hv_vcpu_read_msr(hvf_fd, MSR_STAR, &env->star);
 
 #ifdef TARGET_X86_64
-    hv_vcpu_read_msr(cpu_state->hvf_fd, MSR_CSTAR, &env->cstar);
-    hv_vcpu_read_msr(cpu_state->hvf_fd, MSR_KERNELGSBASE, &env->kernelgsbase);
-    hv_vcpu_read_msr(cpu_state->hvf_fd, MSR_FMASK, &env->fmask);
-    hv_vcpu_read_msr(cpu_state->hvf_fd, MSR_LSTAR, &env->lstar);
+    hv_vcpu_read_msr(hvf_fd, MSR_CSTAR, &env->cstar);
+    hv_vcpu_read_msr(hvf_fd, MSR_KERNELGSBASE, &env->kernelgsbase);
+    hv_vcpu_read_msr(hvf_fd, MSR_FMASK, &env->fmask);
+    hv_vcpu_read_msr(hvf_fd, MSR_LSTAR, &env->lstar);
 #endif
 
-    hv_vcpu_read_msr(cpu_state->hvf_fd, MSR_IA32_APICBASE, &tmp);
+    hv_vcpu_read_msr(hvf_fd, MSR_IA32_APICBASE, &tmp);
     
-    env->tsc = rdtscp() + rvmcs(cpu_state->hvf_fd, VMCS_TSC_OFFSET);
+    env->tsc = rdtscp() + rvmcs(hvf_fd, VMCS_TSC_OFFSET);
 }
 
 int hvf_put_registers(CPUState *cpu_state)
 {
     X86CPU *x86cpu = X86_CPU(cpu_state);
     CPUX86State *env = &x86cpu->env;
+    hv_vcpuid_t hvf_fd = (hv_vcpuid_t)cpu_state->hvf_fd;
 
-    wreg(cpu_state->hvf_fd, HV_X86_RAX, env->regs[R_EAX]);
-    wreg(cpu_state->hvf_fd, HV_X86_RBX, env->regs[R_EBX]);
-    wreg(cpu_state->hvf_fd, HV_X86_RCX, env->regs[R_ECX]);
-    wreg(cpu_state->hvf_fd, HV_X86_RDX, env->regs[R_EDX]);
-    wreg(cpu_state->hvf_fd, HV_X86_RBP, env->regs[R_EBP]);
-    wreg(cpu_state->hvf_fd, HV_X86_RSP, env->regs[R_ESP]);
-    wreg(cpu_state->hvf_fd, HV_X86_RSI, env->regs[R_ESI]);
-    wreg(cpu_state->hvf_fd, HV_X86_RDI, env->regs[R_EDI]);
-    wreg(cpu_state->hvf_fd, HV_X86_R8, env->regs[8]);
-    wreg(cpu_state->hvf_fd, HV_X86_R9, env->regs[9]);
-    wreg(cpu_state->hvf_fd, HV_X86_R10, env->regs[10]);
-    wreg(cpu_state->hvf_fd, HV_X86_R11, env->regs[11]);
-    wreg(cpu_state->hvf_fd, HV_X86_R12, env->regs[12]);
-    wreg(cpu_state->hvf_fd, HV_X86_R13, env->regs[13]);
-    wreg(cpu_state->hvf_fd, HV_X86_R14, env->regs[14]);
-    wreg(cpu_state->hvf_fd, HV_X86_R15, env->regs[15]);
-    wreg(cpu_state->hvf_fd, HV_X86_RFLAGS, env->eflags);
-    wreg(cpu_state->hvf_fd, HV_X86_RIP, env->eip);
+    wreg(hvf_fd, HV_X86_RAX, env->regs[R_EAX]);
+    wreg(hvf_fd, HV_X86_RBX, env->regs[R_EBX]);
+    wreg(hvf_fd, HV_X86_RCX, env->regs[R_ECX]);
+    wreg(hvf_fd, HV_X86_RDX, env->regs[R_EDX]);
+    wreg(hvf_fd, HV_X86_RBP, env->regs[R_EBP]);
+    wreg(hvf_fd, HV_X86_RSP, env->regs[R_ESP]);
+    wreg(hvf_fd, HV_X86_RSI, env->regs[R_ESI]);
+    wreg(hvf_fd, HV_X86_RDI, env->regs[R_EDI]);
+    wreg(hvf_fd, HV_X86_R8, env->regs[8]);
+    wreg(hvf_fd, HV_X86_R9, env->regs[9]);
+    wreg(hvf_fd, HV_X86_R10, env->regs[10]);
+    wreg(hvf_fd, HV_X86_R11, env->regs[11]);
+    wreg(hvf_fd, HV_X86_R12, env->regs[12]);
+    wreg(hvf_fd, HV_X86_R13, env->regs[13]);
+    wreg(hvf_fd, HV_X86_R14, env->regs[14]);
+    wreg(hvf_fd, HV_X86_R15, env->regs[15]);
+    wreg(hvf_fd, HV_X86_RFLAGS, env->eflags);
+    wreg(hvf_fd, HV_X86_RIP, env->eip);
    
-    wreg(cpu_state->hvf_fd, HV_X86_XCR0, env->xcr0);
+    wreg(hvf_fd, HV_X86_XCR0, env->xcr0);
     
     hvf_put_xsave(cpu_state);
     
@@ -275,14 +276,14 @@ int hvf_put_registers(CPUState *cpu_state)
     
     hvf_put_msrs(cpu_state);
     
-    wreg(cpu_state->hvf_fd, HV_X86_DR0, env->dr[0]);
-    wreg(cpu_state->hvf_fd, HV_X86_DR1, env->dr[1]);
-    wreg(cpu_state->hvf_fd, HV_X86_DR2, env->dr[2]);
-    wreg(cpu_state->hvf_fd, HV_X86_DR3, env->dr[3]);
-    wreg(cpu_state->hvf_fd, HV_X86_DR4, env->dr[4]);
-    wreg(cpu_state->hvf_fd, HV_X86_DR5, env->dr[5]);
-    wreg(cpu_state->hvf_fd, HV_X86_DR6, env->dr[6]);
-    wreg(cpu_state->hvf_fd, HV_X86_DR7, env->dr[7]);
+    wreg(hvf_fd, HV_X86_DR0, env->dr[0]);
+    wreg(hvf_fd, HV_X86_DR1, env->dr[1]);
+    wreg(hvf_fd, HV_X86_DR2, env->dr[2]);
+    wreg(hvf_fd, HV_X86_DR3, env->dr[3]);
+    wreg(hvf_fd, HV_X86_DR4, env->dr[4]);
+    wreg(hvf_fd, HV_X86_DR5, env->dr[5]);
+    wreg(hvf_fd, HV_X86_DR6, env->dr[6]);
+    wreg(hvf_fd, HV_X86_DR7, env->dr[7]);
     
     return 0;
 }
@@ -291,41 +292,42 @@ int hvf_get_registers(CPUState *cpu_state)
 {
     X86CPU *x86cpu = X86_CPU(cpu_state);
     CPUX86State *env = &x86cpu->env;
+    hv_vcpuid_t hvf_fd = (hv_vcpuid_t)cpu_state->hvf_fd;
 
-    env->regs[R_EAX] = rreg(cpu_state->hvf_fd, HV_X86_RAX);
-    env->regs[R_EBX] = rreg(cpu_state->hvf_fd, HV_X86_RBX);
-    env->regs[R_ECX] = rreg(cpu_state->hvf_fd, HV_X86_RCX);
-    env->regs[R_EDX] = rreg(cpu_state->hvf_fd, HV_X86_RDX);
-    env->regs[R_EBP] = rreg(cpu_state->hvf_fd, HV_X86_RBP);
-    env->regs[R_ESP] = rreg(cpu_state->hvf_fd, HV_X86_RSP);
-    env->regs[R_ESI] = rreg(cpu_state->hvf_fd, HV_X86_RSI);
-    env->regs[R_EDI] = rreg(cpu_state->hvf_fd, HV_X86_RDI);
-    env->regs[8] = rreg(cpu_state->hvf_fd, HV_X86_R8);
-    env->regs[9] = rreg(cpu_state->hvf_fd, HV_X86_R9);
-    env->regs[10] = rreg(cpu_state->hvf_fd, HV_X86_R10);
-    env->regs[11] = rreg(cpu_state->hvf_fd, HV_X86_R11);
-    env->regs[12] = rreg(cpu_state->hvf_fd, HV_X86_R12);
-    env->regs[13] = rreg(cpu_state->hvf_fd, HV_X86_R13);
-    env->regs[14] = rreg(cpu_state->hvf_fd, HV_X86_R14);
-    env->regs[15] = rreg(cpu_state->hvf_fd, HV_X86_R15);
+    env->regs[R_EAX] = rreg(hvf_fd, HV_X86_RAX);
+    env->regs[R_EBX] = rreg(hvf_fd, HV_X86_RBX);
+    env->regs[R_ECX] = rreg(hvf_fd, HV_X86_RCX);
+    env->regs[R_EDX] = rreg(hvf_fd, HV_X86_RDX);
+    env->regs[R_EBP] = rreg(hvf_fd, HV_X86_RBP);
+    env->regs[R_ESP] = rreg(hvf_fd, HV_X86_RSP);
+    env->regs[R_ESI] = rreg(hvf_fd, HV_X86_RSI);
+    env->regs[R_EDI] = rreg(hvf_fd, HV_X86_RDI);
+    env->regs[8] = rreg(hvf_fd, HV_X86_R8);
+    env->regs[9] = rreg(hvf_fd, HV_X86_R9);
+    env->regs[10] = rreg(hvf_fd, HV_X86_R10);
+    env->regs[11] = rreg(hvf_fd, HV_X86_R11);
+    env->regs[12] = rreg(hvf_fd, HV_X86_R12);
+    env->regs[13] = rreg(hvf_fd, HV_X86_R13);
+    env->regs[14] = rreg(hvf_fd, HV_X86_R14);
+    env->regs[15] = rreg(hvf_fd, HV_X86_R15);
     
-    env->eflags = rreg(cpu_state->hvf_fd, HV_X86_RFLAGS);
-    env->eip = rreg(cpu_state->hvf_fd, HV_X86_RIP);
+    env->eflags = rreg(hvf_fd, HV_X86_RFLAGS);
+    env->eip = rreg(hvf_fd, HV_X86_RIP);
    
     hvf_get_xsave(cpu_state);
-    env->xcr0 = rreg(cpu_state->hvf_fd, HV_X86_XCR0);
+    env->xcr0 = rreg(hvf_fd, HV_X86_XCR0);
     
     hvf_get_segments(cpu_state);
     hvf_get_msrs(cpu_state);
     
-    env->dr[0] = rreg(cpu_state->hvf_fd, HV_X86_DR0);
-    env->dr[1] = rreg(cpu_state->hvf_fd, HV_X86_DR1);
-    env->dr[2] = rreg(cpu_state->hvf_fd, HV_X86_DR2);
-    env->dr[3] = rreg(cpu_state->hvf_fd, HV_X86_DR3);
-    env->dr[4] = rreg(cpu_state->hvf_fd, HV_X86_DR4);
-    env->dr[5] = rreg(cpu_state->hvf_fd, HV_X86_DR5);
-    env->dr[6] = rreg(cpu_state->hvf_fd, HV_X86_DR6);
-    env->dr[7] = rreg(cpu_state->hvf_fd, HV_X86_DR7);
+    env->dr[0] = rreg(hvf_fd, HV_X86_DR0);
+    env->dr[1] = rreg(hvf_fd, HV_X86_DR1);
+    env->dr[2] = rreg(hvf_fd, HV_X86_DR2);
+    env->dr[3] = rreg(hvf_fd, HV_X86_DR3);
+    env->dr[4] = rreg(hvf_fd, HV_X86_DR4);
+    env->dr[5] = rreg(hvf_fd, HV_X86_DR5);
+    env->dr[6] = rreg(hvf_fd, HV_X86_DR6);
+    env->dr[7] = rreg(hvf_fd, HV_X86_DR7);
     
     x86_update_hflags(env);
     return 0;
@@ -351,6 +353,7 @@ bool hvf_inject_interrupts(CPUState *cpu_state)
 {
     X86CPU *x86cpu = X86_CPU(cpu_state);
     CPUX86State *env = &x86cpu->env;
+    hv_vcpuid_t hvf_fd = (hv_vcpuid_t)cpu_state->hvf_fd;
 
     uint8_t vector;
     uint64_t intr_type;
@@ -379,7 +382,7 @@ bool hvf_inject_interrupts(CPUState *cpu_state)
     uint64_t info = 0;
     if (have_event) {
         info = vector | intr_type | VMCS_INTR_VALID;
-        uint64_t reason = rvmcs(cpu_state->hvf_fd, VMCS_EXIT_REASON);
+        uint64_t reason = rvmcs(hvf_fd, VMCS_EXIT_REASON);
         if (env->nmi_injected && reason != EXIT_REASON_TASK_SWITCH) {
             vmx_clear_nmi_blocking(cpu_state);
         }
@@ -388,17 +391,17 @@ bool hvf_inject_interrupts(CPUState *cpu_state)
             info &= ~(1 << 12); /* clear undefined bit */
             if (intr_type == VMCS_INTR_T_SWINTR ||
                 intr_type == VMCS_INTR_T_SWEXCEPTION) {
-                wvmcs(cpu_state->hvf_fd, VMCS_ENTRY_INST_LENGTH, env->ins_len);
+                wvmcs(hvf_fd, VMCS_ENTRY_INST_LENGTH, env->ins_len);
             }
             
             if (env->has_error_code) {
-                wvmcs(cpu_state->hvf_fd, VMCS_ENTRY_EXCEPTION_ERROR,
+                wvmcs(hvf_fd, VMCS_ENTRY_EXCEPTION_ERROR,
                       env->error_code);
                 /* Indicate that VMCS_ENTRY_EXCEPTION_ERROR is valid */
                 info |= VMCS_INTR_DEL_ERRCODE;
             }
             /*printf("reinject  %lx err %d\n", info, err);*/
-            wvmcs(cpu_state->hvf_fd, VMCS_ENTRY_INTR_INFO, info);
+            wvmcs(hvf_fd, VMCS_ENTRY_INTR_INFO, info);
         };
     }
 
@@ -406,7 +409,7 @@ bool hvf_inject_interrupts(CPUState *cpu_state)
         if (!(env->hflags2 & HF2_NMI_MASK) && !(info & VMCS_INTR_VALID)) {
             cpu_state->interrupt_request &= ~CPU_INTERRUPT_NMI;
             info = VMCS_INTR_VALID | VMCS_INTR_T_NMI | EXCP02_NMI;
-            wvmcs(cpu_state->hvf_fd, VMCS_ENTRY_INTR_INFO, info);
+            wvmcs(hvf_fd, VMCS_ENTRY_INTR_INFO, info);
         } else {
             vmx_set_nmi_window_exiting(cpu_state);
         }
@@ -418,8 +421,8 @@ bool hvf_inject_interrupts(CPUState *cpu_state)
         int line = cpu_get_pic_interrupt(&x86cpu->env);
         cpu_state->interrupt_request &= ~CPU_INTERRUPT_HARD;
         if (line >= 0) {
-            wvmcs(cpu_state->hvf_fd, VMCS_ENTRY_INTR_INFO, line |
-                  VMCS_INTR_VALID | VMCS_INTR_T_HWINTR);
+            wvmcs(hvf_fd, VMCS_ENTRY_INTR_INFO,
+                  line | VMCS_INTR_VALID | VMCS_INTR_T_HWINTR);
         }
     }
     if (cpu_state->interrupt_request & CPU_INTERRUPT_HARD) {
-- 
2.26.2


