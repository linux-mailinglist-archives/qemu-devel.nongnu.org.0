Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C4F1441EC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 17:19:21 +0100 (CET)
Received: from localhost ([::1]:57504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itwFM-000486-3N
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 11:19:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34923)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1itwCD-0002PK-Ki
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 11:16:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1itwCC-000670-AV
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 11:16:05 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:38468)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1itwC7-00065d-KC
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 11:15:59 -0500
Received: by mail-wm1-x343.google.com with SMTP id u2so3752403wmc.3
 for <qemu-devel@nongnu.org>; Tue, 21 Jan 2020 08:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=xW2dddgFTUGo7qlgvcdWwn/MvPlW25UAlMZEhsMe1OM=;
 b=OjReQ4gXobfNXdL5ZV61Twc8e9a4dSw8gbgv8uIsnOxhhmrBdGV6m5/JuajbqX0xgN
 UYD0SZRqeOR4H8U+3RI+z7qcyR3KYqXb6fNFK0GTua/PPFGIKriHvLk0LolRannunEaA
 o22kP3f7ROeimZSahzmhaOPNUsg2e0AeNSzF4qoG6/sg07OSRJwwtRoHY9FA6L0tumxF
 gh62319VKcA8eBmGzDBvygD1q/6rzA9bMuS9wvQCOsG9pOCH1mU/BUURKyLTTa8CxOgU
 LceKCn7i1d5cQImaNktzfJyK8SxCCnsiE1hcD+63jpAy7t0bpD+hnRAjar6vojU+1VB7
 z6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=xW2dddgFTUGo7qlgvcdWwn/MvPlW25UAlMZEhsMe1OM=;
 b=eynMCib46WxDIowbMvh/HW3ZvdnEktqL3b8SEJ0KlNfr1cUDng99uZPc+zeChzODxH
 qPJxsQR4idMTORdGOP8I6vmdlyhYUPz08UW9g8tF9uuI8M7l6xuUKjKFCBkHGBn8Q9sP
 V/t3cPxPjTwxUtZcqgoliYyhli78QW6pCg4n6KZiGN1J9lA9lLCSzeF+zUAg3oiE853a
 WEzKkTQ51Fz9UyiLo54gtr7p7PAXHOy3y8UvQELlqKNXI8LZdtQ+bngU4/p/Ygr7P3VR
 O5jZYK7t4SC1oStdw5jTSsErXDkKERxRrokunj64FGbDy9+Oo+jBnIlRX7VRAWv6vpOf
 FWVA==
X-Gm-Message-State: APjAAAVWQGVVuAdBtxlTX4/tURpVmMBngK4DZuYGVLvrOTtLTfH971Zo
 3c6fNk1pYVIO+LODGlR6XvMRIw==
X-Google-Smtp-Source: APXvYqzBQg3kD1miv0XeRqaIEwVsaYwWctr3ms74ZuVqZbB+M9Bz02+gTfl5Up6Ar762b1dhJ7CtLA==
X-Received: by 2002:a05:600c:2117:: with SMTP id
 u23mr5285113wml.106.1579623357816; 
 Tue, 21 Jan 2020 08:15:57 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l15sm50749552wrv.39.2020.01.21.08.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 08:15:56 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C1E591FF87;
 Tue, 21 Jan 2020 16:15:55 +0000 (GMT)
References: <20200116194341.402-1-richard.henderson@linaro.org>
 <20200116194341.402-4-richard.henderson@linaro.org>
 <87v9p62vt5.fsf@linaro.org>
 <e384935c-7fc2-77eb-352d-90aa95ba89a9@linaro.org>
 <87r1zt15jg.fsf@linaro.org>
 <e383d1d6-7c08-ba3c-6e8b-971d62a9d2cb@linaro.org>
User-agent: mu4e 1.3.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 3/5] linux-user/i386: Emulate x86_64 vsyscalls
In-reply-to: <e383d1d6-7c08-ba3c-6e8b-971d62a9d2cb@linaro.org>
Date: Tue, 21 Jan 2020 16:15:55 +0000
Message-ID: <87a76g23b8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 1/21/20 12:13 AM, Alex Benn=C3=A9e wrote:
>>=20
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>=20
>>> On 1/20/20 1:48 AM, Alex Benn=C3=A9e wrote:
>>>>> +    default:
>>>>> +    sigsegv:
>>>>
>>>> this label looks a little extraneous.
>>>>
>>>> Otherwise:
>>>>
>>>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>>
>>>
>>> Look a little further down:
>>>
>>>> +    default:
>>>> +    sigsegv:
>>>> +        /* Like force_sig(SIGSEGV).  */
>>>> +        gen_signal(env, TARGET_SIGSEGV, TARGET_SI_KERNEL, 0);
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * Validate the return address.
>>>> +     * Note that the kernel treats this the same as an invalid entry =
point.
>>>> +     */
>>>> +    if (get_user_u64(caller, env->regs[R_ESP])) {
>>>> +        goto sigsegv;
>>>> +    }
>>=20
>> Wouldn't this read better:
>>=20
>>     /*
>>      * Validate the entry point.  We have already validated the page
>>      * during translation, now verify the offset.
>>      */
>>     switch (env->eip & ~TARGET_PAGE_MASK) {
>>     case 0x000:
>>         syscall =3D TARGET_NR_gettimeofday;
>>         break;
>>     case 0x400:
>>         syscall =3D TARGET_NR_time;
>>         break;
>>     case 0x800:
>>         syscall =3D TARGET_NR_getcpu;
>>         break;
>>     default:
>>         syscall =3D -1;
>>         break;
>>     }
>>=20
>>     /*
>>      * If we have an invalid entry point or an invalid return address we
>>      * generate a SIGSEG.
>>      */
>>     if (syscall < 0 || get_user_u64(caller, env->regs[R_ESP])) {
>>         gen_signal(env, TARGET_SIGSEGV, TARGET_SI_KERNEL, 0);
>>         return;
>>     }
>>=20
>
> Only if you have a violent goto allergy.

gotos have their place but jumping backwards is confusing to eye. If the
compiler want to mess with layout after then it is free to do so.

--=20
Alex Benn=C3=A9e

