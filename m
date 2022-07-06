Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653D6568F72
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 18:43:53 +0200 (CEST)
Received: from localhost ([::1]:40442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o987z-0005P6-UJ
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 12:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1o986G-00049w-Qu
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 12:42:05 -0400
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30]:33624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1o986E-0001Zr-GO
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 12:42:04 -0400
Received: by mail-vk1-xa30.google.com with SMTP id az35so7685659vkb.0
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 09:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vw6f/eIqbGlHXalnXk6XC9ifk6GZ5hBj+aIaGmJV3i0=;
 b=KRqcD/vpVkoUfqLxhoyBV3SVhp//38r9HWNqTm0WenUWUnxkfTtdSmfFYPH0QEFwSw
 ByLZFvd20+8NJ2FddGZ6I7tc45E2Am/HRpLIG940Ar4mVBo3ff75PqpfzoJGRo1yf4NR
 3AbqLC3Dw08Ql+oDDSAKRk7NO6O4uB8lKAB1PhbE/VPTqQJ5oqHOogf9eLEMNdLOjEAl
 4PpkXonKcesbz5DTQLo3Nm24fwBKDwVlP61ki1RK/yhF/thafujXSkp88d2gCawOc4rq
 KepQ9FMfBu66DjJYxuLLZtlClblpgpF1Qbr2YrDWg3+qmIQP07LW+cvRIF07W/e9o+T1
 BiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vw6f/eIqbGlHXalnXk6XC9ifk6GZ5hBj+aIaGmJV3i0=;
 b=VVvouY37WpJgK0UMyOCSoU4SCuB2NlMpGH97bdFYBzORv/2agqdDpfe21xNqdoAnmn
 Tlb15Z/KN4XHjjTCAgACj8qNzVC+CPoPM6gBGHWnuBhgoJq5beZeuGRfJxif4B1+/HVA
 HZIojjJFDFsMH795XhPdj+ZstWiliN0mxxBfiHm9bfOi12lZOE5mojauhsgVTs1k//sC
 HmH/5S/Pa7K9gnoOjVA8zQ3CN2HmLCdUiQR/eLYOTUYMthn917LwcPY80ozo7lmN6fek
 TFI1KYeuuA6xFHD5bqfRLQgg/GFCqsFfKz0cUL0F8lXc8fYhy0AWGqVv2lt6sGo43yOH
 mA1w==
X-Gm-Message-State: AJIora+skYis9x4cMd3E+jZGEBZSsdWzMd1QVBW+vkXogSvhiC3DWnnI
 lxllJ/NCEEnyw/d9Az2NteQBxHUMnrW61tAHnFrdtQ==
X-Google-Smtp-Source: AGRyM1upceSMzUBvrXwqmPNhRv/Ps+Nce6KM7jNzgEUFSUEq0Crmv3G7aKAvZZ/88rzDUBazyk2RLgxfztmz+2SHztk=
X-Received: by 2002:a1f:a348:0:b0:36f:be56:9381 with SMTP id
 m69-20020a1fa348000000b0036fbe569381mr23534077vke.8.1657125720331; Wed, 06
 Jul 2022 09:42:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220704215457.38332-1-peter@pjd.dev>
 <9501abaf-c6b5-824c-cba8-fd4c18679b28@kaod.org>
In-Reply-To: <9501abaf-c6b5-824c-cba8-fd4c18679b28@kaod.org>
From: Patrick Venture <venture@google.com>
Date: Wed, 6 Jul 2022 09:41:49 -0700
Message-ID: <CAO=notwy08Gk3dVagS=QWGjuFqJgdgZZYudv-JpxHijZf6EAkg@mail.gmail.com>
Subject: Re: [PATCH 1/8] hw/i2c/pca954x: Add method to get channels
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Peter Delevoryas <peter@pjd.dev>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000e9253e05e325a5ad"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a30;
 envelope-from=venture@google.com; helo=mail-vk1-xa30.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e9253e05e325a5ad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 4, 2022 at 10:46 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 7/4/22 23:54, Peter Delevoryas wrote:
> > I added this helper in the Aspeed machine file a while ago to help
> > initialize fuji-bmc i2c devices. This moves it to the official pca954x
> > file so that other files can use it.
> >
> > This does something very similar to pca954x_i2c_get_bus, but I think
> > this is useful when you have a very complicated dts with a lot of
> > switches, like the fuji dts.
> >
> > This convenience method lets you write code that produces a flat array
> > of I2C buses that matches the naming in the dts. After that you can jus=
t
> > add individual sensors using the flat array of I2C buses.
> >
> > See fuji_bmc_i2c_init to understand this point further.
> >
> > The fuji dts is here for reference:
> >
> >
> https://github.com/torvalds/linux/blob/40cb6373b46/arch/arm/boot/dts/aspe=
ed-bmc-facebook-fuji.dts
> >
> > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
Reviewed-by: Patrick Venture <venture@google.com>

>
> Thanks,
>
>
Neato :)


> C.
>
>
> > ---
> >   hw/arm/aspeed.c                  | 29 +++++++++--------------------
> >   hw/i2c/i2c_mux_pca954x.c         | 10 ++++++++++
> >   include/hw/i2c/i2c_mux_pca954x.h | 13 +++++++++++++
> >   3 files changed, 32 insertions(+), 20 deletions(-)
> >
> > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > index 6fe9b13548..bee8a748ec 100644
> > --- a/hw/arm/aspeed.c
> > +++ b/hw/arm/aspeed.c
> > @@ -793,15 +793,6 @@ static void rainier_bmc_i2c_init(AspeedMachineStat=
e
> *bmc)
> >       create_pca9552(soc, 15, 0x60);
> >   }
> >
> > -static void get_pca9548_channels(I2CBus *bus, uint8_t mux_addr,
> > -                                 I2CBus **channels)
> > -{
> > -    I2CSlave *mux =3D i2c_slave_create_simple(bus, "pca9548", mux_addr=
);
> > -    for (int i =3D 0; i < 8; i++) {
> > -        channels[i] =3D pca954x_i2c_get_bus(mux, i);
> > -    }
> > -}
> > -
> >   #define TYPE_LM75 TYPE_TMP105
> >   #define TYPE_TMP75 TYPE_TMP105
> >   #define TYPE_TMP422 "tmp422"
> > @@ -814,20 +805,18 @@ static void fuji_bmc_i2c_init(AspeedMachineState
> *bmc)
> >       for (int i =3D 0; i < 16; i++) {
> >           i2c[i] =3D aspeed_i2c_get_bus(&soc->i2c, i);
> >       }
> > -    I2CBus *i2c180 =3D i2c[2];
> > -    I2CBus *i2c480 =3D i2c[8];
> > -    I2CBus *i2c600 =3D i2c[11];
> >
> > -    get_pca9548_channels(i2c180, 0x70, &i2c[16]);
> > -    get_pca9548_channels(i2c480, 0x70, &i2c[24]);
> > +    pca954x_i2c_get_channels(i2c[2], 0x70, "pca9548", &i2c[16]);
> > +    pca954x_i2c_get_channels(i2c[8], 0x70, "pca9548", &i2c[24]);
> >       /* NOTE: The device tree skips [32, 40) in the alias numbering */
> > -    get_pca9548_channels(i2c600, 0x77, &i2c[40]);
> > -    get_pca9548_channels(i2c[24], 0x71, &i2c[48]);
> > -    get_pca9548_channels(i2c[25], 0x72, &i2c[56]);
> > -    get_pca9548_channels(i2c[26], 0x76, &i2c[64]);
> > -    get_pca9548_channels(i2c[27], 0x76, &i2c[72]);
> > +    pca954x_i2c_get_channels(i2c[11], 0x77, "pca9548", &i2c[40]);
> > +    pca954x_i2c_get_channels(i2c[24], 0x71, "pca9548", &i2c[48]);
> > +    pca954x_i2c_get_channels(i2c[25], 0x72, "pca9548", &i2c[56]);
> > +    pca954x_i2c_get_channels(i2c[26], 0x76, "pca9548", &i2c[64]);
> > +    pca954x_i2c_get_channels(i2c[27], 0x76, "pca9548", &i2c[72]);
> >       for (int i =3D 0; i < 8; i++) {
> > -        get_pca9548_channels(i2c[40 + i], 0x76, &i2c[80 + i * 8]);
> > +        pca954x_i2c_get_channels(i2c[40 + i], 0x76, "pca9548",
> > +                                 &i2c[80 + i * 8]);
> >       }
> >
> >       i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4c);
> > diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
> > index 3945de795c..6b07804546 100644
> > --- a/hw/i2c/i2c_mux_pca954x.c
> > +++ b/hw/i2c/i2c_mux_pca954x.c
> > @@ -169,6 +169,16 @@ I2CBus *pca954x_i2c_get_bus(I2CSlave *mux, uint8_t
> channel)
> >       return pca954x->bus[channel];
> >   }
> >
> > +void pca954x_i2c_get_channels(I2CBus *bus, uint8_t address,
> > +                              const char *type_name, I2CBus **channels=
)
> > +{
> > +    I2CSlave *mux =3D i2c_slave_create_simple(bus, type_name, address)=
;
> > +    Pca954xClass *pc =3D PCA954X_GET_CLASS(mux);
> > +    Pca954xState *pca954x =3D PCA954X(mux);
> > +
> > +    memcpy(channels, pca954x->bus, pc->nchans * sizeof(channels[0]));
> > +}
> > +
> >   static void pca9546_class_init(ObjectClass *klass, void *data)
> >   {
> >       Pca954xClass *s =3D PCA954X_CLASS(klass);
> > diff --git a/include/hw/i2c/i2c_mux_pca954x.h
> b/include/hw/i2c/i2c_mux_pca954x.h
> > index 3dd25ec983..3a676a30a9 100644
> > --- a/include/hw/i2c/i2c_mux_pca954x.h
> > +++ b/include/hw/i2c/i2c_mux_pca954x.h
> > @@ -16,4 +16,17 @@
> >    */
> >   I2CBus *pca954x_i2c_get_bus(I2CSlave *mux, uint8_t channel);
> >
> > +/**
> > + * Creates an i2c mux and retrieves all of the channels associated wit=
h
> it.
> > + *
> > + * @bus: the i2c bus where the i2c mux resides.
> > + * @address: the address of the i2c mux on the aforementioned i2c bus.
> > + * @type_name: name of the i2c mux type to create.
> > + * @channels: an output parameter specifying where to return the
> channels.
> > + *
> > + * Returns: None
> > + */
> > +void pca954x_i2c_get_channels(I2CBus *bus, uint8_t address,
> > +                              const char *type_name, I2CBus **channels=
);
> > +
> >   #endif
>
>

--000000000000e9253e05e325a5ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 4, 2022 at 10:46 PM C=C3=
=A9dric Le Goater &lt;<a href=3D"mailto:clg@kaod.org">clg@kaod.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 7/4/22=
 23:54, Peter Delevoryas wrote:<br>
&gt; I added this helper in the Aspeed machine file a while ago to help<br>
&gt; initialize fuji-bmc i2c devices. This moves it to the official pca954x=
<br>
&gt; file so that other files can use it.<br>
&gt; <br>
&gt; This does something very similar to pca954x_i2c_get_bus, but I think<b=
r>
&gt; this is useful when you have a very complicated dts with a lot of<br>
&gt; switches, like the fuji dts.<br>
&gt; <br>
&gt; This convenience method lets you write code that produces a flat array=
<br>
&gt; of I2C buses that matches the naming in the dts. After that you can ju=
st<br>
&gt; add individual sensors using the flat array of I2C buses.<br>
&gt; <br>
&gt; See fuji_bmc_i2c_init to understand this point further.<br>
&gt; <br>
&gt; The fuji dts is here for reference:<br>
&gt; <br>
&gt; <a href=3D"https://github.com/torvalds/linux/blob/40cb6373b46/arch/arm=
/boot/dts/aspeed-bmc-facebook-fuji.dts" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/torvalds/linux/blob/40cb6373b46/arch/arm/boot/dts/aspe=
ed-bmc-facebook-fuji.dts</a><br>
&gt; <br>
&gt; Signed-off-by: Peter Delevoryas &lt;<a href=3D"mailto:peter@pjd.dev" t=
arget=3D"_blank">peter@pjd.dev</a>&gt;<br>
<br>
Reviewed-by: C=C3=A9dric Le Goater &lt;<a href=3D"mailto:clg@kaod.org" targ=
et=3D"_blank">clg@kaod.org</a>&gt;<br></blockquote><div>Reviewed-by: Patric=
k Venture &lt;<a href=3D"mailto:venture@google.com">venture@google.com</a>&=
gt;=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
<br></blockquote><div><br></div><div>Neato :)</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
C.<br>
<br>
<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/arm/aspeed.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 29 +++++++++--------------------<br>
&gt;=C2=A0 =C2=A0hw/i2c/i2c_mux_pca954x.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 10 ++++++++++<br>
&gt;=C2=A0 =C2=A0include/hw/i2c/i2c_mux_pca954x.h | 13 +++++++++++++<br>
&gt;=C2=A0 =C2=A03 files changed, 32 insertions(+), 20 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c<br>
&gt; index 6fe9b13548..bee8a748ec 100644<br>
&gt; --- a/hw/arm/aspeed.c<br>
&gt; +++ b/hw/arm/aspeed.c<br>
&gt; @@ -793,15 +793,6 @@ static void rainier_bmc_i2c_init(AspeedMachineSta=
te *bmc)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0create_pca9552(soc, 15, 0x60);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -static void get_pca9548_channels(I2CBus *bus, uint8_t mux_addr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I2CBus **channels)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 I2CSlave *mux =3D i2c_slave_create_simple(bus, &quot;pc=
a9548&quot;, mux_addr);<br>
&gt; -=C2=A0 =C2=A0 for (int i =3D 0; i &lt; 8; i++) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 channels[i] =3D pca954x_i2c_get_bus(mux, =
i);<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -}<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0#define TYPE_LM75 TYPE_TMP105<br>
&gt;=C2=A0 =C2=A0#define TYPE_TMP75 TYPE_TMP105<br>
&gt;=C2=A0 =C2=A0#define TYPE_TMP422 &quot;tmp422&quot;<br>
&gt; @@ -814,20 +805,18 @@ static void fuji_bmc_i2c_init(AspeedMachineState=
 *bmc)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for (int i =3D 0; i &lt; 16; i++) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i2c[i] =3D aspeed_i2c_get_bus(=
&amp;soc-&gt;i2c, i);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 I2CBus *i2c180 =3D i2c[2];<br>
&gt; -=C2=A0 =C2=A0 I2CBus *i2c480 =3D i2c[8];<br>
&gt; -=C2=A0 =C2=A0 I2CBus *i2c600 =3D i2c[11];<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 get_pca9548_channels(i2c180, 0x70, &amp;i2c[16]);<br>
&gt; -=C2=A0 =C2=A0 get_pca9548_channels(i2c480, 0x70, &amp;i2c[24]);<br>
&gt; +=C2=A0 =C2=A0 pca954x_i2c_get_channels(i2c[2], 0x70, &quot;pca9548&qu=
ot;, &amp;i2c[16]);<br>
&gt; +=C2=A0 =C2=A0 pca954x_i2c_get_channels(i2c[8], 0x70, &quot;pca9548&qu=
ot;, &amp;i2c[24]);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* NOTE: The device tree skips [32, 40) in t=
he alias numbering */<br>
&gt; -=C2=A0 =C2=A0 get_pca9548_channels(i2c600, 0x77, &amp;i2c[40]);<br>
&gt; -=C2=A0 =C2=A0 get_pca9548_channels(i2c[24], 0x71, &amp;i2c[48]);<br>
&gt; -=C2=A0 =C2=A0 get_pca9548_channels(i2c[25], 0x72, &amp;i2c[56]);<br>
&gt; -=C2=A0 =C2=A0 get_pca9548_channels(i2c[26], 0x76, &amp;i2c[64]);<br>
&gt; -=C2=A0 =C2=A0 get_pca9548_channels(i2c[27], 0x76, &amp;i2c[72]);<br>
&gt; +=C2=A0 =C2=A0 pca954x_i2c_get_channels(i2c[11], 0x77, &quot;pca9548&q=
uot;, &amp;i2c[40]);<br>
&gt; +=C2=A0 =C2=A0 pca954x_i2c_get_channels(i2c[24], 0x71, &quot;pca9548&q=
uot;, &amp;i2c[48]);<br>
&gt; +=C2=A0 =C2=A0 pca954x_i2c_get_channels(i2c[25], 0x72, &quot;pca9548&q=
uot;, &amp;i2c[56]);<br>
&gt; +=C2=A0 =C2=A0 pca954x_i2c_get_channels(i2c[26], 0x76, &quot;pca9548&q=
uot;, &amp;i2c[64]);<br>
&gt; +=C2=A0 =C2=A0 pca954x_i2c_get_channels(i2c[27], 0x76, &quot;pca9548&q=
uot;, &amp;i2c[72]);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for (int i =3D 0; i &lt; 8; i++) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_pca9548_channels(i2c[40 + i], 0x76, &=
amp;i2c[80 + i * 8]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pca954x_i2c_get_channels(i2c[40 + i], 0x7=
6, &quot;pca9548&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;i2c[80 + i * 8]);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(i2c[17], TYPE_LM75, =
0x4c);<br>
&gt; diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c<br>
&gt; index 3945de795c..6b07804546 100644<br>
&gt; --- a/hw/i2c/i2c_mux_pca954x.c<br>
&gt; +++ b/hw/i2c/i2c_mux_pca954x.c<br>
&gt; @@ -169,6 +169,16 @@ I2CBus *pca954x_i2c_get_bus(I2CSlave *mux, uint8_=
t channel)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return pca954x-&gt;bus[channel];<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +void pca954x_i2c_get_channels(I2CBus *bus, uint8_t address,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *type_name, I2CBus **channel=
s)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 I2CSlave *mux =3D i2c_slave_create_simple(bus, type_nam=
e, address);<br>
&gt; +=C2=A0 =C2=A0 Pca954xClass *pc =3D PCA954X_GET_CLASS(mux);<br>
&gt; +=C2=A0 =C2=A0 Pca954xState *pca954x =3D PCA954X(mux);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 memcpy(channels, pca954x-&gt;bus, pc-&gt;nchans * sizeo=
f(channels[0]));<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0static void pca9546_class_init(ObjectClass *klass, void *d=
ata)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Pca954xClass *s =3D PCA954X_CLASS(klass);<br=
>
&gt; diff --git a/include/hw/i2c/i2c_mux_pca954x.h b/include/hw/i2c/i2c_mux=
_pca954x.h<br>
&gt; index 3dd25ec983..3a676a30a9 100644<br>
&gt; --- a/include/hw/i2c/i2c_mux_pca954x.h<br>
&gt; +++ b/include/hw/i2c/i2c_mux_pca954x.h<br>
&gt; @@ -16,4 +16,17 @@<br>
&gt;=C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0I2CBus *pca954x_i2c_get_bus(I2CSlave *mux, uint8_t channel=
);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +/**<br>
&gt; + * Creates an i2c mux and retrieves all of the channels associated wi=
th it.<br>
&gt; + *<br>
&gt; + * @bus: the i2c bus where the i2c mux resides.<br>
&gt; + * @address: the address of the i2c mux on the aforementioned i2c bus=
.<br>
&gt; + * @type_name: name of the i2c mux type to create.<br>
&gt; + * @channels: an output parameter specifying where to return the chan=
nels.<br>
&gt; + *<br>
&gt; + * Returns: None<br>
&gt; + */<br>
&gt; +void pca954x_i2c_get_channels(I2CBus *bus, uint8_t address,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *type_name, I2CBus **channel=
s);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0#endif<br>
<br>
</blockquote></div></div>

--000000000000e9253e05e325a5ad--

