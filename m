Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A544336F5FE
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 08:54:36 +0200 (CEST)
Received: from localhost ([::1]:45110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcN2p-0006oU-L9
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 02:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lcMfO-0006Di-RS
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 02:30:25 -0400
Received: from mga11.intel.com ([192.55.52.93]:63439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lcMfI-00016y-5s
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 02:30:22 -0400
IronPort-SDR: cS+xBtmNPWca145GbL+5PcpPdLLu+/c6wm0aNS+rY3BxooGzhvlUAFLZDna89bEdHPjZ1AoKF7
 cC/lazZNvhyQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="194023189"
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="194023189"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 23:29:02 -0700
IronPort-SDR: +bFvauIm8K5Ajf4exfdXm7b0aRDhmwVVxuIj4Zx8U5NRuB1/KQF82a8+c67WpMAtXcyjvLwVg8
 4lC+ewpRwGcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="387258659"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga003.jf.intel.com with ESMTP; 29 Apr 2021 23:29:00 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [RESEND PATCH 28/32] bitops: Support 32 and 64 bit mask macro
Date: Fri, 30 Apr 2021 14:24:51 +0800
Message-Id: <20210430062455.8117-29-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210430062455.8117-1-yang.zhong@intel.com>
References: <20210430062455.8117-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=yang.zhong@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, kai.huang@intel.com,
 seanjc@google.com
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
index 3acbf3384c..8678c8dcd5 100644
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


