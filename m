Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4F04DAE4D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 11:34:34 +0100 (CET)
Received: from localhost ([::1]:44898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUQzB-0002OU-NB
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 06:34:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nUQA9-0006Zo-7s
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:41:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nUQA6-00068N-64
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:41:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647423705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=258d0ZbWHeRdqXE2RpGVfsbpAX/wzxCh2HHtEeQVWZ8=;
 b=BckVunDgliSS8YwzP4OXXWoQVVPv3nxBe4diD7g1Sr8slvpyT6r3I+kEQ13cWtu1nIx10f
 gmC/z0ZR/9wPtLA9OqtVAgs2kef/oyLwZ+rH0XeGzTbuWKlgHGk688+/KQ6isncGj5W/S9
 CRPlGZlZJKARBecbU+VjzsYYX7OAl2U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-uGETCTMMPwmrlqqfXo5oMA-1; Wed, 16 Mar 2022 05:41:44 -0400
X-MC-Unique: uGETCTMMPwmrlqqfXo5oMA-1
Received: by mail-wm1-f72.google.com with SMTP id
 r9-20020a1c4409000000b0038c15a1ed8cso521745wma.7
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 02:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=258d0ZbWHeRdqXE2RpGVfsbpAX/wzxCh2HHtEeQVWZ8=;
 b=fKqi634lwYcfAy9Yjs9NuJjuUza29iLN2FoPLxu/IBQuHjgS9lZSALjfk03VA2QxvF
 XBmrc3h6CcYtX9cmTrCg2XytuA7j2WHOvS/GY++1kAZnypeXJA5UZEPLhEPX7qbCNIYD
 Sz0JPf52YJGeKC78XHJLRGcmanYZg78KLin8omoLESpPASb3n/zblDB5x9nmh+ep39uF
 6IAO7yydcKBveCVjuUxTWwaIbKK/t2lsM5Zu6lp2CvejvJF5W5TbtuSvhxecBa2acoue
 5dGdO/RKyymnjUrGUQYAD0LPh+Zm/in4Dbr/Dljiv3WGjUYoEX38M/z3qgTnP3nQ6K62
 WAtQ==
X-Gm-Message-State: AOAM533XIOFq/jRp7Kcp+67aP1acObczJ0NVo1ZiInP2OgfZQiJoMgv5
 rVtmDNl6yDJu74kvdBVAfJ87sHlAUMiPu2Ql49lIPjfjecntOjNhy4+FRz1RmCnfUg++4imjFBk
 JhEH8As9Vft6QU88=
X-Received: by 2002:a5d:6f0d:0:b0:203:dc69:2e69 with SMTP id
 ay13-20020a5d6f0d000000b00203dc692e69mr2594639wrb.533.1647423702925; 
 Wed, 16 Mar 2022 02:41:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgjvJ6P+AaL74QPPBDpQ9yo0zP/XOCtWZS8buGtNywLfHTO5bsxRFLhTy3yY1M0Zx/lAXIZw==
X-Received: by 2002:a5d:6f0d:0:b0:203:dc69:2e69 with SMTP id
 ay13-20020a5d6f0d000000b00203dc692e69mr2594622wrb.533.1647423702659; 
 Wed, 16 Mar 2022 02:41:42 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:f900:aa79:cd25:e0:32d1?
 (p200300cbc706f900aa79cd2500e032d1.dip0.t-ipconnect.de.
 [2003:cb:c706:f900:aa79:cd25:e0:32d1])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c4f8f00b003842f011bc5sm4770680wmq.2.2022.03.16.02.41.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 02:41:42 -0700 (PDT)
Message-ID: <a9f31184-f157-e973-5c75-0af327fc2921@redhat.com>
Date: Wed, 16 Mar 2022 10:41:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] softmmu/physmem: Use qemu_madvise
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220316040405.4131-1-adeason@sinenomine.net>
 <9c36fe6b-39e1-0bfc-d2bb-97b106828ee1@redhat.com>
 <CAFEAcA96=yDKOknYmCKriWDJe4g-q07+b8yL3tFUf9=G-o84zA@mail.gmail.com>
 <YjGvvRvPRV3ACbFY@work-vm>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <YjGvvRvPRV3ACbFY@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Andrew Deason <adeason@sinenomine.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.03.22 10:37, Dr. David Alan Gilbert wrote:
> * Peter Maydell (peter.maydell@linaro.org) wrote:
>> On Wed, 16 Mar 2022 at 07:53, David Hildenbrand <david@redhat.com> wrote:
>>>
>>> On 16.03.22 05:04, Andrew Deason wrote:
>>>> We have a thin wrapper around madvise, called qemu_madvise, which
>>>> provides consistent behavior for the !CONFIG_MADVISE case, and works
>>>> around some platform-specific quirks (some platforms only provide
>>>> posix_madvise, and some don't offer all 'advise' types). This specific
>>>> caller of madvise has never used it, tracing back to its original
>>>> introduction in commit e0b266f01dd2 ("migration_completion: Take
>>>> current state").
>>>>
>>>> Call qemu_madvise here, to follow the same logic as all of our other
>>>> madvise callers. This slightly changes the behavior for
>>>> !CONFIG_MADVISE (EINVAL instead of ENOSYS, and a slightly different
>>>> error message), but this is now more consistent with other callers
>>>> that use qemu_madvise.
>>>>
>>>> Signed-off-by: Andrew Deason <adeason@sinenomine.net>
>>>> ---
>>>> Looking at the history of commits that touch this madvise() call, it
>>>> doesn't _look_ like there's any reason to be directly calling madvise vs
>>>> qemu_advise (I don't see anything mentioned), but I'm not sure.
>>>>
>>>>  softmmu/physmem.c | 12 ++----------
>>>>  1 file changed, 2 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>>>> index 43ae70fbe2..900c692b5e 100644
>>>> --- a/softmmu/physmem.c
>>>> +++ b/softmmu/physmem.c
>>>> @@ -3584,40 +3584,32 @@ int ram_block_discard_range(RAMBlock *rb, uint64_t start, size_t length)
>>>>                           rb->idstr, start, length, ret);
>>>>              goto err;
>>>>  #endif
>>>>          }
>>>>          if (need_madvise) {
>>>>              /* For normal RAM this causes it to be unmapped,
>>>>               * for shared memory it causes the local mapping to disappear
>>>>               * and to fall back on the file contents (which we just
>>>>               * fallocate'd away).
>>>>               */
>>>> -#if defined(CONFIG_MADVISE)
>>>>              if (qemu_ram_is_shared(rb) && rb->fd < 0) {
>>>> -                ret = madvise(host_startaddr, length, QEMU_MADV_REMOVE);
>>>> +                ret = qemu_madvise(host_startaddr, length, QEMU_MADV_REMOVE);
>>>>              } else {
>>>> -                ret = madvise(host_startaddr, length, QEMU_MADV_DONTNEED);
>>>> +                ret = qemu_madvise(host_startaddr, length, QEMU_MADV_DONTNEED);
>>>
>>> posix_madvise(QEMU_MADV_DONTNEED) has completely different semantics
>>> then madvise() -- it's not a discard that we need here.
>>>
>>> So ram_block_discard_range() would now succeed in environments (BSD?)
>>> where it's supposed to fail.
>>>
>>> So AFAIKs this isn't sane.
>>
>> But CONFIG_MADVISE just means "host has madvise()"; it doesn't imply
>> "this is a Linux madvise() with MADV_DONTNEED". Solaris madvise()
>> doesn't seem to have  MADV_DONTNEED at all; a quick look at the
>> FreeBSD manpage suggests its madvise MADV_DONTNEED is identical
>> to its posix_madvise MADV_DONTNEED.
>>
>> If we need "specifically Linux MADV_DONTNEED semantics" maybe we
>> should define a QEMU_MADV_LINUX_DONTNEED which either (a) does the
>> right thing or (b) fails, and use qemu_madvise() regardless.
>>
>> Certainly the current code is pretty fragile to being changed by
>> people who don't understand the undocumented subtlety behind
>> the use of a direct madvise() call here.
> 
> Yeh and I'm not sure I can remembe rall the subtleties; there's a big
> hairy set of ifdef's in include/qemu/madvise.h that makes
> sure we always have the definition of QEMU_MADV_REMOVE/DONTNEED
> even on platforms that might not define it themselves.
> 
> But I think this code is used for things with different degrees
> of care about the semantics; e.g. 'balloon' just cares that
> it frees memory up and doesn't care about the detailed semantics
> that much; so it's probably fine with that.
> Postcopy is much more touchy, but then it's only going to be
> calling this on Linux anyway (because of the userfault dependency).

MADV_DONTNEED/MADV_REMOVE only provides discard semantics on Linux IIRC
-- and that's what we want to achieve: ram_block_discard_range()

So I agree with Peter that we might want to make this more explicit.

-- 
Thanks,

David / dhildenb


