Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6403509A03
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 09:58:59 +0200 (CEST)
Received: from localhost ([::1]:35056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhRiN-0006Ng-1x
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 03:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1nhRLV-0005oh-Os
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 03:35:22 -0400
Received: from mga02.intel.com ([134.134.136.20]:61327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1nhRLS-0007Vh-Gt
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 03:35:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650526518; x=1682062518;
 h=from:to:cc:subject:date:message-id;
 bh=RYpKhYSMq8eLjdVzyNHf0E3ErJBgLIYFUFJXCz7oYy0=;
 b=nrcAMoeIq3UxkmmpzeNK+24wdAWfvNM5BjnhxHtVtJ77MA7VbWMTYGH4
 O9aZo3Kr+cfC2HMxGOGcjekDWHLWCXPXCrpoC3tLW5KNDkaZ97vuX+fSg
 kFgZS0VoqzyZ4ITLs3Q5yCHwmC1HalYv/4H+ERID5PK6UOWe4IaKsIluH
 M541VXBOpoAwTmbtDRb0OeWDQJhcvEjvSDR18niXn2IjbIaUYjAItNaQJ
 ihCEXZuRvW7r9zk/9oPOOCmWGs9wdoLNM3OMN1Gam7aVN87bDU7/ydXs3
 Uat7ISeELK27JnFYrxB6n6oKnMZSYnobS5UlS8Ds/zJkG1c9KJ62TTFfc w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="251582544"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="251582544"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 00:35:14 -0700
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="530155117"
Received: from chenyi-pc.sh.intel.com ([10.239.159.73])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 00:35:12 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Subject: [PATCH v3 0/3] Enable notify VM exit
Date: Thu, 21 Apr 2022 15:40:25 +0800
Message-Id: <20220421074028.18196-1-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=chenyi.qiang@intel.com; helo=mga02.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Notify VM exit is introduced to mitigate the potential DOS attach from
malicious VM. This series is the userspace part to enable this feature
through a new KVM capability KVM_CAP_X86_NOTIFY_VMEXIT. The detailed
info can be seen in Patch 3.

The corresponding KVM patches are avaiable at:
https://lore.kernel.org/lkml/20220421072958.16375-1-chenyi.qiang@intel.com/

---
Change logs:
v2 -> v3
- Extend the argument to include both the notify window and some flags
  when enabling KVM_CAP_X86_BUS_LOCK_EXIT CAP.
- Change to use KVM_VCPUEVENTS_VALID_TRIPLE_FAULT in flags field and add
  pending_triple_fault field in struct kvm_vcpu_events.
- v2: https://lore.kernel.org/qemu-devel/20220318082934.25030-1-chenyi.qiang@intel.com/

v1 -> v2
- Add some commit message to explain why we disable Notify VM exit by default.
- Rename KVM_VCPUEVENT_SHUTDOWN to KVM_VCPUEVENT_TRIPLE_FAULT.
- Do the corresponding change to use the KVM_VCPUEVENTS_TRIPLE_FAULT
  to save/restore the triple fault event to avoid lose some synthesized
  triple fault from KVM.
- v1: https://lore.kernel.org/qemu-devel/20220310090205.10645-1-chenyi.qiang@intel.com/

---

Chenyi Qiang (3):
  linux-header: update linux header
  i386: kvm: Save&restore triple fault event
  i386: Add notify VM exit support

 hw/i386/x86.c               | 45 ++++++++++++++++++++++++
 include/hw/i386/x86.h       |  5 +++
 linux-headers/asm-x86/kvm.h |  4 ++-
 linux-headers/linux/kvm.h   | 10 ++++++
 target/i386/cpu.c           |  1 +
 target/i386/cpu.h           |  1 +
 target/i386/kvm/kvm.c       | 70 ++++++++++++++++++++++++++-----------
 7 files changed, 114 insertions(+), 22 deletions(-)

-- 
2.17.1


