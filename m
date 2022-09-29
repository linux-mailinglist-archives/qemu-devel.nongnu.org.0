Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 114C45EEF05
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 09:30:23 +0200 (CEST)
Received: from localhost ([::1]:46936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odnzy-0006qb-3r
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 03:30:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1odnkB-00049Y-Gx
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 03:14:03 -0400
Received: from mga04.intel.com ([192.55.52.120]:1937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1odnk8-0003qj-U3
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 03:14:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664435640; x=1695971640;
 h=from:to:cc:subject:date:message-id;
 bh=nwY5bmJV6FRcP6uUqHV21Hqn9xma6O1iWPE5VL+dj9s=;
 b=my+b7OmeFUBSE8enBaDnaRBuYijQ01WUdoWzq8mmp4DJPyT7IpSj9HjA
 BkIWzpFv1YRYVtmKevYGw+hplAiAI9W6vikSFRXddghGa334+OOkG1zwH
 AqYKXxgHSAIypCGRaRs3v/Zz3Cl4ZUXNFTu5cn2O7RkNsZ6RY/lQ/pQ/B
 pJ4FNeeQGNamj3MIQ9XJnTaRJyB5hmuvew/eh4/5RYHeqzMJObEYApLI+
 wrFCSG6/mUYnJ5JF0ljJjanZSWRkYj+8ovJQvqFP0nSrH09t0B+LqxQFK
 dJvd28M/RMhsW8+J6zpOBoSOn6ZylvatswciAQ4GF0DMuxAni+UEH9DAk Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="300534104"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; d="scan'208";a="300534104"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 00:13:58 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="655440710"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; d="scan'208";a="655440710"
Received: from chenyi-pc.sh.intel.com ([10.239.159.53])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 00:13:56 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Chenyi Qiang <chenyi.qiang@intel.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Subject: [RESEND PATCH v8 0/4] Enable notify VM exit
Date: Thu, 29 Sep 2022 15:20:10 +0800
Message-Id: <20220929072014.20705-1-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=192.55.52.120;
 envelope-from=chenyi.qiang@intel.com; helo=mga04.intel.com
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

There's a minor issue in previous version. Sorry for that and please
ignore that version. Resend the patch set.

---

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
 target/i386/kvm/kvm.c    | 122 +++++++++++++++++++++++++++++++++++++++
 target/i386/machine.c    |  20 +++++++
 target/mips/kvm.c        |   4 ++
 target/ppc/kvm.c         |   4 ++
 target/riscv/kvm.c       |   4 ++
 target/s390x/kvm/kvm.c   |   4 ++
 14 files changed, 273 insertions(+), 74 deletions(-)

-- 
2.17.1


