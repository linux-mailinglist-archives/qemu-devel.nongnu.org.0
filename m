Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACFF401C43
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:27:44 +0200 (CEST)
Received: from localhost ([::1]:60092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEf1-0007BV-Ib
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPV-0000sw-Kl
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:41 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:55015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPT-0007hW-LU
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:40 -0400
Received: by mail-wm1-x330.google.com with SMTP id g138so4567593wmg.4
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+55luvDgxLUHmSWJWmBqLuALhR/szmakMsXeiwCOEK4=;
 b=a3qtZB6wkM/YBdq4FUheo+gaMWyP8yloeJ8Ll0EGCFrbGvNJ0QLfKaNKX8HgLxNFW7
 mghoxADWGdoYBN9vR4loxq2cyCCPzgBkdcmNxp//PgE9EvkeGTWaGJuOrYVcuM0golay
 L30wHl1w+wa6DwZW/Yq9CnIEpcGPOE6f+7bi6MQGDdHXgJ58qJ+suoPTgyV4Da1Zqy+x
 CIz2YbcKrcj+4yt219t7cD0LtSQyD5lEeO3bnEKooVkcJPK9eOjWWAai/SPMu4iSUACD
 P0D0Q2VnSAtoDDW8AnuAofqFTa2O8U0dLwC9cmcFNbnBxd9M5TWwLhzKuByjTp972JXh
 8eUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+55luvDgxLUHmSWJWmBqLuALhR/szmakMsXeiwCOEK4=;
 b=HiWIwjKKw1wNvPX/fc84qmO7JMbgawqGJiZVqaf4crvdKWcKqGumllzmHZj2hjrt7s
 oCFL9DfnvH5MkVRS+mQiyUGqpCZ3RIAq2P7F/Xo5ilhneJNluTSaj0P7i0NDfLAGxhtj
 u1tgrjDVercSDAmARkFT2bqMATpl9vn9x27IqVNhFrvQjmCVrPfWo33rxlDpvnISvWGN
 jz+o4oPHTSkELbWTN18BaJooMxrOvjjDFMhvY/7ZVRgQ69qjwZuMN5p5NAvt1v2pezDw
 54ngqo/sAI8nvsj26bsFPtZsDvUuTuSXei+potBiOOduw6LAoOzw+aQ98LVgWHkmm8Xh
 uUYg==
X-Gm-Message-State: AOAM531N4dDZ2mOADHI9JzgFh7reHefvSiD7EyYkyeKbcSSVQGu+H+Ny
 pgEqkzLyNN9HYoA60lfvLGDxbUsZY6Q=
X-Google-Smtp-Source: ABdhPJyXByrDyFagVLen4mvbbl6SX/7OWYAUdSnhBzCsAq/O3mu6oplzZzswGCMtq9kZmOYaBMCiQw==
X-Received: by 2002:a1c:f019:: with SMTP id a25mr11439309wmb.96.1630933898101; 
 Mon, 06 Sep 2021 06:11:38 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k4sm7992331wrm.74.2021.09.06.06.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:11:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/36] i386: kvm: Add support for exposing PROVISIONKEY to guest
Date: Mon,  6 Sep 2021 15:10:44 +0200
Message-Id: <20210906131059.55234-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906131059.55234-1-pbonzini@redhat.com>
References: <20210906131059.55234-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
index 38cf507199..3b1f9cbdf6 100644
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



