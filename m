Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F38A571F79
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 17:35:55 +0200 (CEST)
Received: from localhost ([::1]:41086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBHvV-0001Hg-Pk
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 11:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1oBGsI-0000En-65
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 10:28:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1oBGsG-0003a3-CE
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 10:28:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657636091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ILtUFISvIaD2vqODp0ccs+yqUxsbqbvrZxLtuqiPZHY=;
 b=CtGUAH4HOdwNFzHw8oYTjJOsCzWcwNerp21jT2CXYL14eW2HvSkcvsW7HY/IFCMlV1w5xx
 t2Th1K6j3bVHeZwxHFzWs5U/S6v8AO1E0XqxUzNBTlAuZCF4qVddDLNoN4vK0RuIkYRCVz
 fLjhEIpY5yk3/2yZzPIPd7OHPNOEypM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-wcVexTX1NO6sXL6dXg4_xw-1; Tue, 12 Jul 2022 10:28:10 -0400
X-MC-Unique: wcVexTX1NO6sXL6dXg4_xw-1
Received: by mail-wm1-f71.google.com with SMTP id
 n18-20020a05600c501200b003a050cc39a0so4139615wmr.7
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 07:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ILtUFISvIaD2vqODp0ccs+yqUxsbqbvrZxLtuqiPZHY=;
 b=aq2l18SH492JAQIv6uMzsfC68Lf2i6dwmvnqjsmpyxxzAaj+dDJHRCsqAc2vLt2KCk
 028xvfA4mVrgTW0+h9uA2Jsi25TvFIT67TmGhywQYENI0wzHb4png3I/F0FyaFtjrXc2
 HzrJs+xKGCOs222BDJGe48GSiSEJVENRbvldLlt7deKPvvrpCJI6eko8gpaaHKagA10m
 RsC+bn3/D8xMnGEkqjAB2vipTWkZVnmlznsgIFuwVjmJzuv4//AlGoEqdElFN/nNbHvW
 eWANRfbR4aJL3dG16ehqQkVx7pyth7mAUkv3gD9XtSjfoIqLE2RrGR8fqig45aKslQrV
 2C9A==
X-Gm-Message-State: AJIora83AYO8R5kxd1N9ekOq8sddbG9fpYVFG5bJ9MsVyO+g/FMiRpcp
 9Xyu/raFKRrIemm/xjJsJg188B+2yUssQzCCYCkAvY/sUdvLXkSmS7GjaF/kg5071wTbYRT3pI8
 BQWoDI4S8+5GaZUI=
X-Received: by 2002:a5d:6e88:0:b0:21a:3403:9aa0 with SMTP id
 k8-20020a5d6e88000000b0021a34039aa0mr22750898wrz.379.1657636088513; 
 Tue, 12 Jul 2022 07:28:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tP3LM1ehvor0/9TRnWqSxAoAI4g4n3xzNeraIKQ3nh4yl5h8jAYsk8zJGZXrZP3Guj6wH5DQ==
X-Received: by 2002:a5d:6e88:0:b0:21a:3403:9aa0 with SMTP id
 k8-20020a5d6e88000000b0021a34039aa0mr22750873wrz.379.1657636088289; 
 Tue, 12 Jul 2022 07:28:08 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-206.retail.telecomitalia.it.
 [79.46.200.206]) by smtp.gmail.com with ESMTPSA id
 j30-20020a05600c1c1e00b003a02de5de80sm12495699wms.4.2022.07.12.07.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 07:28:07 -0700 (PDT)
Date: Tue, 12 Jul 2022 16:28:02 +0200
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
Subject: Re: [RFC v3 7/8] blkio: implement BDRV_REQ_REGISTERED_BUF optimization
Message-ID: <20220712142802.h666smnitj2wh5bl@sgarzare-redhat>
References: <20220708041737.1768521-1-stefanha@redhat.com>
 <20220708041737.1768521-8-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220708041737.1768521-8-stefanha@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, Jul 08, 2022 at 05:17:36AM +0100, Stefan Hajnoczi wrote:
>Avoid bounce buffers when QEMUIOVector elements are within previously
>registered bdrv_register_buf() buffers.
>
>The idea is that emulated storage controllers will register guest RAM
>using bdrv_register_buf() and set the BDRV_REQ_REGISTERED_BUF on I/O
>requests. Therefore no blkio_map_mem_region() calls are necessary in the
>performance-critical I/O code path.
>
>This optimization doesn't apply if the I/O buffer is internally
>allocated by QEMU (e.g. qcow2 metadata). There we still take the slow
>path because BDRV_REQ_REGISTERED_BUF is not set.
>
>Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>---
> block/blkio.c | 104 ++++++++++++++++++++++++++++++++++++++++++++++++--
> 1 file changed, 101 insertions(+), 3 deletions(-)
>
>diff --git a/block/blkio.c b/block/blkio.c
>index 7fbdbd7fae..37d593a20c 100644
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
>@@ -28,6 +30,9 @@ typedef struct {
>
>     /* Can we skip adding/deleting blkio_mem_regions? */
>     bool needs_mem_regions;
>+
>+    /* Are file descriptors necessary for blkio_mem_regions? */
>+    bool needs_mem_region_fd;
> } BDRVBlkioState;
>
> static void blkio_aiocb_complete(BlkioAIOCB *acb, int ret)
>@@ -198,6 +203,8 @@ static BlockAIOCB *blkio_aio_preadv(BlockDriverState *bs, int64_t offset,
>         BlockCompletionFunc *cb, void *opaque)
> {
>     BDRVBlkioState *s = bs->opaque;
>+    bool needs_mem_regions =
>+        s->needs_mem_regions && !(flags & BDRV_REQ_REGISTERED_BUF);
>     struct iovec *iov = qiov->iov;
>     int iovcnt = qiov->niov;
>     BlkioAIOCB *acb;
>@@ -206,7 +213,7 @@ static BlockAIOCB *blkio_aio_preadv(BlockDriverState *bs, int64_t offset,
>
>     acb = blkio_aiocb_get(bs, cb, opaque);
>
>-    if (s->needs_mem_regions) {
>+    if (needs_mem_regions) {
>         if (blkio_aiocb_init_mem_region_locked(acb, bytes) < 0) {
>             qemu_aio_unref(&acb->common);
>             return NULL;
>@@ -230,6 +237,8 @@ static BlockAIOCB *blkio_aio_pwritev(BlockDriverState *bs, int64_t offset,
> {
>     uint32_t blkio_flags = (flags & BDRV_REQ_FUA) ? BLKIO_REQ_FUA : 0;
>     BDRVBlkioState *s = bs->opaque;
>+    bool needs_mem_regions =
>+        s->needs_mem_regions && !(flags & BDRV_REQ_REGISTERED_BUF);
>     struct iovec *iov = qiov->iov;
>     int iovcnt = qiov->niov;
>     BlkioAIOCB *acb;
>@@ -238,7 +247,7 @@ static BlockAIOCB *blkio_aio_pwritev(BlockDriverState *bs, int64_t offset,
>
>     acb = blkio_aiocb_get(bs, cb, opaque);
>
>-    if (s->needs_mem_regions) {
>+    if (needs_mem_regions) {
>         if (blkio_aiocb_init_mem_region_locked(acb, bytes) < 0) {
>             qemu_aio_unref(&acb->common);
>             return NULL;
>@@ -324,6 +333,80 @@ static void blkio_io_unplug(BlockDriverState *bs)
>     }
> }
>
>+static void blkio_register_buf(BlockDriverState *bs, void *host, size_t size)
>+{
>+    BDRVBlkioState *s = bs->opaque;
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

If s->needs_mem_region_fd is true, memory_region_get_fd() crashes I 
think because mr->ram_block is not yet set, indeed from the stack trace 
blkio_register_buf() is called inside qemu_ram_alloc_resizeable(), and 
its result is used to set mr->ram_block in 
memory_region_init_resizeable_ram():

Program terminated with signal SIGSEGV, Segmentation fault.
#0  0x000056235bf1f7a3 in memory_region_get_fd (mr=<optimized out>) at ../softmmu/memory.c:2309
#1  0x000056235c07e54d in blkio_register_buf (bs=<optimized out>, host=0x7f824e200000, size=2097152)
     at ../block/blkio.c:364
#2  0x000056235c0246c6 in bdrv_register_buf (bs=0x56235d606b40, host=0x7f824e200000, size=2097152)
     at ../block/io.c:3362
#3  0x000056235bea44e6 in ram_block_notify_add (host=0x7f824e200000, size=131072, max_size=2097152)
     at ../hw/core/numa.c:863
#4  0x000056235bf22c00 in ram_block_add (new_block=<optimized out>, errp=<optimized out>)
     at ../softmmu/physmem.c:2057
#5  0x000056235bf232e4 in qemu_ram_alloc_internal (size=size@entry=131072, 
     max_size=max_size@entry=2097152, resized=resized@entry=0x56235bc0f920 <fw_cfg_resized>, 
     host=host@entry=0x0, ram_flags=ram_flags@entry=4, mr=mr@entry=0x56235dc3fe00, 
     errp=0x7ffcb21f1be0) at ../softmmu/physmem.c:2180
#6  0x000056235bf26426 in qemu_ram_alloc_resizeable (size=size@entry=131072, 
     maxsz=maxsz@entry=2097152, resized=resized@entry=0x56235bc0f920 <fw_cfg_resized>, 
     mr=mr@entry=0x56235dc3fe00, errp=errp@entry=0x7ffcb21f1be0) at ../softmmu/physmem.c:2209
#7  0x000056235bf1cc99 in memory_region_init_resizeable_ram (mr=0x56235dc3fe00, 
     owner=owner@entry=0x56235d93ffc0, name=name@entry=0x7ffcb21f1ca0 "/rom@etc/acpi/tables", 
     size=131072, max_size=2097152, resized=resized@entry=0x56235bc0f920 <fw_cfg_resized>, 
     errp=0x56235c996490 <error_fatal>) at ../softmmu/memory.c:1586
#8  0x000056235bc0f99c in rom_set_mr (rom=rom@entry=0x56235ddd0200, owner=0x56235d93ffc0, 
     name=name@entry=0x7ffcb21f1ca0 "/rom@etc/acpi/tables", ro=ro@entry=true)
     at ../hw/core/loader.c:961
#9  0x000056235bc12a65 in rom_add_blob (name=name@entry=0x56235c1a2a09 "etc/acpi/tables", 
     blob=0x56235df4f4b0, len=<optimized out>, max_len=max_len@entry=2097152, 
     addr=addr@entry=18446744073709551615, 
     fw_file_name=fw_file_name@entry=0x56235c1a2a09 "etc/acpi/tables", 
     fw_callback=0x56235be47f90 <acpi_build_update>, callback_opaque=0x56235d817830, as=0x0, 
     read_only=true) at ../hw/core/loader.c:1102
#10 0x000056235bbe0990 in acpi_add_rom_blob (
     update=update@entry=0x56235be47f90 <acpi_build_update>, opaque=opaque@entry=0x56235d817830, 
     blob=0x56235d3ab750, name=name@entry=0x56235c1a2a09 "etc/acpi/tables") at ../hw/acpi/utils.c:46
#11 0x000056235be481e6 in acpi_setup () at ../hw/i386/acpi-build.c:2805
#12 0x000056235be3e209 in pc_machine_done (notifier=0x56235d5efce8, data=<optimized out>)
     at ../hw/i386/pc.c:758
#13 0x000056235c12e4a7 in notifier_list_notify (
     list=list@entry=0x56235c963790 <machine_init_done_notifiers>, data=data@entry=0x0)
     at ../util/notify.c:39

Thanks,
Stefano


