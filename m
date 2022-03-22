Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D870D4E447C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 17:46:45 +0100 (CET)
Received: from localhost ([::1]:40446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWhee-0006AP-Mr
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 12:46:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWhbp-0003Rr-Pc
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:43:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWhbn-0001Xm-V6
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:43:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647967427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6xkt2QT5/9L7XnUNnuE3MDXANt+r20rg5iJKFn8wdMI=;
 b=d4RX3/kuwkieFtfJJQ+wo4yYuJb4li2iG/gIU0zw3HG5Aqs0xA/9BXRGfLy4Kvv4stpOsx
 Qr+TcXo4tEiPWLUVO0FJCSaPGfFSOihST41Bmqdr0h8ORXOk2RHGbKmLxl0QAFJOFEv2vR
 5/EcMo3XZcfw6EZFgGFFZ9dVsWx8gnY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610--4DBV6vjNgi92Zaomy7uGQ-1; Tue, 22 Mar 2022 12:43:44 -0400
X-MC-Unique: -4DBV6vjNgi92Zaomy7uGQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 j67-20020adf9149000000b00203e6b7d151so3191498wrj.13
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 09:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6xkt2QT5/9L7XnUNnuE3MDXANt+r20rg5iJKFn8wdMI=;
 b=caOp9qq4GQ6qKvmlIWNqaJr9ek6OdxeFXdpPYkeCrIFEncR5h6cC99zyXFpq5Q36mG
 TlOuki48hjAm6LNO4IAneFamOAE9cmobHsawufYEyxRhVYe8U41YETXgOWSrEUo5l1ux
 tXSD4ulaXED8PH+vIvvwQ59XF/EWnwdOWpvxQ/bSo3jIZwL1iZKMFy1VKMmVSM8cpsIH
 DlVfK6WERDcND4AdU4wkdKttf83nak5IYqK4MsVNQZzfz5PyZrP/wkJtLt1aZdwikdN6
 pNaHrD4ZTfteoR3MXq0/rw697RUsSL664BfwbyjaAqn0lQnF/cjKDTrOTyxkCwHvlMAK
 t/0A==
X-Gm-Message-State: AOAM531N8QCquPe0jiOoeSqCALszZmKoCAGPjr+cYZ0NrfUWjRuKSTtI
 9Gx5E19nV0382xD4QiYjfOKGqkKSyhSxi5N/Y1X8+wnQlOq1bMB7ZtBRra0+4PIvLeggaPM2Qx0
 Y8lxQo1bg/PXaVhA=
X-Received: by 2002:a05:600c:4fcb:b0:389:a82b:8f8a with SMTP id
 o11-20020a05600c4fcb00b00389a82b8f8amr4660696wmq.167.1647967422673; 
 Tue, 22 Mar 2022 09:43:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykyCyZXlnZYp3vNEVQDGDs8cXrmugk+whmhUyzcXXyPY+W6Ej3h+DKomTWqZp08Wcvv3vBTQ==
X-Received: by 2002:a05:600c:4fcb:b0:389:a82b:8f8a with SMTP id
 o11-20020a05600c4fcb00b00389a82b8f8amr4660672wmq.167.1647967422396; 
 Tue, 22 Mar 2022 09:43:42 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:de00:549e:e4e4:98df:ff72?
 (p200300cbc708de00549ee4e498dfff72.dip0.t-ipconnect.de.
 [2003:cb:c708:de00:549e:e4e4:98df:ff72])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adfbd8d000000b002040daf5dffsm9982350wrh.18.2022.03.22.09.43.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 09:43:42 -0700 (PDT)
Message-ID: <4cf0654d-8e2f-8f5d-73f9-d0592c0eaa2f@redhat.com>
Date: Tue, 22 Mar 2022 17:43:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] softmmu/physmem: Use qemu_madvise
To: Andrew Deason <adeason@sinenomine.net>
References: <20220316040405.4131-1-adeason@sinenomine.net>
 <9c36fe6b-39e1-0bfc-d2bb-97b106828ee1@redhat.com>
 <CAFEAcA96=yDKOknYmCKriWDJe4g-q07+b8yL3tFUf9=G-o84zA@mail.gmail.com>
 <YjGvvRvPRV3ACbFY@work-vm> <a9f31184-f157-e973-5c75-0af327fc2921@redhat.com>
 <20220322113949.d297e615317fa34894de8ed2@sinenomine.net>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220322113949.d297e615317fa34894de8ed2@sinenomine.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.03.22 17:39, Andrew Deason wrote:
> On Wed, 16 Mar 2022 10:41:41 +0100
> David Hildenbrand <david@redhat.com> wrote:
> 
>> On 16.03.22 10:37, Dr. David Alan Gilbert wrote:
>>> * Peter Maydell (peter.maydell@linaro.org) wrote:
>>>> On Wed, 16 Mar 2022 at 07:53, David Hildenbrand <david@redhat.com> wrote:
>>>>>
>>>>> On 16.03.22 05:04, Andrew Deason wrote:
>>>>>> We have a thin wrapper around madvise, called qemu_madvise, which
>>>>>> provides consistent behavior for the !CONFIG_MADVISE case, and works
>>>>>> around some platform-specific quirks (some platforms only provide
>>>>>> posix_madvise, and some don't offer all 'advise' types). This specific
>>>>>> caller of madvise has never used it, tracing back to its original
>>>>>> introduction in commit e0b266f01dd2 ("migration_completion: Take
>>>>>> current state").
>>>>>>
>>>>>> Call qemu_madvise here, to follow the same logic as all of our other
>>>>>> madvise callers. This slightly changes the behavior for
>>>>>> !CONFIG_MADVISE (EINVAL instead of ENOSYS, and a slightly different
>>>>>> error message), but this is now more consistent with other callers
>>>>>> that use qemu_madvise.
>>>>>>
>>>>>> Signed-off-by: Andrew Deason <adeason@sinenomine.net>
>>>>>> ---
>>>>>> Looking at the history of commits that touch this madvise() call, it
>>>>>> doesn't _look_ like there's any reason to be directly calling madvise vs
>>>>>> qemu_advise (I don't see anything mentioned), but I'm not sure.
>>>>>>
>>>>>>  softmmu/physmem.c | 12 ++----------
>>>>>>  1 file changed, 2 insertions(+), 10 deletions(-)
>>>>>>
>>>>>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>>>>>> index 43ae70fbe2..900c692b5e 100644
>>>>>> --- a/softmmu/physmem.c
>>>>>> +++ b/softmmu/physmem.c
>>>>>> @@ -3584,40 +3584,32 @@ int ram_block_discard_range(RAMBlock *rb, uint64_t start, size_t length)
>>>>>>                           rb->idstr, start, length, ret);
>>>>>>              goto err;
>>>>>>  #endif
>>>>>>          }
>>>>>>          if (need_madvise) {
>>>>>>              /* For normal RAM this causes it to be unmapped,
>>>>>>               * for shared memory it causes the local mapping to disappear
>>>>>>               * and to fall back on the file contents (which we just
>>>>>>               * fallocate'd away).
>>>>>>               */
>>>>>> -#if defined(CONFIG_MADVISE)
>>>>>>              if (qemu_ram_is_shared(rb) && rb->fd < 0) {
>>>>>> -                ret = madvise(host_startaddr, length, QEMU_MADV_REMOVE);
>>>>>> +                ret = qemu_madvise(host_startaddr, length, QEMU_MADV_REMOVE);
>>>>>>              } else {
>>>>>> -                ret = madvise(host_startaddr, length, QEMU_MADV_DONTNEED);
>>>>>> +                ret = qemu_madvise(host_startaddr, length, QEMU_MADV_DONTNEED);
>>>>>
>>>>> posix_madvise(QEMU_MADV_DONTNEED) has completely different semantics
>>>>> then madvise() -- it's not a discard that we need here.
>>>>>
>>>>> So ram_block_discard_range() would now succeed in environments (BSD?)
>>>>> where it's supposed to fail.
>>>>>
>>>>> So AFAIKs this isn't sane.
>>>>
>>>> But CONFIG_MADVISE just means "host has madvise()"; it doesn't imply
>>>> "this is a Linux madvise() with MADV_DONTNEED". Solaris madvise()
>>>> doesn't seem to have  MADV_DONTNEED at all; a quick look at the
>>>> FreeBSD manpage suggests its madvise MADV_DONTNEED is identical
>>>> to its posix_madvise MADV_DONTNEED.
>>>>
>>>> If we need "specifically Linux MADV_DONTNEED semantics" maybe we
>>>> should define a QEMU_MADV_LINUX_DONTNEED which either (a) does the
>>>> right thing or (b) fails, and use qemu_madvise() regardless.
>>>>
>>>> Certainly the current code is pretty fragile to being changed by
>>>> people who don't understand the undocumented subtlety behind
>>>> the use of a direct madvise() call here.
>>>
>>> Yeh and I'm not sure I can remembe rall the subtleties; there's a big
>>> hairy set of ifdef's in include/qemu/madvise.h that makes
>>> sure we always have the definition of QEMU_MADV_REMOVE/DONTNEED
>>> even on platforms that might not define it themselves.
>>>
>>> But I think this code is used for things with different degrees
>>> of care about the semantics; e.g. 'balloon' just cares that
>>> it frees memory up and doesn't care about the detailed semantics
>>> that much; so it's probably fine with that.
>>> Postcopy is much more touchy, but then it's only going to be
>>> calling this on Linux anyway (because of the userfault dependency).
>>
>> MADV_DONTNEED/MADV_REMOVE only provides discard semantics on Linux IIRC
>> -- and that's what we want to achieve: ram_block_discard_range()
>>
>> So I agree with Peter that we might want to make this more explicit.
> 
> I was looking at the comments/history around this code to try to make
> this more explicit/clear, and it seems like the whole function is very
> Linux-specific. All we ever do is:
> 
> - fallocate(FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE)
> - madvise(MADV_REMOVE)
> - madvise(MADV_DONTNEED) with Linux semantics
> 
> All of those operations are Linux-only, so trying to figure out the
> cross-platform way to model this seems kind of pointless. Is it fine to
> just #ifdef the whole thing to be just for Linux?
> 

Fine with me, as long as it compiles on other OSs :)

-- 
Thanks,

David / dhildenb


