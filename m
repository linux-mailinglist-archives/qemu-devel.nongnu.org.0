Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B138F4E5140
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 12:23:38 +0100 (CET)
Received: from localhost ([::1]:42028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWz5V-0000pS-QG
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 07:23:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nWyzk-0000xm-UO
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:17:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nWyzi-0001z3-FA
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:17:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648034257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GuhMYgQSjvwA+WE+0m5ZgSh1iQlddJXFUZbFhus+bSY=;
 b=d84y8KNHdhce4XN2zxvddxIC5ARPxRnwVsfna1CqoZUW9n5ap8OmCyhL2VYSsmxJ/wEyGX
 r6+/NI0t2oyx6CkIzQbf6Fo3BF/PbC+xzZqwTHW8jnaiQ5U3S0c00luWnslGWZ54Smzq3f
 FexbGlwYB03g9q0efcnT1Xp53WoZ/kQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-R2df_69oOT2X0T-Og4rU-Q-1; Wed, 23 Mar 2022 07:17:34 -0400
X-MC-Unique: R2df_69oOT2X0T-Og4rU-Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 618A3899EC2;
 Wed, 23 Mar 2022 11:17:34 +0000 (UTC)
Received: from localhost (unknown [10.39.194.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB36656D191;
 Wed, 23 Mar 2022 11:17:33 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC 3/8] block: pass size to bdrv_unregister_buf()
Date: Wed, 23 Mar 2022 11:17:22 +0000
Message-Id: <20220323111727.1100209-4-stefanha@redhat.com>
In-Reply-To: <20220323111727.1100209-1-stefanha@redhat.com>
References: <20220323111727.1100209-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alberto Faria <afaria@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, sgarzare@redhat.com
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
index 25bb69bbef..2295a7c767 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -244,9 +244,12 @@ void bdrv_del_child(BlockDriverState *parent, BdrvChild *child, Error **errp);
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
index 2e93a74679..989ec0364b 100644
--- a/include/sysemu/block-backend-global-state.h
+++ b/include/sysemu/block-backend-global-state.h
@@ -107,7 +107,7 @@ void blk_io_limits_update_group(BlockBackend *blk, const char *group);
 void blk_set_force_allow_inactivate(BlockBackend *blk);
 
 void blk_register_buf(BlockBackend *blk, void *host, size_t size);
-void blk_unregister_buf(BlockBackend *blk, void *host);
+void blk_unregister_buf(BlockBackend *blk, void *host, size_t size);
 
 const BdrvChild *blk_root(BlockBackend *blk);
 
diff --git a/block/block-backend.c b/block/block-backend.c
index e0e1aff4b1..8af00d8a36 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2591,10 +2591,10 @@ void blk_register_buf(BlockBackend *blk, void *host, size_t size)
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
index 3280144a17..a8a7920e29 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3365,16 +3365,16 @@ void bdrv_register_buf(BlockDriverState *bs, void *host, size_t size)
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
index 552029931d..88485e77f1 100644
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
index 1caddfb23a..493fad758a 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -4363,7 +4363,7 @@ static int img_bench(int argc, char **argv)
     struct timeval t1, t2;
     int i;
     bool force_share = false;
-    size_t buf_size;
+    size_t buf_size = 0;
 
     for (;;) {
         static const struct option long_options[] = {
@@ -4585,7 +4585,7 @@ static int img_bench(int argc, char **argv)
 
 out:
     if (data.buf) {
-        blk_unregister_buf(blk, data.buf);
+        blk_unregister_buf(blk, data.buf, buf_size);
     }
     qemu_vfree(data.buf);
     blk_unref(blk);
-- 
2.35.1


