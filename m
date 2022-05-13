Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D886A526662
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 17:42:44 +0200 (CEST)
Received: from localhost ([::1]:49290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npXRE-0007vm-0K
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 11:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npXOQ-0002pF-Kf
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:39:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npXON-0007XE-3P
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:39:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652456386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bi5iPD8TXT86bfRWPULvkgVvAyZG//e6pNA9P91oy04=;
 b=CjANYgVZh/zbHQ5ErL5rFhx0xXJKMwpyRqyjqHF2Q17mvzwRoSIclc0NJy1bX8fJFuecQu
 g862MX1XV11/iB7lDglAukdnuWHS6YSelYxagg66D6w5lEGKbsLMfJGL8v8Fixq5LZosqs
 w3BJ5jrKspWHGGQiW7qkn2O5bbiiTdE=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-cFAY9PgiODidkGMOcGNvNQ-1; Fri, 13 May 2022 11:39:44 -0400
X-MC-Unique: cFAY9PgiODidkGMOcGNvNQ-1
Received: by mail-ua1-f71.google.com with SMTP id
 66-20020a9f2048000000b003688fbd5e19so360775uam.14
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 08:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bi5iPD8TXT86bfRWPULvkgVvAyZG//e6pNA9P91oy04=;
 b=1+f4sWJLSjus2M7adekvCnE2TmX7eOHjJ/dwdN8mX43KjxFADGAaMbmL8LVhb/mhLe
 Oyu88VpxvNo+1tNGB3zt9ZlFXPQ/bk/yAtJX63bkh6Ck56R+KzZLqYJFx07teFXmLV12
 hex0Woom5C16NZzgxnSakIHobFDO3dCsDMS0Z8oR3c+omLHCGaqUL127rCmD11gEiaVQ
 sczE3bC7A3GtqKigM/QORmBDRzAQxNyf5CIhQr08wN2BZ6x/rniwP41naaew5Xpy3PSM
 29khRY+ZGH8Shx/1Env1zIFRH5WzKscDSdiZzkpmkaO3n8s+bH7QsG+oLENMaNI7c57B
 Lseg==
X-Gm-Message-State: AOAM532/30L1BOFrwTEa7NxWAk9aq4S98QN31QuvJ4m4lDtIvPTqdg/S
 cuWed7NZheexeD4ZEQGpw8Hh0jSb0yX1zWX7sFYKTD4RLVxasMGmKA0WXKJc26sODyqaSUFh+RD
 Bm2B6TZuws63yW0esSj2ygVDmF/imx3A=
X-Received: by 2002:a05:6102:320c:b0:32c:ffc1:ff1c with SMTP id
 r12-20020a056102320c00b0032cffc1ff1cmr2328573vsf.35.1652456384386; 
 Fri, 13 May 2022 08:39:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybIvX8e+RFJWN9lkDTC5PRDamGgAs+TyjEYlKJnYc0iCUT0bWKU+EAJZI2r8L+j7YJT2by50Gl4/oG7IMLLLw=
X-Received: by 2002:a05:6102:320c:b0:32c:ffc1:ff1c with SMTP id
 r12-20020a056102320c00b0032cffc1ff1cmr2328556vsf.35.1652456384163; Fri, 13
 May 2022 08:39:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220513000609.197906-1-jsnow@redhat.com>
 <0248b5df-dbc6-48bf-b5c8-e5c73decc1c1@redhat.com>
In-Reply-To: <0248b5df-dbc6-48bf-b5c8-e5c73decc1c1@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 13 May 2022 11:39:33 -0400
Message-ID: <CAFn=p-ZHW31EnhgUt5uBcnnAEZ0XNZEgxq=pyPHnDShqcGGGCQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/9] tests: run python tests under the
 build/tests/venv environment
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>, 
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Daniel Berrange <berrange@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c904b105dee67bef"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c904b105dee67bef
Content-Type: text/plain; charset="UTF-8"

On Fri, May 13, 2022, 6:21 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 5/13/22 02:06, John Snow wrote:
> > The only downside I am really frowning at is that I will have to
> > replicate some "update the venv if it's outdated" logic that is usually
> > handled by the Make system in the venv bootstrapper. Still, I think it's
> > probably the only way to hit all of the requirements here without trying
> > to concoct a fairly complex Makefile.
> >
> > any thoughts? If not, I'll just move on to trying to hack up that
> > version next instead.
>
> I would not even bother with keeping the venv up to date.  Just initialize
>

I'm worried about this idea being very inconvenient for iterative
development of the python code.

it in configure, this is exactly what configure remains useful for in the
> Meson-based world:
>
> - add configure options --enable-python-qemu={enabled,system,internal,pip,
> auto}/--disable-python-qemu (auto means system>internal>pip>disabled;
> enabled means
> system>internal>pip>error) and matching CONFIG_PYTHON_QEMU=y to
> config-host.mak
>

I'm not sure this makes sense. python/qemu will continue to exist in-tree
and will only ever be "internal" in that sense. It won't be something you
can wholesale install from pip.

i.e. I plan to continue to break off pieces and upstream them, but I intend
to leave several modules as internal only.

So I'm not sure "internal" vs "pip" makes sense config-wise, it's intended
to be a mixture of both, really.

But, I suppose this is how you'd like to address different venv setup
behaviors to accommodate spec builds vs dev builds - with a configure flag
of some kind.

(I suppose you'd then like to see configure error out if it doesn't have
the necessary requisites given the venv-style chosen?)

- use CONFIG_PYTHON_QEMU to enable/disable iotests in
> tests/qemu-iotests/meson.build
>

So it's just skipped if you don't have the reqs to make the venv? (Not an
error?)


> - add a configure option --enable-avocado=
> {system,pip,auto,enabled}/--disable-avocado and matching
> CONFIG_AVOCADO=y to config-host.mak
>
> - use it to enable/disable acceptance tests in tests/Makefile.include
>

And this is how you propose eliminating the need for an always-present
avocado builddep.


> - build the venv in configure and use the options to pick the right pip
> install
> commands, like
>
> has_python_module() {
>    $python -c "import $1" > /dev/null 2>&1
> }
>
> # do_pip VENV-PATH VAR PACKAGE [PATH] -- PIP-OPTIONS
> do_pip() {
>      local num_args source
>      num_args=5
>      test $4 = '--' && num_args=4
>      eval source=\$$2
>      # Try to resolve the package using a system install
>      case $source in
>        enabled|auto|system)
>          if has_python_module $3; then
>            source=system
>          elif test $source = system; then
>            error_exit "Python package $3 not installed"
>          fi
>      esac
>      # See if a bundled copy is present
>      case $source in
>        enabled|auto|internal)
>          if test $num_args = 5 && test -f $4/setup.cfg; then
>            source=internal
>          elif test $source = internal; then
>            error_exit "Sources for Python package $3 not found in the QEMU
> source tree"
>          fi
>      esac
>      # Install the bundled copy or let pip download the package
>      case $source in
>        internal)
>          # The Pip error message should be clear enough
>          (cd $1 && . bin/activate && pip install "$@") || exit 1
>        ;;
>        enabled|auto|pip)
>          shift $num_args
>          if (cd $1 && . bin/activate && pip install "$@"); then
>            source=pip
>          elif test $source = auto; then
>            source=disabled
>          else
>            # The Pip error message should be clear enough
>            exit 1
>          fi
>        ;;
>      esac
>      eval $2=\$source
> }
>
> rm -rf venv/
> $python -m venv venv/
> do_pip venv/ enable_python_qemu qemu.qmp python/qemu -- qemu.qmp
> do_pip venv/ enable_avocado avocado -- -r tests/requirements.txt
>

Won't this rebuild the venv like *all of the time*, basically whenever you
see the "configuration is stale" message?

That both seems like way too often, *and* it wouldn't cover cases when it
really ought to be refreshed.

--000000000000c904b105dee67bef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, May 13, 2022, 6:21 AM Paolo Bonzini &lt;<a hre=
f=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On 5/13/22 02:06, John Snow wrote:<br>
&gt; The only downside I am really frowning at is that I will have to<br>
&gt; replicate some &quot;update the venv if it&#39;s outdated&quot; logic =
that is usually<br>
&gt; handled by the Make system in the venv bootstrapper. Still, I think it=
&#39;s<br>
&gt; probably the only way to hit all of the requirements here without tryi=
ng<br>
&gt; to concoct a fairly complex Makefile.<br>
&gt; <br>
&gt; any thoughts? If not, I&#39;ll just move on to trying to hack up that<=
br>
&gt; version next instead.<br>
<br>
I would not even bother with keeping the venv up to date.=C2=A0 Just initia=
lize<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"au=
to">I&#39;m worried about this idea being very inconvenient for iterative d=
evelopment of the python code.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
it in configure, this is exactly what configure remains useful for in the<b=
r>
Meson-based world:<br>
<br>
- add configure options --enable-python-qemu=3D{enabled,system,internal,pip=
,<br>
auto}/--disable-python-qemu (auto means system&gt;internal&gt;pip&gt;disabl=
ed; enabled means<br>
system&gt;internal&gt;pip&gt;error) and matching CONFIG_PYTHON_QEMU=3Dy to<=
br>
config-host.mak<br></blockquote></div></div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">I&#39;m not sure this makes sense. python/qemu will continue=
 to exist in-tree and will only ever be &quot;internal&quot; in that sense.=
 It won&#39;t be something you can wholesale install from pip.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">i.e. I plan to continue to break off=
 pieces and upstream them, but I intend to leave several modules as interna=
l only.</div><div dir=3D"auto"><br></div><div dir=3D"auto">So I&#39;m not s=
ure &quot;internal&quot; vs &quot;pip&quot; makes sense config-wise, it&#39=
;s intended to be a mixture of both, really.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">But, I suppose this is how you&#39;d like to address d=
ifferent venv setup behaviors to accommodate spec builds vs dev builds - wi=
th a configure flag of some kind.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">(I suppose you&#39;d then like to see configure error out if it d=
oesn&#39;t have the necessary requisites given the venv-style chosen?)</div=
><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
- use CONFIG_PYTHON_QEMU to enable/disable iotests in tests/qemu-iotests/me=
son.build<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">So it&#39;s just skipped if you don&#39;t have the reqs to make t=
he venv? (Not an error?)</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
- add a configure option --enable-avocado=3D<br>
{system,pip,auto,enabled}/--disable-avocado and matching<br>
CONFIG_AVOCADO=3Dy to config-host.mak<br>
<br>
- use it to enable/disable acceptance tests in tests/Makefile.include<br></=
blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">And th=
is is how you propose eliminating the need for an always-present avocado bu=
ilddep.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">
<br>
- build the venv in configure and use the options to pick the right pip ins=
tall<br>
commands, like<br>
<br>
has_python_module() {<br>
=C2=A0 =C2=A0$python -c &quot;import $1&quot; &gt; /dev/null 2&gt;&amp;1<br=
>
}<br>
<br>
# do_pip VENV-PATH VAR PACKAGE [PATH] -- PIP-OPTIONS<br>
do_pip() {<br>
=C2=A0 =C2=A0 =C2=A0local num_args source<br>
=C2=A0 =C2=A0 =C2=A0num_args=3D5<br>
=C2=A0 =C2=A0 =C2=A0test $4 =3D &#39;--&#39; &amp;&amp; num_args=3D4<br>
=C2=A0 =C2=A0 =C2=A0eval source=3D\$$2<br>
=C2=A0 =C2=A0 =C2=A0# Try to resolve the package using a system install<br>
=C2=A0 =C2=A0 =C2=A0case $source in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0enabled|auto|system)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if has_python_module $3; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source=3Dsystem<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif test $source =3D system; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_exit &quot;Python package $3=
 not installed&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0esac<br>
=C2=A0 =C2=A0 =C2=A0# See if a bundled copy is present<br>
=C2=A0 =C2=A0 =C2=A0case $source in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0enabled|auto|internal)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test $num_args =3D 5 &amp;&amp; test -=
f $4/setup.cfg; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source=3Dinternal<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif test $source =3D internal; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_exit &quot;Sources for Pytho=
n package $3 not found in the QEMU source tree&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0esac<br>
=C2=A0 =C2=A0 =C2=A0# Install the bundled copy or let pip download the pack=
age<br>
=C2=A0 =C2=A0 =C2=A0case $source in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0internal)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# The Pip error message should be clear e=
nough<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(cd $1 &amp;&amp; . bin/activate &amp;&am=
p; pip install &quot;$@&quot;) || exit 1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0enabled|auto|pip)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shift $num_args<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cd $1 &amp;&amp; . bin/activate &amp;=
&amp; pip install &quot;$@&quot;); then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source=3Dpip<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif test $source =3D auto; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source=3Ddisabled<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# The Pip error message should be =
clear enough<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0 =C2=A0esac<br>
=C2=A0 =C2=A0 =C2=A0eval $2=3D\$source<br>
}<br>
<br>
rm -rf venv/<br>
$python -m venv venv/<br>
do_pip venv/ enable_python_qemu qemu.qmp python/qemu -- qemu.qmp<br>
do_pip venv/ enable_avocado avocado -- -r tests/requirements.txt<br></block=
quote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Won&#39;t t=
his rebuild the venv like *all of the time*, basically whenever you see the=
 &quot;configuration is stale&quot; message?</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">That both seems like way too often, *and* it wouldn&#3=
9;t cover cases when it really ought to be refreshed.</div><div dir=3D"auto=
"><br></div></div>

--000000000000c904b105dee67bef--


