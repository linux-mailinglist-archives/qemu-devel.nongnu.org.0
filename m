Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D8C57B840
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 16:12:34 +0200 (CEST)
Received: from localhost ([::1]:43816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEARF-0007yL-FU
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 10:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oEAOq-00060w-U4; Wed, 20 Jul 2022 10:10:04 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:43652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oEAOm-0000Zt-Ha; Wed, 20 Jul 2022 10:10:03 -0400
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 9B8082E1B1E;
 Wed, 20 Jul 2022 17:09:49 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b715::1:28] (unknown
 [2a02:6b8:b081:b715::1:28])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 ARTjNkUTKB-9mOCKu3B; Wed, 20 Jul 2022 14:09:48 +0000
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658326188; bh=6WdmO4COPwhyD61+tpJwSatINcbP+whrwvklsBejpUc=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=O90LhPMQavwniPqsypW1SejmjyoHUV1YvablShTewz2KR0H7WBx/Y9u8mYWFjSCFv
 HFgjE685bewS49rzG2iQ7loKHiLA9LC5/4YwM7cLPD8wJ1gmLlZD/aSodINR8tP7pP
 jzQtZ6YVDeIE+RVZFuQGpZKxZB/MSN1jjiUg4geI=
Authentication-Results: vla1-81430ab5870b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <c8b42a96-8a69-48d4-00cf-28e60363cd93@yandex-team.ru>
Date: Wed, 20 Jul 2022 17:09:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [RFC PATCH 3/8] RFC: block: use transactions as a replacement of
 ->{can_}set_aio_context()
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org
References: <20220712211911.1302836-1-eesposit@redhat.com>
 <20220712211911.1302836-4-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220712211911.1302836-4-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 7/13/22 00:19, Emanuele Giuseppe Esposito wrote:
> +/*
> + * @visited will accumulate all visited BdrvChild object. The caller is
> + * responsible for freeing the list afterwards.
> + */
> +bool bdrv_change_aio_context(BlockDriverState *bs, AioContext *ctx,
> +                             GSList **visited, Transaction *tran,
> +                             Error **errp)
> +{
> +    BdrvChild *c;
> +    BdrvStateSetAioContext *state;
> +
> +    GLOBAL_STATE_CODE();
> +
> +    if (bdrv_get_aio_context(bs) == ctx) {
> +        return true;
> +    }
> +
> +    QLIST_FOREACH(c, &bs->parents, next_parent) {
> +        if (!bdrv_parent_change_aio_context(c, ctx, visited, tran, errp)) {
> +            return false;
> +        }
> +    }
> +
> +    QLIST_FOREACH(c, &bs->children, next) {
> +        if (!bdrv_child_change_aio_context(c, ctx, visited, tran, errp)) {
> +            return false;
> +        }
> +    }
> +
> +    state = g_new(BdrvStateSetAioContext, 1);
> +    *state = (BdrvStateSetAioContext) {
> +        .new_ctx = ctx,
> +        .bs = bs,
> +    };
> +
> +    /* First half of transactions are drains */
> +    tran_add(tran, &drained_begin_end, state);
> +    /*
> +     * Second half of transactions takes care of setting the
> +     * AioContext and free the state
> +     */
> +    tran_add_tail(tran, &set_aio_context, state);
> +
> +    return true;
> +}


First, it looks like you want to use .commit() as .prepare(), .clean() as commit(), and .prepare() as something that just schedule other actions.

In block transaction any effect that is visible to other transaction actions should be done in .prepare(). (and .prepare is the main function of the action with *tran parameter, i.e. bdrv_change_aio_context() function is actually .prepare() phase).

So, ideally, the action:

  - does the complete thing in .prepare (i.e. in the main function of the action)
  - rollback it in .abort
  - nothing in .commit

Usually we still need a .commit phase for irreversible part of the action (like calling free() on the object). But that should be transparent for other actions.

So, generally we do:

tran = tran_new()

action_a(..., tran);
action_b(..., tran);
action_c(..., tran);


And we expect, that action_b() operates on top of action_a() already done. And action_c() operate on top of action_b() done. So we cannot postpone visible (to other actions) effect of the action to .commit phase.

So, for example, if you want a kind of smart drained section in transaction, you may add simple

bdrv_drain_tran(..., tran);

that just call drained_begin(), and have only .clean() handler that call drained_end(). This way you may do

bdrv_drain_tran(...., tran);
action_a(..., tran);
action_b(..., tran);

And be sure that both actions and all their .abort/.commit/.clean handlers are called inside drained seaction. Isn't it what you need?


Second, this all becomes extremely difficult when we mix transactions and recursion. When I moved permission system to transactions, I've introduced topological dfs search to just get a list of nodes to handle. I think, if we want to rework aio context change, we should first get rid of recursion.

-- 
Best regards,
Vladimir

