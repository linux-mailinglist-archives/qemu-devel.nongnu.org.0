Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B8F45086A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 16:31:27 +0100 (CET)
Received: from localhost ([::1]:44658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdx7-00012b-OB
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 10:31:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmdtt-0007tI-E4
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 10:28:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmdtn-0003xL-J6
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 10:28:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636990068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vI4HCB7lLUegCeFk3+13vbgeryXB5yw2ra4tMCYnIF4=;
 b=fE/tmL6c17toeHJhxCXcXnx/f3LLonAc7569R5hPhHKV3atHyCtRqM9/inG8ogKllGlvR5
 9JG7mtDVwoHyUs9L9Z9JkvJ6gZVxvkJezrnVJU+d8iXDDZAovq6u+OP99Au1pxj2/OuxvX
 9iIt5y3PFcihSUAtqTwLdmOnBuIM5NY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-kZlbgGCfNAqEUetnFoNE_A-1; Mon, 15 Nov 2021 10:27:45 -0500
X-MC-Unique: kZlbgGCfNAqEUetnFoNE_A-1
Received: by mail-wr1-f72.google.com with SMTP id
 p17-20020adff211000000b0017b902a7701so3686507wro.19
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 07:27:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vI4HCB7lLUegCeFk3+13vbgeryXB5yw2ra4tMCYnIF4=;
 b=r8ZPrzq+fyNDPFROOTi6XYmlwJnqL+Jpnmsnxi77I8omPXdfJeIjkXJitRcYKjUylk
 NpIdBC+DtqyyGlccnwzTG5OgaE2E/b7rbRdUPEJ8pqQSHD1qRVdYQBcGIu5dH6kMZLiU
 RdmMlx+7OdCzJOacgQU/lP5vyd01g6+5lEGy//Ev7ISaGiWDRXDBXvk74HBv8fUdN5Oa
 kzsVUQHX2xVA2jVfSP5OWdglYbrE1yHEmx7sM4gcSrEeujQo261BmwR16QZsbo0jSOCh
 FFGYPEqL/qa5QcUNkDthHixUP/CVRcheYFeayr+uENKCgdrPFFHWAfSil9lIKXP4gQrw
 2ZTA==
X-Gm-Message-State: AOAM531gsExpbkg3KQrFojVgQHAEfj18nxOn/0unhiE6Ig2TPRBiXNc0
 jeVaYPvpC9UoD3YpaLSHaK/RcjG0i7p02jfRkKZHppJUNE6ND83v0FqAj4+i3ww6NBxw1iYn3h7
 e6FFX02qt9Gr5SnQ=
X-Received: by 2002:adf:df0d:: with SMTP id y13mr48923859wrl.176.1636990063922; 
 Mon, 15 Nov 2021 07:27:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxEu1JNoa/jOZMgVdxmTW24hCWMnYBlGZhSwShC3WCohPWrr/rxsktcx0wq7QEbwW8XUcwwPw==
X-Received: by 2002:adf:df0d:: with SMTP id y13mr48923808wrl.176.1636990063687; 
 Mon, 15 Nov 2021 07:27:43 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id n184sm19517176wme.2.2021.11.15.07.27.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 07:27:43 -0800 (PST)
Message-ID: <f8e8f527-fb4f-2eba-39c6-13c6aac3e4a7@redhat.com>
Date: Mon, 15 Nov 2021 16:27:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 03/25] assertions for block global state API
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-4-eesposit@redhat.com>
 <3defb901-0356-bb01-8e13-ad984a63f48a@redhat.com>
 <a8888485-8cf4-7521-b6de-b55ab8a717f5@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <a8888485-8cf4-7521-b6de-b55ab8a717f5@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.278, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.11.21 13:27, Emanuele Giuseppe Esposito wrote:
>>
>>> @@ -586,12 +589,14 @@ void bdrv_unapply_subtree_drain(BdrvChild 
>>> *child, BlockDriverState *old_parent)
>>>   void coroutine_fn bdrv_co_drain(BlockDriverState *bs)
>>>   {
>>>       assert(qemu_in_coroutine());
>>> +    assert(qemu_in_main_thread());
>>>       bdrv_drained_begin(bs);
>>>       bdrv_drained_end(bs);
>>>   }
>>>   void bdrv_drain(BlockDriverState *bs)
>>>   {
>>> +    assert(qemu_in_main_thread());
>>>       bdrv_drained_begin(bs);
>>>       bdrv_drained_end(bs);
>>>   }
>>
>> Why are these GS functions when both bdrv_drained_begin() and 
>> bdrv_drained_end() are I/O functions?
>>
>> I can understand making the drain_all functions GS functions, but it 
>> seems weird to say it’s an I/O function when a single BDS is drained 
>> via bdrv_drained_begin() and bdrv_drained_end(), but not via 
>> bdrv_drain(), which just does both.
>>
>> (I can see that there are no I/O path callers, but I still find it 
>> strange.)
>
> The problem as you saw is on the path callers: bdrv_drain seems to be 
> called only in main thread, while others or similar drains are also 
> coming from I/O. I would say maybe it's a better idea to just put 
> everything I/O, maybe (probably) there are cases not caught by the tests.
>
> The only ones in global-state will be:
> - bdrv_apply_subtree_drain and bdrv_unapply_subtree_drain (called only 
> in .attach and .detach callbacks of BdrvChildClass, run under BQL).
> - bdrv_drain_all_end_quiesce (called only by bdrv_close thus under BQL).
> - bdrv_drain_all_begin, bdrv_drain_all_end and bdrv_drain_all (have 
> already BQL assertions)
>
> In general, this is the underlying problem with these assertions: if a 
> test doesn't test a specific code path, an unneeded assertion might 
> pass undetected.

I believe the I/O vs. GS classification should not only be done based on 
functional concerns, i.e. who calls this function (is it called by an 
I/O function?) and whether it can be thread-safe or not (does it call a 
BQL function?), but also needs to be done semantically.  I believe there 
are some functions that we consider thread-safe but are also only called 
by BQL functions, for example apparently bdrv_drain(), 
bdrv_apply_subtree_drain(), and bdrv_unapply_subtree_drain().  Such 
functions can functionally be considered both GS and I/O functions, so 
the decision should be done semantically.  I believe that it makes sense 
to say all drain-related functions for a single subtree are I/O functions.

OTOH, functions operating on multiple trees in the block graph (i.e. all 
functions that have some “_all_” in their name) should naturally be 
considered GS functions, regardless of whether their implementation is 
thread-safe or not, because they are by nature global functions.

That’s why I’m wondering why some drain functions are I/O and others are 
GS; or why this block-status function is I/O and this one is GS.  It may 
make sense functionally, but semantically it’s strange.

I understand it may be difficult for you to know which functions relate 
to each other and thus know these semantic relationships, but in most of 
the series the split seems very reasonable to me, semantically.  If it 
didn’t, I said so. :)

Hanna


