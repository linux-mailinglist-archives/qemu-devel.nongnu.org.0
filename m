Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB39A64D6B0
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 07:51:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5i3u-0000SC-2C; Thu, 15 Dec 2022 01:49:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5i3r-0000Ry-8B
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 01:49:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5i3p-000794-59
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 01:49:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671086979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DfMpec4Y7GJlrP9FEttI6Z8fgz6Bwg2GUuRDG/ZGdoY=;
 b=IhHysNBwc+msk7/ATqDKOzhluc30iD02/Jv+eDxJOK2xD3hqj3vxy2r+ua+00ani5NgjQ5
 X6+F4aXOplCZgh1PDLYmRx+Qn5w65BO57LUrb7XSmMb1XtbWb3SoyuQ9sG+cj66eU3UoqQ
 FUxmf3vxW2cVsiP8jMU2d0xF+kj1u6Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-RKeKZ13QOJm_3BLRSF69Jw-1; Thu, 15 Dec 2022 01:49:38 -0500
X-MC-Unique: RKeKZ13QOJm_3BLRSF69Jw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC11429AA39C
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 06:49:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 922D9C15BA0;
 Thu, 15 Dec 2022 06:49:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7C50521E6900; Thu, 15 Dec 2022 07:49:34 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH 4/4] coroutine: Break inclusion loop
References: <20221208142306.2642640-1-armbru@redhat.com>
 <20221208142306.2642640-5-armbru@redhat.com>
 <2ac0daae-da25-0a31-9a73-8f186cc510e9@redhat.com>
 <CABgObfZ4_8MzP4HP1JNjKb=C0qTXY3zHK=zK+=pYBt3hSYjiGQ@mail.gmail.com>
Date: Thu, 15 Dec 2022 07:49:34 +0100
In-Reply-To: <CABgObfZ4_8MzP4HP1JNjKb=C0qTXY3zHK=zK+=pYBt3hSYjiGQ@mail.gmail.com>
 (Paolo Bonzini's message of "Tue, 13 Dec 2022 01:34:42 +0100")
Message-ID: <878rj9cgap.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

> dropped qemu-devel by mistake.
>
> Paolo
>
>
> Il lun 12 dic 2022, 23:16 Paolo Bonzini <pbonzini@redhat.com> ha scritto:
>
>> On 12/8/22 15:23, Markus Armbruster wrote:
>> > qemu/coroutine.h and qemu/lockable.h include each other.  Neither
>> > header actually needs the other one.
>>
>> qemu/lockable.h wants qemu/coroutine.h because of the reference to
>> qemu_co_mutex_lock/unlock in the QEMU_MAKE_LOCKABLE macro.  Said
>> reference only happens when the macro is used, so strictly speaking
>> only code that uses of qemu/lockable.h's functionality needs to
>> include qemu/coroutine.h.  The order doesn't matter.
>>
>> qemu/coroutine.h similarly wants qemu/lockable.h only for a macro: it
>> uses QemuLockable for the prototype of qemu_co_queue_wait_impl, but
>> QemuLockable is defined in qemu/typedefs.h.  On the other hand, the
>> qemu_co_queue_wait macro needs QEMU_MAKE_LOCKABLE.  Again, the order
>> does not matter but callers of qemu_co_queue_wait appreciate it if
>> both files are included.
>>
>> So, this is why the inclusion loop works.  This patch makes some
>> files include qemu/coroutine.h even if they only need qemu/lockable.h
>> for QEMU_LOCK_GUARD of a "regular" QemuMutex; for example, linux-user/
>> does not use coroutines, so I'd like to avoid that it includes
>> qemu/coroutine.h.

They include it even before the patch, via lockable.h.

My patch actually enables *not* including coroutine.h: with it applied,
including lockable.h no longer gets you coroutine.h as well.

If you include lockable.h and make use of certain macros, the compile
fails, and you fix it by including coroutine.h instead like pretty much
everything else.  Is this really too objectionable to be committed?

>> One way is to just keep the cycle.  Another is to break the cycle is
>> as follows:
>>
>> 1) qemu/coroutine.h keeps including qemu/lockable.h

As in my patch.

>> 2) qemu/lockable.h is modified as follows to omit the reference to CoMutex:
>>
>> diff --git a/include/qemu/lockable.h b/include/qemu/lockable.h
>> index 86db7cb04c9c..db59656538a4 100644
>> --- a/include/qemu/lockable.h
>> +++ b/include/qemu/lockable.h
>> @@ -71,9 +71,11 @@ qemu_null_lockable(void *x)
>>                void *: qemu_null_lockable(x),                             \
>>                QemuMutex *: qemu_make_lockable(x, QML_OBJ_(x, mutex)),    \
>>                QemuRecMutex *: qemu_make_lockable(x, QML_OBJ_(x,
>> rec_mutex)), \
>> -             CoMutex *: qemu_make_lockable(x, QML_OBJ_(x, co_mutex)),   \
>> +             QEMU_MAKE_CO_MUTEX_LOCKABLE(x)                             \
>>                QemuSpin *: qemu_make_lockable(x, QML_OBJ_(x, spin)))
>>
>> +#define QEMU_MAKE_CO_MUTEX_LOCKABLE(x)
>> +
>>   /**
>>    * QEMU_MAKE_LOCKABLE_NONNULL - Make a polymorphic QemuLockable
>>    *
>>
>> 3) the following hack is added in qemu/coroutine.h, right after including
>> qemu/lockable.h:
>>
>> #undef QEMU_MAKE_CO_MUTEX_LOCKABLE(x)
>> #define QEMU_MAKE_CO_MUTEX_LOCKABLE(x) \
>>               CoMutex *: qemu_make_lockable(x, QML_OBJ_(x, co_mutex)),

Let me see...  if I include just lockable.h and make use of certain
(generic) macro(s), the macro(s) won't have a case for QemuMutex *.
Using them with a QemuMutex * argument won't compile.

>> Neither is particularly pretty, so I vote for leaving things as is with
>> a comment above the two #include directives.

Inlusion loops are landmines.  Evidence: the compilation failure Phil
ran in, leading to his

    Subject: [PATCH-for-8.0] coroutine: Add missing <qemu/atomic.h> include
    Message-Id: <20221125175532.48858-1-philmd@linaro.org>

Your macro hack I find too off-putting :)

>>> Drop #include "qemu/coroutine.h" from qemu/lockable.h to break the
>>> loop.  All users of lockable.h actually need qemu/coroutine.h, so
>>> adjust their #include directives.
>>> 
>>> I'm not dropping the #include "qemu/lockable.h" from qemu/coroutine.h,
>>> because that would require adding it back next to #include
>>> "qemu/coroutine.h" all over the place.  It's in an unusual place,
>>> though.  Move it to the usual place, next to the other #include
>>> directives.
>>> 
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>


