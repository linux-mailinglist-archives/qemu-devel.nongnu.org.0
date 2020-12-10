Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D93122D5E0B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 15:38:39 +0100 (CET)
Received: from localhost ([::1]:33036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knN5a-0008EB-T3
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 09:38:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knN26-0005zV-EL
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 09:35:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knN24-0001hx-22
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 09:35:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607610897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1iJnxtvgCJ39eWBsSfprAe1n+FbeGJcCIfWwLPok5fk=;
 b=G5ftWYe3UxkRQlqQ7LuOSao8HezgSqICAvHIM8pl+KbjEB4tkRoxQp+41HzH7h5ADLppIb
 enUyFzqws7gVmNS1atoce0alN34VAT7UJ5UWwUAz43imiofOsiuv384lxepZ8j2qGGwWoZ
 l01xqIVJjI4VJe49iL/UhMk7CO6HJec=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-RqR2NqXrNza5TUnizW6A7w-1; Thu, 10 Dec 2020 09:34:54 -0500
X-MC-Unique: RqR2NqXrNza5TUnizW6A7w-1
Received: by mail-wr1-f69.google.com with SMTP id b8so2000346wrv.14
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 06:34:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1iJnxtvgCJ39eWBsSfprAe1n+FbeGJcCIfWwLPok5fk=;
 b=cm1TYGqRYSrsxM7ZJ5wr8sNJl8fk1qwixika5OxYkr28kRIvSO3jAsGmfcvYHs4opa
 j2Y1LlFTPqtcsPNoxhEMrictck7vOowg+cO0nLn0JJIZ9K01HmhdPz4XrSGx7xYH6AG6
 pYmX8JysI0OWgsr7+Dj0KKzqeC6+dp3i84APUR+WqYl2ousjjAT0y7nSkUJ3wmVGVzO4
 b7icyEkvFNLwNlLkJivDt9uMuSanAN00UsgXLCaO7EIyQYdeIDag8KsRlA3N0armQs25
 ZS2i5RGzHABt7u+OZKIRTEXDOp4BKExjhrK8Sq8IgzkA6YbyTzIdbQuIyOzml0WBFo49
 kkng==
X-Gm-Message-State: AOAM531FHiD7D3KrPSP441O7Xunc+4BL6BuZBAFzkJ1ViSccQT1851Nt
 Aw5vJG+XlLVsYxp2H0NsAyjdLfYTqqNuvgshqRCMhGm4JJks2IPmaFg0TRBpghvEdpAXQ6kkfTF
 l64xtBFZmalBsrRc=
X-Received: by 2002:adf:c648:: with SMTP id u8mr8613014wrg.215.1607610893491; 
 Thu, 10 Dec 2020 06:34:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJM5ihYY53/XlfDii2nCk1B/kZHEpNNLEOjXCv2BcF6TABt0f8DkOpZAu5B1naY2xoeGxkTg==
X-Received: by 2002:adf:c648:: with SMTP id u8mr8612994wrg.215.1607610893357; 
 Thu, 10 Dec 2020 06:34:53 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id b9sm9513717wmd.32.2020.12.10.06.34.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 06:34:52 -0800 (PST)
Subject: Re: [PATCH v3 08/13] audio: remove GNUC & MSVC check
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-9-marcandre.lureau@redhat.com>
 <a162ec7c-4dc3-5784-866e-dc95f6919b1f@redhat.com>
 <CAFEAcA_xbEm+DmP5hixtkzWJK1fi8X7wZh+eGKmDneZv_=-xbA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ac25b79a-c22a-04ab-f125-873710ef9f6d@redhat.com>
Date: Thu, 10 Dec 2020 15:34:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_xbEm+DmP5hixtkzWJK1fi8X7wZh+eGKmDneZv_=-xbA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/20 3:27 PM, Peter Maydell wrote:
> On Thu, 10 Dec 2020 at 14:26, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> On 12/10/20 2:47 PM, marcandre.lureau@redhat.com wrote:
>>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>
>>> QEMU requires either GCC or Clang, which both advertize __GNUC__.
>>> Drop MSVC fallback path.
>>>
>>> Note: I intentionally left further cleanups for a later work.
>>>
>>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>> ---
>>>  audio/audio.c | 8 +-------
>>>  1 file changed, 1 insertion(+), 7 deletions(-)
>>>
>>> diff --git a/audio/audio.c b/audio/audio.c
>>> index 46578e4a58..d7a00294de 100644
>>> --- a/audio/audio.c
>>> +++ b/audio/audio.c
>>> @@ -122,13 +122,7 @@ int audio_bug (const char *funcname, int cond)
>>>
>>>  #if defined AUDIO_BREAKPOINT_ON_BUG
>>>  #  if defined HOST_I386
>>> -#    if defined __GNUC__
>>> -        __asm__ ("int3");
>>> -#    elif defined _MSC_VER
>>> -        _asm _emit 0xcc;
>>> -#    else
>>> -        abort ();
>>> -#    endif
>>> +      __asm__ ("int3");
>>
>> This was 15 years ago... Why not simply use abort() today?
> 
> That's what I suggested when I looked at this patch in
> the previous version of the patchset, yes...

Ah, I went back to read v2 thread. Actually I even prefer
Gerd's suggestion to remove this dead code.

Regards,

Phil.


