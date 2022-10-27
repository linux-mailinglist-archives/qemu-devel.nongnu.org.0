Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EBC60FFE4
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 20:13:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7Mu-0001D2-Qn; Thu, 27 Oct 2022 14:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7Ms-0001CI-Gw
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:12:38 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7Mq-0007W7-AD
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:12:38 -0400
Received: by mail-wr1-x42e.google.com with SMTP id z14so3580254wrn.7
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 11:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dSL44zFTq48FIyo918tjc0b5RnWiPIs0NybGjRBciRE=;
 b=dLzBGCJdES4SPuvEsPNZCat5eNbXHTAfgLlavTjTWQ8RhFHYaTCjEyJAifmGdPy/3P
 +0ZUoL9kcqMaZh1bFzRff0hdPhvFOKOV5AxtOoIrcLg8jSaw6WqeVh6CWTYQiAY8qQ2l
 qdwZrfjd5ZPG37Iflhf3jB+ZCbG1X4vIKfqYcxpNurld6/ofDuPg/tJHW+kjsaHrzqVk
 7kHrdPvY58UDLO5PYgIJ0JvnFf/IuC70PVCJNGaiiOQ6/G0Sa44rb72TtdukqzPilVjd
 zS//I2TPwnwu5bpCedFihhOeSem49Dl+5a77st/NhLpv0+9/ORz/Hx5R2mMD6bN3V4SZ
 tviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dSL44zFTq48FIyo918tjc0b5RnWiPIs0NybGjRBciRE=;
 b=h4njS2CyvepVShBT6y4F5+7rkcJEnUQzMmgrg6NcpytuBi//mDoGis7oSOvr8MSHDd
 ZLhtDltLGKd5bA87K/0cylO9QcrlMd6rNH6fuOBPrGN+uV9nVXe1mAowwy41TEHfL2LC
 tPMECYc6fug6Ee8yPNtfoPyeSiNfMAykEzCqS4YRZH22zqoLoS5v4xcx5l5rEqB2QxVQ
 C/o+escuCy4pBPmyU4qscZjEyTAiOu3RHJxM9qKpEO7f5eNAqsF7kAioiDt6urbkhunP
 yubE4gfLwwAZBW6j7qrsi5VQp0F2AyEFqnFtWtQI8VV850rVUqoazimEAO3xpHfpBued
 Zztg==
X-Gm-Message-State: ACrzQf1RPoAf00Z2vhgWRzqsRzQqFqoHKNxmB6m8M5ioV+ttXPwB7WDA
 ucu6GA5hqVesKc9etEg0SKvulg==
X-Google-Smtp-Source: AMsMyM58k7Vosh+Ev/0tohRDKiPVHc/TGW5TDlH7amtFhIzTqFdboJMYET3+bwLk8k6jAB8413yCpg==
X-Received: by 2002:a5d:6dad:0:b0:22e:734f:31b1 with SMTP id
 u13-20020a5d6dad000000b0022e734f31b1mr33427927wrs.11.1666894354294; 
 Thu, 27 Oct 2022 11:12:34 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g23-20020a7bc4d7000000b003b3307fb98fsm2045894wmk.24.2022.10.27.11.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 11:12:33 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3A0871FFB7;
 Thu, 27 Oct 2022 19:12:33 +0100 (BST)
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
 <20221006031113.1139454-23-richard.henderson@linaro.org>
 <87eduu4rzo.fsf@linaro.org>
 <4df39234-6697-61b8-6c56-1bd17b4f9fa8@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: Re: [PATCH 22/24] accel/tcg: Use interval tree for user-only page
 tracking
Date: Thu, 27 Oct 2022 16:59:11 +0100
In-reply-to: <4df39234-6697-61b8-6c56-1bd17b4f9fa8@linaro.org>
Message-ID: <87y1t1yw32.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> On 10/26/22 23:36, Alex Benn=C3=A9e wrote:
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>=20
>>> Finish weaning user-only away from PageDesc.
>>>
>>> Using an interval tree to track page permissions means that
>>> we can represent very large regions efficiently.
>>>
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/290
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/967
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1214
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   accel/tcg/internal.h           |   4 +-
>>>   accel/tcg/tb-maint.c           |  20 +-
>>>   accel/tcg/user-exec.c          | 614 ++++++++++++++++++++++-----------
>>>   tests/tcg/multiarch/test-vma.c |  22 ++
>>>   4 files changed, 451 insertions(+), 209 deletions(-)
>>>   create mode 100644 tests/tcg/multiarch/test-vma.c
>>>
>>> diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
>>> index 250f0daac9..c7e157d1cd 100644
>>> --- a/accel/tcg/internal.h
>>> +++ b/accel/tcg/internal.h
>>> @@ -24,9 +24,7 @@
>>>   #endif
>>>     typedef struct PageDesc {
>>> -#ifdef CONFIG_USER_ONLY
>>> -    unsigned long flags;
>>> -#else
>>> +#ifndef CONFIG_USER_ONLY
>>>       QemuSpin lock;
>>>       /* list of TBs intersecting this ram page */
>>>       uintptr_t first_tb;
>>> diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
>>> index 14e8e47a6a..694440cb4a 100644
>>> --- a/accel/tcg/tb-maint.c
>>> +++ b/accel/tcg/tb-maint.c
>>> @@ -68,15 +68,23 @@ static void page_flush_tb(void)
>> <snip>
>>>     int page_get_flags(target_ulong address)
>>>   {
>>> -    PageDesc *p;
>>> +    PageFlagsNode *p =3D pageflags_find(address, address);
>>>   -    p =3D page_find(address >> TARGET_PAGE_BITS);
>>> +    /*
>>> +     * See util/interval-tree.c re lockless lookups: no false positive=
s but
>>> +     * there are false negatives.  If we find nothing, retry with the =
mmap
>>> +     * lock acquired.
>>> +     */
>>>       if (!p) {
>>> -        return 0;
>>> +        if (have_mmap_lock()) {
>>> +            return 0;
>>> +        }
>>> +        mmap_lock();
>>> +        p =3D pageflags_find(address, address);
>>> +        mmap_unlock();
>>> +        if (!p) {
>>> +            return 0;
>>> +        }
>>>       }
>>>       return p->flags;
>> To avoid the brain twisting following locks and multiple return legs
>> how about this:
>>    int page_get_flags(target_ulong address)
>>    {
>>        PageFlagsNode *p =3D pageflags_find(address, address);
>>        /*
>>         * See util/interval-tree.c re lockless lookups: no false positiv=
es but
>>         * there are false negatives.  If we had the lock and found
>>         * nothing we are done, otherwise retry with the mmap lock acquir=
ed.
>>         */
>>        if (have_mmap_lock()) {
>>            return p ? p->flags : 0;
>>        }
>>        mmap_lock();
>>        p =3D pageflags_find(address, address);
>>        mmap_unlock();
>>        return p ? p->flags : 0;
>>    }
>
> I'm unwilling to put an expensive test like a function call
> (have_mmap_lock) before an inexpensive test like pointer !=3D NULL.

Is it really that more expensive?

> I don't see what's so brain twisting about the code as is.  The lock
> tightly surrounds a single statement, with a couple of pointer tests.

Sure, I guess I'm just trying to avoid having so many returns out of
the code at various levels of nesting. The page_get_target_data code is
harder to follow. What about:

int page_get_flags(target_ulong address)
{
    PageFlagsNode *p =3D pageflags_find(address, address);

    /*
     * See util/interval-tree.c re lockless lookups: no false positives but
     * there are false negatives.  If we had the lock and found
     * nothing we are done, otherwise retry with the mmap lock acquired.
     */
    if (p) {
        return p->flags;
    } else if (have_mmap_lock()) {
        return 0;
    }

    mmap_lock();
    p =3D pageflags_find(address, address);
    mmap_unlock();

    return p ? p->flags : 0;
}

and:

static IntervalTreeNode * new_target_data_locked(target_ulong region)
{
    IntervalTreeNode *n;
    TargetPageDataNode *t;

    t =3D g_new0(TargetPageDataNode, 1);
    n =3D &t->itree;
    n->start =3D region;
    n->last =3D region | ~TBD_MASK;
    interval_tree_insert(n, &targetdata_root);

    return n;
}

static inline void * get_target_data(IntervalTreeNode *n,
                                     target_ulong region, target_ulong page)
{
    TargetPageDataNode *t;
    t =3D container_of(n, TargetPageDataNode, itree);
    return t->data[(page - region) >> TARGET_PAGE_BITS];
}

void *page_get_target_data(target_ulong address)
{
    IntervalTreeNode *n;
    target_ulong page, region;

    page =3D address & TARGET_PAGE_MASK;
    region =3D address & TBD_MASK;

    n =3D interval_tree_iter_first(&targetdata_root, page, page);
    if (n) {
        return get_target_data(n, region, page);
    }

    /*
     * See util/interval-tree.c re lockless lookups: no false positives but
     * there are false negatives.  If we find nothing but had the lock
     * then we need a new node, otherwise try again under lock and
     * potentially allocate a new node.
     */
    if (have_mmap_lock()) {
        n =3D new_target_data_locked(region);
        return get_target_data(n, region, page);
    } else {
        mmap_lock();
        n =3D interval_tree_iter_first(&targetdata_root, page, page);

        if (!n) {
            n =3D new_target_data_locked(region);
        }
        mmap_unlock();
    }

    return get_target_data(n, region, page);
}

>
>>> +/*
>>> + * Test very large vma allocations.
>>> + * The qemu out-of-memory condition was within the mmap syscall itself.
>>> + * If the syscall actually returns with MAP_FAILED, the test succeeded.
>>> + */
>>> +#include <sys/mman.h>
>>> +
>>> +int main()
>>> +{
>>> +    int n =3D sizeof(size_t) =3D=3D 4 ? 32 : 45;
>>> +
>>> +    for (int i =3D 28; i < n; i++) {
>>> +        size_t l =3D (size_t)1 << i;
>>> +        void *p =3D mmap(0, l, PROT_NONE,
>>> +                       MAP_PRIVATE | MAP_ANONYMOUS | MAP_NORESERVE, -1=
, 0);
>>> +        if (p =3D=3D MAP_FAILED) {
>>> +            break;
>>> +        }
>>> +        munmap(p, l);
>>> +    }
>>> +    return 0;
>>> +}
>> So is the failure mode here we actually seg or bus out?
>
> SEGV or KILL (via oom) depending on the state of the system. If the
> host is *really* beefy, it may even complete but with an unreasonable
> timeout.
>
> r~


--=20
Alex Benn=C3=A9e

