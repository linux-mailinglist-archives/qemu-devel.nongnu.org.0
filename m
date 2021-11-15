Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53567450471
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 13:29:28 +0100 (CET)
Received: from localhost ([::1]:33542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmb70-0006gD-Ii
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 07:29:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mmb5Y-0005qZ-Mv
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 07:27:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mmb5V-0001K2-FQ
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 07:27:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636979271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EppC0kFIvEEMWzbIACcEDg4BW7MVBe3UhIzUaJhTXtM=;
 b=if/PhtFnl4cJSZ+ji5PNjeWmmvFao8i6C6dBne1gOgpGCByq7h4CVF2ULe6FxVEofoPSdJ
 /SblAUyMSXTiSlI4UbjiaNUqcU/b0+Szo0zzpj04ugqZryBQleIAi82X00HMYua8/dyLZn
 1asuGyW4DErScSFYzhBI/BtckRa1S48=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-1hH3oVVRPruJCHooARysGg-1; Mon, 15 Nov 2021 07:27:49 -0500
X-MC-Unique: 1hH3oVVRPruJCHooARysGg-1
Received: by mail-ed1-f70.google.com with SMTP id
 v10-20020aa7d9ca000000b003e7bed57968so2587658eds.23
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 04:27:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EppC0kFIvEEMWzbIACcEDg4BW7MVBe3UhIzUaJhTXtM=;
 b=zOiw28SZlFdmbzdZFOSlJl6/67cVVztFmB/vV6r5XtNTqYweg4IfBA7mCmL9mEnU67
 zUfw/aX+Lxm3C4amR8Xh9ryiFOZ87UEiZdMCrQNko8MiHo33nVou1zF7H/kzFBVj8vd/
 r/TCzo5apyijdRKYHGTEgGcKgaNAxMUBjbW0TyvDaF2uvzq7pmPC5lVlQkvID7bi3UJp
 O6BxXEmInT71MDtFIIHlASRh17pAv8SILu7RCCQrePcxnWFSGxm1m+rj4EoptNs5StHx
 FCltlb6vsEWBFCOizDx3HYr10+67TP7bAwRxaqNKd43T87YZFbXxOPuPXaMNhtBSYhfw
 IiIw==
X-Gm-Message-State: AOAM531wW8mvc9k5Qnlbgqa+nlj86Wl9YmHKMidDRBaOt5kOoqGVWdpi
 QQf57gygt6KT0bCu2U1zSnGZRTMQbtCuZjD+9uzXzN44BjX4mAhu5ZjLfqSFJE0BbaITf/jxclK
 7WE2qVmv/0+fxcgA=
X-Received: by 2002:a17:907:1b25:: with SMTP id
 mp37mr48636994ejc.140.1636979268405; 
 Mon, 15 Nov 2021 04:27:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzNERevXcGLVBP6n+HfCXcZyKll/r+Judl+KTVEx9lfCAzMrTsGQCobR0D+TyJ3uRuG0QvkVQ==
X-Received: by 2002:a17:907:1b25:: with SMTP id
 mp37mr48636927ejc.140.1636979268053; 
 Mon, 15 Nov 2021 04:27:48 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id sh30sm6532513ejc.117.2021.11.15.04.27.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 04:27:47 -0800 (PST)
Message-ID: <a8888485-8cf4-7521-b6de-b55ab8a717f5@redhat.com>
Date: Mon, 15 Nov 2021 13:27:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 03/25] assertions for block global state API
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-4-eesposit@redhat.com>
 <3defb901-0356-bb01-8e13-ad984a63f48a@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <3defb901-0356-bb01-8e13-ad984a63f48a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
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

> 
>> @@ -5958,6 +6043,7 @@ const char *bdrv_get_parent_name(const 
>> BlockDriverState *bs)
>>   /* TODO check what callers really want: bs->node_name or blk_name() */
>>   const char *bdrv_get_device_name(const BlockDriverState *bs)
>>   {
>> +    assert(qemu_in_main_thread());
>>       return bdrv_get_parent_name(bs) ?: "";
>>   }
> 
> This function is invoked from qcow2_signal_corruption(), which comes 
> generally from an I/O path.  Is it safe to assert that we’re in the main 
> thread here?
> 
> Well, the question is probably rather whether this needs really be a 
> considered a global-state function, or whether putting it in common or 
> I/O is fine.  I believe you’re right given that it invokes 
> bdrv_get_parent_name(), it cannot be thread-safe, but then we’ll have to 
> change qcow2_signal_corruption() so it doesn’t invoke this function.
> 

I think that the assertion is wrong here. As long as a single caller is 
not under BQL, we cannot keep the function in global-state headers.
It should go into block-io.h, together with bdrv_get_parent_name and 
bdrv_get_device_or_node_name (caller of bdrv_get_parent_name).

Since bdrv_get_parent_name only scans through the list of bs->parents, 
as long as we can assert that the parent list is modified only under BQL 
+ drain, it is safe to be read and can be I/O.

> [...]
> 
>> diff --git a/block/io.c b/block/io.c
>> index bb0a254def..c5d7f8495e 100644
>> --- a/block/io.c
>> +++ b/block/io.c
> 
> [...]
> 
>> @@ -544,6 +546,7 @@ void bdrv_drained_end(BlockDriverState *bs)
>>   void bdrv_drained_end_no_poll(BlockDriverState *bs, int 
>> *drained_end_counter)
>>   {
>> +    assert(qemu_in_main_thread());
>>       bdrv_do_drained_end(bs, false, NULL, false, drained_end_counter);
>>   }
> 
> Why is bdrv_drained_end an I/O function and this is a GS function, even 
> though it does just a subset?

Right this is clearly called in bdrv_drained_end. I don't know how is it 
possible that no test managed to trigger this assertion... This is 
actually invoked in both unit and qemu-iothread tests...

> 
>> @@ -586,12 +589,14 @@ void bdrv_unapply_subtree_drain(BdrvChild 
>> *child, BlockDriverState *old_parent)
>>   void coroutine_fn bdrv_co_drain(BlockDriverState *bs)
>>   {
>>       assert(qemu_in_coroutine());
>> +    assert(qemu_in_main_thread());
>>       bdrv_drained_begin(bs);
>>       bdrv_drained_end(bs);
>>   }
>>   void bdrv_drain(BlockDriverState *bs)
>>   {
>> +    assert(qemu_in_main_thread());
>>       bdrv_drained_begin(bs);
>>       bdrv_drained_end(bs);
>>   }
> 
> Why are these GS functions when both bdrv_drained_begin() and 
> bdrv_drained_end() are I/O functions?
> 
> I can understand making the drain_all functions GS functions, but it 
> seems weird to say it’s an I/O function when a single BDS is drained via 
> bdrv_drained_begin() and bdrv_drained_end(), but not via bdrv_drain(), 
> which just does both.
> 
> (I can see that there are no I/O path callers, but I still find it 
> strange.)

The problem as you saw is on the path callers: bdrv_drain seems to be 
called only in main thread, while others or similar drains are also 
coming from I/O. I would say maybe it's a better idea to just put 
everything I/O, maybe (probably) there are cases not caught by the tests.

The only ones in global-state will be:
- bdrv_apply_subtree_drain and bdrv_unapply_subtree_drain (called only 
in .attach and .detach callbacks of BdrvChildClass, run under BQL).
- bdrv_drain_all_end_quiesce (called only by bdrv_close thus under BQL).
- bdrv_drain_all_begin, bdrv_drain_all_end and bdrv_drain_all (have 
already BQL assertions)

In general, this is the underlying problem with these assertions: if a 
test doesn't test a specific code path, an unneeded assertion might pass 
undetected.

> 
> [...]
> 
>> @@ -2731,6 +2742,7 @@ int bdrv_block_status_above(BlockDriverState 
>> *bs, BlockDriverState *base,
>>   int bdrv_block_status(BlockDriverState *bs, int64_t offset, int64_t 
>> bytes,
>>                         int64_t *pnum, int64_t *map, BlockDriverState 
>> **file)
>>   {
>> +    assert(qemu_in_main_thread());
>>       return bdrv_block_status_above(bs, bdrv_filter_or_cow_bs(bs),
>>                                      offset, bytes, pnum, map, file);
>>   }
> 
> Why is this a GS function as opposed to all other block-status 
> functions?  Because of the bdrv_filter_or_cow_bs() call?

This function is in block.io but has the assertion. I think it's a 
proper I/O but I forgot to remove the assertion in my various trial&errors.

Let me know if you disagree on anything of what I said.

Thank you,
Emanuele


