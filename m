Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3229251B7CC
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 08:13:21 +0200 (CEST)
Received: from localhost ([::1]:41602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmUjn-0002VA-N6
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 02:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nmUde-0000Sd-Az; Thu, 05 May 2022 02:06:59 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:41473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nmUdZ-0007eP-Ts; Thu, 05 May 2022 02:06:56 -0400
Received: by mail-qv1-xf33.google.com with SMTP id jt15so2355882qvb.8;
 Wed, 04 May 2022 23:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GKI2PQJ3UH7qZ6q8CpTXaexPU5Gx76S64U6BQxuvTM4=;
 b=dkAyRHDzx71biUkCAw/KkyIKNOeDr49qu1Ui65goE6c/QvcJl/HaMcnd9Mts7LOT5U
 E+U8xhikTRHVSAioxWoMeUV9zzfp8V3Pfo/knBIWTNumyiOumwjXOCen50nPDp571j+i
 zp3zOWx+O7ZNyvtrFopp7mIgWbTmP2WMBC1E0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GKI2PQJ3UH7qZ6q8CpTXaexPU5Gx76S64U6BQxuvTM4=;
 b=ixKmcRnrKniFNaOFPXA9ahtmkbyiQtEHt1BpqyG6uS0EsrV018ZPQV7hRp4CJui48f
 yckN/IOkOZ6avnKKKOq1kYw5MtL+hZitbqF9esBKZgzEMmvxb3gKKTE6r2sOYJZMTxno
 gqUq/srVq59iIA5pbqgZStahJL2cYo0/8ZnJqpW/CwZyRypaiMVNsjphsTCiD2nZXk7f
 nCIg8Q6xBt/tkI/Tel2ac+orD+/VpRbYbSVpAdV2/J2R41P9oPJCArmlZ+Zp3jI7XXnA
 oX8VinUpXELhxHjGBKzYRur2Lb+pQcGedmDwWTvHIgN6Clcf7ijPDpcfJYSZsbhkJxJf
 znOQ==
X-Gm-Message-State: AOAM530eJCoR9XxUaBY1rePvZ6Adr/OjIuKsZ4PdGhBaYcNJ+2kWVGa9
 xS2Sfi4dpox9MePh/cKSspbhYFxOBXaXQrDDWZo=
X-Google-Smtp-Source: ABdhPJyJN3f6SJ5aShgvVlloc2bPuKUHtkgI/3q8B6KLhFbkqV6UHPOFlWvRK1T83RBsjk+y17UGAMp2T/7xstTlChQ=
X-Received: by 2002:ad4:4e05:0:b0:456:50a4:7494 with SMTP id
 dl5-20020ad44e05000000b0045650a47494mr20668219qvb.6.1651730812444; Wed, 04
 May 2022 23:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220426125028.18844-1-lucas.araujo@eldorado.org.br>
 <CACPK8Xea8cE3bAPKqDDgQ671m+rxTo57OPYrDTBOEDrpLSD9tg@mail.gmail.com>
 <eb7ec5f6-effb-fba5-21fa-60707754f9d3@kaod.org>
In-Reply-To: <eb7ec5f6-effb-fba5-21fa-60707754f9d3@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 5 May 2022 06:06:39 +0000
Message-ID: <CACPK8Xesdy9RYEiLy5TutiiDFHB04xSzyzHBS8nW5tLhpTX0WQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] VSX MMA Implementation
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>, 
 David Gibson <david@gibson.dropbear.id.au>, 
 Leandro Lupori <leandro.lupori@eldorado.org.br>, 
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=joel.stan@gmail.com; helo=mail-qv1-xf33.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Wed, 27 Apr 2022 at 07:10, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hello,
>
> On 4/27/22 08:21, Joel Stanley wrote:
> > On Tue, 26 Apr 2022 at 12:51, Lucas Mateus Castro(alqotel)
> > <lucas.araujo@eldorado.org.br> wrote:
> >>
> >> From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
> >>
> >> This patch series is an RFC of the Matrix-Multiply Assist (MMA)
> >> instructions implementation from the PowerISA 3.1
> >>
> >> These and the VDIV/VMOD implementation are the last new PowerISA 3.1
> >> instructions left to be implemented.
> >>
> >> Thanks
> >> Lucas Mateus Castro (alqotel) (7):
> >>    target/ppc: Implement xxm[tf]acc and xxsetaccz
> >>    target/ppc: Implemented xvi*ger* instructions
> >>    target/ppc: Implemented pmxvi*ger* instructions
> >>    target/ppc: Implemented xvf*ger*
> >>    target/ppc: Implemented xvf16ger*
> >>    target/ppc: Implemented pmxvf*ger*
> >>    target/ppc: Implemented [pm]xvbf16ger2*
> >
> > I have a small test case for the MMA instructions that Alistair wrote
> > a while back[1]. It passes when run with these patches applied
> > (previously it would sigill).
>
> Could we have your Tested-by then ?

Sure! I was going to re-test v2, but it doesn't hurt to mention it for
this version.

Tested-by: Joel Stanley <joel@jms.id.au>

>
>
> >
> > $ qemu-ppc64le -cpu power10  -L ~/ppc64le/ ./test -m
> > Smoke test MMA
> > MMA[0] =3D 1 (Correct)
> > MMA[1] =3D 2 (Correct)
> > MMA[2] =3D 3 (Correct)
> > MMA[3] =3D 4 (Correct)
> > MMA[4] =3D 2 (Correct)
> > MMA[5] =3D 4 (Correct)
> > MMA[6] =3D 6 (Correct)
> > MMA[7] =3D 8 (Correct)
> > MMA[8] =3D 3 (Correct)
> > MMA[9] =3D 6 (Correct)
> > MMA[10] =3D 9 (Correct)
> > MMA[11] =3D 12 (Correct)
> > MMA[12] =3D 4 (Correct)
> > MMA[13] =3D 8 (Correct)
> > MMA[14] =3D 12 (Correct)
> > MMA[15] =3D 16 (Correct)
> >
> > [1] https://github.com/shenki/p10_tests
>
> Looks like a good candidate for tests/tcg/ppc64le/. Adding Matheus and Le=
andro.
>
> Thanks,
>
> C.
>
>
>
> >
> >
> >>
> >>   include/fpu/softfloat.h             |   9 ++
> >>   target/ppc/cpu.h                    |  15 +++
> >>   target/ppc/fpu_helper.c             | 130 ++++++++++++++++++
> >>   target/ppc/helper.h                 |   7 +
> >>   target/ppc/insn32.decode            |  49 +++++++
> >>   target/ppc/insn64.decode            |  80 +++++++++++
> >>   target/ppc/int_helper.c             |  85 ++++++++++++
> >>   target/ppc/internal.h               |  28 ++++
> >>   target/ppc/translate/vsx-impl.c.inc | 200 ++++++++++++++++++++++++++=
++
> >>   9 files changed, 603 insertions(+)
> >>
> >> --
> >> 2.31.1
> >>
> >>
>

