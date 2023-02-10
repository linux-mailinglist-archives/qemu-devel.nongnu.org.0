Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4F6692231
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 16:29:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQVKq-0005Hs-6L; Fri, 10 Feb 2023 10:29:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQVKj-0005BQ-Rw
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 10:29:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQVKi-0003sS-3L
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 10:29:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676042943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YcfZmXMcn3Msu+ff7Df/B8vYEFWb7e9o34bFXxnerk4=;
 b=bRkoJ4wWiMGX1THjeDMHLIykiZ9gTmLcjAZhPy+k92CNyJqD5t3F3jfEi5bdRW2MhZNZiI
 eo3NPCBVOOMdku1kCGBMit2ZNCUOR1hcCx1HtHHXH1rRBmsSO35rYcNICWto+cYW6aH4Ip
 GBOCMuNhzbJDR+ncC8KB7zs8ZD6BgVI=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-601-4pFbuLaAMbeTJ1zAxEUVRg-1; Fri, 10 Feb 2023 10:28:54 -0500
X-MC-Unique: 4pFbuLaAMbeTJ1zAxEUVRg-1
Received: by mail-pg1-f200.google.com with SMTP id
 f19-20020a631013000000b004e8c27fa528so2696994pgl.17
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 07:28:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YcfZmXMcn3Msu+ff7Df/B8vYEFWb7e9o34bFXxnerk4=;
 b=eIAM2vB+1DytU5FXWXYmg4tbljZzt2OIQLM3ZY9Py0gKxOYhbxHGYpM+n6SfmFZxE0
 RenyRDPg6WXZXhSrcuLt7mtBpLB94hJrPZkJzoLxKx1KriFbpeS2C6glNutAchBY+qks
 rIAV3l1ko8Pp9q94AclBHDmOxyK2VbFG3ju/fEWmS7BmriE8pwCpTOLG0EesalxNhRIg
 EEQuk8HMq9gjA1BlgZNQ9B5Kn95nfZggrsxT6PJzYYl+HYyQ7FSTvKbl0BmQzNYACO5D
 ro6QuD81Z13VJsxH6Gf5qlJOavtdZ235aqVxWsSByBifgflhSp7nm3O20O/CTVQUECSa
 3Eyw==
X-Gm-Message-State: AO0yUKWvuJA36JcqJxzQekxVlYl8cdCuU+YAnc8Ki88PbyN0KkfxFhG1
 7OTwYlIkw8rSkSLX5meOiJUzgXxiMsjSiH4Vq5dgprIwY4jO1ZksJP70z0Lbg/eizch6rSWUnkg
 dmVuwNPfXfhTJjh4LaRhw0dsFbl6jU+M=
X-Received: by 2002:a17:902:9890:b0:199:3483:e920 with SMTP id
 s16-20020a170902989000b001993483e920mr3532984plp.33.1676042933419; 
 Fri, 10 Feb 2023 07:28:53 -0800 (PST)
X-Google-Smtp-Source: AK7set+K4O8TuIAw5yqmpgwdny+Vv/cTDqO+cgJB+7bKwS2MVZ1FFIZyGsd1a+CAaokAxh3tbhWKhWhnij8yL6WpTjc=
X-Received: by 2002:a17:902:9890:b0:199:3483:e920 with SMTP id
 s16-20020a170902989000b001993483e920mr3532969plp.33.1676042933133; Fri, 10
 Feb 2023 07:28:53 -0800 (PST)
MIME-Version: 1.0
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-4-jsnow@redhat.com>
 <3bb14d43-4dbe-62f3-679f-4b7823b29d41@redhat.com>
In-Reply-To: <3bb14d43-4dbe-62f3-679f-4b7823b29d41@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 10 Feb 2023 10:28:42 -0500
Message-ID: <CAFn=p-Yyus2zipaUgLwonpMRdfZp-CKEisiXgZBLjgG6UxXagw@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] configure: Look for auxiliary Python installations
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Qemu-block <qemu-block@nongnu.org>, 
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000a87c7605f45a27bb"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--000000000000a87c7605f45a27bb
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 10, 2023, 5:46 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 2/10/23 01:31, John Snow wrote:
> > At the moment, we look for just "python3" and "python", which is good
> > enough almost all of the time. But ... if you are on a platform that
> > uses an older Python by default and only offers a newer Python as an
> > option, you'll have to specify --python=/usr/bin/foo every time.
> >
> > We can be kind and instead make a cursory attempt to locate a suitable
> > Python binary ourselves, looking for the remaining well-known binaries.
> >
> > This configure loop will prefer, in order:
> >
> > 1. Whatever is specified in $PYTHON
> > 2. python3
> > 3. python
> > 4. python3.11 down through python3.6
> >
> > Notes:
> >
> > - Python virtual environment provides binaries for "python3", "python",
> >    and whichever version you used to create the venv,
> >    e.g. "python3.8". If configure is invoked from inside of a venv, this
> >    configure loop will not "break out" of that venv unless that venv is
> >    created using an explicitly non-suitable version of Python that we
> >    cannot use.
> >
> > - In the event that no suitable python is found, the first python found
> >    is the version used to generate the human-readable error message.
> >
> > - The error message isn't printed right away to allow later
> >    configuration code to pick up an explicitly configured python.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   configure | 33 +++++++++++++++++++++++++--------
> >   1 file changed, 25 insertions(+), 8 deletions(-)
> >
> > diff --git a/configure b/configure
> > index 64960c6000f..ea8c973d13b 100755
> > --- a/configure
> > +++ b/configure
> > @@ -592,20 +592,39 @@ esac
> >
> >   : ${make=${MAKE-make}}
> >
> > -# We prefer python 3.x. A bare 'python' is traditionally
> > -# python 2.x, but some distros have it as python 3.x, so
> > -# we check that too
> > +
> > +check_py_version() {
> > +    # We require python >= 3.6.
> > +    # NB: a True python conditional creates a non-zero return code
> (Failure)
> > +    "$1" -c 'import sys; sys.exit(sys.version_info < (3,6))'
> > +}
> > +
> >   python=
> > +first_python=
> >   explicit_python=no
> > -for binary in "${PYTHON-python3}" python
> > +# A bare 'python' is traditionally python 2.x, but some distros
> > +# have it as python 3.x, so check in both places.
> > +for binary in "${PYTHON-python3}" python python3.{11..6}
>
> This is not available in e.g. dash, so we need to use {11,10,9,8,7,6}.
> Just a nit, I can fix it myself.
>

What platforms use dash by default?

Did I not see a failure because nothing that uses dash iterated that far
down in the list?

Anyway, you've got my blessing to change it, of course.


> Paolo
>

PS, while you're here, how does this new loop interfere with your "custom
python specified" flag for meson? I think meson uses the version of python
*it* detects and not the configure script identified one, right? Does that
mean that e.g. the qapi generator gets run with the system default/meson
version and not the config version?

Do I need to adjust this loop to consider more binaries as "explicitly
specified"?

(PPS: English needs "paraphrasing quotes" as punctuation. Maybe like double
quotes except they're wiggly.)

--js

>

--000000000000a87c7605f45a27bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Feb 10, 2023, 5:46 AM Paolo Bonzini &lt;<a hre=
f=3D"mailto:pbonzini@redhat.com" target=3D"_blank" rel=3D"noreferrer">pbonz=
ini@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 2/=
10/23 01:31, John Snow wrote:<br>
&gt; At the moment, we look for just &quot;python3&quot; and &quot;python&q=
uot;, which is good<br>
&gt; enough almost all of the time. But ... if you are on a platform that<b=
r>
&gt; uses an older Python by default and only offers a newer Python as an<b=
r>
&gt; option, you&#39;ll have to specify --python=3D/usr/bin/foo every time.=
<br>
&gt; <br>
&gt; We can be kind and instead make a cursory attempt to locate a suitable=
<br>
&gt; Python binary ourselves, looking for the remaining well-known binaries=
.<br>
&gt; <br>
&gt; This configure loop will prefer, in order:<br>
&gt; <br>
&gt; 1. Whatever is specified in $PYTHON<br>
&gt; 2. python3<br>
&gt; 3. python<br>
&gt; 4. python3.11 down through python3.6<br>
&gt; <br>
&gt; Notes:<br>
&gt; <br>
&gt; - Python virtual environment provides binaries for &quot;python3&quot;=
, &quot;python&quot;,<br>
&gt;=C2=A0 =C2=A0 and whichever version you used to create the venv,<br>
&gt;=C2=A0 =C2=A0 e.g. &quot;python3.8&quot;. If configure is invoked from =
inside of a venv, this<br>
&gt;=C2=A0 =C2=A0 configure loop will not &quot;break out&quot; of that ven=
v unless that venv is<br>
&gt;=C2=A0 =C2=A0 created using an explicitly non-suitable version of Pytho=
n that we<br>
&gt;=C2=A0 =C2=A0 cannot use.<br>
&gt; <br>
&gt; - In the event that no suitable python is found, the first python foun=
d<br>
&gt;=C2=A0 =C2=A0 is the version used to generate the human-readable error =
message.<br>
&gt; <br>
&gt; - The error message isn&#39;t printed right away to allow later<br>
&gt;=C2=A0 =C2=A0 configuration code to pick up an explicitly configured py=
thon.<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" rel=
=3D"noreferrer noreferrer" target=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0configure | 33 +++++++++++++++++++++++++--------<br>
&gt;=C2=A0 =C2=A01 file changed, 25 insertions(+), 8 deletions(-)<br>
&gt; <br>
&gt; diff --git a/configure b/configure<br>
&gt; index 64960c6000f..ea8c973d13b 100755<br>
&gt; --- a/configure<br>
&gt; +++ b/configure<br>
&gt; @@ -592,20 +592,39 @@ esac<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0: ${make=3D${MAKE-make}}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -# We prefer python 3.x. A bare &#39;python&#39; is traditionally<br>
&gt; -# python 2.x, but some distros have it as python 3.x, so<br>
&gt; -# we check that too<br>
&gt; +<br>
&gt; +check_py_version() {<br>
&gt; +=C2=A0 =C2=A0 # We require python &gt;=3D 3.6.<br>
&gt; +=C2=A0 =C2=A0 # NB: a True python conditional creates a non-zero retu=
rn code (Failure)<br>
&gt; +=C2=A0 =C2=A0 &quot;$1&quot; -c &#39;import sys; sys.exit(sys.version=
_info &lt; (3,6))&#39;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0python=3D<br>
&gt; +first_python=3D<br>
&gt;=C2=A0 =C2=A0explicit_python=3Dno<br>
&gt; -for binary in &quot;${PYTHON-python3}&quot; python<br>
&gt; +# A bare &#39;python&#39; is traditionally python 2.x, but some distr=
os<br>
&gt; +# have it as python 3.x, so check in both places.<br>
&gt; +for binary in &quot;${PYTHON-python3}&quot; python python3.{11..6}<br=
>
<br>
This is not available in e.g. dash, so we need to use {11,10,9,8,7,6}.<br>
Just a nit, I can fix it myself.<br></blockquote></div></div><div dir=3D"au=
to"><br></div><div dir=3D"auto">What platforms use dash by default?</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Did I not see a failure because=
 nothing that uses dash iterated that far down in the list?</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Anyway, you&#39;ve got my blessing to=
 change it, of course.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Paolo<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">PS, while you&#39;re here, how does this new loop interfere with your =
&quot;custom python specified&quot; flag for meson? I think meson uses the =
version of python *it* detects and not the configure script identified one,=
 right? Does that mean that e.g. the qapi generator gets run with the syste=
m default/meson version and not the config version?</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Do I need to adjust this loop to consider more =
binaries as &quot;explicitly specified&quot;?</div><div dir=3D"auto"><br></=
div><div dir=3D"auto">(PPS: English needs &quot;paraphrasing quotes&quot; a=
s punctuation. Maybe like double quotes except they&#39;re wiggly.)</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">--js</div><div dir=3D"auto"><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000a87c7605f45a27bb--


