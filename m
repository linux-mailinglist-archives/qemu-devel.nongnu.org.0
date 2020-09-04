Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5034025D249
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 09:24:13 +0200 (CEST)
Received: from localhost ([::1]:58872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kE64y-0006PC-55
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 03:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pannengyuan@huawei.com>)
 id 1kE63w-0005wo-Ol
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 03:23:08 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:38016 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pannengyuan@huawei.com>)
 id 1kE63u-0004fh-V1
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 03:23:08 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 8F76BE4B9323CB3B7DD6;
 Fri,  4 Sep 2020 15:23:01 +0800 (CST)
Received: from opensource.huawei.com (10.175.100.152) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Fri, 4 Sep 2020 15:22:53 +0800
From: Pan Nengyuan <pannengyuan@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] net/filter-rewriter: destroy g_hash_table in
 colo_rewriter_cleanup
Date: Fri, 4 Sep 2020 09:49:08 -0400
Message-ID: <20200904134908.1396-1-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.152]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=pannengyuan@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 03:23:03
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: chen.zhang@intel.com, jasowang@redhat.com,
 Pan Nengyuan <pannengyuan@huawei.com>, zhang.zhanghailiang@huawei.com,
 kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

s->connection_track_table forgot to destroy in colo_rewriter_cleanup. Fix it.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
---
 net/filter-rewriter.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c
index 1aaad101b6..9ff366d44f 100644
--- a/net/filter-rewriter.c
+++ b/net/filter-rewriter.c
@@ -376,6 +376,8 @@ static void colo_rewriter_cleanup(NetFilterState *nf)
         filter_rewriter_flush(nf);
         g_free(s->incoming_queue);
     }
+
+    g_hash_table_destroy(s->connection_track_table);
 }
 
 static void colo_rewriter_setup(NetFilterState *nf, Error **errp)
-- 
2.18.2


