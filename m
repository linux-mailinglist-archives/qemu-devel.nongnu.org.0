Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 573886A8651
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:26:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlkg-0008I8-1I; Thu, 02 Mar 2023 11:25:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pXlka-0008Hk-Gh
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:25:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pXlkY-0005dW-Pg
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:25:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b4WPbRMBOFKaDs1ZyZPJSHLdourZbLMy/2MFND3b99o=;
 b=bGdX9exd28hsOWx3w4rZE042RGmHuyTY6Ybw5daNEeNIMcVAwtqnLWk4oxCn43AJMarcdu
 7MQ2mfDjj3udUJdJXbaYFupDOiEegKqhQLck2fdpMr6c1Yhe29UL321ENGdszOp0foKL0w
 PbyCCnfbuNhgeOdZjfZxdv/u1eLHpHY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-12PGdMCcP6GSQ4pdsxSTFQ-1; Thu, 02 Mar 2023 11:25:43 -0500
X-MC-Unique: 12PGdMCcP6GSQ4pdsxSTFQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABA39299E74E;
 Thu,  2 Mar 2023 16:25:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A1BB492C3E;
 Thu,  2 Mar 2023 16:25:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4A7D321E6A1F; Thu,  2 Mar 2023 17:25:41 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,  qemu-devel@nongnu.org,  Fam
 Zheng <fam@euphon.net>,  qemu-block@nongnu.org,  Emanuele Giuseppe
 Esposito <eesposit@redhat.com>,  Kevin Wolf <kwolf@redhat.com>,  "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>,  Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 5/6] hmp: convert handle_hmp_command() to
 AIO_WAIT_WHILE_UNLOCKED()
References: <20230301205801.2453491-1-stefanha@redhat.com>
 <20230301205801.2453491-6-stefanha@redhat.com>
 <87ttz3sju0.fsf@pond.sub.org> <20230302132205.GB2485531@fedora>
 <87v8jjjiwx.fsf@pond.sub.org> <20230302154834.GA2497705@fedora>
Date: Thu, 02 Mar 2023 17:25:41 +0100
In-Reply-To: <20230302154834.GA2497705@fedora> (Stefan Hajnoczi's message of
 "Thu, 2 Mar 2023 10:48:34 -0500")
Message-ID: <87jzzzi0hm.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Stefan Hajnoczi <stefanha@redhat.com> writes:

> On Thu, Mar 02, 2023 at 04:02:22PM +0100, Markus Armbruster wrote:
>> Stefan Hajnoczi <stefanha@redhat.com> writes:
>> 
>> > On Thu, Mar 02, 2023 at 08:17:43AM +0100, Markus Armbruster wrote:
>> >> Stefan Hajnoczi <stefanha@redhat.com> writes:
>> >> 
>> >> > The HMP monitor runs in the main loop thread. Calling
>> >> 
>> >> Correct.
>> >> 
>> >> > AIO_WAIT_WHILE(qemu_get_aio_context(), ...) from the main loop thread is
>> >> > equivalent to AIO_WAIT_WHILE_UNLOCKED(NULL, ...) because neither unlocks
>> >> > the AioContext and the latter's assertion that we're in the main loop
>> >> > succeeds.
>> >> >
>> >> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>> >> > ---
>> >> >  monitor/hmp.c | 2 +-
>> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >> >
>> >> > diff --git a/monitor/hmp.c b/monitor/hmp.c
>> >> > index 2aa85d3982..5ecbdac802 100644
>> >> > --- a/monitor/hmp.c
>> >> > +++ b/monitor/hmp.c
>> >> > @@ -1167,7 +1167,7 @@ void handle_hmp_command(MonitorHMP *mon, const char *cmdline)
>> >> >          Coroutine *co = qemu_coroutine_create(handle_hmp_command_co, &data);
>> >> >          monitor_set_cur(co, &mon->common);
>> >> >          aio_co_enter(qemu_get_aio_context(), co);
>> >> > -        AIO_WAIT_WHILE(qemu_get_aio_context(), !data.done);
>> >> > +        AIO_WAIT_WHILE_UNLOCKED(NULL, !data.done);
>> >> >      }
>> >> >  
>> >> >      qobject_unref(qdict);
>> >> 
>> >> Acked-by: Markus Armbruster <armbru@redhat.com>
>> >> 
>> >> For an R-by, I need to understand this in more detail.  I'm not familiar
>> >> with the innards of AIO_WAIT_WHILE() & friends, so I need to go real
>> >> slow.
>> >> 
>> >> We change
>> >> 
>> >>     ctx from qemu_get_aio_context() to NULL
>> >>     unlock from true to false
>> >> 
>> >> in
>> >> 
>> >>     bool waited_ = false;                                          \
>> >>     AioWait *wait_ = &global_aio_wait;                             \
>> >>     AioContext *ctx_ = (ctx);                                      \
>> >>     /* Increment wait_->num_waiters before evaluating cond. */     \
>> >>     qatomic_inc(&wait_->num_waiters);                              \
>> >>     /* Paired with smp_mb in aio_wait_kick(). */                   \
>> >>     smp_mb();                                                      \
>> >>     if (ctx_ && in_aio_context_home_thread(ctx_)) {                \
>> >>         while ((cond)) {                                           \
>> >>             aio_poll(ctx_, true);                                  \
>> >>             waited_ = true;                                        \
>> >>         }                                                          \
>> >>     } else {                                                       \
>> >>         assert(qemu_get_current_aio_context() ==                   \
>> >>                qemu_get_aio_context());                            \
>> >>         while ((cond)) {                                           \
>> >>             if (unlock && ctx_) {                                  \
>> >>                 aio_context_release(ctx_);                         \
>> >>             }                                                      \
>> >>             aio_poll(qemu_get_aio_context(), true);                \
>> >>             if (unlock && ctx_) {                                  \
>> >>                 aio_context_acquire(ctx_);                         \
>> >>             }                                                      \
>> >>             waited_ = true;                                        \
>> >>         }                                                          \
>> >>     }                                                              \
>> >>     qatomic_dec(&wait_->num_waiters);                              \
>> >>     waited_; })
>> >> 
>> >> qemu_get_aio_context() is non-null here, correct?
>> >
>> > qemu_get_aio_context() always returns the main loop thread's AioContext.
>> 
>> So it's non-null.
>
> Yes. Sorry, I should have answered directly :).
>
>> > qemu_get_current_aio_context() returns the AioContext that was most
>> > recently set in the my_aiocontext thread-local variable for IOThreads,
>> > the main loop's AioContext for BQL threads, or NULL for threads
>> > that don't use AioContext at all.
>> >
>> >> What's the value of in_aio_context_home_thread(qemu_get_aio_context())?
>> >
>> > This function checks whether the given AioContext is associated with
>> > this thread. In a BQL thread it returns true if the context is the main
>> > loop's AioContext. In an IOThread it returns true if the context is the
>> > IOThread's AioContext. Otherwise it returns false.
>> 
>> I guess that means in_aio_context_home_thread(qemu_get_aio_context()) is
>> true in the main thread.
>> 
>> Before the patch, the if's condition is true, and we execute
>> 
>>            while ((cond)) {                                           \
>>                aio_poll(ctx_, true);                                  \
>>                waited_ = true;                                        \
>>            }                                                          \
>> 
>> Afterwards, it's false, and we execute
>> 
>> >>     }                                                              \
>> >>     qatomic_dec(&wait_->num_waiters);                              \
>> >>     waited_; })
>> >> 
>> >> qemu_get_aio_context() is non-null here, correct?
>> >
>> > qemu_get_aio_context() always returns the main loop thread's AioContext.
>> 
>> So it's non-null.
>> 
>> > qemu_get_current_aio_context() returns the AioContext that was most
>> > recently set in the my_aiocontext thread-local variable for IOThreads,
>> > the main loop's AioContext for BQL threads, or NULL for threads
>> > that don't use AioContext at all.
>> >
>> >> What's the value of in_aio_context_home_thread(qemu_get_aio_context())?
>> >
>> > This function checks whether the given AioContext is associated with
>> > this thread. In a BQL thread it returns true if the context is the main
>> > loop's AioContext. In an IOThread it returns true if the context is the
>> > IOThread's AioContext. Otherwise it returns false.
>> 
>> I guess that means in_aio_context_home_thread(qemu_get_aio_context()) is
>> true in the main thread.
>
> Yes.
>
>> Before the patch, the if's condition is true, and we execute
>> 
>>            while ((cond)) {                                           \
>>                aio_poll(ctx_, true);                                  \
>>                waited_ = true;                                        \
>>            }                                                          \
>> 
>> Afterwards, it's false, and we instead execute
>> 
>>            assert(qemu_get_current_aio_context() ==                   \
>>                   qemu_get_aio_context());                            \
>>            while ((cond)) {                                           \
>>                if (unlock && ctx_) {                                  \
>>                    aio_context_release(ctx_);                         \
>>                }                                                      \
>>                aio_poll(qemu_get_aio_context(), true);                \
>>                if (unlock && ctx_) {                                  \
>>                    aio_context_acquire(ctx_);                         \
>>                }                                                      \
>>                waited_ = true;                                        \
>>            }                                                          \
>> 
>> The assertion is true: both operands of == are the main loop's
>> AioContext.
>
> Yes.
>
>> The if conditions are false, because unlock is.
>> 
>> Therefore, we execute the exact same code.
>> 
>> All correct?
>
> Yes, exactly.

Thank you!

Reviewed-by: Markus Armbruster <armbru@redhat.com>


