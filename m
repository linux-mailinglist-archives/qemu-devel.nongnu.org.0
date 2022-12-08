Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0713B646924
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 07:27:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3ALv-0000kX-ED; Thu, 08 Dec 2022 01:25:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1p3ALY-0000hd-PE
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 01:25:29 -0500
Received: from mga17.intel.com ([192.55.52.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1p3ALU-0005LP-S3
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 01:25:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670480724; x=1702016724;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qDHJxDVeH6abLeuhfZMFLLz0ASkkMeSjff0rLV5DuDQ=;
 b=JiSydj/yZx7bV7fJMLey5b7MkWBEQ/rZikaL2PPAyLAN8WYnIiLEyKW+
 XTdmBBsqyVyomD5Ff3fJRojV68w0QvtgMEf5THv6sv2IaLsrhFCZYjvGo
 q0ffBHBOybcmfDxVAT/d3benW5TwBxqoMhaivG3k1cBdJ3yhnk236MD9T
 7vU6SVksF2LGywWbVVF29DtYHEGaYwyXpAU1cxFD3LnFOajOvCH+0BHCf
 QANP3VgYwB2LVkdk0mJJ6KVtVcD+NUUjS/JfmS3YpzMOxe6VSlLRpvJd7
 3gvDMGWcPn3A89B7ZW0/ShqaKxnPKvKYoF2+MbXw0N+WduU9u8GLSEoMu Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="297444441"
X-IronPort-AV: E=Sophos;i="5.96,226,1665471600"; d="scan'208";a="297444441"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2022 22:25:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="679413372"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="679413372"
Received: from lxy-dell.sh.intel.com ([10.239.48.100])
 by orsmga001.jf.intel.com with ESMTP; 07 Dec 2022 22:25:14 -0800
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
Cc: qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	xiaoyao.li@intel.com
Subject: [PATCH v3 0/8] Make Intel PT configurable
Date: Thu,  8 Dec 2022 14:25:05 +0800
Message-Id: <20221208062513.2589476-1-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=xiaoyao.li@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Initial virtualization of Intel PT was added by making it as fixed
feature set of ICX's capabilities. However, it breaks the Intel PT exposure
on SPR machine because SPR has less PT capabilities of
CPUID(0x14,1):EBX[15:0].

This series aims to make Intel PT configurable that named CPU model can
define its own PT feature set and "-cpu host/max" can use host pass-through
feature set of Intel PT.

At the same time, it also ensures existing named CPU model to generate
the same PT CPUID set as before to not break live migration.

Changes in v3:
- rebase to v7.2.0-rc4
- Add bit 7 and 8 of FEAT_14_0_EBX in Patch 3

v2: https://lore.kernel.org/qemu-devel/20220808085834.3227541-1-xiaoyao.li@intel.com/
Changes in v2:
- split out 3 patches (per Eduardo's comment)
- determine if the named cpu model uses default Intel PT capabilities (to
  be compatible with the old behavior) by condition that all PT feature
  leaves are all zero.

v1: https://lore.kernel.org/qemu-devel/20210909144150.1728418-1-xiaoyao.li@intel.com/

Xiaoyao Li (8):
  target/i386: Print CPUID subleaf info for unsupported feature
  target/i386/intel-pt: Fix INTEL_PT_ADDR_RANGES_NUM_MASK
  target/i386/intel-pt: Introduce FeatureWordInfo for Intel PT CPUID
    leaf 0x14
  target/i386/intel-pt: print special message for
    INTEL_PT_ADDR_RANGES_NUM
  target/i386/intel-pt: Rework/rename the default INTEL-PT feature set
  target/i386/intel-pt: Enable host pass through of Intel PT
  target/i386/intel-pt: Define specific PT feature set for
    IceLake-server and Snowridge
  target/i386/intel-pt: Access MSR_IA32_RTIT_ADDRn based on guest CPUID
    configuration

 target/i386/cpu.c     | 293 +++++++++++++++++++++++++++++++-----------
 target/i386/cpu.h     |  40 +++++-
 target/i386/kvm/kvm.c |   8 +-
 3 files changed, 263 insertions(+), 78 deletions(-)

-- 
2.27.0


