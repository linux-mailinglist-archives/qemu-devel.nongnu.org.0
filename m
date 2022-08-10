Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E24E58EE60
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 16:32:20 +0200 (CEST)
Received: from localhost ([::1]:54700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLmkt-00035L-Nn
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 10:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1oLmH3-000497-Ti
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 10:01:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1oLmGv-0003lO-Tz
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 10:01:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660140081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zOVrqFaIjxStr+PddGZDDIzWeEXAekGQoynx9FQL124=;
 b=HQO7Y2hZIkeKUVwscc7MHfn9XrQGxlvrJOFy+ZxvSbDQh1h8cLkWpao46Xvqilk3VJlaBR
 CZIky+JPCpszxFtm/KLTKLUGeDB+GgAsHtNnIAxr3NF5OODG1Gr6QsoTe2vfUBLPYJhKU4
 TMtOkIScxuwyt8uM8D6VsO7RwnjJFQk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-L88jZe1ONfC8MRe4BAtWQA-1; Wed, 10 Aug 2022 10:00:11 -0400
X-MC-Unique: L88jZe1ONfC8MRe4BAtWQA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E56968115B1;
 Wed, 10 Aug 2022 14:00:10 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.194.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2B5C492C3B;
 Wed, 10 Aug 2022 14:00:09 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Subject: [PATCH RFC v1 1/2] i386: reset KVM nested state upon CPU reset
Date: Wed, 10 Aug 2022 16:00:06 +0200
Message-Id: <20220810140007.1036293-2-vkuznets@redhat.com>
In-Reply-To: <20220810140007.1036293-1-vkuznets@redhat.com>
References: <20220810140007.1036293-1-vkuznets@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Make sure env->nested_state is cleaned up when a vCPU is reset, it may
be stale after an incoming migration, kvm_arch_put_registers() may
end up failing or putting vCPU in a weird state.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/kvm/kvm.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index f148a6d52fa4..4f8dacc1d4b5 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1695,6 +1695,30 @@ static void kvm_init_xsave(CPUX86State *env)
            env->xsave_buf_len);
 }
 
+static void kvm_init_nested_state(CPUX86State *env)
+{
+    struct kvm_vmx_nested_state_hdr *vmx_hdr;
+    uint32_t size;
+
+    if (!env->nested_state) {
+        return;
+    }
+
+    size = env->nested_state->size;
+
+    memset(env->nested_state, 0, size);
+    env->nested_state->size = size;
+
+    if (cpu_has_vmx(env)) {
+        env->nested_state->format = KVM_STATE_NESTED_FORMAT_VMX;
+        vmx_hdr = &env->nested_state->hdr.vmx;
+        vmx_hdr->vmxon_pa = -1ull;
+        vmx_hdr->vmcs12_pa = -1ull;
+    } else if (cpu_has_svm(env)) {
+        env->nested_state->format = KVM_STATE_NESTED_FORMAT_SVM;
+    }
+}
+
 int kvm_arch_init_vcpu(CPUState *cs)
 {
     struct {
@@ -2122,19 +2146,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
         assert(max_nested_state_len >= offsetof(struct kvm_nested_state, data));
 
         if (cpu_has_vmx(env) || cpu_has_svm(env)) {
-            struct kvm_vmx_nested_state_hdr *vmx_hdr;
-
             env->nested_state = g_malloc0(max_nested_state_len);
             env->nested_state->size = max_nested_state_len;
 
-            if (cpu_has_vmx(env)) {
-                env->nested_state->format = KVM_STATE_NESTED_FORMAT_VMX;
-                vmx_hdr = &env->nested_state->hdr.vmx;
-                vmx_hdr->vmxon_pa = -1ull;
-                vmx_hdr->vmcs12_pa = -1ull;
-            } else {
-                env->nested_state->format = KVM_STATE_NESTED_FORMAT_SVM;
-            }
+            kvm_init_nested_state(env);
         }
     }
 
@@ -2199,6 +2214,8 @@ void kvm_arch_reset_vcpu(X86CPU *cpu)
     /* enabled by default */
     env->poll_control_msr = 1;
 
+    kvm_init_nested_state(env);
+
     sev_es_set_reset_vector(CPU(cpu));
 }
 
-- 
2.37.1


