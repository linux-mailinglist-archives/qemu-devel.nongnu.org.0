Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA484D2AFC
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 09:54:34 +0100 (CET)
Received: from localhost ([::1]:40796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRs5Z-0004PL-Rq
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 03:54:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nRs2S-0001hF-0m
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 03:51:20 -0500
Received: from mga17.intel.com ([192.55.52.151]:27163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nRs2Q-0000Ya-1u
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 03:51:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646815878; x=1678351878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BqicbkCklrMW9DQ9hWjf1KkDyWkX8bxlghBMjh+E9pA=;
 b=UFPHH0gDnYjQUH+iXXGBuGDIzlpm4bpWPqqUlGGEqiiBofX/WcO0fJc0
 knDM7pmRokc2vzZuSDTwtubiC5TGm2NzSGeu/I1YzejhrdCclxZSR+Qzo
 6P3C4PJrok+SoR5fNYqQYkFh7MfalIbACnaOvYLK0H6SCTqi6G9tR7SK+
 Qx1+QQ2qRwBqH8Ddw92Robtn5rwR9zBEFE2dPGJDY2hWf0MrPZ494D1+H
 31LwRzdxaN0+N4YWRTGAf5mVoQb6NBSZiaIT86AdeYzw4pCaCOUEDBPFv
 bfOPHehkEPp1zSdVtqqdEid09EmFpZqC9kfT7LZtdtqZvj6wWMQKe3UZe g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="235532276"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="235532276"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 00:51:15 -0800
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="554030858"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 00:51:14 -0800
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH 3/4] net/colo.c: No need to track conn_list for filter-rewriter
Date: Wed,  9 Mar 2022 16:38:57 +0800
Message-Id: <20220309083858.58117-4-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220309083858.58117-1-chen.zhang@intel.com>
References: <20220309083858.58117-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=chen.zhang@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Zhang Chen <chen.zhang@intel.com>, qemu-dev <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Filter-rewriter no need to track connection in conn_list.
This patch fix the glib g_queue_is_empty assertion when COLO guest
keep a lot of network connection.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/colo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/colo.c b/net/colo.c
index 1f8162f59f..694f3c93ef 100644
--- a/net/colo.c
+++ b/net/colo.c
@@ -218,7 +218,7 @@ Connection *connection_get(GHashTable *connection_track_table,
             /*
              * clear the conn_list
              */
-            while (!g_queue_is_empty(conn_list)) {
+            while (conn_list && !g_queue_is_empty(conn_list)) {
                 connection_destroy(g_queue_pop_head(conn_list));
             }
         }
-- 
2.25.1


