Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A79E687A20
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 11:25:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNWlp-00060d-S0; Thu, 02 Feb 2023 05:24:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNWln-0005y1-K7
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:24:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNWll-0006FY-Oq
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:24:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675333480;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=PLfYhgtGYXbTtraPHgFrlzL1PFJL1OCV+gO6YFhSSMQ=;
 b=WvnwAphAOux3asv98VYMkiRpds3IoJsXTuRxXhNPQH9bL6L7rVLL3Tc3hYrrqWIeGKlnJa
 j9cy2tK5jqr6espFu2sP1iwLSfWlz3iopJm1+sGq/gGgN6UPiprN2frNJJoEnxV7fTYkBl
 ylhWZSLVB4wO3KhiMzc9Vderiz3sSoc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-303-UawYPzNMNnWXuV5W4tWsbg-1; Thu, 02 Feb 2023 05:24:39 -0500
X-MC-Unique: UawYPzNMNnWXuV5W4tWsbg-1
Received: by mail-wm1-f72.google.com with SMTP id
 x10-20020a05600c21ca00b003dc5584b516so2584426wmj.7
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 02:24:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PLfYhgtGYXbTtraPHgFrlzL1PFJL1OCV+gO6YFhSSMQ=;
 b=IlRrqpNA3gjH0xHxdOzpU/BVh3e/XB5nOmFg1qRd+jpzh8Ij8t5jENq2YQQvG5pyon
 XeNeepwXIdM36DLvhI7aQuolDI7AjqRTA0h14oh6dChKVKX6jax+Mp6B0Rqxy7q5KfQE
 upvD7KbSkes1YdDqPdFXnhIKdrsqdYaxcipt4TgIyjrMv6VwbgXlaUZQ1PbMb/U8L3vC
 9hLroJjj/w3QOwDkfsjnIcrsbt7YPnqyNFFLXZ1Q7d5JvRdNeCVhbGi7K1wI37Jp5j+v
 Z4pRDyHalG3QN8GSyEx4cv5yoZLurN/kp3SnyHC2we6gODkpnD9FCU5NPOC2yDf6Z4yc
 jQPA==
X-Gm-Message-State: AO0yUKVV7UIP4cnps8lBQH4vH2YK0wx3OfJJiqs0zYx57Dtj24oboL7x
 uubIQB/vXsLb+hkltoH9v4KOOjs9QtnnF0XZM0JKcl9kcSIYX+39+y+ylI7BK+J7rrexsVkhlgd
 f5dxJ7njUheFLj7o=
X-Received: by 2002:a05:600c:5491:b0:3dc:16d3:8c95 with SMTP id
 iv17-20020a05600c549100b003dc16d38c95mr5544685wmb.30.1675333478216; 
 Thu, 02 Feb 2023 02:24:38 -0800 (PST)
X-Google-Smtp-Source: AK7set8QQT8kGtM8abH390ZT7SXjPGRm+5S91zr5PUwJQMca2nWkbdQRM7ZihYqtE11RZjwvhxwTbw==
X-Received: by 2002:a05:600c:5491:b0:3dc:16d3:8c95 with SMTP id
 iv17-20020a05600c549100b003dc16d38c95mr5544655wmb.30.1675333477959; 
 Thu, 02 Feb 2023 02:24:37 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 az24-20020a05600c601800b003dc4baaedd3sm4562012wmb.37.2023.02.02.02.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 02:24:37 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  John Snow
 <jsnow@redhat.com>,  Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>,  Christian Borntraeger
 <borntraeger@linux.ibm.com>,  Thomas Huth <thuth@redhat.com>,  Alex
 Williamson <alex.williamson@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-s390x@nongnu.org,  Halil Pasic <pasic@linux.ibm.com>,  Eric Farman
 <farman@linux.ibm.com>,  qemu-block@nongnu.org,  David Hildenbrand
 <david@redhat.com>,  Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PULL 5/5] migration: simplify migration_iteration_run()
In-Reply-To: <38da6faf-1d7f-66fc-b305-738a6e8dfaf1@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Tue, 31 Jan 2023 14:44:14 +0300")
References: <20230130080307.1792-1-quintela@redhat.com>
 <20230130080307.1792-6-quintela@redhat.com>
 <38da6faf-1d7f-66fc-b305-738a6e8dfaf1@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 11:24:36 +0100
Message-ID: <87mt5wtlej.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
> On 30.01.23 11:03, Juan Quintela wrote:
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> ---
>>   migration/migration.c | 24 ++++++++++++------------
>>   1 file changed, 12 insertions(+), 12 deletions(-)
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 594a42f085..644c61e91d 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -3764,23 +3764,23 @@ static MigIterateState migration_iteration_run(MigrationState *s)
>>                                       pend_pre, pend_compat, pend_post);
>>       }
>>   -    if (pending_size && pending_size >= s->threshold_size) {
>> -        /* Still a significant amount to transfer */
>> -        if (!in_postcopy && pend_pre <= s->threshold_size &&
>> -            qatomic_read(&s->start_postcopy)) {
>> -            if (postcopy_start(s)) {
>> -                error_report("%s: postcopy failed to start", __func__);
>> -            }
>> -            return MIG_ITERATE_SKIP;
>> -        }
>> -        /* Just another iteration step */
>> -        qemu_savevm_state_iterate(s->to_dst_file, in_postcopy);
>> -    } else {
>> +    if (pending_size < s->threshold_size) {
>
> to keep the logic, formally it should be "if (!pending_size || pending_size < s->threshold_size)"...



> Actually, could s->threshold_size be 0 here? Or, worth an assertion assert(s->threshold_size) ?

It is weird, but it could:

    bandwidth = (double)transferred / time_spent;
    s->threshold_size = bandwidth * s->parameters.downtime_limit;

That is the (real) only place when we set it, and if the network was
completely down, bandwidth could be zero.

But I think that it is better to explain in the other way.  What does
the current code do:

    if (too much dirty memory to converge)
        do another iteration
    else
        do final iteration

What the new code do is

    if (low enough memory to converge)
        do final iteration.

    do another iteration.

So, how we decide if we converge?
if pending_size < s->threshold_size

we "could" change it to pending_size <= s->threshold_size for the zero case


But I think that we would be shooting ourselves in the foot, because we
are having network trouble (only reason that s->theshold_size could be
zero) and we still have all the devices state to migrate.

And once that we enter that state, there is no way back, guest is
stopped in source and we are not able to send anything else.

So I think it is better this way.

What do you think?

Later, Juan.


