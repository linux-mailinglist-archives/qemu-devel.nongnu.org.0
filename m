Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E380C597710
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 21:51:58 +0200 (CEST)
Received: from localhost ([::1]:35440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOP52-0002m3-Lv
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 15:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oOP2J-0006p2-4C; Wed, 17 Aug 2022 15:49:08 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:40164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oOP26-0002Sg-VM; Wed, 17 Aug 2022 15:48:56 -0400
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 3A7B92E202F;
 Wed, 17 Aug 2022 22:48:46 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b4a5::1:13] (unknown
 [2a02:6b8:b081:b4a5::1:13])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 f7qQYPrfK0-miOWf4h4; Wed, 17 Aug 2022 22:48:45 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1660765725; bh=jN7hqOp3GQeHcU4Wp9Wkn5N7hnKCkldI1K0fPVGvOXo=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=Qwb/UdNhd75Sn1aGI7/lWU/9+qIpz1DjMwElNb5NH5rwZZhdJ4VZGWdEYKek9yJHb
 XAUuJcsn19VZCs1ivYLJm3G85DqBStETiEDIWkdReGBNecbK+BPzXjUBxMpjCLtfo1
 C6YnHfRnsNi556D/dA88apbaIzgvLKhudZ8O1B1U=
Authentication-Results: sas1-7470331623bb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <d9416fb0-d227-aecd-0dcc-047067360291@yandex-team.ru>
Date: Wed, 17 Aug 2022 22:48:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 3/8] parallels: Use generic infrastructure for BAT
 writing in parallels_co_check()
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220815090216.1818622-1-alexander.ivanov@virtuozzo.com>
 <20220815090216.1818622-4-alexander.ivanov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220815090216.1818622-4-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
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

On 8/15/22 12:02, Alexander Ivanov wrote:
> BAT is written in the context of conventional operations over
> the image inside bdrv_co_flush() when it calls
> parallels_co_flush_to_os() callback. Thus we should not
> modify BAT array directly, but call parallels_set_bat_entry()
> helper and bdrv_co_flush() further on. After that there is no
> need to manually write BAT and track its modification.
> 
> This makes code more generic and allows to split
> parallels_set_bat_entry() for independent pieces.
> 
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
> v2: Patch order was changed so the replacement is done in parallels_co_check.
>      Now we use a helper to set BAT entry and mark the block dirty.
> v3: Fix commit message.
> 
>   block/parallels.c | 19 +++++++------------
>   1 file changed, 7 insertions(+), 12 deletions(-)
> 
> diff --git a/block/parallels.c b/block/parallels.c
> index 7f68f3cbc9..6879ea4597 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -428,7 +428,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>       int64_t size, prev_off, high_off;
>       int ret;
>       uint32_t i;
> -    bool flush_bat = false;
>   
>       size = bdrv_getlength(bs->file->bs);
>       if (size < 0) {
> @@ -467,9 +466,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>               res->corruptions++;
>               if (fix & BDRV_FIX_ERRORS) {
>                   prev_off = 0;
> -                s->bat_bitmap[i] = 0;
> +                parallels_set_bat_entry(s, i, 0);
>                   res->corruptions_fixed++;
> -                flush_bat = true;
>                   continue;
>               }
>           }
> @@ -485,15 +483,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>           prev_off = off;
>       }
>   
> -    ret = 0;
> -    if (flush_bat) {
> -        ret = bdrv_co_pwrite_sync(bs->file, 0, s->header_size, s->header, 0);
> -        if (ret < 0) {
> -            res->check_errors++;
> -            goto out;
> -        }
> -    }
> -
>       res->image_end_offset = high_off + s->cluster_size;
>       if (size > res->image_end_offset) {
>           int64_t count;
> @@ -522,6 +511,12 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
>   
>   out:
>       qemu_co_mutex_unlock(&s->lock);
> +
> +    ret = bdrv_co_flush(bs);

Oops that's wrong. Here we probably rewrite previous error of bdrv_truncate stored in ret variable.

> +    if (ret < 0) {
> +        res->check_errors++;
> +    }
> +
>       return ret;
>   }
>   


-- 
Best regards,
Vladimir

