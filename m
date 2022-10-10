Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 545165FA7D3
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 00:48:51 +0200 (CEST)
Received: from localhost ([::1]:55750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi1Zp-0004SM-Pz
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 18:48:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1oi1I5-0005tQ-92
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 18:30:29 -0400
Received: from mga02.intel.com ([134.134.136.20]:24675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1oi1I3-0005Dj-0v
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 18:30:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665441027; x=1696977027;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aJ1RcbZAq/8zOfhTcPqGwjNzmTWe3mf1nzcgNFpOldo=;
 b=AyhC/8BtvKrkAJCVs74rUVmTW7hEDAaqiwBmNvvfQcoqLh05+b4EstmI
 KbZgiJk+nYWGLN5kdq9UtEayQ7YI9K84BoGWJik6j2kkqHEuGhzZu93JE
 DjV21yS/wQ62533uDmR9qkwk5iUTaMK/oUZn87lzgQXVP4HkdAmkhRdps
 SYWTYSfQS8ZGaKkWwLLGKYO1VzOl7fqBRPjnzeAypVBcuI4dNYU8bjAYe
 NpErahAuMSifOVW38XioywxWgSZfeX6qIuTLZiM1JfWMUCcokeD+EauHB
 fzwyOFpmTg+IzpJOw/H4+dMnRNJ4mYPtmHk6vNDe6iFY0nSkx8IYZCVWz A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="291661237"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="291661237"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 15:30:19 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="628456969"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="628456969"
Received: from iweiny-mobl.amr.corp.intel.com (HELO localhost) ([10.212.104.4])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 15:30:19 -0700
From: ira.weiny@intel.com
To: Michael Tsirkin <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Ira Weiny <ira.weiny@intel.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org
Subject: [RFC PATCH 1/6] qemu/bswap: Add const_le64()
Date: Mon, 10 Oct 2022 15:29:39 -0700
Message-Id: <20221010222944.3923556-2-ira.weiny@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221010222944.3923556-1-ira.weiny@intel.com>
References: <20221010222944.3923556-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=ira.weiny@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 10 Oct 2022 18:44:32 -0400
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

From: Ira Weiny <ira.weiny@intel.com>

Gcc requires constant versions of cpu_to_le* calls.

Add a 64 bit version.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 include/qemu/bswap.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index 346d05f2aab3..08e607821102 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -192,10 +192,20 @@ CPU_CONVERT(le, 64, uint64_t)
      (((_x) & 0x0000ff00U) <<  8) |              \
      (((_x) & 0x00ff0000U) >>  8) |              \
      (((_x) & 0xff000000U) >> 24))
+# define const_le64(_x)                          \
+    ((((_x) & 0x00000000000000ffU) << 56) |      \
+     (((_x) & 0x000000000000ff00U) << 40) |      \
+     (((_x) & 0x0000000000ff0000U) << 24) |      \
+     (((_x) & 0x00000000ff000000U) <<  8) |      \
+     (((_x) & 0x000000ff00000000U) >>  8) |      \
+     (((_x) & 0x0000ff0000000000U) >> 24) |      \
+     (((_x) & 0x00ff000000000000U) >> 40) |      \
+     (((_x) & 0xff00000000000000U) >> 56))
 # define const_le16(_x)                          \
     ((((_x) & 0x00ff) << 8) |                    \
      (((_x) & 0xff00) >> 8))
 #else
+# define const_le64(_x) (_x)
 # define const_le32(_x) (_x)
 # define const_le16(_x) (_x)
 #endif
-- 
2.37.2


