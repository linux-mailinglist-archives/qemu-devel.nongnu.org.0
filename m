Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB0245536F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 04:32:57 +0100 (CET)
Received: from localhost ([::1]:57478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnYAS-0004wT-NL
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 22:32:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mnY89-0002js-CC
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 22:30:33 -0500
Received: from mga17.intel.com ([192.55.52.151]:40750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mnY87-0005cc-OE
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 22:30:32 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="214823511"
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; d="scan'208";a="214823511"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 19:30:24 -0800
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; d="scan'208";a="646265260"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 19:30:22 -0800
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH 2/2] net/colo-compare.c: Fix incorrect return when input wrong
 size
Date: Thu, 18 Nov 2021 11:20:11 +0800
Message-Id: <20211118032011.249517-2-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211118032011.249517-1-chen.zhang@intel.com>
References: <20211118032011.249517-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=chen.zhang@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Zhang Chen <chen.zhang@intel.com>, qemu-dev <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/colo-compare.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 1225f40e41..b966e7e514 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -807,7 +807,7 @@ static int compare_chr_send(CompareState *s,
     }
 
     if (!size) {
-        return 0;
+        return -1;
     }
 
     entry = g_slice_new(SendEntry);
-- 
2.25.1


