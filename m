Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3424A28FDD7
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Oct 2020 07:56:41 +0200 (CEST)
Received: from localhost ([::1]:34374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTIjH-0007uf-OI
	for lists+qemu-devel@lfdr.de; Fri, 16 Oct 2020 01:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1kTIhQ-0006HK-PE
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 01:54:44 -0400
Received: from mga01.intel.com ([192.55.52.88]:36621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1kTIhO-0005D7-5W
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 01:54:43 -0400
IronPort-SDR: oLBUoeeDuunggHrEOXm1toV9lzSbPDZi1xK+Kr8W7bF7XYryxTT0cD0kuHwKpLsPSe000zwtB/
 Qfc8Xfj7T68A==
X-IronPort-AV: E=McAfee;i="6000,8403,9775"; a="184094646"
X-IronPort-AV: E=Sophos;i="5.77,381,1596524400"; d="scan'208";a="184094646"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2020 22:54:39 -0700
IronPort-SDR: gM7UHYQw3msv/OULIYutLuWIWz5cJDrA35eAK2skMnJ81v5nBcXjRr2mbrIqsFGaz5kLXFi4jZ
 WL/kT7dmA6wA==
X-IronPort-AV: E=Sophos;i="5.77,381,1596524400"; d="scan'208";a="464572811"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2020 22:54:37 -0700
From: Zhang Chen <chen.zhang@intel.com >
To: Jason Wang <jasowang@redhat.com>,
	qemu-dev <qemu-devel@nongnu.org>
Subject: [PATCH V2 02/10] Optimize seq_sorter function for colo-compare
Date: Fri, 16 Oct 2020 13:52:00 +0800
Message-Id: <20201016055208.7969-3-chen.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201016055208.7969-1-chen.zhang@intel.com>
References: <20201016055208.7969-1-chen.zhang@intel.com>
Received-SPF: pass client-ip=192.55.52.88; envelope-from=chen.zhang@intel.com;
 helo=mga01.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/16 01:54:36
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, FROM_ADDR_WS=2.996,
 FROM_WSP_TRAIL=1, HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Cc: Derek Su <dereksu@qnap.com>, Zhang Chen <chen.zhang@intel.com>, "Rao,
 Lei" <lei.rao@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

The seq of tcp has been filled in fill_pkt_tcp_info, it
can be used directly here.

Signed-off-by: Lei Rao <lei.rao@intel.com>
Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Li Zhijian <lizhijian@cn.fujitsu.com>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
---
 net/colo-compare.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 3a45d64175..a35c10fb59 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -194,13 +194,10 @@ static void colo_compare_inconsistency_notify(CompareState *s)
     }
 }
 
+/* Use restricted to colo_insert_packet() */
 static gint seq_sorter(Packet *a, Packet *b, gpointer data)
 {
-    struct tcp_hdr *atcp, *btcp;
-
-    atcp = (struct tcp_hdr *)(a->transport_header);
-    btcp = (struct tcp_hdr *)(b->transport_header);
-    return ntohl(atcp->th_seq) - ntohl(btcp->th_seq);
+    return a->tcp_seq - b->tcp_seq;
 }
 
 static void fill_pkt_tcp_info(void *data, uint32_t *max_ack)
-- 
2.17.1


