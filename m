Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BE833FE25
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 05:20:07 +0100 (CET)
Received: from localhost ([::1]:44360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMk8k-0003yG-Hs
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 00:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lMk6d-00027y-0B
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 00:17:55 -0400
Received: from mga02.intel.com ([134.134.136.20]:25449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lMk6V-0004IM-Kr
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 00:17:54 -0400
IronPort-SDR: TL9M5cBE5GNMm/C+NA3xWkIypwAANai1dioPJQSKWuclJIKVvWCvS4WmvLS9cklvJ9yLUaQgzg
 68ohTYS/T5hw==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="176727963"
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="176727963"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 21:17:38 -0700
IronPort-SDR: tyqI3xru9bh3GUFTJ1yVJy9+TvQ4voDVm5nmxTLUyhUROMuFg4pfN5OmYXFlDeImYic8yS4RKQ
 T1q6e8TG/+UQ==
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="412913980"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 21:17:36 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>,
	qemu-dev <qemu-devel@nongnu.org>
Subject: [PULL 2/2] net/colo-compare.c: Optimize removal of secondary packet
Date: Thu, 18 Mar 2021 12:11:52 +0800
Message-Id: <20210318041152.59367-3-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210318041152.59367-1-chen.zhang@intel.com>
References: <20210318041152.59367-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=chen.zhang@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Zhang Chen <chen.zhang@intel.com>, Lukas Straub <lukasstraub2@web.de>,
 Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukas Straub <lukasstraub2@web.de>

g_queue_remove needs to look up the list entry first, but we
already have it as result and can remove it directly with
g_queue_delete_link.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
---
 net/colo-compare.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 2e819ffedb..9d1ad99941 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -691,7 +691,7 @@ static void colo_compare_packet(CompareState *s, Connection *conn,
         if (result) {
             colo_release_primary_pkt(s, pkt);
             packet_destroy(result->data, NULL);
-            g_queue_remove(&conn->secondary_list, result->data);
+            g_queue_delete_link(&conn->secondary_list, result);
         } else {
             /*
              * If one packet arrive late, the secondary_list or
-- 
2.25.1


