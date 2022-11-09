Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3078E623095
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 17:55:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osoKO-0004BQ-2f; Wed, 09 Nov 2022 11:53:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osoKL-0004AT-4r; Wed, 09 Nov 2022 11:53:25 -0500
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osoK7-0005Aw-24; Wed, 09 Nov 2022 11:53:24 -0500
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 64652601C5;
 Wed,  9 Nov 2022 19:52:49 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b535::1:28] (unknown
 [2a02:6b8:b081:b535::1:28])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 lZXzPNf7hK-qmNO3sTF; Wed, 09 Nov 2022 19:52:48 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1668012768; bh=pTlI4CTGO199/YfAiebuEfAixvfcJYREZnNNPxlyr00=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=JzIARulAljLnnCis5xzuLAQxiaP3WD9wOMP7zpCCirFuGHRn1MsD2z82hDUPAABRe
 5x8PKqCNKu1ev9e0XG/k07X8HfwIyd4zlv8u9J/7z9TNkKuarrdGjPdULpm6Km4Cpf
 tls+sAPtbl3SuKlujblmPfPK5rbN36pHhXRXYFkM=
Authentication-Results: vla1-81430ab5870b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <f44e394a-e447-dae1-5ee8-c5b1a34f6db8@yandex-team.ru>
Date: Wed, 9 Nov 2022 19:52:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 08/13] stream: Replace subtree drain with a single node
 drain
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com, hreitz@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-9-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221108123738.530873-9-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.72;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
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

On 11/8/22 15:37, Kevin Wolf wrote:
> The subtree drain was introduced in commit b1e1af394d9 as a way to avoid
> graph changes between finding the base node and changing the block graph
> as necessary on completion of the image streaming job.
> 
> The block graph could change between these two points because
> bdrv_set_backing_hd() first drains the parent node, which involved
> polling and can do anything.
> 
> Subtree draining was an imperfect way to make this less likely (because
> with it, fewer callbacks are called during this window). Everyone agreed
> that it's not really the right solution, and it was only committed as a
> stopgap solution.
> 
> This replaces the subtree drain with a solution that simply drains the
> parent node before we try to find the base node, and then call a version
> of bdrv_set_backing_hd() that doesn't drain, but just asserts that the
> parent node is already drained.
> 
> This way, any graph changes caused by draining happen before we start
> looking at the graph and things stay consistent between finding the base
> node and changing the graph.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

[..]

>   
>       base = bdrv_filter_or_cow_bs(s->above_base);
> -    if (base) {
> -        bdrv_ref(base);
> -    }
> -
>       unfiltered_base = bdrv_skip_filters(base);
>   
>       if (bdrv_cow_child(unfiltered_bs)) {
> @@ -82,7 +85,7 @@ static int stream_prepare(Job *job)
>               }
>           }
>   
> -        bdrv_set_backing_hd(unfiltered_bs, base, &local_err);
> +        bdrv_set_backing_hd_drained(unfiltered_bs, base, &local_err);
>           ret = bdrv_change_backing_file(unfiltered_bs, base_id, base_fmt, false);

If we have yield points / polls during bdrv_set_backing_hd_drained() and bdrv_change_backing_file(), it's still bad and another graph-modifying operation may interleave. But b1e1af394d9 reports only polling in bdrv_set_backing_hd(), so I think it's OK to not care about other cases.

>           if (local_err) {
>               error_report_err(local_err);
> @@ -92,10 +95,7 @@ static int stream_prepare(Job *job)
>       }
>   
>   out:
> -    if (base) {
> -        bdrv_unref(base);
> -    }
> -    bdrv_subtree_drained_end(s->above_base);
> +    bdrv_drained_end(unfiltered_bs);
>       return ret;
>   }
>   

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir


