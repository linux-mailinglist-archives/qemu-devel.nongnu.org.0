Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 455B93CFD6D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:23:09 +0200 (CEST)
Received: from localhost ([::1]:51326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5raO-0000yj-A6
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5rTq-0005Yu-Qt
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:16:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5rTn-0004Jz-SF
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:16:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626794178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cEVzpjOjohYsAg79nKkNQZQNY+Qfw5vSTILhRnW759A=;
 b=WlaWCgTaGD965wFb5mXiOgzXNA2CqQql4jy3/G7T4+5uDm2NJe7MHKra0nqDLoHTcyMFf5
 X4skSRisTpQ8byvgT0+/hich2PV7ch4obzgwRndmDuWC7Vzaa3/ePa730a24LBoDMSFQTt
 nxHD4eHd4OleJoycTM+DpgSaunm0rPk=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-J77AB2nVO2i8f8xKcvvEFA-1; Tue, 20 Jul 2021 11:16:16 -0400
X-MC-Unique: J77AB2nVO2i8f8xKcvvEFA-1
Received: by mail-ot1-f71.google.com with SMTP id
 61-20020a9d08430000b02904b9e704387aso17922881oty.12
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 08:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cEVzpjOjohYsAg79nKkNQZQNY+Qfw5vSTILhRnW759A=;
 b=ZC9fJ+8aOP8V0fYuxqqPCHjyz8cAamJMT52uL0alobPPohPL6d69sGJW6kmNnATFhn
 y/loZqa4gej1NFhoivfRIzwsDKujXGdiSfoR1BP5O7MXGZrQVSZkE1TqEgJctgN+Y6Xp
 u1qa8wxemoJTTFI8my/K/si8j6wCN8BEVz1q0XYjSJHXtoqGd/OzKi6PadYLOK4H3OIS
 TfVk6nklTh1HvJYHnz2y2GIxC2xAAyQh9NObBXXCT+3D9kj0vULTB+rSHhLoQ690WtuI
 pdGHkGkrqY0pa16YB0DGXiwGPke1Z2YNn+wOxrL5HN+Wn/nEvr8uLCEpd2R1gX8oz8z/
 ajyw==
X-Gm-Message-State: AOAM532MY81oX04NGZ/pUFaYch7DkvcZrhVzDtgrgVutdI+gBdaGh03H
 bnJT6ziZHpNFck8/RG48g5baOf3VyVe6QAQQJP4CigLMNQQFhfTuSWjVs+T+NSumDlBxOtvQ4uy
 YWVaSRMep/nEVmjPtGdv+SGW+g66wJuo=
X-Received: by 2002:a4a:1401:: with SMTP id 1mr21114969ood.50.1626794176074;
 Tue, 20 Jul 2021 08:16:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTw+eyOWjzoOR2euzvkRLKNYL6s1YEN3Re1kMpX9RNIH3Wa9NaniI8wY1N7vWiFPrhcaj+KrKzS75az64hP44=
X-Received: by 2002:a4a:1401:: with SMTP id 1mr21114961ood.50.1626794175886;
 Tue, 20 Jul 2021 08:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210625182021.803227-1-jsnow@redhat.com>
 <20210625182021.803227-3-jsnow@redhat.com>
 <49db446b-3960-50ea-9693-d3bd5d1701f8@virtuozzo.com>
In-Reply-To: <49db446b-3960-50ea-9693-d3bd5d1701f8@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 20 Jul 2021 11:16:05 -0400
Message-ID: <CAFn=p-bTqxsg-pBkpUzdQuCNrfBr11q7ZwO2xeQ8r_b1rGydzQ@mail.gmail.com>
Subject: Re: [PATCH 02/10] iotests/297: Add get_files() function
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000fa0a9605c78f882b"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000fa0a9605c78f882b
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 5:02 AM Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> wrote:

> 25.06.2021 21:20, John Snow wrote:
> > Split out file discovery into its own method to begin separating out the
> > "environment setup" and "test execution" phases.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>
> > ---
> >   tests/qemu-iotests/297 | 11 +++++++++--
> >   1 file changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
> > index 493dda17fb..0bc1195805 100755
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
> > @@ -56,9 +57,15 @@ def is_python_file(filename: str, directory: str =
> '.') -> bool:
> >               return False
> >
> >
> > +def get_test_files(directory: str = '.') -> List[str]:
> > +    return [
> > +        f for f in (set(os.listdir(directory)) - set(SKIP_FILES))
> > +        if is_python_file(f, directory)
> > +    ]
> > +
> > +
> >   def run_linters():
> > -    files = [filename for filename in (set(os.listdir('.')) -
> set(SKIP_FILES))
> > -             if is_python_file(filename)]
> > +    files = get_test_files()
>
> Hmm. It looks like files in tests/qemu-iotests/tests are ignored now..
> That's bad
>
>
Oh, it seems likely we were never checking them -- listdir doesn't recurse
before *or* after this patch. OK, I can fix that. It'll be in a new patch.


> >
> >       iotests.logger.debug('Files to be checked:')
> >       iotests.logger.debug(', '.join(sorted(files)))
> >
>
>
> --
> Best regards,
> Vladimir
>
>

--000000000000fa0a9605c78f882b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 6, 2021 at 5:02 AM Vladim=
ir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@virtuozzo.com">vsem=
entsov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">25.06.2021 21:20, John Snow wrote:<br>
&gt; Split out file discovery into its own method to begin separating out t=
he<br>
&gt; &quot;environment setup&quot; and &quot;test execution&quot; phases.<b=
r>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
<br>
Reviewed-by: Vladimir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@=
virtuozzo.com" target=3D"_blank">vsementsov@virtuozzo.com</a>&gt;<br>
<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/297 | 11 +++++++++--<br>
&gt;=C2=A0 =C2=A01 file changed, 9 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297<br>
&gt; index 493dda17fb..0bc1195805 100755<br>
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
&gt; @@ -56,9 +57,15 @@ def is_python_file(filename: str, directory: str =
=3D &#39;.&#39;) -&gt; bool:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return False<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +def get_test_files(directory: str =3D &#39;.&#39;) -&gt; List[str]:<b=
r>
&gt; +=C2=A0 =C2=A0 return [<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 f for f in (set(os.listdir(directory)) - =
set(SKIP_FILES))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if is_python_file(f, directory)<br>
&gt; +=C2=A0 =C2=A0 ]<br>
&gt; +<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0def run_linters():<br>
&gt; -=C2=A0 =C2=A0 files =3D [filename for filename in (set(os.listdir(&#3=
9;.&#39;)) - set(SKIP_FILES))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if is_python_file(fil=
ename)]<br>
&gt; +=C2=A0 =C2=A0 files =3D get_test_files()<br>
<br>
Hmm. It looks like files in tests/qemu-iotests/tests are ignored now.. That=
&#39;s bad<br>
<br></blockquote><div><br></div><div>Oh, it seems likely we were never chec=
king them -- listdir doesn&#39;t recurse before *or* after this patch. OK, =
I can fix that. It&#39;ll be in a new patch.<br></div><div></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0iotests.logger.debug(&#39;Files to be checke=
d:&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0iotests.logger.debug(&#39;, &#39;.join(sorte=
d(files)))<br>
&gt; <br>
<br>
<br>
-- <br>
Best regards,<br>
Vladimir<br>
<br>
</blockquote></div></div>

--000000000000fa0a9605c78f882b--


