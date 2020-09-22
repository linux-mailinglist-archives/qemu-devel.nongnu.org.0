Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA04273F0F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 11:59:11 +0200 (CEST)
Received: from localhost ([::1]:41750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKf4o-0004vE-MY
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 05:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@cn.fujitsu.com>)
 id 1kKf1f-0000g9-Oh
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 05:55:55 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:51551
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@cn.fujitsu.com>) id 1kKf1d-0001hD-V6
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 05:55:55 -0400
X-IronPort-AV: E=Sophos;i="5.77,290,1596470400"; d="scan'208";a="99500714"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 22 Sep 2020 17:55:47 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id F1E7948990CB;
 Tue, 22 Sep 2020 17:55:42 +0800 (CST)
Received: from G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 22 Sep 2020 17:55:40 +0800
Received: from FNSTPC.g08.fujitsu.local (10.167.226.45) by
 G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Tue, 22 Sep 2020 17:55:41 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <chen.zhang@intel.com>, <jasowang@redhat.com>
Subject: [PATCH 3/3] colo-compare: check mark in mutual exclusion
Date: Tue, 22 Sep 2020 17:55:25 +0800
Message-ID: <20200922095525.4081603-4-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922095525.4081603-1-lizhijian@cn.fujitsu.com>
References: <20200922095525.4081603-1-lizhijian@cn.fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: F1E7948990CB.AC3C0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lizhijian@cn.fujitsu.com
Received-SPF: none client-ip=183.91.158.132;
 envelope-from=lizhijian@cn.fujitsu.com; helo=heian.cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 05:55:42
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 net/colo-compare.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 039b515611..19633fc684 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -481,13 +481,11 @@ sec:
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
2.28.0




