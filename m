Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2EE58ABB9
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 15:38:53 +0200 (CEST)
Received: from localhost ([::1]:57996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJxXQ-0008RI-Ny
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 09:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oJxVU-0006o0-7e
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 09:36:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oJxVR-0004H2-3j
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 09:36:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659706608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Ujpzf2pn1/VpjZVdrqmDkceFSridsXOrfa+LCkwhVY=;
 b=hY8YGwMcvvxHNNUdHEs4PLZP2C6j6tlFw9W4g8Xxb/G4lum4Qcjk6zM6FmQSDbMfGgLhLT
 e8D+sgBJpkpOfxJmsaZclUwp/T3REeH7khS2+jpedxT2RJ3oud2hwIC9jFSUoVBOl9LhZt
 6uiPTcgizMQmuoMITW1LPBQbI++qUd8=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-LccnteHXPoOY4FaXeBLogw-1; Fri, 05 Aug 2022 09:36:47 -0400
X-MC-Unique: LccnteHXPoOY4FaXeBLogw-1
Received: by mail-qt1-f197.google.com with SMTP id
 d29-20020ac8615d000000b0033d168124e9so1928734qtm.19
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 06:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=7Ujpzf2pn1/VpjZVdrqmDkceFSridsXOrfa+LCkwhVY=;
 b=y5V3fPohOINCez/9s+Qk+WwOv/aPsisApP/nLEsTkZqrq6n3sFENoBlK7D8IHLVxlD
 U9ytCKJuknH9JpleD2C2LNC8KCNCdclV/gqUMVnaJAYb6n9LLKOMxB9WgI/6PTlgSNcm
 ufAWYC7hbNyoHtWrYw8RZspY8YjQ3sEVCJaGzUTBGBTlwKojYSSt4aOs7m92jp7PRhcY
 J7SqmtwlOwdW0OotRbwnn6eZHe28A0lbUe55jVywTzEARC04JCx41YFIeGMK4OJTw5HM
 XAdf9L2nLatvI3jOAJWuNagAumyE5G4Lhfyze4SNFC0jW1ZuyZNnvXCkHRpWXKBewaBI
 bGdw==
X-Gm-Message-State: ACgBeo36pzGYg0AP7yt5DiRJaSQZOXsGFBh6fv08qO/W4u+xHjcX6AXj
 3x7JzHafkkAU2AgL3jw3ZGHJLgNmRIwEKPdPYNhBUL55Pq3WhjCFNnX/pcXE12YoURA0kYE8lTo
 WVIsCmizXQ3yxTVs=
X-Received: by 2002:a05:620a:c52:b0:6b5:467f:4f6d with SMTP id
 u18-20020a05620a0c5200b006b5467f4f6dmr5257325qki.503.1659706606524; 
 Fri, 05 Aug 2022 06:36:46 -0700 (PDT)
X-Google-Smtp-Source: AA6agR69v7VHefXLGmzdBgy3ApWopvXb1pJQHXzi8HdohUObZK9QA3A27cAwbVCNTfy2Wyp413W2+g==
X-Received: by 2002:a05:620a:c52:b0:6b5:467f:4f6d with SMTP id
 u18-20020a05620a0c5200b006b5467f4f6dmr5257299qki.503.1659706606207; 
 Fri, 05 Aug 2022 06:36:46 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a05620a289100b006b5bf5d45casm3068039qkp.27.2022.08.05.06.36.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 06:36:45 -0700 (PDT)
Message-ID: <62dbc13f-8510-9571-e457-95c3d167d9e5@redhat.com>
Date: Fri, 5 Aug 2022 15:36:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 00/11] Refactor bdrv_try_set_aio_context using
 transactions
Content-Language: en-US
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
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
In-Reply-To: <0b3872fa-830a-f657-76be-2fbae055dffa@redhat.com>
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



Am 05/08/2022 um 15:22 schrieb Emanuele Giuseppe Esposito:
> 
> 
> Am 27/07/2022 um 18:13 schrieb Vladimir Sementsov-Ogievskiy:
>> On 7/25/22 15:21, Emanuele Giuseppe Esposito wrote:
>>> The aim of this series is to reorganize bdrv_try_set_aio_context
>>> and drop BDS ->set_aio_context and ->can_set_aio_ctx callbacks in
>>> favour of a new one, ->change_aio_ctx.
>>>
>>> More informations in patch 3 (which is also RFC, due to the doubts
>>> I have with AioContext locks).
>>>
>>> Patch 1 just add assertions in the code, 2 extends the transactions
>>> API to be able to add also transactions in the tail
>>> of the list.
>>> Patch 3 is the core of this series, and introduces the new callback.
>>> It is marked as RFC and the reason is explained in the commit message.
>>> Patches 4-5-6 implement ->change_aio_ctx in the various block, blockjob
>>> and block-backend BDSes.
>>> Patch 7 substitutes ->change_aio_ctx with the old callbacks, and
>>> patch 8 takes care of deleting the old callbacks and unused code.
>>>
>>> This series is based on "job: replace AioContext lock with job_mutex",
>>> but just because it uses job_set_aio_context() introduced there.
>>>
>>> Suggested-by: Paolo Bonzini<pbonzini@redhat.com>
>>> Based-on:<20220706201533.289775-1-eesposit@redhat.com>
>>
>>
> 
> So, I read your email before going on PTO and at that point I got what
> your concerns were, but now after re-reading it I don't understand
> anymore what you mean :)
> 
>> What I dislike here is that you refactor aio-context-change to use
>> transactions, but you use it "internally" for aio-context-change.
>> aio-context-change doesn't become a native part of block-graph
>> modifiction transaction system after the series.
>>
>> For example, bdrv_attach_child_common(..., tran) still calls
>> bdrv_try_change_aio_context() function which doesn't take @tran
>> argument. And we have to call bdrv_try_change_aio_context() again in
>> bdrv_attach_child_common_abort() with opposite arguments by hand. We
>> create in _try_ separate Transaction object which is unrelated to the
>> original block-graph-change transaction.
>>
> 
> This can be fixed: patch 4 "bdrv_child_try_change_aio_context: add
> transaction parameter" supports taking transaction as a parameter.
> bdrv_attach_child_common could simply call
> bdrv_try_change_aio_context_tran (ok we need to deal with locking, but
> it could work).

No actually I don't get how it can work in bdrv_attach_child_common.
We have the following:

parent_ctx = bdrv_child_get_parent_aio_context(new_child);
if (child_ctx != parent_ctx) {
      int ret = bdrv_try_change_aio_context(child_bs, parent_ctx, NULL,
                                            &local_err);

      if (ret < 0 && child_class->change_aio_ctx) {
          ret_child = child_class->change_aio_ctx(new_child, child_ctx,
                                                  visited, tran, NULL);

          tran_finalize(tran, ret_child == true ? 0 : -1);
      }

      if (ret < 0) {
          return ret;
      }
}

bdrv_replace_child_noperm(&new_child, child_bs, true);

So bdrv_try_change_aio_context would be changed in
bdrv_try_change_aio_context_tran, but then how can we call
bdrv_replace_child_noperm if no aiocontext has been changed at all?
I don't think we can mix transactional operations with non-transactional.

Emanuele

> 
> I think the main concern here is that during the prepare phase this
> serie doesn't change any aiocontext, so until we don't commit the rest
> of the code cannot assume that the aiocontext has been changed.
> 
> But isn't it what happens also for permissions? Permission functions
> like bdrv_drv_set_perm perform bdrv_check_perm() in .prepare(), and then
> bdrv_set_perm() in commit.
> 
> Another important question is that if we actually want to put everything
> in a single transaction, because .prepare functions like the one
> proposed here perform drains, so the logic following prepare and
> preceding commit must take into account that everything is drained. Also
> prepare itself has to take into account that maybe other .prepare took
> locks or drained themselves...
> 
>> With good refactoring we should get rid of these _try_ functions, and
>> have just bdrv_change_aio_context(..., tran) that can be natively used
>> with external tran object, where other block-graph change actions
>> participate. This way we'll not have to call reverse
>> aio_context_change() in .abort, it will be done automatically.
>>
>> Moreover, your  *aio_context_change* functions that do have tran
>> parameter cannot be simply used in the block-graph change transaction,
>> as you don't follow the common paradigm, that in .prepare we do all
>> visible changes. That's why you have to still use _try_*() version that
>> creates seaparate transaction object and completes it: after that the
>> action is actually done and other graph-modifying actions can be done on
>> top.
>>
>> So, IMHO, we shouldn't go this way, as that adds transaction actions
>> that actually can't be used in common block-graph-modifying transaction
>> but only context of bdrv_try_change_aio_context() internal transaction.
>>
>> I agree that aio-context change should finally be rewritten to take a
>> native place in block-graph transactions, but that should be a complete
>> solution, introducing native bdrv_change_aio_context(..., tran)
>> transaction action that is directly used in the block-graph transaction,
>> do visible effect in .prepare and don't create extra Transaction objects.
>>


