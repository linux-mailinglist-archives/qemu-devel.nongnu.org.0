Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3EE443AF7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 02:23:24 +0100 (CET)
Received: from localhost ([::1]:51850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi4zr-0006Vx-9k
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 21:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mi4xr-00053c-KO
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 21:21:19 -0400
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c]:33680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mi4xk-0005zp-77
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 21:21:19 -0400
Received: by mail-ua1-x92c.google.com with SMTP id b17so1648400uas.0
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 18:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FYTYhc6kPJm8XLjZZdL1V4mJFQEVVdsYoNyg9pnLEYM=;
 b=DTVI+0c1AYdGgW45ijBikqfCkxDSUCsXdzdKHeoh/8IlkzFE0268GS94DGx5kvKRRl
 BZl1s4cWg740lnFwhzrGFR585RLa59NZIv2izg4gFsVKIE/Pbq3fCgJCYPQAjE4MwUy0
 l4nCXiBO1AFd/1YYmvcheOi1AZKWxUvTDUEyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FYTYhc6kPJm8XLjZZdL1V4mJFQEVVdsYoNyg9pnLEYM=;
 b=kVuoQZS5E3vEZQJNFXdjjc5V4YotvrVXyQo8YjmiLeqQpP7QU+6QKIRYTXc7xzMS31
 SajYnH/5RwhMc2BS8aJ3EwnkiWwS6791gnB1XqdB9X7YlRayhShjsYxvzYpjUw+NQDzc
 8ZflnkNhDXq0Xo2qZEq+cKMQ8KnXK72BzvnoVRCPRsrF5yXt2o9fugfQlt22lOE79Cja
 p90un8CyFAUTYEqt9K34He7i9Vwfc7ndCND1gQNHe2rctkPm+04I+oIZmqvdyLGtinIv
 OvIm4+NS2HNDfBNNpl98tCQq0Q+F2uNTEWK+YzkwUcZLW7t40iwekVtAfwCjYq9h6VXf
 +3vA==
X-Gm-Message-State: AOAM533fn/DqbTBZK4V4ZKrVjY2mFYD8KdGrRFrYnjyuoVrgMKyMWu0k
 lvbPvKdgcnpqwIvEsGNIh6Y2798llyelEEUdtFh7WQ==
X-Google-Smtp-Source: ABdhPJxY5GlPWtF8WqPygrLEHFCHrfMZR8J48tHetYiQC+4h+4iyDz4TYFSkyKWBb5Cv8YfT29ZU6YXhiHWjp8A29vY=
X-Received: by 2002:ab0:5b99:: with SMTP id y25mr42582601uae.47.1635902462847; 
 Tue, 02 Nov 2021 18:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211026002344.405160-1-sjg@chromium.org>
 <CAHFG_=WdKL-WcaNJxwqMRHBgVQZy9SRz11mYDKJifXEnQyQSXg@mail.gmail.com>
 <CAPnjgZ0MGr+2tcSziB8DWXZPmv6Q=9ecs_6RK=N20n3-XJiL5w@mail.gmail.com>
 <CAHFG_=Vr6VkJy+d0MaPvVsoXYgvdB5xd2P5FuvF2w63bxSm4cw@mail.gmail.com>
 <CAPnjgZ3Gr+m+sTHDOpW+RFQ6rTtbriY4TpU3bjzqZB79f43Ycw@mail.gmail.com>
 <d3ca9672e7f97f07@bloch.sibelius.xs4all.nl>
In-Reply-To: <d3ca9672e7f97f07@bloch.sibelius.xs4all.nl>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 2 Nov 2021 19:20:51 -0600
Message-ID: <CAPnjgZ0r04-_K+8JkXhzxDeW5pg3FSrnJbwA6Ghd_a_=jVKKeg@mail.gmail.com>
Subject: Re: [PATCH v5 00/26] fdt: Make OF_BOARD a boolean option
To: Mark Kettenis <mark.kettenis@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=sjg@google.com; helo=mail-ua1-x92c.google.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
Cc: linus.walleij@linaro.org, fitzsim@fitzsim.org, qemu-devel@nongnu.org,
 seanga2@gmail.com, u-boot@lists.denx.de, francois.ozog@linaro.org,
 swarren@nvidia.com, Oleksandr_Andrushchenko@epam.com, xypron.glpk@gmx.de,
 michal.simek@xilinx.com, vanbaren@cideas.com, swarren@wwwdotorg.org,
 andre.przywara@arm.com, agraf@csgraf.de, Anastasiia_Lukianenko@epam.com,
 albert.u.boot@aribaud.net, mbrugger@suse.com, ilias.apalodimas@linaro.org,
 awilliams@marvell.com, tuomas.tynkkynen@iki.fi, bmeng.cn@gmail.com,
 trini@konsulko.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Mark,

On Wed, 27 Oct 2021 at 16:30, Mark Kettenis <mark.kettenis@xs4all.nl> wrote=
:
>
> > From: Simon Glass <sjg@chromium.org>
> > Date: Wed, 27 Oct 2021 12:23:21 -0600
> >
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
> Until.  The Raspberry Pi foundation releases a new firmware that
> configures the hardware differently such that the addresses in the
> U-Boot devicetree are wrong and nothing works anymore.  Can't speak
> for the rpi 1, but this has happened in the past for the rpi 2 and 3
> as well as more recently on the rpi 4.

So I update my SD card with a new private-binary bootloader and things
stop working? I think I can narrow that one down :-)

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
> How many people are there out there that work on U-Boot that don't
> have a Linux source tree checked out?  Even I have several of those
> lying around on my development systems and I am an OpenBSD developer ;).

So it is OK to have the DT in Linux but not in U-Boot? I don't even
know what to say that. How does that square with your point above?

I am not talking about disabling OF_BOARD, just making it *possible* to do =
so.

Regards,
Simon

