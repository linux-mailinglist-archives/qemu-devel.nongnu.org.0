Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BF1597664
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 21:23:33 +0200 (CEST)
Received: from localhost ([::1]:53266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOOdY-000773-Ii
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 15:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oOOc4-0005S4-CZ; Wed, 17 Aug 2022 15:22:00 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:53004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oOOc0-00035u-HM; Wed, 17 Aug 2022 15:21:58 -0400
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 53A672E1F18;
 Wed, 17 Aug 2022 22:21:41 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b4a5::1:13] (unknown
 [2a02:6b8:b081:b4a5::1:13])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 xh0cLVJYDn-LdP4DkUW; Wed, 17 Aug 2022 22:21:40 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1660764100; bh=vqxcVkCp7D7ovPQwsK+VlQSXgM5MeDYrcMQfBO1YsX0=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=X0qo0HqdoN/COQuna2EywBRCI0ong4X2vhWcFA1AkRjaRn9HzKuw6pxjArDDdq+hz
 mFLXaqQ2Y+hALOMfBuWqhgGz/4vYri3TDcceTZsB9sM3xKju9wYz5flHHRobMLmfAP
 hL7R3h80kgiyprmKVvLAaYPBuAn7PBIJLBfB0IyY=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <c35ccd2f-ac15-c5dc-e817-a81e86ebddac@yandex-team.ru>
Date: Wed, 17 Aug 2022 22:21:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 2/8] parallels: create parallels_set_bat_entry_helper()
 to assign BAT value
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220815090216.1818622-1-alexander.ivanov@virtuozzo.com>
 <20220815090216.1818622-3-alexander.ivanov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220815090216.1818622-3-alexander.ivanov@virtuozzo.com>
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
> This helper will be reused in next patches during parallels_co_check
> rework to simplify its code.
> 
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

> ---
> v2: A new patch - a part of a splitted patch.
> v3: Fix commit message.
> 
>   block/parallels.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/block/parallels.c b/block/parallels.c
> index a76cf9d993..7f68f3cbc9 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -165,6 +165,13 @@ static int64_t block_status(BDRVParallelsState *s, int64_t sector_num,
>       return start_off;
>   }
>   
> +static void parallels_set_bat_entry(BDRVParallelsState *s,
> +                                    uint32_t index, uint32_t offset)

Rather unobvious that offset should be passed already converted to LE. Worth a comment? Or may be do convertion inside function (depends on further usages of the helper)

> +{
> +    s->bat_bitmap[index] = offset;
> +    bitmap_set(s->bat_dirty_bmap, bat_entry_off(index) / s->bat_dirty_block, 1);
> +}
> +
>   static int64_t allocate_clusters(BlockDriverState *bs, int64_t sector_num,
>                                    int nb_sectors, int *pnum)
>   {
> @@ -250,10 +257,9 @@ static int64_t allocate_clusters(BlockDriverState *bs, int64_t sector_num,
>       }
>   
>       for (i = 0; i < to_allocate; i++) {
> -        s->bat_bitmap[idx + i] = cpu_to_le32(s->data_end / s->off_multiplier);
> +        parallels_set_bat_entry(s, idx + i,
> +                                cpu_to_le32(s->data_end / s->off_multiplier));
>           s->data_end += s->tracks;
> -        bitmap_set(s->bat_dirty_bmap,
> -                   bat_entry_off(idx + i) / s->bat_dirty_block, 1);
>       }
>   
>       return bat2sect(s, idx) + sector_num % s->tracks;


-- 
Best regards,
Vladimir

