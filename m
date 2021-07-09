Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AC93C22C7
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 13:24:59 +0200 (CEST)
Received: from localhost ([::1]:58198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ocs-0006mL-93
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 07:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m1oUR-0001ZQ-Fa
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 07:16:15 -0400
Received: from mga06.intel.com ([134.134.136.31]:37177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m1oUO-0005B7-Dg
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 07:16:15 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10039"; a="270800871"
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="270800871"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 04:15:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="428730346"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga002.jf.intel.com with ESMTP; 09 Jul 2021 04:15:10 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 29/33] bitops: Support 32 and 64 bit mask macro
Date: Fri,  9 Jul 2021 19:09:51 +0800
Message-Id: <20210709110955.73256-30-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210709110955.73256-1-yang.zhong@intel.com>
References: <20210709110955.73256-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=yang.zhong@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yang.zhong@intel.com, seanjc@google.com, kai.huang@intel.com,
 jarkko@kernel.org, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Qemu should enable bit mask macro like Linux did in the
kernel, the GENMASK(h, l) and GENMASK_ULL(h, l) will set the
bit to 1 from l to h bit in the 32 bit or 64 bit long type.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 include/qemu/bitops.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
index 110c56e099..130d746ba3 100644
--- a/include/qemu/bitops.h
+++ b/include/qemu/bitops.h
@@ -18,6 +18,7 @@
 
 #define BITS_PER_BYTE           CHAR_BIT
 #define BITS_PER_LONG           (sizeof (unsigned long) * BITS_PER_BYTE)
+#define BITS_PER_LONG_LONG       64
 
 #define BIT(nr)                 (1UL << (nr))
 #define BIT_ULL(nr)             (1ULL << (nr))
@@ -28,6 +29,12 @@
 #define MAKE_64BIT_MASK(shift, length) \
     (((~0ULL) >> (64 - (length))) << (shift))
 
+#define GENMASK(h, l) \
+    (((~0UL) << (l)) & (~0UL >> (BITS_PER_LONG - 1 - (h))))
+
+#define GENMASK_ULL(h, l) \
+    (((~0ULL) << (l)) & (~0ULL >> (BITS_PER_LONG_LONG - 1 - (h))))
+
 /**
  * set_bit - Set a bit in memory
  * @nr: the bit to set
-- 
2.29.2.334.gfaefdd61ec


