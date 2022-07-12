Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7757571CC7
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 16:34:19 +0200 (CEST)
Received: from localhost ([::1]:39022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBGxu-0000Rx-6r
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 10:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1oBGnr-0004cF-Lb
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 10:23:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1oBGnm-00010q-8S
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 10:23:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657635829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AWzrQjCUQdRVllqTgUw9zl1kAGY6I/affYEfaGpB86k=;
 b=B67huhmmgeDCGu7OCmbWbTXNGTJfE2RuWVPEQJqx8KoS469o9zKflE0ryfn+3RX6FqgJLo
 0yIAhtLhwahCwMNe7iG5TSknFY01PNt4UYj9WtMgClkAxi3tvEI0Ml1UAYeYdtkA+AJqbl
 mpVVuAM5QGZgvGJYRAM526SAqHzkNvM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-APLBuU0gO5qiXGvREjCsqw-1; Tue, 12 Jul 2022 10:23:42 -0400
X-MC-Unique: APLBuU0gO5qiXGvREjCsqw-1
Received: by mail-wr1-f72.google.com with SMTP id
 e16-20020adf9bd0000000b0021d9c17e980so1379807wrc.15
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 07:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AWzrQjCUQdRVllqTgUw9zl1kAGY6I/affYEfaGpB86k=;
 b=MhO1HoQmaKigr4TWwgbLPmfZQxjqKfudb9i6iwpPyTW5b+Q7AT2iZsfiT9pgB+UIz5
 x9+icNctnpmM3tRRGIzJAmBOFqYQz9qzFd9NrGwlVDmL9QX5xng/UwfHhdhe92INN947
 fwgh1NL968Snr3qtf7fLU+0p7Gi7yR7+wP+BwSoXM1MB/tJqizYBzD+sJbMYKfLp3Whx
 F2N30J2q+NBZca+IeTbQa0NgVwrlZHo0NZY38P7aUmGZHhX/O1BwlTE91ULefPM7yoD9
 8frKBFVfaRuIzJWIPH1Oiio+1JF6yIW7RfgfYeWR9dA+0ZKKkLK6IzjnUU9AKK6SrAhR
 j/xg==
X-Gm-Message-State: AJIora8Oe0T+giTR/9uKdbCCM0eQ3FDsq9sNAAIr3LcWXAenWGDUnL+z
 QI7GbhG7wyfhHDEjjf7hnit82Ad1OZVRWqgbMaFJmlU/Uii8gZ2iJWYj45Z6gkayBdCr/S8QHDH
 JAwQFzU2rGg5xB+4=
X-Received: by 2002:a05:6000:184d:b0:21d:9596:cd21 with SMTP id
 c13-20020a056000184d00b0021d9596cd21mr17649420wri.363.1657635820910; 
 Tue, 12 Jul 2022 07:23:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sgL49NTJCuYOXD0LiWSaOmb2GtgN4Sw5X78NpOthRt89PkcSIx9BhswuGUWr0j9HmFfVy5nA==
X-Received: by 2002:a05:6000:184d:b0:21d:9596:cd21 with SMTP id
 c13-20020a056000184d00b0021d9596cd21mr17649359wri.363.1657635820450; 
 Tue, 12 Jul 2022 07:23:40 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-206.retail.telecomitalia.it.
 [79.46.200.206]) by smtp.gmail.com with ESMTPSA id
 i15-20020adfefcf000000b0021d82a6095bsm8268614wrp.95.2022.07.12.07.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 07:23:39 -0700 (PDT)
Date: Tue, 12 Jul 2022 16:23:32 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Alberto Faria <afaria@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Fam Zheng <fam@euphon.net>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC v3 1/8] blkio: add io_uring block driver using libblkio
Message-ID: <20220712142332.w6yvepowrpzc24nm@sgarzare-redhat>
References: <20220708041737.1768521-1-stefanha@redhat.com>
 <20220708041737.1768521-2-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220708041737.1768521-2-stefanha@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Fri, Jul 08, 2022 at 05:17:30AM +0100, Stefan Hajnoczi wrote:
>libblkio (https://gitlab.com/libblkio/libblkio/) is a library for
>high-performance disk I/O. It currently supports io_uring and
>virtio-blk-vhost-vdpa with additional drivers under development.
>
>One of the reasons for developing libblkio is that other applications
>besides QEMU can use it. This will be particularly useful for
>vhost-user-blk which applications may wish to use for connecting to
>qemu-storage-daemon.
>
>libblkio also gives us an opportunity to develop in Rust behind a C API
>that is easy to consume from QEMU.
>
>This commit adds io_uring and virtio-blk-vhost-vdpa BlockDrivers to QEMU
>using libblkio. It will be easy to add other libblkio drivers since they
>will share the majority of code.
>
>For now I/O buffers are copied through bounce buffers if the libblkio
>driver requires it. Later commits add an optimization for
>pre-registering guest RAM to avoid bounce buffers.
>
>The syntax is:
>
>  --blockdev io_uring,node-name=drive0,filename=test.img,readonly=on|off,cache.direct=on|off
>
>and:
>
>  --blockdev virtio-blk-vhost-vdpa,node-name=drive0,path=/dev/vdpa...,readonly=on|off
>
>Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>---
> MAINTAINERS                   |   6 +
> meson_options.txt             |   2 +
> qapi/block-core.json          |  37 +-
> meson.build                   |   9 +
> block/blkio.c                 | 659 ++++++++++++++++++++++++++++++++++
> tests/qtest/modules-test.c    |   3 +
> block/meson.build             |   1 +
> scripts/meson-buildoptions.sh |   3 +
> 8 files changed, 718 insertions(+), 2 deletions(-)
> create mode 100644 block/blkio.c
>
>diff --git a/MAINTAINERS b/MAINTAINERS
>index 450abd0252..50f340d9ee 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -3395,6 +3395,12 @@ L: qemu-block@nongnu.org
> S: Maintained
> F: block/vdi.c
>
>+blkio
>+M: Stefan Hajnoczi <stefanha@redhat.com>
>+L: qemu-block@nongnu.org
>+S: Maintained
>+F: block/blkio.c
>+
> iSCSI
> M: Ronnie Sahlberg <ronniesahlberg@gmail.com>
> M: Paolo Bonzini <pbonzini@redhat.com>
>diff --git a/meson_options.txt b/meson_options.txt
>index 97c38109b1..b0b2e0c9b5 100644
>--- a/meson_options.txt
>+++ b/meson_options.txt
>@@ -117,6 +117,8 @@ option('bzip2', type : 'feature', value : 'auto',
>        description: 'bzip2 support for DMG images')
> option('cap_ng', type : 'feature', value : 'auto',
>        description: 'cap_ng support')
>+option('blkio', type : 'feature', value : 'auto',
>+       description: 'libblkio block device driver')
> option('bpf', type : 'feature', value : 'auto',
>         description: 'eBPF support')
> option('cocoa', type : 'feature', value : 'auto',
>diff --git a/qapi/block-core.json b/qapi/block-core.json
>index 2173e7734a..aa63d5e9bd 100644
>--- a/qapi/block-core.json
>+++ b/qapi/block-core.json
>@@ -2951,11 +2951,15 @@
>             'file', 'snapshot-access', 'ftp', 'ftps', 'gluster',
>             {'name': 'host_cdrom', 'if': 'HAVE_HOST_BLOCK_DEVICE' },
>             {'name': 'host_device', 'if': 'HAVE_HOST_BLOCK_DEVICE' },
>-            'http', 'https', 'iscsi',
>+            'http', 'https',
>+            { 'name': 'io_uring', 'if': 'CONFIG_BLKIO' },
>+            'iscsi',
>             'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'parallels',
>             'preallocate', 'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'rbd',
>             { 'name': 'replication', 'if': 'CONFIG_REPLICATION' },
>-            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat' ] }
>+            'ssh', 'throttle', 'vdi', 'vhdx',
>+            { 'name': 'virtio-blk-vhost-vdpa', 'if': 'CONFIG_BLKIO' },
>+            'vmdk', 'vpc', 'vvfat' ] }
>
> ##
> # @BlockdevOptionsFile:
>@@ -3678,6 +3682,30 @@
>             '*debug': 'int',
>             '*logfile': 'str' } }
>
>+##
>+# @BlockdevOptionsIoUring:
>+#
>+# Driver specific block device options for the io_uring backend.
>+#
>+# @filename: path to the image file
>+#
>+# Since: 7.1
>+##
>+{ 'struct': 'BlockdevOptionsIoUring',
>+  'data': { 'filename': 'str' } }
>+
>+##
>+# @BlockdevOptionsVirtioBlkVhostVdpa:
>+#
>+# Driver specific block device options for the virtio-blk-vhost-vdpa backend.
>+#
>+# @path: path to the vhost-vdpa character device.
>+#
>+# Since: 7.1
>+##
>+{ 'struct': 'BlockdevOptionsVirtioBlkVhostVdpa',
>+  'data': { 'path': 'str' } }
>+
> ##
> # @IscsiTransport:
> #
>@@ -4305,6 +4333,8 @@
>                        'if': 'HAVE_HOST_BLOCK_DEVICE' },
>       'http':       'BlockdevOptionsCurlHttp',
>       'https':      'BlockdevOptionsCurlHttps',
>+      'io_uring':   { 'type': 'BlockdevOptionsIoUring',
>+                      'if': 'CONFIG_BLKIO' },
>       'iscsi':      'BlockdevOptionsIscsi',
>       'luks':       'BlockdevOptionsLUKS',
>       'nbd':        'BlockdevOptionsNbd',
>@@ -4327,6 +4357,9 @@
>       'throttle':   'BlockdevOptionsThrottle',
>       'vdi':        'BlockdevOptionsGenericFormat',
>       'vhdx':       'BlockdevOptionsGenericFormat',
>+      'virtio-blk-vhost-vdpa':
>+                    { 'type': 'BlockdevOptionsVirtioBlkVhostVdpa',
>+                      'if': 'CONFIG_BLKIO' },
>       'vmdk':       'BlockdevOptionsGenericCOWFormat',
>       'vpc':        'BlockdevOptionsGenericFormat',
>       'vvfat':      'BlockdevOptionsVVFAT'
>diff --git a/meson.build b/meson.build
>index bc5569ace1..f09b009428 100644
>--- a/meson.build
>+++ b/meson.build
>@@ -713,6 +713,13 @@ if not get_option('virglrenderer').auto() or have_system or have_vhost_user_gpu
>                      required: get_option('virglrenderer'),
>                      kwargs: static_kwargs)
> endif
>+blkio = not_found
>+if not get_option('blkio').auto() or have_block
>+  blkio = dependency('blkio',
>+                     method: 'pkg-config',
>+                     required: get_option('blkio'),
>+                     kwargs: static_kwargs)
>+endif
> curl = not_found
> if not get_option('curl').auto() or have_block
>   curl = dependency('libcurl', version: '>=7.29.0',
>@@ -1755,6 +1762,7 @@ config_host_data.set('CONFIG_LIBUDEV', libudev.found())
> config_host_data.set('CONFIG_LZO', lzo.found())
> config_host_data.set('CONFIG_MPATH', mpathpersist.found())
> config_host_data.set('CONFIG_MPATH_NEW_API', mpathpersist_new_api)
>+config_host_data.set('CONFIG_BLKIO', blkio.found())
> config_host_data.set('CONFIG_CURL', curl.found())
> config_host_data.set('CONFIG_CURSES', curses.found())
> config_host_data.set('CONFIG_GBM', gbm.found())
>@@ -3909,6 +3917,7 @@ summary_info += {'PAM':               pam}
> summary_info += {'iconv support':     iconv}
> summary_info += {'curses support':    curses}
> summary_info += {'virgl support':     virgl}
>+summary_info += {'blkio support':     blkio}
> summary_info += {'curl support':      curl}
> summary_info += {'Multipath support': mpathpersist}
> summary_info += {'PNG support':       png}
>diff --git a/block/blkio.c b/block/blkio.c
>new file mode 100644
>index 0000000000..7fbdbd7fae
>--- /dev/null
>+++ b/block/blkio.c
>@@ -0,0 +1,659 @@
>+#include "qemu/osdep.h"
>+#include <blkio.h>
>+#include "block/block_int.h"
>+#include "qapi/error.h"
>+#include "qapi/qmp/qdict.h"
>+#include "qemu/module.h"
>+
>+typedef struct BlkAIOCB {
>+    BlockAIOCB common;
>+    struct blkio_mem_region mem_region;
>+    QEMUIOVector qiov;
>+    struct iovec bounce_iov;
>+} BlkioAIOCB;
>+
>+typedef struct {
>+    /* Protects ->blkio and request submission on ->blkioq */
>+    QemuMutex lock;
>+
>+    struct blkio *blkio;
>+    struct blkioq *blkioq; /* this could be multi-queue in the future */
>+    int completion_fd;
>+
>+    /* Polling fetches the next completion into this field */
>+    struct blkio_completion poll_completion;
>+
>+    /* The value of the "mem-region-alignment" property */
>+    size_t mem_region_alignment;
>+
>+    /* Can we skip adding/deleting blkio_mem_regions? */
>+    bool needs_mem_regions;
>+} BDRVBlkioState;
>+
>+static void blkio_aiocb_complete(BlkioAIOCB *acb, int ret)
>+{
>+    /* Copy bounce buffer back to qiov */
>+    if (acb->qiov.niov > 0) {
>+        qemu_iovec_from_buf(&acb->qiov, 0,
>+                acb->bounce_iov.iov_base,
>+                acb->bounce_iov.iov_len);
>+        qemu_iovec_destroy(&acb->qiov);
>+    }
>+
>+    acb->common.cb(acb->common.opaque, ret);
>+
>+    if (acb->mem_region.len > 0) {
>+        BDRVBlkioState *s = acb->common.bs->opaque;
>+
>+        WITH_QEMU_LOCK_GUARD(&s->lock) {
>+            blkio_free_mem_region(s->blkio, &acb->mem_region);
>+        }
>+    }
>+
>+    qemu_aio_unref(&acb->common);
>+}
>+
>+/*
>+ * Only the thread that calls aio_poll() invokes fd and poll handlers.
>+ * Therefore locks are not necessary except when accessing s->blkio.
>+ *
>+ * No locking is performed around blkioq_get_completions() although other
>+ * threads may submit I/O requests on s->blkioq. We're assuming there is no
>+ * inteference between blkioq_get_completions() and other s->blkioq APIs.
>+ */
>+
>+static void blkio_completion_fd_read(void *opaque)
>+{
>+    BlockDriverState *bs = opaque;
>+    BDRVBlkioState *s = bs->opaque;
>+    struct blkio_completion completion;
>+    uint64_t val;
>+    ssize_t ret __attribute__((unused));
>+
>+    /* Polling may have already fetched a completion */
>+    if (s->poll_completion.user_data != NULL) {
>+        completion = s->poll_completion;
>+
>+        /* Clear it in case blkio_aiocb_complete() has a nested event loop */
>+        s->poll_completion.user_data = NULL;
>+
>+        blkio_aiocb_complete(completion.user_data, completion.ret);
>+    }
>+
>+    /* Reset completion fd status */
>+    ret = read(s->completion_fd, &val, sizeof(val));
>+
>+    /*
>+     * Reading one completion at a time makes nested event loop re-entrancy
>+     * simple. Change this loop to get multiple completions in one go if it
>+     * becomes a performance bottleneck.
>+     */
>+    while (blkioq_do_io(s->blkioq, &completion, 0, 1, NULL) == 1) {
>+        blkio_aiocb_complete(completion.user_data, completion.ret);
>+    }
>+}
>+
>+static bool blkio_completion_fd_poll(void *opaque)
>+{
>+    BlockDriverState *bs = opaque;
>+    BDRVBlkioState *s = bs->opaque;
>+
>+    /* Just in case we already fetched a completion */
>+    if (s->poll_completion.user_data != NULL) {
>+        return true;
>+    }
>+
>+    return blkioq_do_io(s->blkioq, &s->poll_completion, 0, 1, NULL) == 1;
>+}
>+
>+static void blkio_completion_fd_poll_ready(void *opaque)
>+{
>+    blkio_completion_fd_read(opaque);
>+}
>+
>+static void blkio_attach_aio_context(BlockDriverState *bs,
>+                                     AioContext *new_context)
>+{
>+    BDRVBlkioState *s = bs->opaque;
>+
>+    aio_set_fd_handler(new_context,
>+                       s->completion_fd,
>+                       false,
>+                       blkio_completion_fd_read,
>+                       NULL,
>+                       blkio_completion_fd_poll,
>+                       blkio_completion_fd_poll_ready,
>+                       bs);
>+}
>+
>+static void blkio_detach_aio_context(BlockDriverState *bs)
>+{
>+    BDRVBlkioState *s = bs->opaque;
>+
>+    aio_set_fd_handler(bdrv_get_aio_context(bs),
>+                       s->completion_fd,
>+                       false, NULL, NULL, NULL, NULL, NULL);
>+}
>+
>+static const AIOCBInfo blkio_aiocb_info = {
>+    .aiocb_size = sizeof(BlkioAIOCB),
>+};
>+
>+/* Create a BlkioAIOCB */
>+static BlkioAIOCB *blkio_aiocb_get(BlockDriverState *bs,
>+                                   BlockCompletionFunc *cb,
>+                                   void *opaque)
>+{
>+    BlkioAIOCB *acb = qemu_aio_get(&blkio_aiocb_info, bs, cb, opaque);
>+
>+    /* A few fields need to be initialized, leave the rest... */
>+    acb->qiov.niov = 0;
>+    acb->mem_region.len = 0;
>+    return acb;
>+}
>+
>+/* s->lock must be held */
>+static int blkio_aiocb_init_mem_region_locked(BlkioAIOCB *acb, size_t len)
>+{
>+    BDRVBlkioState *s = acb->common.bs->opaque;
>+    size_t mem_region_len = QEMU_ALIGN_UP(len, s->mem_region_alignment);
>+    int ret;
>+
>+    ret = blkio_alloc_mem_region(s->blkio, &acb->mem_region, mem_region_len);
>+    if (ret < 0) {
>+        return ret;
>+    }
>+
>+    acb->bounce_iov.iov_base = acb->mem_region.addr;
>+    acb->bounce_iov.iov_len = len;
>+    return 0;
>+}
>+
>+/* Call this to submit I/O after enqueuing a new request */
>+static void blkio_submit_io(BlockDriverState *bs)
>+{
>+    if (qatomic_read(&bs->io_plugged) == 0) {
>+        BDRVBlkioState *s = bs->opaque;
>+
>+        blkioq_do_io(s->blkioq, NULL, 0, 0, NULL);
>+    }
>+}
>+
>+static BlockAIOCB *blkio_aio_pdiscard(BlockDriverState *bs, int64_t offset,
>+        int bytes, BlockCompletionFunc *cb, void *opaque)
>+{
>+    BDRVBlkioState *s = bs->opaque;
>+    BlkioAIOCB *acb;
>+
>+    QEMU_LOCK_GUARD(&s->lock);
>+
>+    acb = blkio_aiocb_get(bs, cb, opaque);
>+    blkioq_discard(s->blkioq, offset, bytes, acb, 0);
>+    blkio_submit_io(bs);
>+    return &acb->common;
>+}
>+
>+static BlockAIOCB *blkio_aio_preadv(BlockDriverState *bs, int64_t offset,
>+        int64_t bytes, QEMUIOVector *qiov, BdrvRequestFlags flags,
>+        BlockCompletionFunc *cb, void *opaque)
>+{
>+    BDRVBlkioState *s = bs->opaque;
>+    struct iovec *iov = qiov->iov;
>+    int iovcnt = qiov->niov;
>+    BlkioAIOCB *acb;
>+
>+    QEMU_LOCK_GUARD(&s->lock);
>+
>+    acb = blkio_aiocb_get(bs, cb, opaque);
>+
>+    if (s->needs_mem_regions) {
>+        if (blkio_aiocb_init_mem_region_locked(acb, bytes) < 0) {
>+            qemu_aio_unref(&acb->common);
>+            return NULL;
>+        }
>+
>+        /* Copy qiov because we'll call qemu_iovec_from_buf() on completion */
>+        qemu_iovec_init_slice(&acb->qiov, qiov, 0, qiov->size);
>+
>+        iov = &acb->bounce_iov;
>+        iovcnt = 1;
>+    }
>+
>+    blkioq_readv(s->blkioq, offset, iov, iovcnt, acb, 0);
>+    blkio_submit_io(bs);
>+    return &acb->common;
>+}
>+
>+static BlockAIOCB *blkio_aio_pwritev(BlockDriverState *bs, int64_t offset,
>+        int64_t bytes, QEMUIOVector *qiov, BdrvRequestFlags flags,
>+        BlockCompletionFunc *cb, void *opaque)
>+{
>+    uint32_t blkio_flags = (flags & BDRV_REQ_FUA) ? BLKIO_REQ_FUA : 0;
>+    BDRVBlkioState *s = bs->opaque;
>+    struct iovec *iov = qiov->iov;
>+    int iovcnt = qiov->niov;
>+    BlkioAIOCB *acb;
>+
>+    QEMU_LOCK_GUARD(&s->lock);
>+
>+    acb = blkio_aiocb_get(bs, cb, opaque);
>+
>+    if (s->needs_mem_regions) {
>+        if (blkio_aiocb_init_mem_region_locked(acb, bytes) < 0) {
>+            qemu_aio_unref(&acb->common);
>+            return NULL;
>+        }
>+
>+        qemu_iovec_to_buf(qiov, 0, acb->bounce_iov.iov_base, bytes);
>+
>+        iov = &acb->bounce_iov;
>+        iovcnt = 1;
>+    }
>+
>+    blkioq_writev(s->blkioq, offset, iov, iovcnt, acb, blkio_flags);
>+    blkio_submit_io(bs);
>+    return &acb->common;
>+}
>+
>+static BlockAIOCB *blkio_aio_flush(BlockDriverState *bs,
>+                                   BlockCompletionFunc *cb,
>+                                   void *opaque)
>+{
>+    BDRVBlkioState *s = bs->opaque;
>+    BlkioAIOCB *acb;
>+
>+    QEMU_LOCK_GUARD(&s->lock);
>+
>+    acb = blkio_aiocb_get(bs, cb, opaque);
>+
>+    blkioq_flush(s->blkioq, acb, 0);
>+    blkio_submit_io(bs);
>+    return &acb->common;
>+}
>+
>+/* For async to .bdrv_co_*() conversion */
>+typedef struct {
>+    Coroutine *coroutine;
>+    int ret;
>+} BlkioCoData;
>+
>+static void blkio_co_pwrite_zeroes_complete(void *opaque, int ret)
>+{
>+    BlkioCoData *data = opaque;
>+
>+    data->ret = ret;
>+    aio_co_wake(data->coroutine);
>+}
>+
>+static int coroutine_fn blkio_co_pwrite_zeroes(BlockDriverState *bs,
>+    int64_t offset, int64_t bytes, BdrvRequestFlags flags)
>+{
>+    BDRVBlkioState *s = bs->opaque;
>+    BlkioCoData data = {
>+        .coroutine = qemu_coroutine_self(),
>+    };
>+    uint32_t blkio_flags = 0;
>+
>+    if (flags & BDRV_REQ_FUA) {
>+        blkio_flags |= BLKIO_REQ_FUA;
>+    }
>+    if (!(flags & BDRV_REQ_MAY_UNMAP)) {
>+        blkio_flags |= BLKIO_REQ_NO_UNMAP;
>+    }
>+    if (flags & BDRV_REQ_NO_FALLBACK) {
>+        blkio_flags |= BLKIO_REQ_NO_FALLBACK;
>+    }
>+
>+    WITH_QEMU_LOCK_GUARD(&s->lock) {
>+        BlkioAIOCB *acb =
>+            blkio_aiocb_get(bs, blkio_co_pwrite_zeroes_complete, &data);
>+        blkioq_write_zeroes(s->blkioq, offset, bytes, acb, blkio_flags);
>+        blkio_submit_io(bs);
>+    }
>+
>+    qemu_coroutine_yield();
>+    return data.ret;
>+}
>+
>+static void blkio_io_unplug(BlockDriverState *bs)
>+{
>+    BDRVBlkioState *s = bs->opaque;
>+
>+    WITH_QEMU_LOCK_GUARD(&s->lock) {
>+        blkio_submit_io(bs);
>+    }
>+}
>+
>+static void blkio_parse_filename_io_uring(const char *filename, QDict *options,
>+                                          Error **errp)
>+{
>+    bdrv_parse_filename_strip_prefix(filename, "io_uring:", options);
>+}
>+
>+static void blkio_parse_filename_virtio_blk_vhost_vdpa(
>+        const char *filename,
>+        QDict *options,
>+        Error **errp)
>+{
>+    bdrv_parse_filename_strip_prefix(filename, "virtio-blk-vhost-vdpa:", options);
>+}
>+
>+static int blkio_io_uring_open(BlockDriverState *bs, QDict *options, int flags,
>+                               Error **errp)
>+{
>+    const char *filename = qdict_get_try_str(options, "filename");
>+    BDRVBlkioState *s = bs->opaque;
>+    int ret;
>+
>+    ret = blkio_set_str(s->blkio, "path", filename);
>+    qdict_del(options, "filename");
>+    if (ret < 0) {
>+        error_setg_errno(errp, -ret, "failed to set path: %s",
>+                         blkio_get_error_msg());
>+        return ret;
>+    }
>+
>+    if (flags & BDRV_O_NOCACHE) {
>+        ret = blkio_set_bool(s->blkio, "direct", true);
>+        if (ret < 0) {
>+            error_setg_errno(errp, -ret, "failed to set direct: %s",
>+                             blkio_get_error_msg());
>+            return ret;
>+        }
>+    }
>+
>+    return 0;
>+}
>+
>+static int blkio_virtio_blk_vhost_vdpa_open(BlockDriverState *bs,
>+        QDict *options, int flags, Error **errp)
>+{
>+    const char *path = qdict_get_try_str(options, "path");
>+    BDRVBlkioState *s = bs->opaque;
>+    int ret;
>+
>+    ret = blkio_set_str(s->blkio, "path", path);
>+    qdict_del(options, "path");
>+    if (ret < 0) {
>+        error_setg_errno(errp, -ret, "failed to set path: %s",
>+                         blkio_get_error_msg());
>+        return ret;
>+    }
>+
>+    if (flags & BDRV_O_NOCACHE) {
>+        error_setg(errp, "cache.direct=off is not supported");
>+        return -EINVAL;
>+    }
>+    return 0;
>+}
>+
>+static int blkio_file_open(BlockDriverState *bs, QDict *options, int flags,
>+                           Error **errp)
>+{
>+    const char *blkio_driver = bs->drv->protocol_name;
>+    BDRVBlkioState *s = bs->opaque;
>+    int ret;
>+
>+    ret = blkio_create(blkio_driver, &s->blkio);
>+    if (ret < 0) {
>+        error_setg_errno(errp, -ret, "blkio_create failed: %s",
>+                         blkio_get_error_msg());
>+        return ret;
>+    }
>+
>+    if (strcmp(blkio_driver, "io_uring") == 0) {
>+        ret = blkio_io_uring_open(bs, options, flags, errp);
>+    } else if (strcmp(blkio_driver, "virtio-blk-vhost-vdpa") == 0) {
>+        ret = blkio_virtio_blk_vhost_vdpa_open(bs, options, flags, errp);
>+    }
>+    if (ret < 0) {
>+        blkio_destroy(&s->blkio);
>+        return ret;
>+    }
>+
>+    if (!(flags & BDRV_O_RDWR)) {
>+        ret = blkio_set_bool(s->blkio, "readonly", true);
>+        if (ret < 0) {
>+            error_setg_errno(errp, -ret, "failed to set readonly: %s",
>+                             blkio_get_error_msg());
>+            blkio_destroy(&s->blkio);
>+            return ret;
>+        }
>+    }
>+
>+    ret = blkio_connect(s->blkio);
>+    if (ret < 0) {
>+        error_setg_errno(errp, -ret, "blkio_connect failed: %s",
>+                         blkio_get_error_msg());
>+        blkio_destroy(&s->blkio);
>+        return ret;
>+    }
>+
>+    ret = blkio_get_bool(s->blkio,
>+                         "needs-mem-regions",
>+                         &s->needs_mem_regions);
>+    if (ret < 0) {
>+        error_setg_errno(errp, -ret,
>+                         "failed to get needs-mem-regions: %s",
>+                         blkio_get_error_msg());
>+        blkio_destroy(&s->blkio);
>+        return ret;
>+    }
>+
>+    ret = blkio_get_uint64(s->blkio,
>+                           "mem-region-alignment",
>+                           &s->mem_region_alignment);
>+    if (ret < 0) {
>+        error_setg_errno(errp, -ret,
>+                         "failed to get mem-region-alignment: %s",
>+                         blkio_get_error_msg());
>+        blkio_destroy(&s->blkio);
>+        return ret;
>+    }
>+
>+    ret = blkio_start(s->blkio);
>+    if (ret < 0) {
>+        error_setg_errno(errp, -ret, "blkio_start failed: %s",
>+                         blkio_get_error_msg());
>+        blkio_destroy(&s->blkio);
>+        return ret;
>+    }
>+
>+    bs->supported_write_flags = BDRV_REQ_FUA;
>+    bs->supported_zero_flags = BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP |
>+                               BDRV_REQ_NO_FALLBACK;
>+
>+    qemu_mutex_init(&s->lock);
>+    s->blkioq = blkio_get_queue(s->blkio, 0);
>+    s->completion_fd = blkioq_get_completion_fd(s->blkioq);
>+
>+    blkio_attach_aio_context(bs, bdrv_get_aio_context(bs));
>+    return 0;
>+}
>+
>+static void blkio_close(BlockDriverState *bs)
>+{
>+    BDRVBlkioState *s = bs->opaque;
>+
>+    qemu_mutex_destroy(&s->lock);
>+    blkio_destroy(&s->blkio);
>+}
>+
>+static int64_t blkio_getlength(BlockDriverState *bs)
>+{
>+    BDRVBlkioState *s = bs->opaque;
>+    uint64_t capacity;
>+    int ret;
>+
>+    WITH_QEMU_LOCK_GUARD(&s->lock) {
>+        ret = blkio_get_uint64(s->blkio, "capacity", &capacity);
>+    }
>+    if (ret < 0) {
>+        return -ret;
>+    }
>+
>+    return capacity;
>+}
>+
>+static int blkio_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
>+{
>+    return 0;
>+}
>+
>+static void blkio_refresh_limits(BlockDriverState *bs, Error **errp)
>+{
>+    BDRVBlkioState *s = bs->opaque;
>+    int value;
>+    int ret;
>+
>+    ret = blkio_get_int(s->blkio,
>+                        "request-alignment",
>+                        (int *)&bs->bl.request_alignment);
>+    if (ret < 0) {
>+        error_setg_errno(errp, -ret, "failed to get \"request-alignment\": %s",
>+                         blkio_get_error_msg());
>+        return;
>+    }
>+    if (bs->bl.request_alignment < 1 ||
>+        bs->bl.request_alignment >= INT_MAX ||
>+        !is_power_of_2(bs->bl.request_alignment)) {
>+        error_setg(errp, "invalid \"request-alignment\" value %d, must be "
>+                   "power of 2 less than INT_MAX", bs->bl.request_alignment);
>+        return;
>+    }
>+
>+    ret = blkio_get_int(s->blkio,
>+                        "optimal-io-size",
>+                        (int *)&bs->bl.opt_transfer);
>+    if (ret < 0) {
>+        error_setg_errno(errp, -ret, "failed to get \"buf-alignment\": %s",
>+                         blkio_get_error_msg());
>+        return;
>+    }
>+    if (bs->bl.opt_transfer > INT_MAX ||
>+        (bs->bl.opt_transfer % bs->bl.request_alignment)) {
>+        error_setg(errp, "invalid \"buf-alignment\" value %d, must be a "
>+                   "multiple of %d", bs->bl.opt_transfer,
>+                   bs->bl.request_alignment);
>+        return;
>+    }
>+
>+    ret = blkio_get_int(s->blkio,
>+                        "max-transfer",
>+                        (int *)&bs->bl.max_transfer);
>+    if (ret < 0) {
>+        error_setg_errno(errp, -ret, "failed to get \"max-transfer\": %s",
>+                         blkio_get_error_msg());
>+        return;
>+    }
>+    if ((bs->bl.max_transfer % bs->bl.request_alignment) ||
>+        (bs->bl.opt_transfer && (bs->bl.max_transfer % bs->bl.opt_transfer))) {
>+        error_setg(errp, "invalid \"max-transfer\" value %d, must be a "
>+                   "multiple of %d and %d (if non-zero)",
>+                   bs->bl.max_transfer, bs->bl.request_alignment,
>+                   bs->bl.opt_transfer);
>+        return;
>+    }
>+
>+    ret = blkio_get_int(s->blkio, "buf-alignment", &value);
>+    if (ret < 0) {
>+        error_setg_errno(errp, -ret, "failed to get \"buf-alignment\": %s",
>+                         blkio_get_error_msg());
>+        return;
>+    }
>+    if (value < 1) {
>+        error_setg(errp, "invalid \"buf-alignment\" value %d, must be "
>+                   "positive", value);
>+        return;
>+    }
>+    bs->bl.min_mem_alignment = value;
>+
>+    ret = blkio_get_int(s->blkio, "optimal-buf-alignment", &value);
>+    if (ret < 0) {
>+        error_setg_errno(errp, -ret,
>+                         "failed to get \"optimal-buf-alignment\": %s",
>+                         blkio_get_error_msg());
>+        return;
>+    }
>+    if (value < 1) {
>+        error_setg(errp, "invalid \"optimal-buf-alignment\" value %d, "
>+                   "must be positive", value);
>+        return;
>+    }
>+    bs->bl.opt_mem_alignment = value;
>+
>+    ret = blkio_get_int(s->blkio, "max-segments", &bs->bl.max_iov);
>+    if (ret < 0) {
>+        error_setg_errno(errp, -ret, "failed to get \"max-segments\": %s",
>+                         blkio_get_error_msg());
>+        return;
>+    }
>+    if (value < 1) {
>+        error_setg(errp, "invalid \"max-segments\" value %d, must be positive",
>+                   bs->bl.max_iov);
>+        return;
>+    }
>+}
>+
>+/*
>+ * TODO
>+ * Missing libblkio APIs:
>+ * - write zeroes
>+ * - discard
>+ * - block_status
>+ * - co_invalidate_cache
>+ *
>+ * Out of scope?
>+ * - create
>+ * - truncate
>+ */
>+
>+static BlockDriver bdrv_io_uring = {
>+    .format_name                = "io_uring",
>+    .protocol_name              = "io_uring",
>+    .instance_size              = sizeof(BDRVBlkioState),
>+    .bdrv_needs_filename        = true,
>+    .bdrv_parse_filename        = blkio_parse_filename_io_uring,
>+    .bdrv_file_open             = blkio_file_open,
>+    .bdrv_close                 = blkio_close,
>+    .bdrv_getlength             = blkio_getlength,
>+    .bdrv_get_info              = blkio_get_info,
>+    .bdrv_attach_aio_context    = blkio_attach_aio_context,
>+    .bdrv_detach_aio_context    = blkio_detach_aio_context,
>+    .bdrv_aio_pdiscard          = blkio_aio_pdiscard,
>+    .bdrv_aio_preadv            = blkio_aio_preadv,
>+    .bdrv_aio_pwritev           = blkio_aio_pwritev,
>+    .bdrv_aio_flush             = blkio_aio_flush,
>+    .bdrv_co_pwrite_zeroes      = blkio_co_pwrite_zeroes,
>+    .bdrv_io_unplug             = blkio_io_unplug,
>+    .bdrv_refresh_limits        = blkio_refresh_limits,
>+};
>+
>+static BlockDriver bdrv_virtio_blk_vhost_vdpa = {
>+    .format_name                = "virtio-blk-vhost-vdpa",
>+    .protocol_name              = "virtio-blk-vhost-vdpa",
>+    .instance_size              = sizeof(BDRVBlkioState),
>+    .bdrv_needs_filename        = true,

Should we set `.bdrv_needs_filename` to false for 
`bdrv_virtio_blk_vhost_vdpa`?

I have this error:
     qemu-system-x86_64: -blockdev 
     node-name=drive_src1,driver=virtio-blk-vhost-vdpa,path=/dev/vhost-vdpa-0: 
     The 'virtio-blk-vhost-vdpa' block driver requires a file name

>+    .bdrv_parse_filename        = blkio_parse_filename_virtio_blk_vhost_vdpa,

For my education, since virtio-blk-vhost-vdpa doesn't use the filename 
parameter, we still need to set .bdrv_parse_filename?

Thanks,
Stefano


