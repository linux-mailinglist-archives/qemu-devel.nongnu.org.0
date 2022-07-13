Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834A3573605
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 14:08:35 +0200 (CEST)
Received: from localhost ([::1]:38824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBbAQ-00030z-48
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 08:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBb7T-0000Rb-0b
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 08:05:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBb7N-0008Rk-Dq
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 08:05:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657713923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0WiAiOqCYWeDJh9RtIl3vT8cBazNwp/uZq3v95kVdMc=;
 b=OdzFSu5m5aguYCb9Fq4T1yTYpRecUjDkYhtfsaH/5QIgrYVQmjpTwuJIMDFCE3WJXFdsEU
 eIdJvYfbAyb9G4Rj9aBUEdDYgmPwNknjb8sJxmdRza2tL7t/XU+xiYdZxu7uyToo1hZQ+n
 /XYysyDVvpnucLodHOcapAAtV9X+Pp4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-xCTkApC9ORanHhrYlUJpJw-1; Wed, 13 Jul 2022 08:05:22 -0400
X-MC-Unique: xCTkApC9ORanHhrYlUJpJw-1
Received: by mail-ed1-f69.google.com with SMTP id
 m10-20020a056402510a00b0043a93d807ffso8213836edd.12
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 05:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0WiAiOqCYWeDJh9RtIl3vT8cBazNwp/uZq3v95kVdMc=;
 b=2gYfoc2sxVHJuIx8jm5C7D/fDZN78YuuQssKlLrddLJLQXcTcYBc4buuZ1H4TOlTDU
 FO1fp4jhVHSEooYdj1UEP3X+T/4JHgS8zm+wGKfQwc2hjmc7oWn38B/2NwlVdZIozJ1H
 6QZS09CzgcQspa5KFbPcPCz8n7K1mdudJFNJXszsyPP+fuprIuRHz3wzoFFaPsvFByGz
 yG1yDlwGYzgddE2psKSa+3BTglvZgEZIdIdwEQ5FiXXA2r+ftt47ZjfeW0xAKcSpv1KB
 isF+N5lPrJkzzudZVvkn9F29jrtg4thWCxWwfpDT2clHxMp7pdtfEgKURAtIaFMaLMdi
 ELIQ==
X-Gm-Message-State: AJIora9NLv7JZUtOBvfSicYGPTIB7ZJCEMlEP4+YqZkERzdGDBKgAfsk
 /XY7fx6TJ0D/ErcAAIxnjrtQdk1CbKAklHV6dfDDuUhH+s9IHthTFyHmHOD6e055/T6Qd95a0g/
 hQv/wGvPb2V7FI30=
X-Received: by 2002:a05:6402:1d50:b0:43a:737c:289c with SMTP id
 dz16-20020a0564021d5000b0043a737c289cmr4420015edb.47.1657713921332; 
 Wed, 13 Jul 2022 05:05:21 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tBNG3aRESO9EetAJrsQy0v2wU/x6L6RyXiF88Be85wsdtp9E0S5sudF2oXAYnND5nmB3518Q==
X-Received: by 2002:a05:6402:1d50:b0:43a:737c:289c with SMTP id
 dz16-20020a0564021d5000b0043a737c289cmr4419928edb.47.1657713920734; 
 Wed, 13 Jul 2022 05:05:20 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 lu14-20020a170906face00b0072b873f19a0sm1475564ejb.129.2022.07.13.05.05.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jul 2022 05:05:20 -0700 (PDT)
Message-ID: <a8535ef6-6c42-da31-44b6-ecbbeb0051c3@redhat.com>
Date: Wed, 13 Jul 2022 14:05:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC v3 1/8] blkio: add io_uring block driver using libblkio
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Alberto Faria <afaria@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 sgarzare@redhat.com, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Fam Zheng <fam@euphon.net>, Yanan Wang <wangyanan55@huawei.com>
References: <20220708041737.1768521-1-stefanha@redhat.com>
 <20220708041737.1768521-2-stefanha@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220708041737.1768521-2-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

On 08.07.22 06:17, Stefan Hajnoczi wrote:
> libblkio (https://gitlab.com/libblkio/libblkio/) is a library for
> high-performance disk I/O. It currently supports io_uring and
> virtio-blk-vhost-vdpa with additional drivers under development.
>
> One of the reasons for developing libblkio is that other applications
> besides QEMU can use it. This will be particularly useful for
> vhost-user-blk which applications may wish to use for connecting to
> qemu-storage-daemon.
>
> libblkio also gives us an opportunity to develop in Rust behind a C API
> that is easy to consume from QEMU.
>
> This commit adds io_uring and virtio-blk-vhost-vdpa BlockDrivers to QEMU
> using libblkio. It will be easy to add other libblkio drivers since they
> will share the majority of code.
>
> For now I/O buffers are copied through bounce buffers if the libblkio
> driver requires it. Later commits add an optimization for
> pre-registering guest RAM to avoid bounce buffers.
>
> The syntax is:
>
>    --blockdev io_uring,node-name=drive0,filename=test.img,readonly=on|off,cache.direct=on|off
>
> and:
>
>    --blockdev virtio-blk-vhost-vdpa,node-name=drive0,path=/dev/vdpa...,readonly=on|off
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   MAINTAINERS                   |   6 +
>   meson_options.txt             |   2 +
>   qapi/block-core.json          |  37 +-
>   meson.build                   |   9 +
>   block/blkio.c                 | 659 ++++++++++++++++++++++++++++++++++
>   tests/qtest/modules-test.c    |   3 +
>   block/meson.build             |   1 +
>   scripts/meson-buildoptions.sh |   3 +
>   8 files changed, 718 insertions(+), 2 deletions(-)
>   create mode 100644 block/blkio.c

[...]

> diff --git a/block/blkio.c b/block/blkio.c
> new file mode 100644
> index 0000000000..7fbdbd7fae
> --- /dev/null
> +++ b/block/blkio.c
> @@ -0,0 +1,659 @@

Not sure whether it’s necessary, but I would have expected a copyright 
header here.

> +#include "qemu/osdep.h"
> +#include <blkio.h>
> +#include "block/block_int.h"
> +#include "qapi/error.h"
> +#include "qapi/qmp/qdict.h"
> +#include "qemu/module.h"
> +
> +typedef struct BlkAIOCB {
> +    BlockAIOCB common;
> +    struct blkio_mem_region mem_region;
> +    QEMUIOVector qiov;
> +    struct iovec bounce_iov;
> +} BlkioAIOCB;
> +
> +typedef struct {
> +    /* Protects ->blkio and request submission on ->blkioq */
> +    QemuMutex lock;
> +
> +    struct blkio *blkio;
> +    struct blkioq *blkioq; /* this could be multi-queue in the future */
> +    int completion_fd;
> +
> +    /* Polling fetches the next completion into this field */
> +    struct blkio_completion poll_completion;
> +
> +    /* The value of the "mem-region-alignment" property */
> +    size_t mem_region_alignment;
> +
> +    /* Can we skip adding/deleting blkio_mem_regions? */
> +    bool needs_mem_regions;
> +} BDRVBlkioState;
> +
> +static void blkio_aiocb_complete(BlkioAIOCB *acb, int ret)
> +{
> +    /* Copy bounce buffer back to qiov */
> +    if (acb->qiov.niov > 0) {
> +        qemu_iovec_from_buf(&acb->qiov, 0,
> +                acb->bounce_iov.iov_base,
> +                acb->bounce_iov.iov_len);
> +        qemu_iovec_destroy(&acb->qiov);
> +    }
> +
> +    acb->common.cb(acb->common.opaque, ret);
> +
> +    if (acb->mem_region.len > 0) {
> +        BDRVBlkioState *s = acb->common.bs->opaque;
> +
> +        WITH_QEMU_LOCK_GUARD(&s->lock) {
> +            blkio_free_mem_region(s->blkio, &acb->mem_region);
> +        }
> +    }
> +
> +    qemu_aio_unref(&acb->common);
> +}
> +
> +/*
> + * Only the thread that calls aio_poll() invokes fd and poll handlers.
> + * Therefore locks are not necessary except when accessing s->blkio.
> + *
> + * No locking is performed around blkioq_get_completions() although other
> + * threads may submit I/O requests on s->blkioq. We're assuming there is no
> + * inteference between blkioq_get_completions() and other s->blkioq APIs.
> + */
> +
> +static void blkio_completion_fd_read(void *opaque)
> +{
> +    BlockDriverState *bs = opaque;
> +    BDRVBlkioState *s = bs->opaque;
> +    struct blkio_completion completion;
> +    uint64_t val;
> +    ssize_t ret __attribute__((unused));

I’d prefer a `(void)ret;` over this attribute, not least because that 
line would give a nice opportunity to explain in a short comment why we 
ignore this return value that the compiler tells us not to ignore, but 
if you don’t, then this’ll be fine.

> +
> +    /* Polling may have already fetched a completion */
> +    if (s->poll_completion.user_data != NULL) {
> +        completion = s->poll_completion;
> +
> +        /* Clear it in case blkio_aiocb_complete() has a nested event loop */
> +        s->poll_completion.user_data = NULL;
> +
> +        blkio_aiocb_complete(completion.user_data, completion.ret);
> +    }
> +
> +    /* Reset completion fd status */
> +    ret = read(s->completion_fd, &val, sizeof(val));
> +
> +    /*
> +     * Reading one completion at a time makes nested event loop re-entrancy
> +     * simple. Change this loop to get multiple completions in one go if it
> +     * becomes a performance bottleneck.
> +     */
> +    while (blkioq_do_io(s->blkioq, &completion, 0, 1, NULL) == 1) {
> +        blkio_aiocb_complete(completion.user_data, completion.ret);
> +    }
> +}
> +
> +static bool blkio_completion_fd_poll(void *opaque)
> +{
> +    BlockDriverState *bs = opaque;
> +    BDRVBlkioState *s = bs->opaque;
> +
> +    /* Just in case we already fetched a completion */
> +    if (s->poll_completion.user_data != NULL) {
> +        return true;
> +    }
> +
> +    return blkioq_do_io(s->blkioq, &s->poll_completion, 0, 1, NULL) == 1;
> +}
> +
> +static void blkio_completion_fd_poll_ready(void *opaque)
> +{
> +    blkio_completion_fd_read(opaque);
> +}
> +
> +static void blkio_attach_aio_context(BlockDriverState *bs,
> +                                     AioContext *new_context)
> +{
> +    BDRVBlkioState *s = bs->opaque;
> +
> +    aio_set_fd_handler(new_context,
> +                       s->completion_fd,
> +                       false,
> +                       blkio_completion_fd_read,
> +                       NULL,
> +                       blkio_completion_fd_poll,
> +                       blkio_completion_fd_poll_ready,
> +                       bs);
> +}
> +
> +static void blkio_detach_aio_context(BlockDriverState *bs)
> +{
> +    BDRVBlkioState *s = bs->opaque;
> +
> +    aio_set_fd_handler(bdrv_get_aio_context(bs),
> +                       s->completion_fd,
> +                       false, NULL, NULL, NULL, NULL, NULL);
> +}
> +
> +static const AIOCBInfo blkio_aiocb_info = {
> +    .aiocb_size = sizeof(BlkioAIOCB),
> +};
> +
> +/* Create a BlkioAIOCB */
> +static BlkioAIOCB *blkio_aiocb_get(BlockDriverState *bs,
> +                                   BlockCompletionFunc *cb,
> +                                   void *opaque)
> +{
> +    BlkioAIOCB *acb = qemu_aio_get(&blkio_aiocb_info, bs, cb, opaque);
> +
> +    /* A few fields need to be initialized, leave the rest... */
> +    acb->qiov.niov = 0;
> +    acb->mem_region.len = 0;
> +    return acb;
> +}
> +
> +/* s->lock must be held */
> +static int blkio_aiocb_init_mem_region_locked(BlkioAIOCB *acb, size_t len)
> +{
> +    BDRVBlkioState *s = acb->common.bs->opaque;
> +    size_t mem_region_len = QEMU_ALIGN_UP(len, s->mem_region_alignment);
> +    int ret;
> +
> +    ret = blkio_alloc_mem_region(s->blkio, &acb->mem_region, mem_region_len);

I don’t find the blkio doc clear on whether this function is 
sufficiently fast to be used in an I/O path.  Is it?

(Or is this perhaps addressed in a later function in this series?)

> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    acb->bounce_iov.iov_base = acb->mem_region.addr;
> +    acb->bounce_iov.iov_len = len;
> +    return 0;
> +}
> +
> +/* Call this to submit I/O after enqueuing a new request */
> +static void blkio_submit_io(BlockDriverState *bs)
> +{
> +    if (qatomic_read(&bs->io_plugged) == 0) {
> +        BDRVBlkioState *s = bs->opaque;
> +
> +        blkioq_do_io(s->blkioq, NULL, 0, 0, NULL);
> +    }
> +}
> +
> +static BlockAIOCB *blkio_aio_pdiscard(BlockDriverState *bs, int64_t offset,
> +        int bytes, BlockCompletionFunc *cb, void *opaque)
> +{
> +    BDRVBlkioState *s = bs->opaque;
> +    BlkioAIOCB *acb;
> +
> +    QEMU_LOCK_GUARD(&s->lock);
> +
> +    acb = blkio_aiocb_get(bs, cb, opaque);
> +    blkioq_discard(s->blkioq, offset, bytes, acb, 0);
> +    blkio_submit_io(bs);
> +    return &acb->common;
> +}
> +
> +static BlockAIOCB *blkio_aio_preadv(BlockDriverState *bs, int64_t offset,
> +        int64_t bytes, QEMUIOVector *qiov, BdrvRequestFlags flags,
> +        BlockCompletionFunc *cb, void *opaque)
> +{
> +    BDRVBlkioState *s = bs->opaque;
> +    struct iovec *iov = qiov->iov;
> +    int iovcnt = qiov->niov;
> +    BlkioAIOCB *acb;
> +
> +    QEMU_LOCK_GUARD(&s->lock);
> +
> +    acb = blkio_aiocb_get(bs, cb, opaque);
> +
> +    if (s->needs_mem_regions) {
> +        if (blkio_aiocb_init_mem_region_locked(acb, bytes) < 0) {
> +            qemu_aio_unref(&acb->common);
> +            return NULL;
> +        }
> +
> +        /* Copy qiov because we'll call qemu_iovec_from_buf() on completion */
> +        qemu_iovec_init_slice(&acb->qiov, qiov, 0, qiov->size);
> +
> +        iov = &acb->bounce_iov;
> +        iovcnt = 1;
> +    }
> +
> +    blkioq_readv(s->blkioq, offset, iov, iovcnt, acb, 0);
> +    blkio_submit_io(bs);
> +    return &acb->common;
> +}
> +
> +static BlockAIOCB *blkio_aio_pwritev(BlockDriverState *bs, int64_t offset,
> +        int64_t bytes, QEMUIOVector *qiov, BdrvRequestFlags flags,
> +        BlockCompletionFunc *cb, void *opaque)
> +{
> +    uint32_t blkio_flags = (flags & BDRV_REQ_FUA) ? BLKIO_REQ_FUA : 0;
> +    BDRVBlkioState *s = bs->opaque;
> +    struct iovec *iov = qiov->iov;
> +    int iovcnt = qiov->niov;
> +    BlkioAIOCB *acb;
> +
> +    QEMU_LOCK_GUARD(&s->lock);
> +
> +    acb = blkio_aiocb_get(bs, cb, opaque);
> +
> +    if (s->needs_mem_regions) {
> +        if (blkio_aiocb_init_mem_region_locked(acb, bytes) < 0) {
> +            qemu_aio_unref(&acb->common);
> +            return NULL;
> +        }
> +
> +        qemu_iovec_to_buf(qiov, 0, acb->bounce_iov.iov_base, bytes);
> +
> +        iov = &acb->bounce_iov;
> +        iovcnt = 1;
> +    }
> +
> +    blkioq_writev(s->blkioq, offset, iov, iovcnt, acb, blkio_flags);
> +    blkio_submit_io(bs);
> +    return &acb->common;
> +}
> +
> +static BlockAIOCB *blkio_aio_flush(BlockDriverState *bs,
> +                                   BlockCompletionFunc *cb,
> +                                   void *opaque)
> +{
> +    BDRVBlkioState *s = bs->opaque;
> +    BlkioAIOCB *acb;
> +
> +    QEMU_LOCK_GUARD(&s->lock);
> +
> +    acb = blkio_aiocb_get(bs, cb, opaque);
> +
> +    blkioq_flush(s->blkioq, acb, 0);
> +    blkio_submit_io(bs);
> +    return &acb->common;
> +}
> +
> +/* For async to .bdrv_co_*() conversion */
> +typedef struct {
> +    Coroutine *coroutine;
> +    int ret;
> +} BlkioCoData;
> +
> +static void blkio_co_pwrite_zeroes_complete(void *opaque, int ret)
> +{
> +    BlkioCoData *data = opaque;
> +
> +    data->ret = ret;
> +    aio_co_wake(data->coroutine);
> +}
> +
> +static int coroutine_fn blkio_co_pwrite_zeroes(BlockDriverState *bs,
> +    int64_t offset, int64_t bytes, BdrvRequestFlags flags)
> +{
> +    BDRVBlkioState *s = bs->opaque;
> +    BlkioCoData data = {
> +        .coroutine = qemu_coroutine_self(),
> +    };
> +    uint32_t blkio_flags = 0;
> +
> +    if (flags & BDRV_REQ_FUA) {
> +        blkio_flags |= BLKIO_REQ_FUA;
> +    }
> +    if (!(flags & BDRV_REQ_MAY_UNMAP)) {
> +        blkio_flags |= BLKIO_REQ_NO_UNMAP;
> +    }
> +    if (flags & BDRV_REQ_NO_FALLBACK) {
> +        blkio_flags |= BLKIO_REQ_NO_FALLBACK;
> +    }
> +
> +    WITH_QEMU_LOCK_GUARD(&s->lock) {
> +        BlkioAIOCB *acb =
> +            blkio_aiocb_get(bs, blkio_co_pwrite_zeroes_complete, &data);
> +        blkioq_write_zeroes(s->blkioq, offset, bytes, acb, blkio_flags);
> +        blkio_submit_io(bs);
> +    }
> +
> +    qemu_coroutine_yield();
> +    return data.ret;
> +}
> +
> +static void blkio_io_unplug(BlockDriverState *bs)
> +{
> +    BDRVBlkioState *s = bs->opaque;
> +
> +    WITH_QEMU_LOCK_GUARD(&s->lock) {
> +        blkio_submit_io(bs);
> +    }
> +}
> +
> +static void blkio_parse_filename_io_uring(const char *filename, QDict *options,
> +                                          Error **errp)
> +{
> +    bdrv_parse_filename_strip_prefix(filename, "io_uring:", options);
> +}
> +
> +static void blkio_parse_filename_virtio_blk_vhost_vdpa(
> +        const char *filename,
> +        QDict *options,
> +        Error **errp)
> +{
> +    bdrv_parse_filename_strip_prefix(filename, "virtio-blk-vhost-vdpa:", options);
> +}

Besides the fact that this doesn’t work for virtio-blk-vhost-vdpa 
(because it provides a @filename option, but that driver expects a @path 
option), is it really worth implementing these, or should we just expect 
users to use -blockdev (or -drive with blockdev-like options)?

> +
> +static int blkio_io_uring_open(BlockDriverState *bs, QDict *options, int flags,
> +                               Error **errp)
> +{
> +    const char *filename = qdict_get_try_str(options, "filename");
> +    BDRVBlkioState *s = bs->opaque;
> +    int ret;
> +
> +    ret = blkio_set_str(s->blkio, "path", filename);

You don’t check that @filename is non-NULL, and I don’t think that 
libblkio would accept a NULL here.  Admittedly, I can’t produce a case 
where it would be NULL (because -blockdev checks the QAPI schema, and 
-drive expects a @filename parameter thanks to .bdrv_needs_filename), 
but I think it’s still isn’t ideal.

> +    qdict_del(options, "filename");
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret, "failed to set path: %s",
> +                         blkio_get_error_msg());
> +        return ret;
> +    }
> +
> +    if (flags & BDRV_O_NOCACHE) {
> +        ret = blkio_set_bool(s->blkio, "direct", true);
> +        if (ret < 0) {
> +            error_setg_errno(errp, -ret, "failed to set direct: %s",
> +                             blkio_get_error_msg());
> +            return ret;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +static int blkio_virtio_blk_vhost_vdpa_open(BlockDriverState *bs,
> +        QDict *options, int flags, Error **errp)
> +{
> +    const char *path = qdict_get_try_str(options, "path");
> +    BDRVBlkioState *s = bs->opaque;
> +    int ret;
> +
> +    ret = blkio_set_str(s->blkio, "path", path);

In contrast to the above, I can make @path NULL here, because 
.bdrv_needs_filename only ensures that there’s a @filename parameter, 
and so:

$ ./qemu-system-x86_64 -drive 
if=none,driver=virtio-blk-vhost-vdpa,id=node0,filename=foo
[1]    49946 segmentation fault (core dumped)  ./qemu-system-x86_64 -drive

> +    qdict_del(options, "path");
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret, "failed to set path: %s",
> +                         blkio_get_error_msg());
> +        return ret;
> +    }
> +
> +    if (flags & BDRV_O_NOCACHE) {
> +        error_setg(errp, "cache.direct=off is not supported");

The condition is the opposite of that, though, isn’t it?

I.e.:

$ ./qemu-system-x86_64 -drive 
if=none,driver=virtio-blk-vhost-vdpa,id=node0,filename=foo,path=foo,cache.direct=on 

qemu-system-x86_64: -drive 
if=none,driver=virtio-blk-vhost-vdpa,id=node0,filename=foo,path=foo,cache.direct=on: 
cache.direct=off is not supported

> +        return -EINVAL;
> +    }
> +    return 0;
> +}
> +
> +static int blkio_file_open(BlockDriverState *bs, QDict *options, int flags,
> +                           Error **errp)
> +{
> +    const char *blkio_driver = bs->drv->protocol_name;
> +    BDRVBlkioState *s = bs->opaque;
> +    int ret;
> +
> +    ret = blkio_create(blkio_driver, &s->blkio);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret, "blkio_create failed: %s",
> +                         blkio_get_error_msg());
> +        return ret;
> +    }
> +
> +    if (strcmp(blkio_driver, "io_uring") == 0) {
> +        ret = blkio_io_uring_open(bs, options, flags, errp);
> +    } else if (strcmp(blkio_driver, "virtio-blk-vhost-vdpa") == 0) {
> +        ret = blkio_virtio_blk_vhost_vdpa_open(bs, options, flags, errp);
> +    }

First, I’d like to suggest using macros for the driver names (and use 
them here and below for format_name/protocol_name).

Second, what do you think about adding an `else` branch with 
`g_assert_not_reached()` (or just abort)?

> +    if (ret < 0) {
> +        blkio_destroy(&s->blkio);
> +        return ret;
> +    }
> +
> +    if (!(flags & BDRV_O_RDWR)) {
> +        ret = blkio_set_bool(s->blkio, "readonly", true);

The libblkio doc says it’s “read-only”, and when I try to set this 
option, I get an error:

$ ./qemu-system-x86_64 -blockdev 
io_uring,node-name=node0,filename=/dev/null,read-only=on
qemu-system-x86_64: -blockdev 
io_uring,node-name=node0,filename=/dev/null,read-only=on: failed to set 
readonly: Unknown property name: No such file or directory

> +        if (ret < 0) {
> +            error_setg_errno(errp, -ret, "failed to set readonly: %s",
> +                             blkio_get_error_msg());
> +            blkio_destroy(&s->blkio);
> +            return ret;
> +        }
> +    }
> +
> +    ret = blkio_connect(s->blkio);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret, "blkio_connect failed: %s",
> +                         blkio_get_error_msg());
> +        blkio_destroy(&s->blkio);
> +        return ret;
> +    }
> +
> +    ret = blkio_get_bool(s->blkio,
> +                         "needs-mem-regions",
> +                         &s->needs_mem_regions);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret,
> +                         "failed to get needs-mem-regions: %s",
> +                         blkio_get_error_msg());
> +        blkio_destroy(&s->blkio);
> +        return ret;
> +    }
> +
> +    ret = blkio_get_uint64(s->blkio,
> +                           "mem-region-alignment",
> +                           &s->mem_region_alignment);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret,
> +                         "failed to get mem-region-alignment: %s",
> +                         blkio_get_error_msg());
> +        blkio_destroy(&s->blkio);
> +        return ret;
> +    }
> +
> +    ret = blkio_start(s->blkio);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret, "blkio_start failed: %s",
> +                         blkio_get_error_msg());
> +        blkio_destroy(&s->blkio);
> +        return ret;
> +    }
> +
> +    bs->supported_write_flags = BDRV_REQ_FUA;
> +    bs->supported_zero_flags = BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP |
> +                               BDRV_REQ_NO_FALLBACK;
> +
> +    qemu_mutex_init(&s->lock);
> +    s->blkioq = blkio_get_queue(s->blkio, 0);
> +    s->completion_fd = blkioq_get_completion_fd(s->blkioq);
> +
> +    blkio_attach_aio_context(bs, bdrv_get_aio_context(bs));
> +    return 0;
> +}
> +
> +static void blkio_close(BlockDriverState *bs)
> +{
> +    BDRVBlkioState *s = bs->opaque;
> +
> +    qemu_mutex_destroy(&s->lock);
> +    blkio_destroy(&s->blkio);

Should we call blkio_detach_aio_context() here?

> +}
> +
> +static int64_t blkio_getlength(BlockDriverState *bs)
> +{
> +    BDRVBlkioState *s = bs->opaque;
> +    uint64_t capacity;
> +    int ret;
> +
> +    WITH_QEMU_LOCK_GUARD(&s->lock) {
> +        ret = blkio_get_uint64(s->blkio, "capacity", &capacity);
> +    }
> +    if (ret < 0) {
> +        return -ret;
> +    }
> +
> +    return capacity;
> +}
> +
> +static int blkio_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
> +{
> +    return 0;
> +}
> +
> +static void blkio_refresh_limits(BlockDriverState *bs, Error **errp)
> +{
> +    BDRVBlkioState *s = bs->opaque;
> +    int value;
> +    int ret;
> +
> +    ret = blkio_get_int(s->blkio,
> +                        "request-alignment",
> +                        (int *)&bs->bl.request_alignment);

I find this pointer cast and the ones below quite questionable. 
Admittedly, I can’t think of a reasonably common system (nowadays) where 
this would actually cause problems, but I’d prefer just reading all ints 
into `value` and then assigning the respective limit from it.

> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret, "failed to get \"request-alignment\": %s",
> +                         blkio_get_error_msg());
> +        return;
> +    }
> +    if (bs->bl.request_alignment < 1 ||
> +        bs->bl.request_alignment >= INT_MAX ||
> +        !is_power_of_2(bs->bl.request_alignment)) {
> +        error_setg(errp, "invalid \"request-alignment\" value %d, must be "
> +                   "power of 2 less than INT_MAX", bs->bl.request_alignment);

Minor (because auto-checked by the compiler anyway), but I’d prefer `%" 
PRIu32 "` instead of `%d` (same for other limits below).

> +        return;
> +    }
> +
> +    ret = blkio_get_int(s->blkio,
> +                        "optimal-io-size",
> +                        (int *)&bs->bl.opt_transfer);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret, "failed to get \"buf-alignment\": %s",
> +                         blkio_get_error_msg());
> +        return;
> +    }
> +    if (bs->bl.opt_transfer > INT_MAX ||
> +        (bs->bl.opt_transfer % bs->bl.request_alignment)) {
> +        error_setg(errp, "invalid \"buf-alignment\" value %d, must be a "
> +                   "multiple of %d", bs->bl.opt_transfer,
> +                   bs->bl.request_alignment);

Both error messages call it buf-alignment, but here we’re actually 
querying optimal-io-size.

Second, is it really fatal if we fail to query it?  It was my impression 
that this is optional anyway, so why don’t we just ignore `ret < 0` and 
make it zero then?

> +        return;
> +    }
> +
> +    ret = blkio_get_int(s->blkio,
> +                        "max-transfer",
> +                        (int *)&bs->bl.max_transfer);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret, "failed to get \"max-transfer\": %s",
> +                         blkio_get_error_msg());
> +        return;
> +    }
> +    if ((bs->bl.max_transfer % bs->bl.request_alignment) ||
> +        (bs->bl.opt_transfer && (bs->bl.max_transfer % bs->bl.opt_transfer))) {
> +        error_setg(errp, "invalid \"max-transfer\" value %d, must be a "
> +                   "multiple of %d and %d (if non-zero)",
> +                   bs->bl.max_transfer, bs->bl.request_alignment,
> +                   bs->bl.opt_transfer);
> +        return;
> +    }
> +
> +    ret = blkio_get_int(s->blkio, "buf-alignment", &value);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret, "failed to get \"buf-alignment\": %s",
> +                         blkio_get_error_msg());
> +        return;
> +    }
> +    if (value < 1) {
> +        error_setg(errp, "invalid \"buf-alignment\" value %d, must be "
> +                   "positive", value);
> +        return;
> +    }
> +    bs->bl.min_mem_alignment = value;
> +
> +    ret = blkio_get_int(s->blkio, "optimal-buf-alignment", &value);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret,
> +                         "failed to get \"optimal-buf-alignment\": %s",
> +                         blkio_get_error_msg());
> +        return;
> +    }
> +    if (value < 1) {
> +        error_setg(errp, "invalid \"optimal-buf-alignment\" value %d, "
> +                   "must be positive", value);
> +        return;
> +    }
> +    bs->bl.opt_mem_alignment = value;
> +
> +    ret = blkio_get_int(s->blkio, "max-segments", &bs->bl.max_iov);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret, "failed to get \"max-segments\": %s",
> +                         blkio_get_error_msg());
> +        return;
> +    }
> +    if (value < 1) {
> +        error_setg(errp, "invalid \"max-segments\" value %d, must be positive",
> +                   bs->bl.max_iov);
> +        return;
> +    }
> +}
> +
> +/*
> + * TODO
> + * Missing libblkio APIs:
> + * - write zeroes
> + * - discard

But you’ve added functionality for both here, haven’t you?

> + * - block_status
> + * - co_invalidate_cache
> + *
> + * Out of scope?
> + * - create
> + * - truncate

I don’t know why truncate would be out of scope, we even have truncate 
support for block devices so that users can signal size changes to qemu.

I can see that it isn’t important right now, but I don’t think that 
makes it out of scope.

(Creation seems out of scope, because you can just create regular files 
via the “file” driver.)

Hanna

> + */
> +
> +static BlockDriver bdrv_io_uring = {
> +    .format_name                = "io_uring",
> +    .protocol_name              = "io_uring",
> +    .instance_size              = sizeof(BDRVBlkioState),
> +    .bdrv_needs_filename        = true,
> +    .bdrv_parse_filename        = blkio_parse_filename_io_uring,
> +    .bdrv_file_open             = blkio_file_open,
> +    .bdrv_close                 = blkio_close,
> +    .bdrv_getlength             = blkio_getlength,
> +    .bdrv_get_info              = blkio_get_info,
> +    .bdrv_attach_aio_context    = blkio_attach_aio_context,
> +    .bdrv_detach_aio_context    = blkio_detach_aio_context,
> +    .bdrv_aio_pdiscard          = blkio_aio_pdiscard,
> +    .bdrv_aio_preadv            = blkio_aio_preadv,
> +    .bdrv_aio_pwritev           = blkio_aio_pwritev,
> +    .bdrv_aio_flush             = blkio_aio_flush,
> +    .bdrv_co_pwrite_zeroes      = blkio_co_pwrite_zeroes,
> +    .bdrv_io_unplug             = blkio_io_unplug,
> +    .bdrv_refresh_limits        = blkio_refresh_limits,
> +};
> +
> +static BlockDriver bdrv_virtio_blk_vhost_vdpa = {
> +    .format_name                = "virtio-blk-vhost-vdpa",
> +    .protocol_name              = "virtio-blk-vhost-vdpa",
> +    .instance_size              = sizeof(BDRVBlkioState),
> +    .bdrv_needs_filename        = true,
> +    .bdrv_parse_filename        = blkio_parse_filename_virtio_blk_vhost_vdpa,
> +    .bdrv_file_open             = blkio_file_open,
> +    .bdrv_close                 = blkio_close,
> +    .bdrv_getlength             = blkio_getlength,
> +    .bdrv_get_info              = blkio_get_info,
> +    .bdrv_attach_aio_context    = blkio_attach_aio_context,
> +    .bdrv_detach_aio_context    = blkio_detach_aio_context,
> +    .bdrv_aio_pdiscard          = blkio_aio_pdiscard,
> +    .bdrv_aio_preadv            = blkio_aio_preadv,
> +    .bdrv_aio_pwritev           = blkio_aio_pwritev,
> +    .bdrv_aio_flush             = blkio_aio_flush,
> +    .bdrv_co_pwrite_zeroes      = blkio_co_pwrite_zeroes,
> +    .bdrv_io_unplug             = blkio_io_unplug,
> +    .bdrv_refresh_limits        = blkio_refresh_limits,
> +};
> +
> +static void bdrv_blkio_init(void)
> +{
> +    bdrv_register(&bdrv_io_uring);
> +    bdrv_register(&bdrv_virtio_blk_vhost_vdpa);
> +}
> +
> +block_init(bdrv_blkio_init);


