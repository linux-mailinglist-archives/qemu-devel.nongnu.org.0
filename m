Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E40BC58AC78
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 16:44:06 +0200 (CEST)
Received: from localhost ([::1]:45070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJyYX-0000oS-KO
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 10:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oJyWQ-0006ec-6b; Fri, 05 Aug 2022 10:41:55 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:47396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oJyWL-00014v-Vn; Fri, 05 Aug 2022 10:41:53 -0400
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id B8A5C2E0941;
 Fri,  5 Aug 2022 17:41:38 +0300 (MSK)
Received: from [172.31.126.158] (172.31.126.158-vpn.dhcp.yndx.net
 [172.31.126.158])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 7sFKW4U3rE-fbPCCeeT; Fri, 05 Aug 2022 17:41:38 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1659710498; bh=dimhVo29YZlHkxy3GI+BmQ5jdeuZHMiP3HxOQQDt7LQ=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=xvlvdw2PS5iTMXobMdCSGnJUlIWE5VHKO9Zjxfg97kqNvQ0GsvYNemOf5CcSFDNuW
 EIItVvCtumJ77X2RT6joaI2Y08Orj8fAHzcxPdsmgEjjvKwLvU3g/DhJC5fmrPemUF
 UxSN7F7l5GaO5BMxeIAglmXXfpu8rGz7kZ4Cs8jw=
Authentication-Results: myt6-81d8ab6a9f9d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <4e644682-ca6d-c676-35e9-0a61beb4ed5a@yandex-team.ru>
Date: Fri, 5 Aug 2022 17:41:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 00/11] Refactor bdrv_try_set_aio_context using
 transactions
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20220725122120.309236-1-eesposit@redhat.com>
 <b3eb6174-5fd5-f7f9-512c-4cdb46e62502@yandex-team.ru>
 <0b3872fa-830a-f657-76be-2fbae055dffa@redhat.com>
 <62dbc13f-8510-9571-e457-95c3d167d9e5@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <62dbc13f-8510-9571-e457-95c3d167d9e5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
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

On 8/5/22 16:36, Emanuele Giuseppe Esposito wrote:
> 
> 
> Am 05/08/2022 um 15:22 schrieb Emanuele Giuseppe Esposito:
>>
>>
>> Am 27/07/2022 um 18:13 schrieb Vladimir Sementsov-Ogievskiy:
>>> On 7/25/22 15:21, Emanuele Giuseppe Esposito wrote:
>>>> The aim of this series is to reorganize bdrv_try_set_aio_context
>>>> and drop BDS ->set_aio_context and ->can_set_aio_ctx callbacks in
>>>> favour of a new one, ->change_aio_ctx.
>>>>
>>>> More informations in patch 3 (which is also RFC, due to the doubts
>>>> I have with AioContext locks).
>>>>
>>>> Patch 1 just add assertions in the code, 2 extends the transactions
>>>> API to be able to add also transactions in the tail
>>>> of the list.
>>>> Patch 3 is the core of this series, and introduces the new callback.
>>>> It is marked as RFC and the reason is explained in the commit message.
>>>> Patches 4-5-6 implement ->change_aio_ctx in the various block, blockjob
>>>> and block-backend BDSes.
>>>> Patch 7 substitutes ->change_aio_ctx with the old callbacks, and
>>>> patch 8 takes care of deleting the old callbacks and unused code.
>>>>
>>>> This series is based on "job: replace AioContext lock with job_mutex",
>>>> but just because it uses job_set_aio_context() introduced there.
>>>>
>>>> Suggested-by: Paolo Bonzini<pbonzini@redhat.com>
>>>> Based-on:<20220706201533.289775-1-eesposit@redhat.com>
>>>
>>>
>>
>> So, I read your email before going on PTO and at that point I got what
>> your concerns were, but now after re-reading it I don't understand
>> anymore what you mean :)
>>
>>> What I dislike here is that you refactor aio-context-change to use
>>> transactions, but you use it "internally" for aio-context-change.
>>> aio-context-change doesn't become a native part of block-graph
>>> modifiction transaction system after the series.
>>>
>>> For example, bdrv_attach_child_common(..., tran) still calls
>>> bdrv_try_change_aio_context() function which doesn't take @tran
>>> argument. And we have to call bdrv_try_change_aio_context() again in
>>> bdrv_attach_child_common_abort() with opposite arguments by hand. We
>>> create in _try_ separate Transaction object which is unrelated to the
>>> original block-graph-change transaction.
>>>
>>
>> This can be fixed: patch 4 "bdrv_child_try_change_aio_context: add
>> transaction parameter" supports taking transaction as a parameter.
>> bdrv_attach_child_common could simply call
>> bdrv_try_change_aio_context_tran (ok we need to deal with locking, but
>> it could work).
> 
> No actually I don't get how it can work in bdrv_attach_child_common.
> We have the following:
> 
> parent_ctx = bdrv_child_get_parent_aio_context(new_child);
> if (child_ctx != parent_ctx) {
>        int ret = bdrv_try_change_aio_context(child_bs, parent_ctx, NULL,
>                                              &local_err);
> 
>        if (ret < 0 && child_class->change_aio_ctx) {
>            ret_child = child_class->change_aio_ctx(new_child, child_ctx,
>                                                    visited, tran, NULL);
> 
>            tran_finalize(tran, ret_child == true ? 0 : -1);
>        }
> 
>        if (ret < 0) {
>            return ret;
>        }
> }
> 
> bdrv_replace_child_noperm(&new_child, child_bs, true);
> 
> So bdrv_try_change_aio_context would be changed in
> bdrv_try_change_aio_context_tran, but then how can we call
> bdrv_replace_child_noperm if no aiocontext has been changed at all?
> I don't think we can mix transactional operations with non-transactional.
> 

So here, bdrv_try_change_aio_context() is .prepare in the way I mean.

And than in .abort we call bdrv_try_change_aio_context() again but with reverse argument, and it's a kind of ".abort".

Probably, we can refactor that, making a function bdrv_change_aio_context(, .., tran), which does what bdrv_try_change_aio_context does, and registers .abort callback, that will simulate calling bdrv_try_change_aio_context() with opposite arguement.  But we should carefully refactor all the function names and avoid having nested transaction.

> 
>>
>> I think the main concern here is that during the prepare phase this
>> serie doesn't change any aiocontext, so until we don't commit the rest
>> of the code cannot assume that the aiocontext has been changed.
>>
>> But isn't it what happens also for permissions? Permission functions
>> like bdrv_drv_set_perm perform bdrv_check_perm() in .prepare(), and then
>> bdrv_set_perm() in commit.
>>
>> Another important question is that if we actually want to put everything
>> in a single transaction, because .prepare functions like the one
>> proposed here perform drains, so the logic following prepare and
>> preceding commit must take into account that everything is drained. Also
>> prepare itself has to take into account that maybe other .prepare took
>> locks or drained themselves...
>>
>>> With good refactoring we should get rid of these _try_ functions, and
>>> have just bdrv_change_aio_context(..., tran) that can be natively used
>>> with external tran object, where other block-graph change actions
>>> participate. This way we'll not have to call reverse
>>> aio_context_change() in .abort, it will be done automatically.
>>>
>>> Moreover, your  *aio_context_change* functions that do have tran
>>> parameter cannot be simply used in the block-graph change transaction,
>>> as you don't follow the common paradigm, that in .prepare we do all
>>> visible changes. That's why you have to still use _try_*() version that
>>> creates seaparate transaction object and completes it: after that the
>>> action is actually done and other graph-modifying actions can be done on
>>> top.
>>>
>>> So, IMHO, we shouldn't go this way, as that adds transaction actions
>>> that actually can't be used in common block-graph-modifying transaction
>>> but only context of bdrv_try_change_aio_context() internal transaction.
>>>
>>> I agree that aio-context change should finally be rewritten to take a
>>> native place in block-graph transactions, but that should be a complete
>>> solution, introducing native bdrv_change_aio_context(..., tran)
>>> transaction action that is directly used in the block-graph transaction,
>>> do visible effect in .prepare and don't create extra Transaction objects.
>>>
> 


-- 
Best regards,
Vladimir

