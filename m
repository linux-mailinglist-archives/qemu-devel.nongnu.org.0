Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC2E60E83D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:04:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onldC-00085m-O6; Wed, 26 Oct 2022 15:00:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onldA-0007xT-1T
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:00:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onld8-00075U-Fl
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 14:59:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666810798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NaONcnRhtEi0W2P8kh1JNvpEgbIO9c1+p4x0tMgSSVg=;
 b=P8IDOPZKG31+P5tcGOfBEBd4Y8V0m5w4WtPLjdaPjAYVs6z/tI47ZG7qi8m5IiSQbwznBO
 CG9sPzvxVHvggdlHCdTSaXRRMhQBXcWfr0zd1PgHIjP0XEQf2LXC+drgeuLfMXBPtT+IaT
 MkOLXZOjACBye00F9kISdbDSQeIyVvw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-KoePP56lOESVEGbIXJ9XIQ-1; Wed, 26 Oct 2022 14:59:53 -0400
X-MC-Unique: KoePP56lOESVEGbIXJ9XIQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B480B3815D28;
 Wed, 26 Oct 2022 18:59:52 +0000 (UTC)
Received: from localhost (unknown [10.39.192.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D92011121315;
 Wed, 26 Oct 2022 18:59:51 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Thomas Huth <thuth@redhat.com>,
 integration@gluster.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Peter Xu <peterx@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, Xie Changlong <xiechanglong.d@gmail.com>,
 Jeff Cody <codyprime@gmail.com>, John Snow <jsnow@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Stefano Garzarella <sgarzare@redhat.com>
Subject: [PULL 04/13] block: pass size to bdrv_unregister_buf()
Date: Wed, 26 Oct 2022 14:58:37 -0400
Message-Id: <20221026185846.120544-5-stefanha@redhat.com>
In-Reply-To: <20221026185846.120544-1-stefanha@redhat.com>
References: <20221026185846.120544-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The only implementor of bdrv_register_buf() is block/nvme.c, where the
size is not needed when unregistering a buffer. This is because
util/vfio-helpers.c can look up mappings by address.

Future block drivers that implement bdrv_register_buf() may not be able
to do their job given only the buffer address. Add a size argument to
bdrv_unregister_buf().

Also document the assumptions about
bdrv_register_buf()/bdrv_unregister_buf() calls. The same <host, size>
values that were given to bdrv_register_buf() must be given to
bdrv_unregister_buf().

gcc 11.2.1 emits a spurious warning that img_bench()'s buf_size local
variable might be uninitialized, so it's necessary to silence the
compiler.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-id: 20221013185908.1297568-5-stefanha@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/block/block-global-state.h          | 5 ++++-
 include/block/block_int-common.h            | 2 +-
 include/sysemu/block-backend-global-state.h | 2 +-
 block/block-backend.c                       | 4 ++--
 block/io.c                                  | 6 +++---
 block/nvme.c                                | 2 +-
 qemu-img.c                                  | 4 ++--
 7 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index 21265e3966..7901f35863 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -243,9 +243,12 @@ void bdrv_del_child(BlockDriverState *parent, BdrvChild *child, Error **errp);
  * Register/unregister a buffer for I/O. For example, VFIO drivers are
  * interested to know the memory areas that would later be used for I/O, so
  * that they can prepare IOMMU mapping etc., to get better performance.
+ *
+ * Buffers must not overlap and they must be unregistered with the same <host,
+ * size> values that they were registered with.
  */
 void bdrv_register_buf(BlockDriverState *bs, void *host, size_t size);
-void bdrv_unregister_buf(BlockDriverState *bs, void *host);
+void bdrv_unregister_buf(BlockDriverState *bs, void *host, size_t size);
 
 void bdrv_cancel_in_flight(BlockDriverState *bs);
 
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 8947abab76..b7a7cbd3a5 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -435,7 +435,7 @@ struct BlockDriver {
      * DMA mapping for hot buffers.
      */
     void (*bdrv_register_buf)(BlockDriverState *bs, void *host, size_t size);
-    void (*bdrv_unregister_buf)(BlockDriverState *bs, void *host);
+    void (*bdrv_unregister_buf)(BlockDriverState *bs, void *host, size_t size);
 
     /*
      * This field is modified only under the BQL, and is part of
diff --git a/include/sysemu/block-backend-global-state.h b/include/sysemu/block-backend-global-state.h
index 415f0c91d7..97f7dad2c3 100644
--- a/include/sysemu/block-backend-global-state.h
+++ b/include/sysemu/block-backend-global-state.h
@@ -107,7 +107,7 @@ void blk_io_limits_update_group(BlockBackend *blk, const char *group);
 void blk_set_force_allow_inactivate(BlockBackend *blk);
 
 void blk_register_buf(BlockBackend *blk, void *host, size_t size);
-void blk_unregister_buf(BlockBackend *blk, void *host);
+void blk_unregister_buf(BlockBackend *blk, void *host, size_t size);
 
 const BdrvChild *blk_root(BlockBackend *blk);
 
diff --git a/block/block-backend.c b/block/block-backend.c
index aa4adf06ae..ae42474891 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2551,10 +2551,10 @@ void blk_register_buf(BlockBackend *blk, void *host, size_t size)
     bdrv_register_buf(blk_bs(blk), host, size);
 }
 
-void blk_unregister_buf(BlockBackend *blk, void *host)
+void blk_unregister_buf(BlockBackend *blk, void *host, size_t size)
 {
     GLOBAL_STATE_CODE();
-    bdrv_unregister_buf(blk_bs(blk), host);
+    bdrv_unregister_buf(blk_bs(blk), host, size);
 }
 
 int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
diff --git a/block/io.c b/block/io.c
index d30073036e..cca402bf7b 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3275,16 +3275,16 @@ void bdrv_register_buf(BlockDriverState *bs, void *host, size_t size)
     }
 }
 
-void bdrv_unregister_buf(BlockDriverState *bs, void *host)
+void bdrv_unregister_buf(BlockDriverState *bs, void *host, size_t size)
 {
     BdrvChild *child;
 
     GLOBAL_STATE_CODE();
     if (bs->drv && bs->drv->bdrv_unregister_buf) {
-        bs->drv->bdrv_unregister_buf(bs, host);
+        bs->drv->bdrv_unregister_buf(bs, host, size);
     }
     QLIST_FOREACH(child, &bs->children, next) {
-        bdrv_unregister_buf(child->bs, host);
+        bdrv_unregister_buf(child->bs, host, size);
     }
 }
 
diff --git a/block/nvme.c b/block/nvme.c
index 2b24f95164..94b76b16f2 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1602,7 +1602,7 @@ static void nvme_register_buf(BlockDriverState *bs, void *host, size_t size)
     }
 }
 
-static void nvme_unregister_buf(BlockDriverState *bs, void *host)
+static void nvme_unregister_buf(BlockDriverState *bs, void *host, size_t size)
 {
     BDRVNVMeState *s = bs->opaque;
 
diff --git a/qemu-img.c b/qemu-img.c
index ace3adf8ae..9fe94df650 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -4371,7 +4371,7 @@ static int img_bench(int argc, char **argv)
     struct timeval t1, t2;
     int i;
     bool force_share = false;
-    size_t buf_size;
+    size_t buf_size = 0;
 
     for (;;) {
         static const struct option long_options[] = {
@@ -4593,7 +4593,7 @@ static int img_bench(int argc, char **argv)
 
 out:
     if (data.buf) {
-        blk_unregister_buf(blk, data.buf);
+        blk_unregister_buf(blk, data.buf, buf_size);
     }
     qemu_vfree(data.buf);
     blk_unref(blk);
-- 
2.37.3


