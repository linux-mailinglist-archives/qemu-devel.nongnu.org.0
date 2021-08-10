Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E653E5E75
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 16:58:22 +0200 (CEST)
Received: from localhost ([::1]:48328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDTCu-0002DO-BG
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 10:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mDTAS-0005qA-KX
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 10:55:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mDTAO-0001QA-Tc
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 10:55:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628607343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=beT1tfa2/hI1xuZ402E+dV6qT17h0lFBRfRYeEyIqLc=;
 b=OpAvuaz6CIa1i2PFaKpO6wUfHDeY2GaT1/lAkPiEfLy0/UW+4GPyMy2tDVkYSgjtuErK9W
 unkpqgLrbdls5RFp6IGXuhHvH990HOxpBko1ZsP8T8YDektk+PIxIs8k87BphjVTHICAxK
 9ezGNJo4wYlA6kSQGFV5EOeH+Ng/rgA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-OV7M61JmMY6S6G2cZxBNQA-1; Tue, 10 Aug 2021 10:55:41 -0400
X-MC-Unique: OV7M61JmMY6S6G2cZxBNQA-1
Received: by mail-wm1-f69.google.com with SMTP id
 m37-20020a05600c3b25b02902b5a02478adso677716wms.0
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 07:55:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=beT1tfa2/hI1xuZ402E+dV6qT17h0lFBRfRYeEyIqLc=;
 b=IGTgnmtxO+84pfkGLZVdkC7q5c64oOCdyFuNlF6gtvgEotB4bGYV6ZAjgC3AnxnCOY
 sXXqIcJUOY0lJBSidUb0IZ+msTqPQSNzEreeyouvFxjESXPnw5h/YzL8RSQEPUTS0bRg
 ZRLKL8dgkkQQYcj+gZMuHWZS0UcakGZqmpdWZxj0AqKfGcB42AhD3dRt9pVx7RA6usqk
 DkapOoGkxJROqKmIn539KGXuGdRZiLnamikqsrVr6khzxKSA/n/zVzR/uEXZ0SBjXjpd
 tmQDReQzj6676SbxdSPNNb4Ilt5trdXsAxbctuFx5bYxMAfj8r3/rzr6xZLd8X/CcVUl
 IDKg==
X-Gm-Message-State: AOAM5328SeA+x56GrMQs9DEV6X5NTtAnVxFGEKbpCieae/sq6CMkr2EG
 e9kDgmzzo0e89OWUwlxHsyWrZ8flLEY56f9+lQLXKEfLB2u4LGFz7fbXlMuRsFsZVCCIXGhB6jj
 Zz8TlQZUtX1ByKsY=
X-Received: by 2002:a1c:804a:: with SMTP id b71mr5079678wmd.141.1628607340645; 
 Tue, 10 Aug 2021 07:55:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/xrlBDCkUy2raPuWOpkf6Gqtokw8oxrxHAoO1H0VlOTsoc54YMhvnbaKrmH3m55EewsQh9Q==
X-Received: by 2002:a1c:804a:: with SMTP id b71mr5079651wmd.141.1628607340435; 
 Tue, 10 Aug 2021 07:55:40 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 h11sm3555834wmc.23.2021.08.10.07.55.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 07:55:39 -0700 (PDT)
Subject: Re: [PATCH v7 07/33] block/block-copy: introduce
 block_copy_set_copy_opts()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
 <20210804093813.20688-8-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <1cf5b03a-fe5f-a258-3fea-f5f3a3e5cfd9@redhat.com>
Date: Tue, 10 Aug 2021 16:55:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804093813.20688-8-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, mreitz@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.08.21 11:37, Vladimir Sementsov-Ogievskiy wrote:
> We'll need a possibility to set compress and use_copy_range options
> after initialization of the state. So make corresponding part of
> block_copy_state_new() separate and public.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/block/block-copy.h |  2 ++
>   block/block-copy.c         | 66 +++++++++++++++++++++-----------------
>   2 files changed, 39 insertions(+), 29 deletions(-)
>
> diff --git a/include/block/block-copy.h b/include/block/block-copy.h
> index 734389d32a..f0ba7bc828 100644
> --- a/include/block/block-copy.h
> +++ b/include/block/block-copy.h
> @@ -28,6 +28,8 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
>                                        int64_t cluster_size, bool use_copy_range,
>                                        bool compress, Error **errp);
>   
> +void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
> +                              bool compress);
>   void block_copy_set_progress_meter(BlockCopyState *s, ProgressMeter *pm);
>   
>   void block_copy_state_free(BlockCopyState *s);
> diff --git a/block/block-copy.c b/block/block-copy.c
> index 58b4345a5a..84c29fb233 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c
> @@ -315,21 +315,11 @@ static uint32_t block_copy_max_transfer(BdrvChild *source, BdrvChild *target)
>                                        target->bs->bl.max_transfer));
>   }
>   
> -BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
> -                                     int64_t cluster_size, bool use_copy_range,
> -                                     bool compress, Error **errp)
> +/* Function should be called prior any actual copy request */

Given this is something the caller should know, I’d prefer putting this 
into the block-copy.h header.

However, I realize we have a wild mix of this in qemu and often do put 
such information into the C source file, so...

> +void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
> +                              bool compress)
>   {
> -    BlockCopyState *s;
> -    BdrvDirtyBitmap *copy_bitmap;
>       bool is_fleecing;
> -
> -    copy_bitmap = bdrv_create_dirty_bitmap(source->bs, cluster_size, NULL,
> -                                           errp);
> -    if (!copy_bitmap) {
> -        return NULL;
> -    }
> -    bdrv_disable_dirty_bitmap(copy_bitmap);
> -
>       /*
>        * If source is in backing chain of target assume that target is going to be
>        * used for "image fleecing", i.e. it should represent a kind of snapshot of
> @@ -344,24 +334,12 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
>        * For more information see commit f8d59dfb40bb and test
>        * tests/qemu-iotests/222
>        */
> -    is_fleecing = bdrv_chain_contains(target->bs, source->bs);
> +    is_fleecing = bdrv_chain_contains(s->target->bs, s->source->bs);
>   
> -    s = g_new(BlockCopyState, 1);
> -    *s = (BlockCopyState) {
> -        .source = source,
> -        .target = target,
> -        .copy_bitmap = copy_bitmap,
> -        .cluster_size = cluster_size,
> -        .len = bdrv_dirty_bitmap_size(copy_bitmap),
> -        .write_flags = (is_fleecing ? BDRV_REQ_SERIALISING : 0) |
> -            (compress ? BDRV_REQ_WRITE_COMPRESSED : 0),
> -        .mem = shres_create(BLOCK_COPY_MAX_MEM),
> -        .max_transfer = QEMU_ALIGN_DOWN(
> -                                    block_copy_max_transfer(source, target),
> -                                    cluster_size),
> -    };
> +    s->write_flags = (is_fleecing ? BDRV_REQ_SERIALISING : 0) |
> +        (compress ? BDRV_REQ_WRITE_COMPRESSED : 0);

Shouldn’t we keep the is_fleecing check in block_copy_state_new()? We 
must perform it at least once, but there is no benefit in repeating it 
on every block_copy_set_copy_opts() call, right?

Hanna


