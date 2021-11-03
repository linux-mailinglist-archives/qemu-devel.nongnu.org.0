Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E59944453C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 17:04:17 +0100 (CET)
Received: from localhost ([::1]:50984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miIkJ-0003dz-PI
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 12:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1miIiO-00009D-Lf
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 12:02:16 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:38745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1miIiL-0005xX-Vh
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 12:02:15 -0400
Received: by mail-qk1-x72b.google.com with SMTP id bi29so2776739qkb.5
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 09:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lzC8jH9bx/IM1iB/CS1SDZY7jaNLzqukG3Q9J54t9/M=;
 b=MMYGySNCMp6+hdfCKyIEq7Nh01HVtqL5qD4VslQSTpDaJgm9H/Nj3zUwCnePovuaRv
 OOJ9VlemyzKtlK8saMkP6nxipGRIii/M+jMDHbeUqjfz93Sjl3jrdwrlRBHUw4deGcHh
 ykwSch2i9qy93R4BkK073ScxNUFBmQ0/GjQ6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lzC8jH9bx/IM1iB/CS1SDZY7jaNLzqukG3Q9J54t9/M=;
 b=Nqf63twRbrE4wnIci98egtuftZaWyZ29fmCLjSXlA200PYkBQgICTjqz/hz/hRxyjF
 8KzoLBqD4wti8klMKpDob+o4mRig+Z0CGDK5+ElPCAhktFPZPaERNcMnPP3t3RsgJBWc
 g7ObTGb583cpcZGVrmW8sn4XGxI7F7n+LpkxJSVlScwBAOOEfBaAY/InNsio0qQb4iSQ
 Cgql9EoFIvgBXrcFCnpi3rHlWsZDrEsc9vyIRAaR56nuhHbwuUQAS4Hd1ug6wi6jxsPa
 Xr9jmBi/+hitcjRHPtcOAtJjNdUxB5i3/HWG3scxGqGjptDUJG654IUbnVWy2ZLbcMjK
 LvCg==
X-Gm-Message-State: AOAM532KAPTa7W+c4ybfSoseQL/LvuuzymTKwcnnAZprHfPC7tWJ5qqa
 Y0MMaGe4dmWo8CfxjkXHMk04jg==
X-Google-Smtp-Source: ABdhPJw4H6ckZ+2UO7KEIyOV2GawmmRnekm4k+gy7uCdcUBTiBTfWGErKGgCM4wVtwy5mqI2ZOc5gw==
X-Received: by 2002:a05:620a:2893:: with SMTP id
 j19mr37124628qkp.21.1635955332748; 
 Wed, 03 Nov 2021 09:02:12 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-e929-65d4-8978-cf6f.res6.spectrum.com.
 [2603:6081:7b01:cbda:e929:65d4:8978:cf6f])
 by smtp.gmail.com with ESMTPSA id v12sm1853426qkp.96.2021.11.03.09.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 09:02:11 -0700 (PDT)
Date: Wed, 3 Nov 2021 12:02:09 -0400
From: Tom Rini <trini@konsulko.com>
To: Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v5 00/26] fdt: Make OF_BOARD a boolean option
Message-ID: <20211103160209.GE24579@bill-the-cat>
References: <20211026002344.405160-1-sjg@chromium.org>
 <CAHFG_=WdKL-WcaNJxwqMRHBgVQZy9SRz11mYDKJifXEnQyQSXg@mail.gmail.com>
 <CAPnjgZ0MGr+2tcSziB8DWXZPmv6Q=9ecs_6RK=N20n3-XJiL5w@mail.gmail.com>
 <CAHFG_=Vr6VkJy+d0MaPvVsoXYgvdB5xd2P5FuvF2w63bxSm4cw@mail.gmail.com>
 <CAPnjgZ3Gr+m+sTHDOpW+RFQ6rTtbriY4TpU3bjzqZB79f43Ycw@mail.gmail.com>
 <d3ca9672e7f97f07@bloch.sibelius.xs4all.nl>
 <CAPnjgZ0r04-_K+8JkXhzxDeW5pg3FSrnJbwA6Ghd_a_=jVKKeg@mail.gmail.com>
 <d3caad562467ca29@bloch.sibelius.xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="z3clA4SBh6LNYU5e"
Content-Disposition: inline
In-Reply-To: <d3caad562467ca29@bloch.sibelius.xs4all.nl>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=trini@konsulko.com; helo=mail-qk1-x72b.google.com
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
Cc: linus.walleij@linaro.org, fitzsim@fitzsim.org, qemu-devel@nongnu.org,
 seanga2@gmail.com, u-boot@lists.denx.de, francois.ozog@linaro.org,
 swarren@nvidia.com, Oleksandr_Andrushchenko@epam.com, xypron.glpk@gmx.de,
 michal.simek@xilinx.com, vanbaren@cideas.com, swarren@wwwdotorg.org,
 andre.przywara@arm.com, agraf@csgraf.de, Anastasiia_Lukianenko@epam.com,
 albert.u.boot@aribaud.net, mbrugger@suse.com, Simon Glass <sjg@chromium.org>,
 ilias.apalodimas@linaro.org, awilliams@marvell.com, tuomas.tynkkynen@iki.fi,
 bmeng.cn@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--z3clA4SBh6LNYU5e
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 03, 2021 at 09:22:58AM +0100, Mark Kettenis wrote:
> > From: Simon Glass <sjg@chromium.org>
> > Date: Tue, 2 Nov 2021 19:20:51 -0600
> >=20
> > Hi Mark,
> >=20
> > On Wed, 27 Oct 2021 at 16:30, Mark Kettenis <mark.kettenis@xs4all.nl> w=
rote:
> > >
> > > > From: Simon Glass <sjg@chromium.org>
> > > > Date: Wed, 27 Oct 2021 12:23:21 -0600
> > > >
> > > > Hi Fran=E7ois,
> > > >
> > > > On Wed, 27 Oct 2021 at 09:14, Fran=E7ois Ozog <francois.ozog@linaro=
=2Eorg> wrote:
> > > > >
> > > > >
> > > > >
> > > > > On Wed, 27 Oct 2021 at 16:08, Simon Glass <sjg@chromium.org> wrot=
e:
> > > > >>
> > > > >> Hi Fran=E7ois,
> > > > >>
> > > > >> On Tue, 26 Oct 2021 at 00:07, Fran=E7ois Ozog <francois.ozog@lin=
aro.org> wrote:
> > > > >> >
> > > > >> > Hi Simon
> > > > >> >
> > > > >> > Position unchanged on this series: adding fake dts for boards =
that generate their device tree in the dts directory is not good. If you ha=
ve them in documentation the it is acceptable.
> > > > >>
> > > > >> I think we are going to have to disagree on this one. I actually=
 used
> > > > >> the qemu one in testing/development recently. We have to have a =
way to
> > > > >> develop in-tree with U-Boot. It does not impinge on any of your =
use
> > > > >> cases, so far as I know.
> > > > >
> > > > > I am not the only one in disagreement... You just saw Alex B=E9n=
=E9e from Qemu saying the same thing.
> > > > > I understand the advanced debug/development scenario you mention.
> > > > > But locating the DT files in the dts directory is mis-leading the=
 contributors to think that they need to compile the DT for the targeted pl=
atforms.
> > > > > For your advanced scenario, you can still have the dts in the doc=
umentation area, or whatever directory (except dts). compile it and supply =
to U-Boot.
> > > >
> > > > We have this situation with rpi 1, 2 and 3 and I don't believe anyo=
ne
> > > > has noticed. U-Boot handles the build automatically. If you turn off
> > > > OF_BOARD, it will use the U-Boot devicetree always so you know what=
 is
> > > > going on.
> > >
> > > Until.  The Raspberry Pi foundation releases a new firmware that
> > > configures the hardware differently such that the addresses in the
> > > U-Boot devicetree are wrong and nothing works anymore.  Can't speak
> > > for the rpi 1, but this has happened in the past for the rpi 2 and 3
> > > as well as more recently on the rpi 4.
> >=20
> > So I update my SD card with a new private-binary bootloader and things
> > stop working? I think I can narrow that one down :-)
> >=20
> > > > We can add a message to U-Boot indicating where the devicetree came
> > > > from, perhaps? That might be useful given everything that is going =
on.
> > > >
> > > > As in this case, quite often in these discussions I struggle to
> > > > understand what is behind the objection. Is it that your customers =
are
> > > > demanding that devicetrees become private, secret data, not included
> > > > in open-source projects? Or is it just the strange case of QEMU that
> > > > is informing your thinking? I know of at least one project where the
> > > > first-stage bootloader produces a devicetree and no one has the sou=
rce
> > > > for it. I believe TF-A was created for licensing reasons...so can y=
ou
> > > > be a bit clearer about what the problem actually is? If a board is
> > > > in-tree in U-Boot I would like it to have a devicetree there, at le=
ast
> > > > until we have a better option. At the very least, it MUST be
> > > > discoverable and it must be possible to undertake U-Boot development
> > > > easily without a lot of messing around.
> > >
> > > How many people are there out there that work on U-Boot that don't
> > > have a Linux source tree checked out?  Even I have several of those
> > > lying around on my development systems and I am an OpenBSD developer =
;).
> >=20
> > So it is OK to have the DT in Linux but not in U-Boot? I don't even
> > know what to say that. How does that square with your point above?
>=20
> Ideally the DT's and DT binding would move out of the Linux tree and
> into a repository of their own.  But until that is the case, the Linux
> tree is the source of truth.

Yes, and this is a long known and slowly in progress kinda-sorta thing.
A few more people helping to review things, etc, are always appreciated
by upstream.

> > I am not talking about disabling OF_BOARD, just making it *possible*
> > to do so.
>=20
> And I don't think it makes sense to do so on most boards that have
> OF_BOARD in their config.

It should probably close to never be done, unless it's some case where
it's crazy-hard to update the device tree correctly for the platform.
So it's not a problem on Pi as it's just on the FAT32 partition right
there, it's not a problem on Apple M1 as ..however you do it.., and so
on.

I can almost hear the argument from here about "but I'm doing some work
for U-Boot and need to add..." and that's where we need to figure out
what to do next.  Yes, we likely need to have some bindings of our own,
and developing those AND pushing them upstream will require iterating
here.  So the developer point of view of how do I whack things to supply
my own is valid.  But it's not the default use case.  The default use
case is building the firmware that users rarely see, because their
system boots to the OS and they get down to using their system.

--=20
Tom

--z3clA4SBh6LNYU5e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmGCsoEACgkQFHw5/5Y0
tyxLUwwAsZaAhwX5XZnDDRHNuK9co4g3poUILLhojj78zqRTT83HtnVUR5VMWqhS
xwmifR9l9GlE5bycnQ5CyExC5jiR+Ko3akR+CBOV2AMlW8fSNsaJBrOme3EuY+J8
BL8Yta+N6kh0rw7qT4lJ0UTZp+RPOyQvVGupKBW3YIEBfcW8//nXtl8znYhsr8/Y
09rFXcxDnG1O+xVZL2tAoCsTm9sWAeUyevM97mkfCsYLWMT6cq31wzDxBpxkN4I7
aSzE7E0S6i/sYcr7S+p3EK9LOqIckgOJNad12w8BlW7V7sUKScvyOktFEYzWFOBa
c+7wPG3cS17UZGT7LBe7zSMf5IzUlfZqB/wWGcpcshwFmyZ5YKenBP22nfcezU5y
ZJMbyd94Z6DAp41lgICkeGHgQcm+mh6qbtPPtV946bhxSQ1Oln5WIPM2JMn66SmJ
SUmDUWDt7ExRboY6wZGJJrItncqeD+8f87eg6S8KOydd507XQbTlTalnTYG+Af9A
aOCmfoL5
=kVvZ
-----END PGP SIGNATURE-----

--z3clA4SBh6LNYU5e--

