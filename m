Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2466658EDF6
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 16:10:38 +0200 (CEST)
Received: from localhost ([::1]:35286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLmPt-0002QR-8d
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 10:10:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1oLmGt-0003xn-UZ
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 10:01:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1oLmGq-0003jU-KW
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 10:01:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660140075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LM8c/jWXyXKqoRGbEn4UjoYfT1Bt7f+6TSrH0a9BBwQ=;
 b=DhkPry78vJW6J57PamUmYDFL0Qpyi4s80EOiGnmqKbOdqWDvcDkV5jAazyY0wnpyuhL1ju
 3Fz4udxV5b1VwPABd+GeDb5s0ZzIzTy9OlsOTIceAHxHUQg8hVYLvMVFuCEMcZ1iNK7/RD
 RE3G66LkLMztEynhVAfTnV0U2xdpNCg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-171-1iVAiYPwOpuragkXVqC6rA-1; Wed, 10 Aug 2022 10:00:09 -0400
X-MC-Unique: 1iVAiYPwOpuragkXVqC6rA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6556718F0244;
 Wed, 10 Aug 2022 14:00:09 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.194.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7163A492C3B;
 Wed, 10 Aug 2022 14:00:08 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Subject: [PATCH RFC v1 0/2] i386: KVM: Fix 'system_reset' failures when vCPU
 is in VMX root operation
Date: Wed, 10 Aug 2022 16:00:05 +0200
Message-Id: <20220810140007.1036293-1-vkuznets@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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

It was discovered that Windows 11 with WSL2 (Hyper-V) enabled guests fail
to reboot when QEMU's 'system_reset' command is issued. The problem appears
to be that KVM_SET_SREGS2 fails because zeroed CR4 register value doesn't
pass vmx_is_valid_cr4() check in KVM as certain bits can't be zero while in
VMX root operation (post-VMXON). kvm_arch_put_registers() does call 
kvm_put_nested_state() which is supposed to kick vCPU out of VMX root
operation, however, it only does so after kvm_put_sregs2() and there's
a good reason for that: 'real' nested state requires e.g. EFER.SVME to
be set. While swapping kvm_put_sregs2()/kvm_put_nested_state() order
in kvm_arch_put_registers() can't be done in KVM_PUT_FULL_STATE case,
doing it in KVM_PUT_RESET_STATE seems like a reasonable band aid.

The root cause of the issue seems to be that QEMU is doing quite a lot
to forcefully reset a vCPU as KVM doesn't export kvm_vcpu_reset() (or,
rather, it's super-set) yet. While all the numerous existing APIs for
setting a vCPU state work fine for a newly created vCPU, using them for
vCPU reset is a mess caused by various dependencies between different
components of the state (VMX, SMM, MSRs, XCRs, CPUIDs, ...). It would've
been possible to allow to set 'inconsistent' state and only validate it
upon VCPU_RUN from the very beginning but that ship has long sailed for
KVM. A new, dedicated API for vCPU reset is likely the way to go.

RFC part: the immediate issue could've probably been solved in KVM too
by avoiding vmx_is_valid_cr4() check from __set_sregs2() and hoping that
someone will check for the resulting inconsistency later. I don't quite
like this option so I didn't explore it in depth.

Vitaly Kuznetsov (2):
  i386: reset KVM nested state upon CPU reset
  i386: reorder kvm_put_sregs2() and kvm_put_nested_state() when vCPU is
    reset

 target/i386/kvm/kvm.c | 57 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 45 insertions(+), 12 deletions(-)

-- 
2.37.1


