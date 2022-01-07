Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8524C4874D9
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 10:37:39 +0100 (CET)
Received: from localhost ([::1]:60876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5lgo-0003ft-CW
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 04:37:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1n5lbK-0005wu-L2
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 04:32:02 -0500
Received: from mga05.intel.com ([192.55.52.43]:22251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1n5lbH-00077l-IF
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 04:31:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641547915; x=1673083915;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EqCmNFZK2aUWjq5baKwN7Cf9hlTO2Dlb4RVf8oPwhEA=;
 b=n+rQKok7tmM/faindBCTYB/k6m+qnzYU4QXRfRVDRyUUKSdhjfj2hhpc
 UJFd8SUUomcIbujaKK9aKTe6JzpEn5XmIMziRQfQ3p3KvVk4GSe2P/rn5
 6z5UxoH65qvOWtSIwgumoDf00OntFq5tq24/1fpR1wQMUZzH8M49mjih3
 ACt0JGB8m5FEZME4NjGXWJuoG4+dnk+DupXQxxVM5GWkbznNvfGs3EeoO
 ZNxmRuPWTTsEjYqj+M2U9IcOEzNkmTWcep2tIxaHNspgRCBshPQmaa1wI
 TmoLxeqMTAInhm+ZPzN4EQ7hm9x/JvmNR/+ZVIu2FqeeNXIVRK2ne4rRG A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="329184199"
X-IronPort-AV: E=Sophos;i="5.88,269,1635231600"; d="scan'208";a="329184199"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 01:31:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,269,1635231600"; d="scan'208";a="527239097"
Received: from 984fee00bf64.jf.intel.com ([10.165.54.77])
 by fmsmga007.fm.intel.com with ESMTP; 07 Jan 2022 01:31:41 -0800
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/7] AMX support in Qemu
Date: Fri,  7 Jan 2022 01:31:27 -0800
Message-Id: <20220107093134.136441-1-yang.zhong@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=yang.zhong@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: yang.zhong@intel.com, kevin.tian@intel.com, seanjc@google.com,
 jing2.liu@linux.intel.com, wei.w.wang@intel.com, guang.zeng@intel.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Intel introduces Advanced Matrix Extensions (AMX) [1] feature that
consists of configurable two-dimensional "TILE" registers and new
accelerator instructions that operate on them. TMUL (Tile matrix
MULtiply) is the first accelerator instruction set to use the new
registers.

This series is based on the AMX KVM series [2] and exposes AMX feature
to guest (The detailed design discussions can be found in [3]).

According to the KVM design, the userspace VMM (e.g. Qemu) is expected
to request guest permission for the dynamically-enabled XSAVE features
only once when the first vCPU is created, and KVM checks guest permission
in KVM_SET_CPUID2.

Intel AMX is XSAVE supported and XSAVE enabled. Those extended features
has large state while current kvm_xsave only allows 4KB. The AMX KVM has
extended struct kvm_xsave to meet this requirenment and added one extra
KVM_GET_XSAVE2 ioctl to handle extended features. From our test, the AMX
live migration work well.

Notice: This version still includes some definitions in the linux-headers,
once AMX KVM is merged and Qemu sync those linux-headers, I will remove
those definitions. So please ignore those changes.

[1] Intel Architecture Instruction Set Extension Programming Reference
    https://software.intel.com/content/dam/develop/external/us/en/documents/\
    architecture-instruction-set-extensions-programming-reference.pdf
[2] https://www.spinics.net/lists/kvm/msg263577.html
[3] https://www.spinics.net/lists/kvm/msg259015.html

Thanks,
Yang
----

Jing Liu (5):
  x86: Fix the 64-byte boundary enumeration for extended state
  x86: Add AMX XTILECFG and XTILEDATA components
  x86: Add XFD faulting bit for state components
  x86: Add AMX CPUIDs enumeration
  x86: Use new XSAVE ioctls handling

Yang Zhong (1):
  x86: Grant AMX permission for guest

Zeng Guang (1):
  x86: Support XFD and AMX xsave data migration

 linux-headers/asm-x86/kvm.h | 14 ++++++++
 linux-headers/linux/kvm.h   |  2 ++
 target/i386/cpu.h           | 40 ++++++++++++++++++++++-
 hw/i386/x86.c               | 28 ++++++++++++++++
 target/i386/cpu.c           | 64 +++++++++++++++++++++++++++++++++++--
 target/i386/kvm/kvm-cpu.c   |  4 +++
 target/i386/kvm/kvm.c       | 37 +++++++++++++++++++--
 target/i386/machine.c       | 42 ++++++++++++++++++++++++
 target/i386/xsave_helper.c  | 35 ++++++++++++++++++++
 9 files changed, 259 insertions(+), 7 deletions(-)


