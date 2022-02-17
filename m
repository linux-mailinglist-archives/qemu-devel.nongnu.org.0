Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C594B98C4
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 07:08:37 +0100 (CET)
Received: from localhost ([::1]:38614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKZy0-0002EW-Uz
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 01:08:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nKZuH-0006cs-AJ
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 01:04:46 -0500
Received: from mga18.intel.com ([134.134.136.126]:2007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nKZuF-0005os-Kx
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 01:04:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645077883; x=1676613883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wGJsbwQh33DrXPNfdzWxtDYQ48O6VitEiFhqf0Yh0MI=;
 b=KD7Aw/DZbPZN2dPYaediPG+8lbZ/H0obqv3OxBcy+oAEk+DqDrK0DJ1b
 OopZOlkRGaDdt8SbvYmlTwyOyBmPIk76e40iL/qCnYv87PyHViKKtwMUC
 B2tTldOEAfbV9+VAG7bUXHNsXwkdmvHKtwSKdagYvB84sp/mJsgoCh0x+
 ywTfQc5lVBg/RIvudifqarn9KpZARDxkNx1qG3FfkMJKgNlwmWXbVjRsx
 uqZJ/Z8DpPT+nwjno772DxBzFH6YwkyjY4NwkvRJDPdyfDJX3LcEQbcYZ
 /TmEcu3aVsiR9uoOJqbHuBzbsv18U69oPFFo5u8pnasVo3yhnZJHH/gVf g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="234332898"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="234332898"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 22:04:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="634318702"
Received: from 984fee00bf64.jf.intel.com ([10.165.54.77])
 by fmsmga002.fm.intel.com with ESMTP; 16 Feb 2022 22:04:35 -0800
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/8] x86: Add XFD faulting bit for state components
Date: Wed, 16 Feb 2022 22:04:30 -0800
Message-Id: <20220217060434.52460-5-yang.zhong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217060434.52460-1-yang.zhong@intel.com>
References: <20220217060434.52460-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=yang.zhong@intel.com; helo=mga18.intel.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: yang.zhong@intel.com, kevin.tian@intel.com, seanjc@google.com,
 jing2.liu@linux.intel.com, wei.w.wang@intel.com, guang.zeng@intel.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jing Liu <jing2.liu@intel.com>

Intel introduces XFD faulting mechanism for extended
XSAVE features to dynamically enable the features in
runtime. If CPUID (EAX=0Dh, ECX=n, n>1).ECX[2] is set
as 1, it indicates support for XFD faulting of this
state component.

Signed-off-by: Jing Liu <jing2.liu@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 target/i386/cpu.h | 2 ++
 target/i386/cpu.c | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d4ad0f56bd..f7fc2e97a6 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -558,8 +558,10 @@ typedef enum X86Seg {
 #define ARCH_REQ_XCOMP_GUEST_PERM       0x1025
 
 #define ESA_FEATURE_ALIGN64_BIT         1
+#define ESA_FEATURE_XFD_BIT             2
 
 #define ESA_FEATURE_ALIGN64_MASK        (1U << ESA_FEATURE_ALIGN64_BIT)
+#define ESA_FEATURE_XFD_MASK            (1U << ESA_FEATURE_XFD_BIT)
 
 
 /* CPUID feature words */
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 377d993438..5a7ee8c7e1 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5497,7 +5497,8 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
                 const ExtSaveArea *esa = &x86_ext_save_areas[count];
                 *eax = esa->size;
                 *ebx = esa->offset;
-                *ecx = esa->ecx & ESA_FEATURE_ALIGN64_MASK;
+                *ecx = (esa->ecx & ESA_FEATURE_ALIGN64_MASK) |
+                       (esa->ecx & ESA_FEATURE_XFD_MASK);
             }
         }
         break;

