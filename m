Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4357B3AE61A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 11:33:10 +0200 (CEST)
Received: from localhost ([::1]:43976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvGIm-0004sr-Up
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 05:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lvGGZ-000405-0b
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:30:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lvGGV-0005vT-Oh
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:30:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624267846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VvpnGP5nhyIEQ5uNA0oCDe4X0lnTKQRDMVHapbLX/HU=;
 b=UNoc9Mot9rpsymBPWrudo8pUFQ9Qg07+V9Av+Y0+iwiRYNu7+k0RtpLj9qZvc19YnpsO2k
 q9ci/EbKXxqmfm6mR+gM1+D4R+pYZTUaAl40/W9FOe0Ly6L6hyUsL/qZgkuy42BnCD4gIL
 2MECnlmxhTH7DXr/v5ma/r384z/0KZY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-1yky81qbOYiE5AGn5zrSDQ-1; Mon, 21 Jun 2021 05:30:45 -0400
X-MC-Unique: 1yky81qbOYiE5AGn5zrSDQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 i70-20020adf90cc0000b029011a8a299a4dso3273050wri.17
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 02:30:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VvpnGP5nhyIEQ5uNA0oCDe4X0lnTKQRDMVHapbLX/HU=;
 b=Ah8ekOLwweorR+RBsZDMkr8C9Ghx2YXFxWJs0TAyXg3rtDxBn//0qzTB4UVVkDD5GS
 hmSdi88KfEGrPUzY29NVMU88mghMi5t8bd6mB+XC3LKiIAIwcCt3eoXIVN2vK+3HT+6T
 hiJaO23E5NEmgrgv1LQwEXafWBeaGIENOxfqn4irBLlihZmtME/SBp2kRyotOabBxtm6
 hrD9Ecp3o9x3fnNLMEgY1X2ptlf6cIfb83dLIXKew+U0UodUYfcLAQ3PkDZkeE6xz/BJ
 GXvMZtKgpFolA96unihvgoJ47VSdqBgmTc0aolhgvzHeJCmEdpsb9lNe0zgnt4WWPADE
 3wBQ==
X-Gm-Message-State: AOAM532vgeVYzKboY0oSPmoC9byWCRW/0+63/jbrVHF8P7FwP/2YStg9
 s5S+zEiel0qIydHBu7cDuBDOPrcyoSA1Rt47fBX8Q81DHU8yoOkfX7ssXJezSIkYs9y8QBQUad9
 vSl7CMZ2NdCpipCUn8Uq3JXIYhRlA5jXwMwL/8WVAvN9pzRRQH6FPOJVZWAjwPlLO6A8=
X-Received: by 2002:a5d:5984:: with SMTP id n4mr27688053wri.294.1624267844031; 
 Mon, 21 Jun 2021 02:30:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwa1G4b7lhYQy1UlWFVnGFQTcUaEn7cznS5iKIySMTWRDOD2OOy2SzOnl7vk26k/ATfOk+WdQ==
X-Received: by 2002:a5d:5984:: with SMTP id n4mr27688020wri.294.1624267843669; 
 Mon, 21 Jun 2021 02:30:43 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 t17sm15695287wmi.47.2021.06.21.02.30.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 02:30:43 -0700 (PDT)
Subject: Re: [PATCH v4 6/6] block-copy: atomic .cancelled and .finished fields
 in BlockCopyCallState
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210614073350.17048-1-eesposit@redhat.com>
 <20210614073350.17048-7-eesposit@redhat.com>
 <fcb8849c-bedf-aacc-3831-0239d89af2d6@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <215f6356-1b9a-3f3b-c35d-bf0b176ebd0f@redhat.com>
Date: Mon, 21 Jun 2021 11:30:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <fcb8849c-bedf-aacc-3831-0239d89af2d6@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 19/06/2021 22:06, Vladimir Sementsov-Ogievskiy wrote:
> 14.06.2021 10:33, Emanuele Giuseppe Esposito wrote:
>> By adding acquire/release pairs, we ensure that .ret and .error_is_read
>> fields are written by block_copy_dirty_clusters before .finished is true.
> 
> And that they are read by API user after .finished is true.
> 
>>
>> The atomic here are necessary because the fields are concurrently 
>> modified
>> also outside coroutines.
> 
> To be honest, finished is modified only in coroutine. And read outside.
> 
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   block/block-copy.c | 33 ++++++++++++++++++---------------
>>   1 file changed, 18 insertions(+), 15 deletions(-)
>>
>> diff --git a/block/block-copy.c b/block/block-copy.c
>> index 6416929abd..5348e1f61b 100644
>> --- a/block/block-copy.c
>> +++ b/block/block-copy.c
>> @@ -53,14 +53,14 @@ typedef struct BlockCopyCallState {
>>       Coroutine *co;
>>       /* State */
>> -    bool finished;
>> +    bool finished; /* atomic */
> 
> So, logic around finished:
> 
> Thread of block_copy does:
> 0. finished is false
> 1. tasks set ret and error_is_read
> 2. qatomic_store_release finished -> true
> 3. after that point ret and error_is_read are not modified
> 
> Other threads can:
> 
> - qatomic_read finished, just to check are we finished or not
> 
> - if finished, can read ret and error_is_read safely. If you not sure 
> that block-copy finished, use qatomic_load_acquire() of finished first, 
> to be sure that you read ret and error_is_read AFTER finished read and 
> checked to be true.
> 
>>       QemuCoSleep sleep; /* TODO: protect API with a lock */
>>       /* To reference all call states from BlockCopyState */
>>       QLIST_ENTRY(BlockCopyCallState) list;
>>       /* OUT parameters */
>> -    bool cancelled;
>> +    bool cancelled; /* atomic */
> 
> Logic around cancelled is simpler:
> 
> - false at start
> 
> - qatomic_read is allowed from any thread
> 
> - qatomic_write to true is allowed from any thread
> 
> - never write to false
> 
> Note that cancelling and finishing are racy. User can cancel block-copy 
> that's already finished. We probably may improve change it, but I'm not 
> sure that it worth doing. Still, maybe leave some comment in API 
> documentation.
> 
>>       /* Fields protected by lock in BlockCopyState */
>>       bool error_is_read;
>>       int ret;
>> @@ -650,7 +650,8 @@ block_copy_dirty_clusters(BlockCopyCallState 
>> *call_state)
>>       assert(QEMU_IS_ALIGNED(offset, s->cluster_size));
>>       assert(QEMU_IS_ALIGNED(bytes, s->cluster_size));
>> -    while (bytes && aio_task_pool_status(aio) == 0 && 
>> !call_state->cancelled) {
>> +    while (bytes && aio_task_pool_status(aio) == 0 &&
>> +           !qatomic_read(&call_state->cancelled)) {
>>           BlockCopyTask *task;
>>           int64_t status_bytes;
>> @@ -761,7 +762,7 @@ static int coroutine_fn 
>> block_copy_common(BlockCopyCallState *call_state)
>>       do {
>>           ret = block_copy_dirty_clusters(call_state);
>> -        if (ret == 0 && !call_state->cancelled) {
>> +        if (ret == 0 && !qatomic_read(&call_state->cancelled)) {
>>               WITH_QEMU_LOCK_GUARD(&s->lock) {
>>                   /*
>>                    * Check that there is no task we still need to
>> @@ -792,9 +793,9 @@ static int coroutine_fn 
>> block_copy_common(BlockCopyCallState *call_state)
>>            * 2. We have waited for some intersecting block-copy request
>>            *    It may have failed and produced new dirty bits.
>>            */
>> -    } while (ret > 0 && !call_state->cancelled);
>> +    } while (ret > 0 && !qatomic_read(&call_state->cancelled));
>> -    call_state->finished = true;
>> +    qatomic_store_release(&call_state->finished, true);
> 
> so, all writes to ret and error_is_read are finished to this point.
> 
>>       if (call_state->cb) {
>>           call_state->cb(call_state->cb_opaque);
>> @@ -857,35 +858,37 @@ void block_copy_call_free(BlockCopyCallState 
>> *call_state)
>>           return;
>>       }
>> -    assert(call_state->finished);
>> +    assert(qatomic_load_acquire(&call_state->finished));
> 
> Here we don't need load_aquire, as we don't read other fields. 
> qatomic_read is enough.

So what you say makes sense, the only thing that I wonder is: wouldn't 
it be better to have the acquire without assertion (or assert 
afterwards), just to be sure that we delete when finished is true?

[...]

> 
>>   }
>>   bool block_copy_call_cancelled(BlockCopyCallState *call_state)
>>   {
>> -    return call_state->cancelled;
>> +    return qatomic_read(&call_state->cancelled);
>>   }
>>   int block_copy_call_status(BlockCopyCallState *call_state, bool 
>> *error_is_read)
>>   {
>> -    assert(call_state->finished);
>> +    assert(qatomic_load_acquire(&call_state->finished));
> 
> Hmm. Here qatomic_load_acquire protects nothing (assertion will crash if 
> not yet finished anyway). So, caller is double sure that block-copy is 
> finished.
> 
> Also it's misleading: if we think that it do some protection, we are 
> doing wrong thing: assertions may be simply compiled out, we can't rely 
> on statements inside assert() to be executed.
> 
> So, let's use simple qatomic_read here too.

Same applies here.

> 
>>       if (error_is_read) {
>>           *error_is_read = call_state->error_is_read;
>>       }
>> @@ -894,7 +897,7 @@ int block_copy_call_status(BlockCopyCallState 
>> *call_state, bool *error_is_read)
>>   void block_copy_call_cancel(BlockCopyCallState *call_state)
>>   {
>> -    call_state->cancelled = true;
>> +    qatomic_set(&call_state->cancelled, true);
>>       block_copy_kick(call_state);
>>   }
>>
> 
> Uhh :)
> 
> Ok, that looks close too. Or in other words, I feel that I have good 
> enough understanding of all the thread-safe logic that you have 
> implemented :)

Good! :)

Emanuele


