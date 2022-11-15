Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6A262AEAC
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 23:54:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov4nh-0001Go-I9; Tue, 15 Nov 2022 17:53:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ov4nd-0001Ex-QM
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 17:53:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ov4nb-0006B7-GP
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 17:53:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668552777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8O38JGLcXrn9IHmMLX9xOWyGiE5wlAFnwmhK226fdn4=;
 b=HV/62OKBBgiaZ6iy3hfJA9lCfmgb2K8JZVzWnM31ybV9C7T7ARhoBbZWKbnsNDM4VsXLIw
 Gbr5Z5hIPCLhpvkzKLkm5NRyBQm1/BVrpxM+CXNAiaYTTwgQ9QFXbwW1nnsl0rLdfSfCIX
 wqVTgCxEjFTLeRxIY53L18D5oTsT0XI=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663-I1Xfi0D1OpayPzLu69T-sA-1; Tue, 15 Nov 2022 17:52:54 -0500
X-MC-Unique: I1Xfi0D1OpayPzLu69T-sA-1
Received: by mail-vs1-f71.google.com with SMTP id
 m125-20020a672683000000b003af413a8263so1527261vsm.17
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 14:52:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8O38JGLcXrn9IHmMLX9xOWyGiE5wlAFnwmhK226fdn4=;
 b=I3Q0f2SHtfjZUtJqO5vbzpFugUzx6nizThiaK2Dk1wJyeTn5nESpd2yZGGnxwTFXvm
 EUeG/jug3tYpandzbLis0JhpLkkg76+tgrP1JdgDdzBeV9lUaAFG2IJiJCTZcVKyBi5G
 zSCph/rK52dxW3jm+KLjoIuj4Oi5doW9LuiKax4Xf9Kf8SUpNig+cMnURLsQvcu0Ytmc
 zdEGgiNEbP1E8J7sp8ARyjvEwzRX2dGgQnStvWmxAMJHD6Q01252cd9LRsVXFLjESo/M
 kst/ZBhBH2VXxvilGZkla6ULNpvLu0z/467btfpg77dL7Ir+YWeHoleumDhs32s+gImg
 dvkw==
X-Gm-Message-State: ANoB5pkozl8haVGo1+FIOGuvT9eFbO2JrrVC68eQMyeyZIOxg4/IBAaf
 ybl70uMJLq2S2APDCVmVrBiBKI5tlDafE/8WFp8Nk+U+ctBiJVghj4nNHCgWIbxxQL7aYWVpqsO
 x9TxrEOwrUxhYc0SRKluzCecs1i1Dd3g=
X-Received: by 2002:a1f:2fc6:0:b0:3b7:cbb8:bbf1 with SMTP id
 v189-20020a1f2fc6000000b003b7cbb8bbf1mr11122035vkv.25.1668552774160; 
 Tue, 15 Nov 2022 14:52:54 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5UjjTeaynnPPKmQXWb8BxRbc9jLUkndHg3PVMpwdM9IYCqfSmTuc1rO6SRFYviHoOQmhiUa4eMaVdYBTvmYNE=
X-Received: by 2002:a1f:2fc6:0:b0:3b7:cbb8:bbf1 with SMTP id
 v189-20020a1f2fc6000000b003b7cbb8bbf1mr11122020vkv.25.1668552773938; Tue, 15
 Nov 2022 14:52:53 -0800 (PST)
MIME-Version: 1.0
References: <20221115212759.3095751-1-jsnow@redhat.com>
 <874juzal7m.fsf@linaro.org>
In-Reply-To: <874juzal7m.fsf@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Tue, 15 Nov 2022 17:52:37 -0500
Message-ID: <CAFn=p-Y+hyqYNnFRZZneiA+JOf-PiR3sBsaMAqJPYaG+Chgy7Q@mail.gmail.com>
Subject: Re: [PATCH] tests/avocado: configure acpi-bits to use avocado timeout
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Ani Sinha <ani@anisinha.ca>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000614c5505ed8a3754"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000614c5505ed8a3754
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 15, 2022, 5:48 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:

>
> John Snow <jsnow@redhat.com> writes:
>
> > Instead of using a hardcoded timeout, just rely on Avocado's built-in
> > test case timeout. This helps avoid timeout issues on machines where 60
> > seconds is not sufficient.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  tests/avocado/acpi-bits.py | 10 ++--------
> >  1 file changed, 2 insertions(+), 8 deletions(-)
> >
> > diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
> > index 8745a58a766..ac13e22dc93 100644
> > --- a/tests/avocado/acpi-bits.py
> > +++ b/tests/avocado/acpi-bits.py
> > @@ -385,12 +385,6 @@ def test_acpi_smbios_bits(self):
> >          self._vm.launch()
> >          # biosbits has been configured to run all the specified test
> suites
> >          # in batch mode and then automatically initiate a vm shutdown.
> > -        # sleep for maximum of one minute
> > -        max_sleep_time =3D time.monotonic() + 60
> > -        while self._vm.is_running() and time.monotonic() <
> max_sleep_time:
> > -            time.sleep(1)
> > -
> > -        self.assertFalse(time.monotonic() > max_sleep_time,
> > -                         'The VM seems to have failed to shutdown in
> time')
> > -
>
> We might want some wait for consoles as well depending on what is output
> during the run.
>

Ah! there's the catch I was forgetting. I subbed this in and it appeared to
work, so I thought I was home free.

OK, back to the drawing board...


>
> > +        # Rely on avocado's unit test timeout.
> > +        self._vm.wait(timeout=3DNone)
> >          self.parse_log()
>
>
> --
> Alex Benn=C3=A9e
>
>

--000000000000614c5505ed8a3754
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Nov 15, 2022, 5:48 PM Alex Benn=C3=A9e &lt;<a =
href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><br>
John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank" rel=3D"=
noreferrer">jsnow@redhat.com</a>&gt; writes:<br>
<br>
&gt; Instead of using a hardcoded timeout, just rely on Avocado&#39;s built=
-in<br>
&gt; test case timeout. This helps avoid timeout issues on machines where 6=
0<br>
&gt; seconds is not sufficient.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 tests/avocado/acpi-bits.py | 10 ++--------<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 8 deletions(-)<br>
&gt;<br>
&gt; diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py<b=
r>
&gt; index 8745a58a766..ac13e22dc93 100644<br>
&gt; --- a/tests/avocado/acpi-bits.py<br>
&gt; +++ b/tests/avocado/acpi-bits.py<br>
&gt; @@ -385,12 +385,6 @@ def test_acpi_smbios_bits(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._vm.launch()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # biosbits has been configured to ru=
n all the specified test suites<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # in batch mode and then automatical=
ly initiate a vm shutdown.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # sleep for maximum of one minute<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 max_sleep_time =3D time.monotonic() + 60<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 while self._vm.is_running() and time.mono=
tonic() &lt; max_sleep_time:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep(1)<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertFalse(time.monotonic() &gt; ma=
x_sleep_time,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&#39;The VM seems to have failed to shutdown in time&#=
39;)<br>
&gt; -<br>
<br>
We might want some wait for consoles as well depending on what is output<br=
>
during the run.<br></blockquote></div></div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Ah! there&#39;s the catch I was forgetting. I subbed this in=
 and it appeared to work, so I thought I was home free.</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">OK, back to the drawing board...</div><div =
dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Rely on avocado&#39;s unit test timeout=
.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._vm.wait(timeout=3DNone)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.parse_log()<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
<br>
</blockquote></div></div></div>

--000000000000614c5505ed8a3754--


