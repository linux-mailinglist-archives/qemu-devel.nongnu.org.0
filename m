Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 484165B165D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 10:08:30 +0200 (CEST)
Received: from localhost ([::1]:39804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWCaK-0005Ub-Up
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 04:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1oWCTj-00013l-G1
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 04:01:42 -0400
Received: from mga01.intel.com ([192.55.52.88]:31677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1oWCTb-0005BB-IJ
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 04:01:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662624091; x=1694160091;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C2FeV9e0b2EjeI6Y7eC1qSS9A9OmeYqcHLwl8ofpAnk=;
 b=MwERUscQSCDLZ53mLzDgDZxCux0zdSQzWQSTNuEbOeezi6sw4VpF9Sqf
 AYaA+jB2sWz0n0mkgByT2El3VS1zhlCDmzAlncTYZGu8UpdShMeIBC28t
 VJcgjDGyR/NeyhvmlfQwf/k5Qmb70zuwnxNZeFhHsCIpp3r5bKyDQP6Ws
 +QSUnXE7Pn9tLLgS7pkcfmfGxwdnZqjhpHJo9oFeqsTm8tfjTzSBuLh3M
 GzSmzIDliDhvUOOlq+FBXQfbfgvDXpx9Pq2qH/2HkVST1AjulF+yhdPaO
 y2YiKUTMhiDCx/kXoJ+5OysvViHzD/dlVZc6w+c2xijYMkz5hTVGbCPtX g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="323295080"
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; d="scan'208";a="323295080"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 01:01:26 -0700
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; d="scan'208";a="565846727"
Received: from chenyi-pc.sh.intel.com ([10.239.159.73])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 01:01:23 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Michal=20Pr=C3=ADvozn=C3=ADk?= <mprivozn@redhat.com>
Cc: Chenyi Qiang <chenyi.qiang@intel.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] configure: Add -Wno-gnu-variable-sized-type-not-at-end
Date: Thu,  8 Sep 2022 16:07:49 +0800
Message-Id: <20220908080749.32211-3-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220908080749.32211-1-chenyi.qiang@intel.com>
References: <20220908080749.32211-1-chenyi.qiang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=192.55.52.88;
 envelope-from=chenyi.qiang@intel.com; helo=mga01.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After updating linux headers to v6.0-rc, clang build on x86 target would
generate warnings like:

target/i386/kvm/kvm.c:470:25: error: field 'info' with variable sized
type 'struct kvm_msrs' not at the end of a struct or class is a GNU
extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
        struct kvm_msrs info;
                        ^
target/i386/kvm/kvm.c:1701:27: error: field 'cpuid' with variable sized
type 'struct kvm_cpuid2' not at the end of a struct or class is a GNU
extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
        struct kvm_cpuid2 cpuid;
                          ^
target/i386/kvm/kvm.c:2868:25: error: field 'info' with variable sized
type 'struct kvm_msrs' not at the end of a struct or class is a GNU
extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
        struct kvm_msrs info;
                        ^

Considering that it is OK to use GNU extension in QEMU (e.g. g_auto stuff),
it is acceptable to turn off this warning, which is only relevant to people
striving for fully portable C code.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index 575dde1c1f..7e0a1a4187 100755
--- a/configure
+++ b/configure
@@ -1258,6 +1258,7 @@ add_to nowarn_flags -Wno-string-plus-int
 add_to nowarn_flags -Wno-typedef-redefinition
 add_to nowarn_flags -Wno-tautological-type-limit-compare
 add_to nowarn_flags -Wno-psabi
+add_to nowarn_flags -Wno-gnu-variable-sized-type-not-at-end
 
 gcc_flags="$warn_flags $nowarn_flags"
 
-- 
2.17.1


