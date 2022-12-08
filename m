Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0736D6469A7
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 08:20:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3BBX-0001eN-TJ; Thu, 08 Dec 2022 02:19:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxi.chen@linux.intel.com>)
 id 1p3BBU-0001d8-Vx
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 02:19:09 -0500
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxi.chen@linux.intel.com>)
 id 1p3BBO-0006cp-Jp
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 02:19:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670483942; x=1702019942;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6H65SN3zBtlgO4HUH2SjIM3oTFxuM/7KP3ziGZ6/X+o=;
 b=RXmT74JI5IYgvn1icqn1/TqofGafsouGWz4T3Oj+EJL4umEmKVZA6tlL
 7+kgiOl6nwyxRdpNL4+QEkBCXBv6nFfNoK/GEUmb/eRXqLm3Grm9pGLyp
 7Dv5BajY5lMwO485/MkaJXUSc+Vfu0e84BOgYa5xheDbrtqFR3XAIUJhM
 wdz4EKE4Mc+NqX+xJYrWhCZRiJfQLeB4bGn6Gjk/4Alp+LnYWNe3FVj15
 T8sqr4pmsJfSmVuhDL2ENp+3Kxsfkk7fiqLXdNQJe5SxuGFbyvAlVMZ7i
 wpsz0NwFHlDhuFLHJOCV1hwdqg10zC4RyTD7n52xhe2AaTvGNsbnUJnbl A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="379263792"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="379263792"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2022 23:18:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="771380961"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="771380961"
Received: from jiaxichen-precision-3650-tower.sh.intel.com ([10.239.159.75])
 by orsmga004.jf.intel.com with ESMTP; 07 Dec 2022 23:18:56 -0800
From: Jiaxi Chen <jiaxi.chen@linux.intel.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, yang.zhong@intel.com,
 jing2.liu@intel.com, vkuznets@redhat.com
Subject: [PATCH 0/6] target/i386: Support new Intel platform Instructions in
 CPUID enumeration
Date: Thu,  8 Dec 2022 15:19:11 +0800
Message-Id: <20221208071917.1923093-1-jiaxi.chen@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.31;
 envelope-from=jiaxi.chen@linux.intel.com; helo=mga06.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_NONE=0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Latest Intel platform Granite Rapids/Sierra Forest has introduced below
new instructions and CPUIDs:

 - CMPccXADD CPUID.(EAX=7,ECX=1):EAX[bit 7]
 - AMX-FP16 CPUID.(EAX=7,ECX=1):EAX[bit 21]
 - AVX-IFMA CPUID.(EAX=7,ECX=1):EAX[bit 23]
 - AVX-VNNI-INT8 CPUID.(EAX=7,ECX=1):EDX[bit 4]
 - AVX-NE-CONVERT CPUID.(EAX=7,ECX=1):EDX[bit 5]
 - PREFETCHITI CPUID.(EAX=7,ECX=1):EDX[bit 14]

Details can be found in recent Intel ISE (Instruction Set Extensions)[1].

Linux 6.2 will support for advertising these features to userspace. KVM
patches have been merged into kvm/next[2]. This patch series adds CPUID
definitions of the corresponding features in QEMU. 

[1] Intel ISE: https://cdrdv2.intel.com/v1/dl/getContent/671368
[2] kvm/next: https://git.kernel.org/pub/scm/virt/kvm/kvm.git

Jiaxi Chen (6):
  target/i386: Add support for CMPCCXADD in CPUID enumeration
  target/i386: Add support for AMX-FP16 in CPUID enumeration
  target/i386: Add support for AVX-IFMA in CPUID enumeration
  target/i386: Add support for AVX-VNNI-INT8 in CPUID enumeration
  target/i386: Add support for AVX-NE-CONVERT in CPUID enumeration
  target/i386: Add support for PREFETCHIT0/1 in CPUID enumeration

 target/i386/cpu.c | 26 +++++++++++++++++++++++---
 target/i386/cpu.h | 15 +++++++++++++++
 2 files changed, 38 insertions(+), 3 deletions(-)


base-commit: ea3a008d2d9ced9c4f93871c823baee237047f93
-- 
2.27.0


