Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C6042C3C1
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 16:43:40 +0200 (CEST)
Received: from localhost ([::1]:41254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mafTn-0003CR-G5
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 10:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mafSA-00013B-D9
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 10:41:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mafS7-0007rD-UT
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 10:41:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634136115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r59v4KC2Lo+kOKjvmrXC/ZDdCx6BZWWxQBayJCJOK0M=;
 b=S0a/4RT7UDEPyA12PiqT6Nj5a3lQyJzulDR9pMg9i5P/axD6kuUeqTagyrhQIj7jsfOMlM
 cfepKoZM9RaJ18rqQBstZaroW89DMH4jYmr/YNpVAe6TsY75AQ4aRLYQ+pfayTUogYBePP
 pYkFjuDVlXIhlQYYI+zgJp0Ct1CzNAA=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-5FJOS0KvP1G00l9nX_rj8g-1; Wed, 13 Oct 2021 10:41:53 -0400
X-MC-Unique: 5FJOS0KvP1G00l9nX_rj8g-1
Received: by mail-ua1-f69.google.com with SMTP id
 c18-20020ab04852000000b002c9ff3ffa97so1399797uad.4
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 07:41:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r59v4KC2Lo+kOKjvmrXC/ZDdCx6BZWWxQBayJCJOK0M=;
 b=sngW4zvj0p6bO4cvOATuFJy2cJLKI172GtR8uAwdREKWGzKEs6IA7WgBeu/XVwH1In
 teMUp5XfzhcfiYcqEp4u81O3v3m2ubP01av1CpAODvm/HS8pEy+/8Lg/y89yGwyLmUng
 gKr74hxuKpGBptG/UnpwInVfUgTzgMe7WpEUpR7T/UW6b37/OsjZ5oPUle6LRHsUxHhH
 3kxPDc9/Hg6gPVKFmGoiFXKsE6D0V8aFIYnjcOvMXaDrZ8UNTCEg+myhqGICfhjdhMqL
 WsyregpHjkaakDiWOYj3ToI1bUQgOvHz8HN2iV59/kDNuwZQgaZ7svhyh3xg1J0DtrAc
 Vd6g==
X-Gm-Message-State: AOAM53013b51nep2J1JlZWcvDxFM4cGYJmub8r82Y9nBoKnFurvK/M4S
 xeO+oE0Z3GMZCs0A1ANbdDEmCjpF05wCBkDJPbQKmBCoAo+TBus5hrmWFzNBhnTA8vc9UTR38x+
 b+dbVhrjWmYN6ZOdfQp3iA9JSOYVfq20=
X-Received: by 2002:a1f:e946:: with SMTP id g67mr33600241vkh.10.1634136113269; 
 Wed, 13 Oct 2021 07:41:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhNjjvn56SAv227w67MwzC0VpKx0hzClCgf4Dw5pLhIAsuZ/iFNQiKuz2dpnVR9DlzwCrGwgmmwzRZrrCu3pk=
X-Received: by 2002:a1f:e946:: with SMTP id g67mr33600220vkh.10.1634136113074; 
 Wed, 13 Oct 2021 07:41:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211004210503.1455391-1-jsnow@redhat.com>
 <20211004210503.1455391-6-jsnow@redhat.com>
 <343b9cfa-362c-51b1-cedf-67717db4aa15@redhat.com>
In-Reply-To: <343b9cfa-362c-51b1-cedf-67717db4aa15@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 13 Oct 2021 10:41:42 -0400
Message-ID: <CAFn=p-YicFP8WcGoKocshX4MCe0WU+5Dh+EB2DbKVeZ_dyxSWA@mail.gmail.com>
Subject: Re: [PATCH 05/13] iotests/297: Create main() function
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000088ea5905ce3cf613"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000088ea5905ce3cf613
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 13, 2021 at 7:03 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 04.10.21 23:04, John Snow wrote:
> > Instead of running "run_linters" directly, create a main() function tha=
t
> > will be responsible for environment setup, leaving run_linters()
> > responsible only for execution of the linters.
> >
> > (That environment setup will be moved over in forthcoming commits.)
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > Reviewed-by: Hanna Reitz <hreitz@redhat.com>
> > ---
> >   tests/qemu-iotests/297 | 12 ++++++++----
> >   1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
> > index 65b1e7058c2..f9fcb039e27 100755
> > --- a/tests/qemu-iotests/297
> > +++ b/tests/qemu-iotests/297
> > @@ -89,8 +89,12 @@ def run_linters():
> >           print(p.stdout)
> >
> >
> > -for linter in ('pylint-3', 'mypy'):
> > -    if shutil.which(linter) is None:
> > -        iotests.notrun(f'{linter} not found')
> > +def main() -> None:
> > +    for linter in ('pylint-3', 'mypy'):
> > +        if shutil.which(linter) is None:
> > +            iotests.notrun(f'{linter} not found')
>
> Now that I see it here: Given patch 4, shouldn=E2=80=99t we replace
> `shutil.which()` by some other check?
>
>
Yeah, ideally. Sorry, I was lazy and didn't do that part yet. Nobody had
asked O:-)

I'll bolster the previous patch for the next go-around. (Or maybe I'll send
a fixup patch to the list, depending on what the rest of your replies look
like.)

--js

--00000000000088ea5905ce3cf613
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 13, 2021 at 7:03 AM Hanna=
 Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 04.10.2=
1 23:04, John Snow wrote:<br>
&gt; Instead of running &quot;run_linters&quot; directly, create a main() f=
unction that<br>
&gt; will be responsible for environment setup, leaving run_linters()<br>
&gt; responsible only for execution of the linters.<br>
&gt;<br>
&gt; (That environment setup will be moved over in forthcoming commits.)<br=
>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; Reviewed-by: Vladimir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsemen=
tsov@virtuozzo.com" target=3D"_blank">vsementsov@virtuozzo.com</a>&gt;<br>
&gt; Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@=
redhat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
&gt; Reviewed-by: Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" targ=
et=3D"_blank">hreitz@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/297 | 12 ++++++++----<br>
&gt;=C2=A0 =C2=A01 file changed, 8 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297<br>
&gt; index 65b1e7058c2..f9fcb039e27 100755<br>
&gt; --- a/tests/qemu-iotests/297<br>
&gt; +++ b/tests/qemu-iotests/297<br>
&gt; @@ -89,8 +89,12 @@ def run_linters():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(p.stdout)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -for linter in (&#39;pylint-3&#39;, &#39;mypy&#39;):<br>
&gt; -=C2=A0 =C2=A0 if shutil.which(linter) is None:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 iotests.notrun(f&#39;{linter} not found&#=
39;)<br>
&gt; +def main() -&gt; None:<br>
&gt; +=C2=A0 =C2=A0 for linter in (&#39;pylint-3&#39;, &#39;mypy&#39;):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if shutil.which(linter) is None:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iotests.notrun(f&#39;{linte=
r} not found&#39;)<br>
<br>
Now that I see it here: Given patch 4, shouldn=E2=80=99t we replace <br>
`shutil.which()` by some other check?<br>
<br></blockquote><div><br></div><div>Yeah, ideally. Sorry, I was lazy and d=
idn&#39;t do that part yet. Nobody had asked O:-)</div><div><br></div><div>=
I&#39;ll bolster the previous patch for the next go-around. (Or maybe I&#39=
;ll send a fixup patch to the list, depending on what the rest of your repl=
ies look like.)</div><div><br></div><div>--js<br></div></div></div>

--00000000000088ea5905ce3cf613--


