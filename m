Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3976390F6
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 22:11:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyfx6-0005qT-Mp; Fri, 25 Nov 2022 16:09:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oyfx4-0005qF-Hr; Fri, 25 Nov 2022 16:09:38 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oyfx1-0003Nc-IK; Fri, 25 Nov 2022 16:09:38 -0500
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 149915E988;
 Sat, 26 Nov 2022 00:09:23 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:16::1:7] (unknown [2a02:6b8:b081:16::1:7])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id L9UQV10OWW21-E6K0JRi9; Sat, 26 Nov 2022 00:09:22 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1669410562; bh=zkCeX7IcEXP0HyTDOHpvpzWEhthdYA0HEVMyJv4jpZA=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=SvI1hlMM81kf97fLWkYMBrLZ22gGDB1B/GYDu7eMLEmEizzb3PUR/bcSp6/kicbKt
 Sx/rKNhQnYJS872WJg6dE2yJ+oT0k3nIdy3wY3A+h7keWoMEveoLzDdwhKsUl249W3
 F334q98STjAqZJhfHEDn7Mgp0gELLUD9ZEs3qEOQ=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <45378cfa-0ab8-86a4-f408-d6443c777b5e@yandex-team.ru>
Date: Sat, 26 Nov 2022 00:09:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v6 14/14] block/dirty-bitmap: convert coroutine-only
 functions to co_wrapper
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20221125133518.418328-1-eesposit@redhat.com>
 <20221125133518.418328-15-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221125133518.418328-15-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.200;
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

On 11/25/22 16:35, Emanuele Giuseppe Esposito wrote:
> bdrv_can_store_new_dirty_bitmap and bdrv_remove_persistent_dirty_bitmap
> check if they are running in a coroutine, directly calling the
> coroutine callback if it's the case.
> Except that no coroutine calls such functions, therefore that check
> can be removed, and function creation can be offloaded to
> c_w.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

> ---
>   block/dirty-bitmap.c         | 88 +-----------------------------------
>   block/meson.build            |  1 +
>   include/block/block-common.h |  5 +-
>   include/block/block-io.h     | 10 +++-
>   include/block/dirty-bitmap.h | 10 +++-
>   5 files changed, 22 insertions(+), 92 deletions(-)
> 
> diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
> index bf3dc0512a..21cf592889 100644
> --- a/block/dirty-bitmap.c
> +++ b/block/dirty-bitmap.c

Please do

   git config diff.orderFile scripts/git.orderfile

so that .h files appear first.

> @@ -388,7 +388,7 @@ void bdrv_release_named_dirty_bitmaps(BlockDriverState *bs)
>    * not fail.
>    * This function doesn't release corresponding BdrvDirtyBitmap.
>    */
> -static int coroutine_fn
> +int coroutine_fn
>   bdrv_co_remove_persistent_dirty_bitmap(BlockDriverState *bs, const char *name,
>                                          Error **errp)
>   {

[..]

> --- a/include/block/block-common.h
> +++ b/include/block/block-common.h
> @@ -29,8 +29,6 @@
>   #include "qemu/iov.h"
>   #include "qemu/coroutine.h"
>   #include "block/accounting.h"
> -#include "block/dirty-bitmap.h"
> -#include "block/blockjob.h"
>   #include "qemu/hbitmap.h"
>   #include "qemu/transactions.h"
>   
> @@ -51,6 +49,9 @@
>   #define co_wrapper
>   #define co_wrapper_mixed
>   
> +#include "block/dirty-bitmap.h"
> +#include "block/blockjob.h"
> +

that's not good.. we have unclean dependency on include order and these wrapper definitions.

Actually that means that we want separate header file for co_wrapper and co_wrapper_mixed.. But OK, let's keep it as is for now, not hard to fix it later if really needed.


-- 
Best regards,
Vladimir


