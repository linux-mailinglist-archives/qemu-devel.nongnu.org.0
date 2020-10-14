Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2155528DA85
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Oct 2020 09:35:27 +0200 (CEST)
Received: from localhost ([::1]:37820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSbJk-0006fI-SH
	for lists+qemu-devel@lfdr.de; Wed, 14 Oct 2020 03:35:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1kSbDB-0007qL-Ne
 for qemu-devel@nongnu.org; Wed, 14 Oct 2020 03:28:37 -0400
Received: from mga05.intel.com ([192.55.52.43]:54365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1kSbDA-00041U-4A
 for qemu-devel@nongnu.org; Wed, 14 Oct 2020 03:28:37 -0400
IronPort-SDR: 6WjziNfwlPTwbOCLO2kjTh1DrQNtNFxOdrZX9V9YsC0BRcVZC6SlMwLC3DTM1p8DLuApEg4Okx
 DqlxBqexPufQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="250751933"
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; d="scan'208";a="250751933"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2020 00:28:32 -0700
IronPort-SDR: reEkN+RWHr+X0/hmgBGmOJ+x8Eb6UuR3aO37kQ1fAvZHCqftGKJpd8WuC4scYA27d3rVG5yAVc
 T5U3k61i8zWw==
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; d="scan'208";a="521323052"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2020 00:28:30 -0700
From: Zhang Chen <chen.zhang@intel.com >
To: Jason Wang <jasowang@redhat.com>,
	qemu-dev <qemu-devel@nongnu.org>
Subject: [PATCH 06/10] colo-compare: check mark in mutual exclusion
Date: Wed, 14 Oct 2020 15:25:52 +0800
Message-Id: <20201014072555.12515-7-chen.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201014072555.12515-1-chen.zhang@intel.com>
References: <20201014072555.12515-1-chen.zhang@intel.com>
Received-SPF: pass client-ip=192.55.52.43; envelope-from=chen.zhang@intel.com;
 helo=mga05.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/14 03:28:22
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, FROM_ADDR_WS=2.999,
 FROM_WSP_TRAIL=2.199, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Zhang Chen <chen.zhang@intel.com>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Li Zhijian <lizhijian@cn.fujitsu.com>

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
---
 net/colo-compare.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 86980cef5e..24c366eec0 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -476,13 +476,11 @@ sec:
             colo_release_primary_pkt(s, ppkt);
             g_queue_push_head(&conn->secondary_list, spkt);
             goto pri;
-        }
-        if (mark == COLO_COMPARE_FREE_SECONDARY) {
+        } else if (mark == COLO_COMPARE_FREE_SECONDARY) {
             conn->compare_seq = spkt->seq_end;
             packet_destroy(spkt, NULL);
             goto sec;
-        }
-        if (mark == (COLO_COMPARE_FREE_PRIMARY | COLO_COMPARE_FREE_SECONDARY)) {
+        } else if (mark == (COLO_COMPARE_FREE_PRIMARY | COLO_COMPARE_FREE_SECONDARY)) {
             conn->compare_seq = ppkt->seq_end;
             colo_release_primary_pkt(s, ppkt);
             packet_destroy(spkt, NULL);
-- 
2.17.1


