Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 557334EB052
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 17:27:21 +0200 (CEST)
Received: from localhost ([::1]:53814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZDkd-0001V0-LK
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 11:27:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nZDiB-00083l-U8
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 11:24:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nZDi9-0007l7-ET
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 11:24:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648567484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z90VZAC0ex5v9nfTHKXz1jjt+zgBYsAjAi/fK4NkeqM=;
 b=ULTNhks4xgWNSS/MBLV8J1E60uG8wKiczsEuGh5+W2K/dDMjg+4RSdgha8I7DKUOdUGcls
 I0AtpvcgQxPRuh7X2uI9Jq6F+WnxtTN5hid9dvatxRlKSnOHRwVuwyfPzY+2OHu7pSi+Uz
 FmANt3CQ2ssr3BjqvkDVypyulZMGc54=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-M0qiwMvbM8iRKQ1xse5Esw-1; Tue, 29 Mar 2022 11:24:43 -0400
X-MC-Unique: M0qiwMvbM8iRKQ1xse5Esw-1
Received: by mail-qk1-f199.google.com with SMTP id
 q24-20020a05620a0c9800b0060d5d0b7a90so10694439qki.11
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 08:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z90VZAC0ex5v9nfTHKXz1jjt+zgBYsAjAi/fK4NkeqM=;
 b=NG3azow/dnhjOSMF4vk2qlfBI3Kqapw9Lqe6o9maidDJor/T2JxjGQ+VMhtKpsSc29
 JIAaeTBcIK+woe4dbWToNOk8gPE9672V48aTQyfC+NtGgU1zfk/18tnTz0Hnzd/Bc3Ym
 dveL8ekZGu+jpYzhdp2CcU7XWTcLZBJz9KREl7e7QtnZItXMvEOw5JMGI4q4JZjo/mzD
 9Fd8oA9k17SMSerTIkvzX3IMrKY9O3WYidxxqAkpf10ASdWDOhPM24F8kdIrqLbz5hX8
 XytRJ3rxF9CKzsN+ZO3BIIeHZNaSB81cM/NH+4W/YyTOi1/T6yS75OC6EasRGaWKJ8F/
 hyhg==
X-Gm-Message-State: AOAM532g87yAsccazLHj/9jfsSzdHOB4kODhTmTLvp/GEhnOnpgYOHSL
 Hrn9ukNzYVx8s1Xc7MUT1FJ83JEerbotA7EY9jBuFhI+V2ckqW32j3hhbSbbs+fsF24+ryX9kqP
 ehtPguFWqS+xZ1v8=
X-Received: by 2002:a05:6214:d07:b0:441:65d7:3a26 with SMTP id
 7-20020a0562140d0700b0044165d73a26mr26247009qvh.29.1648567482344; 
 Tue, 29 Mar 2022 08:24:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBFEEcuygwHo94rwFvZoBPf/5T3deNhzn5Ta2/f2v+3hQvUrciOUPHt9dUbY9gZ9uNO2BkcA==
X-Received: by 2002:a05:6214:d07:b0:441:65d7:3a26 with SMTP id
 7-20020a0562140d0700b0044165d73a26mr26246950qvh.29.1648567481694; 
 Tue, 29 Mar 2022 08:24:41 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-67.retail.telecomitalia.it.
 [79.46.200.67]) by smtp.gmail.com with ESMTPSA id
 g9-20020a05620a108900b0067b13036bd5sm9454399qkk.52.2022.03.29.08.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 08:24:41 -0700 (PDT)
Date: Tue, 29 Mar 2022 17:24:30 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC 7/8] blkio: implement BDRV_REQ_REGISTERED_BUF optimization
Message-ID: <20220329152430.xhmhiq2l2cibzoio@sgarzare-redhat>
References: <20220323111727.1100209-1-stefanha@redhat.com>
 <20220323111727.1100209-8-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220323111727.1100209-8-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 qemu-devel@nongnu.org, Alberto Faria <afaria@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 23, 2022 at 11:17:26AM +0000, Stefan Hajnoczi wrote:
>Avoid bounce buffers when QEMUIOVector elements are within previously
>registered bdrv_register_buf() buffers.
>
>The idea is that emulated storage controllers will register guest RAM
>using bdrv_register_buf() and set the BDRV_REQ_REGISTERED_BUF on I/O
>requests. Therefore no blkio_add_mem_region() calls are necessary in the
>performance-critical I/O code path.
>
>This optimization doesn't apply if the I/O buffer is internally
>allocated by QEMU (e.g. qcow2 metadata). There we still take the slow
>path because BDRV_REQ_REGISTERED_BUF is not set.
>
>Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>---
> block/blkio.c | 108 ++++++++++++++++++++++++++++++++++++++++++++++++--
> 1 file changed, 104 insertions(+), 4 deletions(-)
>
>diff --git a/block/blkio.c b/block/blkio.c
>index dd2308b967..78f4ca5f49 100644
>--- a/block/blkio.c
>+++ b/block/blkio.c
>@@ -1,7 +1,9 @@
> #include "qemu/osdep.h"
> #include <blkio.h>
> #include "block/block_int.h"
>+#include "exec/memory.h"
> #include "qapi/error.h"
>+#include "qemu/error-report.h"
> #include "qapi/qmp/qdict.h"
> #include "qemu/module.h"
>
>@@ -26,6 +28,9 @@ typedef struct {
>     /* Can we skip adding/deleting blkio_mem_regions? */
>     bool needs_mem_regions;
>
>+    /* Are file descriptors necessary for blkio_mem_regions? */
>+    bool needs_mem_region_fd;
>+
>     /*
>      * blkio_completion_fd_poll() stashes the next completion for
>      * blkio_completion_fd_poll_ready().
>@@ -170,6 +175,8 @@ static BlockAIOCB *blkio_aio_preadv(BlockDriverState *bs, int64_t offset,
>         BlockCompletionFunc *cb, void *opaque)
> {
>     BDRVBlkioState *s = bs->opaque;
>+    bool needs_mem_regions =
>+        s->needs_mem_regions && !(flags & BDRV_REQ_REGISTERED_BUF);
>     struct iovec *iov = qiov->iov;
>     int iovcnt = qiov->niov;
>     BlkioAIOCB *acb;
>@@ -179,7 +186,7 @@ static BlockAIOCB *blkio_aio_preadv(BlockDriverState *bs, int64_t offset,
>
>     acb = blkio_aiocb_get(bs, cb, opaque);
>
>-    if (s->needs_mem_regions) {
>+    if (needs_mem_regions) {
>         if (blkio_aiocb_init_mem_region_locked(acb, bytes) < 0) {
>             qemu_aio_unref(&acb->common);
>             return NULL;
>@@ -194,7 +201,7 @@ static BlockAIOCB *blkio_aio_preadv(BlockDriverState *bs, int64_t offset,
>
>     ret = blkioq_readv(s->blkioq, offset, iov, iovcnt, acb, 0);
>     if (ret < 0) {
>-        if (s->needs_mem_regions) {
>+        if (needs_mem_regions) {
>             blkio_free_mem_region(s->blkio, &acb->mem_region);
>             qemu_iovec_destroy(&acb->qiov);
>         }
>@@ -215,6 +222,8 @@ static BlockAIOCB *blkio_aio_pwritev(BlockDriverState *bs, int64_t offset,
> {
>     uint32_t blkio_flags = (flags & BDRV_REQ_FUA) ? BLKIO_REQ_FUA : 0;
>     BDRVBlkioState *s = bs->opaque;
>+    bool needs_mem_regions =
>+        s->needs_mem_regions && !(flags & BDRV_REQ_REGISTERED_BUF);
>     struct iovec *iov = qiov->iov;
>     int iovcnt = qiov->niov;
>     BlkioAIOCB *acb;
>@@ -224,7 +233,7 @@ static BlockAIOCB *blkio_aio_pwritev(BlockDriverState *bs, int64_t offset,
>
>     acb = blkio_aiocb_get(bs, cb, opaque);
>
>-    if (s->needs_mem_regions) {
>+    if (needs_mem_regions) {
>         if (blkio_aiocb_init_mem_region_locked(acb, bytes) < 0) {
>             qemu_aio_unref(&acb->common);
>             return NULL;
>@@ -238,7 +247,7 @@ static BlockAIOCB *blkio_aio_pwritev(BlockDriverState *bs, int64_t offset,
>
>     ret = blkioq_writev(s->blkioq, offset, iov, iovcnt, acb, blkio_flags);
>     if (ret < 0) {
>-        if (s->needs_mem_regions) {
>+        if (needs_mem_regions) {
>             blkio_free_mem_region(s->blkio, &acb->mem_region);
>         }
>         qemu_aio_unref(&acb->common);
>@@ -286,6 +295,83 @@ static void blkio_io_unplug(BlockDriverState *bs)
>     }
> }
>
>+static void blkio_register_buf(BlockDriverState *bs, void *host, size_t size)
>+{
>+    BDRVBlkioState *s = bs->opaque;
>+    char *errmsg;
>+    int ret;
>+    struct blkio_mem_region region = (struct blkio_mem_region){
>+        .addr = host,
>+        .len = size,
>+        .fd = -1,
>+    };
>+
>+    if (((uintptr_t)host | size) % s->mem_region_alignment) {
>+        error_report_once("%s: skipping unaligned buf %p with size %zu",
>+                          __func__, host, size);
>+        return; /* skip unaligned */
>+    }
>+
>+    /* Attempt to find the fd for a MemoryRegion */
>+    if (s->needs_mem_region_fd) {
>+        int fd = -1;
>+        ram_addr_t offset;
>+        MemoryRegion *mr;
>+
>+        /*
>+         * bdrv_register_buf() is called with the BQL held so mr lives at least
>+         * until this function returns.
>+         */
>+        mr = memory_region_from_host(host, &offset);
>+        if (mr) {
>+            fd = memory_region_get_fd(mr);
>+        }
>+        if (fd == -1) {
>+            error_report_once("%s: skipping fd-less buf %p with size %zu",
>+                              __func__, host, size);
>+            return; /* skip if there is no fd */
>+        }
>+
>+        region.fd = fd;
>+        region.fd_offset = offset;
>+    }
>+
>+    WITH_QEMU_LOCK_GUARD(&s->lock) {
>+        ret = blkio_add_mem_region(s->blkio, &region, &errmsg);
>+    }
>+
>+    if (ret < 0) {
>+        error_report_once("Failed to add blkio mem region %p with size %zu: %s",
>+                          host, size, errmsg);
>+        free(errmsg);
>+    }
>+}
>+
>+static void blkio_unregister_buf(BlockDriverState *bs, void *host, size_t size)
>+{
>+    BDRVBlkioState *s = bs->opaque;
>+    char *errmsg;
>+    int ret;
>+    struct blkio_mem_region region = (struct blkio_mem_region){
>+        .addr = host,
>+        .len = size,
>+    };
>+
>+    if (((uintptr_t)host | size) % s->mem_region_alignment) {
>+        return; /* skip unaligned */
>+    }
>+
>+    WITH_QEMU_LOCK_GUARD(&s->lock) {
>+        ret = blkio_del_mem_region(s->blkio, &region, &errmsg);
>+    }
>+
>+    if (ret < 0) {
>+        error_report_once("Failed to delete blkio mem region %p with size %zu: %s",
>+                          host, size, errmsg);
>+        free(errmsg);
>+    }
>+}
>+
> static void blkio_parse_filename_io_uring(const char *filename, QDict *options,
>                                           Error **errp)
> {
>@@ -356,6 +442,18 @@ static int blkio_file_open(BlockDriverState *bs, QDict *options, int flags,
>         return ret;
>     }
>
>+    ret = blkio_get_bool(s->blkio,
>+                         "needs-mem-region-fd",
>+                         &s->needs_mem_region_fd,
>+                         &errmsg);
>+    if (ret < 0) {
>+        error_setg_errno(errp, -ret,
>+                         "failed to get needs-mem-region-fd: %s", errmsg);
>+        free(errmsg);
>+        blkio_destroy(&s->blkio);
>+        return ret;
>+    }
>+
>     ret = blkio_get_uint64(s->blkio,
>                            "mem-region-alignment",
>                            &s->mem_region_alignment,

I already mentioned on IRC while testing the series, but I'm writing it 
here so we don't forget ;-)

To prevent bdrv_driver_pwritev() from removing the 
BDRV_REQ_REGISTERED_BUF flag from requests, we should add this: 

@@ -474,7 +474,7 @@ static int blkio_file_open(BlockDriverState *bs, QDict *options, int flags,
          return ret;
      }

-    bs->supported_write_flags = BDRV_REQ_FUA;
+    bs->supported_write_flags = BDRV_REQ_FUA | BDRV_REQ_REGISTERED_BUF;

      qemu_mutex_init(&s->lock);
      s->blkioq = blkio_get_queue(s->blkio, 0);


>@@ -436,6 +534,8 @@ static BlockDriver bdrv_io_uring = {
>     .bdrv_aio_pwritev           = blkio_aio_pwritev,
>     .bdrv_aio_flush             = blkio_aio_flush,
>     .bdrv_io_unplug             = blkio_io_unplug,
>+    .bdrv_register_buf          = blkio_register_buf,
>+    .bdrv_unregister_buf        = blkio_unregister_buf,
>
>     /*
>      * TODO
>-- 
>2.35.1
>


