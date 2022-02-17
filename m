Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 232AE4BA276
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 15:06:05 +0100 (CET)
Received: from localhost ([::1]:60200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKhQ3-0002qo-Km
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 09:06:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nKh5B-0002ky-5e
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 08:44:29 -0500
Received: from [2a00:1450:4864:20::636] (port=35426
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nKh58-0002af-Og
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 08:44:28 -0500
Received: by mail-ej1-x636.google.com with SMTP id qk11so7445707ejb.2
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 05:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GUzDAkORZzekUXxw8oyBR3o2aMGTChOMLfj3ZxQVqhA=;
 b=Ued4oCK8lsKJotPmXeBO4DAltPFt6ClYvv4Pfv7By9I/fAJC3bIv/RC1AhEJckFm8X
 7NlWG4DpGpTggbsAR9mN0ilUkNq2SdTUlY4Czm3TGIwMpN7guUuwvtNBIJ9fX2ocSnyG
 2LBBEAKtves6dMNAMvSS35QJNAV/NQa6FSw+/9UyMUOt1hpeQrTly2s9+B7k2nI4RhuO
 +lmY0iWMViWdAOYrOK1MKOVr7veJOOtxOW73j5+NaYJaHviB9rRehv2y7tnlYRPuE7Jn
 /+lSUHrb73JF9qsaVuEMVBdjNy4oQoh+N1RWzhLUJf+oj78ybSNuP7W8OXF0FnygpaOm
 8JHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GUzDAkORZzekUXxw8oyBR3o2aMGTChOMLfj3ZxQVqhA=;
 b=rqkBwrPPztwrHf9PxG7DpoWpnL4mif2XsYSOoGGpCrwGkwsxLhzGyvnmFL7IpY4pAu
 DxWtpvbzwmHhdWPMjO5nHvDOYqBk8poANwHKC6lzUDOhSkizDWizdZY3O2RXxkm8wkQN
 zTtu8ph6rx4v62FmcHb2xk4yPa1owTaRNbzgAgvi56dwEMf57LCU34nzBht/WDVNsJ87
 pt33oWKaCf+HGDglldckOMcOB1FZDHIMCixhV3LhazWkvkvAdLB4fwAQLzImzPtGXnD3
 RK4dk+JxKe4m2ZaAQj7BUGtU2ysFdhfEUrluooomVbPoONUO5AsUb4EgR9hEeLTC7nMm
 gYTw==
X-Gm-Message-State: AOAM5324AcMeCZDdJJQr3jfIu8qK5QWzdE7TRWMwNHkmh4GNax8cGQBv
 CBM79sUPrqgPuN6fMtwdxIQ=
X-Google-Smtp-Source: ABdhPJytLpv2o3f3eOKa0WegtoWq0hNuMCIXUdukOrzuB43TjdGsjKsioVPleltKgJ1o1tBQin3bjQ==
X-Received: by 2002:a17:906:9bcf:b0:6cc:1ba8:5c5a with SMTP id
 de15-20020a1709069bcf00b006cc1ba85c5amr2304239ejc.640.1645105455947; 
 Thu, 17 Feb 2022 05:44:15 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id fx2sm1081625ejb.59.2022.02.17.05.44.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 05:44:15 -0800 (PST)
Message-ID: <9e873019-99c6-bd47-458d-1d307961882c@redhat.com>
Date: Thu, 17 Feb 2022 14:44:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/8] x86: Grant AMX permission for guest
Content-Language: en-US
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20220217060434.52460-1-yang.zhong@intel.com>
 <20220217060434.52460-4-yang.zhong@intel.com>
 <20220217055836.GA10691@yangzhon-Virtual>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220217055836.GA10691@yangzhon-Virtual>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: seanjc@google.com, kevin.tian@intel.com, jing2.liu@linux.intel.com,
 wei.w.wang@intel.com, guang.zeng@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/22 06:58, Yang Zhong wrote:
>> +
>> +    if ((mask & XSTATE_XTILE_DATA_MASK) == XSTATE_XTILE_DATA_MASK) {
>> +        bitmask = kvm_arch_get_supported_cpuid(s, 0xd, 0, R_EAX);
>> +        if (!(bitmask & XSTATE_XTILE_DATA_MASK)) {
>     Paolo, last time you suggested below changes for here:
> 
>     rc = kvm_arch_get_supported_cpuid(s, 0xd, 0,
>                                    (xdata_bit < 32 ? R_EAX : R_EDX));
>     if (!(rc & BIT(xdata_bit & 31)) {
>        ...
>     }
> 
>    Since I used "mask" as parameter here, so I had to directly use R_EAX here.
>    Please review and if need change it to like "(xdata_bit < 32 ? R_EAX : R_EDX)",
>    I will change this in next version, thanks!

I looked at this function more closely because it didn't compile on non-Linux
systems, too.  I think it's better to write it already to plan for more
dynamic features.  In the code below, I'm also relying on
KVM_GET_SUPPORTED_CPUID/KVM_X86_COMP_GUEST_SUPP being executed
before ARCH_REQ_XCOMP_GUEST_PERM, which therefore cannot fail.

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 377d993438..1d0c006077 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -43,8 +43,6 @@
  #include "disas/capstone.h"
  #include "cpu-internal.h"
  
-#include <sys/syscall.h>
-
  /* Helpers for building CPUID[2] descriptors: */
  
  struct CPUID2CacheDescriptorInfo {
@@ -6002,40 +6000,6 @@ static void x86_cpu_adjust_feat_level(X86CPU *cpu, FeatureWord w)
      }
  }
  
-static void kvm_request_xsave_components(X86CPU *cpu, uint64_t mask)
-{
-    KVMState *s = kvm_state;
-    uint64_t bitmask;
-    long rc;
-
-    if ((mask & XSTATE_XTILE_DATA_MASK) == XSTATE_XTILE_DATA_MASK) {
-        bitmask = kvm_arch_get_supported_cpuid(s, 0xd, 0, R_EAX);
-        if (!(bitmask & XSTATE_XTILE_DATA_MASK)) {
-            warn_report("no amx support from supported_xcr0, "
-                        "bitmask:0x%lx", bitmask);
-            return;
-        }
-
-        rc = syscall(SYS_arch_prctl, ARCH_REQ_XCOMP_GUEST_PERM,
-                      XSTATE_XTILE_DATA_BIT);
-        if (rc) {
-            /*
-             * The older kernel version(<5.15) can't support
-             * ARCH_REQ_XCOMP_GUEST_PERM and directly return.
-             */
-            return;
-        }
-
-        rc = syscall(SYS_arch_prctl, ARCH_GET_XCOMP_GUEST_PERM, &bitmask);
-        if (rc) {
-            warn_report("prctl(ARCH_GET_XCOMP_GUEST_PERM) error: %ld", rc);
-        } else if (!(bitmask & XFEATURE_XTILE_MASK)) {
-            warn_report("prctl(ARCH_REQ_XCOMP_GUEST_PERM) failure "
-                        "and bitmask=0x%lx", bitmask);
-        }
-    }
-}
-
  /* Calculate XSAVE components based on the configured CPU feature flags */
  static void x86_cpu_enable_xsave_components(X86CPU *cpu)
  {
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d4ad0f56bd..de949bd63d 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -551,11 +551,8 @@ typedef enum X86Seg {
  #define XSTATE_PKRU_MASK                (1ULL << XSTATE_PKRU_BIT)
  #define XSTATE_XTILE_CFG_MASK           (1ULL << XSTATE_XTILE_CFG_BIT)
  #define XSTATE_XTILE_DATA_MASK          (1ULL << XSTATE_XTILE_DATA_BIT)
-#define XFEATURE_XTILE_MASK             (XSTATE_XTILE_CFG_MASK \
-                                         | XSTATE_XTILE_DATA_MASK)
  
-#define ARCH_GET_XCOMP_GUEST_PERM       0x1024
-#define ARCH_REQ_XCOMP_GUEST_PERM       0x1025
+#define XSTATE_DYNAMIC_MASK             (XSTATE_XTILE_DATA_MASK)
  
  #define ESA_FEATURE_ALIGN64_BIT         1
  
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 3bdcd724c4..4b07778970 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -17,6 +17,7 @@
  #include "qapi/error.h"
  #include <sys/ioctl.h>
  #include <sys/utsname.h>
+#include <sys/syscall.h>
  
  #include <linux/kvm.h>
  #include "standard-headers/asm-x86/kvm_para.h"
@@ -5168,3 +5169,39 @@ bool kvm_arch_cpu_check_are_resettable(void)
  {
      return !sev_es_enabled();
  }
+
+#define ARCH_REQ_XCOMP_GUEST_PERM       0x1025
+
+void kvm_request_xsave_components(X86CPU *cpu, uint64_t mask)
+{
+    KVMState *s = kvm_state;
+    uint64_t supported;
+
+    mask &= XSTATE_DYNAMIC_MASK;
+    if (!mask) {
+	return;
+    }
+    /*
+     * Just ignore bits that are not in CPUID[EAX=0xD,ECX=0].
+     * ARCH_REQ_XCOMP_GUEST_PERM would fail, and QEMU has warned
+     * about them already because they are not supported features.
+     */
+    supported = kvm_arch_get_supported_cpuid(s, 0xd, 0, R_EAX);
+    supported |= (uint64_t)kvm_arch_get_supported_cpuid(s, 0xd, 0, R_EDX) << 32;
+    mask &= ~supported;
+
+    while (mask) {
+        int bit = ctz64(mask);
+        int rc = syscall(SYS_arch_prctl, ARCH_REQ_XCOMP_GUEST_PERM, bit);
+        if (rc) {
+            /*
+             * Older kernel version (<5.17) do not support
+             * ARCH_REQ_XCOMP_GUEST_PERM, but also do not return
+             * any dynamic feature from kvm_arch_get_supported_cpuid.
+             */
+            warn_report("prctl(ARCH_REQ_XCOMP_GUEST_PERM) failure "
+                        "for feature bit %d", bit);
+        }
+	mask &= ~BIT_ULL(bit);
+    }
+}
diff --git a/target/i386/kvm/kvm_i386.h b/target/i386/kvm/kvm_i386.h
index a978509d50..4124912c20 100644
--- a/target/i386/kvm/kvm_i386.h
+++ b/target/i386/kvm/kvm_i386.h
@@ -52,5 +52,6 @@ bool kvm_hyperv_expand_features(X86CPU *cpu, Error **errp);
  uint64_t kvm_swizzle_msi_ext_dest_id(uint64_t address);
  
  bool kvm_enable_sgx_provisioning(KVMState *s);
+void kvm_request_xsave_components(X86CPU *cpu, uint64_t mask);
  
  #endif


If this works, the rest of the series is good to go!

Thanks,

Paolo

