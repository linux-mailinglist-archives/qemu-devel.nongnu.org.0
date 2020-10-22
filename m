Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B66C8295F63
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 15:08:34 +0200 (CEST)
Received: from localhost ([::1]:56688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVaKX-0000XC-Pb
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 09:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kVaG5-000508-Hc; Thu, 22 Oct 2020 09:03:57 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5716 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kVaFx-0000gl-QH; Thu, 22 Oct 2020 09:03:57 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 38A7C7EC1835727B615C;
 Thu, 22 Oct 2020 21:03:43 +0800 (CST)
Received: from localhost (10.174.184.155) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Thu, 22 Oct 2020
 21:03:32 +0800
From: Jiahui Cen <cenjiahui@huawei.com>
To: <qemu-devel@nongnu.org>, <kwolf@redhat.com>, <mreitz@redhat.com>,
 <eblake@redhat.com>
Subject: [PATCH v3 6/9] virtio-blk: pause I/O hang when resetting
Date: Thu, 22 Oct 2020 21:03:00 +0800
Message-ID: <20201022130303.1092-7-cenjiahui@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201022130303.1092-1-cenjiahui@huawei.com>
References: <20201022130303.1092-1-cenjiahui@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.184.155]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=cenjiahui@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 09:03:44
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: cenjiahui@huawei.com, zhang.zhanghailiang@huawei.com, qemu-block@nongnu.org,
 stefanha@redhat.com, fangying1@huawei.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When resetting virtio-blk, we have to drain all AIOs but do not care about the
results. So it is necessary to disable I/O hang before resetting virtio-blk,
and enable it after resetting.

Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 hw/block/virtio-blk.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index bac2d6fa2b..f96e4ac274 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -899,6 +899,10 @@ static void virtio_blk_reset(VirtIODevice *vdev)
     AioContext *ctx;
     VirtIOBlockReq *req;
 
+    if (blk_iohang_is_enabled(s->blk)) {
+        blk_rehandle_pause(s->blk);
+    }
+
     ctx = blk_get_aio_context(s->blk);
     aio_context_acquire(ctx);
     blk_drain(s->blk);
@@ -916,6 +920,10 @@ static void virtio_blk_reset(VirtIODevice *vdev)
 
     assert(!s->dataplane_started);
     blk_set_enable_write_cache(s->blk, s->original_wce);
+
+    if (blk_iohang_is_enabled(s->blk)) {
+        blk_rehandle_unpause(s->blk);
+    }
 }
 
 /* coalesce internal state, copy to pci i/o region 0
-- 
2.19.1


