Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA5964ECDC
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 15:28:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Bft-00072f-3O; Fri, 16 Dec 2022 09:26:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1p6Bfj-00071k-NR
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 09:26:47 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1p6Bfc-0000lF-Uw
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 09:26:47 -0500
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id BBAAF5F233;
 Fri, 16 Dec 2022 17:26:20 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b58d::1:2b] (unknown
 [2a02:6b8:b081:b58d::1:2b])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 JQi8d90QbmI1-aaIvw8x8; Fri, 16 Dec 2022 17:26:20 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1671200780; bh=UhU3jkNcK5S1DgyR3g2Ewx6AhFJxAn7roHt5JPSB/fw=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=nId/BWvYqajsN6nJOP3959D18txWdlWr0/crS4dXKwtYx5RL5iiaRwg7zRBu/tsly
 Q8wXAvHv2Vx7rRn+tbP/oetYbvVK1oZlDOJoh8/mKtXGRbSY/IMKjhQTaRVQ8o2YL9
 H13wzHn8ywo9r2C0dEZB7vW0sS1UWw+Odjwk8g0c=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <e1a3f722-2152-fa3d-1d5c-102da196482f@yandex-team.ru>
Date: Fri, 16 Dec 2022 17:26:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 02/14] block: Convert bdrv_io_plug() to co_wrapper
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: hreitz@redhat.com, eesposit@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org
References: <20221213085320.95673-1-kwolf@redhat.com>
 <20221213085320.95673-3-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221213085320.95673-3-kwolf@redhat.com>
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
> BlockDriver->bdrv_io_plug is categorized as IO callback, and it
> currently doesn't run in a coroutine. We should let it take a graph
> rdlock since the callback traverses the block nodes graph, which however
> is only possible in a coroutine.
> 
> The only caller of this function is blk_io_plug(), therefore make
> blk_io_plug() a co_wrapper, so that we're always running in a coroutine
> where the lock can be taken.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---

[..]

> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -729,7 +729,7 @@ struct BlockDriver {
>       void (*bdrv_debug_event)(BlockDriverState *bs, BlkdebugEvent event);
>   
>       /* io queue for linux-aio */
> -    void (*bdrv_io_plug)(BlockDriverState *bs);
> +    void coroutine_fn (*bdrv_io_plug)(BlockDriverState *bs);

don't we want to rename it to _co_ too?

anyway:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>



-- 
Best regards,
Vladimir


