Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4083B444638
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 17:47:45 +0100 (CET)
Received: from localhost ([::1]:52624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJQN-0002w6-RU
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 12:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1miJOB-0001Rg-86
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 12:45:31 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933]:44901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1miJO9-0005pP-1n
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 12:45:26 -0400
Received: by mail-ua1-x933.google.com with SMTP id e5so5526169uam.11
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 09:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kbAdkb+mMgFkJKEBlk1bhYF13vWlwmLo+faLmONdCnw=;
 b=CgVzUoxkakdpnJSJJ6Y7GVnx/8Mj7GGLRC3zmXXLx1UC7OAghfu7GHJVGEYZIig4uZ
 lMH48iT70P9kXZJHbkLe2/SAdWAoI+uCtL/K+r3AF56vYTpKbiAsmTwZnsl5j1V8y6yT
 WNim3bFXb0bXzxqyx0laO3sglDF2C3o47utZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kbAdkb+mMgFkJKEBlk1bhYF13vWlwmLo+faLmONdCnw=;
 b=8QzgppMK9tyF74+yWAR+GTc5QjUZw3mFS0ZzYshYAnAhtZjmRyqz7nY2mVfp3woHNY
 QDd+rxH9ZtfLE3zrQLlPJpsHtvbeX8bWu9DGSYxdXiTHWqBhrFxm+0pb2UAhs+0kfY8Z
 oNtzWBTmJWspFsyLI7NIEDnIdHLuSHlxRTHFKP6UQAfP3fIKDgPca1Bb42eTXlHTGiEF
 x+1QMLQ76bIG5lPrWDsrK/WtBJfClPByodEbrOVj082tsXHJRMG0WmihTHwcbxSGl/zB
 likuRbhqtqq8I7w5SrDrcGIt/hbn++A213KWcLUc7HGsGO9C2MIKOlLzz+kcZbscmA+2
 73rg==
X-Gm-Message-State: AOAM530YMHPZl85nSVssaw3p4dtC7/OhqahMXNj17pqsLYyhE4wSD31I
 Q/5wWCSnWlngKcNFY9rmYkAalkp83a6XQRtvHUn6XA==
X-Google-Smtp-Source: ABdhPJy2lDJmkX6qfb4xr2ZubUuYGpw2YqF3H2ZrrBDculOIz1dtosX3e75/VSOZHYl76lspMarNDeB/JIExjGqWibk=
X-Received: by 2002:a67:c308:: with SMTP id r8mr25159283vsj.20.1635957923532; 
 Wed, 03 Nov 2021 09:45:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211026002344.405160-1-sjg@chromium.org>
 <CAHFG_=WdKL-WcaNJxwqMRHBgVQZy9SRz11mYDKJifXEnQyQSXg@mail.gmail.com>
 <CAPnjgZ0MGr+2tcSziB8DWXZPmv6Q=9ecs_6RK=N20n3-XJiL5w@mail.gmail.com>
 <CAHFG_=Vr6VkJy+d0MaPvVsoXYgvdB5xd2P5FuvF2w63bxSm4cw@mail.gmail.com>
 <CAPnjgZ3Gr+m+sTHDOpW+RFQ6rTtbriY4TpU3bjzqZB79f43Ycw@mail.gmail.com>
 <20211027192514.GL8284@bill-the-cat>
In-Reply-To: <20211027192514.GL8284@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 3 Nov 2021 10:45:11 -0600
Message-ID: <CAPnjgZ1XF+NCRhaCwC=CY1YurD3=GHTyUNV4q4OsSqGccms-BA@mail.gmail.com>
Subject: Re: [PATCH v5 00/26] fdt: Make OF_BOARD a boolean option
To: Tom Rini <trini@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=sjg@google.com; helo=mail-ua1-x933.google.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
 =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>,
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

Hi Tom,

On Wed, 27 Oct 2021 at 13:25, Tom Rini <trini@konsulko.com> wrote:
>
> On Wed, Oct 27, 2021 at 12:23:21PM -0600, Simon Glass wrote:
> > Hi Fran=C3=A7ois,
> >
> > On Wed, 27 Oct 2021 at 09:14, Fran=C3=A7ois Ozog <francois.ozog@linaro.=
org> wrote:
> > >
> > >
> > >
> > > On Wed, 27 Oct 2021 at 16:08, Simon Glass <sjg@chromium.org> wrote:
> > >>
> > >> Hi Fran=C3=A7ois,
> > >>
> > >> On Tue, 26 Oct 2021 at 00:07, Fran=C3=A7ois Ozog <francois.ozog@lina=
ro.org> wrote:
> > >> >
> > >> > Hi Simon
> > >> >
> > >> > Position unchanged on this series: adding fake dts for boards that=
 generate their device tree in the dts directory is not good. If you have t=
hem in documentation the it is acceptable.
> > >>
> > >> I think we are going to have to disagree on this one. I actually use=
d
> > >> the qemu one in testing/development recently. We have to have a way =
to
> > >> develop in-tree with U-Boot. It does not impinge on any of your use
> > >> cases, so far as I know.
> > >
> > > I am not the only one in disagreement... You just saw Alex B=C3=A9n=
=C3=A9e from Qemu saying the same thing.
> > > I understand the advanced debug/development scenario you mention.
> > > But locating the DT files in the dts directory is mis-leading the con=
tributors to think that they need to compile the DT for the targeted platfo=
rms.
> > > For your advanced scenario, you can still have the dts in the documen=
tation area, or whatever directory (except dts). compile it and supply to U=
-Boot.
> >
> > We have this situation with rpi 1, 2 and 3 and I don't believe anyone
> > has noticed. U-Boot handles the build automatically. If you turn off
> > OF_BOARD, it will use the U-Boot devicetree always so you know what is
> > going on.
>
> That we have to have so many separate rpi build targets, and can't just
> use rpm_arm64 and add rpi_arm32 is not a good feature.  The various rpi
> configs that use CONFIG_OF_EMBED are on your list of things that need to
> be cleaned up, yes?

Yes, it should use CONFIG_OF_SEPARATE. It think it didn't for
historical reasons, but not sure why.

>
> > We can add a message to U-Boot indicating where the devicetree came
> > from, perhaps? That might be useful given everything that is going on.
> >
> > As in this case, quite often in these discussions I struggle to
> > understand what is behind the objection. Is it that your customers are
> > demanding that devicetrees become private, secret data, not included
> > in open-source projects? Or is it just the strange case of QEMU that
> > is informing your thinking? I know of at least one project where the
> > first-stage bootloader produces a devicetree and no one has the source
> > for it. I believe TF-A was created for licensing reasons...so can you
> > be a bit clearer about what the problem actually is? If a board is
> > in-tree in U-Boot I would like it to have a devicetree there, at least
> > until we have a better option. At the very least, it MUST be
> > discoverable and it must be possible to undertake U-Boot development
> > easily without a lot of messing around.
>
> What I don't understand here is why or how U-Boot is supposed to become
> the source of truth for device trees.  The general goal is that the
> device tree be something that actually comes along on the hardware,
> because it's stable enough and correct enough that it's not going to be
> changed from one OS kernel release to the next.  That should be where
> the correct and true tree comes from, the device itself.

Is that the confusion here? I am not saying that U-Boot becomes the
'source of truth' (horrible term). Where did that idea come from?

By hardware you mean firmware, I think. If you are developing
firmware, you need control of the devicetree. It is part of the
firmware.

Regards,
Simon

