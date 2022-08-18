Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 418525986D6
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 17:06:35 +0200 (CEST)
Received: from localhost ([::1]:59298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOh6Q-0000nH-3T
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 11:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1oOh1R-0003vO-LC
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 11:01:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1oOh1O-0004Tg-Kf
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 11:01:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660834877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uPup01qF1emgsUXVQK71huvudaiUaPDSW2n0MH/qlCI=;
 b=VTdz3SihdZlfR97JIlKMmRkfkCR2hLofzHktLDkO/1y0yC4ScMa3z51EZkX6AFo1pSMP1W
 RZHC9njyO/gC/jIgrXzIs0/T173FK85lm1AetXFqSFQtc6+cnkqtwpxQyz2KOwhr9s2+f5
 qtESNes0zDpL+T1jw6rzIHkr8Uo4oFA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-404-wVuGaDj5PsiMXoVnvU9r3w-1; Thu, 18 Aug 2022 11:01:15 -0400
X-MC-Unique: wVuGaDj5PsiMXoVnvU9r3w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 437B83826250;
 Thu, 18 Aug 2022 15:01:15 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.194.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58AC6404C6E3;
 Thu, 18 Aug 2022 15:01:14 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Maxim Levitsky <mlevitsk@redhat.com>,
 Sean Christopherson <seanjc@google.com>
Subject: [PATCH v1 0/2] i386: KVM: Fix 'system_reset' failures when vCPU is in
 VMX root operation
Date: Thu, 18 Aug 2022 17:01:11 +0200
Message-Id: <20220818150113.479917-1-vkuznets@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Changes since RFC:
- Call kvm_put_msr_feature_control() before kvm_put_sregs2() to achieve
 the same result [Paolo].
- Add Maxim's R-b to PATCH1.

It was discovered that Windows 11 with WSL2 (Hyper-V) enabled guests fail
to reboot when QEMU's 'system_reset' command is issued. The problem appears
to be that KVM_SET_SREGS2 fails because zeroed CR4 register value doesn't
pass vmx_is_valid_cr4() check in KVM as certain bits can't be zero while in
VMX root operation (post-VMXON). kvm_arch_put_registers() does call 
kvm_put_nested_state() which is supposed to kick vCPU out of VMX root
operation, however, it only does so after kvm_put_sregs2() and there's
a good reason for that: 'real' nested state requires e.g. EFER.SVME to
be set. 

The root cause of the issue seems to be that QEMU is doing quite a lot
to forcefully reset a vCPU as KVM doesn't export kvm_vcpu_reset() (or,
rather, it's super-set) yet. While all the numerous existing APIs for
setting a vCPU state work fine for a newly created vCPU, using them for
vCPU reset is a mess caused by various dependencies between different
components of the state (VMX, SMM, MSRs, XCRs, CPUIDs, ...). It would've
been possible to allow to set 'inconsistent' state and only validate it
upon VCPU_RUN from the very beginning but that ship has long sailed for
KVM. A new, dedicated API for vCPU reset is likely the way to go.

Resolve the immediate issue by setting MSR_IA32_FEATURE_CONTROL before
kvm_put_sregs2() (and kvm_put_nested_state()), this ensures vCPU gets
kicked out of VMX root operation.

Vitaly Kuznetsov (2):
  i386: reset KVM nested state upon CPU reset
  i386: do kvm_put_msr_feature_control() first thing when vCPU is reset

 target/i386/kvm/kvm.c | 54 +++++++++++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 15 deletions(-)

-- 
2.37.1


