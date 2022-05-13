Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 256715264F2
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 16:42:20 +0200 (CEST)
Received: from localhost ([::1]:39592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npWUk-0005gI-KT
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 10:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npWQq-0003EC-UT
 for qemu-devel@nongnu.org; Fri, 13 May 2022 10:38:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npWQo-0005Pv-Pm
 for qemu-devel@nongnu.org; Fri, 13 May 2022 10:38:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652452694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uklJgan4LFlB8d1G50lxwiJO4Vn6n84S03sKRViRJIM=;
 b=eGoq0CausgxcG3Q12eZQHOVBqqBJz/cl+t/lDD/9wCi7+31EHGcmodMXB/i4LfxQMu5Frl
 mhPTItT0AYuNzepRDQ7jdv/mJ2AlNATUFi1Lz85vlVMassBZzMZWUC1+wmVh6yaImzOAkK
 Ft8NlD8RfpZw7Ubzp4/tS9ZHvV/CvcM=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-IE5bQeHSNB-oMdU4LEZarw-1; Fri, 13 May 2022 10:38:12 -0400
X-MC-Unique: IE5bQeHSNB-oMdU4LEZarw-1
Received: by mail-vk1-f198.google.com with SMTP id
 t62-20020a1f5f41000000b00352618e430bso1163222vkb.16
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 07:38:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uklJgan4LFlB8d1G50lxwiJO4Vn6n84S03sKRViRJIM=;
 b=rdBsm5kpl5h8MYNSN05vAqTYhs/knGsws+dFvFK14nfG7kv9W70X+vm4fLa5+fVZAe
 TAAdd04LHOnWNIjDgIZKdoBM/t7XXkv+yiV17j0+18Ra1rrT+mYc/2KMDUmUoC0DGfsG
 gtKtdtaiV+IlcHTNDSu3l5k/Z+8/j6knUelnHHs1/tVBDMHcidgPR6VdXfzySJlUzP2S
 AW2KT1FSJB5wAIY28o6T0c9LdMJjaCXlcx77bCV3arvT+cugyNgSZLi27NyGT4sztBJ8
 xl7m6FYXWdhbOUVkFcppJ5i/bHhCVXD8hWF2vNZ0d6MATTHPm9ryKyBi1X2t0Cw4ey/1
 YnZQ==
X-Gm-Message-State: AOAM5315iTnFHAjKYDf1CVn7rwIH9yTE3tjyx5XvpXwGVhRB+kcSCTeM
 fAvz/gEBMRkc8i8ah0PEkHjhThKLmYvMTzHes5d1FZfC7+gpLNeoisN4jTg+IGkhHcIQAoRLFYg
 zEun3818iKYuNBFZ/DKXtt9Dj9N2rHrs=
X-Received: by 2002:a05:6102:320c:b0:32c:ffc1:ff1c with SMTP id
 r12-20020a056102320c00b0032cffc1ff1cmr2182529vsf.35.1652452692426; 
 Fri, 13 May 2022 07:38:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOpYa+4kLVh1wpfRz+XwRZ2cj91aXckLG7x6+THcqUHrY6dryCImJQcTpN36/ENaHJWRiIJqjAZQt6oJAmoII=
X-Received: by 2002:a05:6102:320c:b0:32c:ffc1:ff1c with SMTP id
 r12-20020a056102320c00b0032cffc1ff1cmr2182519vsf.35.1652452692214; Fri, 13
 May 2022 07:38:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220513000609.197906-1-jsnow@redhat.com>
 <20220513000609.197906-10-jsnow@redhat.com>
 <ab6d4171-74f0-3b6c-9ffc-1ed8f4fb0493@redhat.com>
In-Reply-To: <ab6d4171-74f0-3b6c-9ffc-1ed8f4fb0493@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 13 May 2022 10:38:01 -0400
Message-ID: <CAFn=p-b19dDshg7ShuNqhH+1h_ptYL4qpZSkTvnVnZOPT3g8HQ@mail.gmail.com>
Subject: Re: [RFC PATCH 9/9] iotests: use tests/venv for running tests
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>, 
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Daniel Berrange <berrange@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ba5abc05dee59fd3"
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

--000000000000ba5abc05dee59fd3
Content-Type: text/plain; charset="UTF-8"

On Fri, May 13, 2022, 4:38 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 5/13/22 02:06, John Snow wrote:
> > Essentially, this:
> >
> > (A) adjusts the python binary to be the one found in the venv (which is
> > a symlink to the python binary chosen at configure time)
> >
> > (B) adds a new VIRTUAL_ENV export variable
> >
> > (C) changes PATH to front-load the venv binary directory.
> >


(amending my commit message/rfc notes while I'm here:)

I'll add that this way of entering a venv is more complex than the method
used for VM tests and Avocado tests because it allows the possibility of
shell tests (et al) invoking python utilities and having those be "in the
venv" as well.

i.e. it's more rigorous and it matches the behavior of the "activate" shell
script bundled with every venv.


> > If the venv directory isn't found, raise a friendly exception that tries
> > to give the human operator a friendly clue as to what's gone wrong. In
> > the very near future, I'd like to teach iotests how to fix this problem
> > entirely of its own volition, but that's a trick for a little later.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   tests/qemu-iotests/testenv.py | 24 +++++++++++++++++-------
> >   1 file changed, 17 insertions(+), 7 deletions(-)
> >
> > diff --git a/tests/qemu-iotests/testenv.py
> b/tests/qemu-iotests/testenv.py
> > index 0007da3f06c..fd3720ed7e7 100644
> > --- a/tests/qemu-iotests/testenv.py
> > +++ b/tests/qemu-iotests/testenv.py
> > @@ -65,8 +65,9 @@ class TestEnv(ContextManager['TestEnv']):
> >       # lot of them. Silence pylint:
> >       # pylint: disable=too-many-instance-attributes
> >
> > -    env_variables = ['PYTHONPATH', 'TEST_DIR', 'SOCK_DIR',
> 'SAMPLE_IMG_DIR',
> > -                     'PYTHON', 'QEMU_PROG', 'QEMU_IMG_PROG',
> > +    env_variables = ['PYTHONPATH', 'VIRTUAL_ENV', 'PYTHON',
> > +                     'TEST_DIR', 'SOCK_DIR', 'SAMPLE_IMG_DIR',
> > +                     'QEMU_PROG', 'QEMU_IMG_PROG',
> >                        'QEMU_IO_PROG', 'QEMU_NBD_PROG', 'QSD_PROG',
> >                        'QEMU_OPTIONS', 'QEMU_IMG_OPTIONS',
> >                        'QEMU_IO_OPTIONS', 'QEMU_IO_OPTIONS_NO_FMT',
> > @@ -98,6 +99,10 @@ def get_env(self) -> Dict[str, str]:
> >               if val is not None:
> >                   env[v] = val
> >
> > +        env['PATH'] = os.pathsep.join((
> > +            os.path.join(self.virtual_env, 'bin'),
> > +            os.environ['PATH']
> > +        ))
> >           return env
> >
> >       def init_directories(self) -> None:
> > @@ -107,13 +112,17 @@ def init_directories(self) -> None:
> >                SOCK_DIR
> >                SAMPLE_IMG_DIR
> >           """
> > -
> > -        # Path where qemu goodies live in this source tree.
> > -        qemu_srctree_path = Path(__file__, '../../../python').resolve()
> > +        venv_path = Path(self.build_root, 'tests/venv/')
> > +        if not venv_path.exists():
> > +            raise FileNotFoundError(
> > +                f"Virtual environment \"{venv_path!s}\" isn't found."
> > +                " (Maybe you need to run 'make check-venv'"
> > +                " from the build dir?)"
> > +            )
> > +        self.virtual_env: str = str(venv_path)
> >
> >           self.pythonpath = os.pathsep.join(filter(None, (
> >               self.source_iotests,
> > -            str(qemu_srctree_path),
> >               os.getenv('PYTHONPATH'),
> >           )))
> >
> > @@ -138,7 +147,7 @@ def init_binaries(self) -> None:
> >                PYTHON (for bash tests)
> >                QEMU_PROG, QEMU_IMG_PROG, QEMU_IO_PROG, QEMU_NBD_PROG,
> QSD_PROG
> >           """
> > -        self.python = sys.executable
> > +        self.python: str = os.path.join(self.virtual_env, 'bin',
> 'python3')
>
> Is this guaranteed even if, say, only a /usr/bin/python3.9 exists?
> os.path.basename(sys.executable) might be more weirdness-proof than
> 'python3'.
>
> Paolo
>

It *should*, because "#!/usr/bin/env python3" is the preferred shebang for
Python scripts.

https://peps.python.org/pep-0394/

'python3' "should" be available. 'python' may not be.

Probably the "python" name in Makefile for TESTS_PYTHON should actually be
"python3" as well. In practice, all permutations (python, python3,
python3.9, etc.) are symlinks* to the binary used to create the venv. Which
links are present may be site configurable, but pep394 should guarantee
that python3 is always available.

(* not on Windows, where it'll be a copy.)

>

--000000000000ba5abc05dee59fd3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, May 13, 2022, 4:38 AM Paolo Bonzini &lt;<a hre=
f=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On 5/13/22 02:06, John Snow wrote:<br>
&gt; Essentially, this:<br>
&gt; <br>
&gt; (A) adjusts the python binary to be the one found in the venv (which i=
s<br>
&gt; a symlink to the python binary chosen at configure time)<br>
&gt; <br>
&gt; (B) adds a new VIRTUAL_ENV export variable<br>
&gt; <br>
&gt; (C) changes PATH to front-load the venv binary directory.<br>
&gt;</blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">=
(amending my commit message/rfc notes while I&#39;m here:)</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">I&#39;ll add that this way of entering a=
 venv is more complex than the method used for VM tests and Avocado tests b=
ecause it allows the possibility of shell tests (et al) invoking python uti=
lities and having those be &quot;in the venv&quot; as well.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">i.e. it&#39;s more rigorous and it ma=
tches the behavior of the &quot;activate&quot; shell script bundled with ev=
ery venv.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"=
gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"> <br>
&gt; If the venv directory isn&#39;t found, raise a friendly exception that=
 tries<br>
&gt; to give the human operator a friendly clue as to what&#39;s gone wrong=
. In<br>
&gt; the very near future, I&#39;d like to teach iotests how to fix this pr=
oblem<br>
&gt; entirely of its own volition, but that&#39;s a trick for a little late=
r.<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/testenv.py | 24 +++++++++++++++++------=
-<br>
&gt;=C2=A0 =C2=A01 file changed, 17 insertions(+), 7 deletions(-)<br>
&gt; <br>
&gt; diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testen=
v.py<br>
&gt; index 0007da3f06c..fd3720ed7e7 100644<br>
&gt; --- a/tests/qemu-iotests/testenv.py<br>
&gt; +++ b/tests/qemu-iotests/testenv.py<br>
&gt; @@ -65,8 +65,9 @@ class TestEnv(ContextManager[&#39;TestEnv&#39;]):<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# lot of them. Silence pylint:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# pylint: disable=3Dtoo-many-instance-attrib=
utes<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 env_variables =3D [&#39;PYTHONPATH&#39;, &#39;TEST_DIR&=
#39;, &#39;SOCK_DIR&#39;, &#39;SAMPLE_IMG_DIR&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&#39;PYTHON&#39;, &#39;QEMU_PROG&#39;, &#39;QEMU_IMG_PROG&#39;,<br>
&gt; +=C2=A0 =C2=A0 env_variables =3D [&#39;PYTHONPATH&#39;, &#39;VIRTUAL_E=
NV&#39;, &#39;PYTHON&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&#39;TEST_DIR&#39;, &#39;SOCK_DIR&#39;, &#39;SAMPLE_IMG_DIR&#39;,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&#39;QEMU_PROG&#39;, &#39;QEMU_IMG_PROG&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &#39;QEMU_IO_PROG&#39;, &#39;QEMU_NBD_PROG&#39;, &#39;QSD_PRO=
G&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &#39;QEMU_OPTIONS&#39;, &#39;QEMU_IMG_OPTIONS&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &#39;QEMU_IO_OPTIONS&#39;, &#39;QEMU_IO_OPTIONS_NO_FMT&#39;,<=
br>
&gt; @@ -98,6 +99,10 @@ def get_env(self) -&gt; Dict[str, str]:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if val is not No=
ne:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0en=
v[v] =3D val<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env[&#39;PATH&#39;] =3D os.pathsep.join((=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.path.join(self.virtual_e=
nv, &#39;bin&#39;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.environ[&#39;PATH&#39;]<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return env<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def init_directories(self) -&gt; None:<br>
&gt; @@ -107,13 +112,17 @@ def init_directories(self) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SOCK_DIR<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SAMPLE_IMG_DIR<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Path where qemu goodies live in this so=
urce tree.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_srctree_path =3D Path(__file__, &#39=
;../../../python&#39;).resolve()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 venv_path =3D Path(self.build_root, &#39;=
tests/venv/&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not venv_path.exists():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise FileNotFoundError(<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f&quot;Virtua=
l environment \&quot;{venv_path!s}\&quot; isn&#39;t found.&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; (Maybe=
 you need to run &#39;make check-venv&#39;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; from t=
he build dir?)&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.virtual_env: str =3D str(venv_path)<=
br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.pythonpath =3D os.pathsep=
.join(filter(None, (<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.source_iote=
sts,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 str(qemu_srctree_path),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.getenv(&#39;P=
YTHONPATH&#39;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)))<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -138,7 +147,7 @@ def init_binaries(self) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PYTHON (for bas=
h tests)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QEMU_PROG, QEMU=
_IMG_PROG, QEMU_IO_PROG, QEMU_NBD_PROG, QSD_PROG<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.python =3D sys.executable<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.python: str =3D os.path.join(self.vi=
rtual_env, &#39;bin&#39;, &#39;python3&#39;)<br>
<br>
Is this guaranteed even if, say, only a /usr/bin/python3.9 exists? <br>
os.path.basename(sys.executable) might be more weirdness-proof than <br>
&#39;python3&#39;.<br>
<br>
Paolo<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">It *should*, because &quot;#!/usr/bin/env python3&quot; is the preferr=
ed shebang for Python scripts.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto"><a href=3D"https://peps.python.org/pep-0394/">https://peps.python.or=
g/pep-0394/</a><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">&#39=
;python3&#39; &quot;should&quot; be available. &#39;python&#39; may not be.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Probably the &quot;pyth=
on&quot; name in Makefile for TESTS_PYTHON should actually be &quot;python3=
&quot; as well. In practice, all permutations (python, python3, python3.9, =
etc.)=C2=A0are symlinks* to the binary used to create the venv. Which links=
 are present may be site configurable, but pep394 should guarantee that pyt=
hon3 is always available.</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">(* not on Windows, where it&#39;ll be a copy.)</div><div dir=3D"auto"><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000ba5abc05dee59fd3--


