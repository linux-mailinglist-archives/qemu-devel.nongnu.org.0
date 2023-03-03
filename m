Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EAE6A915D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 08:01:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXzOU-0000aI-7h; Fri, 03 Mar 2023 01:59:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tao1.su@linux.intel.com>)
 id 1pXzOR-0000Zo-Lz
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 01:59:51 -0500
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tao1.su@linux.intel.com>)
 id 1pXzOP-00057M-9n
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 01:59:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677826789; x=1709362789;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e8uSH6/t/jEPtGPeAauoTGs8zM8UB0hUDAbS1hHFMak=;
 b=brvRafwUbLihZ9HmPUYEvLH+RJX840DLd5ET4vk9p1n0ep/wtrqnTTxQ
 2P+Rtf9iBOvn7y9oP8/BED5QsywWuv6ZhtTsGGKsX0aZVZFdpRuRJ1QFz
 hyCyFW9VwqGQawBXUS1GXyvtO3Koy1lyZmKf9r1OAwUTWA5nckmR2Wg8L
 j7H5+PbpTqw4ZWI2ITJmfG9QFuzt/e8GVE+BLYmm8+wFbQRQ5zAFceS0x
 sO7gthwJgwDBwddvfJI21fklRnPaYSS2/EeKB93lxSbtrUaUlsG5yH+2W
 I1T2G1kLVmq4qVT5Nyg36yV8Uej8vhnPnPVEAVlYUCj1Ufk25PG1ui1dZ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="334995786"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="334995786"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 22:59:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="668550396"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="668550396"
Received: from linux.bj.intel.com ([10.238.157.63])
 by orsmga007.jf.intel.com with ESMTP; 02 Mar 2023 22:59:43 -0800
From: Tao Su <tao1.su@linux.intel.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, yang.zhong@intel.com,
 jing2.liu@intel.com, vkuznets@redhat.com, philmd@linaro.org
Subject: [PATCH v2 0/6] target/i386: Support new Intel platform Instructions
 in CPUID enumeration
Date: Fri,  3 Mar 2023 14:59:07 +0800
Message-Id: <20230303065913.1246327-1-tao1.su@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.115;
 envelope-from=tao1.su@linux.intel.com; helo=mga14.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Intel platforms Granite Rapids/Sierra Forest introduce below new
instructions and CPUID leaves:

 - CMPccXADD CPUID.(EAX=7,ECX=1):EAX[bit 7]
 - AMX-FP16 CPUID.(EAX=7,ECX=1):EAX[bit 21]
 - AVX-IFMA CPUID.(EAX=7,ECX=1):EAX[bit 23]
 - AVX-VNNI-INT8 CPUID.(EAX=7,ECX=1):EDX[bit 4]
 - AVX-NE-CONVERT CPUID.(EAX=7,ECX=1):EDX[bit 5]
 - PREFETCHITI CPUID.(EAX=7,ECX=1):EDX[bit 14]

Details can be found in recent Intel ISE (Instruction Set Extensions)[1].

KVM part of advertising these CPUID bits have been already in Linux
mainline from commit(6a19d7aa5821) to commit(29c46979b25d). This series
adds the counterpart in QEMU to allow these features exposed to guest.

[1] Intel ISE: https://cdrdv2.intel.com/v1/dl/getContent/671368

---

Changelog:

v2:
 - Rebase to latest QEMU.
 - Improve changelog.
v1:
 - https://lore.kernel.org/all/20221208071917.1923093-1-jiaxi.chen@linux.intel.com/

Jiaxi Chen (6):
  target/i386: Add support for CMPCCXADD in CPUID enumeration
  target/i386: Add support for AMX-FP16 in CPUID enumeration
  target/i386: Add support for AVX-IFMA in CPUID enumeration
  target/i386: Add support for AVX-VNNI-INT8 in CPUID enumeration
  target/i386: Add support for AVX-NE-CONVERT in CPUID enumeration
  target/i386: Add support for PREFETCHIT0/1 in CPUID enumeration

 target/i386/cpu.c | 26 +++++++++++++++++++++++---
 target/i386/cpu.h | 14 ++++++++++++++
 2 files changed, 37 insertions(+), 3 deletions(-)


base-commit: 627634031092e1514f363fd8659a579398de0f0e
-- 
2.34.1


