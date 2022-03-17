Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C499E4DC877
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 15:13:33 +0100 (CET)
Received: from localhost ([::1]:38664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUqse-0007Ly-S8
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 10:13:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nUqft-0000KU-OJ
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:00:22 -0400
Received: from mga12.intel.com ([192.55.52.136]:24925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nUqfn-0004Dr-Bd
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:00:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647525615; x=1679061615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x065EN6Ogyyollz7K3Fldo6S1FaYp8UhjRJk6IuZ0b8=;
 b=ZnJrNRQPsJZS+NMxQhZyG6trAnQuYti9v34tld5OmHkq2b639rewtpPw
 hpVfBhnOTjjUsbfSVUZc9iKu7/cXgRtHFlFgLBVvrBfYtYH9kdHayvtCa
 SjfZiEXraWq1tZ9jMBkszQUBx0FhDF4JDRlAxU4Fx0iIpD6Q6a8kuTseL
 LtuIfqkFo4Kp5L5gmW/tC8Pql86G9rRFYvKFS3GYlcRoQCLLehkfw6K15
 6XyX5ZA3JVsnEecxHku+dSz7/flLb/XId/tBhxJEAn9n3ehHxqN8cJ2li
 qv4XzAFOPWGHKTK9+PwHrmQLRcH2VKVBJj6YEu+XZOELRjId/YE01kumT Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="236816797"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="236816797"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 07:00:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="541378133"
Received: from lxy-dell.sh.intel.com ([10.239.159.55])
 by orsmga007.jf.intel.com with ESMTP; 17 Mar 2022 07:00:08 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [RFC PATCH v3 12/36] i386/tdx: Add property sept-ve-disable for
 tdx-guest object
Date: Thu, 17 Mar 2022 21:58:49 +0800
Message-Id: <20220317135913.2166202-13-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220317135913.2166202-1-xiaoyao.li@intel.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=xiaoyao.li@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org,
 Connor Kuehl <ckuehl@redhat.com>, seanjc@google.com, xiaoyao.li@intel.com,
 qemu-devel@nongnu.org, erdemaktas@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add sept-ve-disable property for tdx-guest object. It's used to
configure bit 28 of TD attributes.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 qapi/qom.json         |  5 ++++-
 target/i386/kvm/tdx.c | 24 ++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index 1415ab22e531..fc380095a42c 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -792,10 +792,13 @@
 #
 # @attributes: TDX guest's attributes (default: 0)
 #
+# @sept-ve-disable: attributes.sept-ve-disable[bit 28] (default: 0)
+#
 # Since: 7.0
 ##
 { 'struct': 'TdxGuestProperties',
-  'data': { '*attributes': 'uint64' } }
+  'data': { '*attributes': 'uint64',
+            '*sept-ve-disable': 'bool' } }
 
 ##
 # @ObjectType:
diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
index a5cc187edbde..409526765304 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -21,6 +21,8 @@
 #include "kvm_i386.h"
 #include "tdx.h"
 
+#define TDX_TD_ATTRIBUTES_SEPT_VE_DISABLE   BIT_ULL(28)
+
 static TdxGuest *tdx_guest;
 
 /* It's valid after kvm_confidential_guest_init()->kvm_tdx_init() */
@@ -196,6 +198,24 @@ out:
     return r;
 }
 
+static bool tdx_guest_get_sept_ve_disable(Object *obj, Error **errp)
+{
+    TdxGuest *tdx = TDX_GUEST(obj);
+
+    return !!(tdx->attributes & TDX_TD_ATTRIBUTES_SEPT_VE_DISABLE);
+}
+
+static void tdx_guest_set_sept_ve_disable(Object *obj, bool value, Error **errp)
+{
+    TdxGuest *tdx = TDX_GUEST(obj);
+
+    if (value) {
+        tdx->attributes |= TDX_TD_ATTRIBUTES_SEPT_VE_DISABLE;
+    } else {
+        tdx->attributes &= ~TDX_TD_ATTRIBUTES_SEPT_VE_DISABLE;
+    }
+}
+
 /* tdx guest */
 OBJECT_DEFINE_TYPE_WITH_INTERFACES(TdxGuest,
                                    tdx_guest,
@@ -211,6 +231,10 @@ static void tdx_guest_init(Object *obj)
     qemu_mutex_init(&tdx->lock);
 
     tdx->attributes = 0;
+
+    object_property_add_bool(obj, "sept-ve-disable",
+                             tdx_guest_get_sept_ve_disable,
+                             tdx_guest_set_sept_ve_disable);
 }
 
 static void tdx_guest_finalize(Object *obj)
-- 
2.27.0


