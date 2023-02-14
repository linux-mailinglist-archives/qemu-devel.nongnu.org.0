Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FFB696BF7
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 18:45:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRzMK-000591-6C; Tue, 14 Feb 2023 12:44:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRzMH-00058T-7w; Tue, 14 Feb 2023 12:44:49 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRzME-0006tm-6A; Tue, 14 Feb 2023 12:44:48 -0500
Received: from myt6-23a5e62c0090.qloud-c.yandex.net
 (myt6-23a5e62c0090.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1da3:0:640:23a5:e62c])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 5A4305FE6D;
 Tue, 14 Feb 2023 20:44:34 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b433::1:3c] (unknown
 [2a02:6b8:b081:b433::1:3c])
 by myt6-23a5e62c0090.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 XingG20RZmI1-csqgVjwF; Tue, 14 Feb 2023 20:44:33 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676396673; bh=OJhAjJ+syA1FOcvjDdzJoeei35NELkKRDeyfi4UBN20=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=bqyNLaX+UvfQr+3KILfI/kAYXsjHyAamC7gtSQHxXzX/5+pOLIeizXQ+gYxm7rHGf
 kjBctVKaxWf0Z5Ep82nPawmV/oqDNRqy6DfX5BnoTco4mic7kNLjHIW4/42zPi18DG
 DJdTBjjcvOzRpZFeFVNaIZRnxeerjneNxKaXwP8M=
Authentication-Results: myt6-23a5e62c0090.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <7b45258d-e046-373e-6434-2ae5bd7c2aa5@yandex-team.ru>
Date: Tue, 14 Feb 2023 20:44:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v10 01/12] parallels: Out of image offset in BAT leads to
 image inflation
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com
References: <20230203091854.2221397-1-alexander.ivanov@virtuozzo.com>
 <20230203091854.2221397-2-alexander.ivanov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230203091854.2221397-2-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 03.02.23 12:18, Alexander Ivanov wrote:
> data_end field in BDRVParallelsState is set to the biggest offset present
> in BAT. If this offset is outside of the image, any further write will
> create the cluster at this offset and/or the image will be truncated to
> this offset on close. This is definitely not correct.
> 
> Raise an error in parallels_open() if data_end points outside the image
> and it is not a check (let the check to repaire the image). Set data_end
> to the end of the cluster with the last correct offset.
> 
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> Reviewed-by: Denis V. Lunev <den@openvz.org>
> ---
>   block/parallels.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/block/parallels.c b/block/parallels.c
> index bbea2f2221..4af68adc61 100644
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
> @@ -741,6 +742,12 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>           return ret;
>       }
>   
> +    file_size = bdrv_getlength(bs->file->bs);
> +    if (file_size < 0) {
> +        return -EINVAL;
> +    }
> +    file_size >>= BDRV_SECTOR_BITS;

if file size somehow not aligned to BDRV_SECTOR_SIZE, that's not correct, DIV_ROUND_UP would be better

> +
>       ret = bdrv_pread(bs->file, 0, sizeof(ph), &ph, 0);
>       if (ret < 0) {
>           goto fail;
> @@ -805,6 +812,16 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>   
>       for (i = 0; i < s->bat_size; i++) {
>           int64_t off = bat2sect(s, i);
> +        if (off >= file_size) {
> +            if (flags & BDRV_O_CHECK) {
> +                continue;
> +            }
> +            error_setg(errp, "parallels: Offset %" PRIi64 " in BAT[%d] entry "
> +                       "is larger than file size (%" PRIi64 ")",
> +                       off, i, file_size);

offsets in sectors rather than in bytes may be a bit misleading

> +            ret = -EINVAL;
> +            goto fail;
> +        }
>           if (off >= s->data_end) {
>               s->data_end = off + s->tracks;
>           }

-- 
Best regards,
Vladimir


