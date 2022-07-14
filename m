Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F224574A70
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 12:19:21 +0200 (CEST)
Received: from localhost ([::1]:44146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBvwG-0006OG-3i
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 06:19:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBvr8-0001kf-Kg
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 06:14:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBvr5-0005M0-7p
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 06:14:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657793638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4PzwKyx2NGt4DtkqTkl0QFs7SWLlQSkKJy1WTG8Lm1I=;
 b=C2cl4IcXY0rG1h6hcybFAqz6eO1VKI+eTRELjTA2GGbTtCUPjg63aapAesVFZ/0Nxm6sS+
 e084iJPySmsMqETZm6/e9mgq2OZ0s0YMmMCa0P5cEsldlFWQJtdBSxW1N+8xlptWDPn+Cc
 Fvyp9XxKja2DfMTx9PjqYwBcfn/bjCM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-3t_zDLqKNfGVV6lzue8w7A-1; Thu, 14 Jul 2022 06:13:57 -0400
X-MC-Unique: 3t_zDLqKNfGVV6lzue8w7A-1
Received: by mail-ed1-f71.google.com with SMTP id
 o13-20020a056402438d00b0043aa846b2d2so1216763edc.8
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 03:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4PzwKyx2NGt4DtkqTkl0QFs7SWLlQSkKJy1WTG8Lm1I=;
 b=nFsmooT9N9ey2mvSAr7CPRjtxWRYpKTg5TxDw1NbXxP4W8ipd1KfdX6w45ft9Ok6nU
 rnApoHTrtVY/ZPR1MOaeb0VV3sQsTu20oIh7jTiiNKN3ltIV+tmUEsLOcXStiA25S19g
 24v//3LetbXm05BLyjTM8q05WdT0I2qH/fq0MxOm+z+1/KZmmdK/GUMzLlnf56syxrRE
 q3fxXOrb+KqpsP4eOkr63THQv5mzJloc+eXxLQKUN7mfq2AhEw3h33bFlb9tO9DrCWgu
 dCnHR7sGANjwU2wiBFK60zuoHJGha6KD+4+xAlazZUmLFAqwFjc7m2+Js6+PHPuqqryK
 H9Dw==
X-Gm-Message-State: AJIora/OgsAZLhYiIelBaVoGltHp/9D+CyTffHHOnA/GatlNUu9wCHz7
 WgcXVWw2GdG9bBinLXthe4KHqPlz0E89JauqPDja4FtceOh9kcu9qUIMjRz5+p8ummcxnUrcw6D
 TILbIa5yZvKC6sDQ=
X-Received: by 2002:a05:6402:4488:b0:43a:7b6e:4b04 with SMTP id
 er8-20020a056402448800b0043a7b6e4b04mr11205478edb.202.1657793635950; 
 Thu, 14 Jul 2022 03:13:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1shut7eJ6ImC4NKgaOKIyFNwHYRDkv3STuocXUTRk9WKZ1+LXkDwg985S12sSslNrNMuUn+4w==
X-Received: by 2002:a05:6402:4488:b0:43a:7b6e:4b04 with SMTP id
 er8-20020a056402448800b0043a7b6e4b04mr11205444edb.202.1657793635724; 
 Thu, 14 Jul 2022 03:13:55 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 mx10-20020a1709065a0a00b00722e5e54fc2sm540493ejc.12.2022.07.14.03.13.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 03:13:55 -0700 (PDT)
Message-ID: <8c8faae1-9215-9b18-0051-028e78f56009@redhat.com>
Date: Thu, 14 Jul 2022 12:13:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC v3 7/8] blkio: implement BDRV_REQ_REGISTERED_BUF optimization
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
 <20220708041737.1768521-8-stefanha@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220708041737.1768521-8-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
> Avoid bounce buffers when QEMUIOVector elements are within previously
> registered bdrv_register_buf() buffers.
>
> The idea is that emulated storage controllers will register guest RAM
> using bdrv_register_buf() and set the BDRV_REQ_REGISTERED_BUF on I/O
> requests. Therefore no blkio_map_mem_region() calls are necessary in the
> performance-critical I/O code path.
>
> This optimization doesn't apply if the I/O buffer is internally
> allocated by QEMU (e.g. qcow2 metadata). There we still take the slow
> path because BDRV_REQ_REGISTERED_BUF is not set.

Which keeps the question relevant of how slow the slow path is, i.e. 
whether it wouldn’t make sense to keep some of the mem regions allocated 
there in a cache instead of allocating/freeing them on every I/O request.

> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block/blkio.c | 104 ++++++++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 101 insertions(+), 3 deletions(-)
>
> diff --git a/block/blkio.c b/block/blkio.c
> index 7fbdbd7fae..37d593a20c 100644
> --- a/block/blkio.c
> +++ b/block/blkio.c

[...]

> @@ -198,6 +203,8 @@ static BlockAIOCB *blkio_aio_preadv(BlockDriverState *bs, int64_t offset,
>           BlockCompletionFunc *cb, void *opaque)
>   {
>       BDRVBlkioState *s = bs->opaque;
> +    bool needs_mem_regions =
> +        s->needs_mem_regions && !(flags & BDRV_REQ_REGISTERED_BUF);

Is that condition sufficient?  bdrv_register_buf() has no way of 
returning an error, so it’s possible that buffers are silently not 
registered.  (And there are conditions in blkio_register_buf() where the 
buffer will not be registered, e.g. because it isn’t aligned.)

The caller knows nothing of this and will still pass 
BDRV_REQ_REGISTERED_BUF, and then we’ll assume the region is mapped but 
it won’t be.

>       struct iovec *iov = qiov->iov;
>       int iovcnt = qiov->niov;
>       BlkioAIOCB *acb;

[...]

> @@ -324,6 +333,80 @@ static void blkio_io_unplug(BlockDriverState *bs)
>       }
>   }
>   
> +static void blkio_register_buf(BlockDriverState *bs, void *host, size_t size)
> +{
> +    BDRVBlkioState *s = bs->opaque;
> +    int ret;
> +    struct blkio_mem_region region = (struct blkio_mem_region){
> +        .addr = host,
> +        .len = size,
> +        .fd = -1,
> +    };
> +
> +    if (((uintptr_t)host | size) % s->mem_region_alignment) {
> +        error_report_once("%s: skipping unaligned buf %p with size %zu",
> +                          __func__, host, size);
> +        return; /* skip unaligned */
> +    }

How big is mem-region-alignment generally?  Is it like 4k or is it going 
to be a real issue?

(Also, we could probably register a truncated region.  I know, that’ll 
break the BDRV_REQ_REGISTERED_BUF idea because the caller won’t know 
we’ve truncated it, but that’s no different than just not registering 
the buffer at all.)

> +
> +    /* Attempt to find the fd for a MemoryRegion */
> +    if (s->needs_mem_region_fd) {
> +        int fd = -1;
> +        ram_addr_t offset;
> +        MemoryRegion *mr;
> +
> +        /*
> +         * bdrv_register_buf() is called with the BQL held so mr lives at least
> +         * until this function returns.
> +         */
> +        mr = memory_region_from_host(host, &offset);
> +        if (mr) {
> +            fd = memory_region_get_fd(mr);
> +        }

I don’t think it’s specified that buffers registered with 
bdrv_register_buf() must be within a single memory region, is it? So can 
we somehow verify that the memory region covers the whole buffer?

> +        if (fd == -1) {
> +            error_report_once("%s: skipping fd-less buf %p with size %zu",
> +                              __func__, host, size);
> +            return; /* skip if there is no fd */
> +        }
> +
> +        region.fd = fd;
> +        region.fd_offset = offset;
> +    }
> +
> +    WITH_QEMU_LOCK_GUARD(&s->lock) {
> +        ret = blkio_map_mem_region(s->blkio, &region);
> +    }
> +
> +    if (ret < 0) {
> +        error_report_once("Failed to add blkio mem region %p with size %zu: %s",
> +                          host, size, blkio_get_error_msg());
> +    }
> +}
> +
> +static void blkio_unregister_buf(BlockDriverState *bs, void *host, size_t size)
> +{
> +    BDRVBlkioState *s = bs->opaque;
> +    int ret;
> +    struct blkio_mem_region region = (struct blkio_mem_region){
> +        .addr = host,
> +        .len = size,
> +        .fd = -1,
> +    };
> +
> +    if (((uintptr_t)host | size) % s->mem_region_alignment) {
> +        return; /* skip unaligned */
> +    }
> +
> +    WITH_QEMU_LOCK_GUARD(&s->lock) {
> +        ret = blkio_unmap_mem_region(s->blkio, &region);
> +    }

The documentation of libblkio says that “memory regions must be 
unmapped/freed with exactly the same `region` field values that they 
were mapped/allocated with.”  We don’t set .fd here, though.

It’s also unclear whether it’s allowed to unmap a region that wasn’t 
mapped, but I’ll trust libblkio to detect that.

> +
> +    if (ret < 0) {
> +        error_report_once("Failed to delete blkio mem region %p with size %zu: %s",
> +                          host, size, blkio_get_error_msg());
> +    }
> +}
> +
>   static void blkio_parse_filename_io_uring(const char *filename, QDict *options,
>                                             Error **errp)
>   {

[...]

> @@ -459,7 +553,7 @@ static int blkio_file_open(BlockDriverState *bs, QDict *options, int flags,
>           return ret;
>       }
>   
> -    bs->supported_write_flags = BDRV_REQ_FUA;
> +    bs->supported_write_flags = BDRV_REQ_FUA | BDRV_REQ_REGISTERED_BUF;

Shouldn’t we also report it as a supported read flag then?

Hanna

>       bs->supported_zero_flags = BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP |
>                                  BDRV_REQ_NO_FALLBACK;


