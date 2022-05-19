Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E01E52E073
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 01:19:31 +0200 (CEST)
Received: from localhost ([::1]:40992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrpQY-0003Nj-0r
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 19:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nrpPU-0002Rv-EV
 for qemu-devel@nongnu.org; Thu, 19 May 2022 19:18:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nrpPR-0006ES-0h
 for qemu-devel@nongnu.org; Thu, 19 May 2022 19:18:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653002300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bxMTEvQmUmsLQf4mRLb8KbfhCAE39bQ22z9GQylg4E4=;
 b=SbOaK1y0DcJczV0TisySVsxd6GK7r8BaP3p/wsyUFcQ/HWRT8xTECxBCBwzHXTlH3Jr1oJ
 vG0k8qplz1iuxMQQfuzL9K/GbjdG4kth5wDKH+BjUGu9UyQyTYG1VCDaXcG4LM1YPmhsW4
 OEGaqGeEn9vab9L+laz6Q/QmtbFZizs=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-fibRXu_oPJesA00Nxq66Wg-1; Thu, 19 May 2022 19:18:17 -0400
X-MC-Unique: fibRXu_oPJesA00Nxq66Wg-1
Received: by mail-vs1-f72.google.com with SMTP id
 g20-20020a67e214000000b0032cdb80e1ffso1008856vsa.17
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 16:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bxMTEvQmUmsLQf4mRLb8KbfhCAE39bQ22z9GQylg4E4=;
 b=I4byDGxLBIhuPzIeL6/Si5gktb85tf6BCrKlCOlrbq/nDvxPUm2Dja3GWrN9YLQC30
 iJgU/lGVFyQJAad5p7eNCHRo5sCKI2xt8olo9fToOkGAZ6QvQtE1Dk7+QSBqsbEsRLia
 LwUJKNgUrQJZQ98HVe/xp8BZvHZ0JZYWgyfVGMGZFNw3WErcZmW0U82QxNlPtxf3y6vP
 SvhH3pnfa1ZYisIgdlmVRkPBFWc/NXmLClEifhFM1gRkjAtgP8CTeI9PhJ37cq1G6OsQ
 hypMXI8xdo+a1S2BxFMv+QPccehsL60OKasC4EhnjOnU1Oovn4ZKVpsjqUR6nzp2rPfM
 +4dg==
X-Gm-Message-State: AOAM530PD6wfeluCkQX+jOSpTxh5kOSflLW7qNrOODLqpNFUfyTohBL+
 W9N724knVvfevy9dc+BbON8BCHcdiy0AGzuPQxCpEN4wxcgc4lyUnQQc+8CkdZMNt6MFeLclrBG
 7gslsndg+w61zb0tV/M4isijMNpIIS2k=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr3334405vsa.38.1653002296429; 
 Thu, 19 May 2022 16:18:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUBtTTFMACdU9Pb6pyF4MSra9CJi1qDff41w/iA1PDyeeu+NQ313BxdIPteJrv+DLJqywLcPndlQEBLyeVMBg=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr3334395vsa.38.1653002296240; Thu, 19 May
 2022 16:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220516165321.872394-1-danielhb413@gmail.com>
 <20220516165321.872394-3-danielhb413@gmail.com>
In-Reply-To: <20220516165321.872394-3-danielhb413@gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 19 May 2022 19:18:06 -0400
Message-ID: <CAFn=p-bn3PrUiX4ZCyBa8_BPd8Nfgo2u4fs3+M2Z42y8O2vdkQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] machine.py: add default pseries params in machine.py
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au, 
 clg@kaod.org, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ae457b05df65962e"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

--000000000000ae457b05df65962e
Content-Type: text/plain; charset="UTF-8"

On Mon, May 16, 2022, 12:53 PM Daniel Henrique Barboza <
danielhb413@gmail.com> wrote:

> pSeries guests set a handful of machine capabilities on by default, all
> of them related to security mitigations, that aren't always available in
> the host.
>
> This means that, as is today, running avocado in a Power9 server without
> the proper firmware support, and with --disable-tcg, this error will
> occur:
>
>  (1/1) tests/avocado/info_usernet.py:InfoUsernet.test_hostfwd: ERROR:
> ConnectError:
> Failed to establish session: EOFError\n  Exit code: 1\n  (...)
> (...)
>         Command: ./qemu-system-ppc64 -display none -vga none (...)
>         Output: qemu-system-ppc64: warning: netdev vnet has no peer
> qemu-system-ppc64: Requested safe cache capability level not supported by
> KVM
> Try appending -machine cap-cfpc=broken
>
> info_usernet.py happens to trigger this error first, but all tests would
> fail in this configuration because the host does not support the default
> 'cap-cfpc' capability.
>
> A similar situation was already fixed a couple of years ago by Greg Kurz
> (commit 63d57c8f91d0) but it was focused on TCG warnings for these same
> capabilities and running C qtests. This commit ended up preventing the
> problem we're facing with avocado when running qtests with KVM support.
>
> This patch does a similar approach by amending machine.py to disable
> these security capabilities in case we're running a pseries guest. The
> change is made in the _launch() callback to be sure that we're already
> commited into launching the guest. It's also worth noticing that we're
> relying on self._machine being set accordingly (i.e. via tag:machine),
> which is currently the case for all ppc64 related avocado tests.
>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  python/qemu/machine/machine.py | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/python/qemu/machine/machine.py
> b/python/qemu/machine/machine.py
> index 07ac5a710b..12e5e37bff 100644
> --- a/python/qemu/machine/machine.py
> +++ b/python/qemu/machine/machine.py
> @@ -51,6 +51,11 @@
>
>
>  LOG = logging.getLogger(__name__)
> +PSERIES_DEFAULT_CAPABILITIES = ("cap-cfpc=broken,"
> +                                "cap-sbbc=broken,"
> +                                "cap-ibs=broken,"
> +                                "cap-ccf-assist=off,"
> +                                "cap-fwnmi=off")
>
>
>  class QEMUMachineError(Exception):
> @@ -447,6 +452,14 @@ def _launch(self) -> None:
>          """
>          Launch the VM and establish a QMP connection
>          """
> +
> +        # pseries needs extra machine options to disable Spectre/Meltdown
> +        # KVM related capabilities that might not be available in the
> +        # host.
> +        if "qemu-system-ppc64" in self._binary:
> +            if self._machine is None or "pseries" in self._machine:
> +                self._args.extend(['-machine',
> PSERIES_DEFAULT_CAPABILITIES])
> +
>          self._pre_launch()
>          LOG.debug('VM launch command: %r', ' '.join(self._qemu_full_args))
>
> --
> 2.32.0
>

Hm, okay.

I have plans to try and factor the machine appliance out and into an
upstream package in the near future, so I want to avoid more hardcoding of
defaults.

Does avocado have a subclass of QEMUMachine where it might be more
appropriate to stick this bandaid? Can we make one?

(I don't think iotests runs into this problem because we always use
machine:none there, I think. VM tests might have a similar problem though,
and then it'd be reasonable to want the bandaid here in machine.py ...
well, boo. okay.)

My verdict is that it's a bandaid, but I'll accept it if the avocado folks
agree to it and I'll sort it out later when I do my rewrite.

I don't think I have access to a power9 machine to test this with either,
so I might want a tested-by from someone who does.

--js

>

--000000000000ae457b05df65962e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, May 16, 2022, 12:53 PM Daniel Henrique Barboza=
 &lt;<a href=3D"mailto:danielhb413@gmail.com" target=3D"_blank" rel=3D"nore=
ferrer">danielhb413@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">pSeries guests set a handful of machine capabilities on by defaul=
t, all<br>
of them related to security mitigations, that aren&#39;t always available i=
n<br>
the host.<br>
<br>
This means that, as is today, running avocado in a Power9 server without<br=
>
the proper firmware support, and with --disable-tcg, this error will<br>
occur:<br>
<br>
=C2=A0(1/1) tests/avocado/info_usernet.py:InfoUsernet.test_hostfwd: ERROR: =
ConnectError:<br>
Failed to establish session: EOFError\n=C2=A0 Exit code: 1\n=C2=A0 (...)<br=
>
(...)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Command: ./qemu-system-ppc64 -display none -vga=
 none (...)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Output: qemu-system-ppc64: warning: netdev vnet=
 has no peer<br>
qemu-system-ppc64: Requested safe cache capability level not supported by K=
VM<br>
Try appending -machine cap-cfpc=3Dbroken<br>
<br>
info_usernet.py happens to trigger this error first, but all tests would<br=
>
fail in this configuration because the host does not support the default<br=
>
&#39;cap-cfpc&#39; capability.<br>
<br>
A similar situation was already fixed a couple of years ago by Greg Kurz<br=
>
(commit 63d57c8f91d0) but it was focused on TCG warnings for these same<br>
capabilities and running C qtests. This commit ended up preventing the<br>
problem we&#39;re facing with avocado when running qtests with KVM support.=
<br>
<br>
This patch does a similar approach by amending machine.py to disable<br>
these security capabilities in case we&#39;re running a pseries guest. The<=
br>
change is made in the _launch() callback to be sure that we&#39;re already<=
br>
commited into launching the guest. It&#39;s also worth noticing that we&#39=
;re<br>
relying on self._machine being set accordingly (i.e. via tag:machine),<br>
which is currently the case for all ppc64 related avocado tests.<br>
<br>
Signed-off-by: Daniel Henrique Barboza &lt;<a href=3D"mailto:danielhb413@gm=
ail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">danielhb413@gmail.=
com</a>&gt;<br>
---<br>
=C2=A0python/qemu/machine/machine.py | 13 +++++++++++++<br>
=C2=A01 file changed, 13 insertions(+)<br>
<br>
diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.p=
y<br>
index 07ac5a710b..12e5e37bff 100644<br>
--- a/python/qemu/machine/machine.py<br>
+++ b/python/qemu/machine/machine.py<br>
@@ -51,6 +51,11 @@<br>
<br>
<br>
=C2=A0LOG =3D logging.getLogger(__name__)<br>
+PSERIES_DEFAULT_CAPABILITIES =3D (&quot;cap-cfpc=3Dbroken,&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;cap-sbbc=3Dbroken,&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;cap-ibs=3Dbroken,&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;cap-ccf-assist=3Doff,&quot;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;cap-fwnmi=3Doff&quot;)<br>
<br>
<br>
=C2=A0class QEMUMachineError(Exception):<br>
@@ -447,6 +452,14 @@ def _launch(self) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Launch the VM and establish a QMP connect=
ion<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # pseries needs extra machine options to disab=
le Spectre/Meltdown<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # KVM related capabilities that might not be a=
vailable in the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # host.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;qemu-system-ppc64&quot; in self._bina=
ry:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._machine is None or &quo=
t;pseries&quot; in self._machine:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._args.extend(=
[&#39;-machine&#39;, PSERIES_DEFAULT_CAPABILITIES])<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._pre_launch()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LOG.debug(&#39;VM launch command: %r&#39;=
, &#39; &#39;.join(self._qemu_full_args))<br>
<br>
-- <br>
2.32.0<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Hm, okay.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">I =
have plans to try and factor the machine appliance out and into an upstream=
 package in the near future, so I want to avoid more hardcoding of defaults=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Does avocado have a su=
bclass of QEMUMachine where it might be more appropriate to stick this band=
aid? Can we make one?</div><div dir=3D"auto"><br></div><div dir=3D"auto">(I=
 don&#39;t think iotests runs into this problem because we always use machi=
ne:none there, I think. VM tests might have a similar problem though, and t=
hen it&#39;d be reasonable to want the bandaid here in machine.py ... well,=
 boo. okay.)</div><div dir=3D"auto"><br></div><div dir=3D"auto">My verdict =
is that it&#39;s a bandaid, but I&#39;ll accept it if the avocado folks agr=
ee to it and I&#39;ll sort it out later when I do my rewrite.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I don&#39;t think I have access to a =
power9 machine to test this with either, so I might want a tested-by from s=
omeone who does.</div><div dir=3D"auto"><br></div><div dir=3D"auto">--js</d=
iv><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
</blockquote></div></div></div>

--000000000000ae457b05df65962e--


