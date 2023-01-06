Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFD665FD27
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 09:55:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDiFE-00062P-JD; Fri, 06 Jan 2023 03:38:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1pDiF3-00060g-18
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 03:38:21 -0500
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1pDiEz-0008NH-EO
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 03:38:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672994297; x=1704530297;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ea2E8nJu3yzjjwx/dvcbAeNZRhZES7xU65O1UrhKelY=;
 b=a4YVNEv6cybePBCoX/WieUr/tKef3nJrL9GcBmGVMQvsGQ24SFC27Jn4
 cOAiJPmew4X29iuocSLaQMU8yT+IhIfvVdnxnNwDFBAuYYSfJWBTTONCz
 XCAWBHVL5me4fvjUh7nqR2fApykb2BDaPy9GopoADQ3Q96kkjbdrD+Bjt
 lj5cUlvQSvV3tCO7rBeYd29ahYJsBAzz85kUsDSulziXdaRzMMoRpFc06
 4s7AQ/IaRV0yLfYUsAlDIn8DDeVYTlMeZwQWipSmeSwPQTgFXcoBnrgku
 PbcycLeHE3oSp2gcEApiF2ITOQtO02U2WMFLfm2rtOgMjnMMmfvOg8K/j w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="408688470"
X-IronPort-AV: E=Sophos;i="5.96,304,1665471600"; d="scan'208";a="408688470"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 00:38:10 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="724378814"
X-IronPort-AV: E=Sophos;i="5.96,304,1665471600"; d="scan'208";a="724378814"
Received: from sdp.sh.intel.com ([10.112.228.155])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 00:38:06 -0800
From: Lei Wang <lei4.wang@intel.com>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, imammedo@redhat.com, dgilbert@redhat.com,
 berrange@redhat.com, xiaoyao.li@intel.com, yang.zhong@linux.intel.com,
 lei4.wang@intel.com
Subject: [PATCH v3 0/6] Support for new CPU model SapphireRapids
Date: Fri,  6 Jan 2023 00:38:20 -0800
Message-Id: <20230106083826.5384-1-lei4.wang@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=lei4.wang@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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

v3:
 - Rebase on the latest QEMU (d1852caab131ea898134fdcea8c14bc2ee75fbe9).
 - v2: https://lore.kernel.org/qemu-devel/20221102085256.81139-1-lei4.wang@intel.com/

v2:
 - Fix when passing all zeros of AMX-related CPUID, QEMU will warn
   unsupported.
 - Remove unnecessary function definition and make code cleaner.
 - Fix some typos.
 - v1: https://lore.kernel.org/qemu-devel/20221027020036.373140-1-lei4.wang@intel.com/T/#t


Lei Wang (6):
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


base-commit: d1852caab131ea898134fdcea8c14bc2ee75fbe9
-- 
2.34.1


