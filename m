Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2F1696A81
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:59:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRydF-0002Ug-Hs; Tue, 14 Feb 2023 11:58:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pRydD-0002PP-Ks
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:58:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pRydB-0006lR-IN
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:58:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676393892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xq+uErFB/thiNTVKnL6Tqjh9CZ3mVSivNi2p7d6ogmk=;
 b=RyDNPUZolLox/V6ZqL/PVtyvF+3m94RTrg4PqIybHov1uk9Wt24VRy7nQRXCB1BykJ6CqN
 /wJqmB3W0thGYPek3u1PzmfCrYFBh8sdPIpiGqZANtnkcPpLhe8nt46ZidoowlfMajCVaQ
 zhGehJk6RYLfHEqc+HbbWzAjEO5Q2/4=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-589-o4uhQBHEOmaVmPkYfEPxJg-1; Tue, 14 Feb 2023 11:58:11 -0500
X-MC-Unique: o4uhQBHEOmaVmPkYfEPxJg-1
Received: by mail-pg1-f197.google.com with SMTP id
 q130-20020a632a88000000b004a03cfb3ac6so6056768pgq.6
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 08:58:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xq+uErFB/thiNTVKnL6Tqjh9CZ3mVSivNi2p7d6ogmk=;
 b=wEfG2d8jEIIN231CTdCuan6g73aMDia0hbdHtpq/iUEY6I8euJAapeLJhqn7lHOelF
 JEWILN3uxxU6db/dOjnJ2utOSlNY7y3s1RNk3LaZwn74fcMqPjvGwVbX3tQx660fuRRn
 xFqvcofg+53dXV6KQK5LPAv/SWKTPf0+/qSghS9HjcW+R+R8xYskU36IyXsGXH9M78YQ
 PstQXsbJsjsVWMqNp6xMeUy8S143tZZvT0+AipmUeoDZSbEfXHpNVNauVyf4a9sBOuph
 L5lw1u+DXl+7NaJ8WFhwm+Theq7W70DDuDYIvbL6GIvCjKUbEGqfbY+9+4wCoN7dHe9J
 VLBw==
X-Gm-Message-State: AO0yUKU2PDrc+XbJH9tC4bqohReaIEN4tTF/g1dahhOhIaMGpGbIA9+u
 dKj/XJ9mVhz5QgKByh4bKa7duHPY4EdnjKo5c+jc/UiLESeiGkUNoTb34G/ZUkthOYYYjkZGOWG
 SeqV9McZGOc96su+ivRrdhul+UwmSH7s=
X-Received: by 2002:a63:8c54:0:b0:4f1:ccba:5bac with SMTP id
 q20-20020a638c54000000b004f1ccba5bacmr457328pgn.20.1676393889894; 
 Tue, 14 Feb 2023 08:58:09 -0800 (PST)
X-Google-Smtp-Source: AK7set+wSrzbiQtIE/Cv3mx0Sa/MdbkHAXu1ekQYCQVk9anOIFTA/89hG6YTin5AMDZ4woyoenjvduon8aVlpKGudr4=
X-Received: by 2002:a63:8c54:0:b0:4f1:ccba:5bac with SMTP id
 q20-20020a638c54000000b004f1ccba5bacmr457322pgn.20.1676393889555; Tue, 14 Feb
 2023 08:58:09 -0800 (PST)
MIME-Version: 1.0
References: <20230209184758.1017863-1-jsnow@redhat.com>
 <20230209184758.1017863-6-jsnow@redhat.com>
 <87fsbc4ry7.fsf@pond.sub.org>
In-Reply-To: <87fsbc4ry7.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Tue, 14 Feb 2023 11:57:58 -0500
Message-ID: <CAFn=p-a4styxnXB=rv8wF=OutCF7xt2ctR1zuzNjqf_pOp4dRA@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] qapi/parser: add QAPIExpression type
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>
Content-Type: multipart/alternative; boundary="0000000000004a7cbf05f4abde59"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

--0000000000004a7cbf05f4abde59
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 11, 2023, 1:49 AM Markus Armbruster <armbru@redhat.com> wrote:

> John Snow <jsnow@redhat.com> writes:
>
> > This patch creates a new type, QAPIExpression, which represents a parse=
d
> > expression complete with QAPIDoc and QAPISourceInfo.
> >
> > This patch turns parser.exprs into a list of QAPIExpression instead,
> > and adjusts expr.py to match.
> >
> > This allows the types we specify in parser.py to be "remembered" all th=
e
> > way through expr.py and into schema.py. Several assertions around
> > packing and unpacking this data can be removed as a result.
> >
> > NB: This necessitates a change of typing for check_if() and
> > check_keys(), because mypy does not believe UserDict[str, object] =E2=
=8A=86
> > Dict[str, object]. It will, however, accept Mapping or
> > MutableMapping. In this case, the immutable form is preferred as an
> > input parameter because we don't actually mutate the input.
> >
> > Without this change, we will observe:
> > qapi/expr.py:631: error: Argument 1 to "check_keys" has incompatible
> > type "QAPIExpression"; expected "Dict[str, object]"
> >
> > NB2: Python 3.6 has an oversight for typing UserDict that makes it
> > impossible to type for both runtime and analysis time. The problem is
> > described in detail at https://github.com/python/typing/issues/60 - thi=
s
> > workaround can be safely removed when 3.7 is our minimum version.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
>
> Looks good to me, just one question:
>
> [...]
>
> > diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> > index 1b006cdc133..87b46db7fba 100644
> > --- a/scripts/qapi/parser.py
> > +++ b/scripts/qapi/parser.py
> > @@ -14,13 +14,14 @@
> >  # This work is licensed under the terms of the GNU GPL, version 2.
> >  # See the COPYING file in the top-level directory.
> >
> > -from collections import OrderedDict
> > +from collections import OrderedDict, UserDict
> >  import os
> >  import re
> >  from typing import (
> >      TYPE_CHECKING,
> >      Dict,
> >      List,
> > +    Mapping,
> >      Optional,
> >      Set,
> >      Union,
> > @@ -37,15 +38,30 @@
> >      from .schema import QAPISchemaFeature, QAPISchemaMember
> >
> >
> > -#: Represents a single Top Level QAPI schema expression.
> > -TopLevelExpr =3D Dict[str, object]
> > -
> >  # Return value alias for get_expr().
> >  _ExprValue =3D Union[List[object], Dict[str, object], str, bool]
> >
> > -# FIXME: Consolidate and centralize definitions for TopLevelExpr,
> > -# _ExprValue, _JSONValue, and _JSONObject; currently scattered across
> > -# several modules.
> > +
> > +# FIXME: Consolidate and centralize definitions for _ExprValue,
> > +# JSONValue, and _JSONObject; currently scattered across several
> > +# modules.
> > +
> > +
> > +# 3.6 workaround: can be removed when Python 3.7+ is our required
> version.
> > +if TYPE_CHECKING:
> > +    _UserDict =3D UserDict[str, object]
> > +else:
> > +    _UserDict =3D UserDict
> > +
> > +
> > +class QAPIExpression(_UserDict):
>
> Can we subclass dict instead?
>

...apparently yes?

class QAPIExpression(Dict[str, object]): ...

Only question I have is what the init signature ought to be, though keeping
it as what I already have here apparently passes the type checker.

I think we lose the ability to do kwargs init in that case, but mypy
doesn't give us a lyskov warning, so maybe it's fine? I'll have to play
around with it. dict is implemented at the cpython level, so I'm not as
sure of how subclassing it works. They document three distinct signatures
for its initializer, which is also a python built-in.

I can rename that initialdata parameter too, pending what I discover above.


> > +    def __init__(self,
> > +                 initialdata: Mapping[str, object],
> > +                 info: QAPISourceInfo,
> > +                 doc: Optional['QAPIDoc'] =3D None):
> > +        super().__init__(initialdata)
> > +        self.info =3D info
> > +        self.doc: Optional['QAPIDoc'] =3D doc
> >
> >
> >  class QAPIParseError(QAPISourceError):
>
> [...]
>
>

--0000000000004a7cbf05f4abde59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sat, Feb 11, 2023, 1:49 AM Markus Armbruster &lt;<a=
 href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">John Snow &lt;<a href=3D"mailto:jsnow@redh=
at.com" target=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt; write=
s:<br>
<br>
&gt; This patch creates a new type, QAPIExpression, which represents a pars=
ed<br>
&gt; expression complete with QAPIDoc and QAPISourceInfo.<br>
&gt;<br>
&gt; This patch turns parser.exprs into a list of QAPIExpression instead,<b=
r>
&gt; and adjusts expr.py to match.<br>
&gt;<br>
&gt; This allows the types we specify in parser.py to be &quot;remembered&q=
uot; all the<br>
&gt; way through expr.py and into schema.py. Several assertions around<br>
&gt; packing and unpacking this data can be removed as a result.<br>
&gt;<br>
&gt; NB: This necessitates a change of typing for check_if() and<br>
&gt; check_keys(), because mypy does not believe UserDict[str, object] =E2=
=8A=86<br>
&gt; Dict[str, object]. It will, however, accept Mapping or<br>
&gt; MutableMapping. In this case, the immutable form is preferred as an<br=
>
&gt; input parameter because we don&#39;t actually mutate the input.<br>
&gt;<br>
&gt; Without this change, we will observe:<br>
&gt; qapi/expr.py:631: error: Argument 1 to &quot;check_keys&quot; has inco=
mpatible<br>
&gt; type &quot;QAPIExpression&quot;; expected &quot;Dict[str, object]&quot=
;<br>
&gt;<br>
&gt; NB2: Python 3.6 has an oversight for typing UserDict that makes it<br>
&gt; impossible to type for both runtime and analysis time. The problem is<=
br>
&gt; described in detail at <a href=3D"https://github.com/python/typing/iss=
ues/60" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/=
python/typing/issues/60</a> - this<br>
&gt; workaround can be safely removed when 3.7 is our minimum version.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
<br>
Looks good to me, just one question:<br>
<br>
[...]<br>
<br>
&gt; diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py<br>
&gt; index 1b006cdc133..87b46db7fba 100644<br>
&gt; --- a/scripts/qapi/parser.py<br>
&gt; +++ b/scripts/qapi/parser.py<br>
&gt; @@ -14,13 +14,14 @@<br>
&gt;=C2=A0 # This work is licensed under the terms of the GNU GPL, version =
2.<br>
&gt;=C2=A0 # See the COPYING file in the top-level directory.<br>
&gt;=C2=A0 <br>
&gt; -from collections import OrderedDict<br>
&gt; +from collections import OrderedDict, UserDict<br>
&gt;=C2=A0 import os<br>
&gt;=C2=A0 import re<br>
&gt;=C2=A0 from typing import (<br>
&gt;=C2=A0 =C2=A0 =C2=A0 TYPE_CHECKING,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Dict,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 List,<br>
&gt; +=C2=A0 =C2=A0 Mapping,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Optional,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Set,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Union,<br>
&gt; @@ -37,15 +38,30 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 from .schema import QAPISchemaFeature, QAPISchemaM=
ember<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; -#: Represents a single Top Level QAPI schema expression.<br>
&gt; -TopLevelExpr =3D Dict[str, object]<br>
&gt; -<br>
&gt;=C2=A0 # Return value alias for get_expr().<br>
&gt;=C2=A0 _ExprValue =3D Union[List[object], Dict[str, object], str, bool]=
<br>
&gt;=C2=A0 <br>
&gt; -# FIXME: Consolidate and centralize definitions for TopLevelExpr,<br>
&gt; -# _ExprValue, _JSONValue, and _JSONObject; currently scattered across=
<br>
&gt; -# several modules.<br>
&gt; +<br>
&gt; +# FIXME: Consolidate and centralize definitions for _ExprValue,<br>
&gt; +# JSONValue, and _JSONObject; currently scattered across several<br>
&gt; +# modules.<br>
&gt; +<br>
&gt; +<br>
&gt; +# 3.6 workaround: can be removed when Python 3.7+ is our required ver=
sion.<br>
&gt; +if TYPE_CHECKING:<br>
&gt; +=C2=A0 =C2=A0 _UserDict =3D UserDict[str, object]<br>
&gt; +else:<br>
&gt; +=C2=A0 =C2=A0 _UserDict =3D UserDict<br>
&gt; +<br>
&gt; +<br>
&gt; +class QAPIExpression(_UserDict):<br>
<br>
Can we subclass dict instead?<br></blockquote></div></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">...apparently yes?=C2=A0</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">class QAPIExpression(Dict[str, object]): ...<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Only question I have is =
what the init signature ought to be, though keeping it as what I already ha=
ve here apparently passes the type checker.</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">I think we lose the ability to do kwargs init in that c=
ase, but mypy doesn&#39;t give us a lyskov warning, so maybe it&#39;s fine?=
 I&#39;ll have to play around with it. dict is implemented at the cpython l=
evel, so I&#39;m not as sure of how subclassing it works. They document thr=
ee distinct signatures for its initializer, which is also a python built-in=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I can rename that init=
ialdata parameter too, pending what I discover above.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 def __init__(self,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0initial=
data: Mapping[str, object],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info: Q=
APISourceInfo,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0doc: Op=
tional[&#39;QAPIDoc&#39;] =3D None):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__(initialdata)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://self.info" rel=3D"noref=
errer noreferrer" target=3D"_blank">self.info</a> =3D info<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.doc: Optional[&#39;QAPIDoc&#39;] =3D=
 doc<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 class QAPIParseError(QAPISourceError):<br>
<br>
[...]<br>
<br>
</blockquote></div></div></div>

--0000000000004a7cbf05f4abde59--


