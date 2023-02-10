Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD019692639
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 20:21:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQYwi-0001tS-Nh; Fri, 10 Feb 2023 14:20:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQYwL-0001sN-6e
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 14:20:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQYwH-000612-CC
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 14:20:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676056803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y2tnY5XCwbj9o5EJZOJaGFOSq5lYgS7+kFAGrXS6Zjk=;
 b=CFmTuxEl+pL7iRV3B+y/tQ9GJnTUD9rQ9PHyXVVtkibsd8eQw3kUuf5U499398lmjebewt
 ttyGUpE78sZC5Ox0HNJG0xW8hmlRBIbMw1ywqOoaDZwyig1LP6ThdEdI3mGbIKGknp80NW
 qWilGbuRdfoOZS75AdDXCqTcuAHQtqg=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-272-piSB7UpJNDabTWL8gHsuLQ-1; Fri, 10 Feb 2023 14:20:02 -0500
X-MC-Unique: piSB7UpJNDabTWL8gHsuLQ-1
Received: by mail-pf1-f200.google.com with SMTP id
 z14-20020a056a00240e00b0059395f5a701so3100821pfh.13
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 11:20:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y2tnY5XCwbj9o5EJZOJaGFOSq5lYgS7+kFAGrXS6Zjk=;
 b=g9QMUCTAFtX0h2w1jxgmivBhcFaj8kMe3ZkV88fkvAWGIfBF3UVJUaTkD3Re9+QoLh
 Rf/5xpRDFWQbgII6qxlZI8mkqwHq4RvBSTlG0Whvue1EehBxELtKAn9PQrg1qjk+XkEh
 j6y3e/Jlu3qqOnRCLDJ+r2yVtvkpldNtDAfrQSY3drW/W9zlBYLfEfXB+6BRNd5aHDH0
 gu/rxofcylyJNb+bWNeBDn9erwOF1Pxp8Mt+oTHyC4qROGwn8wSZL67pOd1GlHAK+LXN
 xCOxNbxUH4DoyLVE34aSgXuFKsb69bDnDpo7g1V+HlC1g4yI8rbAM3rKY7PGcj+Cj0dt
 UpHQ==
X-Gm-Message-State: AO0yUKVaRRCsQkAk58OWqCYL8bpkB8zM6OdwDlqj4rR8TqWS3xZDiabF
 UcePjHQ5qKJQVF8ztQztXBnlchitipDyHg8FFdRcVxLDOhX541P+gMwopK5gFLSUB3BJ/erbyut
 viTTeV/1pvMr+IdWI0Iq2FpsmyqCdeQg=
X-Received: by 2002:a17:90a:bd92:b0:22b:aa69:ccc3 with SMTP id
 z18-20020a17090abd9200b0022baa69ccc3mr2546155pjr.35.1676056801438; 
 Fri, 10 Feb 2023 11:20:01 -0800 (PST)
X-Google-Smtp-Source: AK7set+24WZCZWZ1C8QOutATHNfH3x/3C3UQdfJ3L3FZ9WQVtZNkuw5NUHD2dop0QYDZniiuqtmyMrcp0AnahRY+U78=
X-Received: by 2002:a17:90a:bd92:b0:22b:aa69:ccc3 with SMTP id
 z18-20020a17090abd9200b0022baa69ccc3mr2546139pjr.35.1676056801170; Fri, 10
 Feb 2023 11:20:01 -0800 (PST)
MIME-Version: 1.0
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-5-jsnow@redhat.com>
 <c9fbb361-bf79-2196-aafd-68a831f0a1c5@redhat.com>
In-Reply-To: <c9fbb361-bf79-2196-aafd-68a831f0a1c5@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 10 Feb 2023 14:19:50 -0500
Message-ID: <CAFn=p-ZA57Si5wRUOF6pNPB-9VSGAUVd_JdrTCq8aOzJzbTkbg@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] configure: Add nice hint to Python failure message
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Qemu-block <qemu-block@nongnu.org>, Hanna Reitz <hreitz@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000041ef0105f45d62f0"
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

--00000000000041ef0105f45d62f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 10, 2023, 2:45 AM Thomas Huth <thuth@redhat.com> wrote:

> On 10/02/2023 01.31, John Snow wrote:
> > If we begin requiring Python 3.7+, a few platforms are going to need to
> > install an additional package.
> >
> > This is at least mildly annoying to the user (and I hate negative
> > attention), so solve the user's problem for them before they get a
> > chance to become irritated while searching on Google for how to install
> > newer Python packages.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   configure | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/configure b/configure
> > index ea8c973d13b..bf512273f44 100755
> > --- a/configure
> > +++ b/configure
> > @@ -1058,7 +1058,10 @@ fi
> >
> >   if ! check_py_version "$python"; then
> >     error_exit "Cannot use '$python', Python >=3D 3.6 is required." \
> > -      "Use --python=3D/path/to/python to specify a supported Python."
> > +             "Use --python=3D/path/to/python to specify a supported
> Python." \
> > +             "Maybe try:" \
> > +             "  openSUSE Leap 15.3+: zypper install python39" \
> > +             "  CentOS 8: dnf install python38"
>
> IMHO the "Python > 3.6" is already pretty clear, and the hints that you
> provide here will expire pretty fast (unless you bump them regularly), so
> I'd rather drop this patch. Just my 0.02 =E2=82=AC.
>
>   Thomas
>

I figured that when they expired that they also just wouldn't... get
printed anymore. Just trying my best to minimize disruption as a courtesy,
and as a demonstration of how gentle the deprecation could be.

I get it though, it *will* rot ... It's the kind of thing that I'd want to
have in for maybe a release or two before just removing it, once everyone
has a chance to catch on and learn the simple remedy.

(I don't want anyone with 3.6 on their system to be unaware of how to
mitigate this issue, and quickly.)

I could replace it with a more generic hint, too; like "Try looking for
python3y or python3.y packages in your distro's software repository" that
would rot at a slower pace.

--js

>

--00000000000041ef0105f45d62f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Feb 10, 2023, 2:45 AM Thomas Huth &lt;<a href=
=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">On 10/02/2023 01.31, John Snow wrote:<br>
&gt; If we begin requiring Python 3.7+, a few platforms are going to need t=
o<br>
&gt; install an additional package.<br>
&gt; <br>
&gt; This is at least mildly annoying to the user (and I hate negative<br>
&gt; attention), so solve the user&#39;s problem for them before they get a=
<br>
&gt; chance to become irritated while searching on Google for how to instal=
l<br>
&gt; newer Python packages.<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0configure | 5 ++++-<br>
&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/configure b/configure<br>
&gt; index ea8c973d13b..bf512273f44 100755<br>
&gt; --- a/configure<br>
&gt; +++ b/configure<br>
&gt; @@ -1058,7 +1058,10 @@ fi<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0if ! check_py_version &quot;$python&quot;; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0error_exit &quot;Cannot use &#39;$python&#39;, Pyth=
on &gt;=3D 3.6 is required.&quot; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 &quot;Use --python=3D/path/to/python to specify =
a supported Python.&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Use --python=3D=
/path/to/python to specify a supported Python.&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Maybe try:&quot=
; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 openSUSE=
 Leap 15.3+: zypper install python39&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 CentOS 8=
: dnf install python38&quot;<br>
<br>
IMHO the &quot;Python &gt; 3.6&quot; is already pretty clear, and the hints=
 that you <br>
provide here will expire pretty fast (unless you bump them regularly), so <=
br>
I&#39;d rather drop this patch. Just my 0.02 =E2=82=AC.<br>
<br>
=C2=A0 Thomas<br></blockquote></div></div><div dir=3D"auto"><br></div><div =
dir=3D"auto">I figured that when they expired that they also just wouldn&#3=
9;t... get printed anymore. Just trying my best to minimize disruption as a=
 courtesy, and as a demonstration of how gentle the deprecation could be.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">I get it though, it *will=
* rot ... It&#39;s the kind of thing that I&#39;d want to have in for maybe=
 a release or two before just removing it, once everyone has a chance to ca=
tch on and learn the simple remedy.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">(I don&#39;t want anyone with 3.6 on their system to be unaware=
 of how to mitigate this issue, and quickly.)</div><div dir=3D"auto"><br></=
div><div dir=3D"auto">I could replace it with a more generic hint, too; lik=
e &quot;Try looking for python3y or python3.y packages in your distro&#39;s=
 software repository&quot; that would rot at a slower pace.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">--js</div><div dir=3D"auto"><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--00000000000041ef0105f45d62f0--


