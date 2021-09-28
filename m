Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D749A41AFA0
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:05:16 +0200 (CEST)
Received: from localhost ([::1]:57664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVCnL-0005n8-T2
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCa7-0006Pu-7J
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:36 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:38414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCa5-0001Ps-Mw
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:34 -0400
Received: by mail-ed1-x532.google.com with SMTP id dj4so83098347edb.5
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n7EpH1eUHbgsU4y2oVIOfkcySimCn2YNElmxUA1pPr0=;
 b=ePWPUBVPKlTSyyZWU9Dqg/pxes17ywINpwQRYs4wc1R+Gy8A71DJc0ndOp6II5pEXq
 nqbeJ5HloUZuZkQdLZsHcX9IeZbtQ6hh8F5F8MZcr2Wkpf/mqz74M8MwkP9otXKfXJ+S
 /IT7+xM7y6IQ4LfW5llrzd5XMyeFgfp84+lGtX0ZhDxh7xwrQXfVsHejremGyuzotzCl
 HGiDhE+JO4YX9BBrCcGYUS16CevrhNCPQYUBrFm1WTnJKzke1UrhrQ7xMawedt6uef70
 hD0vQKXOw2krjGDSBVDLVkahzNjD9rlhXEzHEZ4R7GFqRfR8fI9WWp9oWCR0yyEBkXf3
 UL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=n7EpH1eUHbgsU4y2oVIOfkcySimCn2YNElmxUA1pPr0=;
 b=6Dria1otyMuM7+jXJ5KSC6q5cmZCXDjd4J0NAZqlTQ+RryeduB+btvzNR5wgS2rYPU
 eyes3SYjjnIr5KS5iGUgn0pz3FvqVlE3F3jS7I9pikX3/AunU9aSBK5Idf8Mq6orr1O3
 YJ1p26pxF+zwBfsWq5l9/VBfKp2oA+NnjubACy87vZicq0Sm8anjCYlDlGPY8vLdasqM
 GNjSwveCtebTWHwvkp1ToKspLXUjvfTC1oTIEIlzX7GmrlmwTPLgfR43tmTkkuvDbtFN
 yqiJCcXo9BEheH++22pRk7wWtPBCg7kSk6XhgYdQhooiNJJZhX9WgbA45AUAoICpwfso
 cNGQ==
X-Gm-Message-State: AOAM5313C3UpWqgfnmMaoCoesEqemTtXqen6atGmClNTEjO58z4rPYqt
 ogeyqKxb2ztAqpAJDF/6botXpIFx9PI=
X-Google-Smtp-Source: ABdhPJziyUUEJHnvbbxJZQzDePSfmviAoe6FPX7CuEUgIXeiKhbmMUEthi2a3h5AqqD76eTKtB0l/Q==
X-Received: by 2002:a17:906:d9ca:: with SMTP id
 qk10mr355307ejb.220.1632833489675; 
 Tue, 28 Sep 2021 05:51:29 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p24sm12641685edq.27.2021.09.28.05.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 05:51:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/33] i386: kvm: Add support for exposing PROVISIONKEY to guest
Date: Tue, 28 Sep 2021 14:50:57 +0200
Message-Id: <20210928125116.183620-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928125116.183620-1-pbonzini@redhat.com>
References: <20210928125116.183620-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Yang Zhong <yang.zhong@intel.com>,
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



