Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0FC650729
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 05:24:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p77gc-0003u4-CP; Sun, 18 Dec 2022 23:23:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p77gZ-0003tg-Gd
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 23:23:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p77gX-0004hg-7g
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 23:23:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671423807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xOB3vQA7ND3PFsC5qtGVSC1yB4cR0KyYxshcpgXE1nE=;
 b=D0PkvU22bsPlhj1D7Mw375dknJkbc7cwvzxWEbe/i9gwQ4vE+2R9UFmoPkht0nQXae/3eq
 bJQXqhYxnSRy9IeW6ZRvC8uCfXHOY0Fz4IR6oq5HkipXt1v3ucTDgqw/8T283nE2Ck/+bR
 p/qm8NKeyVcB+itKrg5qR0mjZfcGWDY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-OJjZyo04M0uIsx3Nqo1Ojw-1; Sun, 18 Dec 2022 23:23:26 -0500
X-MC-Unique: OJjZyo04M0uIsx3Nqo1Ojw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D69DA101A521
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 04:23:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F10D14171C7;
 Mon, 19 Dec 2022 04:23:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6A28C21E688F; Mon, 19 Dec 2022 05:23:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH 4/4] coroutine: Break inclusion loop
References: <20221208142306.2642640-1-armbru@redhat.com>
 <20221208142306.2642640-5-armbru@redhat.com>
 <2ac0daae-da25-0a31-9a73-8f186cc510e9@redhat.com>
 <CABgObfZ4_8MzP4HP1JNjKb=C0qTXY3zHK=zK+=pYBt3hSYjiGQ@mail.gmail.com>
 <878rj9cgap.fsf@pond.sub.org>
 <49afb7cb-c3e0-2966-65aa-2ead9c2e7d9d@redhat.com>
Date: Mon, 19 Dec 2022 05:23:24 +0100
In-Reply-To: <49afb7cb-c3e0-2966-65aa-2ead9c2e7d9d@redhat.com> (Paolo
 Bonzini's message of "Sat, 17 Dec 2022 13:42:01 +0100")
Message-ID: <87o7s010oz.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 12/15/22 07:49, Markus Armbruster wrote:
>>> linux-user/ does not use coroutines, so I'd like to avoid that it
>>> includes qemu/coroutine.h.
>> They include it even before the patch, via lockable.h.
>
> They do but there's a difference between "including lockable.h and implic=
tly getting coroutine.h due to dependencies" and "including=20
> coroutine.h when you really wanted QEMU_LOCK_GUARD()".
>
>> My patch actually enables*not*  including coroutine.h: with it applied,
>> including lockable.h no longer gets you coroutine.h as well.
>> If you include lockable.h and make use of certain macros, the compile
>> fails, and you fix it by including coroutine.h instead like pretty much
>> everything else.  Is this really too objectionable to be committed?
>
> s/certain macros/all macros/.  All you can do is qemu_lockable_lock/unloc=
k, which is the less common usage of=20
> qemu/lockable.h:
>
> - qemu_lockable_lock/unlock: used in include/qemu/seqlock.h, tests/unit/t=
est-coroutine.c, util/qemu-coroutine-lock.c
>
> - QEMU_LOCK_GUARD and WITH_QEMU_LOCK_GUARD are used in 49 files.
>
>>>> 1) qemu/coroutine.h keeps including qemu/lockable.h
>>
>> As in my patch.
>
> That's where the similarity ends. :)
>
>>>> 2) qemu/lockable.h is modified as follows to omit the reference to CoM=
utex:
>>>>
>>>> diff --git a/include/qemu/lockable.h b/include/qemu/lockable.h
>>>> index 86db7cb04c9c..db59656538a4 100644
>>>> --- a/include/qemu/lockable.h
>>>> +++ b/include/qemu/lockable.h
>>>> @@ -71,9 +71,11 @@ qemu_null_lockable(void *x)
>>>>                 void *: qemu_null_lockable(x),                        =
     \
>>>>                 QemuMutex *: qemu_make_lockable(x, QML_OBJ_(x, mutex))=
,    \
>>>>                 QemuRecMutex *: qemu_make_lockable(x, QML_OBJ_(x,
>>>> rec_mutex)), \
>>>> -             CoMutex *: qemu_make_lockable(x, QML_OBJ_(x, co_mutex)),=
   \
>>>> +             QEMU_MAKE_CO_MUTEX_LOCKABLE(x)                          =
   \
>>>>                 QemuSpin *: qemu_make_lockable(x, QML_OBJ_(x, spin)))
>>>>
>>>> +#define QEMU_MAKE_CO_MUTEX_LOCKABLE(x)
>>>> +
>>>>    /**
>>>>     * QEMU_MAKE_LOCKABLE_NONNULL - Make a polymorphic QemuLockable
>>>>     *
>>>>
>>>> 3) the following hack is added in qemu/coroutine.h, right after includ=
ing
>>>> qemu/lockable.h:
>>>>
>>>> #undef QEMU_MAKE_CO_MUTEX_LOCKABLE(x)
>>>> #define QEMU_MAKE_CO_MUTEX_LOCKABLE(x) \
>>>>                CoMutex *: qemu_make_lockable(x, QML_OBJ_(x, co_mutex)),
>>
>> Let me see...  if I include just lockable.h and make use of certain
>> (generic) macro(s), the macro(s) won't have a case for QemuMutex *.
>> Using them with a QemuMutex * argument won't compile.
>
> s/QemuMutex/CoMutex/.  That is, you get the CoMutex case only if you incl=
ude qemu/coroutine.h.  Which you probably did anyway, because=20
> CoMutexes are almost always embedded (not used as pointers).  In fact I s=
uspect the above trick also makes it possible to remove CoMutex from=20
> qemu/typedefs.h.
>
> Furthermore, using qemu_lockable_lock/unlock with CoMutexes still works, =
even if you don't include qemu/coroutine.h, just like in your patch.
>
>>>> Neither is particularly pretty, so I vote for leaving things as is with
>>>> a comment above the two #include directives.
>>
>> Inlusion loops are landmines.  Evidence: the compilation failure Phil
>> ran in, leading to his
>>      Subject: [PATCH-for-8.0] coroutine: Add missing <qemu/atomic.h> inc=
lude
>>      Message-Id:<20221125175532.48858-1-philmd@linaro.org>
>> Your macro hack I find too off-putting =F0=9F=98=84
>
> I think the macro is much better than nerfing qemu/lockable.h.

The core of the problem is that lockable.h wants to provide _Generic()
with a CoMutex case if CoMutex exists.

The solution you proposed approximates this as follows.  lockable.h
makes the case configurable, default off.  coroutine.h configures it to
on, and includes lockable.h.  Works as long as we include only
coroutine.h, or coroutine.h before lockable.h.  Falls apart if we
include lockable.h, and only then coroutine.h.

For a robust solution, we'd need to enable lockable.h to detect "this
compilation unit may use coroutines".  Could CONFIG_USB_ONLY be pressed
into service?

> Another alternative is to add a new header qemu/lockable-protos.h and mov=
e qemu_co_mutex_{lock,unlock} there (possibly other prototypes as=20
> well).  Then include it from both qemu/lockable.h and qemu/coroutine.h.

Only from lockable.h, because coroutine.h gets it via lockable.h, right?

Lazy^Wpragmatic solution: move the coroutine.h parts lockable.h needs to
lockable.h.  As far as I can tell:

    typedef CoMutex (unless we keep it in typedefs.h)
    qemu_co_mutex_lock()
    qemu_co_mutex_unlock()

Could throw in

    qemu_co_mutex_init()
    qemu_co_mutex_assert_locked()

to avoid splitting the co_mutex interface.

If keeping this in lockable.h bothers you, we could create comutex.h for
it.

Can't see what adding more to the new header would buy us (other than
arguments on how to name it).  Happy to be enlightened there, of course.


