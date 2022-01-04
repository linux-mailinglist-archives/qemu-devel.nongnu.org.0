Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CCA484072
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 12:03:03 +0100 (CET)
Received: from localhost ([::1]:35942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4hao-0006zG-0w
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 06:03:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n4hYX-0005Nm-FI
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 06:00:41 -0500
Received: from [2a00:1450:4864:20::332] (port=53219
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n4hYV-0002E2-L0
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 06:00:41 -0500
Received: by mail-wm1-x332.google.com with SMTP id g132so22975064wmg.2
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 03:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=O82n+8+7k4U501wPf3BxPQoanlsRW022PUoKLADLWO0=;
 b=Y9I9jElPTbzQaYEEjyDGmCT0NQ2mLHWNweUNQKejkoutNwWwNgD4BL+lC4pWzeelqW
 2uEqIRRH8BfNwYtXmtyAao5LoW9G8DzGD3ggS5pq6T6rwyekExUPuHiEMhr70t9EfYBs
 W/rCfX4is6Am+lERGQSRD5AQEgfEKzmzAiA5p6l4InRALOCwhUJ4WXWPwZGsnvL8udVT
 PH2gFhTD2kYSp3CZ1giGh9h4md/UJNLLuShcx2EcIR1DrkAZChT5RCOcoxlP6+eK0vV1
 Mfq5GqYd01Ln4UjTiNVjRzGIC+YGz/0podhkjpwZsxYNb8d3ltwlf4qyvgY5TqtcTibM
 9o/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=O82n+8+7k4U501wPf3BxPQoanlsRW022PUoKLADLWO0=;
 b=ZUoAC5KvRucmhry0FZ0RHOr8cdEooiJ+mfFUnFiiuPhhK2x6g+1UPfQ+N05U22u75+
 MVoJHf3V7CXo6TuNkXA6ACMGOYGlq8Y5YcNE2ASRVgFVIz7ckZM5iw5hovCxF/4VP+zh
 lUiE0xsdWHoKTVbUaqxfEPEGXNk3lGIl36udNjxMq1Sz2Z8AIZSJ1s+j0vFJ08xRWI5X
 yvFLUQjVoZlBEbI4Zj8VluuI4ZLyCvSXSDvAIfNSWzNGK/zIFfxvHB2rEMLPjbQ+jLVm
 XYFsSgHVkhzF/F/Zu5EOHsMkxepxTYU0dJIhs7m/khSTES8UO70r3J+5iBOXa/7w8a5O
 vJnw==
X-Gm-Message-State: AOAM530XOwGnS3EJEmeAjqJcrI2nIoLq/gVJ9jbcM/UT5alxpEBNEajG
 tLSUaeFmHrvc9WGI4OBEic1OzQ==
X-Google-Smtp-Source: ABdhPJwhV4R7o9DrfvtSxFpLtQ2dc9qVd38vC6CQklC9dm0isQcmccBdzEFqmGrLbJG2WMTAX5AFLA==
X-Received: by 2002:a05:600c:1d1c:: with SMTP id
 l28mr40384065wms.69.1641294037934; 
 Tue, 04 Jan 2022 03:00:37 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j3sm37822499wro.22.2022.01.04.03.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 03:00:37 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 73F681FFB7;
 Tue,  4 Jan 2022 11:00:36 +0000 (GMT)
References: <20211226001931.3809249-1-f4bug@amsat.org>
 <20211226001931.3809249-3-f4bug@amsat.org>
 <1cc49727-5ad5-4c4f-be81-6450e5889cff@www.fastmail.com>
 <ada264bd-6277-0c44-b010-cbbe93e98a8e@amsat.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 2/2] tests/tcg/mips64el: Run float tests
Date: Tue, 04 Jan 2022 10:59:41 +0000
In-reply-to: <ada264bd-6277-0c44-b010-cbbe93e98a8e@amsat.org>
Message-ID: <87sfu3lq97.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aurelien Jarno <aurelien@aurel32.net>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 BALATON Zoltan via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 12/26/21 03:25, Jiaxun Yang wrote:
>> =E5=9C=A82021=E5=B9=B412=E6=9C=8826=E6=97=A5=E5=8D=81=E4=BA=8C=E6=9C=88 =
=E4=B8=8A=E5=8D=8812:19=EF=BC=8CPhilippe Mathieu-Daud=C3=A9=E5=86=99=E9=81=
=93=EF=BC=9A
>>> Unfortunately this fails:
>>>
>>>   $ make run-tcg-tests-mips64el-linux-user
>>>   ...
>>>   Files float_convs.out and tests/tcg/mips64el/float_convs.ref differ
>>>   --- float_convs.out     2021-12-26 01:03:48.585973637 +0100
>>>   +++ tests/tcg/mips64el/float_convs.ref   2021-12-26 00:29:35.80446534=
0 +0100
>>>   @@ -1,40 +1,40 @@
>>>    ### Rounding to nearest
>>>   -from single: f32(nan:0xffffffff)
>>>   -  to double: f64(nan:0x007ff7ffffffffffff) (INVALID)
>>>   -   to int32: 2147483647 (INVALID)
>>>   -   to int64: 9223372036854775807 (INVALID)
>>>   -  to uint32: 2147483647 (INVALID)
>>>   -  to uint64: 9223372036854775807 (INVALID)
>>>   make[2]: *** [tests/tcg/multiarch/Makefile.target:32: run-float_convs=
] Error 1
>>>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>> ---
>>>  tests/tcg/mips64el/Makefile.target | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>  create mode 100644 tests/tcg/mips64el/Makefile.target
>>>
>>> diff --git a/tests/tcg/mips64el/Makefile.target=20
>>> b/tests/tcg/mips64el/Makefile.target
>>> new file mode 100644
>>> index 00000000000..dcb1e9d72ac
>>> --- /dev/null
>>> +++ b/tests/tcg/mips64el/Makefile.target
>>> @@ -0,0 +1,2 @@
>>> +float_%: CFLAGS+=3D-march=3Dloongson3a
>>> +float_%: QEMU_OPTS+=3D-cpu Loongson-3A4000
>>=20
>> Hmm, -march=3Dloongson3a assumed legacy NaN while our -cpu Loongson-3A40=
00 assumed IEEE 754-2008 style NaN.
>>=20
>> I guess switch to Loongson-3A1000 can help?
>
> Nop, exactly the same error.
>
> Also, float_madds fails as:
>
> Files float_madds.out and tests/tcg/mips64el/float_madds.ref differ
> --- float_madds.out     2021-12-26 11:49:06.018532269 +0100
> +++ tests/tcg/mips64el/float_madds.ref   2021-12-26 01:16:02.269497182 +0=
100
> @@ -1,16 +1,16 @@
>  ### Rounding to nearest
> -op : f32(nan:0xffffffff) * f32(nan:0xffbfffff) + f32(-inf:0xff800000)
> -res: f32(nan:0x7fbfffff) flags=3DINVALID (0/0)
> -op : f32(nan:0xffbfffff) * f32(-inf:0xff800000) + f32(nan:0xffffffff)
> -res: f32(nan:0x7fbfffff) flags=3DINVALID (0/1)
> -op : f32(-inf:0xff800000) * f32(nan:0xffffffff) + f32(nan:0xffbfffff)
> -res: f32(nan:0x7fbfffff) flags=3DINVALID (0/2)
> make[2]: *** [tests/tcg/multiarch/Makefile.target:30: run-float_madds]
> Error 1

That looks like the test just stops (rather than differs slightly) -
which is weird because I would expect that to fail before attempting to
compare to the reference.

--=20
Alex Benn=C3=A9e

