Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE3C54034D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 18:03:02 +0200 (CEST)
Received: from localhost ([::1]:35208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nybfY-0000z0-KL
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 12:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nybYL-0006VM-Qr
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 11:55:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nybYI-0002Vb-8c
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 11:55:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654617329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Liq5FNiSyh5gm9NzmDC4C72Uxbs+Ar6WV7dzIXyCMuI=;
 b=cNYZsOO2m5E3br/wpGzVK2qkDmYdGI/0k5mJCfQfvv13uWChj+b44g6bVT5uk3klQo05a5
 kJWZROXxTZfSAhEwzf/5ODTHDGj/l7/kyeoft2hCxk9v5OiGwp4e3z3okcu57FxN/Mvaw6
 UhEuhWlpHxLYUSlrGE82btOrtUWWB1I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351-h79US_uEPmmIJ6Vy90PU_g-1; Tue, 07 Jun 2022 11:55:28 -0400
X-MC-Unique: h79US_uEPmmIJ6Vy90PU_g-1
Received: by mail-wr1-f72.google.com with SMTP id
 y2-20020adff142000000b0021581245fa1so2913383wro.7
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 08:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Liq5FNiSyh5gm9NzmDC4C72Uxbs+Ar6WV7dzIXyCMuI=;
 b=1gRYrap8rfeFqdH8Qrfk4NJ5EIysvL98e7tMwD8+rauhM2b6lI50o69lgsK+w095eg
 j381QWLaAqBOGyW+SquTTM0ZRyrPsUFwsW5A//UibIL/jKVuhCeVhmWgYvanN1TGGJ4T
 /bWp8Zn+NNjXRkKwcBX5jVuF/deUKPoRV5uFB7rk3ATsjFpdkB4qDJ7929de0RinVwRo
 4DJodwLnYUUQG+/M9GQa583OkEmgbyjrRESmxG4F/G//K1dDzeKN+oxioqKmziFyY4de
 Wb1Ab3TnFJop7z5NfzItSLq95JDdQzEDWkLBF5Qoi2V3hTgPG0cLH0JB2uk5bDjlKUWq
 oqIA==
X-Gm-Message-State: AOAM532cnpzx6lKCSZJIX1LEiM+AacQNQ6SgSNatwftjxX/gPRkvIpQ2
 FE3JBf4oN+pWnpgKDStQkEeYrxaDFKSHrGrycOlXW/V1SN66bCfdv2S7dk/H92qEiertUCRZbz1
 0/cjNfu3uhu5UuRQ=
X-Received: by 2002:a05:600c:2194:b0:39c:419c:1a24 with SMTP id
 e20-20020a05600c219400b0039c419c1a24mr22326761wme.186.1654617326578; 
 Tue, 07 Jun 2022 08:55:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJww0CXVQGjMt26ZAudCfv3Ose3/g6bvZKJLm1M0kJUlRi7yQS+UA55kYDRm2wmy79pqCo6dYg==
X-Received: by 2002:a05:600c:2194:b0:39c:419c:1a24 with SMTP id
 e20-20020a05600c219400b0039c419c1a24mr22326711wme.186.1654617326098; 
 Tue, 07 Jun 2022 08:55:26 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 be5-20020a05600c1e8500b003942a244ee6sm20995476wmb.43.2022.06.07.08.55.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 08:55:25 -0700 (PDT)
Message-ID: <7a406052-6b47-982e-3480-6aac9a8393bc@redhat.com>
Date: Tue, 7 Jun 2022 17:55:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 13/45] block: Manipulate bs->file / bs->backing
 pointers in .attach/.detach
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru
References: <20220330212902.590099-1-vsementsov@openvz.org>
 <20220330212902.590099-14-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220330212902.590099-14-vsementsov@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 30.03.22 23:28, Vladimir Sementsov-Ogievskiy wrote:
> bs->file and bs->backing are a kind of duplication of part of
> bs->children. But very useful diplication, so let's not drop them at
> all:)
>
> We should manage bs->file and bs->backing in same place, where we
> manage bs->children, to keep them in sync.
>
> Moreover, generic io paths are unprepared to BdrvChild without a bs, so
> it's double good to clear bs->file / bs->backing when we detach the
> child.

I think this was reproducible (rarely) with 030, but I can’t reproduce 
it now.  Oh well.

> Detach is simple: if we detach bs->file or bs->backing child, just
> set corresponding field to NULL.
>
> Attach is a bit more complicated. But we still can precisely detect
> should we set one of bs->file / bs->backing or not:
>
> - if role is BDRV_CHILD_COW, we definitely deal with bs->backing
> - else, if role is BDRV_CHILD_FILTERED (it must be also
>    BDRV_CHILD_PRIMARY), it's a filtered child. Use
>    bs->drv->filtered_child_is_backing to chose the pointer field to
>    modify.
> - else, if role is BDRV_CHILD_PRIMARY, we deal with bs->file
> - in all other cases, it's neither bs->backing nor bs->file. It's some
>    other child and we shouldn't care

Sounds correct.

> OK. This change brings one more good thing: we can (and should) get rid
> of all indirect pointers in the block-graph-change transactions:
>
> bdrv_attach_child_common() stores BdrvChild** into transaction to clear
> it on abort.
>
> bdrv_attach_child_common() has two callers: bdrv_attach_child_noperm()
> just pass-through this feature, bdrv_root_attach_child() doesn't need
> the feature.
>
> Look at bdrv_attach_child_noperm() callers:
>    - bdrv_attach_child() doesn't need the feature
>    - bdrv_set_file_or_backing_noperm() uses the feature to manage
>      bs->file and bs->backing, we don't want it anymore
>    - bdrv_append() uses the feature to manage bs->backing, again we
>      don't want it anymore
>
> So, we should drop this stuff! Great!
>
> We still keep BdrvChild** argument to return the child and int return
> value, and not move to simply returning BdrvChild*, as we don't want to
> lose int return values.
>
> However we don't require *@child to be NULL anymore, and even allow
> @child to be NULL, if caller don't need the new child pointer.
>
> Finally, we now set .file / .backing automatically in generic code and
> want to restring setting them by hand outside of .attach/.detach.
> So, this patch cleanups all remaining places where they were set.
> To find such places I use:
>
>    git grep '\->file ='
>    git grep '\->backing ='
>    git grep '&.*\<backing\>'
>    git grep '&.*\<file\>'

Awesome.

block/snapshot-access.c needs a touchup, but other than that, this still 
seems to hold.

> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   block.c                          | 156 ++++++++++++++-----------------
>   block/raw-format.c               |   4 +-
>   block/snapshot.c                 |   1 -
>   include/block/block_int-common.h |  15 ++-
>   tests/unit/test-bdrv-drain.c     |  10 +-
>   5 files changed, 89 insertions(+), 97 deletions(-)
>
> diff --git a/block.c b/block.c
> index 8e8ed639fe..6b43e101a1 100644
> --- a/block.c
> +++ b/block.c
> @@ -1438,9 +1438,33 @@ static void bdrv_child_cb_attach(BdrvChild *child)
>   
>       assert_bdrv_graph_writable(bs);
>       QLIST_INSERT_HEAD(&bs->children, child, next);
> -
> -    if (child->role & BDRV_CHILD_COW) {
> +    if (bs->drv->is_filter | (child->role & BDRV_CHILD_FILTERED)) {

Should be `||`.

> +        /*
> +         * Here we handle filters and block/raw-format.c when it behave like
> +         * filter.

I’d like this comment to expand on how they are handled.

For example, that they generally have a single PRIMARY child, which is 
also the FILTERED child, and that they may have multiple more children, 
but none of them will be a COW child.  So bs->file will be the PRIMARY 
child, unless the PRIMARY child goes into bs->backing on exceptional 
cases; and bs->backing will be nothing else.  (Which is why we ignore 
all other children.)

> +         */
> +        assert(!(child->role & BDRV_CHILD_COW));
> +        if (child->role & (BDRV_CHILD_PRIMARY | BDRV_CHILD_FILTERED)) {

Why do we check for FILTERED here?  It appears to me that PRIMARY is the 
flag that tells us to put this child into bs->file (but for filters, 
sometimes we have to make an exception and put it into bs->backing).

Is the check for FILTERED just a safeguard, so that filter drivers 
always set the two in tandem?  If so, I’d make the condition just `role 
& PRIMARY` and then in an `else` path assert that `!(role & FILTERED)`.

> +            assert(child->role & BDRV_CHILD_PRIMARY);
> +            assert(child->role & BDRV_CHILD_FILTERED);
> +            assert(!bs->backing);
> +            assert(!bs->file);
> +
> +            if (bs->drv->filtered_child_is_backing) {
> +                bs->backing = child;
> +            } else {
> +                bs->file = child;
> +            }
> +        }

[...]

> @@ -2897,11 +2925,11 @@ static TransactionActionDrv bdrv_attach_child_common_drv = {
>   /*
>    * Common part of attaching bdrv child to bs or to blk or to job
>    *
> - * Resulting new child is returned through @child.
> - * At start *@child must be NULL.
> - * @child is saved to a new entry of @tran, so that *@child could be reverted to
> - * NULL on abort(). So referenced variable must live at least until transaction
> - * end.
> + * If @child is not NULL, it's set to new created child. Note, that @child
> + * pointer is stored in the transaction and therefore not cleared on abort.

I can’t quite parse this comment.  It doesn’t look like `child` is 
stored in the transaction.  I mean, `new_child` is, which is what 
`*child` is, but there’s a difference between `@child` and `*child` (or 
`*@child`) after all.

Or is there a “not” missing, i.e. “that the @child pointer is not stored 
in the transaction”?  That would also make more sense, why it isn’t 
cleared on abort.

I’d also like to ask for this to be even more clear, e.g. by adding a 
sentence “When this transaction is aborted, the pointer stored in 
*@child becomes invalid.”

> + * Consider @child as part of return value: we may change the return value of
> + * the function to BdrvChild* and return child directly, but this way we lose
> + * different return codes.

I mean, do we even care about return codes?  I hope not, but maybe we 
do?  We do have `errp` for a description, and I think the only 
distinction we make in the block layer based on error codes is ENOSPC 
vs. anything else.  I hope this function never returns ENOSPC, so I 
think the return value shouldn’t matter.

(I can understand that it seems like a loss if we can no longer decide 
between e.g. EINVAL and EPERM, but I don’t think it really is.  We could 
just make it EINVAL always and it shouldn’t matter.)

>    *
>    * Function doesn't update permissions, caller is responsible for this.
>    */


