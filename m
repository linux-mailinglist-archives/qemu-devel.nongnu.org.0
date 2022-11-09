Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DDE622F8F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 17:01:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osnVc-0005Eg-PK; Wed, 09 Nov 2022 11:01:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osnVW-0005BI-Kk; Wed, 09 Nov 2022 11:00:54 -0500
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osnUy-000105-3q; Wed, 09 Nov 2022 11:00:42 -0500
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 4041B5FE15;
 Wed,  9 Nov 2022 19:00:07 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b535::1:28] (unknown
 [2a02:6b8:b081:b535::1:28])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 yE8uhp2k2d-06N0YxUX; Wed, 09 Nov 2022 19:00:06 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1668009606; bh=bR5MYyNL+Nz5KTJ9lJ3v9vIY+Uyc/Zi97McAR79fjyY=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=ozOEwR9AvgcSnTbPU23iEK+tDbXeS2BOAe51O2s6EzeA+0pFbzmiI+NZgVTH+0m8Q
 0a6J7Nz7F81Pr0qN80GlU8elkdS7fXtsdlh1KMAvZnKFk56VRZIA07M7HEFdlXooPa
 3PR4b9lNVXHuduvo0c9lKACeb27n1LRkPeXEa3Ck=
Authentication-Results: vla1-81430ab5870b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <18167aa9-e9e6-ea2c-ad96-68a7c972a371@yandex-team.ru>
Date: Wed, 9 Nov 2022 19:00:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 06/13] block: Drain invidual nodes during reopen
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com, hreitz@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-7-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221108123738.530873-7-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.72;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

In subject: individual

On 11/8/22 15:37, Kevin Wolf wrote:
> bdrv_reopen() and friends use subtree drains as a lazy way of covering
> all the nodes they touch. Turns out that this lazy way is a lot more
> complicated than just draining the nodes individually, even not
> accounting for the additional complexity in the drain mechanism itself.
> 
> Simplify the code by switching to draining the individual nodes that are
> already managed in the BlockReopenQueue anyway.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   block.c             | 11 ++++-------
>   block/replication.c |  6 ------
>   blockdev.c          | 13 -------------
>   3 files changed, 4 insertions(+), 26 deletions(-)
> 

[..]

>       bdrv_reopen_queue_free(queue);
> -    for (p = drained; p; p = p->next) {
> -        BlockDriverState *bs = p->data;
> -        AioContext *ctx = bdrv_get_aio_context(bs);
> -
> -        aio_context_acquire(ctx);

In bdrv_reopen_queue_free() we don't have this acquire()/release() pair around bdrv_drained_end(). We don't need it anymore?

> -        bdrv_subtree_drained_end(bs);
> -        aio_context_release(ctx);
> -    }
> -    g_slist_free(drained);
>   }
>   
>   void qmp_blockdev_del(const char *node_name, Error **errp)

-- 
Best regards,
Vladimir


