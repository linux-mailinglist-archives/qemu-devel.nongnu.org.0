Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE536A80EF
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 12:22:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXh0T-0007oE-6I; Thu, 02 Mar 2023 06:21:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pXh0R-0007nr-4V
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:21:51 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pXh0P-00056j-Hb
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:21:50 -0500
Received: by mail-pg1-x529.google.com with SMTP id h31so9557366pgl.6
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 03:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677756107;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bKlnnRNdD/jVZ7UoSQ8uMM/iIBjgcrHJLg/1A722+Mw=;
 b=OwB8ywxMgaSgdAJMa6o6ry4VyU3yq36hwwjyyQPhk9NVFFbeZSw3gBuD17MGIFQ6VZ
 jKelaSJ9DPlJDw5SwecK3rusiE0KQkrItyRBjmwoNe1izl/t5x6puFojRn52m9q1dTT/
 hPDSzDiCAcWe106zZn607foOtmxLE0EmC+PHAsd++H+iQSwtWR0KPucnFapvlLgvh7yg
 uaHclLSn4yzOwN8FLlG4OoHJOx8tm0F/Lc5DH3J1ZnDdmJvKlC74MsO1VwWamXjunu2a
 hO49OQwHMNBmbW3aTXiwRYogpeE+slZCL3Z7SvU/a1ao4z+Qwf6PzFhrhGSUfNYsrhun
 spkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677756107;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bKlnnRNdD/jVZ7UoSQ8uMM/iIBjgcrHJLg/1A722+Mw=;
 b=hbHcgvKJ5vijbZR8eDpnhwTgMek/g2u8BOk3p0RWWHOcuJYDaMgpvQzgbHXlqBIM7Y
 oFDwIuBEWlwfADCKNdsUB2ouGLRlkyI3yNxnsn0LmtEHFnd8lp9dHETeq9V7B3eAbECk
 YbK38DFNw5EhFNeLKZSZOKUOO7GF+13xBKfW2tnUA2ve9U0dAVSAJg3w2GZBWL2IBb63
 0L5yMn14AXi1qPv0aF8zdexS5+uxP8Tt30g5FwvZkAZwUde4w2ykwLS/GiMfPVmll50K
 +ZPOZRW1H8BGBUW/ffORyRRos9ZJkrXW5F50r3PXKa4TsuTpuD9gp2SpXtR88HKDaEgx
 DOOw==
X-Gm-Message-State: AO0yUKUbmn/l6sO1EJ78HeQoWa72VzLw+8ymwFbqjPCLtb1O5X7ieAEr
 VL8J5vItRxR0vr/QVfzud9DPQ6zW9gtMW560FBKS+A==
X-Google-Smtp-Source: AK7set+5ffFW8zJcHOM6U6bOu60y+a3DhTyYtgITAu8oAbaaN4sSb4uNMDU+Vpm0mHlNkFcfChPQ8aLmI0Am5hnYUs8=
X-Received: by 2002:a65:60d4:0:b0:503:77c9:45aa with SMTP id
 r20-20020a6560d4000000b0050377c945aamr3152909pgv.9.1677756107659; Thu, 02 Mar
 2023 03:21:47 -0800 (PST)
MIME-Version: 1.0
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
 <CAFEAcA_ok_VSAWk2uqhTs5sF2y3C_JmBNkb8HUGMX6ZX-xdVoA@mail.gmail.com>
 <87356ocp56.fsf@linaro.org>
 <CAFEAcA9X9nQ-6iYqGV9fWWmzDU_SE1ADed6xToOoDmMbvEBkuA@mail.gmail.com>
 <CAHDbmO19_HT7ZgtdvWfzp-BEn3uyhw7NKAW9f9adSHoaZ1mEug@mail.gmail.com>
 <CAFEAcA-Pve7oOuDmP=BDSt5Smdn8MUg2y47Y6PL3YMXwg=Q4Sw@mail.gmail.com>
 <eb6e47c4-546e-b191-d142-009b52b1e3fa@linaro.org>
In-Reply-To: <eb6e47c4-546e-b191-d142-009b52b1e3fa@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2023 11:21:36 +0000
Message-ID: <CAFEAcA_ztebfE1+nPx0X=3QJCssoDNceDsZ4=SBbAxywY7jO7g@mail.gmail.com>
Subject: Re: [PULL v2 00/24] testing updates (gitlab, cirrus, docker, avocado,
 windows)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 2 Mar 2023 at 11:15, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> On 2/3/23 11:56, Peter Maydell wrote:
> > On Wed, 1 Mar 2023 at 19:47, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
> >>
> >>  From the other thread:
> >>
> >> I think the underlying config needs updating:
> >>
> >>    .git/modules/tests/fp/berkeley-testfloat-3/config
> >>
> >> I'm surprised the git config for submodules doesn't carry the metadata=
.
> >
> > Yeah, in my local repo that I merge stuff with that file
> > does still have a github URL:
> > url =3D git://github.com/cota/berkeley-testfloat-3
> >
> > So I guess my questions are:
> >   (1) why hasn't this been a problem up til now ?
> >   (2) does this mean that if I merge this then everybody will
> >       need to manually go in and update this file somehow
> >       to be able to pull the updated qemu master ?
>
> I assume you are not passing --disable-git-update or
> --with-git-submodules to ./configure.

No, I don't do that. But this problem happens before we
get anywhere near configure, when I try to do the
'git fetch' of the main repo!

thanks
-- PMM

