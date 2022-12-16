Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F04D564F05F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 18:27:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6ETm-00086N-Mc; Fri, 16 Dec 2022 12:26:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1p6ETc-00084E-32; Fri, 16 Dec 2022 12:26:29 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1p6ETZ-0007mu-Ac; Fri, 16 Dec 2022 12:26:26 -0500
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id C34A15F25C;
 Fri, 16 Dec 2022 20:26:16 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b58d::1:2b] (unknown
 [2a02:6b8:b081:b58d::1:2b])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 DQlYwF0OF4Y1-svqkD2FL; Fri, 16 Dec 2022 20:26:13 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1671211573; bh=VcijjulaQyQVM3GaU3LxTTEAM3kw4PF0FuT2ylo2APo=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=PjoERmOxRefWCAamjWVgRmaoqnkzFgKIPj/BWy1exs5JR8VHoktNzly9j5j1Cs2N0
 W19f0KmUnCnVPVPQDT3uut+oAw1ShMAGrye0Ac4DzJXT12YdqSxp/aA0/4xOh4T7Oj
 WnudLdQIdmO6geyb9Ql9sf8hNX+fOF8/JXRvxIpo=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <e1b71a62-bb94-28e4-14e1-3bdd63ee53b5@yandex-team.ru>
Date: Fri, 16 Dec 2022 20:26:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 07/14] block: use bdrv_co_refresh_total_sectors when
 possible
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: hreitz@redhat.com, eesposit@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org
References: <20221213085320.95673-1-kwolf@redhat.com>
 <20221213085320.95673-8-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221213085320.95673-8-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 12/13/22 11:53, Kevin Wolf wrote:
> From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> 
> In some places we are sure we are always running in a
> coroutine, therefore it's useless to call the generated_co_wrapper,
> instead call directly the _co_ function.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   block/block-backend.c | 6 +++---
>   block/copy-on-read.c  | 2 +-
>   block/io.c            | 4 ++--
>   3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 5b8da86772..5f6b269a79 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -1235,8 +1235,8 @@ void blk_set_disable_request_queuing(BlockBackend *blk, bool disable)
>       blk->disable_request_queuing = disable;
>   }
>   
> -static int blk_check_byte_request(BlockBackend *blk, int64_t offset,
> -                                  int64_t bytes)
> +static coroutine_fn int blk_check_byte_request(BlockBackend *blk,
> +                                               int64_t offset, int64_t bytes)
>   {
>       int64_t len;
>   
> @@ -1253,7 +1253,7 @@ static int blk_check_byte_request(BlockBackend *blk, int64_t offset,
>       }
>   
>       if (!blk->allow_write_beyond_eof) {
> -        len = bdrv_getlength(blk_bs(blk));
> +        len = bdrv_co_getlength(blk_bs(blk));
>           if (len < 0) {
>               return len;
>           }
> diff --git a/block/copy-on-read.c b/block/copy-on-read.c
> index 815ac1d835..74f7727a02 100644
> --- a/block/copy-on-read.c
> +++ b/block/copy-on-read.c
> @@ -122,7 +122,7 @@ static void cor_child_perm(BlockDriverState *bs, BdrvChild *c,
>   
>   static int64_t cor_getlength(BlockDriverState *bs)

obviously missed coroutine_fn, in 05

>   {
> -    return bdrv_getlength(bs->file->bs);
> +    return bdrv_co_getlength(bs->file->bs);
>   }
>   
>   
> diff --git a/block/io.c b/block/io.c
> index 3940026dc1..aef0929202 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -3434,7 +3434,7 @@ int coroutine_fn bdrv_co_truncate(BdrvChild *child, int64_t offset, bool exact,
>       if (new_bytes && backing) {
>           int64_t backing_len;
>   
> -        backing_len = bdrv_getlength(backing->bs);
> +        backing_len = bdrv_co_getlength(backing->bs);
>           if (backing_len < 0) {
>               ret = backing_len;
>               error_setg_errno(errp, -ret, "Could not get backing file size");
> @@ -3464,7 +3464,7 @@ int coroutine_fn bdrv_co_truncate(BdrvChild *child, int64_t offset, bool exact,
>           goto out;
>       }
>   
> -    ret = bdrv_refresh_total_sectors(bs, offset >> BDRV_SECTOR_BITS);
> +    ret = bdrv_co_refresh_total_sectors(bs, offset >> BDRV_SECTOR_BITS);
>       if (ret < 0) {
>           error_setg_errno(errp, -ret, "Could not refresh total sector count");
>       } else {

-- 
Best regards,
Vladimir


