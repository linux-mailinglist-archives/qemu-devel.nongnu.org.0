Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3300559764E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 21:15:06 +0200 (CEST)
Received: from localhost ([::1]:37108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOOVM-0003yG-T1
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 15:15:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oOOTp-0002R7-MK; Wed, 17 Aug 2022 15:13:29 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:47658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oOOTh-0000Sb-I2; Wed, 17 Aug 2022 15:13:27 -0400
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id F3C912E0991;
 Wed, 17 Aug 2022 22:13:09 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b4a5::1:13] (unknown
 [2a02:6b8:b081:b4a5::1:13])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 YN6nLZXpp8-D8OWwk6u; Wed, 17 Aug 2022 22:13:09 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1660763589; bh=3JEls7RaB4DXnoZcQ/QC4WxzsFsNErPiZOTIPZib6Ss=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=DS3XgCQAPUZ5WgulJ+Cg4sJEHOU03GWy1p93dsUOJ1yz+WulSBvbAqwVWVQsntybh
 bqjeOC9ut0msbiwCanzZ2YIqlaG3500nZm/i9RoHfHDT1eq5gIZvywzVPkEK2uLDbj
 W36B6TTMqb4+1EbNly1LrsWvqjD0VjDutpSlb7aI=
Authentication-Results: sas1-7470331623bb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <f0f1cee6-1409-c94e-d9c1-68cb4c848d0a@yandex-team.ru>
Date: Wed, 17 Aug 2022 22:13:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 1/8] parallels: Out of image offset in BAT leads to
 image inflation
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220815090216.1818622-1-alexander.ivanov@virtuozzo.com>
 <20220815090216.1818622-2-alexander.ivanov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220815090216.1818622-2-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/15/22 12:02, Alexander Ivanov wrote:
> data_end field in BDRVParallelsState is set to the biggest offset present
> in BAT. If this offset is outside of the image, any further write will create
> the cluster at this offset and/or the image will be truncated to this
> offset on close. This is definitely not correct and should be fixed.
> 
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
> v2: No change.
> v3: Fix commit message.
> 
>   block/parallels.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/block/parallels.c b/block/parallels.c
> index a229c06f25..a76cf9d993 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -732,6 +732,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>       BDRVParallelsState *s = bs->opaque;
>       ParallelsHeader ph;
>       int ret, size, i;
> +    int64_t file_size;
>       QemuOpts *opts = NULL;
>       Error *local_err = NULL;
>       char *buf;
> @@ -811,6 +812,22 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>           }
>       }
>   
> +    file_size = bdrv_getlength(bs->file->bs);
> +    if (file_size < 0) {
> +        goto fail;
> +    }
> +
> +    file_size >>= BDRV_SECTOR_BITS;
> +    if (s->data_end > file_size) {
> +        if (flags & BDRV_O_CHECK) {
> +            s->data_end = file_size;

Hm. but with this, any further allocation may lead to twice-allocted clusters, as you just modify s->data_end, but havn't yet fixed the BAT entry.. It seems unsafe. Or what I miss?

> +        } else {
> +            error_setg(errp, "parallels: Offset in BAT is out of image");
> +            ret = -EINVAL;
> +            goto fail;
> +        }
> +    }
> +
>       if (le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
>           /* Image was not closed correctly. The check is mandatory */
>           s->header_unclean = true;


-- 
Best regards,
Vladimir

