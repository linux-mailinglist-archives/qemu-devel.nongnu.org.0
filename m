Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BAB43C679
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 11:31:54 +0200 (CEST)
Received: from localhost ([::1]:51432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mffHl-00050w-O0
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 05:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1mffF3-0004L0-8H
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 05:29:05 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:36825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1mffEy-0007pi-7o
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 05:29:01 -0400
Received: by mail-qk1-x731.google.com with SMTP id i9so1297103qki.3
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 02:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iDp8NShR9sldZtdyjSXTA5fo45654onh/Spm0W7jHms=;
 b=hAMlDn/Io8K67YNOWJgHEL/gOAtPBZC1uYrqP2OwbhvqfCuHMD0iUcsKo+hVhoEmt8
 TrHc2uc13T8cNHIaLr0QmRN+4lTUnfbgicw+7iVmfjQi4w4vWSS8HZ4WM+Rlrbe5paT2
 Wa426Aro7N5aaeptP+TaQA7aoM5N6zdfUCu4QOXmnUJgm+YTr3MiHHK6nDWEqjg6XtIl
 LXLkWwAOMp2jVA6KMNZnaNxxEatL1o+C+M5PtW7nwWXbymg4k0lQUH9sKq8rm+0wAYWc
 whx5kvFUQu0N9zrCP/5EVbPHN42zde1D1YcvljdTqxOQ5tUocO0RjjG+zByVFHYKInGn
 o8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iDp8NShR9sldZtdyjSXTA5fo45654onh/Spm0W7jHms=;
 b=Sezcl01tFha/S7LO4ouLmY2ro2IMBjCDO08Iz5npTf9DujAjkYJJqMaNJ0pZ4JhiS/
 3z7agg1GZbMz7vaquE4Whb/q/2TtnMjTyI/DuXK0iE1V55uedBwjBSFTj7Thg8mcZomH
 ooQ8+0OlVIBt6NoBFVocET1v3wl86wbvFBO8LBr7gAGJvfwG7Kyx8p0hucvchEzdsOQD
 ad4wGGmflCEB0NudrmJJSiZQIj6c0NLAzpDtr/vuvORnpPAenQMpBbyPC4SceQMU6KNP
 vC+GYW4pmnzmytS38Xw569tA6RoveZktEL/iSqEcbAgN0BvmReqSqEUdZ4/PJjVrPbPr
 lpsw==
X-Gm-Message-State: AOAM530YQLx479bHsk6+tljyNryWz319nFCojx9zhO11pW8c9iOTPXeE
 2pmA3LXwAa7+hOrPIYqUA/vI2YpO6jmIN1nLKFY=
X-Google-Smtp-Source: ABdhPJyUQjIQ1fFPJKdJ05+XhjOdTo89W+Q2bCUrOXphMCEyvZhjYE1GOYyOKMrgLmjSD9v+hr+BZGMkzJU27zHKjKo=
X-Received: by 2002:a37:a809:: with SMTP id r9mr23872628qke.50.1635326937376; 
 Wed, 27 Oct 2021 02:28:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211003142142.3674844-1-f4bug@amsat.org>
 <f366b3e5-cf3d-d2b7-b7ef-3ec79568a164@linaro.org>
 <2e025148-5840-50ef-3a2c-14930700073e@amsat.org>
In-Reply-To: <2e025148-5840-50ef-3a2c-14930700073e@amsat.org>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Wed, 27 Oct 2021 12:28:21 +0300
Message-ID: <CAK4993iMFEvHwo8=srRbPF-zOruO6w6wALxhCb9-t0NDOXtpmw@mail.gmail.com>
Subject: Re: [PATCH] target/avr: Optimize various functions using extract
 opcode
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000031ad5105cf52391e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=mrolnik@gmail.com; helo=mail-qk1-x731.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000031ad5105cf52391e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi Philippe

how was it tested?

On Wed, Oct 27, 2021 at 7:42 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> Hi Richard,
>
> On 10/3/21 17:24, Richard Henderson wrote:
> > On 10/3/21 10:21 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> >> When running the scripts/coccinelle/tcg_gen_extract.cocci
> >> Coccinelle semantic patch on target/avr/, we get:
> >>
> >>    [DBG] candidate at target/avr/translate.c:228
> >>    [DBG] candidate at target/avr/translate.c:266
> >>    [DBG] candidate at target/avr/translate.c:885
> >>    [DBG] candidate at target/avr/translate.c:924
> >>    [DBG] candidate at target/avr/translate.c:962
> >>
> >> Manually inspect and replace combinations of (shri, andi)
> >> opcodes by the extract opcode.
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9<f4bug@amsat.org>
> >> ---
> >>   target/avr/translate.c | 16 +++++-----------
> >>   1 file changed, 5 insertions(+), 11 deletions(-)
> >
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> Do you mind taking this patch via tcg-next?
>


--=20
Best Regards,
Michael Rolnik

--00000000000031ad5105cf52391e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">hi=C2=A0Philippe<div><br></div><div>how was it tested?</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Wed, Oct 27, 2021 at 7:42 AM Philippe Mathieu-Daud=C3=A9 &lt;<a href=
=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Hi Richard,<br>
<br>
On 10/3/21 17:24, Richard Henderson wrote:<br>
&gt; On 10/3/21 10:21 AM, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt;&gt; When running the scripts/coccinelle/tcg_gen_extract.cocci<br>
&gt;&gt; Coccinelle semantic patch on target/avr/, we get:<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0 [DBG] candidate at target/avr/translate.c:228<br>
&gt;&gt; =C2=A0=C2=A0 [DBG] candidate at target/avr/translate.c:266<br>
&gt;&gt; =C2=A0=C2=A0 [DBG] candidate at target/avr/translate.c:885<br>
&gt;&gt; =C2=A0=C2=A0 [DBG] candidate at target/avr/translate.c:924<br>
&gt;&gt; =C2=A0=C2=A0 [DBG] candidate at target/avr/translate.c:962<br>
&gt;&gt;<br>
&gt;&gt; Manually inspect and replace combinations of (shri, andi)<br>
&gt;&gt; opcodes by the extract opcode.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9&lt;<a href=3D"mailto:f4=
bug@amsat.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0 target/avr/translate.c | 16 +++++-----------<br>
&gt;&gt; =C2=A0 1 file changed, 5 insertions(+), 11 deletions(-)<br>
&gt; <br>
&gt; Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson=
@linaro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
<br>
Do you mind taking this patch via tcg-next?<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Best Regards,<br>Michael Rolnik</div>

--00000000000031ad5105cf52391e--

