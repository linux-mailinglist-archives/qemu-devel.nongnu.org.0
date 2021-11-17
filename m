Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E98A4545B8
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 12:34:48 +0100 (CET)
Received: from localhost ([::1]:57094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnJDD-0002UR-Hq
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 06:34:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mnJC7-0001P0-9J
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 06:33:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mnJC3-0002yk-Id
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 06:33:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637148814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1fpeIRFG1K0VOJ3nbKX8D3q1Ku/qT3iz/Q+Dc5ZCFKg=;
 b=PZtFwW66SbdLjatXnSRw2gTwZEtmYPdt6vP7yQP9mAtfPNyhF8WPse6IbwG9Ibb/fDc8l4
 GoGrQmOrA0899UaXE9NXzUTaKd7UcVczj3Ep/ra+8pBpnCT1Mqffs1bI8U49MxGUrUVj4Z
 Nxs/X7fla8Bq1AB8KrREmko3xPQCQqg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-e92rhKd5M2CJT7YxySrmew-1; Wed, 17 Nov 2021 06:33:33 -0500
X-MC-Unique: e92rhKd5M2CJT7YxySrmew-1
Received: by mail-ed1-f69.google.com with SMTP id
 w4-20020aa7cb44000000b003e7c0f7cfffso1892767edt.2
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 03:33:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1fpeIRFG1K0VOJ3nbKX8D3q1Ku/qT3iz/Q+Dc5ZCFKg=;
 b=8OiznygbJI1xwsZa9/TEbCO87vwWhWcPfuVeZs6PSdYOe/kOA+aptoEBTw+CF/f54Y
 ZXks/HDw19P3FUkCnmNua0koCjjGNzsELMXA/8Nvlkq7NbjWI3s64DnHfYTn3rbkMqet
 3OT31TF9h8aFNrTaiEFarXRkjeMs9RaZkUxkjwjWg/DAgPx6DfdS6dgKnvqE+sysHURG
 I+eFAZDHjHhfWplNMYgeOG+Hy9a0cgmUVTlxfs4kb8QjTMMTq11NG7toeAVBElajf/MJ
 Y8ATbMXz1Gf8ZmUlnQKSvK9jMw3Cl3klApWtbqWzxr+xMvxdP4pK/Ta2Sd2C0EsDGRoT
 RvCw==
X-Gm-Message-State: AOAM531po87qutNl52nbS79J7WzigIN0az3kPxEugyEB3kFDtxv4nVLs
 nlb3QC9RwT2DRTTyZXnGgzPjn3/hURTKDfpWLUnmauYlsNyACutF8fMN4XQSpzAFXWV+PX8VL6D
 q2vuieE9EpZo+sK0=
X-Received: by 2002:a17:907:d89:: with SMTP id
 go9mr21201042ejc.330.1637148811785; 
 Wed, 17 Nov 2021 03:33:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWsgmEGkuRALghKxkubrpUbR6TONvTkJsuYxaK3Df7w8+ooS20LZ+rja03zBhlAe4kqafy6Q==
X-Received: by 2002:a17:907:d89:: with SMTP id
 go9mr21200965ejc.330.1637148811392; 
 Wed, 17 Nov 2021 03:33:31 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id n1sm10668222edf.45.2021.11.17.03.33.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 03:33:30 -0800 (PST)
Message-ID: <197a79f6-c9c2-d73b-7e38-e88ccc2e0a57@redhat.com>
Date: Wed, 17 Nov 2021 12:33:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 20/25] block_int-common.h: assertion in the callers of
 BlockDriver function pointers
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-21-eesposit@redhat.com>
 <83cf9336-e37d-bf48-961c-8103b5c7bc62@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <83cf9336-e37d-bf48-961c-8103b5c7bc62@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.009, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 15/11/2021 13:48, Hanna Reitz wrote:
> On 25.10.21 12:17, Emanuele Giuseppe Esposito wrote:
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>   block.c | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/block.c b/block.c
>> index 94bff5c757..40c4729b8d 100644
>> --- a/block.c
>> +++ b/block.c
> 
> [...]
> 
>> @@ -2148,6 +2152,7 @@ static void bdrv_child_perm(BlockDriverState 
>> *bs, BlockDriverState *child_bs,
>>                               uint64_t *nperm, uint64_t *nshared)
>>   {
>>       assert(bs->drv && bs->drv->bdrv_child_perm);
>> +    assert(qemu_in_main_thread());
>>       bs->drv->bdrv_child_perm(bs, c, role, reopen_queue,
>>                                parent_perm, parent_shared,
>>                                nperm, nshared);
> 
> (Should’ve noticed earlier, but only did now...)
> 
> First, this function is indirectly called by bdrv_refresh_perms(). I 
> understand that all perm-related functions are classified as GS.
> 
> However, bdrv_co_invalidate_cache() invokes bdrv_refresh_perms. Being 
> declared in block/coroutine.h, it’s an I/O function, so it mustn’t call 
> such a GS function. BlockDriver.bdrv_co_invalidate_cache(), 
> bdrv_invalidate_cache(), and blk_invalidate_cache() are also classified 
> as I/O functions. Perhaps all of these functions should be classified as 
> GS functions?  I believe their callers and their purpose would allow for 
> this.

I think that the *_invalidate_cache functions are I/O.
First of all, test-block-iothread.c calls bdrv_invalidate_cache in 
test_sync_op_invalidate_cache, which is purposefully called in an 
iothread. So that hints that we want it as I/O.
(Small mistake I just noticed: blk_invalidate_cache has the BQL 
assertion even though it is rightly put in block-backend-io.h

> 
> Second, it’s called by bdrv_child_refresh_perms(), which is called by 
> block_crypto_amend_options_generic_luks().  This function is called by 
> block_crypto_co_amend_luks(), which is a BlockDriver.bdrv_co_amend 
> implementation, which is classified as an I/O function.
> 
> Honestly, I don’t know how to fix that mess.  The best would be if we 
> could make the perm functions thread-safe and classify them as I/O, but 
> it seems to me like that’s impossible (I sure hope I’m wrong).  On the 
> other hand, .bdrv_co_amend very much strikes me like a GS function, but 
> it isn’t.  I’m afraid it must work on nodes that are not in the main 
> context, and it launches a job, so AFAIU we absolutely cannot run it 
> under the BQL.
> 
> It almost seems to me like we’d need a thread-safe variant of the perm 
> functions that’s allowed to fail when it cannot guarantee thread safety 
> or something.  Or perhaps I’m wrong and the perm functions can actually 
> be classified as thread-safe and I/O, that’d be great…

I think that since we are currently only splitting and not taking care 
of the actual I/O thread safety, we can move the _perm functions in I/O, 
and add a nice TODO to double check their thread safety.

I mean, if they are not thread-safe after the split it means they are 
not thread safe also right now.

Emanuele


