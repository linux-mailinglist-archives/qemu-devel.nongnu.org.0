Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F2A59CB71
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 00:30:26 +0200 (CEST)
Received: from localhost ([::1]:54050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQFw9-0004uT-Oa
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 18:30:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQFqK-0001MG-Dn
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 18:24:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQFqF-0004ZL-UP
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 18:24:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661207058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o5VG/ttpirsoROMkhajAhBK+WvpGTEsN9HDC3Gzi+Eg=;
 b=e+KeijKnLYraJX1OH/tQVcvH2y+5VR5xu2r//Q55xuEwccqEdi8qNMCN5Bp1XVlTa3WPO+
 B1HRtnV8o8rh1Zc8MYMnhsrrlpeTJhOv56gJPkZOuLsvPKzjLcJY0mgRLpQeXqJTgJZAue
 v20f1vncXGF/jdE7V8+zUzngwYiaywM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-w0_Sj2oSN7OpkgaxCbJbHg-1; Mon, 22 Aug 2022 18:24:15 -0400
X-MC-Unique: w0_Sj2oSN7OpkgaxCbJbHg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89ED529ABA3E;
 Mon, 22 Aug 2022 22:24:14 +0000 (UTC)
Received: from localhost (unknown [10.39.192.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06ECC40CFD0A;
 Mon, 22 Aug 2022 22:24:13 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Peter Xu <peterx@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, integration@gluster.org,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>, sgarzare@redhat.com,
 Alberto Faria <afaria@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Eric Blake <eblake@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jeff Cody <codyprime@gmail.com>, Xie Changlong <xiechanglong.d@gmail.com>
Subject: [RFC v4 03/11] block: pass size to bdrv_unregister_buf()
Date: Mon, 22 Aug 2022 18:23:54 -0400
Message-Id: <20220822222402.176088-4-stefanha@redhat.com>
In-Reply-To: <20220822222402.176088-1-stefanha@redhat.com>
References: <20220822222402.176088-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
index 0a8cbefe86..af85fa4bcc 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3305,16 +3305,16 @@ void bdrv_register_buf(BlockDriverState *bs, void *host, size_t size)
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
index 7d4b33b3da..b8a8818ddb 100644
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
2.37.2


