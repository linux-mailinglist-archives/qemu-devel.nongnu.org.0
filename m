Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 599BA5878C7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 10:11:23 +0200 (CEST)
Received: from localhost ([::1]:60388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oImzo-00057N-9L
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 04:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oImdg-0004Ox-AN
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:48:28 -0400
Received: from mga11.intel.com ([192.55.52.93]:8273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oImde-0005iP-JJ
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:48:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659426506; x=1690962506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QilC9i3ORJNEU51WnLngL9ALNf5JfJhb53MR6bxo38Y=;
 b=OnmwRBjrDTs4wBiEz/wUK7krIwKziAzfIPaliA/59UKmkPkUCnUsi1vx
 VudBCkQN/vKDI4KbpybErCvfHMV1+Zfvw73W4NxqUq1gR3GImrRJLXXzy
 xm172bXta4RIMPU3UcxqVfd8f6zPK8ZIdoxcfz8qyj+NxYOoeeVxFPtph
 NNTXe+zksPCREgtZIy5xbQzGlgKT5ggzUaX/7HUR7RxgkkxkP62WV8eTU
 bfVLpe2xNjnSFweVoJXYPAAsILtyLOI1a+IN3HKrxCnk5r3ZTnh8Sj+FU
 TuB1vFdOd9Hr3++HpqsDlIVsOBWb484jx8UG9fx8emUX1Wsh8Yg8tzK3K w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="286908480"
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="286908480"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 00:48:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="630603858"
Received: from lxy-dell.sh.intel.com ([10.239.48.38])
 by orsmga008.jf.intel.com with ESMTP; 02 Aug 2022 00:48:21 -0700
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
Subject: [PATCH v1 07/40] i386/tdx: Introduce is_tdx_vm() helper and cache
 tdx_guest object
Date: Tue,  2 Aug 2022 15:47:17 +0800
Message-Id: <20220802074750.2581308-8-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220802074750.2581308-1-xiaoyao.li@intel.com>
References: <20220802074750.2581308-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=xiaoyao.li@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_HI=-5,
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

It will need special handling for TDX VMs all around the QEMU.
Introduce is_tdx_vm() helper to query if it's a TDX VM.

Cache tdx_guest object thus no need to cast from ms->cgs every time.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 target/i386/kvm/tdx.c | 13 +++++++++++++
 target/i386/kvm/tdx.h | 10 ++++++++++
 2 files changed, 23 insertions(+)

diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
index 89f81f7d7082..fdd6bec58758 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -20,8 +20,16 @@
 #include "kvm_i386.h"
 #include "tdx.h"
 
+static TdxGuest *tdx_guest;
+
 static struct kvm_tdx_capabilities *tdx_caps;
 
+/* It's valid after kvm_confidential_guest_init()->kvm_tdx_init() */
+bool is_tdx_vm(void)
+{
+    return !!tdx_guest;
+}
+
 enum tdx_ioctl_level{
     TDX_PLATFORM_IOCTL,
     TDX_VM_IOCTL,
@@ -108,10 +116,15 @@ static void get_tdx_capabilities(void)
 
 int tdx_kvm_init(MachineState *ms, Error **errp)
 {
+    TdxGuest *tdx = (TdxGuest *)object_dynamic_cast(OBJECT(ms->cgs),
+                                                    TYPE_TDX_GUEST);
+
     if (!tdx_caps) {
         get_tdx_capabilities();
     }
 
+    tdx_guest = tdx;
+
     return 0;
 }
 
diff --git a/target/i386/kvm/tdx.h b/target/i386/kvm/tdx.h
index c8a23d95258d..4036ca2f3f99 100644
--- a/target/i386/kvm/tdx.h
+++ b/target/i386/kvm/tdx.h
@@ -1,6 +1,10 @@
 #ifndef QEMU_I386_TDX_H
 #define QEMU_I386_TDX_H
 
+#ifndef CONFIG_USER_ONLY
+#include CONFIG_DEVICES /* CONFIG_TDX */
+#endif
+
 #include "exec/confidential-guest-support.h"
 
 #define TYPE_TDX_GUEST "tdx-guest"
@@ -16,6 +20,12 @@ typedef struct TdxGuest {
     uint64_t attributes;    /* TD attributes */
 } TdxGuest;
 
+#ifdef CONFIG_TDX
+bool is_tdx_vm(void);
+#else
+#define is_tdx_vm() 0
+#endif /* CONFIG_TDX */
+
 int tdx_kvm_init(MachineState *ms, Error **errp);
 
 #endif /* QEMU_I386_TDX_H */
-- 
2.27.0


