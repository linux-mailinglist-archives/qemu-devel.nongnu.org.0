Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 992A23CD431
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 13:55:37 +0200 (CEST)
Received: from localhost ([::1]:47332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Rs0-00026Y-Lp
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 07:55:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m5RS6-0007I5-PA
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 07:28:50 -0400
Received: from mga09.intel.com ([134.134.136.24]:16178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m5RS5-000611-08
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 07:28:50 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10049"; a="211035331"
X-IronPort-AV: E=Sophos;i="5.84,252,1620716400"; d="scan'208";a="211035331"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 04:28:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,252,1620716400"; d="scan'208";a="656813751"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by fmsmga006.fm.intel.com with ESMTP; 19 Jul 2021 04:28:00 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 29/33] bitops: Support 32 and 64 bit mask macro
Date: Mon, 19 Jul 2021 19:21:32 +0800
Message-Id: <20210719112136.57018-30-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210719112136.57018-1-yang.zhong@intel.com>
References: <20210719112136.57018-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24; envelope-from=yang.zhong@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

