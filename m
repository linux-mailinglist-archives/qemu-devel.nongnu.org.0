Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FFF62C728
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 19:02:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovMio-0005kH-KT; Wed, 16 Nov 2022 13:01:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ovMil-0005ji-Ms
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 13:01:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ovMij-0005X0-PS
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 13:01:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668621663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AOAxkpzNUeM3e23CE7dCezjJJRWtXwapTRRAjfFfUJ8=;
 b=Bbcsz+VD6HId1s6d7JRQdoCTFCeONFivACALnZvCUMshJefNwpaFD2FDX6Vw4UjyLYRwhy
 nq49IjX1DPFC3TkPLEhgEOrcjZ2Mjllc0tsvxynfHpYJVxwKQ5PnB1hCh/shxVxs/yZnCB
 0W8CIp4jVag1t54K6AVvxOFFJCXIBrc=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-70-JazllHzYM_aoW3iUVd4l9g-1; Wed, 16 Nov 2022 13:01:00 -0500
X-MC-Unique: JazllHzYM_aoW3iUVd4l9g-1
Received: by mail-lf1-f69.google.com with SMTP id
 c1-20020a197601000000b004a2b252ee0dso5682953lff.14
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 10:01:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AOAxkpzNUeM3e23CE7dCezjJJRWtXwapTRRAjfFfUJ8=;
 b=xTckQyGzcmtHGeQ3M8TC0wjzRGaNzRTHdHt2zdHPNIeYu+U6KMre6daUzdaCtuLYne
 vEiX7bZrmGb0TN7RGrewYK4LpwNi4951aJl5wAvk4S83DHmJLyGvY19nAmLkZwcgTsw4
 yIKrpyAqbRpHV73v1rfFTt/MHYzC27EqlgQ1X1GDluoHOk7JlPyUbN4EywzpvOd5h0tg
 bzfyxTCt5gIiyIpVvaTE50/wD3JiprHhaj15/VDt5cppBCAGHkMYmFWQU3E/CAldcvk5
 4C7SGZRnD/ehAtQYr+5hAbAop4+u6+lF4eod0O9MlNJ8w9JwSugyIuqRoVisH0KlJBQw
 qdjQ==
X-Gm-Message-State: ANoB5pmTbHMUx/vbJjUmlv+E1u6nLRqVKOwBGY4KnEtRQSQ9KbhWnkL+
 3zp2a37OY+Hzo+r1BxyFQe1kZvJolHxOdMgxKfYig/N2/dd2NBBIjvOXF9NUoxFSoOL2xKcbACG
 0U4pDgy/1aI6VjjsnDcvG1AEjuEFsvaQ=
X-Received: by 2002:a05:651c:14f:b0:277:31b0:8ba3 with SMTP id
 c15-20020a05651c014f00b0027731b08ba3mr8900049ljd.290.1668621658411; 
 Wed, 16 Nov 2022 10:00:58 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5WN6NCXut3O4fciXTCyQ7ahXWndiy3AtCGRBKLSd7kiy8CVm2lwLc9C568MktJ9tN2Z7Ll4IolU4F0nxZOdHM=
X-Received: by 2002:a05:651c:14f:b0:277:31b0:8ba3 with SMTP id
 c15-20020a05651c014f00b0027731b08ba3mr8900031ljd.290.1668621658168; Wed, 16
 Nov 2022 10:00:58 -0800 (PST)
MIME-Version: 1.0
References: <20221115212759.3095751-1-jsnow@redhat.com>
 <CAARzgwxaVyQf424PeUOO=efyPHdiMK9nF7g+pHuKufqU1cg1-g@mail.gmail.com>
In-Reply-To: <CAARzgwxaVyQf424PeUOO=efyPHdiMK9nF7g+pHuKufqU1cg1-g@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 16 Nov 2022 13:00:45 -0500
Message-ID: <CAFn=p-bkTkpJxT6RyT2JGEF6Kn0FMFy+PU9Ux3eykehzJ+8u9w@mail.gmail.com>
Subject: Re: [PATCH] tests/avocado: configure acpi-bits to use avocado timeout
To: Ani Sinha <ani@anisinha.ca>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000332f8905ed9a412b"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

--000000000000332f8905ed9a412b
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 15, 2022, 10:24 PM Ani Sinha <ani@anisinha.ca> wrote:

> On Wed, Nov 16, 2022 at 2:58 AM John Snow <jsnow@redhat.com> wrote:
> >
> > Instead of using a hardcoded timeout, just rely on Avocado's built-in
> > test case timeout. This helps avoid timeout issues on machines where 60
> > seconds is not sufficient.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
>
> Reviewed-by: Ani Sinha <ani@anisinha.ca>
>

Alex's critique is valid, though: the way vm.wait() works is to
immediately  terminate the serial console connection as it prepares for the
VM to shut down. I forgot about this.

(For historical reasons, it does this to avoid deadlocks when the pipe
fills.)

I think we definitely do want to make sure we watch the console *while* we
wait for it to shut down, which is not a feature QEMUMachine really offers
right now in a meaningful way.

I need to make some more drastic changes to machine.py, but in the meantime
I can revise this patch to do something a bit smarter so we get console
logging while we wait. This is a use case worth supporting.

(Thanks for writing new and interesting tests!)


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
> > -        max_sleep_time = time.monotonic() + 60
> > -        while self._vm.is_running() and time.monotonic() <
> max_sleep_time:
> > -            time.sleep(1)
> > -
> > -        self.assertFalse(time.monotonic() > max_sleep_time,
> > -                         'The VM seems to have failed to shutdown in
> time')
> > -
> > +        # Rely on avocado's unit test timeout.
> > +        self._vm.wait(timeout=None)
>
> I think this is fine. This just waits until the VM is shutdown on its
> own and relies on the avocado framework to timeout if it doesn't. We
> do not need to look into the console. The test issues a shutdown from
> the VM itself once its done with the batch operations.


Still, if it fails, we want to see the output, right? It's very frustrating
if it doesn't, especially in an automated pipeline.


> >          self.parse_log()
> > --
> > 2.37.3
> >
>
>

--000000000000332f8905ed9a412b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Nov 15, 2022, 10:24 PM Ani Sinha &lt;<a href=
=3D"mailto:ani@anisinha.ca">ani@anisinha.ca</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">On Wed, Nov 16, 2022 at 2:58 AM John Snow &lt;<a hr=
ef=3D"mailto:jsnow@redhat.com" target=3D"_blank" rel=3D"noreferrer">jsnow@r=
edhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Instead of using a hardcoded timeout, just rely on Avocado&#39;s built=
-in<br>
&gt; test case timeout. This helps avoid timeout issues on machines where 6=
0<br>
&gt; seconds is not sufficient.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
<br>
Reviewed-by: Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" target=3D"_bl=
ank" rel=3D"noreferrer">ani@anisinha.ca</a>&gt;<br></blockquote></div></div=
><div dir=3D"auto"><br></div><div dir=3D"auto">Alex&#39;s critique is valid=
, though: the way vm.wait() works is to immediately=C2=A0 terminate the ser=
ial console connection as it prepares for the VM to shut down. I forgot abo=
ut this.</div><div dir=3D"auto"><br></div><div dir=3D"auto">(For historical=
 reasons, it does this to avoid deadlocks when the pipe fills.)</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">I think we definitely do want to ma=
ke sure we watch the console *while* we wait for it to shut down, which is =
not a feature QEMUMachine really offers right now in a meaningful way.</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">I need to make some more dra=
stic changes to machine.py, but in the meantime I can revise this patch to =
do something a bit smarter so we get console logging while we wait. This is=
 a use case worth supporting.</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">(Thanks for writing new and interesting tests!)</div><div dir=3D"auto=
"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Rely on avocado&#39;s unit test timeout=
.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._vm.wait(timeout=3DNone)<br>
<br>
I think this is fine. This just waits until the VM is shutdown on its<br>
own and relies on the avocado framework to timeout if it doesn&#39;t. We<br=
>
do not need to look into the console. The test issues a shutdown from<br>
the VM itself once its done with the batch operations.</blockquote></div></=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Still, if it fails, we wa=
nt to see the output, right? It&#39;s very frustrating if it doesn&#39;t, e=
specially in an automated pipeline.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto"></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.parse_log()<br>
&gt; --<br>
&gt; 2.37.3<br>
&gt;<br>
<br>
</blockquote></div></div></div>

--000000000000332f8905ed9a412b--


