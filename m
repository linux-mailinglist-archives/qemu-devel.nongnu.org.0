Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4F25986C9
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 17:05:58 +0200 (CEST)
Received: from localhost ([::1]:59296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOh5p-0000YA-Mf
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 11:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1oOh1T-0003vo-71
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 11:01:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1oOh1Q-0004h6-5S
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 11:01:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660834882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UOvNvbrnmrXrNsNY3NRg79pd9QJm0H6OxC7D6UNZjGk=;
 b=V60jUV/QE8VZDowoxIUvZY9Mu8F0XdyEUUheDzVa2VBV0YlGI/1cUHzJDlIcR9CIqOnmL+
 5ARZETIdMpRBLviu3PuGt6Wq6Lr7pNEfyn7ciU/n5rCRdfYi9xgIeIZmO2vXb3RXWJUGR3
 /unE5kjYVuWT+rkA8KgT3q/Ly2UcCCY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-onFacnghPzaCFH8JyJtamg-1; Thu, 18 Aug 2022 11:01:19 -0400
X-MC-Unique: onFacnghPzaCFH8JyJtamg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC9F98DC04C;
 Thu, 18 Aug 2022 15:01:18 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.194.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1CBE640CFD05;
 Thu, 18 Aug 2022 15:01:16 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Maxim Levitsky <mlevitsk@redhat.com>,
 Sean Christopherson <seanjc@google.com>
Subject: [PATCH v1 2/2] i386: do kvm_put_msr_feature_control() first thing
 when vCPU is reset
Date: Thu, 18 Aug 2022 17:01:13 +0200
Message-Id: <20220818150113.479917-3-vkuznets@redhat.com>
In-Reply-To: <20220818150113.479917-1-vkuznets@redhat.com>
References: <20220818150113.479917-1-vkuznets@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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

kvm_put_sregs2() fails to reset 'locked' CR4/CR0 bits upon vCPU reset when
it is in VMX root operation. Do kvm_put_msr_feature_control() before
kvm_put_sregs2() to (possibly) kick vCPU out of VMX root operation. It also
seems logical to do kvm_put_msr_feature_control() before
kvm_put_nested_state() and not after it, especially when 'real' nested
state is set.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/kvm/kvm.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 4f8dacc1d4b5..a1fd1f53791d 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -4529,6 +4529,18 @@ int kvm_arch_put_registers(CPUState *cpu, int level)
 
     assert(cpu_is_stopped(cpu) || qemu_cpu_is_self(cpu));
 
+    /*
+     * Put MSR_IA32_FEATURE_CONTROL first, this ensures the VM gets out of VMX
+     * root operation upon vCPU reset. kvm_put_msr_feature_control() should also
+     * preceed kvm_put_nested_state() when 'real' nested state is set.
+     */
+    if (level >= KVM_PUT_RESET_STATE) {
+        ret = kvm_put_msr_feature_control(x86_cpu);
+        if (ret < 0) {
+            return ret;
+        }
+    }
+
     /* must be before kvm_put_nested_state so that EFER.SVME is set */
     ret = has_sregs2 ? kvm_put_sregs2(x86_cpu) : kvm_put_sregs(x86_cpu);
     if (ret < 0) {
@@ -4540,11 +4552,6 @@ int kvm_arch_put_registers(CPUState *cpu, int level)
         if (ret < 0) {
             return ret;
         }
-
-        ret = kvm_put_msr_feature_control(x86_cpu);
-        if (ret < 0) {
-            return ret;
-        }
     }
 
     if (level == KVM_PUT_FULL_STATE) {
-- 
2.37.1


