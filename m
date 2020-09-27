Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A537327A12C
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Sep 2020 15:09:17 +0200 (CEST)
Received: from localhost ([::1]:36186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMWQW-0004QW-JD
	for lists+qemu-devel@lfdr.de; Sun, 27 Sep 2020 09:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kMWMX-00081g-EL
 for qemu-devel@nongnu.org; Sun, 27 Sep 2020 09:05:09 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:60448 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kMWMV-0003Nt-F2
 for qemu-devel@nongnu.org; Sun, 27 Sep 2020 09:05:09 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 03E51313DBA182BE1FC0;
 Sun, 27 Sep 2020 21:04:50 +0800 (CST)
Received: from localhost (10.174.185.104) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Sun, 27 Sep 2020
 21:04:41 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 5/7] virtio-blk: disable I/O hang when resetting
Date: Sun, 27 Sep 2020 21:04:18 +0800
Message-ID: <20200927130420.1095-6-fangying1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20200927130420.1095-1-fangying1@huawei.com>
References: <20200927130420.1095-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.104]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/27 09:04:49
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
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
Cc: kwolf@redhat.com, Ying Fang <fangying1@huawei.com>,
 Jiahui Cen <cenjiahui@huawei.com>, zhang.zhanghailiang@huawei.com,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All AIOs including the hanging AIOs need to be drained when resetting
virtio-blk. So it is necessary to disable I/O hang before resetting
and enable I/O hang again after resetting if I/O hang is enabled.

Signed-off-by: Ying Fang <fangying1@huawei.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
---
 hw/block/virtio-blk.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 2204ba149e..11837a54f5 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -892,6 +892,10 @@ static void virtio_blk_reset(VirtIODevice *vdev)
     AioContext *ctx;
     VirtIOBlockReq *req;
 
+    if (blk_iohang_is_enabled(s->blk)) {
+        blk_rehandle_disable(s->blk);
+    }
+
     ctx = blk_get_aio_context(s->blk);
     aio_context_acquire(ctx);
     blk_drain(s->blk);
@@ -909,6 +913,10 @@ static void virtio_blk_reset(VirtIODevice *vdev)
 
     assert(!s->dataplane_started);
     blk_set_enable_write_cache(s->blk, s->original_wce);
+
+    if (blk_iohang_is_enabled(s->blk)) {
+        blk_rehandle_enable(s->blk);
+    }
 }
 
 /* coalesce internal state, copy to pci i/o region 0
-- 
2.23.0


