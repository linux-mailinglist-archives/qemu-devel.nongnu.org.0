Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEC51CC60E
	for <lists+qemu-devel@lfdr.de>; Sun, 10 May 2020 03:42:44 +0200 (CEST)
Received: from localhost ([::1]:57396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jXazL-0005s4-Hw
	for lists+qemu-devel@lfdr.de; Sat, 09 May 2020 21:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1jXay8-0003mR-0t
 for qemu-devel@nongnu.org; Sat, 09 May 2020 21:41:28 -0400
Received: from mga09.intel.com ([134.134.136.24]:59849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1jXay6-0006cQ-FC
 for qemu-devel@nongnu.org; Sat, 09 May 2020 21:41:27 -0400
IronPort-SDR: DnCQf5NIqTA9rE/ARq6MklnCU6gnbTRLNzLFWZLQ2F+A0oJ0kzctr0Y7B27mIRe9OHmlUx3oPM
 Bln/vpwMDiuQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2020 18:41:17 -0700
IronPort-SDR: 9Oo7DWSIenvkoNgKZHxVEu37Emz9H0mP8RIDRLLq8akIIVTEyz09t0dht/nePyDNtoY3IdvD6E
 kvKqkxn0Q3yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,373,1583222400"; d="scan'208";a="264783103"
Received: from unknown (HELO local-michael-cet-test.sh.intel.com)
 ([10.239.159.128])
 by orsmga006.jf.intel.com with ESMTP; 09 May 2020 18:41:15 -0700
From: Yang Weijiang <weijiang.yang@intel.com>
To: qemu-devel@nongnu.org,
	pbonzini@redhat.com
Subject: [Qemu-devel][PATCH v5 0/4] Enable CET support for guest
Date: Sun, 10 May 2020 09:42:46 +0800
Message-Id: <20200510014250.28111-1-weijiang.yang@intel.com>
X-Mailer: git-send-email 2.17.2
Received-SPF: pass client-ip=134.134.136.24;
 envelope-from=weijiang.yang@intel.com; helo=mga09.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/09 21:41:17
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Yang Weijiang <weijiang.yang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Control-flow Enforcement Technology (CET) provides protection against 
return/jump-oriented programming (ROP/JOP). It includes two
sub-features: Shadow Stack(SHSTK) and Indirect Branch Tracking(IBT).
This patchset is to enable CET related CPUID report, XSAVES/XRSTORS
support and MSR access etc. for guest.

CET KVM patches:
https://lkml.kernel.org/r/20200506082110.25441-1-weijiang.yang@intel.com

CET kernel patches:
https://lkml.kernel.org/r/20200429220732.31602-1-yu-cheng.yu@intel.com

v5:
  - Checked CET states before access related MSRs.
  - Added new MSR MSR_KVM_GUEST_SSP for live-migration.
  - Refactored patches to make them more structured.

v4:
  - Added MSR read/write interface for PL1_SSP/PL2_SSP.
  - Removed CET structures from X86XSaveArea.
  - Cleared ebx in return of CPUID.(EAX=d, ECX=1).
 
v3:
  - Add CET MSR save/restore support for live-migration.
 
v2:
  - In CPUID.(EAX=d, ECX=1), set return ECX[n] = 0 if bit n corresponds
    to a bit in MSR_IA32_XSS.
  - In CPUID.(EAX=d, ECX=n), set return ECX = 1 if bit n corresponds
    to a bit in MSR_IA32_XSS.
  - Skip Supervisor mode xsave component when calculate User mode
    xave component size in xsave_area_size() and x86_cpu_reset().

Yang Weijiang (4):
  x86/cpu: Add CET CPUID/XSAVES flags and data structures
  x86/cpuid: Add XSAVES feature words and CET related state bits
  x86/cpuid: Add support for XSAVES dependent feature enumeration
  x86/cpu: Add user space access interface for CET MSRs

 target/i386/cpu.c     |  57 ++++++++++++++-
 target/i386/cpu.h     |  53 ++++++++++++++
 target/i386/kvm.c     |  73 +++++++++++++++++++
 target/i386/machine.c | 161 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 341 insertions(+), 3 deletions(-)

-- 
2.17.2


