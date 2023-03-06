Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C23576ABD1C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 11:43:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ8Hv-0001uQ-QL; Mon, 06 Mar 2023 05:41:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pZ8Ht-0001u1-Jk
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 05:41:49 -0500
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pZ8Hr-0008B1-Rh
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 05:41:49 -0500
Received: by mail-lj1-x230.google.com with SMTP id x6so9136706ljq.1
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 02:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678099305;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vdb+Oa3DdY5Q34maZ2y9hOtaeB4aNumFo5zJRK6Zwic=;
 b=LXeWP1bt7jI+ZGWLevFaorqsGHAAXR8nrnfyS4h396p87zUWQJOF9r4hE9CkQwpXKy
 TP4+Ll+k/kmOLgH/4IeV+zTSlN2MWQbMm41VOpG0sxw75v55V2m3MzihvPW/G2jzk2I5
 ZV+tjusAIyWoeb72TOaT/+B6SPB1Bsx7VZZv6a8LB6qploZZTU218igV5vRjNgVkzMge
 fRFG/u9m4bPwv8UKmt9wzZuPxnyUdTL1HUmOdPOZBrU1JF0Bx5OoWbxMVlgujcWi+9j8
 RZH5N7KZtSZNp6D7gvHLX6R9fCYv1kMt4S/NLgCHWtvtYSHrNeoF+6KzTb65MPMm0kYl
 4o4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678099305;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vdb+Oa3DdY5Q34maZ2y9hOtaeB4aNumFo5zJRK6Zwic=;
 b=lH2G0haJRKRioUaNn2RXRC7KTuAOk007dUS7uOnmRKMDptnuOJnrEjRx1lZAWtt1/E
 ut77lOq6MpUiSARKinJnjPm4FnTaPunCbUnjED1+4Tt9b3SzLaxKILIPMcv55qd2iEpN
 VkIMdq1DaeljX3m7ue4PLLq/GuVsB5DIDvFJ23dp2AWUeY4nKfMzRDbmTXXV9koB5JGe
 EzYTkrjhIzpPdJdz9NyYZBsT7A2TsYEd0v4FRB/We9Zi82TGbXkHDP4vfb/ob0uR2z44
 lHgTv4CtazCOSCb/T3UNOaqOmYc26i+wlAIBylnHMej1KqG+nXZCM9+BLus6uC3Fmgzo
 KMmQ==
X-Gm-Message-State: AO0yUKUAnWXzxDifsRgmqRjtEx+/QLVaPzHc7MhFQwIzmJvLTMfAijMg
 Q2HY5wdtvm700CveOwMij5gStiO1z+vX1UF2BDM=
X-Google-Smtp-Source: AK7set9XedOoIeNfexxCa9zaiJwPG8ercFlAF1RCA8h63GcKlHhXoRj8HWx7M9/f2sKvlaWZ5FMJqOkkcBt9Ebc+QJg=
X-Received: by 2002:a05:651c:10a2:b0:295:8ef2:871d with SMTP id
 k2-20020a05651c10a200b002958ef2871dmr3067268ljn.4.1678099305369; Mon, 06 Mar
 2023 02:41:45 -0800 (PST)
MIME-Version: 1.0
References: <20230302131848.1527460-1-marcandre.lureau@redhat.com>
 <ZAW7DcpRDcGF2VQx@redhat.com>
 <CAMxuvazE-=uUQZ73spaYBC1ZvyucGNiSdqc3FY1Xrp3Uese2jQ@mail.gmail.com>
 <ZAXBTCEOYBp5WTo8@redhat.com>
In-Reply-To: <ZAXBTCEOYBp5WTo8@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 6 Mar 2023 14:41:33 +0400
Message-ID: <CAJ+F1CK3JjRwA2w=FQ2Vd2Rc-sBa2GwJh-1R+ig==c1SJek_xg@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add meson wrap fallback for slirp & dtc
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi

On Mon, Mar 6, 2023 at 2:33 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Mon, Mar 06, 2023 at 02:19:25PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Mon, Mar 6, 2023 at 2:06=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrang=
e@redhat.com>
> > wrote:
> >
> > > On Thu, Mar 02, 2023 at 05:18:44PM +0400, marcandre.lureau@redhat.com
> > > wrote:
> > > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > > >
> > > > Hi,
> > > >
> > > > Meson "wrap" is a mechanism to build dependencies that doesn't rely=
 on
> > > git
> > > > submodules and integrate external dependencies as subproject()s.
> > > >
> > > > This offers developpers a simpler way to build QEMU with missing sy=
stem
> > > > dependencies (ex, libslirp in my case), but also simplify the fallb=
ack
> > > build
> > > > definition of dtc/libfdt.
> > >
> > > Do we actually need this facility though ? We've already determined
> > > that every platform we need has libslirp now, and IIUC Thomas determi=
ned
> > > recently that dtc is also available everywhere we need it to be.
> > >
> >
> > The main benefit is for developers: you have the source code of
> > QEMU-related projects with the source tree. Code navigation, debugging,=
 or
> > various build tests are easier (compilation flags, static build etc). Y=
ou
> > don't have to "pollute" your system with (what could be) QEMU-specific
> > libraries.
>
> That's pushing developers to use builds of 3rd party libararies
> that don't actually match what our users are going to end up
> deploying with though.

The combinations of versions used by developers is already virtually
limitless. I don't think adding a specific upstream version/revision
to the mix is making the situation worse. It could be even the
opposite, if we manage to build an "official" static version of qemu
for example (with specific dependencies).

>
> > > So why would we want to continue to special case these two libraries,
> > > out of all the many many many other libraries we also have deps on.
> > >
> >
> > They are more often updated, or developped with QEMU? For the reasons I
> > listed, I would welcome more wrapped subprojects.
>
> I don't think that they actually have more frequent updates that other
> libraries. In any case from QEMU's POV it doesn't matter how often upstre=
am
> does releases. We're targetting the existing versions available in the OS
> and so don't want to use bleeding edge upstream releases.

That doesn't change that policy.

>
> This also significantly expands our testing matrix. For each library
> we have the possiblity that users have the distro version vs the wrapped
> version. That is many new combinations users are exposed to, that we are
> realistically never going to have the bandwidth to test in CI.

yes, I would consider this a tier 2 support, since it aims at
developers, and not having to cover it in CI.

--=20
Marc-Andr=C3=A9 Lureau

