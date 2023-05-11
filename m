Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 590536FF67D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 17:53:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px8bd-0005fF-Pb; Thu, 11 May 2023 11:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1px8bb-0005er-3x
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:53:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1px8bZ-0004lP-9K
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:53:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683820400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FnjzAjrd5HkJ402FDaP9KjXSX3hhMiKxf8QMyQhpYn0=;
 b=CUXT4/y+sNKczQM1r3vhALbYYdqDoxY0L0p9xcfs79iehOf86SCj3AGg/m2BkCoEw8/60i
 VGtwyvjLVlCYEn64XI0qz3dsFqd3mfKnEC+1tEgBMPXcH92DG6MXaAx1oaR5/fM+4xeaMd
 GdZuEGTaVqp5BT7EF1jtGenBd/XheB0=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-hcegDCfPMB6VoqOlwmPEFA-1; Thu, 11 May 2023 11:53:18 -0400
X-MC-Unique: hcegDCfPMB6VoqOlwmPEFA-1
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-6439bc1e3aaso5203810b3a.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 08:53:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683820398; x=1686412398;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FnjzAjrd5HkJ402FDaP9KjXSX3hhMiKxf8QMyQhpYn0=;
 b=X4SNWUj7V6d0WQhS/SHuXmOBpBcqQP1cmBf2jABrp7K6WlLYSRhIG8LHf+3tIKEJ1m
 A3jsbX4eOtSa2bdOfcJrl1WhiSXT/ZjlYPBGA2FjUp611ACOIiu+gvNxOCSaPLMDLQP+
 kjt3QIkZzNYzhrcdo6VDiY2iyLwB6/YyAGXXDZ5fyBrNgpmo9NB20cPtyYEyBX9clCA/
 jmTbLgpamWtdA42un5nA8WdF1RWFdyPakzS0BarNbt5/rkzFCYgbtOXpmW4dQMmJCqDk
 5Mw/yg6rB7ZUzn1qow4IvNYDTXXBNaFgMSr2WHJ4yVDzFbIzAagofEUXzAo9RYKidjyV
 NhZw==
X-Gm-Message-State: AC+VfDzl4/p3WEBI/9XzXgKNVzSg4N71eC7mdbjx686PVKqdra9H4hWt
 cIoZnRJw4ZaZ2vJV0J0oQORRxtcMDfl1lZfoF6szk/DzMXxXAJTlGqpjm+jciEah7S03d3UupKW
 mqwKFBO2897wQW/IX4NciXmoAKYmYhUU=
X-Received: by 2002:a05:6a20:2452:b0:103:558c:516 with SMTP id
 t18-20020a056a20245200b00103558c0516mr7213886pzc.55.1683820397824; 
 Thu, 11 May 2023 08:53:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4sfKrCssOV4yuN3P04FH06Gdzl/x2YDpNS+0D6z1uOCt6m3QSvxiMt8x4QYLBjooK+tkDjWt23MJYVemCLsDE=
X-Received: by 2002:a05:6a20:2452:b0:103:558c:516 with SMTP id
 t18-20020a056a20245200b00103558c0516mr7213863pzc.55.1683820397537; Thu, 11
 May 2023 08:53:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230511035435.734312-1-jsnow@redhat.com>
 <20230511035435.734312-8-jsnow@redhat.com>
 <e9f60dff-0cc5-82c9-cb68-8c43b7de80a4@redhat.com>
In-Reply-To: <e9f60dff-0cc5-82c9-cb68-8c43b7de80a4@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 11 May 2023 11:53:06 -0400
Message-ID: <CAFn=p-YyBkDsmshShv3jJiL_wSMR6SVy5Z8axgsE4gWkh-r_ZQ@mail.gmail.com>
Subject: Re: [PATCH 07/27] mkvenv: add diagnose() method for ensure() failures
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Warner Losh <imp@bsdimp.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Ani Sinha <anisinha@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Kyle Evans <kevans@freebsd.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Michael Roth <michael.roth@amd.com>, Reinoud Zandijk <reinoud@netbsd.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000a940f105fb6cfc8c"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000a940f105fb6cfc8c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 11, 2023, 2:53 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 5/11/23 05:54, John Snow wrote:
> > This is a routine that is designed to print some usable info for human
> > beings back out to the terminal if/when "mkvenv ensure" fails to locate
> > or install a package during configure time, such as meson or sphinx.
> >
> > Since we are requiring that "meson" and "sphinx" are installed to the
> > same Python environment as QEMU is configured to build with, this can
> > produce some surprising failures when things are mismatched. This metho=
d
> > is here to try and ease that sting by offering some actionable
> > diagnosis.
>
> I think this is a bit too verbose/scary, especially the "Ouch" for
> what was a totally normal occurrence before (no "--enable-docs" and sphin=
x
> absent or too old) and the "ERROR" from "pip install --no-index".
>
> Here is an attempt to tone it down:
>
> diff --git a/python/scripts/mkvenv.py b/python/scripts/mkvenv.py
> index 8e097e4759e3..5d30174a9aff 100644
> --- a/python/scripts/mkvenv.py
> +++ b/python/scripts/mkvenv.py
> @@ -74,6 +74,7 @@
>       Iterator,
>       Optional,
>       Sequence,
> +    Tuple,
>       Union,
>   )
>   import venv
> @@ -594,7 +595,7 @@ def diagnose(
>       online: bool,
>       wheels_dir: Optional[Union[str, Path]],
>       prog: Optional[str],
> -) -> str:
> +) -> Tuple[str, bool]:
>       """
>       Offer a summary to the user as to why a package failed to be
> installed.
>
> @@ -610,6 +611,9 @@ def diagnose(
>       """
>       # pylint: disable=3Dtoo-many-branches
>
> +    # Some errors are not particularly serious
> +    bad =3D False
> +
>       pkg_name =3D pkgname_from_depspec(dep_spec)
>       pkg_version =3D None
>
> @@ -654,11 +658,11 @@ def diagnose(
>               "No suitable version found in, or failed to install from"
>               f" '{wheels_dir}'."
>           )
> -    else:
> -        lines.append("No local package directory was searched.")
> +        bad =3D True
>
>       if online:
>           lines.append("A suitable version could not be obtained from
> PyPI.")
> +        bad =3D True
>       else:
>           lines.append(
>               "mkvenv was configured to operate offline and did not check
> PyPI."
> @@ -675,10 +679,14 @@ def diagnose(
>                   f"Typically this means that '{prog}' has been installed=
 "
>                   "against a different Python interpreter on your system.=
"
>               )
> +            bad =3D True
>
>       lines =3D [f" =E2=80=A2 {line}" for line in lines]
> -    lines.insert(0, f"Could not ensure availability of '{dep_spec}':")
> -    return os.linesep.join(lines)
> +    if bad:
> +        lines.insert(0, f"Could not ensure availability of '{dep_spec}':=
")
> +    else:
> +        lines.insert(0, f"'{dep_spec}' not found:")
> +    return os.linesep.join(lines), bad
>
>
>   def pip_install(
> @@ -731,7 +739,7 @@ def _do_ensure(
>               dep_specs,
>               online=3DFalse,
>               wheels_dir=3Dwheels_dir,
> -            devnull=3Donline and not wheels_dir,
> +            devnull=3Dnot wheels_dir,
>           )
>           # (A) or (B) happened. Success.
>       except subprocess.CalledProcessError:
> @@ -778,7 +786,10 @@ def ensure(
>           _do_ensure(dep_specs, online, wheels_dir)
>       except subprocess.CalledProcessError as exc:
>           # Well, that's not good.
> -        raise Ouch(diagnose(dep_specs[0], online, wheels_dir, prog)) fro=
m
> exc
> +        msg, bad =3D diagnose(dep_specs[0], online, wheels_dir, prog)
> +        if bad:
> +            raise Ouch(msg) from exc
> +        print("", msg, "\n", sep=3D"\n", file=3Dsys.stderr)
>
>
>   def post_venv_setup() -> None:
>
>
> Paolo
>

You're right, in the "optional" case for sphinx the error isn't really
*that* bad or serious. I'll try to work this or something very similar to
it in.

I was thinking it could be up to the caller to discard the input, but I
suppose we can also route the semantics down into the tool, too.

I'll play with it.

--js

>

--000000000000a940f105fb6cfc8c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, May 11, 2023, 2:53 AM Paolo Bonzini &lt;<a hre=
f=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On 5/11/23 05:54, John Snow wrote:<br>
&gt; This is a routine that is designed to print some usable info for human=
<br>
&gt; beings back out to the terminal if/when &quot;mkvenv ensure&quot; fail=
s to locate<br>
&gt; or install a package during configure time, such as meson or sphinx.<b=
r>
&gt; <br>
&gt; Since we are requiring that &quot;meson&quot; and &quot;sphinx&quot; a=
re installed to the<br>
&gt; same Python environment as QEMU is configured to build with, this can<=
br>
&gt; produce some surprising failures when things are mismatched. This meth=
od<br>
&gt; is here to try and ease that sting by offering some actionable<br>
&gt; diagnosis.<br>
<br>
I think this is a bit too verbose/scary, especially the &quot;Ouch&quot; fo=
r<br>
what was a totally normal occurrence before (no &quot;--enable-docs&quot; a=
nd sphinx<br>
absent or too old) and the &quot;ERROR&quot; from &quot;pip install --no-in=
dex&quot;.<br>
<br>
Here is an attempt to tone it down:<br>
<br>
diff --git a/python/scripts/mkvenv.py b/python/scripts/mkvenv.py<br>
index 8e097e4759e3..5d30174a9aff 100644<br>
--- a/python/scripts/mkvenv.py<br>
+++ b/python/scripts/mkvenv.py<br>
@@ -74,6 +74,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 Iterator,<br>
=C2=A0 =C2=A0 =C2=A0 Optional,<br>
=C2=A0 =C2=A0 =C2=A0 Sequence,<br>
+=C2=A0 =C2=A0 Tuple,<br>
=C2=A0 =C2=A0 =C2=A0 Union,<br>
=C2=A0 )<br>
=C2=A0 import venv<br>
@@ -594,7 +595,7 @@ def diagnose(<br>
=C2=A0 =C2=A0 =C2=A0 online: bool,<br>
=C2=A0 =C2=A0 =C2=A0 wheels_dir: Optional[Union[str, Path]],<br>
=C2=A0 =C2=A0 =C2=A0 prog: Optional[str],<br>
-) -&gt; str:<br>
+) -&gt; Tuple[str, bool]:<br>
=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 Offer a summary to the user as to why a package failed=
 to be installed.<br>
<br>
@@ -610,6 +611,9 @@ def diagnose(<br>
=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 # pylint: disable=3Dtoo-many-branches<br>
<br>
+=C2=A0 =C2=A0 # Some errors are not particularly serious<br>
+=C2=A0 =C2=A0 bad =3D False<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 pkg_name =3D pkgname_from_depspec(dep_spec)<br>
=C2=A0 =C2=A0 =C2=A0 pkg_version =3D None<br>
<br>
@@ -654,11 +658,11 @@ def diagnose(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;No suitable version =
found in, or failed to install from&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f&quot; &#39;{wheels_dir}&=
#39;.&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
-=C2=A0 =C2=A0 else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 lines.append(&quot;No local package directory =
was searched.&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bad =3D True<br>
<br>
=C2=A0 =C2=A0 =C2=A0 if online:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lines.append(&quot;A suitable version co=
uld not be obtained from PyPI.&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bad =3D True<br>
=C2=A0 =C2=A0 =C2=A0 else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lines.append(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;mkvenv was configure=
d to operate offline and did not check PyPI.&quot;<br>
@@ -675,10 +679,14 @@ def diagnose(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f&quot;Typic=
ally this means that &#39;{prog}&#39; has been installed &quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;agains=
t a different Python interpreter on your system.&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bad =3D True<br>
<br>
=C2=A0 =C2=A0 =C2=A0 lines =3D [f&quot; =E2=80=A2 {line}&quot; for line in =
lines]<br>
-=C2=A0 =C2=A0 lines.insert(0, f&quot;Could not ensure availability of &#39=
;{dep_spec}&#39;:&quot;)<br>
-=C2=A0 =C2=A0 return os.linesep.join(lines)<br>
+=C2=A0 =C2=A0 if bad:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 lines.insert(0, f&quot;Could not ensure availa=
bility of &#39;{dep_spec}&#39;:&quot;)<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 lines.insert(0, f&quot;&#39;{dep_spec}&#39; no=
t found:&quot;)<br>
+=C2=A0 =C2=A0 return os.linesep.join(lines), bad<br>
<br>
<br>
=C2=A0 def pip_install(<br>
@@ -731,7 +739,7 @@ def _do_ensure(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dep_specs,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 online=3DFalse,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wheels_dir=3Dwheels_dir,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 devnull=3Donline and not wheels_=
dir,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 devnull=3Dnot wheels_dir,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # (A) or (B) happened. Success.<br>
=C2=A0 =C2=A0 =C2=A0 except subprocess.CalledProcessError:<br>
@@ -778,7 +786,10 @@ def ensure(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _do_ensure(dep_specs, online, wheels_dir=
)<br>
=C2=A0 =C2=A0 =C2=A0 except subprocess.CalledProcessError as exc:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Well, that&#39;s not good.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise Ouch(diagnose(dep_specs[0], online, whee=
ls_dir, prog)) from exc<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg, bad =3D diagnose(dep_specs[0], online, wh=
eels_dir, prog)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if bad:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise Ouch(msg) from exc<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;&quot;, msg, &quot;\n&quot;, sep=
=3D&quot;\n&quot;, file=3Dsys.stderr)<br>
<br>
<br>
=C2=A0 def post_venv_setup() -&gt; None:<br>
<br>
<br>
Paolo<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">You&#39;re right, in the &quot;optional&quot; case for sphinx the erro=
r isn&#39;t really *that* bad or serious. I&#39;ll try to work this or some=
thing very similar to it in.</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">I was thinking it could be up to the caller to discard the input, but =
I suppose we can also route the semantics down into the tool, too.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">I&#39;ll play with it.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">--js</div><div dir=3D"auto"><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000a940f105fb6cfc8c--


