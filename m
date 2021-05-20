Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E963389D3D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 07:46:07 +0200 (CEST)
Received: from localhost ([::1]:53254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljbVV-0007fd-Pm
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 01:46:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1ljbTD-00055J-QI
 for qemu-devel@nongnu.org; Thu, 20 May 2021 01:43:43 -0400
Received: from mga06.intel.com ([134.134.136.31]:7412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1ljbTA-000736-KS
 for qemu-devel@nongnu.org; Thu, 20 May 2021 01:43:43 -0400
IronPort-SDR: ibMHIsAgqi3piVotp4bKVdvqbZkfdhdsaAeBXM9rj2CJXhgQPoNevbJRt4mgYAdVfnRhZTtPUc
 QxHADfuH1SMg==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="262370927"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="262370927"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 22:43:33 -0700
IronPort-SDR: n3O+14PWJTQ0MUWrvf08martYtv6lVc7Ru0hSuFsbqGNNwijTesT7KnPeBMwwphR8dqN0Y+vU2
 pNo0HELEKDXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="440160277"
Received: from michael-optiplex-9020.sh.intel.com ([10.239.159.172])
 by fmsmga008.fm.intel.com with ESMTP; 19 May 2021 22:43:31 -0700
From: Yang Weijiang <weijiang.yang@intel.com>
To: pbonzini@redhat.com, ehabkost@redhat.com, mtosatti@redhat.com,
 seanjc@google.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Subject: [PATCH v8 0/6] Enable CET support for guest
Date: Thu, 20 May 2021 13:57:05 +0800
Message-Id: <1621490231-4765-1-git-send-email-weijiang.yang@intel.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=weijiang.yang@intel.com; helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Return/Jump-Oriented Programming (ROP/JOP). It includes two features:
Shadow Stack(SHSTK) and Indirect Branch Tracking(IBT).
This patch series is to enable CET related CPUID report, XSAVES/XRSTORS
support and MSR access etc. for guest.

Change in v8:
- Extended xsave_area_size() to accommodate compacted format size calculation.
- Added CPUID(0xD,1).EBX assigment per maintain's feedback.
- Changed XSS field check and added more comments to make things clearer.
- Other ajustment per maintainer's review feedback.
- Rebased to 6.0.0.

v7 patch:
https://lore.kernel.org/kvm/20210226022058.24562-1-weijiang.yang@intel.com

CET KVM patches:
https://git.kernel.org/pub/scm/virt/kvm/kvm.git/log/?h=intel

CET kernel patches:
https://lkml.kernel.org/r/20210427204315.24153-1-yu-cheng.yu@intel.com


Yang Weijiang (6):
  target/i386: Change XSAVE related feature-word names
  target/i386: Enable XSS feature CPUID enumeration
  target/i386: Enable XSAVES support for CET states
  target/i386: Add user-space MSR access interface for CET
  target/i386: Add CET state support for guest migration
  target/i386: Advise CET bits in CPU/MSR feature words

 target/i386/cpu.c     | 138 +++++++++++++++++++++++++++++-------
 target/i386/cpu.h     |  52 +++++++++++++-
 target/i386/kvm/kvm.c |  72 +++++++++++++++++++
 target/i386/machine.c | 161 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 395 insertions(+), 28 deletions(-)

-- 
2.26.2


