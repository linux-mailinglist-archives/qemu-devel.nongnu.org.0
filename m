Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF57487D4C
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 20:49:03 +0100 (CET)
Received: from localhost ([::1]:47450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5tuW-0003CO-Q3
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 13:24:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1n5trk-0001jE-Ps
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 13:21:29 -0500
Received: from [2607:f8b0:4864:20::92c] (port=43763
 helo=mail-ua1-x92c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1n5trh-0000A3-DX
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 13:21:28 -0500
Received: by mail-ua1-x92c.google.com with SMTP id i5so11663821uaq.10
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 10:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MlxL/GBcszhMRn3qmb03Bt+/NeSGGUVZRbFgP49uahI=;
 b=BLpV0PzMgaPzDCTflsxwOhX6leWF+T4g4B3/HqtsS+uxlRu3+cXNpRsZdlQOwdV6ry
 5B4hOojzir26fnR8Qr5sStb1Wllhrvr5Hz6A7wSbBBQ1ziRauSebkXuLVr52+zWz3a2o
 f3+TKToG56At5FYMaXODk/354ovpBGA2IBgbLNmOJlogmYVDyhfT/EV2wbmAQ15Rxthv
 ldnexqg6v5Syx8+cAycNqxN+F2X85GehI0wHfR05BL2bKKFKFcrxz/uzgdOLNReiJPI2
 xqKsjfpzp4miPVURhTXxvsFd4VoIQqV9NxYswZif35B9gaNxSwPyLJtCjC9sKpv1AGFN
 k3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MlxL/GBcszhMRn3qmb03Bt+/NeSGGUVZRbFgP49uahI=;
 b=6zHyHu3u1r4yOzE0hScC441TeZ6cx2sJJJYX2R3g4VNOjqwoROkJghCnABbHjiRLLC
 4EbEhTsvY0PWcWe7yJSJWtklJ76AW8aMMVK4bxSTSl3rEj9r2928CcSTFZENKTZgbISA
 Pk7EnxM8jJlYcr2eSGRPiiFrdoUJj1p+CFlP3Cq5F8wAtlvZwJU6GnB/e6T51gmoex2a
 whyp59VMfy0wFB96zIcqVWH7mVrJWf/c00yglQxSLG77ppX1hXvBzNfvigyhVHMNkwb2
 KNWIqv8PLHOZ5PmqYaa4qISc3m6TTLlsBFHLySabHxjtIJUmFnyT6SmZDXrLEV4wH7nM
 kMAA==
X-Gm-Message-State: AOAM533xgW/d2IUNBYzQhvavWmM8NgyJgJdsJSI7MhsrwPtXvXaNhIOH
 75BHyBjaLFxobnvQLaaOvRRjdtC6acXimTU8e7hnd5yMxCw=
X-Google-Smtp-Source: ABdhPJz4w10+5WIUMPxDB1PPrkniiKMXp+58nyOX6XxULvtqkjMPzykQ7ddTZzKJboD8FDlb+7THd1W71blY6lSCuSc=
X-Received: by 2002:a9f:31cc:: with SMTP id w12mr6301105uad.46.1641579443264; 
 Fri, 07 Jan 2022 10:17:23 -0800 (PST)
MIME-Version: 1.0
References: <20220106173814.3580141-1-venture@google.com>
 <07207168-0940-a3de-c188-d676658603e8@redhat.com>
In-Reply-To: <07207168-0940-a3de-c188-d676658603e8@redhat.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 7 Jan 2022 10:17:12 -0800
Message-ID: <CAO=noty0WCnPqYgwAHVB3wPnfQ6+HxLhT82GjRKSk1yMnbrr+A@mail.gmail.com>
Subject: Re: [PATCH] hw/sensor: enable setting adm1272 temperature with qmp
To: Thomas Huth <thuth@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000009689b105d501ff27"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=venture@google.com; helo=mail-ua1-x92c.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

--0000000000009689b105d501ff27
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 7, 2022 at 5:24 AM Thomas Huth <thuth@redhat.com> wrote:

> On 06/01/2022 18.38, Patrick Venture wrote:
> > From: Titus Rwantare <titusr@google.com>
> >
> > Reviewed-by: Patrick Venture <venture@google.com>
> > Reviewed-by: Chris Rauer <crauer@google.com>
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> > Signed-off-by: Titus Rwantare <titusr@google.com>
> > ---
> >   hw/sensor/adm1272.c        | 27 ++++++++++++++++++++++++++-
> >   tests/qtest/adm1272-test.c | 28 +++++++++++++++++++++++++++-
> >   2 files changed, 53 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/sensor/adm1272.c b/hw/sensor/adm1272.c
> > index 7310c769be..77a3d8eccf 100644
> > --- a/hw/sensor/adm1272.c
> > +++ b/hw/sensor/adm1272.c
> > @@ -66,6 +66,7 @@
> >   #define ADM1272_VOLTAGE_COEFF_DEFAULT   1
> >   #define ADM1272_CURRENT_COEFF_DEFAULT   3
> >   #define ADM1272_PWR_COEFF_DEFAULT       7
> > +#define ADM1272_TEMP_COEFF_DEFAULT      8
> >   #define ADM1272_IOUT_OFFSET             0x5000
> >   #define ADM1272_IOUT_OFFSET             0x5000
> >
> > @@ -186,6 +187,22 @@ static uint32_t adm1272_direct_to_watts(uint16_t
> value)
> >       return pmbus_direct_mode2data(c, value);
> >   }
> >
> > +static uint16_t adm1272_millidegrees_to_direct(uint32_t value)
> > +{
> > +    PMBusCoefficients c =
> adm1272_coefficients[ADM1272_TEMP_COEFF_DEFAULT];
> > +    c.b = c.b * 1000;
> > +    c.R = c.R - 3;
> > +    return pmbus_data2direct_mode(c, value);
> > +}
> > +
> > +static uint32_t adm1272_direct_to_millidegrees(uint16_t value)
> > +{
> > +    PMBusCoefficients c =
> adm1272_coefficients[ADM1272_TEMP_COEFF_DEFAULT];
> > +    c.b = c.b * 1000;
> > +    c.R = c.R - 3;
> > +    return pmbus_direct_mode2data(c, value);
> > +}
> > +
> >   static void adm1272_exit_reset(Object *obj)
> >   {
> >       ADM1272State *s = ADM1272(obj);
> > @@ -220,7 +237,7 @@ static void adm1272_exit_reset(Object *obj)
> >           = adm1272_millivolts_to_direct(ADM1272_VOLT_DEFAULT);
> >       pmdev->pages[0].read_iout
> >           = adm1272_milliamps_to_direct(ADM1272_IOUT_DEFAULT);
> > -    pmdev->pages[0].read_temperature_1 = 0;
> > +    pmdev->pages[0].read_temperature_1 =
> adm1272_millidegrees_to_direct(30000);
> >       pmdev->pages[0].read_pin =
> adm1272_watts_to_direct(ADM1272_PWR_DEFAULT);
> >       pmdev->pages[0].revision = ADM1272_PMBUS_REVISION_DEFAULT;
> >       pmdev->pages[0].mfr_id = ADM1272_MFR_ID_DEFAULT;
> > @@ -423,6 +440,8 @@ static void adm1272_get(Object *obj, Visitor *v,
> const char *name, void *opaque,
> >           value = adm1272_direct_to_milliamps(*(uint16_t *)opaque);
> >       } else if (strcmp(name, "pin") == 0) {
> >           value = adm1272_direct_to_watts(*(uint16_t *)opaque);
> > +    } else if (strcmp(name, "temperature") == 0) {
> > +        value = adm1272_direct_to_millidegrees(*(uint16_t *)opaque);
> >       } else {
> >           value = *(uint16_t *)opaque;
> >       }
> > @@ -447,6 +466,8 @@ static void adm1272_set(Object *obj, Visitor *v,
> const char *name, void *opaque,
> >           *internal = adm1272_milliamps_to_direct(value);
> >       } else if (strcmp(name, "pin") == 0) {
> >           *internal = adm1272_watts_to_direct(value);
> > +    } else if (strcmp(name, "temperature") == 0) {
> > +        *internal = adm1272_millidegrees_to_direct(value);
> >       } else {
> >           *internal = value;
> >       }
> > @@ -510,6 +531,10 @@ static void adm1272_init(Object *obj)
> >                           adm1272_get,
> >                           adm1272_set, NULL, &pmdev->pages[0].read_pin);
> >
> > +    object_property_add(obj, "temperature", "uint16",
> > +                        adm1272_get,
> > +                        adm1272_set, NULL,
> &pmdev->pages[0].read_temperature_1);
> > +
> >   }
> >
> >   static void adm1272_class_init(ObjectClass *klass, void *data)
> > diff --git a/tests/qtest/adm1272-test.c b/tests/qtest/adm1272-test.c
> > index 63f8514801..98134aabd2 100644
> > --- a/tests/qtest/adm1272-test.c
> > +++ b/tests/qtest/adm1272-test.c
> > @@ -65,6 +65,7 @@
> >   #define ADM1272_VOLTAGE_COEFF_DEFAULT   1
> >   #define ADM1272_CURRENT_COEFF_DEFAULT   3
> >   #define ADM1272_PWR_COEFF_DEFAULT       7
> > +#define ADM1272_TEMP_COEFF_DEFAULT      8
> >   #define ADM1272_IOUT_OFFSET             0x5000
> >   #define ADM1272_IOUT_OFFSET             0x5000
> >
> > @@ -144,6 +145,22 @@ static uint32_t adm1272_direct_to_watts(uint16_t
> value)
> >       return pmbus_direct_mode2data(c, value);
> >   }
> >
> > +static uint16_t adm1272_millidegrees_to_direct(uint32_t value)
> > +{
> > +    PMBusCoefficients c =
> adm1272_coefficients[ADM1272_TEMP_COEFF_DEFAULT];
> > +    c.b = c.b * 1000;
> > +    c.R = c.R - 3;
> > +    return pmbus_data2direct_mode(c, value);
> > +}
> > +
> > +static uint32_t adm1272_direct_to_millidegrees(uint16_t value)
> > +{
> > +    PMBusCoefficients c =
> adm1272_coefficients[ADM1272_TEMP_COEFF_DEFAULT];
> > +    c.b = c.b * 1000;
> > +    c.R = c.R - 3;
> > +    return pmbus_direct_mode2data(c, value);
> > +}
> > +
> >   static uint16_t qmp_adm1272_get(const char *id, const char *property)
> >   {
> >       QDict *response;
> > @@ -248,7 +265,7 @@ static void test_defaults(void *obj, void *data,
> QGuestAllocator *alloc)
> >   /* test qmp access */
> >   static void test_tx_rx(void *obj, void *data, QGuestAllocator *alloc)
> >   {
> > -    uint16_t i2c_value, value, i2c_voltage, i2c_pwr, lossy_value;
> > +    uint16_t i2c_value, value, i2c_voltage, i2c_pwr, i2c_temp,
> lossy_value;
> >       QI2CDevice *i2cdev = (QI2CDevice *)obj;
> >
> >       /* converting to direct mode is lossy - we generate the same loss
> here */
> > @@ -287,6 +304,15 @@ static void test_tx_rx(void *obj, void *data,
> QGuestAllocator *alloc)
> >       i2c_pwr = adm1272_direct_to_watts(i2c_value);
> >       g_assert_cmphex(value, ==, i2c_pwr);
> >       g_assert_cmphex(i2c_pwr, ==, lossy_value);
> > +
> > +    lossy_value =
> > +
> adm1272_direct_to_millidegrees(adm1272_millidegrees_to_direct(25000));
> > +    qmp_adm1272_set(TEST_ID, "temperature", 25000);
> > +    value = qmp_adm1272_get(TEST_ID, "temperature");
> > +    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_1);
> > +    i2c_temp = adm1272_direct_to_millidegrees(i2c_value);
> > +    g_assert_cmphex(value, ==, i2c_temp);
> > +    g_assert_cmphex(i2c_temp, ==, lossy_value);
> >   }
> >
> >   /* test r/w registers */
>
> qtest part:
> Acked-by: Thomas Huth <thuth@redhat.com>
>

Adding your Ack to the mailing list version.

--0000000000009689b105d501ff27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 7, 2022 at 5:24 AM Thomas=
 Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 06/01/2022=
 18.38, Patrick Venture wrote:<br>
&gt; From: Titus Rwantare &lt;<a href=3D"mailto:titusr@google.com" target=
=3D"_blank">titusr@google.com</a>&gt;<br>
&gt; <br>
&gt; Reviewed-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.com"=
 target=3D"_blank">venture@google.com</a>&gt;<br>
&gt; Reviewed-by: Chris Rauer &lt;<a href=3D"mailto:crauer@google.com" targ=
et=3D"_blank">crauer@google.com</a>&gt;<br>
&gt; Reviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=
=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; Signed-off-by: Titus Rwantare &lt;<a href=3D"mailto:titusr@google.com"=
 target=3D"_blank">titusr@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/sensor/adm1272.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 27 ++++++=
++++++++++++++++++++-<br>
&gt;=C2=A0 =C2=A0tests/qtest/adm1272-test.c | 28 ++++++++++++++++++++++++++=
+-<br>
&gt;=C2=A0 =C2=A02 files changed, 53 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/sensor/adm1272.c b/hw/sensor/adm1272.c<br>
&gt; index 7310c769be..77a3d8eccf 100644<br>
&gt; --- a/hw/sensor/adm1272.c<br>
&gt; +++ b/hw/sensor/adm1272.c<br>
&gt; @@ -66,6 +66,7 @@<br>
&gt;=C2=A0 =C2=A0#define ADM1272_VOLTAGE_COEFF_DEFAULT=C2=A0 =C2=A01<br>
&gt;=C2=A0 =C2=A0#define ADM1272_CURRENT_COEFF_DEFAULT=C2=A0 =C2=A03<br>
&gt;=C2=A0 =C2=A0#define ADM1272_PWR_COEFF_DEFAULT=C2=A0 =C2=A0 =C2=A0 =C2=
=A07<br>
&gt; +#define ADM1272_TEMP_COEFF_DEFAULT=C2=A0 =C2=A0 =C2=A0 8<br>
&gt;=C2=A0 =C2=A0#define ADM1272_IOUT_OFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00x5000<br>
&gt;=C2=A0 =C2=A0#define ADM1272_IOUT_OFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00x5000<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -186,6 +187,22 @@ static uint32_t adm1272_direct_to_watts(uint16_t =
value)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return pmbus_direct_mode2data(c, value);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static uint16_t adm1272_millidegrees_to_direct(uint32_t value)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 PMBusCoefficients c =3D adm1272_coefficients[ADM1272_TE=
MP_COEFF_DEFAULT];<br>
&gt; +=C2=A0 =C2=A0 c.b =3D c.b * 1000;<br>
&gt; +=C2=A0 =C2=A0 c.R =3D c.R - 3;<br>
&gt; +=C2=A0 =C2=A0 return pmbus_data2direct_mode(c, value);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static uint32_t adm1272_direct_to_millidegrees(uint16_t value)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 PMBusCoefficients c =3D adm1272_coefficients[ADM1272_TE=
MP_COEFF_DEFAULT];<br>
&gt; +=C2=A0 =C2=A0 c.b =3D c.b * 1000;<br>
&gt; +=C2=A0 =C2=A0 c.R =3D c.R - 3;<br>
&gt; +=C2=A0 =C2=A0 return pmbus_direct_mode2data(c, value);<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0static void adm1272_exit_reset(Object *obj)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ADM1272State *s =3D ADM1272(obj);<br>
&gt; @@ -220,7 +237,7 @@ static void adm1272_exit_reset(Object *obj)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D adm1272_millivolts_to_dire=
ct(ADM1272_VOLT_DEFAULT);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pmdev-&gt;pages[0].read_iout<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D adm1272_milliamps_to_direc=
t(ADM1272_IOUT_DEFAULT);<br>
&gt; -=C2=A0 =C2=A0 pmdev-&gt;pages[0].read_temperature_1 =3D 0;<br>
&gt; +=C2=A0 =C2=A0 pmdev-&gt;pages[0].read_temperature_1 =3D adm1272_milli=
degrees_to_direct(30000);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pmdev-&gt;pages[0].read_pin =3D adm1272_watt=
s_to_direct(ADM1272_PWR_DEFAULT);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pmdev-&gt;pages[0].revision =3D ADM1272_PMBU=
S_REVISION_DEFAULT;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pmdev-&gt;pages[0].mfr_id =3D ADM1272_MFR_ID=
_DEFAULT;<br>
&gt; @@ -423,6 +440,8 @@ static void adm1272_get(Object *obj, Visitor *v, c=
onst char *name, void *opaque,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value =3D adm1272_direct_to_mi=
lliamps(*(uint16_t *)opaque);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (strcmp(name, &quot;pin&quot;) =3D=
=3D 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value =3D adm1272_direct_to_wa=
tts(*(uint16_t *)opaque);<br>
&gt; +=C2=A0 =C2=A0 } else if (strcmp(name, &quot;temperature&quot;) =3D=3D=
 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D adm1272_direct_to_millidegrees(=
*(uint16_t *)opaque);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value =3D *(uint16_t *)opaque;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -447,6 +466,8 @@ static void adm1272_set(Object *obj, Visitor *v, c=
onst char *name, void *opaque,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*internal =3D adm1272_milliamp=
s_to_direct(value);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (strcmp(name, &quot;pin&quot;) =3D=
=3D 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*internal =3D adm1272_watts_to=
_direct(value);<br>
&gt; +=C2=A0 =C2=A0 } else if (strcmp(name, &quot;temperature&quot;) =3D=3D=
 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *internal =3D adm1272_millidegrees_to_dir=
ect(value);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*internal =3D value;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -510,6 +531,10 @@ static void adm1272_init(Object *obj)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0adm1272_get,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0adm1272_set, NULL, &amp;pmdev-&gt;pages[0].read_=
pin);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 object_property_add(obj, &quot;temperature&quot;, &quot=
;uint16&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 adm1272_get,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 adm1272_set, NULL, &amp;pmdev-&gt;pages[0].read_temperature_=
1);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static void adm1272_class_init(ObjectClass *klass, void *d=
ata)<br>
&gt; diff --git a/tests/qtest/adm1272-test.c b/tests/qtest/adm1272-test.c<b=
r>
&gt; index 63f8514801..98134aabd2 100644<br>
&gt; --- a/tests/qtest/adm1272-test.c<br>
&gt; +++ b/tests/qtest/adm1272-test.c<br>
&gt; @@ -65,6 +65,7 @@<br>
&gt;=C2=A0 =C2=A0#define ADM1272_VOLTAGE_COEFF_DEFAULT=C2=A0 =C2=A01<br>
&gt;=C2=A0 =C2=A0#define ADM1272_CURRENT_COEFF_DEFAULT=C2=A0 =C2=A03<br>
&gt;=C2=A0 =C2=A0#define ADM1272_PWR_COEFF_DEFAULT=C2=A0 =C2=A0 =C2=A0 =C2=
=A07<br>
&gt; +#define ADM1272_TEMP_COEFF_DEFAULT=C2=A0 =C2=A0 =C2=A0 8<br>
&gt;=C2=A0 =C2=A0#define ADM1272_IOUT_OFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00x5000<br>
&gt;=C2=A0 =C2=A0#define ADM1272_IOUT_OFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00x5000<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -144,6 +145,22 @@ static uint32_t adm1272_direct_to_watts(uint16_t =
value)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return pmbus_direct_mode2data(c, value);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static uint16_t adm1272_millidegrees_to_direct(uint32_t value)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 PMBusCoefficients c =3D adm1272_coefficients[ADM1272_TE=
MP_COEFF_DEFAULT];<br>
&gt; +=C2=A0 =C2=A0 c.b =3D c.b * 1000;<br>
&gt; +=C2=A0 =C2=A0 c.R =3D c.R - 3;<br>
&gt; +=C2=A0 =C2=A0 return pmbus_data2direct_mode(c, value);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static uint32_t adm1272_direct_to_millidegrees(uint16_t value)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 PMBusCoefficients c =3D adm1272_coefficients[ADM1272_TE=
MP_COEFF_DEFAULT];<br>
&gt; +=C2=A0 =C2=A0 c.b =3D c.b * 1000;<br>
&gt; +=C2=A0 =C2=A0 c.R =3D c.R - 3;<br>
&gt; +=C2=A0 =C2=A0 return pmbus_direct_mode2data(c, value);<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0static uint16_t qmp_adm1272_get(const char *id, const char=
 *property)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QDict *response;<br>
&gt; @@ -248,7 +265,7 @@ static void test_defaults(void *obj, void *data, Q=
GuestAllocator *alloc)<br>
&gt;=C2=A0 =C2=A0/* test qmp access */<br>
&gt;=C2=A0 =C2=A0static void test_tx_rx(void *obj, void *data, QGuestAlloca=
tor *alloc)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 uint16_t i2c_value, value, i2c_voltage, i2c_pwr, lossy_=
value;<br>
&gt; +=C2=A0 =C2=A0 uint16_t i2c_value, value, i2c_voltage, i2c_pwr, i2c_te=
mp, lossy_value;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QI2CDevice *i2cdev =3D (QI2CDevice *)obj;<br=
>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* converting to direct mode is lossy - we g=
enerate the same loss here */<br>
&gt; @@ -287,6 +304,15 @@ static void test_tx_rx(void *obj, void *data, QGu=
estAllocator *alloc)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_pwr =3D adm1272_direct_to_watts(i2c_valu=
e);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_cmphex(value, =3D=3D, i2c_pwr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_cmphex(i2c_pwr, =3D=3D, lossy_value=
);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 lossy_value =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 adm1272_direct_to_millidegrees(adm1272_mi=
llidegrees_to_direct(25000));<br>
&gt; +=C2=A0 =C2=A0 qmp_adm1272_set(TEST_ID, &quot;temperature&quot;, 25000=
);<br>
&gt; +=C2=A0 =C2=A0 value =3D qmp_adm1272_get(TEST_ID, &quot;temperature&qu=
ot;);<br>
&gt; +=C2=A0 =C2=A0 i2c_value =3D adm1272_i2c_get16(i2cdev, PMBUS_READ_TEMP=
ERATURE_1);<br>
&gt; +=C2=A0 =C2=A0 i2c_temp =3D adm1272_direct_to_millidegrees(i2c_value);=
<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmphex(value, =3D=3D, i2c_temp);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmphex(i2c_temp, =3D=3D, lossy_value);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0/* test r/w registers */<br>
<br>
qtest part:<br>
Acked-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=3D"_bl=
ank">thuth@redhat.com</a>&gt;<br></blockquote><div><br></div><div>Adding yo=
ur Ack to the mailing list version.=C2=A0</div></div></div>

--0000000000009689b105d501ff27--

