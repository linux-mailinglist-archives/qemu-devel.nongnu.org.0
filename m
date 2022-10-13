Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7774C5FDE1B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 18:19:49 +0200 (CEST)
Received: from localhost ([::1]:46608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj0w0-00021B-3b
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 12:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oj0lk-00040A-6M
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 12:09:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oj0ld-0001yb-Nt
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 12:09:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665677343;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=leyKLtTle6ifyTQdD7AoLitHYCvc39TIR0GIwLYuNbA=;
 b=DSxNyf76ormYJnH2xRyvzTQikmP5vp8zqGydG3DcG0+9YzLhR8+PQsyCYBtjhes/i7Cn9h
 7c+ECM8bUwZZQ4IzRz4xrSEL0Eyx3RXOjjsS+PvFT3VgIvNHSuzU0lskN6PmqEH818kCGy
 H7FQLywj7IYJhR7ux6dBLUbNtydo7bY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-52-i7ckINzyN32QEXs1tkhrEA-1; Thu, 13 Oct 2022 12:08:59 -0400
X-MC-Unique: i7ckINzyN32QEXs1tkhrEA-1
Received: by mail-wm1-f69.google.com with SMTP id
 r132-20020a1c448a000000b003c3a87d8abdso1425446wma.2
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 09:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=leyKLtTle6ifyTQdD7AoLitHYCvc39TIR0GIwLYuNbA=;
 b=y4404k03dOpAt2yS2ZQ8PH9J0NNzw+hRQdY0L6vKydBH5qEuF7DXT+1+T3B/MdIilN
 XczrZaPHXSW5sjCoPaszKXlg+oF6BWwsfyivK2X592MU6G7FFr4jREpAX/kqH+74oNjP
 nB8OoR9pROarT1w3Mfbg99hU42VPAze5mAMJfXH8jaNDnE7vvueLmKJ0Q5FCGP6Aog3A
 QJ5UCM4r1Ws22yk/qaC9vWAPvdJxKEQ8WkskHAmY3A3Eko1ZGKSI5aQIKzcXg63Rzcki
 xG3n3pRMGinpOfAwzeviEJfNN88GnxZGQA9cl3/rHwcmFgp8GDV4VTalfCK1/NgdvchC
 cDrw==
X-Gm-Message-State: ACrzQf3lTnVvzABQfoUaUF/4lHg9ELKKj1Ttsh7gsC0T7XSrgs6++luN
 Z1/f9e2rilaLK2bhdC1iDiNaRy+nxDCRbFYcOjEw6Kj+iObENhnA/CIuewLDHtOYsjk2D1XpgcV
 g69R9aGi7I/8vKvk=
X-Received: by 2002:a05:6000:112:b0:22e:58ce:40d4 with SMTP id
 o18-20020a056000011200b0022e58ce40d4mr482024wrx.193.1665677338199; 
 Thu, 13 Oct 2022 09:08:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5CevI8FTIx1J0WcTY9O+qnRPuF4OcoExU4DzG+tlco3dlsjXxIjYwW3AKqEgtbL/OWSpCJCg==
X-Received: by 2002:a05:6000:112:b0:22e:58ce:40d4 with SMTP id
 o18-20020a056000011200b0022e58ce40d4mr481993wrx.193.1665677337864; 
 Thu, 13 Oct 2022 09:08:57 -0700 (PDT)
Received: from localhost (static-88-175-6-89.ipcom.comunitel.net.
 [89.6.175.88]) by smtp.gmail.com with ESMTPSA id
 c17-20020adffb11000000b002305cfb9f3dsm2337233wrr.89.2022.10.13.09.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 09:08:57 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,  Fam Zheng
 <fam@euphon.net>,  qemu-s390x@nongnu.org,  Cornelia Huck
 <cohuck@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,  Laurent Vivier
 <lvivier@redhat.com>,  John Snow <jsnow@redhat.com>,  "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>,  Christian Borntraeger
 <borntraeger@linux.ibm.com>,  Halil Pasic <pasic@linux.ibm.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  qemu-block@nongnu.org,  Eric Farman
 <farman@linux.ibm.com>,  Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,  Avihai Horon <avihaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>,  qemu-devel@nongnu.org
Subject: Re: [RFC 7/7] migration: call qemu_savevm_state_pending_exact()
 with the guest stopped
In-Reply-To: <bf945182-5c73-b1cc-13b2-5594bc21823f@oracle.com> (Joao Martins's
 message of "Thu, 13 Oct 2022 13:25:10 +0100")
References: <20221003031600.20084-1-quintela@redhat.com>
 <20221003031600.20084-8-quintela@redhat.com>
 <bf945182-5c73-b1cc-13b2-5594bc21823f@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Thu, 13 Oct 2022 18:08:56 +0200
Message-ID: <87ilknemef.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Joao Martins <joao.m.martins@oracle.com> wrote:
> +Avihai, +Jason
>
> On 03/10/2022 04:16, Juan Quintela wrote:
>> HACK ahead.
>> 
>> There are devices that require the guest to be stopped to tell us what
>> is the size of its state. 
>
> "... and have transferred said device state" if we are talking current vfio.

Yeap.

> We can't query size of the data_fd right now

Oops.  My understanding was that once the guest is stopped you can say
how big is it.  That is a deal breaker.  We can't continue if we don't
know the size.  Copying the whole state to know the size looks too much.

> It would need a @data_size in addition to @data_fd in
> vfio_device_feature_mig_state, or getting fseek supported over the fd

Ok, we can decided how to do it, but I think that putting fseek into it
will only make things more complicated.

>> So we need to stop the vm "before" we
>> cal the functions.
>> 
>> It is a hack because:
>> - we are "starting" the guest again to stop it in migration_complete()
>>   I know, I know, but it is not trivial to get all the information
>>   easily to migration_complete(), so this hack.
>> 
>
> Could you expand on that? Naively, I was assuming that by 'all information' the
> locally stored counters in migration_iteration_run() that aren't present in
> MigrateState?

This is not related to vfio at all.

The problem is that current code assumes that the guest is still
running, and then do qemu_mutex_lock_iothread() and unlock() inside the
pending handlers.  To stop the guest, we need to lock the iothread
first.  So this was going to hang.  I fixed it doing the lock/unlock
twice.  That is the hack.  I will change the callers once that we decide
what is the right path ahead.  This is not a problem related to vfio. it
is a problem related about how we can stop/resume guests programatically
in the middle of qemu code.

>> - auto_converge test fails with this hack.  I think that it is related
>>   to previous problem.  We start the guest when it is supposed to be
>>   stopped for convergence reasons.
>> 
>> - All experiments that I did to do the proper thing failed with having
>>   the iothread_locked() or try to unlock() it when not locked.
>> 
>> - several of the pending functions are using the iothread lock
>>   themselves, so I need to split it to have two versions (one for the
>>   _estimate() case with the iothread lock), and another for the
>>   _exact() case without the iothread_lock().  I want comments about
>>   this approach before I try to continue on this direction.
>> 
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>  migration/migration.c        | 13 +++++++++++++
>>  tests/qtest/migration-test.c |  3 ++-
>>  2 files changed, 15 insertions(+), 1 deletion(-)
>> 
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 35e512887a..7374884818 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -3742,7 +3742,20 @@ static MigIterateState migration_iteration_run(MigrationState *s)
>>      trace_migrate_pending_estimate(pending_size, s->threshold_size, pend_pre, pend_post);
>>  
>>      if (pend_pre <= s->threshold_size) {
>> +        int old_state = s->state;
>> +        qemu_mutex_lock_iothread();
>> +        // is this really necessary?  it works for me both ways.
>> +        qemu_system_wakeup_request(QEMU_WAKEUP_REASON_OTHER, NULL);
>> +        s->vm_was_running = runstate_is_running();
>> +        vm_stop_force_state(RUN_STATE_FINISH_MIGRATE);
>> +        qemu_mutex_unlock_iothread();
>>          qemu_savevm_state_pending_exact(&pend_pre, &pend_post);
>> +        qemu_mutex_lock_iothread();
>> +        runstate_set(old_state);
>> +        if (s->vm_was_running) {
>> +            vm_start();
>> +        }
>> +        qemu_mutex_unlock_iothread();
>
> Couldn't we just have an extra patch that just stores pend_pre and pending_size
> in MigrateState, which would allow all this check to be moved into
> migration_completion(). Or maybe that wasn't an option for some other reason?

This is not an option, because we don't have a way to get back from
migration_completion() to migrate_iteration_run() if there is not enough
space to send all the state.

> Additionally what about having a migration helper function that
> vfio_save_complete_precopy() callback needs to use into to check if the
> expected-device state size meets the threshold/downtime as it is saving the
> device state and otherwise fail earlier accordingly when saving beyond the
> threshold?

That is what I tried to do with the code.
See patch 4. ram.c

How I have two functions:
- ram_state_pending_estimate()
- ram_state_pending_exact()

1st should work without any locking, i.e. just best estimation without
too much work, second should give the real value.

What we had discussed before for vfio is that the device will "cache"
the value returned from previous ram_state_pending_exact().


> It would allow supporting both the (current UAPI) case where you need to
> transfer the state to get device state size (so checking against threshold_size
> pending_pre constantly would allow to not violate the SLA) as well as any other
> UAPI improvement to fseek()/data_size that lets you fail even earlier.
>
> Seems like at least it keeps some of the rules (both under iothread lock) as
> this patch

Coming to worse thing, you need to read the state into a local buffer
and then calculate the size in exact?  Looks overkill, but in your case,
I can't see other way to do it.

My understanding was that for new hardware you have an easy way to
calculate this value "if the guest was stopped".

My next series are a way to do in parallel the read/send of the state
with respect to the migration_thread(), but that is a different
problem.  I need a way to calculate sizes to start with, otherwise  I
have no way to decide if I can enter the completion stage (or for old
devices one can lie and assume than size is zero, but then you are going
to have bigger downtimes).

Later, Juan.


