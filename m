Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9D158B7DD
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Aug 2022 21:04:37 +0200 (CEST)
Received: from localhost ([::1]:33226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKP6C-0004hM-Ku
	for lists+qemu-devel@lfdr.de; Sat, 06 Aug 2022 15:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oKP2O-000313-8R; Sat, 06 Aug 2022 15:00:41 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:39906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oKP2J-0004qs-2w; Sat, 06 Aug 2022 15:00:38 -0400
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id B009A2E0A4A;
 Sat,  6 Aug 2022 22:00:22 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:215::1:1d] (unknown
 [2a02:6b8:b081:215::1:1d])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 aEBtIOrFFK-0LPqxtcW; Sat, 06 Aug 2022 22:00:21 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1659812422; bh=PMs8X6E/NiTz/MfVE6Ubau4+lj5M2ayf+B4NzVV7oO4=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=Wb+Eby9mqK7BpKeH6thsSB6qRoix2Sf/wI/xgdwTnJ5Rlm3zH0LRjFwb29rkO6z8v
 neeU3ee0Bxh+KCtXKGwRHA6/AevLbyP+WnK+JzPrExhdftRqA512f7v1bhBDyKtWLz
 r9WVpTvFaqoqviGC3mRVHmKaWfft9HPc6ztq0J/8=
Authentication-Results: sas1-c73b4b4f4b95.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <60e87038-a4bd-e723-3626-7daeb256e148@yandex-team.ru>
Date: Sat, 6 Aug 2022 22:00:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/3] parallels: Put the image checks in separate
 functions
Content-Language: en-US
To: alexander.ivanov@virtuozzo.com, qemu-devel@nongnu.org
Cc: den@virtuozzo.com, natalia.kuzmina@openvz.org, stefanha@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org
References: <20220805154752.799395-1-alexander.ivanov@virtuozzo.com>
 <20220805154752.799395-2-alexander.ivanov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220805154752.799395-2-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/5/22 18:47, alexander.ivanov@virtuozzo.com wrote:
> From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>

A bit strange to see this. Is your name set up correctly in ~/.gitconfig ?

> 
> We will add more and more checks of images so we need to reorganize the code.
> Put each check to a separate helper function with a separate loop.
> Add two helpers: truncate_file() and sync_header(). They will be used
> in multiple functions.

It would be a lot simpler to review if you split out one check_ function per patch :)

> 
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---

[..]

> -            /*
> -             * In order to really repair the image, we must shrink it.
> -             * That means we have to pass exact=true.
> -             */
> -            ret = bdrv_truncate(bs->file, res->image_end_offset, true,
> -                                PREALLOC_MODE_OFF, 0, &local_err);
> +            ret = truncate_file(bs, res->image_end_offset);
>               if (ret < 0) {
> -                error_report_err(local_err);
> -                res->check_errors++;

Why you remove check_errors++ ? It's an error of truncate_file counted.
With it kept here:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

> -                goto out;
> +                return ret;
>               }
>               res->leaks_fixed += count;
>           }

[..]

> +static int coroutine_fn parallels_co_check(BlockDriverState *bs,
> +                                           BdrvCheckResult *res,
> +                                           BdrvCheckMode fix)
> +{
> +    BDRVParallelsState *s = bs->opaque;
> +    int ret;
> +
> +    qemu_co_mutex_lock(&s->lock);

If touch this anyway, I'd move to QEMU_LOCK_GUARD().

> +
> +    check_unclean(bs, res, fix);
> +
> +    ret = check_cluster_outside_image(bs, res, fix);
> +    if (ret != 0) {
> +        goto out;
> +    }
> +
> +    check_fragmentation(bs, res, fix);
> +
> +    ret = check_leak(bs, res, fix);
> +    if (ret != 0) {
> +        goto out;
> +    }
> +
> +    collect_statistics(bs, res);

probably, chack_fragmentation() should be part of collect_statistics() (called from it, or just merged into same loop, as it fills same res->bfi)

Also while reviewing I noted that when FIX_ERRORS is not enabled we count broken clusters (with off > size) as allocated, and also they participate in fragmentation statistics. That's preexisting still..


-- 
Best regards,
Vladimir

