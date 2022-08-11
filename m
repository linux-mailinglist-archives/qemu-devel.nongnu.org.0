Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE8858FF4A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 17:28:06 +0200 (CEST)
Received: from localhost ([::1]:33200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMA6P-0007af-7P
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 11:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oM9ye-0004Yk-2e
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 11:20:05 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:44964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oM9yb-0006nW-FK
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 11:20:02 -0400
Received: by mail-ed1-x533.google.com with SMTP id t5so23326334edc.11
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 08:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=UUjDsEkD1+WlTN1gOjDsDG6XaodH7ec16k7NVVH9MpY=;
 b=Z5uqom84Rm0Vp3REDxmHRIMA55BdxDrdkhUEhYDT1CFuIIBH7EtwwKsWJj/wxM++Hp
 X3KVK5Gs5Ml13sGsOJxdCxAPKQulsRWUUFnChiOqYb7e2pKSRbE/Y3zuoLLuW8Tbpf6T
 pyvFdi5P4wGwFTTISCp7agm7RaUwnUnVt/FDGJgC0i+r24ZSnKT3wdFtqHE7MDerag3y
 weFSTuFhcu0IadHAwuwu+BodkDiWxcq8rHcKgS73fyy/0GbNrugirVVlrD2N92okZASQ
 d5EYXlgHh9mIIKG+zgB4U7Jb7Uc63xrJzo5Oynt7F+GT7f8cJQhCDbdDdhfUecKh3NKi
 /ukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=UUjDsEkD1+WlTN1gOjDsDG6XaodH7ec16k7NVVH9MpY=;
 b=ZVcR0lslE6KpIM0k1bqe3CU167lgaFfxoHIlmQmTh0rErvZ/XLf8d22SydpyDtVjmq
 etetT19/EjffEDxtU9NCGcJJqr/F8lDOEHCRXUa/3qOYCBXxRkV9Wo5ebccBjFHVZYHL
 tqIqYhyuOgIhDG9OJxg40wirTVYkFij5Gte+kiIn/U9KNMEhpoK+QwIdGm6PrX67vWGE
 ae3RHUEA8gt3+wUS2VjsBcUyh0k/6/R+MCTQMx9wboeUZ4HXnknChr4sEvONUgjwBk1n
 7jvK1gokTFISjxRllQ6UMnOKGMMSU0i1zXbCG6Od5ROxpTQ/JUbCBw1GlpOy7+lcY7Pv
 gKNg==
X-Gm-Message-State: ACgBeo1mXYx2BGi+sbmPZyY7ESZFcsQ3eYn28NqZMmqe3AhrMUSR1KrZ
 eg5bTw7TpBZ1zdXBiLVnjc1hBA==
X-Google-Smtp-Source: AA6agR5LSrktSyUuhxLvb4uFx49khnbrimFXtFT+IsFby6PgrzW+NDz9U7XWwAvRnaLbNBhilvXDvA==
X-Received: by 2002:a05:6402:35c6:b0:43d:c340:7799 with SMTP id
 z6-20020a05640235c600b0043dc3407799mr31528607edc.369.1660231199012; 
 Thu, 11 Aug 2022 08:19:59 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m4-20020aa7d344000000b0043b7917b1a4sm9250143edr.43.2022.08.11.08.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 08:19:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EBB261FFB7;
 Thu, 11 Aug 2022 16:19:57 +0100 (BST)
References: <CAPjTjwsb0jAsQq4PHOsFGW7SjpAe=Ug2b_fxhdccEEnzh=cQUA@mail.gmail.com>
 <CAFEAcA-F8rUTH1FimHf+FaV0O6dQ4QGHihaygxdjn9BKYPazBg@mail.gmail.com>
 <CAPjTjwuNwXdemwFYOUDi4Qnc5fA9KWzAEZQ1JaCNu+0x3RUh7Q@mail.gmail.com>
 <8b32824b-4dc1-3d1a-1916-918a3fffab26@linaro.org>
 <67a42d65-8289-b26c-26f6-275ea0bfac98@vivier.eu>
 <CAFEAcA8AXodRV=eG2Ra4Sf9rsap499zDJEu6hC=c+V9gE2KjfA@mail.gmail.com>
 <52225a7c-310f-444f-0b75-0ad2536a30c0@vivier.eu>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Laurent Vivier <laurent@vivier.eu>
Cc: Peter Maydell <peter.maydell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Vitaly Buka <vitalybuka@google.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH] [PATCH] linux-user/aarch64: Reset target data on
 MADV_DONTNEED
Date: Thu, 11 Aug 2022 16:18:39 +0100
In-reply-to: <52225a7c-310f-444f-0b75-0ad2536a30c0@vivier.eu>
Message-ID: <87r11miz8i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Laurent Vivier <laurent@vivier.eu> writes:

> Le 11/08/2022 =C3=A0 13:54, Peter Maydell a =C3=A9crit=C2=A0:
>> On Thu, 11 Aug 2022 at 09:29, Laurent Vivier <laurent@vivier.eu> wrote:
>>>
>>> Le 10/08/2022 =C3=A0 22:47, Richard Henderson a =C3=A9crit :
>>>> On 8/10/22 13:32, Vitaly Buka wrote:
>>>>> Sorry, I only noticed today that it's not submitted.
>>>>> Version is not critical for us, as we build from masters anyway.
>>>>> Richard, do you know a reason to consider this critical?
>>>>>
>>>>> On Wed, 10 Aug 2022 at 13:04, Peter Maydell <peter.maydell@linaro.org
>>>>> <mailto:peter.maydell@linaro.org>> wrote:
>>>>>
>>>>>      On Wed, 10 Aug 2022 at 21:00, Vitaly Buka <vitalybuka@google.com
>>>>>      <mailto:vitalybuka@google.com>> wrote:
>>>>>       >
>>>>>       > How can we land this one?
>>>>>
>>>>>      Pinging it a week ago rather than now would have been a good sta=
rt :-(
>>>>>      I think it got missed because you didn't cc the linux-user maint=
ainer.
>>>>>
>>>>>      Is this a critical fix for 7.1 or can we let it slip to 7.2 ?
>>>>
>>>> It's unfortunate that it got missed.  It's not critical, but it would =
be nice, because support for
>>>> MADV_DONTNEED is new in 7.1 (previously, we ignored all madvise).
>>>>
>>>> I'll note there are missing braces for coding style on an IF.
>>>>
>>>> Laurent, do you have an objection to merging this for rc3?
>>>>
>>>
>>> No objection.
>>>
>>> Do you want it goes via the arm branch or via the linux-user branch?
>>>
>>> If it goes via linux-user I can run the LTP testsuite but it takes 1 da=
y.
>> I think we should definitely run the LTP testsuite on it, so
>> taking it via linux-user probably makes more sense.
>
> ok, applied to my linux-user-for-7.1 branch.
>
> Running tests.

Any chance you could pick up:

  Subject: [PATCH v2] linux-user: un-parent OBJECT(cpu) when closing thread
  Date: Wed,  3 Aug 2022 14:05:37 +0100
  Message-Id: <20220803130537.763666-1-alex.bennee@linaro.org>

before you run the tests?

>
> Thanks,
> Laurent


--=20
Alex Benn=C3=A9e

