Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC2E496B0B
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 09:39:09 +0100 (CET)
Received: from localhost ([::1]:53544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBBvQ-0002Lc-Fa
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 03:39:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1nBBuD-0000ST-90
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 03:37:53 -0500
Received: from mga17.intel.com ([192.55.52.151]:14296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1nBBuA-0006dF-Qg
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 03:37:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642840670; x=1674376670;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+EvRpqARg086TBgvq2dE04fcyG0zdE9UY5zo/dAjX6Y=;
 b=Zc75x8BRuXBmj4l4H4z3QRFl7qFIB/mzVux1cpBACd7CHZ1Hnku00iGo
 kgMPmiyKmvGFurokVcaFxYHv6+qgGy+Z97ppE7Go8lgaBOrnqW4t8LXPA
 QY3qxfy9C6+oc3KcbNYZPEZY0n4r7Ge79yo6znz+58lH0cTSQW4Ld76MK
 DGjwfg4RO63W8+P7dMTUa8/UplNGRLhmeowifWHx8OLdSL7oHVO+K3jor
 Ph6xv5y23lXnpkgjvs6j8gmXpaERbxXgp+eF40lGZDkGJlb31rJnVP4+H
 G5reQ4j0vl+gqFOEQYL8zic3Xr8xLf9eLfcgskk3rT8E38KzKxqMuD5HC Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10234"; a="226481871"
X-IronPort-AV: E=Sophos;i="5.88,307,1635231600"; d="scan'208";a="226481871"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2022 00:37:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,307,1635231600"; d="scan'208";a="765937357"
Received: from sqa-gate.sh.intel.com (HELO michael.clx.dev.tsp.org)
 ([10.239.48.212])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2022 00:37:41 -0800
From: Yang Weijiang <weijiang.yang@intel.com>
To: pbonzini@redhat.com, ehabkost@redhat.com, mtosatti@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 likexu@tencent.com, wei.w.wang@intel.com
Subject: [PATCH v5 0/2] Enable legacy LBR support for guest
Date: Sun, 23 Jan 2022 00:11:59 +0800
Message-Id: <20220122161201.73528-1-weijiang.yang@intel.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=weijiang.yang@intel.com; helo=mga17.intel.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 DKIMWL_WL_HIGH=-0.699, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: weijiang.yang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

KVM legacy LBR patches have been merged in kernel 5.12, this patchset
is to expose the feature to guest from the perf capability MSR. Qemu can
add LBR format in cpu option to achieve it, e.g., -cpu host,lbr-fmt=0x5,
the format should match host value in IA32_PERF_CAPABILITIES.

Note, KVM legacy LBR solution accelerates guest perf performace by LBR MSR
passthrough so it requires guest cpu model matches that of host's, i.e.,
only -cpu host is supported.

Change in v5:
	1. This patchset is rebased on tip : 6621441db5
	2. No functional change since v4.


Yang Weijiang (2):
  qdev-properties: Add a new macro with bitmask check for uint64_t
    property
  target/i386: Add lbr-fmt vPMU option to support guest LBR

 hw/core/qdev-properties.c    | 19 +++++++++++++++++
 include/hw/qdev-properties.h | 12 +++++++++++
 target/i386/cpu.c            | 40 ++++++++++++++++++++++++++++++++++++
 target/i386/cpu.h            | 10 +++++++++
 4 files changed, 81 insertions(+)

-- 
2.27.0


