Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE7F6C51C3
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 18:04:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf1sH-0008QD-1N; Wed, 22 Mar 2023 13:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1pf1sF-0008PT-IX
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 13:03:43 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1pf1sD-00067K-K1
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 13:03:43 -0400
Received: by mail-ed1-x533.google.com with SMTP id cy23so75630964edb.12
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 10:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679504619;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lZT5Hj6ka2F+iIdEBVxjSmuUvWMdIoTIapz9ATkZsts=;
 b=O+ASpTq6yCMbh856lvvdVjPA0Z1GHEo8bZDhJGxG5X+vr8dmw428CZx1A0naL8aN1y
 lyRmzMFhy6VmuUqKAkW9VR5Tjx1kfkIDdVN7xHZGaIQyG+CfG3jwdVe7zzeyKiS3JOUl
 dWsIQ3q1kDSU8Sy7Thcgk8vPluBiXgd95a8Ky5cjheoDFzamdcyT4e0AetRTxbNy/oho
 HOQ2kQFmiUIC2GT0d8Vr3vRAtnNzjhdO49vgAoXIZ1TaSuN7L9aCvmjg+4zZamYa3c3q
 OSaibwIdqi0KTmFkWvUljrzVFFE2QoeqnXqEHZF0aloUCcMNAZAbUPHUU4sj7J61FHQA
 jI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679504619;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lZT5Hj6ka2F+iIdEBVxjSmuUvWMdIoTIapz9ATkZsts=;
 b=uALB2ciDdagr0E9PJ36NY5clJoC/8pq6FzWNxmiNG5NgX2kQrbPLcqqAKgTrOVn2BR
 iaCq3yV6aXVh+ZoX7yWnsDBZsiHQ+DgdJQXkBpy5rDMAxX/3MWJY3gXFtwPTBJBx/+n4
 YLinkfFfPr45xgS42cBy5j5Y3LTXC13PDDdinms3296IpMYTQfM3ML9UHzQ4StUrR+Z7
 W5K2Ibrj6YuqP2aztpWx5zr8tPuRUprXD0KSaEaIh3pvLikBDPDep/3Eldw7LuYGDJzH
 u0zEcrRMUIdupZLSpZSkZQh1j8oRAn18cr0JE52tVmkA7GG8qk+sDGRmc+0Uj8tTh0gZ
 05PA==
X-Gm-Message-State: AO0yUKXUtPB5vHYKl+zKBFf7C7PW2dGZcSXyi5pslr9cNEoUnf3fMkX7
 x7bQxAxJJrsSKU4rkb2dp+AWheA2l4q8iLnlSIk7Fw==
X-Google-Smtp-Source: AK7set//lNrrI8hW/o31KCxQpZPNh2mqSyDxITYCG95rdE6DCfG3HhYbFoVF+NUyrVp/iVDl3tLKwixds2HNc28RPUw=
X-Received: by 2002:a50:9ee7:0:b0:4fb:9735:f915 with SMTP id
 a94-20020a509ee7000000b004fb9735f915mr3913203edf.8.1679504618854; Wed, 22 Mar
 2023 10:03:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230321182744.2814034-1-venture@google.com>
 <ZBpcwnsttm5NSbTc@minyard.net>
In-Reply-To: <ZBpcwnsttm5NSbTc@minyard.net>
From: Patrick Venture <venture@google.com>
Date: Wed, 22 Mar 2023 10:03:27 -0700
Message-ID: <CAO=notxaTaU5NoNdcEJ_nCvb6FnY8DGSzJcZxdk=5aBzDj1Hgw@mail.gmail.com>
Subject: Re: [PATCH RESEND] hw/i2c: Enable an id for the pca954x devices
To: cminyard@mvista.com
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, 
 Hao Wu <wuhaotsh@google.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000034dfb705f7802425"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=venture@google.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000034dfb705f7802425
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2023 at 6:41=E2=80=AFPM Corey Minyard <cminyard@mvista.com>=
 wrote:

> On Tue, Mar 21, 2023 at 11:27:44AM -0700, Patrick Venture wrote:
> > This allows the devices to be more readily found and specified.
> > Without setting the id field, they can only be found by device type
> > name, which doesn't let you specify the second of the same device type
> > behind a bus.
>
> So basically, this helps you find a specific device if you have more
> than one of them.  Yeah, probably a good idea in this case.
>
> >
> > Tested: Verified that by default the device was findable with the id
> > 'pca954x[77]', for an instance attached at that address.
> >
> > Signed-off-by: Patrick Venture <venture@google.com>
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > ---
> >  hw/i2c/i2c_mux_pca954x.c | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
> > index a9517b612a..4f8c2d6ae1 100644
> > --- a/hw/i2c/i2c_mux_pca954x.c
> > +++ b/hw/i2c/i2c_mux_pca954x.c
> > @@ -20,6 +20,7 @@
> >  #include "hw/i2c/i2c_mux_pca954x.h"
> >  #include "hw/i2c/smbus_slave.h"
> >  #include "hw/qdev-core.h"
> > +#include "hw/qdev-properties.h"
> >  #include "hw/sysbus.h"
> >  #include "qemu/log.h"
> >  #include "qemu/module.h"
> > @@ -43,6 +44,8 @@ typedef struct Pca954xState {
> >
> >      bool enabled[PCA9548_CHANNEL_COUNT];
> >      I2CBus *bus[PCA9548_CHANNEL_COUNT];
> > +
> > +    char *id;
> >  } Pca954xState;
> >
> >  /*
> > @@ -181,6 +184,17 @@ static void pca9548_class_init(ObjectClass *klass,
> void *data)
> >      s->nchans =3D PCA9548_CHANNEL_COUNT;
> >  }
> >
> > +static void pca954x_realize(DeviceState *dev, Error **errp)
> > +{
> > +    Pca954xState *s =3D PCA954X(dev);
> > +    DeviceState *d =3D DEVICE(s);
> > +    if (s->id) {
> > +        d->id =3D g_strdup(s->id);
> > +    } else {
> > +        d->id =3D g_strdup_printf("pca954x[%x]", s->parent.i2c.address=
);
> > +    }
> > +}
> > +
> >  static void pca954x_init(Object *obj)
> >  {
> >      Pca954xState *s =3D PCA954X(obj);
> > @@ -197,6 +211,11 @@ static void pca954x_init(Object *obj)
> >      }
> >  }
> >
> > +static Property pca954x_props[] =3D {
> > +    DEFINE_PROP_STRING("id", Pca954xState, id),
> > +    DEFINE_PROP_END_OF_LIST()
> > +};
>
> There is already an "id=3D" thing in qemu for doing links between front
> ends and back ends.  That's probably not the best name to use.  Several
> devices, like network devices, use "name" for identification in the
> monitor.
>

So I should change it to name? I'm ok with that. I think bus would be
slightly confusing.  "id" was short and easy.  Will send a v2.


>
> -corey
>
> > +
> >  static void pca954x_class_init(ObjectClass *klass, void *data)
> >  {
> >      I2CSlaveClass *sc =3D I2C_SLAVE_CLASS(klass);
> > @@ -209,9 +228,12 @@ static void pca954x_class_init(ObjectClass *klass,
> void *data)
> >      rc->phases.enter =3D pca954x_enter_reset;
> >
> >      dc->desc =3D "Pca954x i2c-mux";
> > +    dc->realize =3D pca954x_realize;
> >
> >      k->write_data =3D pca954x_write_data;
> >      k->receive_byte =3D pca954x_read_byte;
> > +
> > +    device_class_set_props(dc, pca954x_props);
> >  }
> >
> >  static const TypeInfo pca954x_info[] =3D {
> > --
> > 2.35.1.894.gb6a874cedc-goog
> >
>

--00000000000034dfb705f7802425
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 21, 2023 at 6:41=E2=80=AF=
PM Corey Minyard &lt;<a href=3D"mailto:cminyard@mvista.com">cminyard@mvista=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On Tue, Mar 21, 2023 at 11:27:44AM -0700, Patrick Venture wrote:<br>
&gt; This allows the devices to be more readily found and specified.<br>
&gt; Without setting the id field, they can only be found by device type<br=
>
&gt; name, which doesn&#39;t let you specify the second of the same device =
type<br>
&gt; behind a bus.<br>
<br>
So basically, this helps you find a specific device if you have more<br>
than one of them.=C2=A0 Yeah, probably a good idea in this case.<br>
<br>
&gt; <br>
&gt; Tested: Verified that by default the device was findable with the id<b=
r>
&gt; &#39;pca954x[77]&#39;, for an instance attached at that address.<br>
&gt; <br>
&gt; Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.co=
m" target=3D"_blank">venture@google.com</a>&gt;<br>
&gt; Reviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=
=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@=
linaro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/i2c/i2c_mux_pca954x.c | 22 ++++++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 22 insertions(+)<br>
&gt; <br>
&gt; diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c<br>
&gt; index a9517b612a..4f8c2d6ae1 100644<br>
&gt; --- a/hw/i2c/i2c_mux_pca954x.c<br>
&gt; +++ b/hw/i2c/i2c_mux_pca954x.c<br>
&gt; @@ -20,6 +20,7 @@<br>
&gt;=C2=A0 #include &quot;hw/i2c/i2c_mux_pca954x.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/i2c/smbus_slave.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/qdev-core.h&quot;<br>
&gt; +#include &quot;hw/qdev-properties.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/sysbus.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu/log.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu/module.h&quot;<br>
&gt; @@ -43,6 +44,8 @@ typedef struct Pca954xState {<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool enabled[PCA9548_CHANNEL_COUNT];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 I2CBus *bus[PCA9548_CHANNEL_COUNT];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 char *id;<br>
&gt;=C2=A0 } Pca954xState;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /*<br>
&gt; @@ -181,6 +184,17 @@ static void pca9548_class_init(ObjectClass *klass=
, void *data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 s-&gt;nchans =3D PCA9548_CHANNEL_COUNT;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +static void pca954x_realize(DeviceState *dev, Error **errp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 Pca954xState *s =3D PCA954X(dev);<br>
&gt; +=C2=A0 =C2=A0 DeviceState *d =3D DEVICE(s);<br>
&gt; +=C2=A0 =C2=A0 if (s-&gt;id) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;id =3D g_strdup(s-&gt;id);<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 d-&gt;id =3D g_strdup_printf(&quot;pca954=
x[%x]&quot;, s-&gt;parent.i2c.address);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static void pca954x_init(Object *obj)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Pca954xState *s =3D PCA954X(obj);<br>
&gt; @@ -197,6 +211,11 @@ static void pca954x_init(Object *obj)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +static Property pca954x_props[] =3D {<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_STRING(&quot;id&quot;, Pca954xState, id),<b=
r>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_END_OF_LIST()<br>
&gt; +};<br>
<br>
There is already an &quot;id=3D&quot; thing in qemu for doing links between=
 front<br>
ends and back ends.=C2=A0 That&#39;s probably not the best name to use.=C2=
=A0 Several<br>
devices, like network devices, use &quot;name&quot; for identification in t=
he<br>
monitor.<br></blockquote><div><br></div><div>So I should change it to name?=
 I&#39;m ok with that. I think bus would be slightly confusing.=C2=A0 &quot=
;id&quot; was short and easy.=C2=A0 Will send a v2.</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-corey<br>
<br>
&gt; +<br>
&gt;=C2=A0 static void pca954x_class_init(ObjectClass *klass, void *data)<b=
r>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 I2CSlaveClass *sc =3D I2C_SLAVE_CLASS(klass);<br>
&gt; @@ -209,9 +228,12 @@ static void pca954x_class_init(ObjectClass *klass=
, void *data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rc-&gt;phases.enter =3D pca954x_enter_reset;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 dc-&gt;desc =3D &quot;Pca954x i2c-mux&quot;;<br>
&gt; +=C2=A0 =C2=A0 dc-&gt;realize =3D pca954x_realize;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 k-&gt;write_data =3D pca954x_write_data;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 k-&gt;receive_byte =3D pca954x_read_byte;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 device_class_set_props(dc, pca954x_props);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static const TypeInfo pca954x_info[] =3D {<br>
&gt; -- <br>
&gt; 2.35.1.894.gb6a874cedc-goog<br>
&gt; <br>
</blockquote></div></div>

--00000000000034dfb705f7802425--

