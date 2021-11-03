Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30497444700
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:25:30 +0100 (CET)
Received: from localhost ([::1]:50550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miK0v-0000Xd-Al
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:25:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1miJwv-0001m5-8h
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:21:21 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:36498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1miJws-0008LG-L6
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:21:20 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id d6so3468527qvb.3
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 10:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SIlmhq41q72caEMjTx0feg3tirEDyOrT55IOGBZq3EI=;
 b=XU2edMe/trFa3gXtW3XNXcJDk6LLRJmQmJrHQ7A2rzmOQWrvhlG0F104ulQMrAckdA
 v+ShQfdeH1rSd4x/zls6ASe+DU8eC/uJhwwjOf4Km/e+6A2j0hEOk8Fwb4LddHtc/4VH
 Q5JTfQjE2TOOboYJUVLiBWqWIWKT/hhanfPFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SIlmhq41q72caEMjTx0feg3tirEDyOrT55IOGBZq3EI=;
 b=FyZ152SSvKC87AGR3ZbGOBQnfFcniEIIC01CcHU3i6kiXqvRMtUY9g6dxToIiwhr56
 /9vQljTMSEl+cR19ghfRPXyZW9WPCMyHtZsjf+8pPv1aqjFRh/7xZR5jP29WINbb25Cp
 WV3S6OdZrYRmwlGObofBzD4J+cOMcdL8VYagSGtcpGoOo2u5apX87uF4FsL1Aiic0KMi
 fHXoZs9tNk7FkfNE25Ck3+PP+ZFz6noF6JnPIjUnSdNYUPG5w1EIMMFzWuUwqECXRJiP
 2VwynK9HSKlXFWi7gU8/3pXqe4y1aLoAiy5SePCePyUfN/cLgKtmMTqla7tqlcdkCfPW
 VzGw==
X-Gm-Message-State: AOAM531OtGJPnKcTS60C317tO5yTQMZxwXBoOTR58JxdV/YTnfOQC3Q1
 jfTKhWe5BFWC2IL29oa7ogn9bA==
X-Google-Smtp-Source: ABdhPJw9TN1akbD7ctXSBScmoBhMBiVU+9qIRU8wx1eqi9UCtj+PBW8oovVC/lM6V/J7QdyYiKuE4g==
X-Received: by 2002:ad4:5cc1:: with SMTP id iu1mr26678487qvb.58.1635960077572; 
 Wed, 03 Nov 2021 10:21:17 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-e134-a4dd-2b9a-4388.res6.spectrum.com.
 [2603:6081:7b01:cbda:e134:a4dd:2b9a:4388])
 by smtp.gmail.com with ESMTPSA id m16sm2072114qtx.46.2021.11.03.10.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 10:21:16 -0700 (PDT)
Date: Wed, 3 Nov 2021 13:21:14 -0400
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v5 00/26] fdt: Make OF_BOARD a boolean option
Message-ID: <20211103172114.GG24579@bill-the-cat>
References: <20211026002344.405160-1-sjg@chromium.org>
 <CAHFG_=WdKL-WcaNJxwqMRHBgVQZy9SRz11mYDKJifXEnQyQSXg@mail.gmail.com>
 <CAPnjgZ0MGr+2tcSziB8DWXZPmv6Q=9ecs_6RK=N20n3-XJiL5w@mail.gmail.com>
 <CAHFG_=Vr6VkJy+d0MaPvVsoXYgvdB5xd2P5FuvF2w63bxSm4cw@mail.gmail.com>
 <CAPnjgZ3Gr+m+sTHDOpW+RFQ6rTtbriY4TpU3bjzqZB79f43Ycw@mail.gmail.com>
 <20211027192514.GL8284@bill-the-cat>
 <CAPnjgZ1XF+NCRhaCwC=CY1YurD3=GHTyUNV4q4OsSqGccms-BA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="NGz5rmaP0KprYzG0"
Content-Disposition: inline
In-Reply-To: <CAPnjgZ1XF+NCRhaCwC=CY1YurD3=GHTyUNV4q4OsSqGccms-BA@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=trini@konsulko.com; helo=mail-qv1-xf2f.google.com
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
 Matthias Brugger <mbrugger@suse.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Aaron Williams <awilliams@marvell.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--NGz5rmaP0KprYzG0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 03, 2021 at 10:45:11AM -0600, Simon Glass wrote:
> Hi Tom,
>=20
> On Wed, 27 Oct 2021 at 13:25, Tom Rini <trini@konsulko.com> wrote:
> >
> > On Wed, Oct 27, 2021 at 12:23:21PM -0600, Simon Glass wrote:
> > > Hi Fran=E7ois,
> > >
> > > On Wed, 27 Oct 2021 at 09:14, Fran=E7ois Ozog <francois.ozog@linaro.o=
rg> wrote:
> > > >
> > > >
> > > >
> > > > On Wed, 27 Oct 2021 at 16:08, Simon Glass <sjg@chromium.org> wrote:
> > > >>
> > > >> Hi Fran=E7ois,
> > > >>
> > > >> On Tue, 26 Oct 2021 at 00:07, Fran=E7ois Ozog <francois.ozog@linar=
o.org> wrote:
> > > >> >
> > > >> > Hi Simon
> > > >> >
> > > >> > Position unchanged on this series: adding fake dts for boards th=
at generate their device tree in the dts directory is not good. If you have=
 them in documentation the it is acceptable.
> > > >>
> > > >> I think we are going to have to disagree on this one. I actually u=
sed
> > > >> the qemu one in testing/development recently. We have to have a wa=
y to
> > > >> develop in-tree with U-Boot. It does not impinge on any of your use
> > > >> cases, so far as I know.
> > > >
> > > > I am not the only one in disagreement... You just saw Alex B=E9n=E9=
e from Qemu saying the same thing.
> > > > I understand the advanced debug/development scenario you mention.
> > > > But locating the DT files in the dts directory is mis-leading the c=
ontributors to think that they need to compile the DT for the targeted plat=
forms.
> > > > For your advanced scenario, you can still have the dts in the docum=
entation area, or whatever directory (except dts). compile it and supply to=
 U-Boot.
> > >
> > > We have this situation with rpi 1, 2 and 3 and I don't believe anyone
> > > has noticed. U-Boot handles the build automatically. If you turn off
> > > OF_BOARD, it will use the U-Boot devicetree always so you know what is
> > > going on.
> >
> > That we have to have so many separate rpi build targets, and can't just
> > use rpm_arm64 and add rpi_arm32 is not a good feature.  The various rpi
> > configs that use CONFIG_OF_EMBED are on your list of things that need to
> > be cleaned up, yes?
>=20
> Yes, it should use CONFIG_OF_SEPARATE. It think it didn't for
> historical reasons, but not sure why.

I think because it wasn't clear enough at the time how to say "just use
the dtb given to us as-is".

> > > We can add a message to U-Boot indicating where the devicetree came
> > > from, perhaps? That might be useful given everything that is going on.
> > >
> > > As in this case, quite often in these discussions I struggle to
> > > understand what is behind the objection. Is it that your customers are
> > > demanding that devicetrees become private, secret data, not included
> > > in open-source projects? Or is it just the strange case of QEMU that
> > > is informing your thinking? I know of at least one project where the
> > > first-stage bootloader produces a devicetree and no one has the source
> > > for it. I believe TF-A was created for licensing reasons...so can you
> > > be a bit clearer about what the problem actually is? If a board is
> > > in-tree in U-Boot I would like it to have a devicetree there, at least
> > > until we have a better option. At the very least, it MUST be
> > > discoverable and it must be possible to undertake U-Boot development
> > > easily without a lot of messing around.
> >
> > What I don't understand here is why or how U-Boot is supposed to become
> > the source of truth for device trees.  The general goal is that the
> > device tree be something that actually comes along on the hardware,
> > because it's stable enough and correct enough that it's not going to be
> > changed from one OS kernel release to the next.  That should be where
> > the correct and true tree comes from, the device itself.
>=20
> Is that the confusion here? I am not saying that U-Boot becomes the
> 'source of truth' (horrible term). Where did that idea come from?
>=20
> By hardware you mean firmware, I think. If you are developing
> firmware, you need control of the devicetree. It is part of the
> firmware.

I mean the case where U-Boot is provided the device tree to use, by
whatever external and non-U-Boot means.  I keep saying "source of truth"
as a way to clarify that the correct and only required device tree is
given to us at run time.  If U-Boot needs to know something, it's
already provided there.  If it's not there, we don't need to know it.
This is also why there's not a reason to normally build a device tree
in U-Boot since it will not be used.  And if we aren't building it, we
don't need it in the source tree either since it's going to introduce
confusion.  Quoted in part or referenced under doc/ ?  OK, that can make
sense in some cases.

--=20
Tom

--NGz5rmaP0KprYzG0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmGCxQYACgkQFHw5/5Y0
tyzJeQv/dVrDmpMNzgfwnGXG2SBdXMJP5iNs3TLIp1BR+od8DDoxaAI1ZUQwTAdg
uOeWAiIpB7xzR4sSpEpSe8EEkExb7nuXCALwf9q8TKIMjwWcH53Ad1yh8pywgdUL
W12a6wirlDq40Up0UOG3AYCLyfT49FmocJae3ylp/wo0J73DevbjLiVl8a/+4MR/
hDRtr1/aeMAet0A1rEtYYo75YcPpcmqCZHMXfJCXAg8X2BCzxbDTfKftMCEy1d/l
n5/MOqXu83bAdQlWbTfoNUNMy6+p6kOdmfxNkNG5i6Nta+rIUY0wXtgjYqL9QPXE
giZbjSFWvhA2N6wpWzSkb69Nrd48DPmZu4EyEvTUxlv5uWhqQ5OjiBPIAvRDR/Ml
1csiatPwFlbtPDBFq2brXfSUEg+l4qnCGX8nvySPtnppXdqEwDG9bGn6zJb+LlPq
bFGxhtTVD/Pp0WlifnWkJAetqZNJHLq5dsvvsl2FKRhiV76qn7B9d7KvyYLR9hl1
MSch3k08
=KaFo
-----END PGP SIGNATURE-----

--NGz5rmaP0KprYzG0--

