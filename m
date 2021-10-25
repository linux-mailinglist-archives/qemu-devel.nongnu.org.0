Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8952443A1DD
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 21:41:31 +0200 (CEST)
Received: from localhost ([::1]:58214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf5qc-0007rV-L9
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 15:41:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mf5m8-0001VX-8t
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 15:36:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mf5m5-0003aa-Qh
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 15:36:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635190609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uX+goL07w3axmSPkvgVSXdozPc5tYbISgpU5BnA8V5g=;
 b=J1F6QwV7xyrCVs6l+OExWGEo24fd0qZe1qLNDuVERbwnaRJ+Dzm15wlOA/K7kQAlgr/Rrz
 BTl+cnEM0eF0oGPj6HBu+kZYlDsLGvdqTjX7zLpqnJ8uVpZF2WYPmLdkuKuEe6miPQ9W4y
 ZGbp4YZNTOtYwDIlrgdFlli/f/F1jwI=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-dJUB7i8aONO9VnnDgvWoUA-1; Mon, 25 Oct 2021 15:36:42 -0400
X-MC-Unique: dJUB7i8aONO9VnnDgvWoUA-1
Received: by mail-ua1-f71.google.com with SMTP id
 m2-20020a9f3fc2000000b002cb74488fdaso4225788uaj.18
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 12:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uX+goL07w3axmSPkvgVSXdozPc5tYbISgpU5BnA8V5g=;
 b=CQTTmX5LibgupW+QycgrOFszydJEdIBojhqnt8GdrOjB+Vd6EakinC4UqAvemdIh1w
 ndVLp7nq0N4738fXCxFERswaC/3nnk7JTIvWwZQnSb/Cw73nHeEIYNL0ExsEpWfnQmdl
 TIjuNVQf9b9YUahCMd0YPCavQpJautfGZNGmpSvsgys1edIA4QojoP20+SGgVqOueDJ5
 NBIFrQEotyFgugJ/+9/330el+9D5tB4nAuqAZV2nKcSnV95Hk5QJlaalim0kYBD3a30a
 qDDlaazh+pVC0xkK0Zc/VNrValuWERQKxw1iLCle+fBcrm5yoyOpzQ/eiubqnsfcThm/
 F2jg==
X-Gm-Message-State: AOAM531HpOzLcWApxYwqh5StbtYx9Cpsx0O4lL8S8v/YLZDOZYOi0ydE
 LQSIEy0I71S0iRByES37ujCG56TDcqNJ9Shga4Tar0/tAanAljguKy8BkPkh6X9f3xubJ0qhMA0
 feWi2h5vTQl8HXQHz+3zV72R0d+Cst6Q=
X-Received: by 2002:a05:6102:390b:: with SMTP id
 e11mr606517vsu.27.1635190601877; 
 Mon, 25 Oct 2021 12:36:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTQwaIyAx9u1m0UK5fRFp763ihJDgexO417vb1HPxPk728iicQW3yP34p+bVoWfqqwoGVX6sr/rqNZjEbZ1bw=
X-Received: by 2002:a05:6102:390b:: with SMTP id
 e11mr606478vsu.27.1635190601659; 
 Mon, 25 Oct 2021 12:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-8-armbru@redhat.com>
In-Reply-To: <20211025052532.3859634-8-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 25 Oct 2021 15:36:31 -0400
Message-ID: <CAFn=p-aCMCzDoA_Q54j85Lz=TEnLEVn-h-YeHS0EtWdA12fRDw@mail.gmail.com>
Subject: Re: [PATCH 7/9] qapi: Generalize enum member policy checking
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f3ccb505cf327ac0"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, pkrempa@redhat.com,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 libvir-list@redhat.com, qemu-devel <qemu-devel@nongnu.org>,
 mdroth@linux.vnet.ibm.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f3ccb505cf327ac0
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 25, 2021 at 1:26 AM Markus Armbruster <armbru@redhat.com> wrote:

> The code to check enumeration value policy can see special feature
> flag 'deprecated' in QEnumLookup member flags[value].  I want to make
> feature flag 'unstable' visible there as well, so I can add policy for
> it.
>
> Instead of extending flags[], replace it by @special_features (a
> bitset of QapiSpecialFeature), because that's how special features get
> passed around elsewhere.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  include/qapi/util.h    |  5 +----
>  qapi/qapi-visit-core.c |  3 ++-
>  scripts/qapi/types.py  | 22 ++++++++++++----------
>  3 files changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/include/qapi/util.h b/include/qapi/util.h
> index 7a8d5c7d72..0cc98db9f9 100644
> --- a/include/qapi/util.h
> +++ b/include/qapi/util.h
> @@ -15,12 +15,9 @@ typedef enum {
>      QAPI_DEPRECATED,
>  } QapiSpecialFeature;
>
> -/* QEnumLookup flags */
> -#define QAPI_ENUM_DEPRECATED 1
> -
>  typedef struct QEnumLookup {
>      const char *const *array;
> -    const unsigned char *const flags;
> +    const unsigned char *const special_features;
>      const int size;
>  } QEnumLookup;
>
> diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c
> index b4a81f1757..5572d90efb 100644
> --- a/qapi/qapi-visit-core.c
> +++ b/qapi/qapi-visit-core.c
> @@ -407,7 +407,8 @@ static bool input_type_enum(Visitor *v, const char
> *name, int *obj,
>          return false;
>      }
>
> -    if (lookup->flags && (lookup->flags[value] & QAPI_ENUM_DEPRECATED)) {
> +    if (lookup->special_features
> +        && (lookup->special_features[value] & QAPI_DEPRECATED)) {
>          switch (v->compat_policy.deprecated_input) {
>          case COMPAT_POLICY_INPUT_ACCEPT:
>              break;
> diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
> index ab2441adc9..3013329c24 100644
> --- a/scripts/qapi/types.py
> +++ b/scripts/qapi/types.py
> @@ -16,7 +16,7 @@
>  from typing import List, Optional
>
>  from .common import c_enum_const, c_name, mcgen
> -from .gen import QAPISchemaModularCVisitor, ifcontext
> +from .gen import QAPISchemaModularCVisitor, gen_special_features,
> ifcontext
>  from .schema import (
>      QAPISchema,
>      QAPISchemaEnumMember,
> @@ -39,7 +39,7 @@ def gen_enum_lookup(name: str,
>                      members: List[QAPISchemaEnumMember],
>                      prefix: Optional[str] = None) -> str:
>      max_index = c_enum_const(name, '_MAX', prefix)
> -    flags = ''
> +    feats = ''
>      ret = mcgen('''
>
>  const QEnumLookup %(c_name)s_lookup = {
> @@ -54,19 +54,21 @@ def gen_enum_lookup(name: str,
>  ''',
>                       index=index, name=memb.name)
>          ret += memb.ifcond.gen_endif()
> -        if 'deprecated' in (f.name for f in memb.features):
> -            flags += mcgen('''
> -        [%(index)s] = QAPI_ENUM_DEPRECATED,
> -''',
> -                           index=index)
>
> -    if flags:
> +        special_features = gen_special_features(memb.features)
> +        if special_features != '0':
>

Though, I have to admit the common reoccurrence of this pattern suggests to
me that gen_special_features really ought to be returning something false-y
in these cases. Something about testing for the empty case with something
that represents, but isn't empty, gives me a brief pause.

Not willing to wage war over it.


> +            feats += mcgen('''
> +        [%(index)s] = %(special_features)s,
> +''',
> +                           index=index, special_features=special_features)
> +
> +    if feats:
>          ret += mcgen('''
>      },
> -    .flags = (const unsigned char[%(max_index)s]) {
> +    .special_features = (const unsigned char[%(max_index)s]) {
>  ''',
>                       max_index=max_index)
> -        ret += flags
> +        ret += feats
>
>      ret += mcgen('''
>      },
> --
> 2.31.1
>
>
Python bits: Acked-by: John Snow <jsnow@redhat.com>

--000000000000f3ccb505cf327ac0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 25, 2021 at 1:26 AM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The =
code to check enumeration value policy can see special feature<br>
flag &#39;deprecated&#39; in QEnumLookup member flags[value].=C2=A0 I want =
to make<br>
feature flag &#39;unstable&#39; visible there as well, so I can add policy =
for<br>
it.<br>
<br>
Instead of extending flags[], replace it by @special_features (a<br>
bitset of QapiSpecialFeature), because that&#39;s how special features get<=
br>
passed around elsewhere.<br>
<br>
Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" t=
arget=3D"_blank">armbru@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/qapi/util.h=C2=A0 =C2=A0 |=C2=A0 5 +----<br>
=C2=A0qapi/qapi-visit-core.c |=C2=A0 3 ++-<br>
=C2=A0scripts/qapi/types.py=C2=A0 | 22 ++++++++++++----------<br>
=C2=A03 files changed, 15 insertions(+), 15 deletions(-)<br>
<br>
diff --git a/include/qapi/util.h b/include/qapi/util.h<br>
index 7a8d5c7d72..0cc98db9f9 100644<br>
--- a/include/qapi/util.h<br>
+++ b/include/qapi/util.h<br>
@@ -15,12 +15,9 @@ typedef enum {<br>
=C2=A0 =C2=A0 =C2=A0QAPI_DEPRECATED,<br>
=C2=A0} QapiSpecialFeature;<br>
<br>
-/* QEnumLookup flags */<br>
-#define QAPI_ENUM_DEPRECATED 1<br>
-<br>
=C2=A0typedef struct QEnumLookup {<br>
=C2=A0 =C2=A0 =C2=A0const char *const *array;<br>
-=C2=A0 =C2=A0 const unsigned char *const flags;<br>
+=C2=A0 =C2=A0 const unsigned char *const special_features;<br>
=C2=A0 =C2=A0 =C2=A0const int size;<br>
=C2=A0} QEnumLookup;<br>
<br>
diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c<br>
index b4a81f1757..5572d90efb 100644<br>
--- a/qapi/qapi-visit-core.c<br>
+++ b/qapi/qapi-visit-core.c<br>
@@ -407,7 +407,8 @@ static bool input_type_enum(Visitor *v, const char *nam=
e, int *obj,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (lookup-&gt;flags &amp;&amp; (lookup-&gt;flags[value] &am=
p; QAPI_ENUM_DEPRECATED)) {<br>
+=C2=A0 =C2=A0 if (lookup-&gt;special_features<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (lookup-&gt;special_features[value]=
 &amp; QAPI_DEPRECATED)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (v-&gt;compat_policy.deprecated_in=
put) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case COMPAT_POLICY_INPUT_ACCEPT:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py<br>
index ab2441adc9..3013329c24 100644<br>
--- a/scripts/qapi/types.py<br>
+++ b/scripts/qapi/types.py<br>
@@ -16,7 +16,7 @@<br>
=C2=A0from typing import List, Optional<br>
<br>
=C2=A0from .common import c_enum_const, c_name, mcgen<br>
-from .gen import QAPISchemaModularCVisitor, ifcontext<br>
+from .gen import QAPISchemaModularCVisitor, gen_special_features, ifcontex=
t<br>
=C2=A0from .schema import (<br>
=C2=A0 =C2=A0 =C2=A0QAPISchema,<br>
=C2=A0 =C2=A0 =C2=A0QAPISchemaEnumMember,<br>
@@ -39,7 +39,7 @@ def gen_enum_lookup(name: str,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0members: List[QAPISchemaEnumMember],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0prefix: Optional[str] =3D None) -&gt; str:<br>
=C2=A0 =C2=A0 =C2=A0max_index =3D c_enum_const(name, &#39;_MAX&#39;, prefix=
)<br>
-=C2=A0 =C2=A0 flags =3D &#39;&#39;<br>
+=C2=A0 =C2=A0 feats =3D &#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0ret =3D mcgen(&#39;&#39;&#39;<br>
<br>
=C2=A0const QEnumLookup %(c_name)s_lookup =3D {<br>
@@ -54,19 +54,21 @@ def gen_enum_lookup(name: str,<br>
=C2=A0&#39;&#39;&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 index=3Dindex, name=3D<a href=3D"http://memb.name" rel=3D"noreferrer" t=
arget=3D"_blank">memb.name</a>)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret +=3D memb.ifcond.gen_endif()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;deprecated&#39; in (<a href=3D"http://=
f.name" rel=3D"noreferrer" target=3D"_blank">f.name</a> for f in memb.featu=
res):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flags +=3D mcgen(&#39;&#39;&#39;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 [%(index)s] =3D QAPI_ENUM_DEPRECATED,<br>
-&#39;&#39;&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0index=3Dindex)<br>
<br>
-=C2=A0 =C2=A0 if flags:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 special_features =3D gen_special_features(memb=
.features)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if special_features !=3D &#39;0&#39;:<br></blo=
ckquote><div><br></div><div>Though, I have to admit the common reoccurrence=
 of this pattern suggests to me that gen_special_features really ought to b=
e returning something false-y in these cases. Something about testing for t=
he empty case with something that represents, but isn&#39;t empty, gives me=
 a brief pause.</div><div><br></div><div>Not willing to wage war over it.<b=
r></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 feats +=3D mcgen(&#39;&#39;&#39;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [%(index)s] =3D %(special_features)s,<br>
+&#39;&#39;&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0index=3Dindex, special_features=3Dspecial_features)=
<br>
+<br>
+=C2=A0 =C2=A0 if feats:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret +=3D mcgen(&#39;&#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0},<br>
-=C2=A0 =C2=A0 .flags =3D (const unsigned char[%(max_index)s]) {<br>
+=C2=A0 =C2=A0 .special_features =3D (const unsigned char[%(max_index)s]) {=
<br>
=C2=A0&#39;&#39;&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 max_index=3Dmax_index)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D flags<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D feats<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret +=3D mcgen(&#39;&#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0},<br>
-- <br>
2.31.1<br>
<br></blockquote><div><br></div><div>Python bits: Acked-by: John Snow &lt;<=
a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt;</div><div> <br>=
</div></div></div>

--000000000000f3ccb505cf327ac0--


