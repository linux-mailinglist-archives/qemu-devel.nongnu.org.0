Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 307D06426D0
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 11:38:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p28An-0001Dc-QU; Mon, 05 Dec 2022 04:54:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p28Aj-0001B1-4K
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 04:54:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p28Af-0006YW-EM
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 04:53:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670234036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yv32VybYVhxmtkUKSRTxJbrtrMCQayUU3iWUHvoUh0A=;
 b=CVrFhvGDbIJBawFCUO1V5nQ3tkm+tMTHYJykUOXQyKmmz9cC2JmscAg4BFMnW9p9IxiZbL
 O/wvTxYmP5Hj+FfJwf8ZBwcKLOAs8whSMF6PkNxNyiN8rGcBKE0LF1lj2jRJm2vcW12hZQ
 L2BIuSA27pqhZIA21ZB+bg6YTWGmcck=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-4ZY-NG3LODKLWCT2EFEwLQ-1; Mon, 05 Dec 2022 04:53:53 -0500
X-MC-Unique: 4ZY-NG3LODKLWCT2EFEwLQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26DC53C0F663;
 Mon,  5 Dec 2022 09:53:52 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A9DD2166B29;
 Mon,  5 Dec 2022 09:53:44 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <huth@tuxfamily.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 virtio-fs@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, qemu-block@nongnu.org,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Thomas Huth <thuth@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Song Gao <gaosong@loongson.cn>, qemu-s390x@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Klaus Jensen <its@irrelevant.dk>, John Snow <jsnow@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Keith Busch <kbusch@kernel.org>, David Hildenbrand <david@redhat.com>,
 qemu-trivial@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 09/51] block-backend: avoid bdrv_unregister_buf() NULL
 pointer deref
Date: Mon,  5 Dec 2022 10:51:46 +0100
Message-Id: <20221205095228.1314-10-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Stefan Hajnoczi <stefanha@redhat.com>

bdrv_*() APIs expect a valid BlockDriverState. Calling them with bs=NULL
leads to undefined behavior.

Jonathan Cameron reported this following NULL pointer dereference when a
VM with a virtio-blk device and a memory-backend-file object is
terminated:
1. qemu_cleanup() closes all drives, setting blk->root to NULL
2. qemu_cleanup() calls user_creatable_cleanup(), which results in a RAM
   block notifier callback because the memory-backend-file is destroyed.
3. blk_unregister_buf() is called by virtio-blk's BlockRamRegistrar
   notifier callback and undefined behavior occurs.

Fixes: baf422684d73 ("virtio-blk: use BDRV_REQ_REGISTERED_BUF optimization hint")
Co-authored-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20221121211923.1993171-1-stefanha@redhat.com>
---
 block/block-backend.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index b48c91f4e1..d98a96ff37 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2576,14 +2576,25 @@ static void blk_root_drained_end(BdrvChild *child, int *drained_end_counter)
 
 bool blk_register_buf(BlockBackend *blk, void *host, size_t size, Error **errp)
 {
+    BlockDriverState *bs = blk_bs(blk);
+
     GLOBAL_STATE_CODE();
-    return bdrv_register_buf(blk_bs(blk), host, size, errp);
+
+    if (bs) {
+        return bdrv_register_buf(bs, host, size, errp);
+    }
+    return true;
 }
 
 void blk_unregister_buf(BlockBackend *blk, void *host, size_t size)
 {
+    BlockDriverState *bs = blk_bs(blk);
+
     GLOBAL_STATE_CODE();
-    bdrv_unregister_buf(blk_bs(blk), host, size);
+
+    if (bs) {
+        bdrv_unregister_buf(bs, host, size);
+    }
 }
 
 int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
-- 
2.38.1


