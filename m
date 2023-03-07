Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F202B6AE016
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 14:13:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZX6v-0000ce-7E; Tue, 07 Mar 2023 08:12:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pZX6s-0000Tw-GX
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:12:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pZX6q-00007h-EF
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:12:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678194718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tkTTxKFEpfd0kOfxyKbthvzWE8ubErHiMsbAnuW2qPU=;
 b=An6NABJYo1pI9rQnvgvBKZGLhJpvriofZ5eu4HR24ia5QR4xjC8k++lfqTw/g09wGov5wD
 jZJhIcgGwlRUML0eWrtfb1ALcgedb1PcTUl6J07Z6NqDRFYUbM18dYl+cEDMPYXCNGb68I
 mrIRdpvFCU0zuWS1aVTZ8An7QCApcOY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-auZm9RAFOtSDIas07qGLbw-1; Tue, 07 Mar 2023 08:11:57 -0500
X-MC-Unique: auZm9RAFOtSDIas07qGLbw-1
Received: by mail-ed1-f71.google.com with SMTP id
 ec11-20020a0564020d4b00b004e2cb85c8bcso9795013edb.16
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 05:11:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678194716;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tkTTxKFEpfd0kOfxyKbthvzWE8ubErHiMsbAnuW2qPU=;
 b=2MZujEa6PZZJ1gWU7TvI7Pc0HtrR9qSrJvOKs3Rkb0NQYYZu4HmpmabQd3zxGarETW
 NOHTuoarpyjpC/RkG9lp7T/TLhYcj0Wtcx2xZ5t+r2WPpJHe/KhdrunBoe8Dm3NYrPZq
 j0RAwOqdsq9bvwChYEyD0GpgS2DGbfUAcbJamkevs/nmndbGK4HB+7ZyLW3z6P4aJIKF
 WeP7vraK4DNsvzjniHtamucfwGqRU2rmpx6x45kt/hqg5SvaeFS4PmnQvyFUqZIDkMNX
 A68yokVl0AkGsW0tmsUjMODQtyjlGiyTrMQb5IzJIYA61dK7YpUB47Pri0WYNGHjYQL+
 P8SA==
X-Gm-Message-State: AO0yUKVgZGqJYquB3JvtJYhpS9GKFLwDeSO0J2l1cjcHrAw5zo99dgEh
 byZpyPl4IFw84W9x4OfpczKBD2teb8UkDq2AVNit5fzmsXJSEng0LjNv6XvWwecOh50fsYjGzZ+
 IMYzjArtH/HVPi4uMkNAOes1mUOIXlsc=
X-Received: by 2002:a50:8e5d:0:b0:4c8:1fda:52fd with SMTP id
 29-20020a508e5d000000b004c81fda52fdmr8038148edx.8.1678194716298; 
 Tue, 07 Mar 2023 05:11:56 -0800 (PST)
X-Google-Smtp-Source: AK7set+5qc4G8hm6n8iSduaxPdhLnwMzYcf4PT84Oinhs+hEbxIxSlX1mdZc5FhOfi5G/OjDorGVIEFzwcwybjwbUIw=
X-Received: by 2002:a50:8e5d:0:b0:4c8:1fda:52fd with SMTP id
 29-20020a508e5d000000b004c81fda52fdmr8038137edx.8.1678194716056; Tue, 07 Mar
 2023 05:11:56 -0800 (PST)
MIME-Version: 1.0
References: <20230307112212.2437449-1-marcandre.lureau@redhat.com>
 <87ttyw91mw.fsf@pond.sub.org>
In-Reply-To: <87ttyw91mw.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 7 Mar 2023 17:11:44 +0400
Message-ID: <CAMxuvawaO1jzXQBqFONuu8OfXovGgjAoOfirU1-GB_F=R++9Jg@mail.gmail.com>
Subject: Re: [PATCH] qapi: give available enum values in error string
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>
Content-Type: multipart/alternative; boundary="000000000000ea382f05f64f27ac"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000ea382f05f64f27ac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Mar 7, 2023 at 4:39=E2=80=AFPM Markus Armbruster <armbru@redhat.com=
> wrote:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > This allows for a more pleasant user experience.
> >
> > Before:
> > $ ./qemu-system-x86_64 -display egl-headless,gl=3D
> > qemu-system-x86_64: -display egl-headless,gl=3D: Parameter 'gl' does no=
t
> accept value ''
> >
> > After:
> > $ ./qemu-system-x86_64 -display egl-headless,gl=3D
> > qemu-system-x86_64: -display egl-headless,gl=3Dhelp: Parameter 'gl' doe=
s
> > not accept value '' (available: 'off', 'on', 'core', 'es')
>
> error.h recommends to user error_append_hint() for this:
>
>  * Create an error and add additional explanation:
>  *     error_setg(errp, "invalid quark");
>  *     error_append_hint(errp, "Valid quarks are up, down, strange, "
>  *                       "charm, top, bottom.\n");
>
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  include/qapi/util.h             |  1 +
> >  qapi/qapi-util.c                | 15 +++++++++++++++
> >  qapi/qapi-visit-core.c          |  7 +++++--
> >  tests/unit/check-qom-proplist.c |  4 ++--
> >  4 files changed, 23 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/qapi/util.h b/include/qapi/util.h
> > index 81a2b13a33..a5363e595d 100644
> > --- a/include/qapi/util.h
> > +++ b/include/qapi/util.h
> > @@ -23,6 +23,7 @@ typedef struct QEnumLookup {
> >  } QEnumLookup;
> >
> >  const char *qapi_enum_lookup(const QEnumLookup *lookup, int val);
> > +char *qapi_enum_available(const QEnumLookup *lookup);
> >  int qapi_enum_parse(const QEnumLookup *lookup, const char *buf,
> >                      int def, Error **errp);
> >  bool qapi_bool_parse(const char *name, const char *value, bool *obj,
> > diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
> > index 63596e11c5..19ba4b695a 100644
> > --- a/qapi/qapi-util.c
> > +++ b/qapi/qapi-util.c
> > @@ -84,6 +84,21 @@ int qapi_enum_parse(const QEnumLookup *lookup, const
> char *buf,
> >      return def;
> >  }
> >
> > +char *qapi_enum_available(const QEnumLookup *lookup)
> > +{
> > +    int i;
> > +    GString *str =3D g_string_new(NULL);
> > +
> > +    for (i =3D 0; i < lookup->size; i++) {
> > +        g_string_append_printf(str, "'%s'", lookup->array[i]);
> > +        if (i + 1 < lookup->size) {
> > +            g_string_append(str, ", ");
> > +        }
> > +    }
> > +
> > +    return g_string_free(str, FALSE);
> > +}
> > +
>
> If we use error_append_hint(), we can fold it into the reusable helper,
> and name the result error_append_qapi_enum_hint().  Easier to use than
> qapi_enum_available(), because the caller doesn't have to free anything.
>

Why not. That was not my first approach as it makes enumlookup->string
specific to Error, but if they are no other users, that's fair.


>
> >  bool qapi_bool_parse(const char *name, const char *value, bool *obj,
> Error **errp)
> >  {
> >      if (g_str_equal(value, "on") ||
> > diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c
> > index 6c13510a2b..b887cbf3fd 100644
> > --- a/qapi/qapi-visit-core.c
> > +++ b/qapi/qapi-visit-core.c
> > @@ -404,8 +404,11 @@ static bool input_type_enum(Visitor *v, const char
> *name, int *obj,
> >
> >      value =3D qapi_enum_parse(lookup, enum_str, -1, NULL);
> >      if (value < 0) {
> > -        error_setg(errp, "Parameter '%s' does not accept value '%s'",
> > -                   name ? name : "null", enum_str);
> > +        g_autofree char *avail =3D NULL;
> > +
> > +        avail =3D qapi_enum_available(lookup);
> > +        error_setg(errp, "Parameter '%s' does not accept value '%s'
> (available: %s)",
> > +                   name ? name : "null", enum_str, avail);
> >          return false;
> >      }
> >
> > diff --git a/tests/unit/check-qom-proplist.c
> b/tests/unit/check-qom-proplist.c
> > index 79d4a8b89d..eb0b215abb 100644
> > --- a/tests/unit/check-qom-proplist.c
> > +++ b/tests/unit/check-qom-proplist.c
> > @@ -488,8 +488,8 @@ static void test_dummy_badenum(void)
> >
> >      g_assert(dobj =3D=3D NULL);
> >      g_assert(err !=3D NULL);
> > -    g_assert_cmpstr(error_get_pretty(err), =3D=3D,
> > -                    "Parameter 'av' does not accept value 'yeti'");
> > +    g_assert_nonnull(strstr(error_get_pretty(err),
> > +                            "Parameter 'av' does not accept value
> 'yeti'"));
> >
> >      g_assert(object_resolve_path_component(parent, "dummy0")
> >               =3D=3D NULL);
>
> No need to mess with the test then.
>
> What do you think?
>

We hit an interesting limit of the API though, because error_setg() with
&error_fatal will fail immediately before append_hint().

But we can work around it by using a ERRP_GUARD() !

sending v2

--000000000000ea382f05f64f27ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 7, 2023 at 4:39=E2=80=
=AFPM Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">mar=
candre.lureau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; This allows for a more pleasant user experience.<br>
&gt;<br>
&gt; Before:<br>
&gt; $ ./qemu-system-x86_64 -display egl-headless,gl=3D<br>
&gt; qemu-system-x86_64: -display egl-headless,gl=3D: Parameter &#39;gl&#39=
; does not accept value &#39;&#39;<br>
&gt;<br>
&gt; After:<br>
&gt; $ ./qemu-system-x86_64 -display egl-headless,gl=3D<br>
&gt; qemu-system-x86_64: -display egl-headless,gl=3Dhelp: Parameter &#39;gl=
&#39; does<br>
&gt; not accept value &#39;&#39; (available: &#39;off&#39;, &#39;on&#39;, &=
#39;core&#39;, &#39;es&#39;)<br>
<br>
error.h recommends to user error_append_hint() for this:<br>
<br>
=C2=A0* Create an error and add additional explanation:<br>
=C2=A0*=C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;invalid quark&quot;);<br>
=C2=A0*=C2=A0 =C2=A0 =C2=A0error_append_hint(errp, &quot;Valid quarks are u=
p, down, strange, &quot;<br>
=C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;charm, top, bottom.\n&quot;);<br>
<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 include/qapi/util.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 1 +<br>
&gt;=C2=A0 qapi/qapi-util.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 15 +++++++++++++++<br>
&gt;=C2=A0 qapi/qapi-visit-core.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 7 +++++--<br>
&gt;=C2=A0 tests/unit/check-qom-proplist.c |=C2=A0 4 ++--<br>
&gt;=C2=A0 4 files changed, 23 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/include/qapi/util.h b/include/qapi/util.h<br>
&gt; index 81a2b13a33..a5363e595d 100644<br>
&gt; --- a/include/qapi/util.h<br>
&gt; +++ b/include/qapi/util.h<br>
&gt; @@ -23,6 +23,7 @@ typedef struct QEnumLookup {<br>
&gt;=C2=A0 } QEnumLookup;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 const char *qapi_enum_lookup(const QEnumLookup *lookup, int val)=
;<br>
&gt; +char *qapi_enum_available(const QEnumLookup *lookup);<br>
&gt;=C2=A0 int qapi_enum_parse(const QEnumLookup *lookup, const char *buf,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 int def, Error **errp);<br>
&gt;=C2=A0 bool qapi_bool_parse(const char *name, const char *value, bool *=
obj,<br>
&gt; diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c<br>
&gt; index 63596e11c5..19ba4b695a 100644<br>
&gt; --- a/qapi/qapi-util.c<br>
&gt; +++ b/qapi/qapi-util.c<br>
&gt; @@ -84,6 +84,21 @@ int qapi_enum_parse(const QEnumLookup *lookup, cons=
t char *buf,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return def;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +char *qapi_enum_available(const QEnumLookup *lookup)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int i;<br>
&gt; +=C2=A0 =C2=A0 GString *str =3D g_string_new(NULL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; lookup-&gt;size; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_string_append_printf(str, &quot;&#39;%s=
&#39;&quot;, lookup-&gt;array[i]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i + 1 &lt; lookup-&gt;size) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_string_append(str, &quot;=
, &quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return g_string_free(str, FALSE);<br>
&gt; +}<br>
&gt; +<br>
<br>
If we use error_append_hint(), we can fold it into the reusable helper,<br>
and name the result error_append_qapi_enum_hint().=C2=A0 Easier to use than=
<br>
qapi_enum_available(), because the caller doesn&#39;t have to free anything=
.<br></blockquote><div><br></div><div>Why not. That was not my first approa=
ch as it makes enumlookup-&gt;string specific to Error, but if they are no =
other users, that&#39;s fair.<br></div><div>=C2=A0<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 bool qapi_bool_parse(const char *name, const char *value, bool *=
obj, Error **errp)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (g_str_equal(value, &quot;on&quot;) ||<br>
&gt; diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c<br>
&gt; index 6c13510a2b..b887cbf3fd 100644<br>
&gt; --- a/qapi/qapi-visit-core.c<br>
&gt; +++ b/qapi/qapi-visit-core.c<br>
&gt; @@ -404,8 +404,11 @@ static bool input_type_enum(Visitor *v, const cha=
r *name, int *obj,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 value =3D qapi_enum_parse(lookup, enum_str, -1, NU=
LL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (value &lt; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Parameter &#39;%s&=
#39; does not accept value &#39;%s&#39;&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
name ? name : &quot;null&quot;, enum_str);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autofree char *avail =3D NULL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 avail =3D qapi_enum_available(lookup);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Parameter &#39;%s&=
#39; does not accept value &#39;%s&#39; (available: %s)&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
name ? name : &quot;null&quot;, enum_str, avail);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; diff --git a/tests/unit/check-qom-proplist.c b/tests/unit/check-qom-pr=
oplist.c<br>
&gt; index 79d4a8b89d..eb0b215abb 100644<br>
&gt; --- a/tests/unit/check-qom-proplist.c<br>
&gt; +++ b/tests/unit/check-qom-proplist.c<br>
&gt; @@ -488,8 +488,8 @@ static void test_dummy_badenum(void)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_assert(dobj =3D=3D NULL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_assert(err !=3D NULL);<br>
&gt; -=C2=A0 =C2=A0 g_assert_cmpstr(error_get_pretty(err), =3D=3D,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot;Parameter &#39;av&#39; does not accept value &#39;yeti&#39;&quot;);<=
br>
&gt; +=C2=A0 =C2=A0 g_assert_nonnull(strstr(error_get_pretty(err),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Parameter &#39;av&#39; does not accept v=
alue &#39;yeti&#39;&quot;));<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_assert(object_resolve_path_component(parent, &qu=
ot;dummy0&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=3D NULL);<br=
>
<br>
No need to mess with the test then.<br>
<br>
What do you think?<br></blockquote><div><br></div><div>We hit an interestin=
g limit of the API though, because error_setg() with &amp;error_fatal will =
fail immediately before append_hint().</div><div>=C2=A0</div><div>But we ca=
n work around it by using a ERRP_GUARD() !</div><div><br></div><div>sending=
 v2<br></div></div></div>

--000000000000ea382f05f64f27ac--


