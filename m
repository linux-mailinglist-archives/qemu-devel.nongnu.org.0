Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D300E6ABA7D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 10:56:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ7ZZ-0001cq-Q6; Mon, 06 Mar 2023 04:56:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZ7ZY-0001bQ-56
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 04:56:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZ7ZW-0006fW-Ha
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 04:55:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678096557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4WtGE2AdKfgO8agubqse6CJvNGgPCc6egwfY45H1eEw=;
 b=EIccOLRKUk6Sl2iH/6ojmgt0Xg0abs3wKebZvr89Y6NCkWG0QvI7DpRuhyTPNAvPejKFv+
 7n2F+IeabsRhY3UJeEAh3y8iz4tJ+10D9zzN+3ONrX6kwruHSUVL1bwEGUx/PAfR6wv+ye
 ScmqCBhSc8RIK5tG//LzC/FmxFJfuTQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-vZ3Mo4nNOeeTaVLoe5LdGg-1; Mon, 06 Mar 2023 04:55:56 -0500
X-MC-Unique: vZ3Mo4nNOeeTaVLoe5LdGg-1
Received: by mail-ed1-f72.google.com with SMTP id
 m8-20020a056402430800b004cdaaa4f428so10208246edc.20
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 01:55:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678096555;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4WtGE2AdKfgO8agubqse6CJvNGgPCc6egwfY45H1eEw=;
 b=QXxuakEANJwY0eIZ4GDckLW8XK1tQid5v+RFuf9M9eYAUUZlXLZNJqqa+uvjVACa3T
 EpS3bBxTkEqaVUmdrCAfoZPKDwKfHbfyefQSvJqswGO+b9kxEw7GKBmGheEgk6iz3qcC
 YTt1E36gM6vijWZFtLhSSy9koIRXUQrqOHcuf6TL8y8jy8tedMPGhcefQ4zTQyELmMfu
 rciUaWBLZTOhJNqFwZacCVsI6KT97wBIJa/Kt4JAXb/Bxr03haS5rSovk3I40w3w5Gi0
 s2WgakHu91S4M5Ily5TDoUuhR1nbvhhmR6yeLZYLtu2L1soV0ZSYlclyOm6+UUjDmGHm
 t/hA==
X-Gm-Message-State: AO0yUKX1AAlDr6IefKPDHC1ZOfzdkn5oylNHD+oyMkPbueDEw2r6pqtL
 RXnM/atboYtH2c5/y86jY0IRdLA0rWJDAlJ17QIkMuRVK/V+s1FhI8hwhOu47bCZ4rLIC2GJWPi
 UAeNZvR9a4brBqVE=
X-Received: by 2002:aa7:d782:0:b0:4c1:74fe:b52e with SMTP id
 s2-20020aa7d782000000b004c174feb52emr9693040edq.11.1678096554909; 
 Mon, 06 Mar 2023 01:55:54 -0800 (PST)
X-Google-Smtp-Source: AK7set+AWwflaWI1leMOdfghh7gt/gsU/iUmeuXhmJ0XyoLtrlLszmwREzBd49CHYkciP/Xf69C97A==
X-Received: by 2002:aa7:d782:0:b0:4c1:74fe:b52e with SMTP id
 s2-20020aa7d782000000b004c174feb52emr9693006edq.11.1678096554207; 
 Mon, 06 Mar 2023 01:55:54 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 i6-20020a17090671c600b008b26f3d45fbsm4393715ejk.143.2023.03.06.01.55.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 01:55:53 -0800 (PST)
Message-ID: <2e13c2af-1bee-32ae-a6bf-181ad00a3319@redhat.com>
Date: Mon, 6 Mar 2023 10:55:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 5/8] util/async: add smp_mb__after_rmw() around BH
 enqueue/dequeue
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com
References: <20230303171939.237819-1-pbonzini@redhat.com>
 <20230303171939.237819-6-pbonzini@redhat.com>
 <ba42506d-4906-3d4b-f934-586356278355@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <ba42506d-4906-3d4b-f934-586356278355@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 3/5/23 20:32, Richard Henderson wrote:
> On 3/3/23 09:19, Paolo Bonzini wrote:
>>       unsigned old_flags;
>>       /*
>>        * The memory barrier makes sure that:
>>        * 1. any writes needed by the callback are visible from the callback
>>        *    after aio_bh_dequeue() returns bh.
>>        * 2. ctx is loaded before the callback has a chance to execute and bh
>>        *    could be freed.
>>        */
>>       old_flags = qatomic_fetch_or(&bh->flags, BH_PENDING | new_flags);
>> +    smp_mb__after_rmw();
>> +
>>       if (!(old_flags & BH_PENDING)) {
>>           QSLIST_INSERT_HEAD_ATOMIC(&ctx->bh_list, bh, next);
>>       }
>> @@ -107,14 +109,15 @@ static QEMUBH *aio_bh_dequeue(BHList *head, 
>> unsigned *flags)
>>       QSLIST_REMOVE_HEAD(head, next);
>>       /*
>>        * The memory barrier is paired with aio_bh_enqueue() and it
>>        * ensures that the callback sees all writes done by the scheduling
>>        * thread.  It also ensures that the scheduling thread sees the cleared
>>        * flag before bh->cb has run, and thus will call aio_notify again if
>>        * necessary.
>>        */
> 
> Is it really paired with aio_bh_enqueue?
> 
> Seems like the enqueue barrier really is for aio_bh_poll, and the 
> dequeue barrier is for the callback.

The documentation has been quite obsolete since the introduction of
bh_list.  The logic is as follows:

aio_bh_enqueue()
   load bh->ctx
   set PENDING flag                                          // (0)
   if flag was not set
     // bh becomes visible to dequeuing thread here:
     insert into bh_list                                     // (1)

   aio_notify
     // Write bh->flags and bh_list before ctx->notified
     smp_wmb()                                               // (2)
     set notified to true
     // Write notified before reading notify_me
     smp_mb()                                                // (3)
     if notify_me then event_notifier_set()

and on the dequeue side it's tricky to see why all barriers are
needed; it boils down to the busy-wait polling done at the beginning
of aio_poll():

aio_poll()
   compute approximate timeout (*unordered* read of bh_list)

   enable notify_me
   // Write notify_me before reading notified
   smp_mb()                                // synchronizes with (3)
   if notified then timeout = 0
   ctx->fdmon_ops->wait(timeout)

   disable notify_me
   aio_notify_accept()
     set notified to false
     // Write ctx->notified before reading e.g. bh_list
     smp_mb()                              // synchronizes with (2)

   aio_bh_poll()
     QSLIST_MOVE_ATOMIC                    // synchronizes with (1)
     aio_bh_dequeue
       remove from head
       clear PENDING/SCHEDULED/IDLE        // synchronizes with (0)
     if flags were set
       aio_bh_call


That is:

for synchronization point (0)
- the main function here is to ensure that aio_bh_dequeue() removes
   from the list before the PENDING flag is cleared, otherwise enqueuers can
   clobber the list, and vice versa for the enqueuers.  For this, it is enough
   that qatomic_fetch_and() is "release" and qatomic_fetch_or() is "acquire"
   (and they are).

for synchronization point (1)
- the bottom half machinery between aio_bh_enqueue and aio_bh_poll only
   needs release-to-acquire synchronization, and that is provided by (1).
   This is also where ordering ensures that bh->ctx is loaded before the
   callback executes (which could free bh).

- between enqueuers, setting the PENDING flag only needs to be done before
   inserting into bh_list to avoid double insertion (and of course needs to
   be done atomically); for this purpose, QSLIST_INSERT_HEAD_ATOMIC needs to
   be "release" (which it is).

Also the call to aio_notify() in aio_bh_enqueue() is unconditional, so
aio_bh_dequeue() need not protect against missed calls to aio_notify().
aio_notify() only synchronizes with aio_poll() and aio_notify_accept().

for synchronization point (2)
- This cannot be just a smp_rmb() because the timeout that was computed
   earlier was not ordered against either notified or notify_me.

- This is a smp_mb() for generality; as far as bh_list is
   concerned it could be smp_mb__before_rmw().

Synchronization point (3) is pretty mundane in comparison.

So I'm dropping this patch; I have prepared a documentation patch instead.

Paolo


