Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A7C5B9763
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 11:27:25 +0200 (CEST)
Received: from localhost ([::1]:49250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYl9Y-0001of-9y
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 05:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1oYl4I-0005r9-Ht
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 05:21:59 -0400
Received: from mga18.intel.com ([134.134.136.126]:26529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1oYl4G-000425-0Z
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 05:21:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663233715; x=1694769715;
 h=from:to:cc:subject:date:message-id;
 bh=SkR324RLMMkIUWiv3hw1YvNe88zTRhG2iEk5umz+KYg=;
 b=dODB+O/5f1Zj50d+xp1lpT/fSRCYB+WVCteUFNTCzIJYLC+MN9bazNAJ
 5bqiSpVB4vJtWU4p23DmmimYbP67boBVHfUW5ouIQVj8HmMuICPMJ9TWh
 rkVNz0/jC6W4IyElq3g2fJjYDfL6j8gW6jZMjL09nKsTJUsl7J/1P+vFj
 9UazHKMgvPrboUbE3c+dbf4CXzh30TGspq05XSuMTaImjvtK5gxo1cTdM
 PhPiIGLI7c5dY6Sc4Cw+JsXGqKztNYluDPq9fSarY462v7OHtG1fJLATG
 0EnZ1TOfpOZt6IP+Yi1mvNgH5YfJyNM6iXGGbUgNSdVXuadTWgOxACqi/ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="281694375"
X-IronPort-AV: E=Sophos;i="5.93,317,1654585200"; d="scan'208";a="281694375"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 02:21:52 -0700
X-IronPort-AV: E=Sophos;i="5.93,317,1654585200"; d="scan'208";a="759563761"
Received: from chenyi-pc.sh.intel.com ([10.239.159.73])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 02:21:50 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Chenyi Qiang <chenyi.qiang@intel.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Subject: [PATCH v6 0/2] Enable notify VM exit
Date: Thu, 15 Sep 2022 17:28:37 +0800
Message-Id: <20220915092839.5518-1-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=chenyi.qiang@intel.com; helo=mga18.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Notify VM exit is introduced to mitigate the potential DOS attach from
malicious VM. This series is the userspace part to enable this feature
through a new KVM capability KVM_CAP_X86_NOTIFY_VMEXIT. The detailed
info can be seen in Patch 3.

The corresponding KVM support can be found in linux 6.0-rc1:
(2f4073e08f4c KVM: VMX: Enable Notify VM exit)

This patch set depends on some definition which can be updated from
scripts/update-linux-headers.sh. A separate patch set is sent out at
https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg02102.html

---
Change logs:
v5 -> v6
- Add some info related to the valid range of notify_window in patch 2. (Peter Xu)
- Add the doc in qemu-options.hx. (Peter Xu)
- v5: https://lore.kernel.org/qemu-devel/20220817020845.21855-1-chenyi.qiang@intel.com/

v4 -> v5
- Remove the assert check to avoid the nop in NDEBUG case. (Yuan)
- v4: https://lore.kernel.org/qemu-devel/20220524140302.23272-1-chenyi.qiang@intel.com/

v3 -> v4
- Add a new KVM cap KVM_CAP_TRIPLE_FAULT_EVENT to guard the extension of triple fault
  event save&restore.
- v3: https://lore.kernel.org/qemu-devel/20220421074028.18196-1-chenyi.qiang@intel.com/

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

Chenyi Qiang (2):
  i386: kvm: extend kvm_{get, put}_vcpu_events to support pending triple
    fault
  i386: Add notify VM exit support

 hw/i386/x86.c         | 45 ++++++++++++++++++++++++++++++++++++++++
 include/hw/i386/x86.h |  5 +++++
 qemu-options.hx       | 10 ++++++++-
 target/i386/cpu.c     |  1 +
 target/i386/cpu.h     |  1 +
 target/i386/kvm/kvm.c | 48 +++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 109 insertions(+), 1 deletion(-)

-- 
2.17.1


