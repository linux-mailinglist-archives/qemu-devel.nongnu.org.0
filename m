Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9AF2DE7F3
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 18:19:22 +0100 (CET)
Received: from localhost ([::1]:50424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqJPV-0001yG-SE
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 12:19:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kqJMG-0000eP-8h
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 12:16:00 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:39446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kqJME-0000ys-AI
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 12:15:59 -0500
Received: by mail-wm1-x334.google.com with SMTP id 3so3364612wmg.4
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 09:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Vth70PH+rfGu+R7qK9Psq81gE4Gg2tc7M/IFxB4n8sc=;
 b=MvpChmAD5XupTZ36VUPvViZlvakpxw08wVEDUFIBSdZIeoI9+EUZGKmVCdY/Rj9Pe/
 cfUlJb8iXQZwFPmqIMz/gAHYHZUXY6hs2AV6DewscBS2KIuURItZfHvNRBkHH/ZiBwMz
 gUuPNo73pv+lPglTeQeM42prgkpQqYNN084pQiKR5RSlfev7iM14E+IsIDDnM9H5/Tp1
 phIaXc5VMsB2icTd/mdC85FzSCz39oWIZSYzJ5sZ825kTNPFu3bHBZHgn2m1ScV/+aA7
 AkGPrQr1VBHqrn3V5Qj78BPuWr7ZFTEOzCzgg/FURn/aaXgfL9D1WpIw4X+dBsHj7zx/
 kTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Vth70PH+rfGu+R7qK9Psq81gE4Gg2tc7M/IFxB4n8sc=;
 b=JmjARa00TqV9B0W0AzZYiSFN8/DXwHdky91Uj5CnYQJMvb6oHQPZvAM6awkdvnSULU
 5z2oJlE6roI875bC54+Zfbb2xYUb09hsDAbXEO2DVwznsc12Fq8U2dNBTkSrWS2LoXH+
 VdOWyzfDhrcULo1mzvnFTnP2dioG+l+/BDSa9JjlbUm0uw/uws/t88fBGWZlVP9y42Mb
 9g6EtOAcNmF6Ycoygy6ff5YXAypgFQTFNl79WWg4dJd8sP0SoN4mbq/LAXwyh2aOmOYc
 2tnYWrVFkigaYRKO0qxX2HZ3ErQRCJZgpspQn5tfhfVsGOxO0NyoCuqoUc1NEJDbGDM3
 VYag==
X-Gm-Message-State: AOAM532jV9Cz2rkfOGXA4G9WqeuUp2+dgkH+0tb5x0Ig58DJ6CwFhYbV
 89PXXqW1VbIlpe3XO0YQ+cRv0g==
X-Google-Smtp-Source: ABdhPJw8OUoPH7yVm2p+nKywVCIi1jGl5TjRcnlHDQwMbsWbp+6k9gFLEQ0OXYoyElcFxSpGyw4hJA==
X-Received: by 2002:a1c:5fd4:: with SMTP id t203mr4959134wmb.15.1608311756746; 
 Fri, 18 Dec 2020 09:15:56 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h4sm13737203wrt.65.2020.12.18.09.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 09:15:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6B1DC1FF7E;
 Fri, 18 Dec 2020 17:15:54 +0000 (GMT)
References: <20201217094330.17400-1-alex.bennee@linaro.org>
 <CAFEAcA8SAGVe44y=6wHC_MxcmxUE=cSu5DGs-0Md3Zt+ZZrS+A@mail.gmail.com>
 <87v9d0q9rr.fsf@linaro.org>
 <CAFEAcA9dFV5ym=N1XQBJrXHYgu5NNRJC8eB9pPRaK2CokHoHxg@mail.gmail.com>
 <87pn37qqh1.fsf@linaro.org>
 <CAFEAcA-UmyTw8Sn5yZrZFxumJRPv-oGg4uL++7av0oTh8fEAMw@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v2 00/11] testing and configure updates
Date: Fri, 18 Dec 2020 16:52:42 +0000
In-reply-to: <CAFEAcA-UmyTw8Sn5yZrZFxumJRPv-oGg4uL++7av0oTh8fEAMw@mail.gmail.com>
Message-ID: <87blerqblh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 18 Dec 2020 at 11:54, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>> > No, the 'alldbg' build is the one that does do a 'make clean';
>> > the build-not-from-clean build worked (presumably because the
>> > old executable was still left in place from the previous build).
>>
>> Hmm I wonder if it's related to the configure options then. What's your
>> configure setup for that build?
>
> '../../configure' '--cc=3Dccache gcc' '--enable-debug'
> '--python=3Dpython3'

So I did the following:

  git checkout af3f37319cb1e1ca0c42842ecdbd1bcfc64a4b6f
  cd build/bisect
  rm -rf *
  '../../configure' '--cc=3Dccache gcc' '--enable-debug' '--python=3Dpython=
3'
  make -j30
  make check-qtest

All ok, then

   git checkout pull-testing-171220-2
   cd build/bisect
   make clean
   ag -r "moxie" | wc -l

And sure enough there is a lot of detritus left (21 lines by ag's
counting). However:

  make -j30
  make check-qtest

still passes and doesn't attempt to do anything with moxie. So I'm kind
of stuck as to what to do now? Maybe we can compare detritus and see
what is left in your tree that causes the test system to get confused
and make "clean" really mean it.

  $ ag -l -r "moxie"
  Makefile.ninja
  moxie-softmmu-config-target.h
  qapi/qapi-visit-misc-target.c
  qapi/qapi-events-misc-target.h
  qapi/qapi-types-machine.h
  qapi/qapi-introspect.c
  qapi/qapi-types-misc-target.h
  qapi/qapi-visit-machine.c
  qapi/qapi-visit-misc-target.h
  qapi/qapi-events-misc-target.c
  qapi/qapi-types-machine.c
  meson-info/intro-buildsystem_files.json
  docs/qemu-qmp-ref.7
  docs/interop/qemu-qmp-ref.html
  docs/system/deprecated.html
  docs/system/index.html
  moxie-softmmu-config-devices.mak
  moxie-softmmu-config-devices.h
  build.ninja

I'm surprised about build.ninja and Makefile.ninja? Don't they get
regenerated by the configure?

>
> -- PMM


--=20
Alex Benn=C3=A9e

