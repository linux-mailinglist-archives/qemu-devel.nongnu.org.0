Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE7E587929
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 10:39:26 +0200 (CEST)
Received: from localhost ([::1]:47716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oInQy-0002LD-Uu
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 04:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oImfp-0005ny-Rl
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:50:45 -0400
Received: from mga04.intel.com ([192.55.52.120]:60043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oImfn-0007L7-Sn
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:50:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659426639; x=1690962639;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zFh6cq5BXS58ZNjpM4IyIaGZkYXo9XQFUzf0cTr2ihM=;
 b=byNiQrkeI9ENTQLFILbiKCriXL4JWW4O/PurMYF4Bbtx4gBnLTNDlE0e
 yoUxeW7Nx9De5YccoGI2flqw599l+BA1+tV3rtag816ef4aj/PMFBM0/B
 zri+JknfVnE/DSWgspa2LpesN3utGzyAuj86JMIvfkbrmqDP+fbJ+r0XQ
 6SWvrE8oKIldZ+7UkwOD/+Rc2c50214NsvAz8qIp6O2a4O2JWTcdXJ9R7
 jp7vT/Pc6INaL31qKYLfSE9vn3vn/J25yccldwnTela9bqR7LDSZYHzbw
 DUgzeqfxxm9Hi19BbyIq4k21mNORt6FSbDTrjSwiZSdZV6OrrcU7YwqOS Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="288105852"
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="288105852"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 00:50:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="630604528"
Received: from lxy-dell.sh.intel.com ([10.239.48.38])
 by orsmga008.jf.intel.com with ESMTP; 02 Aug 2022 00:50:34 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>
Cc: Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com,
 xiaoyao.li@intel.com
Subject: [PATCH v1 38/40] i386/tdx: Skip kvm_put_apicbase() for TDs
Date: Tue,  2 Aug 2022 15:47:48 +0800
Message-Id: <20220802074750.2581308-39-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220802074750.2581308-1-xiaoyao.li@intel.com>
References: <20220802074750.2581308-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.120; envelope-from=xiaoyao.li@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

KVM doesn't allow wirting to MSR_IA32_APICBASE for TDs.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 target/i386/kvm/kvm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 53ab539e7e4d..948c87ebdb97 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2949,6 +2949,11 @@ void kvm_put_apicbase(X86CPU *cpu, uint64_t value)
 {
     int ret;
 
+    /* TODO: Allow accessing guest state for debug TDs. */
+    if (is_tdx_vm()) {
+        return;
+    }
+
     ret = kvm_put_one_msr(cpu, MSR_IA32_APICBASE, value);
     assert(ret == 1);
 }
-- 
2.27.0


