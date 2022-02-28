Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 105374C64B1
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 09:17:16 +0100 (CET)
Received: from localhost ([::1]:46094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nObDR-00032t-P4
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 03:17:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nOb2C-0008IZ-S1
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 03:05:33 -0500
Received: from mga14.intel.com ([192.55.52.115]:50059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nOb28-0005a2-5p
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 03:05:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646035528; x=1677571528;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hRD+yjUUUZjvfyx59uh+M/o6AEXqfzg9f9pmaQvETkw=;
 b=JBo1k/qGSwmuSZmqPyb5kHbjb0FEBNNnqSJSl+/V1wOxv1R7fwbQoCu+
 KwW9QF04xDuvGsnE0cDGnHUNcankGcr0t01q2SOjGcKvdje/e3fzE8i3H
 61iW6BnlHlDnA+Y31lFVT/wDwRl4ZeLK4+NXmBb5RUqxDg42mdvl4JPnh
 HKIfrRhjW2oqvvT1D6GyzQeAZ0AuITA+BojgBdA0XCGSUFEsCZUPDbKjE
 KCKGeYuLIUcdn9hgFSH8e7YzrSF1UK5ihbVdhFfjfupIYxKB644fECGl7
 Fn5WwwO88GQ1rOvqPNCkHqQxfvzczP0HIgKOi8VczSR8hLW2FMFnRdlMv A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="253021643"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="253021643"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 00:05:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="778014585"
Received: from 984fee00bf64.jf.intel.com ([10.165.54.77])
 by fmsmga006.fm.intel.com with ESMTP; 28 Feb 2022 00:05:17 -0800
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/8] x86: Add XFD faulting bit for state components
Date: Mon, 28 Feb 2022 00:05:11 -0800
Message-Id: <20220228080515.42357-5-yang.zhong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228080515.42357-1-yang.zhong@intel.com>
References: <20220228080515.42357-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=yang.zhong@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
---
 target/i386/cpu.h | 2 ++
 target/i386/cpu.c | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 9630f4712a..925d0129e2 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -557,8 +557,10 @@ typedef enum X86Seg {
 #define XSTATE_DYNAMIC_MASK             (XSTATE_XTILE_DATA_MASK)
 
 #define ESA_FEATURE_ALIGN64_BIT         1
+#define ESA_FEATURE_XFD_BIT             2
 
 #define ESA_FEATURE_ALIGN64_MASK        (1U << ESA_FEATURE_ALIGN64_BIT)
+#define ESA_FEATURE_XFD_MASK            (1U << ESA_FEATURE_XFD_BIT)
 
 
 /* CPUID feature words */
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 505ee289bc..79e24bb23f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5496,7 +5496,8 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
                 const ExtSaveArea *esa = &x86_ext_save_areas[count];
                 *eax = esa->size;
                 *ebx = esa->offset;
-                *ecx = esa->ecx & ESA_FEATURE_ALIGN64_MASK;
+                *ecx = esa->ecx &
+                       (ESA_FEATURE_ALIGN64_MASK | ESA_FEATURE_XFD_MASK);
             }
         }
         break;

