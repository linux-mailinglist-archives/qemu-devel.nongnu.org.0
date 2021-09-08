Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6088F4037D9
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:28:31 +0200 (CEST)
Received: from localhost ([::1]:54152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuog-0007Y3-Eg
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRt-0006hw-Bf
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:57 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:55236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRp-00032w-1X
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:57 -0400
Received: by mail-wm1-x32d.google.com with SMTP id s24so1271200wmh.4
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+55luvDgxLUHmSWJWmBqLuALhR/szmakMsXeiwCOEK4=;
 b=X+KEV0kvOrLCeLTdFnE0vVfyyHPpyYW8R0P0mbP1bd/6e1Akk3Tk+lfuNM3fIOX/zg
 GASZ7hcGuSrKCoTdY4f9Mq/HHAJTnl3HZ69jaqdhQ+rk/1bARTqCY8vhbrO4dwPWH6qH
 56d0ljgM0Tf/qwsaEzZgkIU914xl2xw9dBHGXoiCSatdsO2GpRCfVOBaETWlZ/sBDd7p
 J3usQzl6Y0ZAE17y/C/N/oUrYUe7MCmEy/YttjZla4hqzy/iTTPWJ5CfaK8qfbgEoSC+
 I4pC3R9kTZSnyesWE2/UxXDEaDI0prBe3s0k/IEAiur7t4wqSKhhczsXl6AFKk2Ew8Ie
 sTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+55luvDgxLUHmSWJWmBqLuALhR/szmakMsXeiwCOEK4=;
 b=N2Cto6B8ZbvyD6S4SdGLlZLwK37ROGx3iD3rZncn5xJMOsZSDnUOJ4IsD8bYijt0po
 Zs5aX2lc/K0Mkc2kaBookGInqmhfuZQTgV3CeOO5wP16XN+GvY1+PlRRarDK7RBPwutt
 o9Xp7Li7kVwoK4Ehwx7F8b/U7xtS8OE/JqY0Q2wqrsa3Di4Yd2i8GL626Y45m2zZcZZG
 etq5SfaEDpnRMA/QSUgkMWFDa/fCk1BGsVp4cypjYqmapOom6nGkkb64evsfhqUgAEMU
 W49wUrFXo73OHKpfWQDmYvlaS1iTlRnE+1OyqINq1b6K4WC1sEzqK9l+Q2Zha3IlVsT0
 jEeg==
X-Gm-Message-State: AOAM530tBLFM83Tge8y0RlXQ6aZw1WbLwXILcQRkcunJaPkjGrQKk6Bz
 Iux9FuzSjgwrJGABx/zLZnzT/ZebOaI=
X-Google-Smtp-Source: ABdhPJym5/dTr8fFtLtxnoH02g24efqYFaC3xqCBCzOExQADQB1LUQVw0nXj3ZEnpD07ACNsF+5KMA==
X-Received: by 2002:a1c:c913:: with SMTP id f19mr2637897wmb.86.1631095491678; 
 Wed, 08 Sep 2021 03:04:51 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:04:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 22/43] i386: kvm: Add support for exposing PROVISIONKEY to
 guest
Date: Wed,  8 Sep 2021 12:04:05 +0200
Message-Id: <20210908100426.264356-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
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



