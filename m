Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A40794EE700
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 06:03:05 +0200 (CEST)
Received: from localhost ([::1]:56118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na8V6-0004v2-M1
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 00:03:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1na8RS-0001z8-IQ
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 23:59:19 -0400
Received: from mga18.intel.com ([134.134.136.126]:51135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1na8RQ-0002rm-9Q
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 23:59:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648785556; x=1680321556;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VEOvjFD4k6i7gSoK9//bs0L199HKmpI8ky3OQS0v42Q=;
 b=f5ZcawQkXNiMOm9+vXQQnSaTXI3p2KPw0YdFzdX1jCZ0jQ/ghKejK4sT
 tk246OqYqmU19R5KNa4rzWQdFTHlff04+5rZINjtPjiR9IqaJDz3LX57+
 xcSVdrpNfmSaS/bpHItkgmnbXKPrkMJqjWKhExfxeZPZu0K3fv2E6z2TI
 KV7u4M4EmAkfGpYz8hsSFzhbqqYGyRNyfXln08C4og1AWiw4apAoR4KQU
 4ULrAhv1W27Lc7zJOfteD67o2hEhQ2jz3VOtKJkI4q1QQqaEkrcBi+/+x
 ZdMZo25yoQ22HoZI72s8tVuHwmRZOyJ1Z8SDK4iJqbx7PXc+20RkhJ5HI g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="242182903"
X-IronPort-AV: E=Sophos;i="5.90,226,1643702400"; d="scan'208";a="242182903"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 20:59:15 -0700
X-IronPort-AV: E=Sophos;i="5.90,226,1643702400"; d="scan'208";a="567105864"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 20:59:13 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH V2 3/4] net/colo.c: No need to track conn_list for
 filter-rewriter
Date: Fri,  1 Apr 2022 11:47:01 +0800
Message-Id: <20220401034702.687057-4-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220401034702.687057-1-chen.zhang@intel.com>
References: <20220401034702.687057-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=chen.zhang@intel.com; helo=mga18.intel.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Zhang Chen <chen.zhang@intel.com>, qemu-dev <qemu-devel@nongnu.org>,
 Li Zhijian <lizhijian@fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Filter-rewriter no need to track connection in conn_list.
This patch fix the glib g_queue_is_empty assertion when COLO guest
keep a lot of network connection.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Li Zhijian <lizhijian@fujitsu.com>
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


