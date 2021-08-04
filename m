Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB183E078A
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 20:25:06 +0200 (CEST)
Received: from localhost ([::1]:56072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBLZh-00030v-09
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 14:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mBJkD-0005oP-QU
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 12:27:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mBJk3-0004bF-Vn
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 12:27:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628094458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HIuq1KOesTSU060X0tVT8LZgi1ur+5kNpgBzlAJxKnY=;
 b=VSXmYCd+fSEtFIsx1JcDSKoY4mJ1hpIywL2h8r9+E8TvotGCgP399h4Ycr1MlMpQXo3KUq
 UHBckGGTqS/ymYkO4xOm+M96a+Nj8HKV73d2cvhMP0bjv0DNRJHDxoC1ZCDMPYSs8/9s+q
 W9S6IBP8B7hAO5wkbizxmsSzLGBGzEs=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-KgDx6y75PPqZoUYz5k1D_w-1; Wed, 04 Aug 2021 12:27:36 -0400
X-MC-Unique: KgDx6y75PPqZoUYz5k1D_w-1
Received: by mail-ot1-f71.google.com with SMTP id
 i18-20020a9d62520000b02904ccb7285c38so999163otk.14
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 09:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HIuq1KOesTSU060X0tVT8LZgi1ur+5kNpgBzlAJxKnY=;
 b=SQzVUN8Rk48bCSc/Wq5JYi0jgCBmnOfy2H5rmqbkd8rOXoRw3h6NAFngOjMpnzFv/E
 CRUlwXqQxkzVpZjy9hQFqSFyD65FjX9eWiEe4QyMwx8TPHQ/pjqRkpDHi1wqMdp4Wo1g
 6jT2DoQ//9YAqwlK1L5gyvvDU1sBZUHgh/mMf8635vZva2t8gFCh8x/S9eDH54z6i0Yw
 UvaCeurRCl8GPWUw+qrQK1Zf2M+YqQhsPhdk9RgV/4wStdca3ta4g25aiq7h3qw6KFH8
 4e7yNacn5RgQJ+UyP6QBoC2iVCMF9YQ5xds7y8As/keFSpVQEXckCJHdMBlfbhtAIX3O
 3v6Q==
X-Gm-Message-State: AOAM531yZ5fupoBYwaa2RMPT+2UzCoc9KzemG2tb5CmqDSTzJ0RP+s9F
 CuKNAfr8XA2UtHCX2EbGzHE0LvI9ojOLvSlc2NqzTt6NzgtuDCoKL116qkNxE6shb0vMWm31+IA
 RiRbAYsSGnYGAcmhTvGU/ohUXbwWj8e4=
X-Received: by 2002:a05:6830:1604:: with SMTP id
 g4mr443286otr.45.1628094456304; 
 Wed, 04 Aug 2021 09:27:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYpeoOTRolht/F4fLfgR3qI1/bwI9KckMKX+53ME+FzwU+9FC4GEhlxh0vuTcM2PgrQjnPrzfYX46Vaw2Cnag=
X-Received: by 2002:a05:6830:1604:: with SMTP id
 g4mr443274otr.45.1628094456143; 
 Wed, 04 Aug 2021 09:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
 <20210804093813.20688-26-vsementsov@virtuozzo.com>
In-Reply-To: <20210804093813.20688-26-vsementsov@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 4 Aug 2021 12:27:25 -0400
Message-ID: <CAFn=p-bFQvAnBypxqO7HUob+JJk=d1tp0juJXzdfU6yK7O_Xvw@mail.gmail.com>
Subject: Re: [PATCH v7 25/33] iotests.py: VM: add own __enter__ method
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000b834e005c8be4757"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b834e005c8be4757
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 4, 2021 at 5:39 AM Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> wrote:

> In superclass __enter__ method is defined with return value type hint
> 'QEMUMachine'. So, mypy thinks that return value of VM.__enter__ is
> QEMUMachine. Let's redefine __enter__ in VM class, to give it correct
> type hint.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> ---
>  tests/qemu-iotests/iotests.py | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 89663dac06..025e288ddd 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -568,6 +568,10 @@ def remote_filename(path):
>  class VM(qtest.QEMUQtestMachine):
>      '''A QEMU VM'''
>
> +    # Redefine __enter__ with proper type hint
> +    def __enter__(self) -> 'VM':
> +        return self
> +
>      def __init__(self, path_suffix=''):
>          name = "qemu%s-%d" % (path_suffix, os.getpid())
>          super().__init__(qemu_prog, qemu_opts, name=name,
> --
> 2.29.2
>

First and foremost:

Reviewed-by: John Snow <jsnow@redhat.com>
Acked-by: John Snow <jsnow@redhat.com>

A more durable approach might be to annotate QEMUMachine differently such
that subclasses get the right types automatically. See if this following
snippet works instead of adding a new __enter__ method.

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 971ed7e8c6a..2e410103569 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -36,6 +36,7 @@
     Sequence,
     Tuple,
     Type,
+    TypeVar,
 )

 from qemu.qmp import (  # pylint: disable=import-error
@@ -73,6 +74,9 @@ class AbnormalShutdown(QEMUMachineError):
     """


+_T = TypeVar('_T', bound='QEMUMachine')
+
+
 class QEMUMachine:
     """
     A QEMU VM.
@@ -166,7 +170,7 @@ def __init__(self,
         self._remove_files: List[str] = []
         self._user_killed = False

-    def __enter__(self) -> 'QEMUMachine':
+    def __enter__(self: _T) -> _T:
         return self

     def __exit__(self,
@@ -182,8 +186,8 @@ def add_monitor_null(self) -> None:
         self._args.append('-monitor')
         self._args.append('null')

-    def add_fd(self, fd: int, fdset: int,
-               opaque: str, opts: str = '') -> 'QEMUMachine':
+    def add_fd(self: _T, fd: int, fdset: int,
+               opaque: str, opts: str = '') -> _T:
         """
         Pass a file descriptor to the VM
         """

--000000000000b834e005c8be4757
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 4, 2021 at 5:39 AM Vladimir S=
ementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@virtuozzo.com">vsements=
ov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">In superclass __enter__ method is defined with return value=
 type hint<br>
&#39;QEMUMachine&#39;. So, mypy thinks that return value of VM.__enter__ is=
<br>
QEMUMachine. Let&#39;s redefine __enter__ in VM class, to give it correct<b=
r>
type hint.<br>
<br>
Signed-off-by: Vladimir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementso=
v@virtuozzo.com" target=3D"_blank">vsementsov@virtuozzo.com</a>&gt;<br>
Reviewed-by: Max Reitz &lt;<a href=3D"mailto:mreitz@redhat.com" target=3D"_=
blank">mreitz@redhat.com</a>&gt;<br>
---<br>
=C2=A0tests/qemu-iotests/iotests.py | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py<=
br>
index 89663dac06..025e288ddd 100644<br>
--- a/tests/qemu-iotests/iotests.py<br>
+++ b/tests/qemu-iotests/iotests.py<br>
@@ -568,6 +568,10 @@ def remote_filename(path):<br>
=C2=A0class VM(qtest.QEMUQtestMachine):<br>
=C2=A0 =C2=A0 =C2=A0&#39;&#39;&#39;A QEMU VM&#39;&#39;&#39;<br>
<br>
+=C2=A0 =C2=A0 # Redefine __enter__ with proper type hint<br>
+=C2=A0 =C2=A0 def __enter__(self) -&gt; &#39;VM&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self<br>
+<br>
=C2=A0 =C2=A0 =C2=A0def __init__(self, path_suffix=3D&#39;&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name =3D &quot;qemu%s-%d&quot; % (path_su=
ffix, os.getpid())<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0super().__init__(qemu_prog, qemu_opts, na=
me=3Dname,<br>
-- <br>
2.29.2<br></blockquote><div><br></div><div>First and foremost:</div><div><b=
r></div><div>Reviewed-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com"=
>jsnow@redhat.com</a>&gt;</div><div>Acked-by: John Snow &lt;<a href=3D"mail=
to:jsnow@redhat.com">jsnow@redhat.com</a>&gt;<br></div><div><br></div><div>=
A more durable approach might be to annotate QEMUMachine differently such t=
hat subclasses get the right types automatically. See if this following sni=
ppet works instead of adding a new __enter__ method.<br></div></div><div cl=
ass=3D"gmail_quote"><br></div><div class=3D"gmail_quote">diff --git a/pytho=
n/qemu/machine/machine.py b/python/qemu/machine/machine.py<br>index 971ed7e=
8c6a..2e410103569 100644<br>--- a/python/qemu/machine/machine.py<br>+++ b/p=
ython/qemu/machine/machine.py<br>@@ -36,6 +36,7 @@<br>=C2=A0 =C2=A0 =C2=A0S=
equence,<br>=C2=A0 =C2=A0 =C2=A0Tuple,<br>=C2=A0 =C2=A0 =C2=A0Type,<br>+ =
=C2=A0 =C2=A0TypeVar,<br>=C2=A0)<br>=C2=A0<br>=C2=A0from qemu.qmp import ( =
=C2=A0# pylint: disable=3Dimport-error<br>@@ -73,6 +74,9 @@ class AbnormalS=
hutdown(QEMUMachineError):<br>=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>=C2=
=A0<br>=C2=A0<br>+_T =3D TypeVar(&#39;_T&#39;, bound=3D&#39;QEMUMachine&#39=
;)<br>+<br>+<br>=C2=A0class QEMUMachine:<br>=C2=A0 =C2=A0 =C2=A0&quot;&quot=
;&quot;<br>=C2=A0 =C2=A0 =C2=A0A QEMU VM.<br>@@ -166,7 +170,7 @@ def __init=
__(self,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._remove_files: List[str]=
 =3D []<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._user_killed =3D False<br=
>=C2=A0<br>- =C2=A0 =C2=A0def __enter__(self) -&gt; &#39;QEMUMachine&#39;:<=
br>+ =C2=A0 =C2=A0def __enter__(self: _T) -&gt; _T:<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return self<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0def __exit__(sel=
f,<br>@@ -182,8 +186,8 @@ def add_monitor_null(self) -&gt; None:<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0self._args.append(&#39;-monitor&#39;)<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0self._args.append(&#39;null&#39;)<br>=C2=A0<br>-=
 =C2=A0 =C2=A0def add_fd(self, fd: int, fdset: int,<br>- =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opaque: str, opts: str =3D &#39;&#39;) -&gt=
; &#39;QEMUMachine&#39;:<br>+ =C2=A0 =C2=A0def add_fd(self: _T, fd: int, fd=
set: int,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opaque: str=
, opts: str =3D &#39;&#39;) -&gt; _T:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;&quot;&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Pass a file descrip=
tor to the VM<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br></=
div></div>

--000000000000b834e005c8be4757--


