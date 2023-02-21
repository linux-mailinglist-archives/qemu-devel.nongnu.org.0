Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCCB69E61D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 18:38:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUWaY-0006Bk-9j; Tue, 21 Feb 2023 12:38:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pUWaW-0006BS-Ny
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 12:38:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pUWaU-0002pO-VQ
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 12:38:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677001078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l5dxfG9GJbcJDbNEwr5nQ4F3CHZNE8DPjU8/w5WKhTg=;
 b=M25Duqdqlktv+53RfSwCQa3ePy1caqOf5jOkK4weVgXdUJbjicKQKpqJl6eBGlR1jZqYie
 xzhAkFMH4NjhNLodfgWMlcEFvdml4U2VlyMQPu/uifBcrnZIv0FMHgZbX58EUcZ0UBjOxw
 NF8fZ7Vfj5SrDzhhdtezFQ/Z6e6OAC0=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-267-5dr34RJ2OwCdgiu3pHu1qQ-1; Tue, 21 Feb 2023 12:37:56 -0500
X-MC-Unique: 5dr34RJ2OwCdgiu3pHu1qQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 x10-20020a17090a6b4a00b002342e23955cso1824093pjl.7
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 09:37:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l5dxfG9GJbcJDbNEwr5nQ4F3CHZNE8DPjU8/w5WKhTg=;
 b=Sy+0jt++uifgX/krUcAbZp73AzxB3/rHR7T2iUsde4AmrmJAlSf0ka1wZOQwL157hP
 eWY7A6yH6nHHdJ4elCPVtPKg5E38uIMCvNjAbvYvxlVQRC2MQPmMYG8XNPifa5zYgCpU
 cGrTNU0MLUM9WZAPcgIn4NkYdY7RuMh7AeL/VXZXbc7mEKXj6V8hJy6AFXP4zE8W8RNA
 C1a8JBQ6RQ+bmyjlel+2uWI33d2CSgK2F4C2VG2QMRNm8fhFxVdLkwW61E7qToXCgKsx
 m7+WJoTskotqSwSEVvPon5FVwtcAOgumkKHKIdO//9AzC1TeG1dwVyLM3NoX6wtnod+p
 Ewfg==
X-Gm-Message-State: AO0yUKVKh5UVWwNvjRhk/RAuEa0laeQTruC9DQNMkPOj7dAWpGkLXE9h
 pdkAW42+aMB2JxHVN4ssjK8oBbw7LLSW7i6Amv9U+xDeGXaH9LS7R2GxcW4nhxarcnOsuR+gQ0B
 tRmvAcER7KK+chLuV0FpkcAJ1z4KY/6E=
X-Received: by 2002:a17:90b:2d90:b0:234:2592:efbe with SMTP id
 sj16-20020a17090b2d9000b002342592efbemr1149954pjb.131.1677001075203; 
 Tue, 21 Feb 2023 09:37:55 -0800 (PST)
X-Google-Smtp-Source: AK7set/rMO/P72RikZzvlgRlvbKcuG3yLk6+HUNkFowtzJeTyw3NdoZ00IIRKQILigvMky95XCFmK2amlnmsvtfAEdo=
X-Received: by 2002:a17:90b:2d90:b0:234:2592:efbe with SMTP id
 sj16-20020a17090b2d9000b002342592efbemr1149937pjb.131.1677001074907; Tue, 21
 Feb 2023 09:37:54 -0800 (PST)
MIME-Version: 1.0
References: <20230221012456.2607692-1-jsnow@redhat.com>
 <20230221012456.2607692-2-jsnow@redhat.com>
 <db3a7e62-2eac-1b9f-1c3e-69e58d614359@redhat.com>
In-Reply-To: <db3a7e62-2eac-1b9f-1c3e-69e58d614359@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 21 Feb 2023 12:37:43 -0500
Message-ID: <CAFn=p-YhFYezskW2Z6G56HXVSGg+S5pcxdmU3CTF7+EpoYvO4w@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] configure: Look for auxiliary Python installations
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>, 
 Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>, 
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Daniel Berrange <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000005bb3b105f5393d21"
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

--0000000000005bb3b105f5393d21
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 21, 2023, 6:03 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 2/21/23 02:24, John Snow wrote:
> > At the moment, we look for just "python3" and "python", which is good
> > enough almost all of the time. But ... if you are on a platform that
> > uses an older Python by default and only offers a newer Python as an
> > option, you'll have to specify --python=/usr/bin/foo every time.
> >
> > As a courtesy, we can make a cursory attempt to locate a suitable Python
> > binary ourselves, looking for the remaining well-known binaries. This
> > also has the added benefit of making configure "just work" more often
> > on various BSD distributions that do not have the concept of a
> > "platform default python".
> >
> > This configure loop will prefer, in order:
> >
> > 1. Whatever is specified in $PYTHON
> > 2. python3
> > 3. python (Which is usually 2.x, but might be 3.x on some platforms.)
> > 4. python3.11 down through python3.6
> >
> > Notes:
> >
> > - Python virtual environments provide binaries for "python3", "python",
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
> >   configure | 34 ++++++++++++++++++++++++++--------
> >   1 file changed, 26 insertions(+), 8 deletions(-)
> >
> > diff --git a/configure b/configure
> > index cf6db3d5518..6abf5a72078 100755
> > --- a/configure
> > +++ b/configure
> > @@ -592,20 +592,40 @@ esac
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
> > +# Check for $PYTHON, python3, python, then explicitly-versioned
> interpreters.
> > +for binary in "${PYTHON-python3}" ${PYTHON:+python3} python \
> > +                                  python3.11 python3.10 python3.9 \
> > +                                  python3.8 python3.7 python3.6
>
> I think if PYTHON is set we shouldn't look at anything else.
>
> Paolo
>

PYTHON is one we made up, right?


> >   do
> >       if has "$binary"
> >       then
> >           python=$(command -v "$binary")
> > -        break
> > +        if test -z "$first_python"; then
> > +           first_python=$python
> > +        fi
> > +        if check_py_version "$python"; then
> > +            # This one is good.
> > +            first_python=
> > +            break
> > +        fi
> >       fi
> >   done
> >
> > +# If first_python is set, we didn't find a suitable binary.
> > +# Use this one for possible future error messages.
> > +if test -n "$first_python"; then
> > +    python="$first_python"
> > +fi
> >
> >   # Check for ancillary tools used in testing
> >   genisoimage=
> > @@ -1037,9 +1057,7 @@ then
> >       error_exit "GNU make ($make) not found"
> >   fi
> >
> > -# Note that if the Python conditional here evaluates True we will exit
> > -# with status 1 which is a shell 'false' value.
> > -if ! $python -c 'import sys; sys.exit(sys.version_info < (3,6))'; then
> > +if ! check_py_version "$python"; then
> >     error_exit "Cannot use '$python', Python >= 3.6 is required." \
> >         "Use --python=/path/to/python to specify a supported Python."
> >   fi
>
>

--0000000000005bb3b105f5393d21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Feb 21, 2023, 6:03 AM Paolo Bonzini &lt;<a hre=
f=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On 2/21/23 02:24, John Snow wrote:<br>
&gt; At the moment, we look for just &quot;python3&quot; and &quot;python&q=
uot;, which is good<br>
&gt; enough almost all of the time. But ... if you are on a platform that<b=
r>
&gt; uses an older Python by default and only offers a newer Python as an<b=
r>
&gt; option, you&#39;ll have to specify --python=3D/usr/bin/foo every time.=
<br>
&gt; <br>
&gt; As a courtesy, we can make a cursory attempt to locate a suitable Pyth=
on<br>
&gt; binary ourselves, looking for the remaining well-known binaries. This<=
br>
&gt; also has the added benefit of making configure &quot;just work&quot; m=
ore often<br>
&gt; on various BSD distributions that do not have the concept of a<br>
&gt; &quot;platform default python&quot;.<br>
&gt; <br>
&gt; This configure loop will prefer, in order:<br>
&gt; <br>
&gt; 1. Whatever is specified in $PYTHON<br>
&gt; 2. python3<br>
&gt; 3. python (Which is usually 2.x, but might be 3.x on some platforms.)<=
br>
&gt; 4. python3.11 down through python3.6<br>
&gt; <br>
&gt; Notes:<br>
&gt; <br>
&gt; - Python virtual environments provide binaries for &quot;python3&quot;=
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
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0configure | 34 ++++++++++++++++++++++++++--------<br>
&gt;=C2=A0 =C2=A01 file changed, 26 insertions(+), 8 deletions(-)<br>
&gt; <br>
&gt; diff --git a/configure b/configure<br>
&gt; index cf6db3d5518..6abf5a72078 100755<br>
&gt; --- a/configure<br>
&gt; +++ b/configure<br>
&gt; @@ -592,20 +592,40 @@ esac<br>
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
&gt; +# Check for $PYTHON, python3, python, then explicitly-versioned inter=
preters.<br>
&gt; +for binary in &quot;${PYTHON-python3}&quot; ${PYTHON:+python3} python=
 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 python3.11 python3.10 pyt=
hon3.9 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 python3.8 python3.7 pytho=
n3.6<br>
<br>
I think if PYTHON is set we shouldn&#39;t look at anything else.<br>
<br>
Paolo<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">PYTHON is one we made up, right?</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if has &quot;$binary&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python=3D$(command -v &quot;$b=
inary&quot;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -z &quot;$first_python&quot;; the=
n<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0first_python=3D$python<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if check_py_version &quot;$python&quot;; =
then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # This one is good.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 first_python=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0done<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +# If first_python is set, we didn&#39;t find a suitable binary.<br>
&gt; +# Use this one for possible future error messages.<br>
&gt; +if test -n &quot;$first_python&quot;; then<br>
&gt; +=C2=A0 =C2=A0 python=3D&quot;$first_python&quot;<br>
&gt; +fi<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# Check for ancillary tools used in testing<br>
&gt;=C2=A0 =C2=A0genisoimage=3D<br>
&gt; @@ -1037,9 +1057,7 @@ then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0error_exit &quot;GNU make ($make) not found&=
quot;<br>
&gt;=C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -# Note that if the Python conditional here evaluates True we will exi=
t<br>
&gt; -# with status 1 which is a shell &#39;false&#39; value.<br>
&gt; -if ! $python -c &#39;import sys; sys.exit(sys.version_info &lt; (3,6)=
)&#39;; then<br>
&gt; +if ! check_py_version &quot;$python&quot;; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0error_exit &quot;Cannot use &#39;$python&#39;, Pyth=
on &gt;=3D 3.6 is required.&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Use --python=3D/path/to/python =
to specify a supported Python.&quot;<br>
&gt;=C2=A0 =C2=A0fi<br>
<br>
</blockquote></div></div></div>

--0000000000005bb3b105f5393d21--


