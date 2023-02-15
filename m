Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13912697EB2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 15:47:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSJ3T-0001JX-2F; Wed, 15 Feb 2023 09:46:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pSJ3Q-0001J1-Cg
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:46:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pSJ3O-0000zV-Eb
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:46:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676472397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i1jRXK7pkxrzD1FKYwrn6enR86u0aIAO40KinKfw0B0=;
 b=AORx9yQBOuwuWPr/kl6AZ6lDf6L3yAq23jmJuuVIxTuVzK0piDsaYFjtKSpsOj1+vsxpX4
 qIdI1zkQCxvVdjBWIKP7ECUtBZ/yfj/EVGzYRk4Htez4ad56hTUbwEgDETfnwJ9zJniQEJ
 jW8fE109lOBMaYMoDL6TwO9fNjiOAOU=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-38-IT2-ObM1NkaQmvQHN9W4NQ-1; Wed, 15 Feb 2023 09:46:35 -0500
X-MC-Unique: IT2-ObM1NkaQmvQHN9W4NQ-1
Received: by mail-pg1-f200.google.com with SMTP id
 x3-20020a654143000000b004f2f2dafb21so7206989pgp.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 06:46:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i1jRXK7pkxrzD1FKYwrn6enR86u0aIAO40KinKfw0B0=;
 b=Zkwr5Qge0W2kvBcT2Ua1iMz628eDxPzYQvoWEROr1lvpWUr3af/GqlMaK0Wmdnadrb
 23KNXWcPNcQtdRvC+GuZYPTZ4Wc+zT2rNvpqB37wAzbvmj5UWg+pYHvnr6e/VOGLTe0o
 EmHBFDr+rauTCT3wE0167qvzpo/4JlFugJD/5KG1G/xQquRnFaoibhzqGiEX7MLqyBEi
 Z1fRSpgesFCTYwT1kLr7BerGPF/8OM8RtLwOzhv9GcPlqtKLP/IbByPGJjFwinIHo3ht
 eLdxG2SXDaSGTReEMWREZMCLmn714pPKDRrpciifhNXkQbkOOszL2f+Anh2oCdg4uI2j
 mmLg==
X-Gm-Message-State: AO0yUKU0keOmD7xCx3BvrHc7pEBM6AY6hJCyYUx0IWMQMoWXSnV6No2A
 /jp14cs497LLDuLicPesUZvUs5bwhUbvHzIbZmTGhBF9P4/W2vjTpfDoBUK+JvlqP+h4k9GPan5
 3ZwLFX8I9F7NhhSt0MJw5kLjroFfo3Bs=
X-Received: by 2002:a63:b141:0:b0:4f1:ccba:5bac with SMTP id
 g1-20020a63b141000000b004f1ccba5bacmr375448pgp.20.1676472394355; 
 Wed, 15 Feb 2023 06:46:34 -0800 (PST)
X-Google-Smtp-Source: AK7set8uSYaPgNc/EOVQdHKw/9P4zQUxeTCua+ZqRJy2Mgfs6aKBIqeywiNmIKXU0W65lFeeBwyy//5ViXXuP11gp2U=
X-Received: by 2002:a63:b141:0:b0:4f1:ccba:5bac with SMTP id
 g1-20020a63b141000000b004f1ccba5bacmr375440pgp.20.1676472393982; Wed, 15 Feb
 2023 06:46:33 -0800 (PST)
MIME-Version: 1.0
References: <20230215000011.1725012-1-jsnow@redhat.com>
 <20230215000011.1725012-4-jsnow@redhat.com>
 <87a61fe6x6.fsf@pond.sub.org> <87cz6b82z7.fsf@pond.sub.org>
In-Reply-To: <87cz6b82z7.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Wed, 15 Feb 2023 09:46:23 -0500
Message-ID: <CAFn=p-be1s_PQvEq5hXkVWFGVarhqxoy-LzMM=gqoRWk6tQ_FA@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] qapi: Add minor typing workaround for 3.6
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>
Content-Type: multipart/alternative; boundary="00000000000084fe8105f4be2544"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

--00000000000084fe8105f4be2544
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 15, 2023, 8:36 AM Markus Armbruster <armbru@redhat.com> wrote:

> Markus Armbruster <armbru@redhat.com> writes:
>
> > John Snow <jsnow@redhat.com> writes:
> >
> >> Pylint under 3.6 does not believe that Collection is subscriptable at
> >> runtime. It is, making this a Pylint
> >> bug. https://github.com/PyCQA/pylint/issues/2377
> >>
> >> They closed it as fixed, but that doesn't seem to be true as of Pylint
> >> 2.13.9, the latest version you can install under Python 3.6. 2.13.9 was
> >> released 2022-05-13, about seven months after the bug was closed.
> >>
> >> The least-annoying fix here is to just use the more specific type
> >> Sequence, only because it seems to work in 3.6.
> >>
> >> Signed-off-by: John Snow <jsnow@redhat.com>
> >> ---
> >>  scripts/qapi/expr.py | 6 +++---
> >>  1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> >> index 5a1782b57ea..8701351fdfc 100644
> >> --- a/scripts/qapi/expr.py
> >> +++ b/scripts/qapi/expr.py
> >> @@ -33,11 +33,11 @@
> >>
> >>  import re
> >>  from typing import (
> >> -    Collection,
> >>      Dict,
> >>      Iterable,
> >>      List,
> >>      Optional,
> >> +    Sequence,
> >>      Union,
> >>      cast,
> >>  )
> >> @@ -195,8 +195,8 @@ def check_defn_name_str(name: str, info:
> QAPISourceInfo, meta: str) -> None:
> >>  def check_keys(value: _JSONObject,
> >>                 info: QAPISourceInfo,
> >>                 source: str,
> >> -               required: Collection[str],
> >> -               optional: Collection[str]) -> None:
> >> +               required: Sequence[str],
> >> +               optional: Sequence[str]) -> None:
> >>      """
> >>      Ensure that a dict has a specific set of keys.
> >
> > The actual arguments are always List[str].  You actually used that until
> > v3 of the patch, and switched to the maximally general Collection[str]
> > in v4, with rationale that ended up in commit 538cd41065a:
> >
> >     qapi/expr.py: Modify check_keys to accept any Collection
> >
> >     This is a minor adjustment that lets parameters @required and
> >     @optional take tuple arguments, in particular ().  Later patches will
> >     make use of that.
> >
> > No later patch ever did.
>

I have some in "pt5d" that do - but this is the set of patches that do some
optional cleanups that you've dropped from earlier sets.

>
> > I'd prefer maximally stupid List[str], but it's no big deal either way.
>
> Regardless,
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>

Thanks- everything else look OK enough for now?

>

--00000000000084fe8105f4be2544
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Feb 15, 2023, 8:36 AM Markus Armbruster &lt;<a=
 href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">Markus Armbruster &lt;<a href=3D"mailto:ar=
mbru@redhat.com" target=3D"_blank" rel=3D"noreferrer">armbru@redhat.com</a>=
&gt; writes:<br>
<br>
&gt; John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank" re=
l=3D"noreferrer">jsnow@redhat.com</a>&gt; writes:<br>
&gt;<br>
&gt;&gt; Pylint under 3.6 does not believe that Collection is subscriptable=
 at<br>
&gt;&gt; runtime. It is, making this a Pylint<br>
&gt;&gt; bug. <a href=3D"https://github.com/PyCQA/pylint/issues/2377" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/PyCQA/pylin=
t/issues/2377</a><br>
&gt;&gt;<br>
&gt;&gt; They closed it as fixed, but that doesn&#39;t seem to be true as o=
f Pylint<br>
&gt;&gt; 2.13.9, the latest version you can install under Python 3.6. 2.13.=
9 was<br>
&gt;&gt; released 2022-05-13, about seven months after the bug was closed.<=
br>
&gt;&gt;<br>
&gt;&gt; The least-annoying fix here is to just use the more specific type<=
br>
&gt;&gt; Sequence, only because it seems to work in 3.6.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" t=
arget=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 scripts/qapi/expr.py | 6 +++---<br>
&gt;&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py<br>
&gt;&gt; index 5a1782b57ea..8701351fdfc 100644<br>
&gt;&gt; --- a/scripts/qapi/expr.py<br>
&gt;&gt; +++ b/scripts/qapi/expr.py<br>
&gt;&gt; @@ -33,11 +33,11 @@<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 import re<br>
&gt;&gt;=C2=A0 from typing import (<br>
&gt;&gt; -=C2=A0 =C2=A0 Collection,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Dict,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Iterable,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 List,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Optional,<br>
&gt;&gt; +=C2=A0 =C2=A0 Sequence,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Union,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 cast,<br>
&gt;&gt;=C2=A0 )<br>
&gt;&gt; @@ -195,8 +195,8 @@ def check_defn_name_str(name: str, info: QAPIS=
ourceInfo, meta: str) -&gt; None:<br>
&gt;&gt;=C2=A0 def check_keys(value: _JSONObject,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info:=
 QAPISourceInfo,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sourc=
e: str,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0required: =
Collection[str],<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0optional: =
Collection[str]) -&gt; None:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0required: =
Sequence[str],<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0optional: =
Sequence[str]) -&gt; None:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Ensure that a dict has a specific set of keys.=
<br>
&gt;<br>
&gt; The actual arguments are always List[str].=C2=A0 You actually used tha=
t until<br>
&gt; v3 of the patch, and switched to the maximally general Collection[str]=
<br>
&gt; in v4, with rationale that ended up in commit 538cd41065a:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0qapi/expr.py: Modify check_keys to accept any Colle=
ction<br>
&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0This is a minor adjustment that lets parameters @re=
quired and<br>
&gt;=C2=A0 =C2=A0 =C2=A0@optional take tuple arguments, in particular ().=
=C2=A0 Later patches will<br>
&gt;=C2=A0 =C2=A0 =C2=A0make use of that.<br>
&gt;<br>
&gt; No later patch ever did.<br></blockquote></div></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">I have some in &quot;pt5d&quot; that do - but =
this is the set of patches that do some optional cleanups that you&#39;ve d=
ropped from earlier sets.</div><div dir=3D"auto"><br></div><div dir=3D"auto=
"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt;<br>
&gt; I&#39;d prefer maximally stupid List[str], but it&#39;s no big deal ei=
ther way.<br>
<br>
Regardless,<br>
Reviewed-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" tar=
get=3D"_blank" rel=3D"noreferrer">armbru@redhat.com</a>&gt;<br></blockquote=
></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks- everythi=
ng else look OK enough for now?</div><div dir=3D"auto"><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--00000000000084fe8105f4be2544--


