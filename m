Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4425F707C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 23:42:00 +0200 (CEST)
Received: from localhost ([::1]:45000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogYcx-0005Gs-5f
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 17:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogYWf-00039V-3i
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 17:35:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogYWd-0006mg-3N
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 17:35:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665092126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UP9I4eVyXrRvYhfhv/f4mIPWi1FXnAnj3msdPoFE7J4=;
 b=YG8nDQagc8c4qy2ekscXPQXVwskjU5lWxp/WeMWQLANFxbjdD//OsiPzMhZ5/03dWSR2Es
 H6y4m5SUoQDgjftLQNcC/41QWFY3K8UMO/xC3dR9PqYvtAPf4oIbLaWfzgNU4dzNj3XJqi
 ZWMR5HQmh6d0389MZM+n/++P6K9HwYo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-zFk7Cf8mMLmuBiQy46_XtA-1; Thu, 06 Oct 2022 17:35:22 -0400
X-MC-Unique: zFk7Cf8mMLmuBiQy46_XtA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95FC1185A794;
 Thu,  6 Oct 2022 21:35:21 +0000 (UTC)
Received: from localhost (unknown [10.39.193.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF7E0535939;
 Thu,  6 Oct 2022 21:35:20 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yanan Wang <wangyanan55@huawei.com>, sgarzare@redhat.com,
 "Richard W.M. Jones" <rjones@redhat.com>, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>, David Hildenbrand <david@redhat.com>,
 integration@gluster.org, qemu-block@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 afaria@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Xie Changlong <xiechanglong.d@gmail.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jeff Cody <codyprime@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Peter Xu <peterx@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wen Congyang <wencongyang2@huawei.com>
Subject: [PATCH v6 04/13] block: pass size to bdrv_unregister_buf()
Date: Thu,  6 Oct 2022 17:34:58 -0400
Message-Id: <20221006213507.645402-5-stefanha@redhat.com>
In-Reply-To: <20221006213507.645402-1-stefanha@redhat.com>
References: <20221006213507.645402-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
index d4a5df2ac2..99141f8f06 100644
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
index c3200bcdff..fa34e6c61d 100644
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
index 01fb28aa63..696502acea 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1592,7 +1592,7 @@ static void nvme_register_buf(BlockDriverState *bs, void *host, size_t size)
     }
 }
 
-static void nvme_unregister_buf(BlockDriverState *bs, void *host)
+static void nvme_unregister_buf(BlockDriverState *bs, void *host, size_t size)
 {
     BDRVNVMeState *s = bs->opaque;
 
diff --git a/qemu-img.c b/qemu-img.c
index cab9776f42..1dd5efe840 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -4368,7 +4368,7 @@ static int img_bench(int argc, char **argv)
     struct timeval t1, t2;
     int i;
     bool force_share = false;
-    size_t buf_size;
+    size_t buf_size = 0;
 
     for (;;) {
         static const struct option long_options[] = {
@@ -4590,7 +4590,7 @@ static int img_bench(int argc, char **argv)
 
 out:
     if (data.buf) {
-        blk_unregister_buf(blk, data.buf);
+        blk_unregister_buf(blk, data.buf, buf_size);
     }
     qemu_vfree(data.buf);
     blk_unref(blk);
-- 
2.37.3


