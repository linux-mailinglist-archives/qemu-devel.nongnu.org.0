Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE0459557E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 10:43:04 +0200 (CEST)
Received: from localhost ([::1]:47870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNsAB-0007YE-Cu
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 04:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oNs8w-0005oo-EX
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 04:41:46 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:51906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oNs8u-0005pq-MP
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 04:41:46 -0400
Received: by mail-wm1-x32f.google.com with SMTP id ay12so4908904wmb.1
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 01:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=N57HHkKyKy2tF7Yxd/OoIAmEcTDN5Vt66zT1kiVQLiQ=;
 b=LxudoWMwTntyfPcy/+JiPChV2oXbR1iYCt8YmdIHizKa1lV5ueW3l28Db1HNKlVdec
 zKhDo+MCbx8CTutfzmbnewjMy9JoEPM/tw4SLOfvAuUf5nS7T2lD6V+rMHP39nBvh5BL
 ggj2HK8KiZOUMVIogvuYDyBdG9VrjVNNZcpRgLZrmLu9izIwrfqXRa79CWAPmWiyJOVq
 Lz9D9uDXuOEQKIDmPhUibAq/KP74lJ9JGVGxEz1Y3qbT0svIrPKVRYchaPeZMNWmLC5l
 sB69/dsln5Kr9MVE9CAmGNJ1f6guGpFvOui6Uhj1VlsS6Sbj8jfgNoj9a9XQ622hNR7r
 cfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=N57HHkKyKy2tF7Yxd/OoIAmEcTDN5Vt66zT1kiVQLiQ=;
 b=4IesIHgQxbUjTGWKF/lEykFzDEoUSjgfEm/W/q+dxD7liXsitMae8jHme43pvGbqPk
 BLbN7sahvX8b0Hr3lkSLTKW0lnOXLsiYsuD3sfeCT7um+SnHz0ZQX7C8Ln8JZ95+yrMb
 XPwce4kprzXF2Ane9+FqDPNSLrfp34lVIKsCV9v7Zi95BCW5OAfbOtQDlj3sU/w4HrRy
 WDlhbFXN69gU/OzdOdSfSYzcmE1xN8pIsUqJP/QP2akeF6zOtxSqF5kE3PoVk5E/PKNy
 VxqWaX2x8JW44qNx+nnQgkBqYQVwt276kL3tsDBKtM4OKtPiTtNB9hb++QogAen/jCLn
 Wi3Q==
X-Gm-Message-State: ACgBeo3V6vwgeDz41R/YgmSMMk0BsAVobzJBq4DPuSkocsedtce85A8T
 cCkKs7LsadAZJXugj5sSlTa4sQ==
X-Google-Smtp-Source: AA6agR5SSIBwUohF6wLyazEOhQXBAXggVk1WXwuCeJOVdC9xzBwRUMD/+L++NzyXla9RFsOOjrW47w==
X-Received: by 2002:a1c:2b87:0:b0:3a5:aac8:fe40 with SMTP id
 r129-20020a1c2b87000000b003a5aac8fe40mr12226790wmr.125.1660639302735; 
 Tue, 16 Aug 2022 01:41:42 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a5d620b000000b00222cf973e8csm9525547wru.69.2022.08.16.01.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 01:41:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 864FC1FFB7;
 Tue, 16 Aug 2022 09:41:41 +0100 (BST)
References: <CAPjTjwsb0jAsQq4PHOsFGW7SjpAe=Ug2b_fxhdccEEnzh=cQUA@mail.gmail.com>
 <CAFEAcA-F8rUTH1FimHf+FaV0O6dQ4QGHihaygxdjn9BKYPazBg@mail.gmail.com>
 <CAPjTjwuNwXdemwFYOUDi4Qnc5fA9KWzAEZQ1JaCNu+0x3RUh7Q@mail.gmail.com>
 <8b32824b-4dc1-3d1a-1916-918a3fffab26@linaro.org>
 <67a42d65-8289-b26c-26f6-275ea0bfac98@vivier.eu>
 <CAFEAcA8AXodRV=eG2Ra4Sf9rsap499zDJEu6hC=c+V9gE2KjfA@mail.gmail.com>
 <52225a7c-310f-444f-0b75-0ad2536a30c0@vivier.eu>
 <87r11miz8i.fsf@linaro.org>
 <531cdb6a-f660-b671-375c-a3819d90c030@vivier.eu>
User-agent: mu4e 1.8.9; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Laurent Vivier <laurent@vivier.eu>
Cc: Peter Maydell <peter.maydell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Vitaly Buka <vitalybuka@google.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH] [PATCH] linux-user/aarch64: Reset target data on
 MADV_DONTNEED
Date: Tue, 16 Aug 2022 09:41:19 +0100
In-reply-to: <531cdb6a-f660-b671-375c-a3819d90c030@vivier.eu>
Message-ID: <87zgg4bmwq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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

> Le 11/08/2022 =C3=A0 17:18, Alex Benn=C3=A9e a =C3=A9crit=C2=A0:
>> Laurent Vivier <laurent@vivier.eu> writes:
>>=20
>>> Le 11/08/2022 =C3=A0 13:54, Peter Maydell a =C3=A9crit=C2=A0:
>>>> On Thu, 11 Aug 2022 at 09:29, Laurent Vivier <laurent@vivier.eu> wrote:
>>>>>
>>>>> Le 10/08/2022 =C3=A0 22:47, Richard Henderson a =C3=A9crit :
>>>>>> On 8/10/22 13:32, Vitaly Buka wrote:
>>>>>>> Sorry, I only noticed today that it's not submitted.
>>>>>>> Version is not critical for us, as we build from masters anyway.
>>>>>>> Richard, do you know a reason to consider this critical?
>>>>>>>
>>>>>>> On Wed, 10 Aug 2022 at 13:04, Peter Maydell <peter.maydell@linaro.o=
rg
>>>>>>> <mailto:peter.maydell@linaro.org>> wrote:
>>>>>>>
>>>>>>>       On Wed, 10 Aug 2022 at 21:00, Vitaly Buka <vitalybuka@google.=
com
>>>>>>>       <mailto:vitalybuka@google.com>> wrote:
>>>>>>>        >
>>>>>>>        > How can we land this one?
>>>>>>>
>>>>>>>       Pinging it a week ago rather than now would have been a good =
start :-(
>>>>>>>       I think it got missed because you didn't cc the linux-user ma=
intainer.
>>>>>>>
>>>>>>>       Is this a critical fix for 7.1 or can we let it slip to 7.2 ?
>>>>>>
>>>>>> It's unfortunate that it got missed.  It's not critical, but it woul=
d be nice, because support for
>>>>>> MADV_DONTNEED is new in 7.1 (previously, we ignored all madvise).
>>>>>>
>>>>>> I'll note there are missing braces for coding style on an IF.
>>>>>>
>>>>>> Laurent, do you have an objection to merging this for rc3?
>>>>>>
>>>>>
>>>>> No objection.
>>>>>
>>>>> Do you want it goes via the arm branch or via the linux-user branch?
>>>>>
>>>>> If it goes via linux-user I can run the LTP testsuite but it takes 1 =
day.
>>>> I think we should definitely run the LTP testsuite on it, so
>>>> taking it via linux-user probably makes more sense.
>>>
>>> ok, applied to my linux-user-for-7.1 branch.
>>>
>>> Running tests.
>> Any chance you could pick up:
>>    Subject: [PATCH v2] linux-user: un-parent OBJECT(cpu) when
>> closing thread
>>    Date: Wed,  3 Aug 2022 14:05:37 +0100
>>    Message-Id: <20220803130537.763666-1-alex.bennee@linaro.org>
>> before you run the tests?
>>=20
>
> I've tested it, it works fine.
>
> Do you plan to do a PR including it or do you want I do (there will be
> only this one in mine)?

I'm going to a roll a PR today so I can include it. Shall I add a
Tested-by for you?

>
> Thanks,
> Laurent


--=20
Alex Benn=C3=A9e

