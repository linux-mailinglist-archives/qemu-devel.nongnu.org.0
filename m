Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4C63323AE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 12:11:21 +0100 (CET)
Received: from localhost ([::1]:45922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJaGm-0007Vm-RT
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 06:11:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJa5C-0002P2-MD
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:59:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJa5A-0005Tu-RP
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:59:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615287559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yRxvsKmNncV8gIbdVotOotnEES0pzldxGy8qKwFrEho=;
 b=JvKG2RFgRPeKV6TqgY+l+EMK523vnmgm5Rz0fnZpCVRRZDOgFIB34StDq3ShqwzZt3tnoG
 hLJaCJimQGPzUzWIfCIPickBipkJOq4881yg63RPn7dT7dK/P488l3xL2gvL8F1dEtVzxY
 fHjrbOE2xowwLct4AZhhbu95emwBito=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-5vVClVc8OymrxOt76nJcag-1; Tue, 09 Mar 2021 05:59:16 -0500
X-MC-Unique: 5vVClVc8OymrxOt76nJcag-1
Received: by mail-ej1-f71.google.com with SMTP id en21so5465825ejc.2
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 02:59:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yRxvsKmNncV8gIbdVotOotnEES0pzldxGy8qKwFrEho=;
 b=gw3XMUMT5e9LwobI/nApSGVh4JCIKFxIATYWZgCKGogXnF4TFU3TICpPjkmDV/Ooo9
 3GUhaBSK2lPKoS1/+hZX4+fvspl3lsFTlZ7S64YHi/9/57gQ9Cfjm7ku7LDmDa6MPuM8
 ixusvqVNzwZZptGovPo8/Zu3zCW+1NkQ4Pk1gdxumHjZiY6SYmCFRp3ZWaLylf4C/lBO
 cT0Y1Tlao9CNp2tezDbBkAf59UGkQbZmRMr+FOS1NUCdW8XPi6XwL8NOb+emQ6QLZu++
 Udrh24G73AKyVMMZ1KdFCWUhKR1O1Oq9pfgrUhlmk/9DNq9nhMiyTXaiEwmiIIZ4ZZyI
 e5zw==
X-Gm-Message-State: AOAM531CuDhtbhgmxdJGPgLJESXvRtgnycuGQtUO1DhDiYOUReCS80dR
 Pk5PuImryhlTrcN45YQgnr2zj/e2DooE0bgl7dtwuOI0qx0jTIQVzLAafc4oCO1PZYlSpsHCvvl
 AinwCSQ6HOrz0lYo=
X-Received: by 2002:a17:906:938f:: with SMTP id
 l15mr19436263ejx.15.1615287554906; 
 Tue, 09 Mar 2021 02:59:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznyub/crQRN/XENIHLOSwbnmDeeAGtikZrPAykFShyORkRtbppdBfjpySupGO2CcNbZIUM1w==
X-Received: by 2002:a17:906:938f:: with SMTP id
 l15mr19436240ejx.15.1615287554658; 
 Tue, 09 Mar 2021 02:59:14 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p3sm8102760ejd.7.2021.03.09.02.59.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 02:59:14 -0800 (PST)
Subject: Re: [RFC PATCH 4/4] coroutine/rwlock: Wake writers in preference to
 readers
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
References: <20210309102157.365356-1-david.edmondson@oracle.com>
 <20210309102157.365356-5-david.edmondson@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d2e118ce-2d86-b53b-c698-c0fa7afc5428@redhat.com>
Date: Tue, 9 Mar 2021 11:59:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210309102157.365356-5-david.edmondson@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/03/21 11:21, David Edmondson wrote:
> A feature of the current rwlock is that if multiple coroutines hold a
> reader lock, all must be runnable. The unlock implementation relies on
> this, choosing to wake a single coroutine when the final read lock
> holder exits the critical section, assuming that it will wake a
> coroutine attempting to acquire a write lock.
> 
> The downgrade implementation violates this assumption by creating a
> read lock owning coroutine that is exclusively runnable - any other
> coroutines that are waiting to acquire a read lock are *not* made
> runnable when the write lock holder converts its ownership to read
> only.
> 
> As a result of this, a coroutine that downgrades a write lock can
> later cause unlock to wake a coroutine that is attempting to acquire a
> read lock rather than one aiming for a write lock, should the
> coroutines be so ordered in the wait queue.
> 
> If the wait queue contains both read hopefuls and write hopefuls, any
> read hopeful coroutine that is woken will immediately go back onto the
> wait queue when it attempts to acquire the rwlock, due to the pending
> write acquisition. At this point there are no coroutines holding
> either read or write locks and no way for the coroutines in the queue
> to be made runnable. A hang ensues.
> 
> Address this by using separate queues for coroutines attempting to
> acquire read and write ownership of the rwlock. When unlocking, prefer
> to make runnable a coroutine that is waiting for a write lock, but if
> none is available, make all coroutines waiting to take a read lock
> runnable.
> 
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>

This is certainly the simplest solution, I like it.  And if I understand 
it correctly, doing this instead in unlock:

         if (lock->reader || !qemu_co_queue_next(&lock->wqueue)) {
             qemu_co_queue_restart_all(&lock->rqueue);

would be incorrect because readers could starve writers.

Regarding this particular bug, do you think you could write a testcase too?

Thanks,

Paolo

> ---
>   include/qemu/coroutine.h   |  8 +++++---
>   util/qemu-coroutine-lock.c | 24 +++++++++++++++---------
>   2 files changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
> index 84eab6e3bf..3dfbf57faf 100644
> --- a/include/qemu/coroutine.h
> +++ b/include/qemu/coroutine.h
> @@ -241,7 +241,8 @@ typedef struct CoRwlock {
>       int pending_writer;
>       int reader;
>       CoMutex mutex;
> -    CoQueue queue;
> +    CoQueue rqueue;
> +    CoQueue wqueue;
>   } CoRwlock;
>   
>   /**
> @@ -283,8 +284,9 @@ void qemu_co_rwlock_downgrade(CoRwlock *lock);
>   void qemu_co_rwlock_wrlock(CoRwlock *lock);
>   
>   /**
> - * Unlocks the read/write lock and schedules the next coroutine that was
> - * waiting for this lock to be run.
> + * Unlocks the read/write lock and schedules the next coroutine that
> + * was waiting for this lock to be run, preferring to wake one
> + * attempting to take a write lock over those taking a read lock.
>    */
>   void qemu_co_rwlock_unlock(CoRwlock *lock);
>   
> diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
> index eb73cf11dc..c05c143142 100644
> --- a/util/qemu-coroutine-lock.c
> +++ b/util/qemu-coroutine-lock.c
> @@ -330,7 +330,8 @@ void coroutine_fn qemu_co_mutex_unlock(CoMutex *mutex)
>   void qemu_co_rwlock_init(CoRwlock *lock)
>   {
>       memset(lock, 0, sizeof(*lock));
> -    qemu_co_queue_init(&lock->queue);
> +    qemu_co_queue_init(&lock->rqueue);
> +    qemu_co_queue_init(&lock->wqueue);
>       qemu_co_mutex_init(&lock->mutex);
>   }
>   
> @@ -341,7 +342,7 @@ void qemu_co_rwlock_rdlock(CoRwlock *lock)
>       qemu_co_mutex_lock(&lock->mutex);
>       /* For fairness, wait if a writer is in line.  */
>       while (lock->pending_writer) {
> -        qemu_co_queue_wait(&lock->queue, &lock->mutex);
> +        qemu_co_queue_wait(&lock->rqueue, &lock->mutex);
>       }
>       lock->reader++;
>       qemu_co_mutex_unlock(&lock->mutex);
> @@ -356,17 +357,22 @@ void qemu_co_rwlock_unlock(CoRwlock *lock)
>   
>       assert(qemu_in_coroutine());
>       if (!lock->reader) {
> -        /* The critical section started in qemu_co_rwlock_wrlock.  */
> -        qemu_co_queue_restart_all(&lock->queue);
> +        /* The critical section started in qemu_co_rwlock_wrlock or
> +         * qemu_co_rwlock_upgrade.
> +         */
> +        qemu_co_queue_restart_all(&lock->wqueue);
> +        qemu_co_queue_restart_all(&lock->rqueue);
>       } else {
>           self->locks_held--;
>   
>           qemu_co_mutex_lock(&lock->mutex);
>           lock->reader--;
>           assert(lock->reader >= 0);
> -        /* Wakeup only one waiting writer */
> -        if (!lock->reader) {
> -            qemu_co_queue_next(&lock->queue);
> +        /* If there are no remaining readers wake one waiting writer
> +         * or all waiting readers.
> +         */
> +        if (!lock->reader && !qemu_co_queue_next(&lock->wqueue)) {
> +            qemu_co_queue_restart_all(&lock->rqueue);
>           }
>       }
>       qemu_co_mutex_unlock(&lock->mutex);
> @@ -392,7 +398,7 @@ void qemu_co_rwlock_wrlock(CoRwlock *lock)
>       qemu_co_mutex_lock(&lock->mutex);
>       lock->pending_writer++;
>       while (lock->reader) {
> -        qemu_co_queue_wait(&lock->queue, &lock->mutex);
> +        qemu_co_queue_wait(&lock->wqueue, &lock->mutex);
>       }
>       lock->pending_writer--;
>   
> @@ -411,7 +417,7 @@ void qemu_co_rwlock_upgrade(CoRwlock *lock)
>       lock->reader--;
>       lock->pending_writer++;
>       while (lock->reader) {
> -        qemu_co_queue_wait(&lock->queue, &lock->mutex);
> +        qemu_co_queue_wait(&lock->wqueue, &lock->mutex);
>       }
>       lock->pending_writer--;
>   
> 


