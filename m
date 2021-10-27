Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3898143D1DF
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 21:44:00 +0200 (CEST)
Received: from localhost ([::1]:59966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfoq7-00087J-8I
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 15:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mfoMo-0002aL-Mu
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 15:13:42 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:34727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mfoMZ-0002HP-8Z
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 15:13:42 -0400
Received: by mail-qk1-x72d.google.com with SMTP id br18so3514937qkb.1
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 12:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5wjxMfNYQ3rKepOssVkfIw14bMhnvkurX0VPjXsNX1w=;
 b=rBvxC9FuIL/Z04YcLFH1FfFfhVZEjzHHKUzFSzgZQHrED3KRkGKZ1ONgtAPOKU/nzX
 DlPZwwFWRZDwuan0ttwyjV1G/7JfHSx5bzvqLqxPJtVxCStI/OUzJyat2Nl1LFlUh6c/
 aeoPKpqrYoQetHKDhYJQaXDPBjktsvHHg2SGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5wjxMfNYQ3rKepOssVkfIw14bMhnvkurX0VPjXsNX1w=;
 b=yP6B5E8NLe93/NWFDEzqBFoqSolA2Sm9PcoZIvfi/Dgq1R9XN4ayixglNe72R9mJck
 GXz3QAICEus5HlkV2ifsk0gV7hXLHRE+X9m9a1Ck/0iyU/c+4eKGLcW3DAO7Pgwnjv81
 zllqz1OUYO0qruqpa0LdQYlSi4Mb/3Pz2t50CFhuuNTSzmnxGlfVeL9QP3ECINr3ShSF
 i7SOksaSTqXpQGj7qA3f8Izu09L+JNE6tHRTMx0yX7CXn6585ySjhZ6J1bhaU3vJGcUk
 vCst6Ia1QUWzTguOBR4GOck2iCC3M4uSuhLEOcbyc/ObBepP7ie6mKtF7ziYz7OP1jCs
 evAA==
X-Gm-Message-State: AOAM533hsC7fUSuyXFRddfDVdX6An4MHuaMWJH15qDV/YdB8CbmRD3NV
 a9cKf58axFBfkNaVlQ3IOcDzJA==
X-Google-Smtp-Source: ABdhPJyd+fI9mmIsqVj1uNRELe89nheJnzS27LzcNy9pjsymwnPi+0wHoia6i4D0n5hdSLWL8h9jpg==
X-Received: by 2002:a37:91c7:: with SMTP id
 t190mr25679527qkd.282.1635362005956; 
 Wed, 27 Oct 2021 12:13:25 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-0044-6cb5-81ac-bb0c.res6.spectrum.com.
 [2603:6081:7b01:cbda:44:6cb5:81ac:bb0c])
 by smtp.gmail.com with ESMTPSA id bs33sm548821qkb.130.2021.10.27.12.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 12:13:25 -0700 (PDT)
Date: Wed, 27 Oct 2021 15:13:23 -0400
From: Tom Rini <trini@konsulko.com>
To: Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>
Subject: Re: [PATCH v5 00/26] fdt: Make OF_BOARD a boolean option
Message-ID: <20211027191323.GK8284@bill-the-cat>
References: <20211026002344.405160-1-sjg@chromium.org>
 <CAHFG_=WdKL-WcaNJxwqMRHBgVQZy9SRz11mYDKJifXEnQyQSXg@mail.gmail.com>
 <CAPnjgZ0MGr+2tcSziB8DWXZPmv6Q=9ecs_6RK=N20n3-XJiL5w@mail.gmail.com>
 <a9ebcaaf-56bf-e3d0-eceb-64f205e12a84@iki.fi>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6xTM0kUsJcaNctaW"
Content-Disposition: inline
In-Reply-To: <a9ebcaaf-56bf-e3d0-eceb-64f205e12a84@iki.fi>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=trini@konsulko.com; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Sean Anderson <seanga2@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Mark Kettenis <mark.kettenis@xs4all.nl>,
 =?iso-8859-1?Q?Fran=E7ois?= Ozog <francois.ozog@linaro.org>,
 Stephen Warren <swarren@nvidia.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>, Jerry Van Baren <vanbaren@cideas.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Andre Przywara <andre.przywara@arm.com>, Alexander Graf <agraf@csgraf.de>,
 Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Matthias Brugger <mbrugger@suse.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Aaron Williams <awilliams@marvell.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--6xTM0kUsJcaNctaW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 27, 2021 at 06:36:12PM +0300, Tuomas Tynkkynen wrote:
> Hi,
>=20
> On 27.10.2021 17.08, Simon Glass wrote:
> > Hi Fran=E7ois,
> >=20
> > On Tue, 26 Oct 2021 at 00:07, Fran=E7ois Ozog <francois.ozog@linaro.org=
> wrote:
> > >=20
> > > Hi Simon
> > >=20
> > > Position unchanged on this series: adding fake dts for boards that ge=
nerate their device tree in the dts directory is not good. If you have them=
 in documentation the it is acceptable.
> >=20
> > I think we are going to have to disagree on this one. I actually used
> > the qemu one in testing/development recently. We have to have a way to
> > develop in-tree with U-Boot. It does not impinge on any of your use
> > cases, so far as I know.
> >=20
>=20
> How about having the file just contain a single line
>=20
> #include <generated-qemu-arm.dts>
>=20
> ... where this generated-*.dts is not checked to the source tree. Then of
> course comments on how to generate it via qemu -dumpdtb + dtc, with
> appropriate precautions (ie. must be regenerated if qemu command line is
> changed or qemu is upgraded), intended use case, and so forth.

That seems like it would help the development workflow, yes.

--=20
Tom

--6xTM0kUsJcaNctaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmF5pNIACgkQFHw5/5Y0
tyyVWgv+OMyNxIEt5nN5xr4ONaSNLOpnZCX+68vmRauFq/m1DuMxhAl86cdMcCNK
dinDvR/MZBXCgnvnJtWLk5efc5L7Wn85z1xJiPP1vzenuU5vgq2p4TlOkk5EKkPG
N3TZ0BFeYSzGF5wizFlQPzn0QWpyD8R07AghHf3amlIexR3IRgHRfjwnNg9+8nOF
DyPzD1rM9FhgCY7SBbHziYQh6f4sd1xTBQ4ELUDP9Hn+LeY+YqZTCWepaXQmky0R
cprPbTeMEJBWXo0UxkVUWe0r/tNz+o0hvyl8LKTrZklgnNvu5BoddRuSsD9qnN4k
SaSL3cIwyVjOw5EXqDsg+qg/uBkpV5MhabRGWieT/3YQJK7gDMJ6dAkHPQgOh54L
a5EBAnIIclZHtoKpOK+tszNiH99qJ+/9I94thJKspdB3dBB6bPaVYnYde8cPFtUb
TUoyAJyOgLcGF6pbTtZD0o+7o28Tk+PoaQMhIp81v/ExtoikiuNJ0KTcBGZOAIEH
62dDvRKf
=O6am
-----END PGP SIGNATURE-----

--6xTM0kUsJcaNctaW--

