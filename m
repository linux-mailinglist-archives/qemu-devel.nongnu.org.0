Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EF94B84C5
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 10:49:49 +0100 (CET)
Received: from localhost ([::1]:41350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKGwW-0007HU-AS
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 04:49:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1nKG5Z-000553-1q
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 03:55:05 -0500
Received: from mga17.intel.com ([192.55.52.151]:19074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1nKG5V-0002n5-UX
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 03:55:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645001701; x=1676537701;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bLryyWPt1g3avKzZTxRq/rTUSnwy7iNJ2yHqzo/iFpo=;
 b=X+Q1oJ0Dd9Rt3lykyrs2rtaiUq+MjNCcl8IPksX/YK+lUS/7LKvF9Zqe
 2uu8zJPRs9ZMneLJysqQFKesvmEDqbVh8AIotksdxBOCf6sXE7xCSWJdZ
 vUSRou0HBINcbKdBoHP9Sdjt6ZyINPJ5jTZnOfxNplcOaHpXYDEpNsFU9
 5FI4i7FvnUWrtdAlNoAOi7rVuwC9QqImzM1uGEfz5vl2SokBhA7NnkzBl
 oTd+bnIuVGmIGGgXTmRCvDbRSwL04XDMz0HiCjhKF9Q2+u/Mvne+/enow
 D4T7Veyk4wyw0VP8VAlHFYSqRpLGiLZjog2mqxsaoOGFswd9Jwkahj5W3 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="231182045"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="231182045"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 00:54:16 -0800
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="633418259"
Received: from embargo.jf.intel.com ([10.165.9.183])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 00:54:04 -0800
From: Yang Weijiang <weijiang.yang@intel.com>
To: pbonzini@redhat.com, ehabkost@redhat.com, mtosatti@redhat.com,
 seanjc@google.com, richard.henderson@linaro.org, like.xu.linux@gmail.com,
 wei.w.wang@intel.com, qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH 0/8] Enable Architectural LBR for guest
Date: Tue, 15 Feb 2022 14:52:50 -0500
Message-Id: <20220215195258.29149-1-weijiang.yang@intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=weijiang.yang@intel.com; helo=mga17.intel.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIMWL_WL_HIGH=-0.083, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Yang Weijiang <weijiang.yang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Architectural LBR (Arch LBR) is the enhancement for previous
non-Architectural LBR (Legacy LBR). This feature is introduced
in Intel Architecture Instruction Set Extensions and Future
Features Programming Reference[0]. The advantages of Arch LBR
can be referred to in native patch series[1].

Since Arch LBR relies on XSAVES/XRSTORS to boost memory save/
restore, QEMU needs to enable the support for XSS first. Similar
as Legacy LBR, QEMU uses lbr-fmt=0x3f parameter to advertise
Arch LBR feature to guest.

Note, the depth MSR has following side-effects: 1)On write to the
MSR, it'll reset all Arch LBR recording MSRs to 0s. 2) XRSTORS
resets all record MSRs to 0s if the saved depth mismatches
MSR_ARCH_LBR_DEPTH. As the first step, the Arch LBR virtulization
solution only supports guest depth == host depth to simplify the
implementation.

During live migration, before put Arch LBR msrs, it'll check the
depth setting of destination host, the LBR records are written to
destination only if both source and destination host depth MSR
settings match.

This patch series should be built with AMX QEMU patches in order
to set proper xsave area size.

[0]https://software.intel.com/sites/default/files/managed/c5/15/architecture-instruction-set-extensions-programming-reference.pdf
[1]https://lore.kernel.org/lkml/1593780569-62993-1-git-send-email-kan.liang@linux.intel.com/

QEMU base-commit: ad38520bde

patch 1~2: The support patches for legacy LBR.
patch 3:   Add a helper function to clean up code and it'll be 
	   used by Arch LBR patch too.
patch 4~5: Enable XSAVES support for Arch LBR.
patch 6~7: Enable Arch LBR live migration support.
patch 8:   Advertise Arch LBR feature.

Yang Weijiang (8):
  qdev-properties: Add a new macro with bitmask check for uint64_t
    property
  target/i386: Add lbr-fmt vPMU option to support guest LBR
  target/i386: Add kvm_get_one_msr helper
  target/i386: Enable support for XSAVES based features
  target/i386: Add XSAVES support for Arch LBR
  target/i386: Add MSR access interface for Arch LBR
  target/i386: Enable Arch LBR migration states in vmstate
  target/i386: Support Arch LBR in CPUID enumeration

 hw/core/qdev-properties.c    |  19 ++++
 include/hw/qdev-properties.h |  12 +++
 target/i386/cpu.c            | 169 +++++++++++++++++++++++++++++------
 target/i386/cpu.h            |  56 +++++++++++-
 target/i386/kvm/kvm.c        | 115 +++++++++++++++++++-----
 target/i386/machine.c        |  38 ++++++++
 6 files changed, 361 insertions(+), 48 deletions(-)

-- 
2.27.0


