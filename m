Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DC4363FCA
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 12:46:49 +0200 (CEST)
Received: from localhost ([::1]:53094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYRQW-0005OA-Sc
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 06:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lYR4d-0006Is-SO
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:24:11 -0400
Received: from mga17.intel.com ([192.55.52.151]:24095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lYR4c-00023F-6n
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:24:11 -0400
IronPort-SDR: p2WlWduuPWOC0PeYBXq86A4BEaLVPb1iRJyRZPtOnPRGlVJREIkBeNIu5GiNkyugq0K1TN/igd
 TUr8i/iaEd7g==
X-IronPort-AV: E=McAfee;i="6200,9189,9958"; a="175409340"
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="175409340"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2021 03:23:17 -0700
IronPort-SDR: C8XevKGe8fGCcVNDwPsP+xweYa8eSoFjX4O5o+4V3IptmAnqt/XCurQmqA8Y03UqERWIKLMroK
 IFOLo5WObapQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="419947527"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by fmsmga008.fm.intel.com with ESMTP; 19 Apr 2021 03:23:15 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 28/32] bitops: Support 32 and 64 bit mask macro
Date: Mon, 19 Apr 2021 18:01:52 +0800
Message-Id: <20210419100156.53504-29-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210419100156.53504-1-yang.zhong@intel.com>
References: <20210419100156.53504-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=yang.zhong@intel.com;
 helo=mga17.intel.com
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


