Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A39C04DD61A
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 09:28:13 +0100 (CET)
Received: from localhost ([::1]:34280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nV7xz-0007e9-S3
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 04:28:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1nV7ts-0005dg-T5
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 04:23:56 -0400
Received: from mga14.intel.com ([192.55.52.115]:23478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1nV7tq-0002ID-AS
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 04:23:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647591834; x=1679127834;
 h=from:to:cc:subject:date:message-id;
 bh=i/JJFLyJDjFn1s9WmE8jwULfMKu8AvMeotO8o1pccgA=;
 b=DGrWqj/7UUgzSO5RcI1Cxt9yIh0QYaKWnGS+uPaKHjIsJobLbn25VSwj
 P6NDsFNeaqoRjaIEbYT3Zt9SWDD9epd8hnT4dkmRV6Q6Ke5D1pLeMVbcQ
 nbQtpEnAMdtTKDXmuJuCIYSQg0JcCUjdcW02ROZ3xJOKrav7OxJxD2H7z
 9IkpwBVhtXpW086wPZgVuEWDjqCvnzill7ixzIoNOU1BDRq+BMyGbxvVu
 HyHKpDyeEp/vEuKIr3oMy3sTbNX0IyDMgcWFVnIDszqOWuafdh5eReySm
 FcfEGPyqrey4SMKp2uVzroV7sG4MOHoyIASLUJxs8cLhEnLhbwnb/UjYL w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="257280663"
X-IronPort-AV: E=Sophos;i="5.90,191,1643702400"; d="scan'208";a="257280663"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 01:23:50 -0700
X-IronPort-AV: E=Sophos;i="5.90,191,1643702400"; d="scan'208";a="558320543"
Received: from chenyi-pc.sh.intel.com ([10.239.159.73])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 01:23:47 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Subject: [PATCH v2 0/3] Enable notify VM exit
Date: Fri, 18 Mar 2022 16:29:31 +0800
Message-Id: <20220318082934.25030-1-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=chenyi.qiang@intel.com; helo=mga14.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Chenyi Qiang <chenyi.qiang@intel.com>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Notify VM exit is introduced to mitigate the potential DOS attach from
malicious VM. This series is the userspace part to enable this feature
through a new KVM capability KVM_CAP_X86_NOTIFY_VMEXIT. The
corresponding KVM patch series is available at

https://lore.kernel.org/lkml/20220318074955.22428-1-chenyi.qiang@intel.com/

---
Change logs:
v1 -> v2
- Add some commit message to explain why we disable Notify VM exit by default.
- Rename KVM_VCPUEVENT_SHUTDOWN to KVM_VCPUEVENT_TRIPLE_FAULT.
- Do the corresponding change to use the KVM_VCPUEVENTS_TRIPLE_FAULT
  to save/restore the triple fault event to avoid lose some synthesized
  triple fault from KVM.
- v1: https://lore.kernel.org/qemu-devel/20220310090205.10645-1-chenyi.qiang@intel.com/

---

Chenyi Qiang (3):
  linux-headers: Sync the linux headers
  i386: kvm: Save&restore triple fault event
  i386: Add notify VM exit support

 hw/i386/x86.c               | 24 +++++++++++++
 include/hw/i386/x86.h       |  3 ++
 linux-headers/asm-x86/kvm.h |  4 +++
 linux-headers/linux/kvm.h   | 29 +++++++++++++---
 target/i386/cpu.c           |  1 +
 target/i386/cpu.h           |  1 +
 target/i386/kvm/kvm.c       | 68 ++++++++++++++++++++++++++-----------
 7 files changed, 105 insertions(+), 25 deletions(-)

-- 
2.17.1


