Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8993C4092DD
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:17:00 +0200 (CEST)
Received: from localhost ([::1]:45038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPmlX-00018Q-JZ
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mPm26-0007qw-3M
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:30:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mPm22-0003JM-VK
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:30:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631539795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=riMg64p5yTvMl9N7FaeiFWBgApcoA2WuatzjpcZCIJ4=;
 b=OUAupqpG31IuMtk0A1nxc2jlJ7vnMz1mmy06GPQZTW7cHoSGqVSLKnlOL+IEOpqFgZOVXW
 Uz3UUvT8aw5efXCe1UUbIG5GLy9CyEau5WhTtGcQmFrTmGXQTHUavRi0qMan0CS4nILISl
 OVw/iUehGQ1029zCD3NGHPfZvzuMgd0=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-2GCgoDUCOgq-oSuTYuRljg-1; Mon, 13 Sep 2021 09:29:51 -0400
X-MC-Unique: 2GCgoDUCOgq-oSuTYuRljg-1
Received: by mail-pf1-f200.google.com with SMTP id
 k206-20020a6284d7000000b004380af887afso4187288pfd.17
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 06:29:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=riMg64p5yTvMl9N7FaeiFWBgApcoA2WuatzjpcZCIJ4=;
 b=5ASjNnJLtBhquiChYLmQiz1PympDQndcWQU7nRCMz68q02S8zjqnBqMZubt/BpTje4
 +uhiAChp6b1E3cBkOzBaOQ8BR7UiUm9CtV20zGIgOlN8n7oGRxXxEqwxl6eeWBreGznb
 kapGuMYy3Dr2IejxWL1DvTrkPI4AwgEe6weaCG+591805aTdkDnvv6irmhrNGhnNHQJl
 78sBRo3aomF18A4k8ajMhLX7ZF9S9mYQT2OZT/3/fT1Nu4yHDeuU8oHC3Fus6kARaIiF
 VQDWjuF1cYbzz+9Z/lY4hURq+j/gnzYhi0L5g/qKNhd+4v47SowSbeOZTErXPjv1C+hf
 5pAw==
X-Gm-Message-State: AOAM532VHI22jd1LOwj+n6HNHhXDD2KErxllrRiwWjrooLdBp56oEfn9
 MLDVRIgje58e+jvZWUGdSrq8pfpqupthIKOJj0iQnEwy6sxQLyk6DmSjzGtJH8ikw/gUxmaQdKF
 9huKOI/K7PBj3MtSdddmMyd3CzymEx4g=
X-Received: by 2002:a63:1902:: with SMTP id z2mr11243771pgl.312.1631539787728; 
 Mon, 13 Sep 2021 06:29:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLpLeUyAAh312HE42bQK/zHLJ7KXmHPyxmt5MJ3vrRD5ZJg+p+SPkGuaVtdvQOSRO0NdR8JvUygluylTrDc84=
X-Received: by 2002:a63:1902:: with SMTP id z2mr11243754pgl.312.1631539787481; 
 Mon, 13 Sep 2021 06:29:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210913123932.3306639-1-armbru@redhat.com>
 <20210913123932.3306639-2-armbru@redhat.com>
In-Reply-To: <20210913123932.3306639-2-armbru@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 13 Sep 2021 17:29:36 +0400
Message-ID: <CAMxuvaxE4fbkK-nX-K7ni9C4tUdXTTbCe=S1eAPvHCb2RUpFOQ@mail.gmail.com>
Subject: Re: [PATCH 01/22] qapi: Tidy up unusual line breaks
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000007857a705cbe075bf"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: John Snow <jsnow@redhat.com>, "Blake, Eric" <eblake@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007857a705cbe075bf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Sep 13, 2021 at 4:39 PM Markus Armbruster <armbru@redhat.com> wrote=
:

> Break lines between members instead of within members.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

I wish we would just automated tools to format files. With that git 2.23
feature, no more excuses :):
https://www.moxio.com/blog/43/ignoring-bulk-change-commits-with-git-blame

Sadly, our mixed json/py format doesn't get parsed after "blake" reformats
it (strings or trailing commas).

---
>  docs/devel/qapi-code-gen.rst            | 12 +++++------
>  tests/qapi-schema/doc-good.json         |  4 ++--
>  tests/qapi-schema/enum-if-invalid.json  |  4 ++--
>  tests/qapi-schema/qapi-schema-test.json | 28 ++++++++++++-------------
>  4 files changed, 24 insertions(+), 24 deletions(-)
>
> diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
> index ced7a5ffe1..b154eae82e 100644
> --- a/docs/devel/qapi-code-gen.rst
> +++ b/docs/devel/qapi-code-gen.rst
> @@ -859,9 +859,9 @@ longhand form of MEMBER.
>  Example: a struct type with unconditional member 'foo' and conditional
>  member 'bar' ::
>
> - { 'struct': 'IfStruct', 'data':
> -   { 'foo': 'int',
> -     'bar': { 'type': 'int', 'if': 'IFCOND'} } }
> + { 'struct': 'IfStruct',
> +   'data': { 'foo': 'int',
> +             'bar': { 'type': 'int', 'if': 'IFCOND'} } }
>
>  A union's discriminator may not be conditional.
>
> @@ -871,9 +871,9 @@ the longhand form of ENUM-VALUE_.
>  Example: an enum type with unconditional value 'foo' and conditional
>  value 'bar' ::
>
> - { 'enum': 'IfEnum', 'data':
> -   [ 'foo',
> -     { 'name' : 'bar', 'if': 'IFCOND' } ] }
> + { 'enum': 'IfEnum',
> +   'data': [ 'foo',
> +             { 'name' : 'bar', 'if': 'IFCOND' } ] }
>
>  Likewise, features can be conditional.  This requires the longhand
>  form of FEATURE_.
> diff --git a/tests/qapi-schema/doc-good.json
> b/tests/qapi-schema/doc-good.json
> index e0027e4cf6..cbf5c56c4b 100644
> --- a/tests/qapi-schema/doc-good.json
> +++ b/tests/qapi-schema/doc-good.json
> @@ -60,8 +60,8 @@
>  #
>  # @two is undocumented
>  ##
> -{ 'enum': 'Enum', 'data':
> -  [ { 'name': 'one', 'if': 'IFONE' }, 'two' ],
> +{ 'enum': 'Enum',
> +  'data': [ { 'name': 'one', 'if': 'IFONE' }, 'two' ],
>    'features': [ 'enum-feat' ],
>    'if': 'IFCOND' }
>
> diff --git a/tests/qapi-schema/enum-if-invalid.json
> b/tests/qapi-schema/enum-if-invalid.json
> index 60bd0ef1d7..6bd20041f3 100644
> --- a/tests/qapi-schema/enum-if-invalid.json
> +++ b/tests/qapi-schema/enum-if-invalid.json
> @@ -1,3 +1,3 @@
>  # check invalid 'if' type
> -{ 'enum': 'TestIfEnum', 'data':
> -  [ 'foo', { 'name' : 'bar', 'if': { 'val': 'foo' } } ] }
> +{ 'enum': 'TestIfEnum',
> +  'data': [ 'foo', { 'name' : 'bar', 'if': { 'val': 'foo' } } ] }
> diff --git a/tests/qapi-schema/qapi-schema-test.json
> b/tests/qapi-schema/qapi-schema-test.json
> index b6c36a9eee..3c43e14e22 100644
> --- a/tests/qapi-schema/qapi-schema-test.json
> +++ b/tests/qapi-schema/qapi-schema-test.json
> @@ -220,27 +220,27 @@
>
>  # test 'if' condition handling
>
> -{ 'struct': 'TestIfStruct', 'data':
> -  { 'foo': 'int',
> -    'bar': { 'type': 'int', 'if': 'TEST_IF_STRUCT_BAR'} },
> +{ 'struct': 'TestIfStruct',
> +  'data': { 'foo': 'int',
> +            'bar': { 'type': 'int', 'if': 'TEST_IF_STRUCT_BAR'} },
>    'if': 'TEST_IF_STRUCT' }
>
> -{ 'enum': 'TestIfEnum', 'data':
> -  [ 'foo', { 'name' : 'bar', 'if': 'TEST_IF_ENUM_BAR' } ],
> +{ 'enum': 'TestIfEnum',
> +  'data': [ 'foo', { 'name' : 'bar', 'if': 'TEST_IF_ENUM_BAR' } ],
>    'if': 'TEST_IF_ENUM' }
>
> -{ 'union': 'TestIfUnion', 'data':
> -  { 'foo': 'TestStruct',
> -    'bar': { 'type': 'str', 'if': 'TEST_IF_UNION_BAR'} },
> +{ 'union': 'TestIfUnion',
> +  'data': { 'foo': 'TestStruct',
> +            'bar': { 'type': 'str', 'if': 'TEST_IF_UNION_BAR'} },
>    'if': { 'all': ['TEST_IF_UNION', 'TEST_IF_STRUCT'] } }
>
>  { 'command': 'test-if-union-cmd',
>    'data': { 'union-cmd-arg': 'TestIfUnion' },
>    'if': { 'all': ['TEST_IF_UNION', 'TEST_IF_STRUCT'] } }
>
> -{ 'alternate': 'TestIfAlternate', 'data':
> -  { 'foo': 'int',
> -    'bar': { 'type': 'TestStruct', 'if': 'TEST_IF_ALT_BAR'} },
> +{ 'alternate': 'TestIfAlternate',
> +  'data': { 'foo': 'int',
> +            'bar': { 'type': 'TestStruct', 'if': 'TEST_IF_ALT_BAR'} },
>    'if': { 'all': ['TEST_IF_ALT', 'TEST_IF_STRUCT'] } }
>
>  { 'command': 'test-if-alternate-cmd',
> @@ -256,9 +256,9 @@
>
>  { 'command': 'test-cmd-return-def-three', 'returns': 'UserDefThree' }
>
> -{ 'event': 'TEST_IF_EVENT', 'data':
> -  { 'foo': 'TestIfStruct',
> -    'bar': { 'type': ['TestIfEnum'], 'if': 'TEST_IF_EVT_BAR' } },
> +{ 'event': 'TEST_IF_EVENT',
> +  'data': { 'foo': 'TestIfStruct',
> +            'bar': { 'type': ['TestIfEnum'], 'if': 'TEST_IF_EVT_BAR' } }=
,
>    'if': { 'all': ['TEST_IF_EVT', 'TEST_IF_STRUCT'] } }
>
>  { 'event': 'TEST_IF_EVENT2', 'data': {},
> --
> 2.31.1
>
>

--0000000000007857a705cbe075bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 13, 2021 at 4:39 PM Mar=
kus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Br=
eak lines between members instead of within members.<br>
<br>
Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" t=
arget=3D"_blank">armbru@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com">marcandre.lureau@redhat.com</a>&gt;<br></div><div><br></div=
><div>I wish we would just automated tools to format files. With that git 2=
.23 feature, no more excuses :):<br></div><div><a href=3D"https://www.moxio=
.com/blog/43/ignoring-bulk-change-commits-with-git-blame">https://www.moxio=
.com/blog/43/ignoring-bulk-change-commits-with-git-blame</a></div><div><br>=
 </div><div>Sadly, our mixed json/py format doesn&#39;t get parsed after &q=
uot;blake&quot; reformats it (strings or trailing commas).<br></div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0docs/devel/qapi-code-gen.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 12 +++++------<br>
=C2=A0tests/qapi-schema/doc-good.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 4 ++--<br>
=C2=A0tests/qapi-schema/enum-if-invalid.json=C2=A0 |=C2=A0 4 ++--<br>
=C2=A0tests/qapi-schema/qapi-schema-test.json | 28 ++++++++++++------------=
-<br>
=C2=A04 files changed, 24 insertions(+), 24 deletions(-)<br>
<br>
diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst<br=
>
index ced7a5ffe1..b154eae82e 100644<br>
--- a/docs/devel/qapi-code-gen.rst<br>
+++ b/docs/devel/qapi-code-gen.rst<br>
@@ -859,9 +859,9 @@ longhand form of MEMBER.<br>
=C2=A0Example: a struct type with unconditional member &#39;foo&#39; and co=
nditional<br>
=C2=A0member &#39;bar&#39; ::<br>
<br>
- { &#39;struct&#39;: &#39;IfStruct&#39;, &#39;data&#39;:<br>
-=C2=A0 =C2=A0{ &#39;foo&#39;: &#39;int&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0&#39;bar&#39;: { &#39;type&#39;: &#39;int&#39;, &#39;i=
f&#39;: &#39;IFCOND&#39;} } }<br>
+ { &#39;struct&#39;: &#39;IfStruct&#39;,<br>
+=C2=A0 =C2=A0&#39;data&#39;: { &#39;foo&#39;: &#39;int&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;bar&#39;: { &#39;type=
&#39;: &#39;int&#39;, &#39;if&#39;: &#39;IFCOND&#39;} } }<br>
<br>
=C2=A0A union&#39;s discriminator may not be conditional.<br>
<br>
@@ -871,9 +871,9 @@ the longhand form of ENUM-VALUE_.<br>
=C2=A0Example: an enum type with unconditional value &#39;foo&#39; and cond=
itional<br>
=C2=A0value &#39;bar&#39; ::<br>
<br>
- { &#39;enum&#39;: &#39;IfEnum&#39;, &#39;data&#39;:<br>
-=C2=A0 =C2=A0[ &#39;foo&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0{ &#39;name&#39; : &#39;bar&#39;, &#39;if&#39;: &#39;I=
FCOND&#39; } ] }<br>
+ { &#39;enum&#39;: &#39;IfEnum&#39;,<br>
+=C2=A0 =C2=A0&#39;data&#39;: [ &#39;foo&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &#39;name&#39; : &#39;ba=
r&#39;, &#39;if&#39;: &#39;IFCOND&#39; } ] }<br>
<br>
=C2=A0Likewise, features can be conditional.=C2=A0 This requires the longha=
nd<br>
=C2=A0form of FEATURE_.<br>
diff --git a/tests/qapi-schema/doc-good.json b/tests/qapi-schema/doc-good.j=
son<br>
index e0027e4cf6..cbf5c56c4b 100644<br>
--- a/tests/qapi-schema/doc-good.json<br>
+++ b/tests/qapi-schema/doc-good.json<br>
@@ -60,8 +60,8 @@<br>
=C2=A0#<br>
=C2=A0# @two is undocumented<br>
=C2=A0##<br>
-{ &#39;enum&#39;: &#39;Enum&#39;, &#39;data&#39;:<br>
-=C2=A0 [ { &#39;name&#39;: &#39;one&#39;, &#39;if&#39;: &#39;IFONE&#39; },=
 &#39;two&#39; ],<br>
+{ &#39;enum&#39;: &#39;Enum&#39;,<br>
+=C2=A0 &#39;data&#39;: [ { &#39;name&#39;: &#39;one&#39;, &#39;if&#39;: &#=
39;IFONE&#39; }, &#39;two&#39; ],<br>
=C2=A0 =C2=A0&#39;features&#39;: [ &#39;enum-feat&#39; ],<br>
=C2=A0 =C2=A0&#39;if&#39;: &#39;IFCOND&#39; }<br>
<br>
diff --git a/tests/qapi-schema/enum-if-invalid.json b/tests/qapi-schema/enu=
m-if-invalid.json<br>
index 60bd0ef1d7..6bd20041f3 100644<br>
--- a/tests/qapi-schema/enum-if-invalid.json<br>
+++ b/tests/qapi-schema/enum-if-invalid.json<br>
@@ -1,3 +1,3 @@<br>
=C2=A0# check invalid &#39;if&#39; type<br>
-{ &#39;enum&#39;: &#39;TestIfEnum&#39;, &#39;data&#39;:<br>
-=C2=A0 [ &#39;foo&#39;, { &#39;name&#39; : &#39;bar&#39;, &#39;if&#39;: { =
&#39;val&#39;: &#39;foo&#39; } } ] }<br>
+{ &#39;enum&#39;: &#39;TestIfEnum&#39;,<br>
+=C2=A0 &#39;data&#39;: [ &#39;foo&#39;, { &#39;name&#39; : &#39;bar&#39;, =
&#39;if&#39;: { &#39;val&#39;: &#39;foo&#39; } } ] }<br>
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qa=
pi-schema-test.json<br>
index b6c36a9eee..3c43e14e22 100644<br>
--- a/tests/qapi-schema/qapi-schema-test.json<br>
+++ b/tests/qapi-schema/qapi-schema-test.json<br>
@@ -220,27 +220,27 @@<br>
<br>
=C2=A0# test &#39;if&#39; condition handling<br>
<br>
-{ &#39;struct&#39;: &#39;TestIfStruct&#39;, &#39;data&#39;:<br>
-=C2=A0 { &#39;foo&#39;: &#39;int&#39;,<br>
-=C2=A0 =C2=A0 &#39;bar&#39;: { &#39;type&#39;: &#39;int&#39;, &#39;if&#39;=
: &#39;TEST_IF_STRUCT_BAR&#39;} },<br>
+{ &#39;struct&#39;: &#39;TestIfStruct&#39;,<br>
+=C2=A0 &#39;data&#39;: { &#39;foo&#39;: &#39;int&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;bar&#39;: { &#39;type&#39;:=
 &#39;int&#39;, &#39;if&#39;: &#39;TEST_IF_STRUCT_BAR&#39;} },<br>
=C2=A0 =C2=A0&#39;if&#39;: &#39;TEST_IF_STRUCT&#39; }<br>
<br>
-{ &#39;enum&#39;: &#39;TestIfEnum&#39;, &#39;data&#39;:<br>
-=C2=A0 [ &#39;foo&#39;, { &#39;name&#39; : &#39;bar&#39;, &#39;if&#39;: &#=
39;TEST_IF_ENUM_BAR&#39; } ],<br>
+{ &#39;enum&#39;: &#39;TestIfEnum&#39;,<br>
+=C2=A0 &#39;data&#39;: [ &#39;foo&#39;, { &#39;name&#39; : &#39;bar&#39;, =
&#39;if&#39;: &#39;TEST_IF_ENUM_BAR&#39; } ],<br>
=C2=A0 =C2=A0&#39;if&#39;: &#39;TEST_IF_ENUM&#39; }<br>
<br>
-{ &#39;union&#39;: &#39;TestIfUnion&#39;, &#39;data&#39;:<br>
-=C2=A0 { &#39;foo&#39;: &#39;TestStruct&#39;,<br>
-=C2=A0 =C2=A0 &#39;bar&#39;: { &#39;type&#39;: &#39;str&#39;, &#39;if&#39;=
: &#39;TEST_IF_UNION_BAR&#39;} },<br>
+{ &#39;union&#39;: &#39;TestIfUnion&#39;,<br>
+=C2=A0 &#39;data&#39;: { &#39;foo&#39;: &#39;TestStruct&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;bar&#39;: { &#39;type&#39;:=
 &#39;str&#39;, &#39;if&#39;: &#39;TEST_IF_UNION_BAR&#39;} },<br>
=C2=A0 =C2=A0&#39;if&#39;: { &#39;all&#39;: [&#39;TEST_IF_UNION&#39;, &#39;=
TEST_IF_STRUCT&#39;] } }<br>
<br>
=C2=A0{ &#39;command&#39;: &#39;test-if-union-cmd&#39;,<br>
=C2=A0 =C2=A0&#39;data&#39;: { &#39;union-cmd-arg&#39;: &#39;TestIfUnion&#3=
9; },<br>
=C2=A0 =C2=A0&#39;if&#39;: { &#39;all&#39;: [&#39;TEST_IF_UNION&#39;, &#39;=
TEST_IF_STRUCT&#39;] } }<br>
<br>
-{ &#39;alternate&#39;: &#39;TestIfAlternate&#39;, &#39;data&#39;:<br>
-=C2=A0 { &#39;foo&#39;: &#39;int&#39;,<br>
-=C2=A0 =C2=A0 &#39;bar&#39;: { &#39;type&#39;: &#39;TestStruct&#39;, &#39;=
if&#39;: &#39;TEST_IF_ALT_BAR&#39;} },<br>
+{ &#39;alternate&#39;: &#39;TestIfAlternate&#39;,<br>
+=C2=A0 &#39;data&#39;: { &#39;foo&#39;: &#39;int&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;bar&#39;: { &#39;type&#39;:=
 &#39;TestStruct&#39;, &#39;if&#39;: &#39;TEST_IF_ALT_BAR&#39;} },<br>
=C2=A0 =C2=A0&#39;if&#39;: { &#39;all&#39;: [&#39;TEST_IF_ALT&#39;, &#39;TE=
ST_IF_STRUCT&#39;] } }<br>
<br>
=C2=A0{ &#39;command&#39;: &#39;test-if-alternate-cmd&#39;,<br>
@@ -256,9 +256,9 @@<br>
<br>
=C2=A0{ &#39;command&#39;: &#39;test-cmd-return-def-three&#39;, &#39;return=
s&#39;: &#39;UserDefThree&#39; }<br>
<br>
-{ &#39;event&#39;: &#39;TEST_IF_EVENT&#39;, &#39;data&#39;:<br>
-=C2=A0 { &#39;foo&#39;: &#39;TestIfStruct&#39;,<br>
-=C2=A0 =C2=A0 &#39;bar&#39;: { &#39;type&#39;: [&#39;TestIfEnum&#39;], &#3=
9;if&#39;: &#39;TEST_IF_EVT_BAR&#39; } },<br>
+{ &#39;event&#39;: &#39;TEST_IF_EVENT&#39;,<br>
+=C2=A0 &#39;data&#39;: { &#39;foo&#39;: &#39;TestIfStruct&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;bar&#39;: { &#39;type&#39;:=
 [&#39;TestIfEnum&#39;], &#39;if&#39;: &#39;TEST_IF_EVT_BAR&#39; } },<br>
=C2=A0 =C2=A0&#39;if&#39;: { &#39;all&#39;: [&#39;TEST_IF_EVT&#39;, &#39;TE=
ST_IF_STRUCT&#39;] } }<br>
<br>
=C2=A0{ &#39;event&#39;: &#39;TEST_IF_EVENT2&#39;, &#39;data&#39;: {},<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--0000000000007857a705cbe075bf--


