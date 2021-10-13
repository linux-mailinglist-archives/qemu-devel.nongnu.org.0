Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D5242C858
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 20:07:29 +0200 (CEST)
Received: from localhost ([::1]:33314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maif1-0004Up-VH
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 14:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1maidw-0003lw-0K
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:06:20 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d]:39617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1maidt-0007EF-3R
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:06:19 -0400
Received: by mail-ua1-x92d.google.com with SMTP id f3so6255979uap.6
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 11:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fTZCTjCyP5ueQtUS/8gGBZnW0PwaWtlLXVstgDV3oXU=;
 b=EW0Jqras34p84Xo3O39F0JD3jpJJMyY59aOC/TRfx4GkN4PjTAJ6/11HD4VUZWwHCU
 d1AnIPkRds28LM3dq3CQuy1Hyw468q4KoKg6EbhXrc9el/7+I7ZAP19eqe64fZNjYI9i
 rDhMA0xT7geazr3FP2dns6xqU3uYSqZRgpdWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fTZCTjCyP5ueQtUS/8gGBZnW0PwaWtlLXVstgDV3oXU=;
 b=H1y12hpQzR1NN3e8jVu2dzQN9nRMb8v2GLE3MHI3eX/eMbOZjCWkHFYfa3vVQDp2o5
 GylCrS/ktItw3kHdOlOLA8tC5kWYaZOWAhzRcSwffDcvnWU94fNWS+wj36G15fQq8sjX
 GSOC5TMvC/xsISKycFlHTXuRwuFTmTEn68Cgl0DGZb2fM68Qq8ZlvdQs+RUdoPkOxR2s
 eIH+qJSzvS4LppBm/flTXY+lL7vuEr3zkJageAWWggxdSfyeK/iB8Yu1SLw8bStAdB44
 iSaHfagbFlClYWU+VqTUy9ouYe23gPjxfseDwipg0X2bhbc/g6dWryELw9Mg3Zyn+QWU
 m6/Q==
X-Gm-Message-State: AOAM530kURgePxE7Ip1W/WsN/0Lk1+aesPVSaCi4eiHn2hQ3N2bgZ5gy
 NmxjHD2pEL5nFDBc0Vh+O+9qnRwgtiZOBa+kLH4SWw==
X-Google-Smtp-Source: ABdhPJwevCp8qw/j778etF2R3Ok03g38DlcVUiAVlCLDqc2EYzcbzvoBpbr/im2zbggmZDMwrGP9knpUyS3KXGCm4RY=
X-Received: by 2002:a67:c30b:: with SMTP id r11mr1194827vsj.20.1634148375375; 
 Wed, 13 Oct 2021 11:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211013010120.96851-1-sjg@chromium.org>
 <CAEUhbmWY5gKmqbipurcDQ0DuNJyv8cLWsnyqx5h+tFqeVng8Ag@mail.gmail.com>
 <20211013013450.GJ7964@bill-the-cat>
 <CAPnjgZ3D+h1ov2yL73iz_3zmPkJrM4mGrQLhsKL9qu9Ez0-j2A@mail.gmail.com>
 <CAHFG_=ULjFFcF_BWzknPPw23CeMX=d-Cprhad085nX_r1NhE1g@mail.gmail.com>
In-Reply-To: <CAHFG_=ULjFFcF_BWzknPPw23CeMX=d-Cprhad085nX_r1NhE1g@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 13 Oct 2021 12:06:02 -0600
Message-ID: <CAPnjgZ3+QP3ogPA=zKWHoctkr4C2rSos_yVmJjp_MYZ-O0sKeQ@mail.gmail.com>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
To: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=sjg@google.com; helo=mail-ua1-x92d.google.com
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
 Tom Rini <trini@konsulko.com>, Stephen Warren <swarren@nvidia.com>,
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

Hi Fran=C3=A7ois,

On Wed, 13 Oct 2021 at 11:35, Fran=C3=A7ois Ozog <francois.ozog@linaro.org>=
 wrote:
>
> Hi Simon
>
> Le mer. 13 oct. 2021 =C3=A0 16:49, Simon Glass <sjg@chromium.org> a =C3=
=A9crit :
>>
>> Hi Tom, Bin,Fran=C3=A7ois,
>>
>> On Tue, 12 Oct 2021 at 19:34, Tom Rini <trini@konsulko.com> wrote:
>> >
>> > On Wed, Oct 13, 2021 at 09:29:14AM +0800, Bin Meng wrote:
>> > > Hi Simon,
>> > >
>> > > On Wed, Oct 13, 2021 at 9:01 AM Simon Glass <sjg@chromium.org> wrote=
:
>> > > >
>> > > > With Ilias' efforts we have dropped OF_PRIOR_STAGE and OF_HOSTFILE=
 so
>> > > > there are only three ways to obtain a devicetree:
>> > > >
>> > > >    - OF_SEPARATE - the normal way, where the devicetree is built a=
nd
>> > > >       appended to U-Boot
>> > > >    - OF_EMBED - for development purposes, the devicetree is embedd=
ed in
>> > > >       the ELF file (also used for EFI)
>> > > >    - OF_BOARD - the board figures it out on its own
>> > > >
>> > > > The last one is currently set up so that no devicetree is needed a=
t all
>> > > > in the U-Boot tree. Most boards do provide one, but some don't. So=
me
>> > > > don't even provide instructions on how to boot on the board.
>> > > >
>> > > > The problems with this approach are documented at [1].
>> > > >
>> > > > In practice, OF_BOARD is not really distinct from OF_SEPARATE. Any=
 board
>> > > > can obtain its devicetree at runtime, even it is has a devicetree =
built
>> > > > in U-Boot. This is because U-Boot may be a second-stage bootloader=
 and its
>> > > > caller may have a better idea about the hardware available in the =
machine.
>> > > > This is the case with a few QEMU boards, for example.
>> > > >
>> > > > So it makes no sense to have OF_BOARD as a 'choice'. It should be =
an
>> > > > option, available with either OF_SEPARATE or OF_EMBED.
>> > > >
>> > > > This series makes this change, adding various missing devicetree f=
iles
>> > > > (and placeholders) to make the build work.
>> > >
>> > > Adding device trees that are never used sounds like a hack to me.
>> > >
>> > > For QEMU, device tree is dynamically generated on the fly based on
>> > > command line parameters, and the device tree you put in this series
>> > > has various hardcoded <phandle> values which normally do not show up
>> > > in hand-written dts files.
>> > >
>> > > I am not sure I understand the whole point of this.
>> >
>> > I am also confused and do not like the idea of adding device trees for
>> > platforms that are capable of and can / do have a device tree to give =
us
>> > at run time.
>>
>> (I'll just reply to this one email, since the same points applies to
>> all replies I think)
>>
>> I have been thinking about this and discussing it with people for a
>> few months now. I've been signalling a change like this for over a
>> month now, on U-Boot contributor calls and in discussions with Linaro
>> people. I sent a patch (below) to try to explain things. I hope it is
>> not a surprise!
>>
>> The issue here is that we need a devicetree in-tree in U-Boot, to
>> avoid the mess that has been created by OF_PRIOR_STAGE, OF_BOARD,
>> BINMAN_STANDALONE_FDT and to a lesser extent, OF_HOSTFILE. Between
>> Ilias' series and this one we can get ourselves on a stronger footing.
>> There is just OF_SEPARATE, with OF_EMBED for debugging/ELF use.
>> For more context:
>>
>> http://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-3=
-sjg@chromium.org/
>>
>> BTW I did suggest to QEMU ARM that they support a way of adding the
>> u-boot.dtsi but there was not much interest there (in fact the
>> maintainer would prefer there was no special support even for booting
>> Linux directly!)
>
> i understand their point of view and agree with it.
>>
>> But in any case it doesn't really help U-Boot. I
>> think the path forward might be to run QEMU twice, once to get its
>> generated tree and once to give the 'merged' tree with the U-Boot
>> properties in it, if people want to use U-Boot features.
>>
>> I do strongly believe that OF_BOARD must be a run-time option, not a
>> build-time one. It creates all sorts of problems and obscurity which
>> have taken months to unpick. See the above patch for the rationale.
>>
>> To add to that rationale, OF_BOARD needs to be an option available to
>> any board. At some point in the future it may become a common way
>> things are done, e.g. TF-A calling U-Boot and providing a devicetree
>> to it. It doesn't make any sense to have people decide whether or not
>> to set OF_BOARD at build time, thus affecting how the image is put
>> together. We'll end up with different U-Boot build targets like
>> capricorn, capricorn_of_board and the like. It should be obvious where
>> that will lead. Instead, OF_BOARD needs to become a commonly used
>> option, perhaps enabled by most/all boards, so that this sort of build
>> explosion is not needed.
>
> If you mean that when boards are by construction providing a DTB to U-Boo=
t then I agree very much. But I don=E2=80=99t understand how the patch set =
 supports it as it puts dts files for those boards to be built.
>>
>> U-Boot needs to be flexible enough to
>> function correctly in whatever runtime environment in which it finds
>> itself.
>>
>> Also as binman is pressed into service more and more to build the
>> complex firmware images that are becoming fashionable, it needs a
>> definition (in the devicetree) that describes how to create the image.
>> We can't support that unless we are building a devicetree, nor can the
>> running program access the image layout without that information.
>>
>> Fran=C3=A7ois's point about 'don't use this with any kernel' is
>> germane...but of course I am not suggesting doing that, since OF_BOARD
>> is, still, enabled. We already use OF_BOARD for various boards that
>> include an in-tree devicetree - Raspberry Pi 1, 2 and 3, for example
>> (as I said in the cover letter "Most boards do provide one, but some
>> don't."). So this series is just completing the picture by enforcing
>> that *some sort* of devicetree is always present.
>
> That seems inconsistent with the OF_BOARD becomes the default.

I think the key point that will get you closer to where I am on this
issue, is that OF_BOARD needs to be a run-time option. At present it
has build-time effects and this is quite wrong. If you go through all
the material I have written on this I think I have motivated that very
clearly.

Another big issue is that I believe we need ONE devicetree for U-Boot,
not two that get merged by U-Boot. Again I have gone through that in a
lot of detail.

>>
>>
>> I can't quite pinpoint the patch where U-Boot started allowing the
>> devicetree to be omitted, but if people are interested I could try a
>> little harder. It was certainly not my intention (putting on my
>> device-tree-maintainer hat) to go down that path and it slipped in
>> somehow in all the confusion. I'm not sure anyone could tell you that
>> rpi_3 has an in-tree devicetree but rpi_4 does not...
>>
>> Anyway this series is very modest. It just adds the requirement that
>> all in-tree boards have some sort of sample devicetree and preferably
>> some documentation as to where it might come from at runtime.
>
> That=E2=80=99s a very good goal. But adding files in dts make them not sa=
mples but templates to be used and replace board provided DTB.
> If you push all your DTS files in documentation, you do what you say: add=
ing sample files.
>>
>> That
>> should not be a tough call IMO. Assuming we can get the validation in
>> place (mentioned by Rob Herring recently) it will be quite natural to
>> sync them between (presumably) Linux and U-Boot.
>>
>> I am also quite happy to discuss what should actually be in these
>> devicetree files and whether some of them should be essentially empty.
>> As you probably noticed, some of them are empty since I literally
>> could not figure out where they come from! But there needs to be at
>> least some skeleton for U-Boot to progress, since devicetree is
>> critical to its feature set.
>
> absolutely. And thank you for your efforts to make that center stage. Thi=
s is also Linaro Edge group mist challenging  task on the next 6 moths. Kno=
wing that we have lived in a floating situation for over 10 years, I just h=
ope we get consensus across projects and distro providers about the right e=
nd goal and migration strategy.
>>

Thank you.

>>
>>
>> It is high time we tidied all this up. I predict it will be much
>> harder, and much more confusing, in 6 months.

Just to set a road map here in case you can help unblock anything,
here are the things I am aware of, excluding the things I have
forgotten:

- Ilias OF_PRIOR_STAGE, OF_HOSTFILE series
- this series
- the devicetree docs patch
- devicetree bindings upstream for U-Boot (first patch under discussion)
- bloblist as a means of passing devicetree, ACPI, tiny config info as
C structs to U-Boot (needs to be written)
- VPL so we can handle verification (patches pending)
- bootflow / VBE v2 series (coming next week)

Regards,
Simon

