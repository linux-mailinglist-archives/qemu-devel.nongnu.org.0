Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 127F958ACE3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 17:00:31 +0200 (CEST)
Received: from localhost ([::1]:56766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJyoP-0001kh-Tz
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 11:00:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oJyla-00073i-Bz
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 10:57:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oJylW-0003mi-J3
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 10:57:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659711449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5ofArVsT9SqiS/WmYAoKDnsd3sFvauAjeS18VeVRijs=;
 b=bnjAAAWNqxVCNJpqVY3l/7JD4OifXfHYULOsLl9ILE4b+gL7oE+XpNteKrLWGh/O5qz4mH
 Ytxh98gK5wBdNhXNbBdInOoenMkl+KDx/d/vSc+BMUqVDsVHSC5XzmoLWDmfzWas2RNEdY
 EDqp8XnxTddDX4Nal/C8z19qutXprtY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122--7vQgbItPTmF5tBWMXuK3g-1; Fri, 05 Aug 2022 10:57:28 -0400
X-MC-Unique: -7vQgbItPTmF5tBWMXuK3g-1
Received: by mail-wr1-f71.google.com with SMTP id
 t13-20020adfe10d000000b0021bae3def1eso561221wrz.3
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 07:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=5ofArVsT9SqiS/WmYAoKDnsd3sFvauAjeS18VeVRijs=;
 b=o6JU4MFlX142V5NdDTiFHn8CcAwrgkWms6X+hV+S4Q+4jBqVWAg1BUeC8VYU0BPcvQ
 /eD1/hfgtWlHG87bgtfLwK4TsHhyhGJxKBUSjBPHsbU885Hp1tdhhaOeqtzmI29c9ce0
 VlwydXuMI4luh3e7fk0fx/CuHZzpJnfBqRHQy3AQYOwC1pleY4m3i5V1tcJCiXeQDolk
 Rizl3ab+GAMWf+jjHHtboajgFA7fH74jcd64dkuS3Ni+si7Qih2TMHbwIjH7KsJrWRpA
 np1ZxZJdR02nQqshx5cekEERKetq0L98gdqqH3rz3aV+8X/x+tLg2JvinoBONlF7nid+
 x1Cg==
X-Gm-Message-State: ACgBeo3kcnckI1mHWH8VzT2Yb5fzBAc9ODZtC+oUro14ZE4xlYBZxDB+
 ThunXeld/MZge58EOxF6CzBADsovpNp2w4AZ+GCpyu6No+m0HEhDMMf4k7ly8z9dZhUY51vnTGE
 CobEZSdNJBscKgBk=
X-Received: by 2002:a05:600c:4e01:b0:3a3:342:5f55 with SMTP id
 b1-20020a05600c4e0100b003a303425f55mr5079900wmq.150.1659711447293; 
 Fri, 05 Aug 2022 07:57:27 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5vuhZ1G/J5pVj1l5S6wDkWvx+3lYqmri27KMgwh5cWsPESO/7McmXYMrhBeMarci72zOo9cQ==
X-Received: by 2002:a05:600c:4e01:b0:3a3:342:5f55 with SMTP id
 b1-20020a05600c4e0100b003a303425f55mr5079888wmq.150.1659711447034; 
 Fri, 05 Aug 2022 07:57:27 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a05600c1d1500b003a519637474sm2475821wms.44.2022.08.05.07.57.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 07:57:26 -0700 (PDT)
Message-ID: <662bee2d-e053-1a59-ba6a-41bbde955260@redhat.com>
Date: Fri, 5 Aug 2022 16:57:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 00/11] Refactor bdrv_try_set_aio_context using
 transactions
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20220725122120.309236-1-eesposit@redhat.com>
 <b3eb6174-5fd5-f7f9-512c-4cdb46e62502@yandex-team.ru>
 <0b3872fa-830a-f657-76be-2fbae055dffa@redhat.com>
 <7b84b9be-b97b-2e53-5396-70d5c66ebfcf@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <7b84b9be-b97b-2e53-5396-70d5c66ebfcf@yandex-team.ru>
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



Am 05/08/2022 um 16:35 schrieb Vladimir Sementsov-Ogievskiy:
> On 8/5/22 16:22, Emanuele Giuseppe Esposito wrote:
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
>>
>> I think the main concern here is that during the prepare phase this
>> serie doesn't change any aiocontext, so until we don't commit the rest
>> of the code cannot assume that the aiocontext has been changed.
>>
>> But isn't it what happens also for permissions? Permission functions
>> like bdrv_drv_set_perm perform bdrv_check_perm() in .prepare(), and then
>> bdrv_set_perm() in commit.
> 
> Not exactly.
> 
> Partly that's just old bad naming. Ideally, driver handlers should be
> refactored to have one
> .bdrv_set_perm(, ... tran, errp) handler. Or at least renamed to
> .prepare and .commit instead of misleading .check and .set.
> 
> Secondly what is important, is that corresponding .set actions are not
> visible to other block-graph modifying actions (like taking locks on fd.
> other actions, like attach/detach children don't care of it)/ (Or, at
> least, they _shoud not be_ visible :) To be honest, I don't have real
> expertise, of how much these .set actions are visible or not by other
> block-graph modifying actions, but I believe that we are OK in common
> scenarios).
> 
> What is really visible at generic block layer? Visible is change of
> .perm / .shared_perm fields of BdrvChild. And they are set in .prepare,
> look at bdrv_child_set_perm().
> 
> So, after calling bdrv_child_set_perm() other actions of .prepare stage
> will see _updated_ permissions. And if transaction fails, we rollback
> .perm and .shared_perm fields in bdrv_child_set_perm_abort()
> 
> 
>>
>> Another important question is that if we actually want to put everything
>> in a single transaction, because .prepare functions like the one
>> proposed here perform drains, so the logic following prepare and
>> preceding commit must take into account that everything is drained. Also
>> prepare itself has to take into account that maybe other .prepare took
>> locks or drained themselves...
> 
> Yes, untie the knot of drained sections during aio context change is a
> challenge.. And that's (at least on of) the reason why aio-context
> change is still not a native part of block graph modifying transactions.
> 
> Could there be some simple solution?
> 
> Like
> 
> 1. drain the whole subgraph of all nodes connected with nodes that we
> are going to touch
> 
> 2. do block graph modifying transaction (including aio context change)
> knowing that everything we need is drained. (so we don't have to care
> about drain during aio context change)
> 
> 3. undrain the subgraph
> 
> In other words, is that really necessary to lock/unlock different
> contexts during the aio-context-change procedure? Or we can move to a
> lot larger and simpler drained section?

Unfortunately I think the aiocontext lock have to stay where they
currently are. I documented it in this serie.

drained begin needs the old aiocontext, and drained end the new one,
since we moved the graph to a different aiocontext.

Also, if I understand correctly you suggest:

.prepare = check and then change aiocontext
.abort = revert aiocontext change
.commit = nothing

drain_begin_all();
prepare();
drain_end_all();

if prepare is not OK:
	tran_abort(); // or simply return error so the caller calls abort

But then:
1) .abort needs draining too
2) it is not so different from what it was before, isn't it?

Emanuele


> 
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
>>> do visible effect in .prepare and don't create extra Transaction
>>> objects.
>>>
>>
> 
> 


