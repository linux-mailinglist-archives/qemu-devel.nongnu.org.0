Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A19F6720D9
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 16:13:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIA6t-0005PB-SC; Wed, 18 Jan 2023 10:12:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pIA6s-0005P2-6S
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 10:12:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pIA6q-0000wi-IE
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 10:12:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674054735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZyMB5g3slpFbdSsfVsuAJsxuRkkUwAYUvg9l7gXVmeo=;
 b=XSG7kIm/f+MBGY/HylsgnhjupFh/5LFTMZDSPsyUyPnvgjPoH/pWsoA8Y3YGioXGxyzI/0
 gMYRd/p9nV8MDjzw1PQgrbqSv/1nOGBYZ5kcdFOxecYvwxHB8P986dUxHIGlQYBAbN2ExC
 pImDOKb0Lwbn6wr4ykl1kwPpxTnMtFM=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-248-kjKCxXEmPDeJzFt1i5lutg-1; Wed, 18 Jan 2023 10:12:13 -0500
X-MC-Unique: kjKCxXEmPDeJzFt1i5lutg-1
Received: by mail-yb1-f199.google.com with SMTP id
 a4-20020a5b0004000000b006fdc6aaec4fso38047550ybp.20
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 07:12:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZyMB5g3slpFbdSsfVsuAJsxuRkkUwAYUvg9l7gXVmeo=;
 b=OaZzT8SET6/dlQl9XpvSKNejOBTjC9d8jAki8qLbZF95WDURixDrFD8uMu1rQS/eeh
 +5RS5zhj8G9nmzdsHRRvjbCIoHjdJDixymLQqjxrojYh/i7JfimNdWuS2JJYtNkf+9nq
 1RZhTQVRXFUhWNgaPKApa8VPU9BtKDN01A1a/ZOCq5Kqe5cC/+DKjNaOp50cliOLUIZj
 7+xitPLLcvhQWYymEY9Uxvr/6Bl2qXqi+mG2MiDGxyTI/tLmXJaYpMeh3AnYny/3WuBR
 02HZxYnIiAjS8/437ByIFBHWeDAhbyz/cZGudP5taoXMMuiE4kavffNDJ5EZf/Ng3btZ
 x7SA==
X-Gm-Message-State: AFqh2krNnZq++yobNXaXtWUVUOSs52+79vq8aNe8fQVtm1i0SU+hExWD
 fBvXHp3Cu8wwDGN/jbh6hJCq70QNcqRL0sI6A4tvzupOq6zzkWlGn9WZgIPlvEnnDZnFXaLXSI0
 yEZA/MLTfaWVsql4=
X-Received: by 2002:a05:7500:5252:b0:f2:2f7f:efb4 with SMTP id
 r18-20020a057500525200b000f22f7fefb4mr164772gab.26.1674054733263; 
 Wed, 18 Jan 2023 07:12:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt7ZistIh0oBgZRDx9BYbyt9fD+OOW5nPrCf7sukiWq1h3odTUp7L9ddSnPE4y5jcSCkzVWvQ==
X-Received: by 2002:a05:7500:5252:b0:f2:2f7f:efb4 with SMTP id
 r18-20020a057500525200b000f22f7fefb4mr164743gab.26.1674054732626; 
 Wed, 18 Jan 2023 07:12:12 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a05620a44c400b007069375e0f4sm4248956qkp.122.2023.01.18.07.12.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 07:12:12 -0800 (PST)
Message-ID: <c2c62083-1e04-b70c-baac-cf2bf1a21660@redhat.com>
Date: Wed, 18 Jan 2023 16:12:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/3] bsd-user/mmap: use TSA_NO_TSA to suppress clang TSA
 warnings
To: Kevin Wolf <kwolf@redhat.com>, Warner Losh <imp@bsdimp.com>
Cc: qemu-devel@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230117135203.3049709-1-eesposit@redhat.com>
 <20230117135203.3049709-3-eesposit@redhat.com>
 <CANCZdfq=F9HJnjX9sGq6w9tzVx2C8e9jOfk2Lfer_mm2bDRP0A@mail.gmail.com>
 <Y8bMBZFqVP+EFzA8@redhat.com>
 <CANCZdfrg+S-EsjzcJe78aWr3pBaESv1+MUkLa-H6i=o-S0LaqQ@mail.gmail.com>
 <Y8bYI4RgV4F5b1ht@redhat.com>
Content-Language: de-CH
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <Y8bYI4RgV4F5b1ht@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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



Am 17/01/2023 um 18:17 schrieb Kevin Wolf:
> Am 17.01.2023 um 17:43 hat Warner Losh geschrieben:
>> On Tue, Jan 17, 2023 at 9:25 AM Kevin Wolf <kwolf@redhat.com> wrote:
>>
>>> Am 17.01.2023 um 17:16 hat Warner Losh geschrieben:
>>>> On Tue, Jan 17, 2023 at 6:52 AM Emanuele Giuseppe Esposito <
>>>> eesposit@redhat.com> wrote:
>>>>
>>>>> QEMU does not compile when enabling clang's thread safety analysis
>>>>> (TSA),
>>>>> because some functions create wrappers for pthread mutexes but do
>>>>> not use any TSA macro. Therefore the compiler fails.
>>>>>
>>>>> In order to make the compiler happy and avoid adding all the
>>>>> necessary macros to all callers (lock functions should use
>>>>> TSA_ACQUIRE, while unlock TSA_RELEASE, and this applies to allusers of
>>>>> pthread_mutex_lock/pthread_mutex_unlock),
>>>>> simply use TSA_NO_TSA to supppress such warnings.
>>>>
>>>> I'm not sure I understand this quite right. Maybe a clarifying question
>>>> will help me understand: Why is this needed for bsd-user but not
>>>> linux-user? How are they different here?
>>>
>>> FreeBSD's pthread headers include TSA annotations for some functions
>>> that force us to do something about them (for now: suppress the warnings
>>> in their callers) before we can enable -Wthread-safety for the purposes
>>> where we really want it. Without this, calling functions like
>>> pthread_mutex_lock() would cause compiler errors.
>>>
>>> glibc's headers don't contain such annotations, so the same is not
>>> necessary on Linux
>>>
>>
>> Thanks Kevin. With that explanation, these patches and their explanation
>> make perfect sense now. Often when there's a patch to bsd-user but not
>> linux-user, it's because bsd-user needs to do more in some way (which I try
>> to keep up on).
>>
>> In this case, it's because FreeBSD's libc is a bit ahead of the curve. So I
>> understand why it's needed, and what I need to do next (though I think that
>> I may have to wait for the rest of qemu to be annotated)...
> 
> I assume that the bsd-user part is actually sufficiently independent
> that you could do proper annotations there if you want.
> 
> However, be aware that TSA has some serious limitations with C, so you
> can't express certain things, and it isn't as strict as it could be (in
> particular, function pointers bypass it). As long as you have global
> locks (as opposed to locks in structs), it kind of works, though.
> Certainly better than nothing.
> 
> But it probably means that some of the rest of QEMU may never get the
> annotations. Also, our primary goal is protecting the block layer, so
> someone else would have to work on other locks. With checks disabled on
> individual functions like in this series, it should at least be possible
> to work on it incrementally.
> 
>> It might be better, though, to put some of this information in the commit
>> message so it isn't just on the mailing list.
> 
> Yes, I agree. We can tweak the commit messages before merging it.

New proposed commit message:

bsd-user/mmap: use TSA_NO_TSA to suppress clang TSA warnings in FreeBSD

FreeBSD implements pthread headers using TSA (thread safety analysis)
annotations, therefore when an application is compiled with -Wthread-safety
there are some locking/annotation requirements that the user of the
pthread API has to follow.

This will also be the case in QEMU, since bsd-user/mmap.c uses the
pthread API. Therefore when building it with -Wthread-safety the
compiler will throw warnings because the functions are not properly
annotated. We need TSA to be enabled because it ensures
that the critical sections of an annotated variable are properly
locked.

In order to make the compiler happy and avoid adding all the
necessary macros to all callers (lock functions should use
TSA_ACQUIRE, while unlock TSA_RELEASE, and this applies to all
users of pthread_mutex_lock/pthread_mutex_unlock),
simply use TSA_NO_TSA to supppress such warnings.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Same message could be applied to patch 1, substituting bsd-user/mmap
with util/qemu-thread-posix.


Thank you,
Emanuele

> 
>> Just a suggestion:
>>
>> Reviewed-by: Warner Losh <imp@bsdimp.com>
> 
> Thanks!
> 
> Kevin
> 


