Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DDF4170F3
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 13:37:08 +0200 (CEST)
Received: from localhost ([::1]:57562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTjVr-0002S7-2n
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 07:37:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKX-0007n6-Il
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:25 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:35659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKW-0000Yv-0u
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:25 -0400
Received: by mail-ed1-x52e.google.com with SMTP id y89so24042926ede.2
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 04:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n7EpH1eUHbgsU4y2oVIOfkcySimCn2YNElmxUA1pPr0=;
 b=HIPou2TPAizLPQIC1FucWZuIA44mTi+PfXny1rIa7UDqLPulu1PyCjCFlPHmZaUW2w
 O3m8XtRFDp82oC5MYWxi7WK/ZG3zZ1cYaXm1duFptZVeInV7l+RiQ6Umq5yBPxB6ZD/y
 TvMO88jSAfc7WUSUzn6f+gPBTqhbYULfBYxdBmcX7OsnKZYZdoV6A7zqAeLpXCTitbno
 DBZnYbMemiW0G2cYBkWqBRbyHfq6Yf4S/Wxz0rB/naCTCoecLe3GG1thvrVJkvL0aQFj
 SKxkbysjiCSx7WrcXYIFyFPcjvh4Nw6F+4c2fpwo5fQz85oZ1CLqtC2capZFxtg+vX+3
 Djsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=n7EpH1eUHbgsU4y2oVIOfkcySimCn2YNElmxUA1pPr0=;
 b=zjAXs2ktrOiM9aozIlx8A9r/bZFEs0utd9z7Pz10TVgMsZ9lRJyP0QwyP3FBTuBn6U
 q49E/fUQ96hH2yXVTv4g3Zpbecg8ngUlqI/wW4PkxAGm8gI+HSBsyNoSR/sOhMHFhZL0
 4lm4XZC0bHOYcJPT3EIRz/8uxXB7Pv3Tg9UQXilEM5iWVIoF3Omuyy8bRxILtfgA8ZRX
 AamtXBScIIm78Eu7cFmmbF9yC63+JwIbK67jdgwvDBU8EZaGbWi2OpqI6rMZbM0TEqoK
 /DZibBkaCcCf/Rxs93Y43frJ/GHUpKgeQiheukGj5GEJ4lEQFwWrWyMgmRBGuG78n03a
 MF1g==
X-Gm-Message-State: AOAM532K8xhJo5naiGklERtp4KQc0e1BnKazFaqRCrIqM8mIjqnrGES7
 tcJN4advtqeYblwx9ZrjzlmT9SvTvEI=
X-Google-Smtp-Source: ABdhPJyhnRrDv+i3sc9Ky4o24GRnKq0YaX3nVAbnAtxpnqrgM47d6g0HMtuQRQsylIazMxFxzp+Dhw==
X-Received: by 2002:a50:ab18:: with SMTP id s24mr4481191edc.88.1632482722222; 
 Fri, 24 Sep 2021 04:25:22 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t14sm4886961ejf.24.2021.09.24.04.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 04:25:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 14/26] i386: kvm: Add support for exposing PROVISIONKEY to
 guest
Date: Fri, 24 Sep 2021 13:24:57 +0200
Message-Id: <20210924112509.25061-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924112509.25061-1-pbonzini@redhat.com>
References: <20210924112509.25061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: yang.zhong@intel.com, philmd@redhat.com, eblake@redhat.com,
 Sean Christopherson <sean.j.christopherson@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

If the guest want to fully use SGX, the guest needs to be able to
access provisioning key. Add a new KVM_CAP_SGX_ATTRIBUTE to KVM to
support provisioning key to KVM guests.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-14-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c          |  5 ++++-
 target/i386/kvm/kvm.c      | 29 +++++++++++++++++++++++++++++
 target/i386/kvm/kvm_i386.h |  2 ++
 3 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 8a62986819..de58599a3d 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5542,7 +5542,10 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
             *ecx |= XSTATE_FP_MASK | XSTATE_SSE_MASK;
 
             /* Access to PROVISIONKEY requires additional credentials. */
-            *eax &= ~(1U << 4);
+            if ((*eax & (1U << 4)) &&
+                !kvm_enable_sgx_provisioning(cs->kvm_state)) {
+                *eax &= ~(1U << 4);
+            }
         }
 #endif
         break;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 6dc40161e0..488926a95f 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -4644,6 +4644,35 @@ void kvm_arch_update_guest_debug(CPUState *cpu, struct kvm_guest_debug *dbg)
     }
 }
 
+static bool has_sgx_provisioning;
+
+static bool __kvm_enable_sgx_provisioning(KVMState *s)
+{
+    int fd, ret;
+
+    if (!kvm_vm_check_extension(s, KVM_CAP_SGX_ATTRIBUTE)) {
+        return false;
+    }
+
+    fd = qemu_open_old("/dev/sgx_provision", O_RDONLY);
+    if (fd < 0) {
+        return false;
+    }
+
+    ret = kvm_vm_enable_cap(s, KVM_CAP_SGX_ATTRIBUTE, 0, fd);
+    if (ret) {
+        error_report("Could not enable SGX PROVISIONKEY: %s", strerror(-ret));
+        exit(1);
+    }
+    close(fd);
+    return true;
+}
+
+bool kvm_enable_sgx_provisioning(KVMState *s)
+{
+    return MEMORIZE(__kvm_enable_sgx_provisioning(s), has_sgx_provisioning);
+}
+
 static bool host_supports_vmx(void)
 {
     uint32_t ecx, unused;
diff --git a/target/i386/kvm/kvm_i386.h b/target/i386/kvm/kvm_i386.h
index 54667b35f0..a978509d50 100644
--- a/target/i386/kvm/kvm_i386.h
+++ b/target/i386/kvm/kvm_i386.h
@@ -51,4 +51,6 @@ bool kvm_hyperv_expand_features(X86CPU *cpu, Error **errp);
 
 uint64_t kvm_swizzle_msi_ext_dest_id(uint64_t address);
 
+bool kvm_enable_sgx_provisioning(KVMState *s);
+
 #endif
-- 
2.31.1



