Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C515A347DEE
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 17:43:08 +0100 (CET)
Received: from localhost ([::1]:41688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP6b5-0004IB-PM
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 12:43:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lP6Ya-0002qA-Cz
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 12:40:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lP6YY-0008HK-ER
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 12:40:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616604028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xj0AxuyLo6ShzN+jZj0Mzs+Dnj7XOpZD5DfmliXvEMg=;
 b=ZWW/vcmEu0r3OUAh7ARxVkzMwP+vzjbi8d2TjOMBd/5Pr1ORxFuOUra90aaPizrstkmfxR
 Jz4ueIkkjpBPb8OF7Mgh474NmFH1Ne/DUsrNThdxb791DqcKV7bmTNIwIw1V1hZh0U1wM8
 EG07kx6K1x+X3/c+5BRkRSfYoXAELio=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-gMfo0VS3OzmKSYkAFicgNQ-1; Wed, 24 Mar 2021 12:40:26 -0400
X-MC-Unique: gMfo0VS3OzmKSYkAFicgNQ-1
Received: by mail-wr1-f72.google.com with SMTP id z6so1315433wrh.11
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 09:40:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xj0AxuyLo6ShzN+jZj0Mzs+Dnj7XOpZD5DfmliXvEMg=;
 b=uOuo/O5sPQF05nDNoVFk+KclsfRHuLhkhdDT4klSdfNs0orZAuvuLf1ojfwLQKYpbn
 AkaCxvjyUOR6fTD2EbdjYbGF7hhRjsEdR3u43H7iqfQPT2mPSy3WV3TuIdFFgTcrT2FJ
 xS7jgGXq0NtY79/r3aKkvj4Em9Q58zMxA3o/Pbmy0/BXFAJJbB7K2hgb0q5YmsSane2w
 Gil1qTgCX2P4CKQkk/dBN1gw18UAexLyANVNFeqYWKVMrJUsmHyqd/bar2unnHJ+/T2G
 1OC4mgkwsUU5iI53U3RW0pgmRqD2T8eoNIGsiqMYp31dIPY2fZD18njuDZZigQIYbSNO
 D5yw==
X-Gm-Message-State: AOAM532H0gcwR/az3Gxh9kvQKGlJ/NA9mzbCKaGhYGiF6fL11kWJBlWn
 3PUyHj1lDBRTMmQosuEUhBMlUmRV1EAi7kCVGXTqygSmlItbp4v/F7bk8mxgBt5CSvrZF2zsabp
 pdTj+01Yxz2hZMf4=
X-Received: by 2002:adf:e843:: with SMTP id d3mr4506248wrn.56.1616604025308;
 Wed, 24 Mar 2021 09:40:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0mDLXVa5ERRZR49tVQhOq07h4zYJJE5QdLQzOih8QccZAxF0u13MP0YI8XGDU4AcSipfEdw==
X-Received: by 2002:adf:e843:: with SMTP id d3mr4506228wrn.56.1616604025063;
 Wed, 24 Mar 2021 09:40:25 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j14sm3628584wrw.69.2021.03.24.09.40.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 09:40:24 -0700 (PDT)
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <20210317180013.235231-1-pbonzini@redhat.com>
 <20210317180013.235231-5-pbonzini@redhat.com>
 <YFtlm2+gainm8rox@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 4/6] coroutine-lock: reimplement CoRwlock to fix downgrade
 bug
Message-ID: <94d7cc02-6da9-1160-9c02-45146671638e@redhat.com>
Date: Wed, 24 Mar 2021 17:40:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YFtlm2+gainm8rox@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: david.edmondson@oracle.com, kwolf@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/03/21 17:15, Stefan Hajnoczi wrote:
> On Wed, Mar 17, 2021 at 07:00:11PM +0100, Paolo Bonzini wrote:
>> +static void qemu_co_rwlock_maybe_wake_one(CoRwlock *lock)
>> +{
>> +    CoRwTicket *tkt = QSIMPLEQ_FIRST(&lock->tickets);
>> +    Coroutine *co = NULL;
>> +
>> +    /*
>> +     * Setting lock->owners here prevents rdlock and wrlock from
>> +     * sneaking in between unlock and wake.
>> +     */
>> +
>> +    if (tkt) {
>> +        if (tkt->read) {
>> +            if (lock->owners >= 0) {
>> +                lock->owners++;
>> +                co = tkt->co;
>> +            }
>> +        } else {
>> +            if (lock->owners == 0) {
>> +                lock->owners = -1;
>> +                co = tkt->co;
>> +            }
>> +        }
>> +    }
>> +
>> +    if (co) {
>> +        QSIMPLEQ_REMOVE_HEAD(&lock->tickets, next);
>> +        qemu_co_mutex_unlock(&lock->mutex);
>> +        aio_co_wake(co);
> 
> I find it hard to reason about QSIMPLEQ_EMPTY(&lock->tickets) callers
> that execute before co is entered. They see an empty queue even though a
> coroutine is about to run. Updating owners above ensures that the code
> correctly tracks the state of the rwlock, but I'm not 100% confident
> about this aspect of the code.

Good point.  The invariant when lock->mutex is released should be 
clarified; a better way to phrase the comment above "if (tkt)" is:

The invariant when lock->mutex is released is that every ticket is 
tracked in either lock->owners or lock->tickets.  By updating 
lock->owners here, rdlock/wrlock/upgrade will block even if they execute 
between qemu_co_mutex_unlock and aio_co_wake.

>> -    self->locks_held--;
>> +        lock->owners--;
>> +        QSIMPLEQ_INSERT_TAIL(&lock->tickets, &my_ticket, next);
>> +        qemu_co_rwlock_maybe_wake_one(lock);
>> +        qemu_coroutine_yield();
>> +        assert(lock->owners == -1);
> 
> lock->owners is read outside lock->mutex here. Not sure if this can
> cause problems.

True.  It is okay though because lock->owners cannot change until this 
coroutine unlocks.  A worse occurrence of the issue is in rdlock:

         assert(lock->owners >= 1);

         /* Possibly wake another reader, which will wake the next in 
line.  */
         qemu_co_mutex_lock(&lock->mutex);

where the assert should be moved after taking the lock, or possibly 
changed to use qatomic_read.  (I prefer the former).

> locks_held is kept unchanged across qemu_coroutine_yield() even though
> the read lock has been released. rdlock() and wrlock() only increment
> locks_held after acquiring the rwlock.
> 
> In practice I don't think it matters, but it seems inconsistent. If
> locks_held is supposed to track tickets (not just coroutines currently
> holding a lock), then rdlock() and wrlock() should increment before
> yielding.

locks_held (unlike owners) is not part of the lock, it's part of the 
Coroutine and only used for debugging (asserting that terminating 
coroutines are not holding any lock).

Paolo


