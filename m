Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7864D2B38
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 10:02:05 +0100 (CET)
Received: from localhost ([::1]:51634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRsCq-0003SV-Sm
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 04:02:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nRs2R-0001h7-Da
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 03:51:20 -0500
Received: from mga17.intel.com ([192.55.52.151]:27166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nRs2P-0000Ye-Hk
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 03:51:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646815877; x=1678351877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KDj8QbuXpSltycOHM7DUtH0boie3rPtvzhfhhKDiY6Y=;
 b=AT+9HtLKoKmyQG3/rl/g2MTGD/Fd4tXRwqWgcK3VlpSGDacip/NZrqMr
 HZLHhZZTr9NWIrAOFE9m5EWXVYnjjMrTSuYXC2U+zwzklQL2n2hY/HPmJ
 xtE4gR+3BmmcF0ogmdBm/55ZAl3ejNtVg/a5hMezMHrP2MawvWlo1xoC+
 RoNWAqI2JLvuYImpVuDy+qJAxOIZHYz2/PjGc2rn5HaX/mkZANFJ4mnw7
 zk4+XuwCxJqGCxyVkh3UQA0fPFKNt0aONfZlz0H67+I+Kfc4OmFzjg2q9
 yNm6FCFHR07my2ORt2F9aMS02Qdz4JzHDNSbneoC0VIYBz/tdFf0IK8nr g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="235532271"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="235532271"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 00:51:14 -0800
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="554030847"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 00:51:12 -0800
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH 2/4] net/colo: Fix a "double free" crash to clear the conn_list
Date: Wed,  9 Mar 2022 16:38:56 +0800
Message-Id: <20220309083858.58117-3-chen.zhang@intel.com>
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
Cc: Zhang Chen <chen.zhang@intel.com>, qemu-dev <qemu-devel@nongnu.org>,
 Like Xu <like.xu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We notice the QEMU may crash when the guest has too many
incoming network connections with the following log:

15197@1593578622.668573:colo_proxy_main : colo proxy connection hashtable full, clear it
free(): invalid pointer
[1]    15195 abort (core dumped)  qemu-system-x86_64 ....

This is because we create the s->connection_track_table with
g_hash_table_new_full() which is defined as:

GHashTable * g_hash_table_new_full (GHashFunc hash_func,
                       GEqualFunc key_equal_func,
                       GDestroyNotify key_destroy_func,
                       GDestroyNotify value_destroy_func);

The fourth parameter connection_destroy() will be called to free the
memory allocated for all 'Connection' values in the hashtable when
we call g_hash_table_remove_all() in the connection_hashtable_reset().

It's unnecessary because we clear the conn_list explicitly later,
and it's buggy when other agents try to call connection_get()
with the same connection_track_table.

Signed-off-by: Like Xu <like.xu@linux.intel.com>
Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/colo-compare.c    | 2 +-
 net/filter-rewriter.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 62554b5b3c..ab054cfd21 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -1324,7 +1324,7 @@ static void colo_compare_complete(UserCreatable *uc, Error **errp)
     s->connection_track_table = g_hash_table_new_full(connection_key_hash,
                                                       connection_key_equal,
                                                       g_free,
-                                                      connection_destroy);
+                                                      NULL);
 
     colo_compare_iothread(s);
 
diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c
index bf05023dc3..c18c4c2019 100644
--- a/net/filter-rewriter.c
+++ b/net/filter-rewriter.c
@@ -383,7 +383,7 @@ static void colo_rewriter_setup(NetFilterState *nf, Error **errp)
     s->connection_track_table = g_hash_table_new_full(connection_key_hash,
                                                       connection_key_equal,
                                                       g_free,
-                                                      connection_destroy);
+                                                      NULL);
     s->incoming_queue = qemu_new_net_queue(qemu_netfilter_pass_to_next, nf);
 }
 
-- 
2.25.1


