Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B310273F0A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 11:57:52 +0200 (CEST)
Received: from localhost ([::1]:36628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKf3X-0002re-Jx
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 05:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@cn.fujitsu.com>)
 id 1kKf1e-0000d5-Aj
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 05:55:54 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:51556
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@cn.fujitsu.com>) id 1kKf1a-0001kD-Qt
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 05:55:54 -0400
X-IronPort-AV: E=Sophos;i="5.77,290,1596470400"; d="scan'208";a="99500710"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 22 Sep 2020 17:55:41 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id D49C448990F1;
 Tue, 22 Sep 2020 17:55:39 +0800 (CST)
Received: from G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 22 Sep 2020 17:55:37 +0800
Received: from FNSTPC.g08.fujitsu.local (10.167.226.45) by
 G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Tue, 22 Sep 2020 17:55:37 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <chen.zhang@intel.com>, <jasowang@redhat.com>
Subject: [PATCH 1/3] colo-compare: return -1 if no packet is queued
Date: Tue, 22 Sep 2020 17:55:23 +0800
Message-ID: <20200922095525.4081603-2-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922095525.4081603-1-lizhijian@cn.fujitsu.com>
References: <20200922095525.4081603-1-lizhijian@cn.fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: D49C448990F1.ABB47
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

Return 0 will trigger a packet comparison

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 net/colo-compare.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 3a45d64175..039b515611 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -289,6 +289,7 @@ static int packet_enqueue(CompareState *s, int mode, Connection **con)
             "queue size too big, drop packet");
         packet_destroy(pkt, NULL);
         pkt = NULL;
+        return -1;
     }
 
     *con = conn;
-- 
2.28.0




