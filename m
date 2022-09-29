Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DAF5EEEF5
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 09:27:27 +0200 (CEST)
Received: from localhost ([::1]:59954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odnx7-0003u9-P4
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 03:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1odnTr-0001fk-Df
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 02:57:15 -0400
Received: from mga17.intel.com ([192.55.52.151]:49068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1odnTp-0001Gl-Gc
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 02:57:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664434629; x=1695970629;
 h=from:to:cc:subject:date:message-id;
 bh=rJLbSPcnX3/oXcI+W/wXHWPYmRO1oX+WALuKjgicB3k=;
 b=j1H+4qc2/AcjaLnYFgvSjx4ilQzCEyktIrLoRX4GC2zlDM79su2AXWCV
 38ycwWBRkHNNtxeqf5Vu3F7Zg+FKynxQpka/ZgAeAo6247YGUv8eGFhOV
 ysO/YwmPKlaZU6KKxe3J/k8l4d3UsDBZjePpuV6przEAlXt+ZMvGGX1e8
 UCdq8GfP/O/q5tEV/rh9sVDsAPiMrDSbYvs2DAUtTwyaB1XqJ7qqzUYqu
 YsYgIYrEj+vbkpzUrpw5BuHzUV+RaMsiEXh0Lt4Kay48WyidnXiSXxUIO
 /L7tOpLY4dL2Y3S+Hz3GXlnD6VdqsdVb/bB+l2o74J14+0ZeK1fBi/mTe w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="282178251"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; d="scan'208";a="282178251"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 23:56:44 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="711268467"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; d="scan'208";a="711268467"
Received: from chenyi-pc.sh.intel.com ([10.239.159.53])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 23:56:42 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Chenyi Qiang <chenyi.qiang@intel.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Subject: [PATCH v8 0/4] Enable notify VM exit
Date: Thu, 29 Sep 2022 15:03:37 +0800
Message-Id: <20220929070341.4846-1-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=chenyi.qiang@intel.com; helo=mga17.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
info can be seen in Patch 4.

The corresponding KVM support can be found in linux 6.0-rc:
(2f4073e08f4c KVM: VMX: Enable Notify VM exit)

---
Change logs:
v7 -> v8
- Add triple_fault_pending field transmission on migration (Paolo)
- Change the notify-vmexit and notify-window to the accelerator property. Add it as
  a x86-specific property. (Paolo)
- Add a preparation patch to expose struct KVMState in order to add target-specific property.
- Define three option for notify-vmexit. Make it on by default. (Paolo)
- Raise a KVM internal error instead of triple fault if invalid context of guest VMCS detected.
- v7: https://lore.kernel.org/qemu-devel/20220923073333.23381-1-chenyi.qiang@intel.com/

v6 -> v7
- Add a warning message when exiting to userspace (Peter Xu)
- v6: https://lore.kernel.org/all/20220915092839.5518-1-chenyi.qiang@intel.com/

v5 -> v6
- Add some info related to the valid range of notify_window in patch 2. (Peter Xu)
- Add the doc in qemu-options.hx. (Peter Xu)
- v5: https://lore.kernel.org/qemu-devel/20220817020845.21855-1-chenyi.qiang@intel.com/

---

Chenyi Qiang (3):
  i386: kvm: extend kvm_{get, put}_vcpu_events to support pending triple
    fault
  kvm: expose struct KVMState
  i386: add notify VM exit support

Paolo Bonzini (1):
  kvm: allow target-specific accelerator properties

 accel/kvm/kvm-all.c      |  78 ++-----------------------
 include/sysemu/kvm.h     |   2 +
 include/sysemu/kvm_int.h |  75 ++++++++++++++++++++++++
 qapi/run-state.json      |  17 ++++++
 qemu-options.hx          |  11 ++++
 target/arm/kvm.c         |   4 ++
 target/i386/cpu.c        |   1 +
 target/i386/cpu.h        |   1 +
 target/i386/kvm/kvm.c    | 121 +++++++++++++++++++++++++++++++++++++++
 target/i386/machine.c    |  20 +++++++
 target/mips/kvm.c        |   4 ++
 target/ppc/kvm.c         |   4 ++
 target/riscv/kvm.c       |   4 ++
 target/s390x/kvm/kvm.c   |   4 ++
 14 files changed, 272 insertions(+), 74 deletions(-)

-- 
2.17.1


