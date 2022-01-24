Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D8A497A07
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 09:11:50 +0100 (CET)
Received: from localhost ([::1]:54122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBuS5-00078S-JP
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 03:11:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nBuCM-0004eE-WC
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 02:55:35 -0500
Received: from mga07.intel.com ([134.134.136.100]:15234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nBuCK-0001Xg-Gn
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 02:55:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643010932; x=1674546932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/dwxPPmJw5EJiYIVoBCMtibab/UIhFz4CWkleu9Y02U=;
 b=ijYPIu8pFY/McqOTFhpMa1f3hHB+n4jA7l7Nzbiy+mlck/9FhGnYYOYH
 gwmAaXvqM3CrBW/A9hG1Xr2G0+8Q7M/mdIx5//OXUMHGHaX1cK+AmrTv0
 mmf8Y8qR8ZFBoksw+KQSJhb+gOiLpIkeybpZ2CpJ/oNHXASEorzlKmTPs
 TZsSGYOxC4o5KUdQVvZ+pWjDhwkTL68TNmKAHaF5EwH1dzGkGdFJfqyFL
 sYYWirQzIqoy6cbfWIdCAoiOrgSTRjWomj6cOAhw5rLID6lW47ZwgjQIr
 BBpGD6gM0bDRZQFWLBln9C+no/MUb/ezpsd+fGmedrIeLRnw20Mn2TqQ6 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="309310866"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="309310866"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2022 23:55:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="494530985"
Received: from 984fee00bf64.jf.intel.com ([10.165.54.77])
 by orsmga002.jf.intel.com with ESMTP; 23 Jan 2022 23:55:23 -0800
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] x86: Add XFD faulting bit for state components
Date: Sun, 23 Jan 2022 23:55:20 -0800
Message-Id: <20220124075523.108875-5-yang.zhong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124075523.108875-1-yang.zhong@intel.com>
References: <20220124075523.108875-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=yang.zhong@intel.com; helo=mga07.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
index 29b0348c25..ea13be0a19 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5499,7 +5499,8 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
                 const ExtSaveArea *esa = &x86_ext_save_areas[count];
                 *eax = esa->size;
                 *ebx = esa->offset;
-                *ecx = esa->ecx & ESA_FEATURE_ALIGN64_MASK;
+                *ecx = (esa->ecx & ESA_FEATURE_ALIGN64_MASK) |
+                       (esa->ecx & ESA_FEATURE_XFD_MASK);
             }
         }
         break;

