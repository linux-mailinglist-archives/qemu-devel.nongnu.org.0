Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C87C442C3E9
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 16:49:46 +0200 (CEST)
Received: from localhost ([::1]:46818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mafZh-00077U-Jo
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 10:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mafYC-0005mA-KX
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 10:48:12 -0400
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932]:36496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mafYA-0005Mx-IX
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 10:48:12 -0400
Received: by mail-ua1-x932.google.com with SMTP id e10so376050uab.3
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 07:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WZYnln/g/FnQTVzsv5G7fGSQuda6a1W/SKVtJhhPgN8=;
 b=SyntvUMSJRdlhlAQItd7HxcNh5koQDL1NwIOO+oyGZ5W1fK3W3HQCPlMdwgezV3ASh
 5w0T3QJYuZx3PlNIsKne1A12EHkLS2oc3o8zs1fFFDDxuoRg3ULofKopQ5l6KKgWFzNn
 KPEWkeU0eFfAm2S0PlYrP56XpqRxBadbs3Q5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WZYnln/g/FnQTVzsv5G7fGSQuda6a1W/SKVtJhhPgN8=;
 b=x2C5ds56siJiqJ3DqW1Vv8126dRKT+dOsHekv7WDKlbY08XIoTZj1RDYa+vsRvwj7n
 C8wOOTCLCsUjltwOQGDNKqphYt2ES6p/89hB4s8u7pRx6C0KMSLGZYYiZKQ/mX9soHfR
 gtatA8BV1KBJWNk6bY2YJbOKxQJxL54CAJMDw/1CLOSYjXqpM7pl273piN8EF3le4crR
 NJuKCGfMQIWfnxIPOE/ySan3ADoxQxIZnbd6cD4GIFJsI8pzyp7H/RHugItzyFyO2DA4
 SRunHA5zCSKLf0saG0gDtCK7jTxKdOCl+XefQ80A9j8Al7g4Yn2GsgAJuITLeov6P2W4
 LaZQ==
X-Gm-Message-State: AOAM530HP7u4q+qTs8ao/C2RdPyTIsqVeFzVwAoSGROJwe+0Bn7oOGQl
 XjwzuQ48XqbBr8uAHoWGdKmb/HBA39slw1pV/F8t7A==
X-Google-Smtp-Source: ABdhPJydhHxWWK+nZaNw3Oks6wxSBOKGzWC4daPXyyELkUh9hBEj7/+kyY02T6ZcwfpU2dPHjID7U8dNAne7bJlgUl4=
X-Received: by 2002:ab0:4a19:: with SMTP id q25mr29373015uae.143.1634136488416; 
 Wed, 13 Oct 2021 07:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211013010120.96851-1-sjg@chromium.org>
 <CAEUhbmWY5gKmqbipurcDQ0DuNJyv8cLWsnyqx5h+tFqeVng8Ag@mail.gmail.com>
 <20211013013450.GJ7964@bill-the-cat>
In-Reply-To: <20211013013450.GJ7964@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 13 Oct 2021 08:47:56 -0600
Message-ID: <CAPnjgZ3D+h1ov2yL73iz_3zmPkJrM4mGrQLhsKL9qu9Ez0-j2A@mail.gmail.com>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
To: Tom Rini <trini@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=sjg@google.com; helo=mail-ua1-x932.google.com
X-Spam_score_int: -92
X-Spam_score: -9.3
X-Spam_bar: ---------
X-Spam_report: (-9.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
Cc: Liviu Dudau <liviu.dudau@foss.arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 Atish Patra <atish.patra@wdc.com>, Zong Li <zong.li@sifive.com>,
 Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Rainer Boschung <rainer.boschung@hitachi-powergrids.com>,
 Stephen Warren <swarren@nvidia.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Niel Fourie <lusus@denx.de>,
 Michal Simek <michal.simek@xilinx.com>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
 Jerry Van Baren <vanbaren@cideas.com>, Ramon Fried <rfried.dev@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Longchamp <valentin.longchamp@hitachi-powergrids.com>,
 Heiko Schocher <hs@denx.de>, Peter Robinson <pbrobinson@gmail.com>,
 Sinan Akman <sinan@writeme.com>, Thomas Fitzsimmons <fitzsim@fitzsim.org>,
 Wolfgang Denk <wd@denx.de>, Stephen Warren <swarren@wwwdotorg.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Andre Przywara <andre.przywara@arm.com>, Tim Harvey <tharvey@gateworks.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>, Rick Chen <rick@andestech.com>,
 Alexander Graf <agraf@csgraf.de>, Green Wan <green.wan@sifive.com>,
 T Karthik Reddy <t.karthik.reddy@xilinx.com>,
 Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>, Michal Simek <monstr@monstr.eu>,
 Matthias Brugger <mbrugger@suse.com>, Leo <ycliang@andestech.com>,
 Tero Kristo <kristo@kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Aaron Williams <awilliams@marvell.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Tianrui Wei <tianrui-wei@outlook.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
 Padmarao Begari <padmarao.begari@microchip.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Tom, Bin,Fran=C3=A7ois,

On Tue, 12 Oct 2021 at 19:34, Tom Rini <trini@konsulko.com> wrote:
>
> On Wed, Oct 13, 2021 at 09:29:14AM +0800, Bin Meng wrote:
> > Hi Simon,
> >
> > On Wed, Oct 13, 2021 at 9:01 AM Simon Glass <sjg@chromium.org> wrote:
> > >
> > > With Ilias' efforts we have dropped OF_PRIOR_STAGE and OF_HOSTFILE so
> > > there are only three ways to obtain a devicetree:
> > >
> > >    - OF_SEPARATE - the normal way, where the devicetree is built and
> > >       appended to U-Boot
> > >    - OF_EMBED - for development purposes, the devicetree is embedded =
in
> > >       the ELF file (also used for EFI)
> > >    - OF_BOARD - the board figures it out on its own
> > >
> > > The last one is currently set up so that no devicetree is needed at a=
ll
> > > in the U-Boot tree. Most boards do provide one, but some don't. Some
> > > don't even provide instructions on how to boot on the board.
> > >
> > > The problems with this approach are documented at [1].
> > >
> > > In practice, OF_BOARD is not really distinct from OF_SEPARATE. Any bo=
ard
> > > can obtain its devicetree at runtime, even it is has a devicetree bui=
lt
> > > in U-Boot. This is because U-Boot may be a second-stage bootloader an=
d its
> > > caller may have a better idea about the hardware available in the mac=
hine.
> > > This is the case with a few QEMU boards, for example.
> > >
> > > So it makes no sense to have OF_BOARD as a 'choice'. It should be an
> > > option, available with either OF_SEPARATE or OF_EMBED.
> > >
> > > This series makes this change, adding various missing devicetree file=
s
> > > (and placeholders) to make the build work.
> >
> > Adding device trees that are never used sounds like a hack to me.
> >
> > For QEMU, device tree is dynamically generated on the fly based on
> > command line parameters, and the device tree you put in this series
> > has various hardcoded <phandle> values which normally do not show up
> > in hand-written dts files.
> >
> > I am not sure I understand the whole point of this.
>
> I am also confused and do not like the idea of adding device trees for
> platforms that are capable of and can / do have a device tree to give us
> at run time.

(I'll just reply to this one email, since the same points applies to
all replies I think)

I have been thinking about this and discussing it with people for a
few months now. I've been signalling a change like this for over a
month now, on U-Boot contributor calls and in discussions with Linaro
people. I sent a patch (below) to try to explain things. I hope it is
not a surprise!

The issue here is that we need a devicetree in-tree in U-Boot, to
avoid the mess that has been created by OF_PRIOR_STAGE, OF_BOARD,
BINMAN_STANDALONE_FDT and to a lesser extent, OF_HOSTFILE. Between
Ilias' series and this one we can get ourselves on a stronger footing.
There is just OF_SEPARATE, with OF_EMBED for debugging/ELF use.
For more context:

http://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-3-sj=
g@chromium.org/

BTW I did suggest to QEMU ARM that they support a way of adding the
u-boot.dtsi but there was not much interest there (in fact the
maintainer would prefer there was no special support even for booting
Linux directly!) But in any case it doesn't really help U-Boot. I
think the path forward might be to run QEMU twice, once to get its
generated tree and once to give the 'merged' tree with the U-Boot
properties in it, if people want to use U-Boot features.

I do strongly believe that OF_BOARD must be a run-time option, not a
build-time one. It creates all sorts of problems and obscurity which
have taken months to unpick. See the above patch for the rationale.

To add to that rationale, OF_BOARD needs to be an option available to
any board. At some point in the future it may become a common way
things are done, e.g. TF-A calling U-Boot and providing a devicetree
to it. It doesn't make any sense to have people decide whether or not
to set OF_BOARD at build time, thus affecting how the image is put
together. We'll end up with different U-Boot build targets like
capricorn, capricorn_of_board and the like. It should be obvious where
that will lead. Instead, OF_BOARD needs to become a commonly used
option, perhaps enabled by most/all boards, so that this sort of build
explosion is not needed. U-Boot needs to be flexible enough to
function correctly in whatever runtime environment in which it finds
itself.

Also as binman is pressed into service more and more to build the
complex firmware images that are becoming fashionable, it needs a
definition (in the devicetree) that describes how to create the image.
We can't support that unless we are building a devicetree, nor can the
running program access the image layout without that information.

Fran=C3=A7ois's point about 'don't use this with any kernel' is
germane...but of course I am not suggesting doing that, since OF_BOARD
is, still, enabled. We already use OF_BOARD for various boards that
include an in-tree devicetree - Raspberry Pi 1, 2 and 3, for example
(as I said in the cover letter "Most boards do provide one, but some
don't."). So this series is just completing the picture by enforcing
that *some sort* of devicetree is always present.

I can't quite pinpoint the patch where U-Boot started allowing the
devicetree to be omitted, but if people are interested I could try a
little harder. It was certainly not my intention (putting on my
device-tree-maintainer hat) to go down that path and it slipped in
somehow in all the confusion. I'm not sure anyone could tell you that
rpi_3 has an in-tree devicetree but rpi_4 does not...

Anyway this series is very modest. It just adds the requirement that
all in-tree boards have some sort of sample devicetree and preferably
some documentation as to where it might come from at runtime. That
should not be a tough call IMO. Assuming we can get the validation in
place (mentioned by Rob Herring recently) it will be quite natural to
sync them between (presumably) Linux and U-Boot.

I am also quite happy to discuss what should actually be in these
devicetree files and whether some of them should be essentially empty.
As you probably noticed, some of them are empty since I literally
could not figure out where they come from! But there needs to be at
least some skeleton for U-Boot to progress, since devicetree is
critical to its feature set.

It is high time we tidied all this up. I predict it will be much
harder, and much more confusing, in 6 months.

Regards,
Simon

