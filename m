Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 977364EE6FF
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 06:03:05 +0200 (CEST)
Received: from localhost ([::1]:56028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na8V6-0004o3-H7
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 00:03:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1na8RS-0001yj-0K
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 23:59:18 -0400
Received: from mga18.intel.com ([134.134.136.126]:51140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1na8RP-0002sO-CO
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 23:59:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648785555; x=1680321555;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+KR3N9V7T8MqCND/Nwwc90Hdbu2yeWxQ07iPCUTk7qM=;
 b=ZvcE5KAnZmSJIMVgMbtAeBhpqZ9NRJn9tawKg89mGlVTj328h5cgZSEz
 6uZ1nSo7F//8M+DzfAegspVU+rf4KqullYdqjVbzh3Tgc1S7iUock119U
 7yEypWB7kDqIA/c/090F6fq6WXYmadSb7Xgqz6IaIlv28/EQh2E06oWr+
 DMNv/+4IdsbsM1dFeu3xTvI2snhUG+F4FRl8KIvkytHrNc6AmaUv8GEAZ
 XUizMml1kga3SakoKSyXmHcTU1JeBVxTtxZlV1qYbTK4I46KTEHspsAqd
 iofRcp/RGPqemWDyI1yzOap53h3y+owSJvb6y5GdFf7bsKwp5rEROKh0Z w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="242182899"
X-IronPort-AV: E=Sophos;i="5.90,226,1643702400"; d="scan'208";a="242182899"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 20:59:13 -0700
X-IronPort-AV: E=Sophos;i="5.90,226,1643702400"; d="scan'208";a="567105837"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 20:59:11 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH V2 2/4] net/colo: Fix a "double free" crash to clear the
 conn_list
Date: Fri,  1 Apr 2022 11:47:00 +0800
Message-Id: <20220401034702.687057-3-chen.zhang@intel.com>
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

But both connection_track_table and conn_list reference to the same
conn instance. It will trigger double free in conn_list clear. So this
patch remove free action on hash table side to avoid double free the
conn.

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


