Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8C75071CF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 17:29:25 +0200 (CEST)
Received: from localhost ([::1]:41516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngpnA-0002RK-Gh
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 11:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ngpfi-0002EH-Cq
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 11:21:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ngpAQ-0008JS-Dq
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 10:49:23 -0400
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-OEfzg0R8OhC3VpL7myIw4g-1; Tue, 19 Apr 2022 10:48:30 -0400
X-MC-Unique: OEfzg0R8OhC3VpL7myIw4g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A9161014A6C
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 14:48:05 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.194.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BB0440D282A;
 Tue, 19 Apr 2022 14:48:03 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 0/5] i386: Enable newly introduced KVM Hyper-V
 enlightenments
Date: Tue, 19 Apr 2022 16:47:58 +0200
Message-Id: <20220419144803.1698337-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marcelo Tosatti <mtosatti@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a continuation of "[PATCH v2 0/3] i386: Add support for Hyper-V
Enlightened MSR-Bitmap and XMM fast hypercall input features":
https://lore.kernel.org/qemu-devel/20220217142949.297454-1-vkuznets@redhat.com/
work which wasn't merged for 7.0, thus 'v3'.

This series enables four new KVM Hyper-V enlightenmtes:

'XMM fast hypercall input feature' is supported by KVM since v5.14,
it allows for faster Hyper-V hypercall processing.

'Enlightened MSR-Bitmap' is a new nested specific enlightenment speeds up
L2 vmexits by avoiding unnecessary updates to L2 MSR-Bitmap. KVM support
for the feature on Intel CPUs is in v5.17 and in  5.18 for AMD CPUs.

'Extended GVA ranges for TLB flush hypercalls' indicates that extended GVA
ranges are allowed to be passed to Hyper-V TLB flush hypercalls.

'Direct TLB flush hypercall' features allows L0 (KVM) to directly handle 
L2's TLB flush hypercalls without the need to exit to L1 (Hyper-V).

The last two features are not merged in KVM yet:
https://lore.kernel.org/kvm/20220414132013.1588929-1-vkuznets@redhat.com/
however, there's no direct dependency on the kernel part as thanks to
KVM_GET_SUPPORTED_HV_CPUID no new capabilities are introduced.

Vitaly Kuznetsov (5):
  i386: Use hv_build_cpuid_leaf() for HV_CPUID_NESTED_FEATURES
  i386: Hyper-V Enlightened MSR bitmap feature
  i386: Hyper-V XMM fast hypercall input feature
  i386: Hyper-V Support extended GVA ranges for TLB flush hypercalls
  i386: Hyper-V Direct TLB flush hypercall

 docs/hyperv.txt                | 34 ++++++++++++++++++++++
 target/i386/cpu.c              |  8 +++++
 target/i386/cpu.h              |  5 +++-
 target/i386/kvm/hyperv-proto.h |  9 +++++-
 target/i386/kvm/kvm.c          | 53 +++++++++++++++++++++++++++++-----
 5 files changed, 99 insertions(+), 10 deletions(-)

-- 
2.35.1


