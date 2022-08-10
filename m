Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BD258EDFD
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 16:14:01 +0200 (CEST)
Received: from localhost ([::1]:43858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLmTA-0000Iy-Hn
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 10:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1oLmGw-0003zG-Nz
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 10:01:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1oLmGt-0003kz-8k
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 10:01:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660140078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0tdCM5vKV1BcfXVNshc9f+y0jmZSwpZA+iGbwzlc/zQ=;
 b=UvY10FI3Xow8KxEequfKkdcdszLTxyIdemChuOKCsJQsAY51kR7er7aTWglWuejg/IY/jI
 sjXhZqvBw5WmLde/FJCXgfc53ua4+lwmC9/OuPrsqar5zxhl0VCm/Eiz2Edhe5Wniw8KcN
 nw5nHBb3IZXgyjKWdf6P3eTylfIiEbk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-sck4XjFrN8CREdUrT3bN9w-1; Wed, 10 Aug 2022 10:00:13 -0400
X-MC-Unique: sck4XjFrN8CREdUrT3bN9w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1410F8037A9;
 Wed, 10 Aug 2022 14:00:12 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.194.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 326D5492C3B;
 Wed, 10 Aug 2022 14:00:11 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Subject: [PATCH RFC v1 2/2] i386: reorder kvm_put_sregs2() and
 kvm_put_nested_state() when vCPU is reset
Date: Wed, 10 Aug 2022 16:00:07 +0200
Message-Id: <20220810140007.1036293-3-vkuznets@redhat.com>
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

Setting nested state upon migration needs to happen after kvm_put_sregs2()
to e.g. have EFER.SVME set. This, however, doesn't work for vCPU reset:
when vCPU is in VMX root operation, certain CR bits are locked and
kvm_put_sregs2() may fail. As nested state is fully cleaned up upon
vCPU reset (kvm_arch_reset_vcpu() -> kvm_init_nested_state()), calling
kvm_put_nested_state() before kvm_put_sregs2() is OK, this will ensure
that vCPU is *not* in VMX root opertaion.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/kvm/kvm.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 4f8dacc1d4b5..73e3880fa57b 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -4529,18 +4529,34 @@ int kvm_arch_put_registers(CPUState *cpu, int level)
 
     assert(cpu_is_stopped(cpu) || qemu_cpu_is_self(cpu));
 
-    /* must be before kvm_put_nested_state so that EFER.SVME is set */
+    /*
+     * When resetting a vCPU, make sure to reset nested state first to
+     * e.g clear VMXON state and unlock certain CR4 bits.
+     */
+    if (level == KVM_PUT_RESET_STATE) {
+        ret = kvm_put_nested_state(x86_cpu);
+        if (ret < 0) {
+            return ret;
+        }
+    }
+
     ret = has_sregs2 ? kvm_put_sregs2(x86_cpu) : kvm_put_sregs(x86_cpu);
     if (ret < 0) {
         return ret;
     }
 
-    if (level >= KVM_PUT_RESET_STATE) {
+    /*
+     * When putting full CPU state, kvm_put_nested_state() must happen after
+     * kvm_put_sregs{,2} so that e.g. EFER.SVME is already set.
+     */
+    if (level == KVM_PUT_FULL_STATE) {
         ret = kvm_put_nested_state(x86_cpu);
         if (ret < 0) {
             return ret;
         }
+    }
 
+    if (level >= KVM_PUT_RESET_STATE) {
         ret = kvm_put_msr_feature_control(x86_cpu);
         if (ret < 0) {
             return ret;
-- 
2.37.1


