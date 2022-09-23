Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 422A75E74E3
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 09:33:48 +0200 (CEST)
Received: from localhost ([::1]:39392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obdBy-0000oc-Q6
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 03:33:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1obd5A-0004Lg-Sh
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 03:26:45 -0400
Received: from mga02.intel.com ([134.134.136.20]:10884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1obd57-0000Im-0h
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 03:26:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663918001; x=1695454001;
 h=from:to:cc:subject:date:message-id;
 bh=eJE+V/zd8eDJl9FgeFYELSaFkFMlAz8LS3Mil0zjLFo=;
 b=KrMBqWuLtuGUsbjyQVTrNRu09qI5KynuopJv2yvOYu78ueh7s1Y45Avo
 gkURqp92qXzXw+X8RntPq6PsxtGdzlqhN79zXxrsZBqldJWJeV9bge3Yo
 OLpjYEVYhiyCcmktw7ShQbxgBkvdxOCMvjINS6G8Sg/7M3Krl0kBSbvAP
 Tc/DjWB/cUUOUAdqdp5Ehe9lLdYEALiF5S83OblHLalHpEzSbCkUiae2j
 mD2Tw2mHelEycZCkshbvFN0JFcR1vUHHIpLJDb9+SI1KkkAJwSrETBmjb
 JS33Vn9H1yOTAEq2JAfdKYTD/ha7RhhMkk0qrwUl/tnleMYYjeyE8bejo w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="287646912"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="287646912"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 00:26:37 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="620121665"
Received: from chenyi-pc.sh.intel.com ([10.239.159.53])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 00:26:35 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Chenyi Qiang <chenyi.qiang@intel.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Subject: [PATCH v7 0/2] Enable notify VM exit
Date: Fri, 23 Sep 2022 15:33:31 +0800
Message-Id: <20220923073333.23381-1-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=chenyi.qiang@intel.com; helo=mga02.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Notify VM exit is introduced to mitigate the potential DOS attach from
malicious VM. This series is the userspace part to enable this feature
through a new KVM capability KVM_CAP_X86_NOTIFY_VMEXIT. The detailed
info can be seen in Patch 2.

The corresponding KVM support can be found in linux 6.0-rc:
(2f4073e08f4c KVM: VMX: Enable Notify VM exit)

This patch set depends on some definition which can be updated from
scripts/update-linux-headers.sh. The corresponding separate patch set is
available at:
https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg02102.html

---
Change logs:
v6 -> v7
- Add a warning message when exiting to userspace (Peter Xu)
- v6: https://lore.kernel.org/all/20220915092839.5518-1-chenyi.qiang@intel.com/

v5 -> v6
- Add some info related to the valid range of notify_window in patch 2. (Peter Xu)
- Add the doc in qemu-options.hx. (Peter Xu)
- v5: https://lore.kernel.org/qemu-devel/20220817020845.21855-1-chenyi.qiang@intel.com/

v4 -> v5
- Remove the assert check to avoid the nop in NDEBUG case. (Yuan)
- v4: https://lore.kernel.org/qemu-devel/20220524140302.23272-1-chenyi.qiang@intel.com/

v3 -> v4
- Add a new KVM cap KVM_CAP_TRIPLE_FAULT_EVENT to guard the extension of triple fault
  event save&restore.
- v3: https://lore.kernel.org/qemu-devel/20220421074028.18196-1-chenyi.qiang@intel.com/

---

Chenyi Qiang (2):
  i386: kvm: extend kvm_{get, put}_vcpu_events to support pending triple
    fault
  i386: Add notify VM exit support

 hw/i386/x86.c         | 45 ++++++++++++++++++++++++++++++++++++
 include/hw/i386/x86.h |  5 ++++
 qemu-options.hx       | 10 +++++++-
 target/i386/cpu.c     |  1 +
 target/i386/cpu.h     |  1 +
 target/i386/kvm/kvm.c | 54 +++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 115 insertions(+), 1 deletion(-)

-- 
2.17.1


