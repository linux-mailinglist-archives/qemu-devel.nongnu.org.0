Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC19653B3D
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 05:26:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8D8l-0007os-W3; Wed, 21 Dec 2022 23:25:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1p8D8g-0007np-Qc
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 23:25:02 -0500
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1p8D8e-00015O-Ks
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 23:25:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671683100; x=1703219100;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=r+jZpDuAJgbF8qG2z8hJ/QknHZJhBEpM5YCmYell9u0=;
 b=jJuftZjdwySI55i3Z9oUee2l5oLobTxKFNsMP0HJeJxbv3o0UCMrzbkr
 4441ih/kdf3Xs4zGCYihAAM6yCbA8thA1WBIbiHZjJCuUe/eGM2IvFQqx
 eZbYdmT9vQVDGuwyeWuaiCsfjtWspYWtTBBItAlqJfu2axo7nNrnX5SJB
 6zFujskqGhyY/CdFDsd1e5QEvSouTtgyh24GBIQO8u/o3dGx98H8a4pK2
 /Yg3NOu/lrug9uxpefAeaPG+KTaDdsVYZk+dQqCLLIvr5oSc9D8POQ370
 Ln90qnsvT3NtmfntAl7+/2p2jd3QuvoVwrX9QmfRJTl5BRMwfTlbxn5YT Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="321957584"
X-IronPort-AV: E=Sophos;i="5.96,264,1665471600"; d="scan'208";a="321957584"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 20:24:55 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="601733189"
X-IronPort-AV: E=Sophos;i="5.96,264,1665471600"; d="scan'208";a="601733189"
Received: from iweiny-mobl.amr.corp.intel.com (HELO localhost)
 ([10.212.20.211])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 20:24:54 -0800
From: Ira Weiny <ira.weiny@intel.com>
Date: Wed, 21 Dec 2022 20:24:31 -0800
Subject: [PATCH v2 1/8] qemu/bswap: Add const_le64()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221221-ira-cxl-events-2022-11-17-v2-1-2ce2ecc06219@intel.com>
References: <20221221-ira-cxl-events-2022-11-17-v2-0-2ce2ecc06219@intel.com>
In-Reply-To: <20221221-ira-cxl-events-2022-11-17-v2-0-2ce2ecc06219@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Michael Tsirkin <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>
X-Mailer: b4 0.11.0-dev-141d4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1671683093; l=1569;
 i=ira.weiny@intel.com; s=20221211; h=from:subject:message-id;
 bh=r+jZpDuAJgbF8qG2z8hJ/QknHZJhBEpM5YCmYell9u0=;
 b=4U8LMfME7MtfbV2zXcVfJ6tolFzJKjjOLrvd5hsBWlgpAYj/h2hHLoDmaUVIoak86NiJ+kenVDRJ
 sftCVqvnAPwJkmfWkwFPRFkLGPQWAX5Mw7VGHPZ3mKVkqg2zJujp
X-Developer-Key: i=ira.weiny@intel.com; a=ed25519;
 pk=noldbkG+Wp1qXRrrkfY1QJpDf7QsOEthbOT7vm0PqsE=
Received-SPF: pass client-ip=134.134.136.65; envelope-from=ira.weiny@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Gcc requires constant versions of cpu_to_le* calls.

Add a 64 bit version.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>

---
Changes from RFC:
	Peter
		Change order of the definitions, 64-32-16
---
 include/qemu/bswap.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index 346d05f2aab3..e1eca22f2548 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -187,6 +187,15 @@ CPU_CONVERT(le, 64, uint64_t)
  * used to initialize static variables.
  */
 #if HOST_BIG_ENDIAN
+# define const_le64(_x)                          \
+    ((((_x) & 0x00000000000000ffU) << 56) |      \
+     (((_x) & 0x000000000000ff00U) << 40) |      \
+     (((_x) & 0x0000000000ff0000U) << 24) |      \
+     (((_x) & 0x00000000ff000000U) <<  8) |      \
+     (((_x) & 0x000000ff00000000U) >>  8) |      \
+     (((_x) & 0x0000ff0000000000U) >> 24) |      \
+     (((_x) & 0x00ff000000000000U) >> 40) |      \
+     (((_x) & 0xff00000000000000U) >> 56))
 # define const_le32(_x)                          \
     ((((_x) & 0x000000ffU) << 24) |              \
      (((_x) & 0x0000ff00U) <<  8) |              \
@@ -196,6 +205,7 @@ CPU_CONVERT(le, 64, uint64_t)
     ((((_x) & 0x00ff) << 8) |                    \
      (((_x) & 0xff00) >> 8))
 #else
+# define const_le64(_x) (_x)
 # define const_le32(_x) (_x)
 # define const_le16(_x) (_x)
 #endif

-- 
2.38.1

