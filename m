Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9F857FB77
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 10:37:57 +0200 (CEST)
Received: from localhost ([::1]:51762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFtb9-0007wS-Re
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 04:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oFtZR-0006Rj-Jq
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 04:36:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oFtZN-0003kJ-81
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 04:36:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658738164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=owbknCUQXPLBnhWooxhE3MTlXCtMHLsCXZtfhOTscDc=;
 b=a9ouHEmW9p3EiNSeZ8Zau1ufXQZ2X+yCaUfHrj158h7c9T7kJwI/TOQCCo8r3z3WvbR1ZW
 Pj1scEkqAoN8TQmBEUSyqkBHmB1kd9kCDbLyLbt4fdo/fCyvrruq1+TLE47lQvFGnOyTyD
 /iAkzPj5vu5FR076108L3n2/kVKvthE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-2bY-4Jh5OraorG8TOQmFGA-1; Mon, 25 Jul 2022 04:36:02 -0400
X-MC-Unique: 2bY-4Jh5OraorG8TOQmFGA-1
Received: by mail-qv1-f71.google.com with SMTP id
 p13-20020ad45f4d000000b0044399a9bb4cso7170188qvg.15
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 01:36:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=owbknCUQXPLBnhWooxhE3MTlXCtMHLsCXZtfhOTscDc=;
 b=3VRIq+7phVJU2EiacSUZwSup4FZGb4uzrGt3GWABDK8DfJs2TcFEcYtEJXrK6uLxBi
 EsoFKYzTqmGR+5pQL1c9pUvYaseKXZ6jumwmAVXsA2IJpJ9TbKsHt6cHfdm7EN4Rl06R
 KeuqfT2CQf5TTS+qkZu9QrhIF2dNGIoMANcrN6SJuy/Ex+fwLRo6rU5aRZ+2RgT3EZWD
 NL+Wd6kiZQBDtGXmn9Q/RmamsqAzSz+v0VZqVoF/8MoZvtihZm7UuUAL8/qOXiyNGAuC
 WZVWdhMDARWNhkhQ30xSblVC9ytD5MQNKvH/83DtxvWXrb/c0UOKdP07SmTySFQXFc3B
 SpLg==
X-Gm-Message-State: AJIora/EjPLmUlYxnIHbI9iCLDBDwqV0MxVIMxHIvlZxRYXv6RtJJU7Q
 vF6X3cK4JA/Wua8mhD31hwJBfQlZsgfz7hGMJknsrLSz2Zopjpf5WKo/Z/y+ZgeQjk9T2ZgU3WM
 Mlln54CFC4x2yLXw=
X-Received: by 2002:a05:620a:4610:b0:6b5:eab2:8342 with SMTP id
 br16-20020a05620a461000b006b5eab28342mr8337695qkb.261.1658738162355; 
 Mon, 25 Jul 2022 01:36:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sPlLhJvEXsn7nZoNFJiOnHgocCZlAEgBbd/HqH0OtihcbviaRI5zsXI584vSC8aXI4S86nnw==
X-Received: by 2002:a05:620a:4610:b0:6b5:eab2:8342 with SMTP id
 br16-20020a05620a461000b006b5eab28342mr8337677qkb.261.1658738162101; 
 Mon, 25 Jul 2022 01:36:02 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a05620a12a800b006b5b7a8e6a2sm8016525qki.23.2022.07.25.01.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 01:36:01 -0700 (PDT)
Message-ID: <78a1a230-e5ca-5956-4462-b1efc8a4c61f@redhat.com>
Date: Mon, 25 Jul 2022 10:35:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 3/8] RFC: block: use transactions as a replacement of
 ->{can_}set_aio_context()
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org
References: <20220712211911.1302836-1-eesposit@redhat.com>
 <20220712211911.1302836-4-eesposit@redhat.com>
 <c8b42a96-8a69-48d4-00cf-28e60363cd93@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <c8b42a96-8a69-48d4-00cf-28e60363cd93@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



Am 20/07/2022 um 16:09 schrieb Vladimir Sementsov-Ogievskiy:
> On 7/13/22 00:19, Emanuele Giuseppe Esposito wrote:
>> +/*
>> + * @visited will accumulate all visited BdrvChild object. The caller is
>> + * responsible for freeing the list afterwards.
>> + */
>> +bool bdrv_change_aio_context(BlockDriverState *bs, AioContext *ctx,
>> +                             GSList **visited, Transaction *tran,
>> +                             Error **errp)
>> +{
>> +    BdrvChild *c;
>> +    BdrvStateSetAioContext *state;
>> +
>> +    GLOBAL_STATE_CODE();
>> +
>> +    if (bdrv_get_aio_context(bs) == ctx) {
>> +        return true;
>> +    }
>> +
>> +    QLIST_FOREACH(c, &bs->parents, next_parent) {
>> +        if (!bdrv_parent_change_aio_context(c, ctx, visited, tran,
>> errp)) {
>> +            return false;
>> +        }
>> +    }
>> +
>> +    QLIST_FOREACH(c, &bs->children, next) {
>> +        if (!bdrv_child_change_aio_context(c, ctx, visited, tran,
>> errp)) {
>> +            return false;
>> +        }
>> +    }
>> +
>> +    state = g_new(BdrvStateSetAioContext, 1);
>> +    *state = (BdrvStateSetAioContext) {
>> +        .new_ctx = ctx,
>> +        .bs = bs,
>> +    };
>> +
>> +    /* First half of transactions are drains */
>> +    tran_add(tran, &drained_begin_end, state);
>> +    /*
>> +     * Second half of transactions takes care of setting the
>> +     * AioContext and free the state
>> +     */
>> +    tran_add_tail(tran, &set_aio_context, state);
>> +
>> +    return true;
>> +}
> 
> 
> First, it looks like you want to use .commit() as .prepare(), .clean()
> as commit(), and .prepare() as something that just schedule other actions.
> 
> In block transaction any effect that is visible to other transaction
> actions should be done in .prepare(). (and .prepare is the main function
> of the action with *tran parameter, i.e. bdrv_change_aio_context()
> function is actually .prepare() phase).
> 
> So, ideally, the action:
> 
>  - does the complete thing in .prepare (i.e. in the main function of the
> action)
>  - rollback it in .abort
>  - nothing in .commit
> 
> Usually we still need a .commit phase for irreversible part of the
> action (like calling free() on the object). But that should be
> transparent for other actions.
> 
> So, generally we do:
> 
> tran = tran_new()
> 
> action_a(..., tran);
> action_b(..., tran);
> action_c(..., tran);
> 
> 
> And we expect, that action_b() operates on top of action_a() already
> done. And action_c() operate on top of action_b() done. So we cannot
> postpone visible (to other actions) effect of the action to .commit phase.
> 
> So, for example, if you want a kind of smart drained section in
> transaction, you may add simple
> 
> bdrv_drain_tran(..., tran);
> 
> that just call drained_begin(), and have only .clean() handler that call
> drained_end(). This way you may do
> 
> bdrv_drain_tran(...., tran);
> action_a(..., tran);
> action_b(..., tran);
> 
> And be sure that both actions and all their .abort/.commit/.clean
> handlers are called inside drained seaction. Isn't it what you need?

I understand how you see transactions, but I think we can also use them
in a different way than intended (with proper documentation).

I don't think it makes sense to use transactions as rollback in this
case, even though with the coming v2 it would be more similar to what
you propose:

.prepare takes care of drain and checking if the node is ok
.commit changes the aiocontext lock only if all nodes are drained and
passed the test
.clean undrains (drained end)

> 
> 
> Second, this all becomes extremely difficult when we mix transactions
> and recursion. When I moved permission system to transactions, I've
> introduced topological dfs search to just get a list of nodes to handle.
> I think, if we want to rework aio context change, we should first get
> rid of recursion.
> 

I honestly don't see how recursion complicates things. It's just graph
traversal, and building a list of things to do while doing that.

Isn't it much more complex to do it with a loop (ie not recursively?).
Your bdrv_topological_dfs is recursive too.

Think about it as 2 separate steps:
- Recursion takes care of checking the nodes and draining them
- Once done, if all nodes are ready to switch, switch linearly by
iterating in a list of callbacks

Anyways, I am probably not going to wait your feedback and send v2 just
because I think the way I did this double transaction list in v1
confuses people.

Feel free to continue the discussion here or in v2 directly, though.

Thank you,
Emanuele


