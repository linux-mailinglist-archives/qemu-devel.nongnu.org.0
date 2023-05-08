Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCE26FBAF9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 00:21:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw9D5-0004B9-5Q; Mon, 08 May 2023 18:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pw9D2-0004Ah-NQ
 for qemu-devel@nongnu.org; Mon, 08 May 2023 18:19:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pw9D0-0002Fh-Hc
 for qemu-devel@nongnu.org; Mon, 08 May 2023 18:19:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683584393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q1fpKooa9SkvqfQR5x8QZDFjhYK8bjDyEKsesr57dQg=;
 b=OqEjDL4F7OplSiOlxgodTqboMEuOFK8TtEizj1IGcmAz0AJxkDY5iHIw6oNg3yIqRw/Pxt
 BNomk+5jovBO5hnX4QWnWUINrbPjXhmEdbDw17iFMAwkBY9e8XxAcwAIJJasj/XCb1mU/f
 SsPvaz7sjtd0DBiSqh+AZc61qhu4H/w=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-fnIBrvfpPVGP0AU0K0LsHw-1; Mon, 08 May 2023 18:19:51 -0400
X-MC-Unique: fnIBrvfpPVGP0AU0K0LsHw-1
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-4360081be0dso514443137.3
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 15:19:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683584391; x=1686176391;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q1fpKooa9SkvqfQR5x8QZDFjhYK8bjDyEKsesr57dQg=;
 b=Z7PJJDx1r9nyS0y2+ody1gISUcBrfPXEp5YhSRKha0mQWKXpl+vgMJmJ+NHC4FDY1O
 J2gXlEq/AhRsCEg+i43+/dhRzuCXk8Y4w5BM7AK3g6ZGwNbkInuQffitX+w/t8M2Tvmo
 ATIGsK/tT8ng6af3tHidU94QGiTsgkgUMRjCvxLm2O/X5sCmnSKufg+FsfkX0mEQmaYD
 4be0mSE890RkjqRh2rB845cYprXUJWyIh2u3+6XzHPVDkXQWnXkmzmhBiWUzQk2H9X+o
 soibPHoMBaOZkBSpw1sjtLzln7j8el/ojWRCCdBnUnb0ztuMDe1eVdvBV6ZPqA2wq1+S
 xsUA==
X-Gm-Message-State: AC+VfDxeZnGelZvBariFV32kT9E6J3p6zmH0/1z4QfRU9MPVdG25aMxn
 cIgLrxu1N4VrAvQtKATRB2SgH3/0gZ8GEKfyGE7yVr7Ii+qJFMuFcu/nXz6Lj2/jd1jbKvTAQ4p
 eo/kGfzhyj8HKDUE6G/K35TC+z4alzag=
X-Received: by 2002:a67:fac8:0:b0:436:1156:ff5d with SMTP id
 g8-20020a67fac8000000b004361156ff5dmr43193vsq.29.1683584390821; 
 Mon, 08 May 2023 15:19:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Gw9roFHiyYHcv7vHb3xPpJeSDnI9GOxc6NX0C5V/OZ4V8YbkRgJ3tm3GBnbaqfcjhWoDotRsMvs6ECNHeGvs=
X-Received: by 2002:a67:fac8:0:b0:436:1156:ff5d with SMTP id
 g8-20020a67fac8000000b004361156ff5dmr43190vsq.29.1683584390546; Mon, 08 May
 2023 15:19:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
 <20230502121459.2422303-12-peter.maydell@linaro.org>
 <b5d0ea65-0485-382b-f59a-84a5596b63a2@redhat.com>
 <87bkj0cmd5.fsf@suse.de>
In-Reply-To: <87bkj0cmd5.fsf@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 9 May 2023 00:19:40 +0200
Message-ID: <CABgObfbM+sNyDcC0K+tm50fQAoQcWC95MKOFFy=TEjFqj0ZAww@mail.gmail.com>
Subject: Re: [PULL 11/35] arm/Kconfig: Do not build TCG-only boards on a
 KVM-only build
To: Fabiano Rosas <farosas@suse.de>
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000008c630405fb360941"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000008c630405fb360941
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il gio 4 mag 2023, 14:27 Fabiano Rosas <farosas@suse.de> ha scritto:

> Thomas Huth <thuth@redhat.com> writes:
>
> > On 02/05/2023 14.14, Peter Maydell wrote:
> >> From: Fabiano Rosas <farosas@suse.de>
> >>
> >> Move all the CONFIG_FOO=3Dy from default.mak into "default y if TCG"
> >> statements in Kconfig. That way they won't be selected when
> >> CONFIG_TCG=3Dn.
> >>
> >> I'm leaving CONFIG_ARM_VIRT in default.mak because it allows us to
> >> keep the two default.mak files not empty and keep aarch64-default.mak
> >> including arm-default.mak. That way we don't surprise anyone that's
> >> used to altering these files.
> >>
> >> With this change we can start building with --disable-tcg.
> >>
> >> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> >> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >> Message-id: 20230426180013.14814-12-farosas@suse.de
> >> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> >> ---
> >>   configs/devices/aarch64-softmmu/default.mak |  4 --
> >>   configs/devices/arm-softmmu/default.mak     | 37 ------------------
> >>   hw/arm/Kconfig                              | 42 +++++++++++++++++++=
+-
> >>   3 files changed, 41 insertions(+), 42 deletions(-)
> >>
> >> diff --git a/configs/devices/aarch64-softmmu/default.mak
> b/configs/devices/aarch64-softmmu/default.mak
> >> index cf43ac8da11..70e05a197dc 100644
> >> --- a/configs/devices/aarch64-softmmu/default.mak
> >> +++ b/configs/devices/aarch64-softmmu/default.mak
> >> @@ -2,7 +2,3 @@
> >>
> >>   # We support all the 32 bit boards so need all their config
> >>   include ../arm-softmmu/default.mak
> >> -
> >> -CONFIG_XLNX_ZYNQMP_ARM=3Dy
> >> -CONFIG_XLNX_VERSAL=3Dy
> >> -CONFIG_SBSA_REF=3Dy
> >> diff --git a/configs/devices/arm-softmmu/default.mak
> b/configs/devices/arm-softmmu/default.mak
> >> index cb3e5aea657..647fbce88d3 100644
> >> --- a/configs/devices/arm-softmmu/default.mak
> >> +++ b/configs/devices/arm-softmmu/default.mak
> >> @@ -4,40 +4,3 @@
> >>   # CONFIG_TEST_DEVICES=3Dn
> >>
> >>   CONFIG_ARM_VIRT=3Dy
> >> -CONFIG_CUBIEBOARD=3Dy
> >> -CONFIG_EXYNOS4=3Dy
> >> -CONFIG_HIGHBANK=3Dy
> >> -CONFIG_INTEGRATOR=3Dy
> >> -CONFIG_FSL_IMX31=3Dy
> >> -CONFIG_MUSICPAL=3Dy
> >> -CONFIG_MUSCA=3Dy
> >> -CONFIG_CHEETAH=3Dy
> >> -CONFIG_SX1=3Dy
> >> -CONFIG_NSERIES=3Dy
> >> -CONFIG_STELLARIS=3Dy
> >> -CONFIG_STM32VLDISCOVERY=3Dy
> >> -CONFIG_REALVIEW=3Dy
> >> -CONFIG_VERSATILE=3Dy
> >> -CONFIG_VEXPRESS=3Dy
> >> -CONFIG_ZYNQ=3Dy
> >> -CONFIG_MAINSTONE=3Dy
> >> -CONFIG_GUMSTIX=3Dy
> >> -CONFIG_SPITZ=3Dy
> >> -CONFIG_TOSA=3Dy
> >> -CONFIG_Z2=3Dy
> >> -CONFIG_NPCM7XX=3Dy
> >> -CONFIG_COLLIE=3Dy
> >> -CONFIG_ASPEED_SOC=3Dy
> >> -CONFIG_NETDUINO2=3Dy
> >> -CONFIG_NETDUINOPLUS2=3Dy
> >> -CONFIG_OLIMEX_STM32_H405=3Dy
> >> -CONFIG_MPS2=3Dy
> >> -CONFIG_RASPI=3Dy
> >> -CONFIG_DIGIC=3Dy
> >> -CONFIG_SABRELITE=3Dy
> >> -CONFIG_EMCRAFT_SF2=3Dy
> >> -CONFIG_MICROBIT=3Dy
> >> -CONFIG_FSL_IMX25=3Dy
> >> -CONFIG_FSL_IMX7=3Dy
> >> -CONFIG_FSL_IMX6UL=3Dy
> >> -CONFIG_ALLWINNER_H3=3Dy
> >> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> >> index 87c1a29c912..2d7c4579559 100644
> >> --- a/hw/arm/Kconfig
> >> +++ b/hw/arm/Kconfig
> >> @@ -35,20 +35,24 @@ config ARM_VIRT
> >>
> >>   config CHEETAH
> >>       bool
> >> +    default y if TCG && ARM
> >>       select OMAP
> >>       select TSC210X
> >>
> >>   config CUBIEBOARD
> >>       bool
> >> +    default y if TCG && ARM
> >>       select ALLWINNER_A10
> > ...
> >
> >   Hi!
> >
> > Sorry for not noticing this earlier, but I have to say that I really
> dislike
> > this change, since it very much changes the way we did our machine
> > configuration so far.
> > Until now, you could simply go to configs/devices/*-softmmu/*.mak and
> only
> > select the machines you wanted to have with "...=3Dy" and delete
> everything
> > else. Now you have to know *all* the machines that you do *not* want to
> have
> > in your build and disable them with "...=3Dn" in that file. That's quit=
e
> ugly,
> > especially for the arm target that has so many machines. (ok, you could
> also
> > do a "--without-default-devices" configuration to get rid of the
> machines,
> > but that also disables all other kind of devices that you then have to
> > specify manually).
> >
>
> Would leaving the CONFIGs as 'n', but commented out in the .mak files be
> of any help? If I understand your use case, you were probably just
> deleting the CONFIG=3Dy for the boards you don't want. So now you'd be
> uncommenting the CONFIG=3Dn instead.


Yes, that would help=E2=80=94though it is likely to bitrot. I would also ch=
ange the
"if TCG" part to "depends on TCG && ARM", which will break loudly if
someone sets the config to y with the wrong accelerator or in the wrong
file.

Once this is done for ARM we can extend it to other .mak files for
consistency.

Paolo


> Alternatively, we could revert the .mak part of this change, convert
> default.mak into tcg.mak and kvm.mak, and use those transparently
> depending on whether --disable-tcg is present in the configure line.
>
> But there's probably a better way still that I'm not seeing here, let's
> see what others think.
>
>

--0000000000008c630405fb360941
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">Il gio 4 mag 2023, 14:27 Fabiano Rosas &lt;<a href=3D"mail=
to:farosas@suse.de">farosas@suse.de</a>&gt; ha scritto:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" ta=
rget=3D"_blank" rel=3D"noreferrer">thuth@redhat.com</a>&gt; writes:<br>
<br>
&gt; On 02/05/2023 14.14, Peter Maydell wrote:<br>
&gt;&gt; From: Fabiano Rosas &lt;<a href=3D"mailto:farosas@suse.de" target=
=3D"_blank" rel=3D"noreferrer">farosas@suse.de</a>&gt;<br>
&gt;&gt; <br>
&gt;&gt; Move all the CONFIG_FOO=3Dy from default.mak into &quot;default y =
if TCG&quot;<br>
&gt;&gt; statements in Kconfig. That way they won&#39;t be selected when<br=
>
&gt;&gt; CONFIG_TCG=3Dn.<br>
&gt;&gt; <br>
&gt;&gt; I&#39;m leaving CONFIG_ARM_VIRT in default.mak because it allows u=
s to<br>
&gt;&gt; keep the two default.mak files not empty and keep aarch64-default.=
mak<br>
&gt;&gt; including arm-default.mak. That way we don&#39;t surprise anyone t=
hat&#39;s<br>
&gt;&gt; used to altering these files.<br>
&gt;&gt; <br>
&gt;&gt; With this change we can start building with --disable-tcg.<br>
&gt;&gt; <br>
&gt;&gt; Signed-off-by: Fabiano Rosas &lt;<a href=3D"mailto:farosas@suse.de=
" target=3D"_blank" rel=3D"noreferrer">farosas@suse.de</a>&gt;<br>
&gt;&gt; Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.hende=
rson@linaro.org" target=3D"_blank" rel=3D"noreferrer">richard.henderson@lin=
aro.org</a>&gt;<br>
&gt;&gt; Message-id: <a href=3D"mailto:20230426180013.14814-12-farosas@suse=
.de" target=3D"_blank" rel=3D"noreferrer">20230426180013.14814-12-farosas@s=
use.de</a><br>
&gt;&gt; Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@l=
inaro.org" target=3D"_blank" rel=3D"noreferrer">peter.maydell@linaro.org</a=
>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0configs/devices/aarch64-softmmu/default.mak |=C2=A0 4 =
--<br>
&gt;&gt;=C2=A0 =C2=A0configs/devices/arm-softmmu/default.mak=C2=A0 =C2=A0 =
=C2=A0| 37 ------------------<br>
&gt;&gt;=C2=A0 =C2=A0hw/arm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 42 +++=
+++++++++++++++++-<br>
&gt;&gt;=C2=A0 =C2=A03 files changed, 41 insertions(+), 42 deletions(-)<br>
&gt;&gt; <br>
&gt;&gt; diff --git a/configs/devices/aarch64-softmmu/default.mak b/configs=
/devices/aarch64-softmmu/default.mak<br>
&gt;&gt; index cf43ac8da11..70e05a197dc 100644<br>
&gt;&gt; --- a/configs/devices/aarch64-softmmu/default.mak<br>
&gt;&gt; +++ b/configs/devices/aarch64-softmmu/default.mak<br>
&gt;&gt; @@ -2,7 +2,3 @@<br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;=C2=A0 =C2=A0# We support all the 32 bit boards so need all their c=
onfig<br>
&gt;&gt;=C2=A0 =C2=A0include ../arm-softmmu/default.mak<br>
&gt;&gt; -<br>
&gt;&gt; -CONFIG_XLNX_ZYNQMP_ARM=3Dy<br>
&gt;&gt; -CONFIG_XLNX_VERSAL=3Dy<br>
&gt;&gt; -CONFIG_SBSA_REF=3Dy<br>
&gt;&gt; diff --git a/configs/devices/arm-softmmu/default.mak b/configs/dev=
ices/arm-softmmu/default.mak<br>
&gt;&gt; index cb3e5aea657..647fbce88d3 100644<br>
&gt;&gt; --- a/configs/devices/arm-softmmu/default.mak<br>
&gt;&gt; +++ b/configs/devices/arm-softmmu/default.mak<br>
&gt;&gt; @@ -4,40 +4,3 @@<br>
&gt;&gt;=C2=A0 =C2=A0# CONFIG_TEST_DEVICES=3Dn<br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;=C2=A0 =C2=A0CONFIG_ARM_VIRT=3Dy<br>
&gt;&gt; -CONFIG_CUBIEBOARD=3Dy<br>
&gt;&gt; -CONFIG_EXYNOS4=3Dy<br>
&gt;&gt; -CONFIG_HIGHBANK=3Dy<br>
&gt;&gt; -CONFIG_INTEGRATOR=3Dy<br>
&gt;&gt; -CONFIG_FSL_IMX31=3Dy<br>
&gt;&gt; -CONFIG_MUSICPAL=3Dy<br>
&gt;&gt; -CONFIG_MUSCA=3Dy<br>
&gt;&gt; -CONFIG_CHEETAH=3Dy<br>
&gt;&gt; -CONFIG_SX1=3Dy<br>
&gt;&gt; -CONFIG_NSERIES=3Dy<br>
&gt;&gt; -CONFIG_STELLARIS=3Dy<br>
&gt;&gt; -CONFIG_STM32VLDISCOVERY=3Dy<br>
&gt;&gt; -CONFIG_REALVIEW=3Dy<br>
&gt;&gt; -CONFIG_VERSATILE=3Dy<br>
&gt;&gt; -CONFIG_VEXPRESS=3Dy<br>
&gt;&gt; -CONFIG_ZYNQ=3Dy<br>
&gt;&gt; -CONFIG_MAINSTONE=3Dy<br>
&gt;&gt; -CONFIG_GUMSTIX=3Dy<br>
&gt;&gt; -CONFIG_SPITZ=3Dy<br>
&gt;&gt; -CONFIG_TOSA=3Dy<br>
&gt;&gt; -CONFIG_Z2=3Dy<br>
&gt;&gt; -CONFIG_NPCM7XX=3Dy<br>
&gt;&gt; -CONFIG_COLLIE=3Dy<br>
&gt;&gt; -CONFIG_ASPEED_SOC=3Dy<br>
&gt;&gt; -CONFIG_NETDUINO2=3Dy<br>
&gt;&gt; -CONFIG_NETDUINOPLUS2=3Dy<br>
&gt;&gt; -CONFIG_OLIMEX_STM32_H405=3Dy<br>
&gt;&gt; -CONFIG_MPS2=3Dy<br>
&gt;&gt; -CONFIG_RASPI=3Dy<br>
&gt;&gt; -CONFIG_DIGIC=3Dy<br>
&gt;&gt; -CONFIG_SABRELITE=3Dy<br>
&gt;&gt; -CONFIG_EMCRAFT_SF2=3Dy<br>
&gt;&gt; -CONFIG_MICROBIT=3Dy<br>
&gt;&gt; -CONFIG_FSL_IMX25=3Dy<br>
&gt;&gt; -CONFIG_FSL_IMX7=3Dy<br>
&gt;&gt; -CONFIG_FSL_IMX6UL=3Dy<br>
&gt;&gt; -CONFIG_ALLWINNER_H3=3Dy<br>
&gt;&gt; diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig<br>
&gt;&gt; index 87c1a29c912..2d7c4579559 100644<br>
&gt;&gt; --- a/hw/arm/Kconfig<br>
&gt;&gt; +++ b/hw/arm/Kconfig<br>
&gt;&gt; @@ -35,20 +35,24 @@ config ARM_VIRT<br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;=C2=A0 =C2=A0config CHEETAH<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool<br>
&gt;&gt; +=C2=A0 =C2=A0 default y if TCG &amp;&amp; ARM<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select OMAP<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select TSC210X<br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;=C2=A0 =C2=A0config CUBIEBOARD<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool<br>
&gt;&gt; +=C2=A0 =C2=A0 default y if TCG &amp;&amp; ARM<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select ALLWINNER_A10<br>
&gt; ...<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Hi!<br>
&gt;<br>
&gt; Sorry for not noticing this earlier, but I have to say that I really d=
islike <br>
&gt; this change, since it very much changes the way we did our machine <br=
>
&gt; configuration so far.<br>
&gt; Until now, you could simply go to configs/devices/*-softmmu/*.mak and =
only <br>
&gt; select the machines you wanted to have with &quot;...=3Dy&quot; and de=
lete everything <br>
&gt; else. Now you have to know *all* the machines that you do *not* want t=
o have <br>
&gt; in your build and disable them with &quot;...=3Dn&quot; in that file. =
That&#39;s quite ugly, <br>
&gt; especially for the arm target that has so many machines. (ok, you coul=
d also <br>
&gt; do a &quot;--without-default-devices&quot; configuration to get rid of=
 the machines, <br>
&gt; but that also disables all other kind of devices that you then have to=
 <br>
&gt; specify manually).<br>
&gt;<br>
<br>
Would leaving the CONFIGs as &#39;n&#39;, but commented out in the .mak fil=
es be<br>
of any help? If I understand your use case, you were probably just<br>
deleting the CONFIG=3Dy for the boards you don&#39;t want. So now you&#39;d=
 be<br>
uncommenting the CONFIG=3Dn instead.</blockquote></div></div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Yes, that would help=E2=80=94though it is l=
ikely to bitrot. I would also change the &quot;if TCG&quot; part to &quot;d=
epends on TCG &amp;&amp; ARM&quot;, which will break loudly if someone sets=
 the config to y with the wrong accelerator or in the wrong file.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Once this is done for ARM we can =
extend it to other .mak files for consistency.</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto"></div><div dir=3D"auto"></div><div dir=3D"auto"><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
<br>
Alternatively, we could revert the .mak part of this change, convert<br>
default.mak into tcg.mak and kvm.mak, and use those transparently<br>
depending on whether --disable-tcg is present in the configure line.<br>
<br>
But there&#39;s probably a better way still that I&#39;m not seeing here, l=
et&#39;s<br>
see what others think.<br>
<br>
</blockquote></div></div></div>

--0000000000008c630405fb360941--


