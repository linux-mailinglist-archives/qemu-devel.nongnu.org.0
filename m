Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1502B4874DB
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 10:38:11 +0100 (CET)
Received: from localhost ([::1]:33332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5lhK-00047Y-5d
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 04:38:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1n5lbj-0006PX-2l
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 04:32:23 -0500
Received: from mga05.intel.com ([192.55.52.43]:22256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1n5lbS-00077r-6X
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 04:32:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641547926; x=1673083926;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ld+KU0oePtrmTcLFo2dcOYDAD5DZyYq6SwK23wCo4Ko=;
 b=BdarNkrzci8gKCLvxU7oJcvvddgRJT5t24MbJOzjieWJmOaESZvR5IBS
 2f8HH9AQQIS5l/rMpg3yQ0RTHmk5Yv1OixdeKuESpYo7J0bXgjP3/1kbs
 pZeMAFUm8LUhrfObqrA9TIFMx7YU2JEk2bMrwNOSuO58UMeex0HmuGkMf
 GbZ4XE66l/DpgrDz8BZUJ1kXaXsaHXMaBYAemT24VGfEOMK09MlPYgJH6
 9R6bF1oK7tKJnI5q60nLhA1Zei2rtNkr8bcq/bEmjy4mYlz3otD7w1gcx
 7d5qe2IaZiqpgG8FRv7nMiG4zPhpo0UDymHF5ueg0hNOt3xWLSydkns1P A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="329184202"
X-IronPort-AV: E=Sophos;i="5.88,269,1635231600"; d="scan'208";a="329184202"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 01:31:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,269,1635231600"; d="scan'208";a="527239107"
Received: from 984fee00bf64.jf.intel.com ([10.165.54.77])
 by fmsmga007.fm.intel.com with ESMTP; 07 Jan 2022 01:31:43 -0800
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 4/7] x86: Add XFD faulting bit for state components
Date: Fri,  7 Jan 2022 01:31:31 -0800
Message-Id: <20220107093134.136441-5-yang.zhong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107093134.136441-1-yang.zhong@intel.com>
References: <20220107093134.136441-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=yang.zhong@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 target/i386/cpu.h         | 2 +-
 target/i386/cpu.c         | 2 +-
 target/i386/kvm/kvm-cpu.c | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 79023fe723..22f7ff40a6 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1375,7 +1375,7 @@ QEMU_BUILD_BUG_ON(sizeof(XSaveXTILE_DATA) != 0x2000);
 typedef struct ExtSaveArea {
     uint32_t feature, bits;
     uint32_t offset, size;
-    uint32_t need_align;
+    uint32_t need_align, support_xfd;
 } ExtSaveArea;
 
 #define XSAVE_STATE_AREA_COUNT (XSTATE_XTILE_DATA_BIT + 1)
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index dd2c919c33..1adc3f0f99 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5495,7 +5495,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
                 const ExtSaveArea *esa = &x86_ext_save_areas[count];
                 *eax = esa->size;
                 *ebx = esa->offset;
-                *ecx = esa->need_align << 1;
+                *ecx = (esa->need_align << 1) | (esa->support_xfd << 2);
             }
         }
         break;
diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index 6c4c1c6f9d..3b3c203f11 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -108,6 +108,7 @@ static void kvm_cpu_xsave_init(void)
 
             uint32_t ecx = kvm_arch_get_supported_cpuid(s, 0xd, i, R_ECX);
             esa->need_align = ecx & (1u << 1) ? 1 : 0;
+            esa->support_xfd = ecx & (1u << 2) ? 1 : 0;
         }
     }
 }

