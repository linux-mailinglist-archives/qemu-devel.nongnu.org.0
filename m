Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C777628DCA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:55:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouiil-0002Ab-33; Mon, 14 Nov 2022 18:18:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ouieK-0001df-UP
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oufyo-0006dq-RB
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 15:22:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668457357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zrzy9Q6nGtyAwefgV7meWKsTg6RtHgLzEKyrNdw+t/Q=;
 b=E/ZFMk2tzlCUF/uupo8WEnIrUGUJ1ibPYgLT+QeqrIJ0uzCQYeoDv1rz1ZKKSXbxWRFUz/
 /sSEJQcKAZRLV6IQ89o8rxKkLmNCJsB+PnqLuhANPH442OQC8fumWlpWIobzuSGYDUcZN4
 l4zZBDJt6gnqmDwu1SLFjtUa2HCbx6E=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-317-wllvrZovMxeRg2i7EKs-Aw-1; Mon, 14 Nov 2022 15:22:36 -0500
X-MC-Unique: wllvrZovMxeRg2i7EKs-Aw-1
Received: by mail-ed1-f71.google.com with SMTP id
 z15-20020a05640240cf00b00461b253c220so8771075edb.3
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 12:22:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zrzy9Q6nGtyAwefgV7meWKsTg6RtHgLzEKyrNdw+t/Q=;
 b=3ZXJ6vhbUNWFa3h5tch3fTyjBNcFgTFkf0YkALG2JVGTLdhgwvCJgHNLQGf2Cq84xt
 fxMLgvYnbLUXFe7KtQIsYUgjSAu5LW8Ye4IZEA6n1x5vo8U0LGPhxSuIg8V3qqpbrWOu
 D5h7Y/XVVB18Xl7Lsksaezps75ti6oaIePazMf1SWeqJedDPLasTCTf4wwE6L9zxTJ66
 1JgnmDyHxIKO12Jd5ax7V0ZaU05pTB1HiUWfvTSP4kaDU3YjOaC4J/3KC9zhgW2KDRpa
 MlVbFtgB/xCoc/018efnpKd5edsr0mu3U08JjBJUtobP8rpvu41ZYiCMGL9nW5CXdwnR
 8ZPQ==
X-Gm-Message-State: ANoB5pk34iJ4BQiT8yPT0Z7KPt0knmErg9gkL8r/P3oHs8bW6FK/ih6c
 eLGE940qXJ4AI7Av+BGaTIfeOzR/DK64K2yFODbmp5+CnMKx+GHIppRWhllFyxeGe71iYU5FX8+
 iFmDJZi11cnO9j18=
X-Received: by 2002:a05:6402:60a:b0:461:92bd:21cf with SMTP id
 n10-20020a056402060a00b0046192bd21cfmr11912628edv.405.1668457354744; 
 Mon, 14 Nov 2022 12:22:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4VCy9liyWRnbrbQXzory4cKFTz1Z24LkowCw69H1/4bFHinIweHjHzVyA2wfKnoyvIJzjBSA==
X-Received: by 2002:a05:6402:60a:b0:461:92bd:21cf with SMTP id
 n10-20020a056402060a00b0046192bd21cfmr11912602edv.405.1668457354284; 
 Mon, 14 Nov 2022 12:22:34 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a17090653c900b0078d957e65b6sm4578831ejo.23.2022.11.14.12.22.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 12:22:33 -0800 (PST)
Message-ID: <b998dc15-4c83-4f3a-c79e-edd78562ec3f@redhat.com>
Date: Mon, 14 Nov 2022 21:22:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 12/13] block: Don't poll in bdrv_replace_child_noperm()
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-13-kwolf@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20221108123738.530873-13-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 08.11.22 13:37, Kevin Wolf wrote:
> In order to make sure that bdrv_replace_child_noperm() doesn't have to
> poll any more, get rid of the bdrv_parent_drained_begin_single() call.
>
> This is possible now because we can require that the child is already
> drained when the function is called (it better be, having in-flight
> requests while modifying the graph isn't going to end well!) and we
> don't call the parent drain callbacks more than once.
>
> The additional drain calls needed in callers cause the test case to run
> its code in the drain handler too early (bdrv_attach_child() drains
> now), so modify it to only enable the code after the test setup has
> completed.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   include/block/block-io.h     |  8 ++++
>   block.c                      | 72 +++++++++++++++++++++++++-----------
>   block/io.c                   |  2 +-
>   tests/unit/test-bdrv-drain.c | 10 +++++
>   4 files changed, 70 insertions(+), 22 deletions(-)

I find this change complicated.  I understand it’s the point of the 
series, but I find it difficult to grasp.  But I guess there can be no 
drain series without such a patch.

As usual, I was very skeptical of the code at first, and over time 
slowly realized that I’m mostly confused by the comments, and the code 
seems fine.  Ah, well.

[...]

> diff --git a/block.c b/block.c
> index 5f5f79cd16..12039e9b8a 100644
> --- a/block.c
> +++ b/block.c

[...]

> @@ -2414,12 +2428,20 @@ static TransactionActionDrv bdrv_replace_child_drv = {
>    *
>    * Note: real unref of old_bs is done only on commit.
>    *
> + * Both child and new_bs (if non-NULL) must be drained. new_bs must be kept
> + * drained until the transaction is completed (this automatically implies that
> + * child remains drained, too).

I find “child” extremely ambiguous.  The problem is that there generally 
is no way to drain a BdrvChild object, is there?  You can only drain the 
BDS in it, which then drains the parent through the BdrvChild object.  
Historically, I don’t think there was ever a place where we cared about 
the BdrvChild object between the two to be drained, was there?  I mean, 
now there apparently is, in bdrv_child_attach_common(), but that’s a 
different story.

So the problem is that “draining a BdrvChild object” generally appears 
in the context of bdrv_parent_drained_*() functions, i.e. actually 
functions draining the parent.  Which makes it a bit confusing to refer 
to a BdrvChild object just as “child”.

I know that “child” here refers to the variable (or does it not?), but 
that is why I really prefer marking variables that are just plain 
English words, e.g. as @child or `child`, so it’s clear they are a name 
and not a noun.

In any case, because the concept is generally to drain the `child->bs` 
instead of the BdrvChild object directly, I understand the comment to 
mean: “Both the old child (`child->bs`) and `new_bs` (if non-NULL) must 
be drained.  `new_bs` must be kept drained until the transaction is 
completed.  This implies that the parent too will be kept drained until 
the transaction is completed by the BdrvChild object `child`.”

Or am I misunderstanding something, and the distinction between `child` 
and `child->bs` and the parent node is important here? (Would be good to 
know. :))

> + *
>    * The function doesn't update permissions, caller is responsible for this.
>    */
>   static void bdrv_replace_child_tran(BdrvChild *child, BlockDriverState *new_bs,
>                                       Transaction *tran)
>   {
>       BdrvReplaceChildState *s = g_new(BdrvReplaceChildState, 1);
> +
> +    assert(child->parent_quiesce_counter);
> +    assert(!new_bs || new_bs->quiesce_counter);
> +
>       *s = (BdrvReplaceChildState) {
>           .child = child,
>           .old_bs = child->bs,
> @@ -2818,6 +2840,12 @@ static void bdrv_replace_child_noperm(BdrvChild *child,

This function now has its callers fulfill kind of a complicated 
contract.  I would prefer that to be written out in a doc comment, 
especially because it sounds like the assertions can’t cover everything 
(i.e. callers that remove a child are required to have stopped issuing 
requests to that child, but they are free to do that in any way they 
want, so no assertion will check for it here).

>       int new_bs_quiesce_counter;
>   
>       assert(!child->frozen);
> +    /*
> +     * When removing the child, it's the callers responsibility to make sure
> +     * that no requests are in flight any more. Usually the parent is drained,
> +     * but not through child->parent_quiesce_counter.
> +     */

When I see a comment above an assertion, I immediately assume it is 
going to describe what the assertion checks.  Unless I’m 
misunderstanding something (again?), this comment actually describes 
what the assertion *does not* check.  I find that confusing, especially 
because the comment leads with “it’s the caller’s responsibility”, which 
to me implies “and that’s why we check it here in this assertion”, 
because assertions are there to verify that contracts are met.

The assertion verifies that the parent must be drained (through @child), 
unless the child is removed, which case isn’t covered by the assertion.  
That “isn’t covered” is then described by the comment, right?

I’d prefer the comment to lead with describing what the assertion does 
check, and then transitioning to “But in case the child is removed, we 
ignore that, and just note that it’s the caller’s responsibility to...”.

Also, the comment doesn’t explicitly say why we don’t check it in the 
assertion.  It says “usually” and “child->parent_quiesce_counter”, which 
implies “can’t get any information from child->parent_quiesce_counter, 
and regardless, callers can do what they want do achieve quiescing in 
regards to this child, so there’s nothing we can check”.  It feels like 
we can just say outright that there’s an informal contract that we can’t 
formally verify here, but callers naturally still must adhere to it.  It 
would be interesting to know (and note) why that is, though, i.e. why we 
can’t have parents be drained through the BdrvChild object for the child 
that is being removed.

I understand the intention behind the assertion to be: “We require the 
parent not to have in-flight requests to the BdrvChild object 
manipulated here.  In most cases, we verify that by requiring the parent 
be drained through this BdrvChild object.  However, when a child is 
being removed, we skip formal verification, because we leave callers 
free in deciding how to ensure that no requests are in flight.  Usually, 
they will still have the parent be drained (even if not through this 
BdrvChild object), but we don’t require that.”

I may well be wrong, but then it would be good for a comment to correct 
me. :)

(Interestingly, because bdrv_replace_child_noperm() no longer polls 
itself, it can’t know for sure that `child->parent_quiesce_counter > 0` 
means that there are no requests in flight.)

> +    assert(!new_bs || child->parent_quiesce_counter);
>       assert(old_bs != new_bs);
>       GLOBAL_STATE_CODE();

[...]

> @@ -2865,9 +2875,6 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
>       /*
>        * If the old child node was drained but the new one is not, allow

This now also covers the case where there was no old child node, but the 
parent was simply drained via an empty BdrvChild by the caller.

>        * requests to come in only after the new node has been attached.
> -     *
> -     * Update new_bs_quiesce_counter because bdrv_parent_drained_begin_single()
> -     * polls, which could have changed the value.
>        */
>       new_bs_quiesce_counter = (new_bs ? new_bs->quiesce_counter : 0);
>       if (!new_bs_quiesce_counter && child->parent_quiesce_counter) {
> @@ -3004,6 +3011,12 @@ static BdrvChild *bdrv_attach_child_common(BlockDriverState *child_bs,
>       }
>   
>       bdrv_ref(child_bs);
> +    /*
> +     * Let every new BdrvChild start drained, inserting it in the graph with
> +     * bdrv_replace_child_noperm() will undrain it if the child node is not
> +     * drained. The child was only just created, so polling is not necessary.

I feel like this is hiding some complexity.  Unless I missed something, 
draining a BdrvChild always meant draining the parent. But here, it 
absolutely does not mean that, and maybe that deserves a big warning sign?

Beginning a drain without poll means quiescing.  You assert that there 
can be no requests to the new child, which I agree on[1].  The 
combination of no new requests coming in, and no requests being there at 
this point is what being drained means.  So @new_child is indeed “drained”.

But the parent isn’t drained, because it isn’t polled.  There may still 
be requests in flight to its other children.  That’s really interesting, 
and I found it extremely confusing until I wrote ten paragraphs in reply 
here and scrapped most of them again.  Whenever I find this to be my 
reaction to something, I really wish for a detailed comment that 
explains the situation.

I would like the comment to:
- Expand on what “only just created” means.  As it’s written, that could 
mean relying on a race condition.  At which point would the parent be 
able to send requests?  (I assume either the .attach() in 
bdrv_replace_child_noperm(), or when this function returns, whichever 
comes first.  (The former always comes first.))
- Say in more detail that calling bdrv_parent_drained_begin_single() 
without polling will quiesce the parent, preventing new requests from 
appearing.
- Note that because there are no requests in flight, and because no new 
requests can then appear, the BdrvChild is drained.
- Note that the parent is only quiesced, not drained, and may still have 
requests in flight to other children, but naturally we don’t care about 
them.

I feel like the comment tries to hide all that complexity simply by 
avoiding the word “parent”.

[1] As far as I can piece together, no requests to the new child can 
have started yet, because this function creates the BdrvChild object, so 
before it is returned to the caller (or BdrvChildClass.attach() is 
called in bdrv_replace_child_noperm()), the block driver won’t generate 
requests to it.

Hanna

> +     */
> +    bdrv_parent_drained_begin_single(new_child, false);
>       bdrv_replace_child_noperm(new_child, child_bs);
>   
>       BdrvAttachChildCommonState *s = g_new(BdrvAttachChildCommonState, 1);


