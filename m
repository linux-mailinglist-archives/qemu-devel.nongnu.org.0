Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C853664F8F8
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 13:43:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6WW3-0005g4-Vk; Sat, 17 Dec 2022 07:42:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p6WW1-0005fw-QD
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 07:42:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p6WVz-00029D-QW
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 07:42:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671280926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jqe7mOLEQqBgYaUUXZJRcwPh8zMJ+hA7bMnDbX7AOvQ=;
 b=cDCE6jpXIt8g8mJatH8Wm5wguanUuwuhOShTe/2b5JkpTRRmoTROFMhvQ/lkUYuPFziLgh
 VVShNAHDXc4/Rf+5fz9+I1EszwTIeeQKyJ2XA9Pkq0T+bBLDLQx5u67NOGWAtnLB4LdUjh
 vhSTSjVzMaXl2Ty//duDr61ONf1XqDU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-264-bEstUFMYNeCUDFWGdhjZnw-1; Sat, 17 Dec 2022 07:42:04 -0500
X-MC-Unique: bEstUFMYNeCUDFWGdhjZnw-1
Received: by mail-ej1-f71.google.com with SMTP id
 oz11-20020a1709077d8b00b007c0dd8018b6so550143ejc.17
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 04:42:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jqe7mOLEQqBgYaUUXZJRcwPh8zMJ+hA7bMnDbX7AOvQ=;
 b=7i7MRzU8HngJNIr7xgmGrBLxhIFWc6v7Sp2TofhK1xbcKM8Wr5xxNSbXm/P1OOv/GR
 mxCK7HmZl5hFU9MBM4ps0GIpaOJwZk4tk2wh+oMe1Q97UipzlmObDrYRTYbgA8pQm/S6
 tcHMRAnpqAIaEGLSNV38hBk3EviE6zyShuYQnUZILaXF2X88vDWbgvRESe+xdHXGukGC
 9ln64nctxqEWW7GU2hK0BEvPXAF6RA72n1ZqK5xbPp/7njXkBTjjfYzI5e0YHKoBzZd/
 0zeDHz0PZqQUm7q+nol2tqaJv92Ac2gSzsQzn4Es5+YqulGz2q2XF8ZwxHvvMjVM97iQ
 sWdw==
X-Gm-Message-State: ANoB5pkwTJRhI8OQEuz8mM5NSoLx8wiTbtqNVgHwDwhU7oGrJJue4Z+P
 h5mNJEYPWuzXoKyy27OxfTHhSv80bkEc2t5qG9VyvCfkIH84sDSUEx+H4N5muXhXiZjyKi0Rtq4
 SKZ6xQ3ZtKfPlqeo=
X-Received: by 2002:a17:906:264e:b0:7c1:d50:6dd3 with SMTP id
 i14-20020a170906264e00b007c10d506dd3mr29182319ejc.36.1671280923532; 
 Sat, 17 Dec 2022 04:42:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5iyDfAPjYnkytzzn3hT6/eW3aaOwxyv+6gN+pcvBHFDICJdthWsNIADFBCBOup18uF2hiInA==
X-Received: by 2002:a17:906:264e:b0:7c1:d50:6dd3 with SMTP id
 i14-20020a170906264e00b007c10d506dd3mr29182300ejc.36.1671280923291; 
 Sat, 17 Dec 2022 04:42:03 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:e3ec:5559:7c5c:1928?
 ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.googlemail.com with ESMTPSA id
 mh11-20020a170906eb8b00b007ad69e9d34dsm1959454ejb.54.2022.12.17.04.42.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Dec 2022 04:42:02 -0800 (PST)
Message-ID: <49afb7cb-c3e0-2966-65aa-2ead9c2e7d9d@redhat.com>
Date: Sat, 17 Dec 2022 13:42:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 4/4] coroutine: Break inclusion loop
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
References: <20221208142306.2642640-1-armbru@redhat.com>
 <20221208142306.2642640-5-armbru@redhat.com>
 <2ac0daae-da25-0a31-9a73-8f186cc510e9@redhat.com>
 <CABgObfZ4_8MzP4HP1JNjKb=C0qTXY3zHK=zK+=pYBt3hSYjiGQ@mail.gmail.com>
 <878rj9cgap.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <878rj9cgap.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

On 12/15/22 07:49, Markus Armbruster wrote:
>> linux-user/ does not use coroutines, so I'd like to avoid that it
>> includes qemu/coroutine.h.
> 
> They include it even before the patch, via lockable.h.

They do but there's a difference between "including lockable.h and 
implictly getting coroutine.h due to dependencies" and "including 
coroutine.h when you really wanted QEMU_LOCK_GUARD()".

> My patch actually enables*not*  including coroutine.h: with it applied,
> including lockable.h no longer gets you coroutine.h as well.
> 
> If you include lockable.h and make use of certain macros, the compile
> fails, and you fix it by including coroutine.h instead like pretty much
> everything else.  Is this really too objectionable to be committed?

s/certain macros/all macros/.  All you can do is 
qemu_lockable_lock/unlock, which is the less common usage of 
qemu/lockable.h:

- qemu_lockable_lock/unlock: used in include/qemu/seqlock.h, 
tests/unit/test-coroutine.c, util/qemu-coroutine-lock.c

- QEMU_LOCK_GUARD and WITH_QEMU_LOCK_GUARD are used in 49 files.

>>> 1) qemu/coroutine.h keeps including qemu/lockable.h
>
> As in my patch.

That's where the similarity ends. :)

>>> 2) qemu/lockable.h is modified as follows to omit the reference to CoMutex:
>>>
>>> diff --git a/include/qemu/lockable.h b/include/qemu/lockable.h
>>> index 86db7cb04c9c..db59656538a4 100644
>>> --- a/include/qemu/lockable.h
>>> +++ b/include/qemu/lockable.h
>>> @@ -71,9 +71,11 @@ qemu_null_lockable(void *x)
>>>                 void *: qemu_null_lockable(x),                             \
>>>                 QemuMutex *: qemu_make_lockable(x, QML_OBJ_(x, mutex)),    \
>>>                 QemuRecMutex *: qemu_make_lockable(x, QML_OBJ_(x,
>>> rec_mutex)), \
>>> -             CoMutex *: qemu_make_lockable(x, QML_OBJ_(x, co_mutex)),   \
>>> +             QEMU_MAKE_CO_MUTEX_LOCKABLE(x)                             \
>>>                 QemuSpin *: qemu_make_lockable(x, QML_OBJ_(x, spin)))
>>>
>>> +#define QEMU_MAKE_CO_MUTEX_LOCKABLE(x)
>>> +
>>>    /**
>>>     * QEMU_MAKE_LOCKABLE_NONNULL - Make a polymorphic QemuLockable
>>>     *
>>>
>>> 3) the following hack is added in qemu/coroutine.h, right after including
>>> qemu/lockable.h:
>>>
>>> #undef QEMU_MAKE_CO_MUTEX_LOCKABLE(x)
>>> #define QEMU_MAKE_CO_MUTEX_LOCKABLE(x) \
>>>                CoMutex *: qemu_make_lockable(x, QML_OBJ_(x, co_mutex)),
>
> Let me see...  if I include just lockable.h and make use of certain
> (generic) macro(s), the macro(s) won't have a case for QemuMutex *.
> Using them with a QemuMutex * argument won't compile.

s/QemuMutex/CoMutex/.  That is, you get the CoMutex case only if you 
include qemu/coroutine.h.  Which you probably did anyway, because 
CoMutexes are almost always embedded (not used as pointers).  In fact I 
suspect the above trick also makes it possible to remove CoMutex from 
qemu/typedefs.h.

Furthermore, using qemu_lockable_lock/unlock with CoMutexes still works, 
even if you don't include qemu/coroutine.h, just like in your patch.

>>> Neither is particularly pretty, so I vote for leaving things as is with
>>> a comment above the two #include directives.
> Inlusion loops are landmines.  Evidence: the compilation failure Phil
> ran in, leading to his
> 
>      Subject: [PATCH-for-8.0] coroutine: Add missing <qemu/atomic.h> include
>      Message-Id:<20221125175532.48858-1-philmd@linaro.org>
> 
> Your macro hack I find too off-putting 😄

I think the macro is much better than nerfing qemu/lockable.h.

Another alternative is to add a new header qemu/lockable-protos.h and 
move qemu_co_mutex_{lock,unlock} there (possibly other prototypes as 
well).  Then include it from both qemu/lockable.h and qemu/coroutine.h.

Paolo


