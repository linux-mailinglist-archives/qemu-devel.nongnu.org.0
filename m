Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DB2694122
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:30:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRV91-0005Fs-AH; Mon, 13 Feb 2023 04:29:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRV8y-0005FW-UG
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:29:04 -0500
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRV8u-0006Gn-KD
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:29:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676280540; x=1707816540;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UQCnERRP56yJTkgsHIsgOPDf4zq51DL2n5InW5S5l9s=;
 b=KMJ0aHFj6+ewy26mNG5YUlIwG68wwxxfh+sZX9FdtcNM6QDUeGXtBlsC
 iGrE0JTNTcUcTNgCAAO0PE1vblWXFss1LUzo2XK3RBkBoKFGGc75NEcr2
 1qs7hmqIKSJ0JAzZoYTgdVxaUp6hGxMBtJHTFur0TdLqVpy5eiaJW2I2a
 yT7mZlsP1ptTExf+21q4uuT+fPkMylpKh2Gp8HzImVPzHTs6TGMfYBIQT
 fDyHZQfJQ8zwBBLU2tObkGkoW7iHBuljX8Ka5BTe+wTiLy84ajEwVz2Re
 0ZjNDZcoEcmTq8WaMgCyXagvVfaHGG4Z14K39JVZslQnp/E7x4ICqbRcW A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="318875508"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="318875508"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:28:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="792659794"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="792659794"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by orsmga004.jf.intel.com with ESMTP; 13 Feb 2023 01:28:53 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH RESEND 02/18] tests: Rename test-x86-cpuid.c to
 test-x86-apicid.c
Date: Mon, 13 Feb 2023 17:36:09 +0800
Message-Id: <20230213093625.158170-3-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
References: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Zhao Liu <zhao1.liu@intel.com>

In fact, this unit tests APIC ID other than CPUID.
Rename to test-x86-apicid.c to make its name more in line with its
actual content.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 MAINTAINERS                                        | 2 +-
 tests/unit/meson.build                             | 4 ++--
 tests/unit/{test-x86-cpuid.c => test-x86-apicid.c} | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename tests/unit/{test-x86-cpuid.c => test-x86-apicid.c} (99%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96e25f62acaa..71c1bc24371b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1679,7 +1679,7 @@ F: include/hw/southbridge/piix.h
 F: hw/misc/sga.c
 F: hw/isa/apm.c
 F: include/hw/isa/apm.h
-F: tests/unit/test-x86-cpuid.c
+F: tests/unit/test-x86-apicid.c
 F: tests/qtest/test-x86-cpuid-compat.c
 
 PC Chipset
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index ffa444f4323c..a9df2843e92e 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -20,8 +20,8 @@ tests = {
   'test-opts-visitor': [testqapi],
   'test-visitor-serialization': [testqapi],
   'test-bitmap': [],
-  # all code tested by test-x86-cpuid is inside topology.h
-  'test-x86-cpuid': [],
+  # all code tested by test-x86-apicid is inside topology.h
+  'test-x86-apicid': [],
   'test-cutils': [],
   'test-div128': [],
   'test-shift128': [],
diff --git a/tests/unit/test-x86-cpuid.c b/tests/unit/test-x86-apicid.c
similarity index 99%
rename from tests/unit/test-x86-cpuid.c
rename to tests/unit/test-x86-apicid.c
index bfabc0403a1a..2b104f86d7c2 100644
--- a/tests/unit/test-x86-cpuid.c
+++ b/tests/unit/test-x86-apicid.c
@@ -1,5 +1,5 @@
 /*
- *  Test code for x86 CPUID and Topology functions
+ *  Test code for x86 APIC ID and Topology functions
  *
  *  Copyright (c) 2012 Red Hat Inc.
  *
-- 
2.34.1


