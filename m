Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D048E415097
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 21:42:07 +0200 (CEST)
Received: from localhost ([::1]:60610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT886-0005zL-3a
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 15:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mT7sF-0004Cv-DM
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 15:25:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mT7sB-0002oj-T7
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 15:25:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632338738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J23hF3zjxildCJyz40xG64Ga9Y8Y0MaP8LgTlqxc5h0=;
 b=MKKF9TtHtKl4pvsxAJTPRA0/bJmYdUS5ya4lsgTr5M+YDjUUPh0Mi9a3jmHhXhFhjhNuJ+
 Fglww6qgIT93/VAGc9+f8EApA5ANHIy/AKMQQRBUWQEKQmy/tIWqW8o0ePxRyh+jx8Otvi
 v/90Q34h4TU3PIhxGpoKQTPkHaAFaB0=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-prIQ4AnrMgmDdzCFrwFy0g-1; Wed, 22 Sep 2021 15:25:37 -0400
X-MC-Unique: prIQ4AnrMgmDdzCFrwFy0g-1
Received: by mail-oi1-f197.google.com with SMTP id
 20-20020aca2814000000b002690d9b60aaso2422993oix.0
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 12:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J23hF3zjxildCJyz40xG64Ga9Y8Y0MaP8LgTlqxc5h0=;
 b=gYLwQxpGiZUMEC00QyyuoMEBR69mZ9Mr7QnBpLJtkCEPays+4p4tUwgspmGu5ubaj8
 +/pr/kT40EOTZcT8BSfOrr3TVzdgD2E6UgWmdkDUt6Eo4ak8GS/DGtCWmINeKPgQ+gB8
 9siJN0Y90yoaxldo0fqshSSb/eBFkKv+QKbzI1q6kstoHiWUdcb0nYauvFxIZ/J37Ps1
 7Iq+TRiXkOcaBtjmI0Ubj7+KIsMKkbnVW5dtGWvcKOwrPxxqyb03xxwe+nsYjS5sRMGK
 uCGDTpCJjaE0/zlDVscOoEgph8CFmujrgKRVlqdWu/ESsGTqjl3pCVPQqIyuUxCYayCD
 YvlQ==
X-Gm-Message-State: AOAM531cMsdAg0YR/HIB3hwi0UCtQBbulB/hCxCCS21xwrvcXSt9fhzw
 T5npDfRdHkTYCCWddGVh1xK3gmPot+7eeyNFFc0AYvvOJg6zz1R6jx9i4jhJUbzus/GDFxNFeh8
 HFSXXcCYuSUqjYf+gzDxaSYQv3jsDqPA=
X-Received: by 2002:a9d:7281:: with SMTP id t1mr723549otj.129.1632338736419;
 Wed, 22 Sep 2021 12:25:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwELSM3EZbxXMvmFTNsyWsIj2BQTdUgXmdb+0O/RoQDeONyHKN69b9RQwMnCMpxnxS/bXFugj/Q7fVv+ePNwdU=
X-Received: by 2002:a9d:7281:: with SMTP id t1mr723533otj.129.1632338736234;
 Wed, 22 Sep 2021 12:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-7-jsnow@redhat.com>
 <bd62cd99-021a-35a0-6167-e3a4a9a24b12@redhat.com>
In-Reply-To: <bd62cd99-021a-35a0-6167-e3a4a9a24b12@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 22 Sep 2021 15:25:25 -0400
Message-ID: <CAFn=p-ZwSeMNhXXY3sfcq+Swd8mUxuYGfeHW-On=4qb4dE3O0Q@mail.gmail.com>
Subject: Re: [PATCH v3 06/16] iotests/297: Add get_files() function
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000086d51505cc9a7aa8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000086d51505cc9a7aa8
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 17, 2021 at 5:24 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 16.09.21 06:09, John Snow wrote:
> > Split out file discovery into its own method to begin separating out the
> > "environment setup" and "test execution" phases.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   tests/qemu-iotests/297 | 12 +++++++++---
> >   1 file changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
> > index 3e86f788fc..b3a56a3a29 100755
> > --- a/tests/qemu-iotests/297
> > +++ b/tests/qemu-iotests/297
> > @@ -21,6 +21,7 @@ import re
> >   import shutil
> >   import subprocess
> >   import sys
> > +from typing import List
> >
> >   import iotests
> >
> > @@ -56,10 +57,15 @@ def is_python_file(filename: str, directory: str =
> '.') -> bool:
> >               return False
> >
> >
> > +def get_test_files(directory: str = '.') -> List[str]:
> > +    named_test_dir = os.path.join(directory, 'tests')
> > +    named_tests = [f"tests/{entry}" for entry in
> os.listdir(named_test_dir)]
> > +    check_tests = set(os.listdir(directory) + named_tests) -
> set(SKIP_FILES)
> > +    return list(filter(lambda f: is_python_file(f, directory),
> check_tests))
>
> Seeing a filter() makes me immensely happy, but I thought that was
> unpythonic?
>
>
Eh, depends on what you're doing, I guess?

The alternative spelling is:
list(f for f in check_tests if is_python_file(f, directory))

... which I guess *is* shorter and skips the lambda. but, I suppose I have
some mild revulsion to seeing "f for f in ..." constructs.
If I ever tell you not to use a filter, feel free to cite this patch and
then just tell me to shut up. I apologize for any inconsistencies in my
style, real or imagined.

--js

Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>
>

--00000000000086d51505cc9a7aa8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 17, 2021 at 5:24 AM Hanna=
 Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 16.09.2=
1 06:09, John Snow wrote:<br>
&gt; Split out file discovery into its own method to begin separating out t=
he<br>
&gt; &quot;environment setup&quot; and &quot;test execution&quot; phases.<b=
r>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/297 | 12 +++++++++---<br>
&gt;=C2=A0 =C2=A01 file changed, 9 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297<br>
&gt; index 3e86f788fc..b3a56a3a29 100755<br>
&gt; --- a/tests/qemu-iotests/297<br>
&gt; +++ b/tests/qemu-iotests/297<br>
&gt; @@ -21,6 +21,7 @@ import re<br>
&gt;=C2=A0 =C2=A0import shutil<br>
&gt;=C2=A0 =C2=A0import subprocess<br>
&gt;=C2=A0 =C2=A0import sys<br>
&gt; +from typing import List<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0import iotests<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -56,10 +57,15 @@ def is_python_file(filename: str, directory: str =
=3D &#39;.&#39;) -&gt; bool:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return False<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +def get_test_files(directory: str =3D &#39;.&#39;) -&gt; List[str]:<b=
r>
&gt; +=C2=A0 =C2=A0 named_test_dir =3D os.path.join(directory, &#39;tests&#=
39;)<br>
&gt; +=C2=A0 =C2=A0 named_tests =3D [f&quot;tests/{entry}&quot; for entry i=
n os.listdir(named_test_dir)]<br>
&gt; +=C2=A0 =C2=A0 check_tests =3D set(os.listdir(directory) + named_tests=
) - set(SKIP_FILES)<br>
&gt; +=C2=A0 =C2=A0 return list(filter(lambda f: is_python_file(f, director=
y), check_tests))<br>
<br>
Seeing a filter() makes me immensely happy, but I thought that was <br>
unpythonic?<br>
<br></blockquote><div><br></div><div><div>Eh, depends on what you&#39;re do=
ing, I guess?</div><div><br></div><div>The alternative spelling is:</div><d=
iv>list(f for f in check_tests if is_python_file(f, directory))</div><div><=
br></div><div>... which I guess *is* shorter and skips the lambda. but, I s=
uppose I have some mild revulsion to seeing &quot;f for f in ...&quot; cons=
tructs.</div><div>If I ever tell you not to use a filter, feel free to cite=
 this patch and then just tell me to shut up. I apologize for any inconsist=
encies in my style, real or imagined.<br></div><div><br></div><div>--js <br=
></div><div><br></div></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
Reviewed-by: Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" target=3D=
"_blank">hreitz@redhat.com</a>&gt;<br>
<br></blockquote><div><br></div><br></div></div>

--00000000000086d51505cc9a7aa8--


