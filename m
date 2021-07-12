Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8343C6746
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 01:57:41 +0200 (CEST)
Received: from localhost ([::1]:51350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m35nw-0003Qh-CM
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 19:57:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m35mw-0002b4-Qp
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 19:56:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m35mu-0001Tx-9J
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 19:56:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626134194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OYCd7k09M6qVOp8M0sZaAhZZoo/aR0SDE4CMqxpwesU=;
 b=DlZcsKDgYpr4SVxIs1fCqLQZU6vHZ+KE6R292adRyXtE8nzexBINwptn/AbTRoE6kXSwOl
 8DUlFvtMITsXITxiCBoxUz2PiN0hx3g2hiToNUC5yjJws7hpgu1JZtzW/qsjk3FcCYKsar
 9kQXW71chDz4mC5uOK8XdTsXHDvoTns=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-y4Lgsf9EMNmZPgQomhlUjg-1; Mon, 12 Jul 2021 19:56:32 -0400
X-MC-Unique: y4Lgsf9EMNmZPgQomhlUjg-1
Received: by mail-oi1-f199.google.com with SMTP id
 l4-20020aca57040000b0290240a9d123c6so14216184oib.0
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 16:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OYCd7k09M6qVOp8M0sZaAhZZoo/aR0SDE4CMqxpwesU=;
 b=hpyS92B7O/MZLGQOe9NQDb/nyOS/RCt/bsS5giAJMDW2F9ulzy//n3Y57cM+qEDfc5
 WcoAQuNiYlomQpF3sSTkR8b2j4e/5qbRZ7a7sWi78SHz5uydobWTWVLGZqEweADfrCro
 b3vWKLpmOalmpwn0K8ycnl7TtxEQ92Kzj2E62r6OgZ6T32wRIVggNryi3/gFrXHiEkvc
 Q34tF3G081AIQFI86d3/9qiUTexHh3tcLSF/WxRQ/ArL8IBhTOAOjmSGORxxKaY2YpFv
 M7JyRxsyQKzju8VAyxupPuZjMfmx6rkK/l4dOdbLrLjTp589KKHJildrXmmw+xIoCYqO
 BWDw==
X-Gm-Message-State: AOAM530zjz3vETi/k3/qjgN20PZlDtsbc4wJuiLWWqdMl97Mz9mAyekJ
 +kym3h++2n9kR4estVoTeOW02Ke7IWO8xaAZ1Ltl4UiUlQ1xYCUUjM0UOqiEy8rX7VmejLItqoa
 8wB+TpaC6LovgdU0j9cO8GfyngoSIArQ=
X-Received: by 2002:a9d:20a2:: with SMTP id x31mr1107487ota.263.1626134191450; 
 Mon, 12 Jul 2021 16:56:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7y0CRxJtItgssqbYpiSWGpkKcqaAZ0psUlNdyclW/D8cer3QULzJ9rYCG1sxeEQr8vOIEZ0g5iinir/Hy2VQ=
X-Received: by 2002:a9d:20a2:: with SMTP id x31mr1107474ota.263.1626134191248; 
 Mon, 12 Jul 2021 16:56:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210625182021.803227-1-jsnow@redhat.com>
 <20210625182021.803227-8-jsnow@redhat.com>
 <9c281e4f-820b-71ac-b0e6-c804e442bd96@virtuozzo.com>
In-Reply-To: <9c281e4f-820b-71ac-b0e6-c804e442bd96@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 12 Jul 2021 19:56:20 -0400
Message-ID: <CAFn=p-ZtWKa5d2jMwDrLjvh3YZeWmXT_fysmpH_2=5xU2y5r8Q@mail.gmail.com>
Subject: Re: [PATCH 07/10] iotests/297: return error code from run_linters()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000d3aa0605c6f5de20"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d3aa0605c6f5de20
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 5:49 AM Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> wrote:

> 25.06.2021 21:20, John Snow wrote:
> > This turns run_linters() into a bit of a hybrid test; returning non-zero
> > on failed execution while also printing diffable information. This is
> > done for the benefit of the avocado simple test runner, which will soon
> > be attempting to execute this test from a different environment.
> >
> > (Note: universal_newlines is added to the pylint invocation for type
> > consistency with the mypy run -- it's not strictly necessary, but it
> > avoids some typing errors caused by our re-use of the 'p' variable.)
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   tests/qemu-iotests/297 | 10 ++++++++--
> >   1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
> > index 1e8334d1d4..7db1f9ed45 100755
> > --- a/tests/qemu-iotests/297
> > +++ b/tests/qemu-iotests/297
> > @@ -68,19 +68,22 @@ def run_linters(
> >       files: List[str],
> >       directory: str = '.',
> >       env: Optional[Mapping[str, str]] = None,
> > -) -> None:
> > +) -> int:
> > +    ret = 0
> >
> >       print('=== pylint ===')
> >       sys.stdout.flush()
> >
> >       # Todo notes are fine, but fixme's or xxx's should probably just be
> >       # fixed (in tests, at least)
> > -    subprocess.run(
> > +    p = subprocess.run(
> >           ('python3', '-m', 'pylint', '--score=n', '--notes=FIXME,XXX',
> *files),
> >           cwd=directory,
> >           env=env,
> >           check=False,
> > +        universal_newlines=True,
> >       )
> > +    ret += p.returncode
> >
> >       print('=== mypy ===')
> >       sys.stdout.flush()
> > @@ -113,9 +116,12 @@ def run_linters(
> >               universal_newlines=True
> >           )
> >
> > +        ret += p.returncode
> >           if p.returncode != 0:
> >               print(p.stdout)
> >
> > +    return ret
> > +
> >
> >   def main() -> None:
> >       for linter in ('pylint-3', 'mypy'):
> >
>
> Hmm..
>
> 1. Rather unusual for a function in python to return int error-code, more
> usual is raising exceptions..
>
>
It is strange, but I felt that if these tests were going to run in "two
contexts" that I would avoid raising Exceptions and trying to understand
how it would affect either call stack.


> 2. making a sum of return codes looks odd to me
>
>
Just a cheap way to state that a 0 return is good, and a non-zero return
code is failure.


> 3. Do we really want to run mypy if pylint failed? Maybe better not doing
> it, and just switch s/check=False/check=True/ ? This way:
>
>
I suppose we could. For the sake of CI, I like seeing more output instead
of less so that you can save yourself the trouble and fix everything before
re-submitting the CI job. What do you think?


> 3.1 the function becomes native wrapper for subprocess.run, and raise same
> exceptions
> 3.2 we don't waste CI time by running mypy when pylint failed anyway
>
>
> --
> Best regards,
> Vladimir
>
>

--000000000000d3aa0605c6f5de20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 6, 2021 at 5:49 AM Vladim=
ir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@virtuozzo.com">vsem=
entsov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">25.06.2021 21:20, John Snow wrote:<br>
&gt; This turns run_linters() into a bit of a hybrid test; returning non-ze=
ro<br>
&gt; on failed execution while also printing diffable information. This is<=
br>
&gt; done for the benefit of the avocado simple test runner, which will soo=
n<br>
&gt; be attempting to execute this test from a different environment.<br>
&gt; <br>
&gt; (Note: universal_newlines is added to the pylint invocation for type<b=
r>
&gt; consistency with the mypy run -- it&#39;s not strictly necessary, but =
it<br>
&gt; avoids some typing errors caused by our re-use of the &#39;p&#39; vari=
able.)<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/297 | 10 ++++++++--<br>
&gt;=C2=A0 =C2=A01 file changed, 8 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297<br>
&gt; index 1e8334d1d4..7db1f9ed45 100755<br>
&gt; --- a/tests/qemu-iotests/297<br>
&gt; +++ b/tests/qemu-iotests/297<br>
&gt; @@ -68,19 +68,22 @@ def run_linters(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0files: List[str],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0directory: str =3D &#39;.&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0env: Optional[Mapping[str, str]] =3D None,<b=
r>
&gt; -) -&gt; None:<br>
&gt; +) -&gt; int:<br>
&gt; +=C2=A0 =C2=A0 ret =3D 0<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0print(&#39;=3D=3D=3D pylint =3D=3D=3D&#39;)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sys.stdout.flush()<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Todo notes are fine, but fixme&#39;s or xx=
x&#39;s should probably just be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# fixed (in tests, at least)<br>
&gt; -=C2=A0 =C2=A0 subprocess.run(<br>
&gt; +=C2=A0 =C2=A0 p =3D subprocess.run(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&#39;python3&#39;, &#39;-m&#3=
9;, &#39;pylint&#39;, &#39;--score=3Dn&#39;, &#39;--notes=3DFIXME,XXX&#39;,=
 *files),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cwd=3Ddirectory,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env=3Denv,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0check=3DFalse,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 universal_newlines=3DTrue,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
&gt; +=C2=A0 =C2=A0 ret +=3D p.returncode<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0print(&#39;=3D=3D=3D mypy =3D=3D=3D&#39;)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sys.stdout.flush()<br>
&gt; @@ -113,9 +116,12 @@ def run_linters(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0universal_newlin=
es=3DTrue<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D p.returncode<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if p.returncode !=3D 0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(p.stdout)<=
br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 return ret<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0def main() -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for linter in (&#39;pylint-3&#39;, &#39;mypy=
&#39;):<br>
&gt; <br>
<br>
Hmm..<br>
<br>
1. Rather unusual for a function in python to return int error-code, more u=
sual is raising exceptions..<br>
<br></blockquote><div><br></div><div>It is strange, but I felt that if thes=
e tests were going to run in &quot;two contexts&quot; that I would avoid ra=
ising Exceptions and trying to understand how it would affect either call s=
tack.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
2. making a sum of return codes looks odd to me<br>
<br></blockquote><div><br></div><div>Just a cheap way to state that a 0 ret=
urn is good, and a non-zero return code is failure.<br></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
3. Do we really want to run mypy if pylint failed? Maybe better not doing i=
t, and just switch s/check=3DFalse/check=3DTrue/ ? This way:<br>
<br></blockquote><div><br></div><div>I suppose we could. For the sake of CI=
, I like seeing more output instead of less so that you can save yourself t=
he trouble and fix everything before re-submitting the CI job. What do you =
think?<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
3.1 the function becomes native wrapper for subprocess.run, and raise same =
exceptions<br>
3.2 we don&#39;t waste CI time by running mypy when pylint failed anyway<br=
>
<br>
<br>
-- <br>
Best regards,<br>
Vladimir<br>
<br>
</blockquote></div></div>

--000000000000d3aa0605c6f5de20--


