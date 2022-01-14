Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8423648EEFD
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 18:06:38 +0100 (CET)
Received: from localhost ([::1]:59600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Q28-00027v-U2
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 12:06:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n8Pur-0003Te-Kx
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 11:59:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n8Pum-0006Mz-6S
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 11:59:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642179536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pR5ARgnvCX6Urpan/xiCz+ppZrb4DyR5/8VyVvolQe4=;
 b=LsbqVAsGVdZ3LExLG99keF0ZTBXJHFuPz4kVbtENVbby9tcWV1yCVdALo1AlFujCugjGlt
 /9mr/ddc1TJ8sljbROuOnqR7N3fUcsC1JJKpfFDCewHTN61z8DYlDJMoqTdoe59pG2b5Dl
 UUEJ0JRlz1Tq9AJS1vbHhBNGgteoLCw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-mfBxLlL0N7mTyPuOq8ON7A-1; Fri, 14 Jan 2022 11:58:55 -0500
X-MC-Unique: mfBxLlL0N7mTyPuOq8ON7A-1
Received: by mail-wm1-f69.google.com with SMTP id
 l20-20020a05600c1d1400b003458e02cea0so8360314wms.7
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 08:58:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pR5ARgnvCX6Urpan/xiCz+ppZrb4DyR5/8VyVvolQe4=;
 b=J3cmYxw07b2HOfr53U1ID3EFGb4H3G5iXFZ+iMr+iyjz2c2OaaR1QH3NVM1CoAYRIz
 xqwR0qvOeHUBnA0w4wbkCZNVKbMrAeWtiDFu/KoGp3Qbv6C9oSVt3acaRR29q+cfbuki
 msFGhDK1Koy5+umvR9AEU4B6tDJos5yR64Xsc8SpmmWZtaQEEy6R9PcKOItM/xuDlIob
 Yt7Yl+t23int5x13HLyYK8fmP0m1t6MyU6hZufGbogLSF+Nrz71nw7BB4wC3aA5Yz0lK
 rW34UJM6i/BoUq0YD3aHXocnTb1yoMphTtA7Z6Qyny8Rfi4UTRIEX5r43m7kKsIC6wSp
 wzVw==
X-Gm-Message-State: AOAM53205gjXoB3mHNLFfSdg6w7xxZFeLQUQ9paM5YYYD1zHeKjqPksY
 HuucQQ31gsfvOUr5D40/zJ2LIdrIJbgKxsQWU0sgdi4TZx68A+OjdgDyu/IDIh01qa5qKCj0Wzl
 XFEnLux44xh2RWzE=
X-Received: by 2002:adf:fbc5:: with SMTP id d5mr8699537wrs.83.1642179534315;
 Fri, 14 Jan 2022 08:58:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1rkfetnGCoLiQwvh19pf6sPi2CcKrWyM50GK0KxKTxMydh1YR9G+TqE25LD+n2q4gnjf72Q==
X-Received: by 2002:adf:fbc5:: with SMTP id d5mr8699527wrs.83.1642179534174;
 Fri, 14 Jan 2022 08:58:54 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id q6sm6169368wrr.88.2022.01.14.08.58.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 08:58:53 -0800 (PST)
Message-ID: <f891b117-aa35-e660-15b5-2cf8ab7a8d3d@redhat.com>
Date: Fri, 14 Jan 2022 17:58:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 03/19] block/block-copy: block_copy_state_new(): add
 bitmap parameter
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211222174018.257550-1-vsementsov@virtuozzo.com>
 <20211222174018.257550-4-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211222174018.257550-4-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.12.21 18:40, Vladimir Sementsov-Ogievskiy wrote:
> This will be used in the following commit to bring "incremental" mode
> to copy-before-write filter.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/block/block-copy.h |  2 +-
>   block/block-copy.c         | 14 ++++++++++++--
>   block/copy-before-write.c  |  2 +-
>   3 files changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/include/block/block-copy.h b/include/block/block-copy.h
> index 99370fa38b..8da4cec1b6 100644
> --- a/include/block/block-copy.h
> +++ b/include/block/block-copy.h
> @@ -25,7 +25,7 @@ typedef struct BlockCopyState BlockCopyState;
>   typedef struct BlockCopyCallState BlockCopyCallState;
>   
>   BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
> -                                     Error **errp);
> +                                     BdrvDirtyBitmap *bitmap, Error **errp);
>   
>   /* Function should be called prior any actual copy request */
>   void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
> diff --git a/block/block-copy.c b/block/block-copy.c
> index abda7a80bd..f6345e3a4c 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c
> @@ -384,8 +384,9 @@ static int64_t block_copy_calculate_cluster_size(BlockDriverState *target,
>   }
>   
>   BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
> -                                     Error **errp)
> +                                     BdrvDirtyBitmap *bitmap, Error **errp)

Could be `const` to signal that we won’t be using this bitmap for the 
BCS, but given our inconsistent usage of `const`, it isn’t anything 
that’d be important.

>   {
> +    ERRP_GUARD();
>       BlockCopyState *s;
>       int64_t cluster_size;
>       BdrvDirtyBitmap *copy_bitmap;
> @@ -402,7 +403,16 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
>           return NULL;
>       }
>       bdrv_disable_dirty_bitmap(copy_bitmap);
> -    bdrv_set_dirty_bitmap(copy_bitmap, 0, bdrv_dirty_bitmap_size(copy_bitmap));
> +    if (bitmap) {
> +        if (!bdrv_merge_dirty_bitmap(copy_bitmap, bitmap, NULL, errp)) {
> +            error_prepend(errp, "Failed to merge bitmap '%s' to internal "
> +                          "copy-bitmap: ", bdrv_dirty_bitmap_name(bitmap));
> +            return NULL;

What might be Should we free `copy_bitmap` here?

(Apart from this, looks good to me!)

> +        }
> +    } else {
> +        bdrv_set_dirty_bitmap(copy_bitmap, 0,
> +                              bdrv_dirty_bitmap_size(copy_bitmap));
> +    }
>   
>       /*
>        * If source is in backing chain of target assume that target is going to be
> diff --git a/block/copy-before-write.c b/block/copy-before-write.c
> index 5bdaf0a9d9..799223e3fb 100644
> --- a/block/copy-before-write.c
> +++ b/block/copy-before-write.c
> @@ -170,7 +170,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
>               ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
>                bs->file->bs->supported_zero_flags);
>   
> -    s->bcs = block_copy_state_new(bs->file, s->target, errp);
> +    s->bcs = block_copy_state_new(bs->file, s->target, NULL, errp);
>       if (!s->bcs) {
>           error_prepend(errp, "Cannot create block-copy-state: ");
>           return -EINVAL;


