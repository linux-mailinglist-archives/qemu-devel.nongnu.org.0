Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE2E1E9F4E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jun 2020 09:32:28 +0200 (CEST)
Received: from localhost ([::1]:55306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jfevr-0006Ma-Ey
	for lists+qemu-devel@lfdr.de; Mon, 01 Jun 2020 03:32:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1jfeuM-0005GS-On
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 03:30:54 -0400
Received: from mga04.intel.com ([192.55.52.120]:4711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1jfeuK-0006rE-Jq
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 03:30:54 -0400
IronPort-SDR: EaynQEhYKTRKYv88pZxkTwuyQ9gVimQqIVKLgFTzxlNHN3hBinrB/ioJdSqR5klConXgWTNgnZ
 9dmvcgXohbEQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2020 00:30:44 -0700
IronPort-SDR: jea4ElHkJX1ZstD3Cg1QdjHzlyMcN4bLCd/kPcPwLDty2Lu6YHsSB+mlcai9AEJZ/8SuWiSZ4j
 AYTttizpnxOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,459,1583222400"; d="scan'208";a="257172799"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga007.jf.intel.com with ESMTP; 01 Jun 2020 00:30:42 -0700
From: Zhang Chen <chen.zhang@intel.com >
To: Alberto Garcia <berto@igalia.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-dev <qemu-devel@nongnu.org>
Subject: [PATCH] block/quorum.c: Decrease child index when del_child
Date: Mon,  1 Jun 2020 15:19:56 +0800
Message-Id: <20200601071956.18006-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=192.55.52.120; envelope-from=chen.zhang@intel.com;
 helo=mga04.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/01 03:30:45
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, FROM_ADDR_WS=2.999,
 FROM_WSP_TRAIL=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_MED=-2.3, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Jason Wang <jasowang@redhat.com>, Zhang Chen <chen.zhang@intel.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Chen <chen.zhang@intel.com>

Fix this bug:
colo: Can not recover colo after svm failover twice
https://bugs.launchpad.net/bugs/1881231

The child index still be hold when it be deleted, the max num is 32.

Reported-by: Ye.Zou <ye.zou@zstack.io>
Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 block/quorum.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/quorum.c b/block/quorum.c
index 7cf7ab1546..f71bd4e19d 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -1099,6 +1099,7 @@ static void quorum_del_child(BlockDriverState *bs, BdrvChild *child,
             (s->num_children - i - 1) * sizeof(BdrvChild *));
     s->children = g_renew(BdrvChild *, s->children, --s->num_children);
     bdrv_unref_child(bs, child);
+    s->next_child_index--;
 
     bdrv_drained_end(bs);
 }
-- 
2.17.1


