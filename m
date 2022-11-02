Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4033B615E6B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 09:54:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq9V0-0005Nd-8h; Wed, 02 Nov 2022 04:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1oq9Ut-0005NI-7S
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 04:53:19 -0400
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1oq9Un-0008AD-K8
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 04:53:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667379193; x=1698915193;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M8oPNuCCdS3znGtahnUT/oBX7sj0FzS5TaxGMa+FpRs=;
 b=MUWCtiigO6z2sbxVzYHpahhgG6+XIGFIo8b8q9VFsgPfXzJ2ZXtyVj4o
 TKIeh1vV2vPh/e5UQhatGmUPPEAmsSH2OGQ+9cafezMrWt1Wiuep+peah
 WR1j9/XDpea7YvBqAspdfscjDvh3AilI/j5oaWTb/U7LzyD0KgelAL/Am
 4OWbSTzGFlyiBUpyhwIv6d42nHkGAvo4G9e5CftaxxSgtf+lh1X4IlbMg
 rTE7JO3XnOljg2bjCRVcgT+3jUUkzvYgy1xdDUosWCjbVHPGV59R/JsJS
 RqhnC6GZKYJNaw8QmyAvHqHv9R7/NuzrYCV6+802r8rVk79GzUZRcg7Jy g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="308072271"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; d="scan'208";a="308072271"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 01:52:57 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="963447209"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; d="scan'208";a="963447209"
Received: from b49691a74b20.jf.intel.com ([10.45.76.123])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 01:52:57 -0700
From: "Wang, Lei" <lei4.wang@intel.com>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, berrange@redhat.com,
 xiaoyao.li@intel.com, yang.zhong@linux.intel.com
Subject: [PATCH v2 0/6] Support for new CPU model SapphireRapids
Date: Wed,  2 Nov 2022 01:52:50 -0700
Message-Id: <20221102085256.81139-1-lei4.wang@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.120; envelope-from=lei4.wang@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This series aims to add a new CPU model SapphireRapids, and tries to
address the problem stated in
https://lore.kernel.org/all/20220812055751.14553-1-lei4.wang@intel.com/T/#mcf67dbd1ad37c65d7988c36a2b267be9afd2fb30,
so that named CPU model can define its own AMX values, and QEMU won't
pass the wrong AMX values to KVM in future platforms if they have
different values supported.

The original patch is
https://lore.kernel.org/all/20220812055751.14553-1-lei4.wang@intel.com/T/#u.

---

Changelog:

v2:
 - Fix when passing all zeros of AMX-related CPUID, QEMU will warn
   unsupported.
 - Remove unnecessary function definition and make code cleaner.
 - Fix some typos.
 - v1:
   https://lore.kernel.org/qemu-devel/20221027020036.373140-1-lei4.wang@intel.com/T/#t

Wang, Lei (6):
  i386: Introduce FeatureWordInfo for AMX CPUID leaf 0x1D and 0x1E
  i386: Remove unused parameter "uint32_t bit" in
    feature_word_description()
  i386: Introduce new struct "MultiBitFeatureInfo" for multi-bit
    features
  i386: Mask and report unavailable multi-bit feature values
  i386: Initialize AMX CPUID leaves with corresponding env->features[]
    leaves
  i386: Add new CPU model SapphireRapids

 target/i386/cpu-internal.h |  11 ++
 target/i386/cpu.c          | 311 +++++++++++++++++++++++++++++++++++--
 target/i386/cpu.h          |  16 ++
 3 files changed, 322 insertions(+), 16 deletions(-)

-- 
2.34.1


