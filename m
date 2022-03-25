Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6A44E75F7
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 16:08:31 +0100 (CET)
Received: from localhost ([::1]:60374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXlYD-0008B5-SM
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 11:08:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXlWC-0006cm-HJ
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 11:06:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXlWA-0005tg-7Z
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 11:06:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648220781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gyYUv4UJHfEPd4xl7fyKom3MqpSThc/KHg/AqPRcZKU=;
 b=M9I2+TJR0AjuTQcuIO0pkByipv0/g+hleZTHLlkUyHHaRO/9hnVKUDuo5V37NNoWw19Txl
 sZyOtn2m7LM7rW/qdhYya8h9iz4Mm1OJojlc8LIBDvWStDXNre2oaYLh1ytDAOTU2GClcl
 Vx6zpO/ISp6npbtoF5FezFop3+EniOg=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-l9yAVwqxPgO3z5v9V70Yvw-1; Fri, 25 Mar 2022 11:06:19 -0400
X-MC-Unique: l9yAVwqxPgO3z5v9V70Yvw-1
Received: by mail-vs1-f69.google.com with SMTP id
 x4-20020a67b404000000b0031bf0c6cff4so1743314vsl.21
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 08:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gyYUv4UJHfEPd4xl7fyKom3MqpSThc/KHg/AqPRcZKU=;
 b=h6Iw2E6FbeXZqtMOVpJw3n2p1cgyFpEpJkrHYNs6xNS9jTUA4buPZR767TyAfioCAV
 hsX5duhgQ80eAyf6Z9+IHkUsYwg1wbKF2zf1oljxGKirizgHHtPfie/rfn8MZit/cAw5
 /d/6GWQrShel/zYmHxFEyN63VJrqMMODHmcPm7gfK0eA0ZVqLzzof+LVWhMXGcIMhTot
 Lvsd4ykERZI3Rb9CxXwN9Ix6e8bvhVEE/krc92bAjJSFEBT6h8l6HZa6xk+589RDYs4k
 17Ofwas1DznJ4ZfJtOv/zbXIKmVj2/3vX/ia2uWkoM5rGUsTeHJTUglfIXYhxGJoe63R
 6TXg==
X-Gm-Message-State: AOAM530jZXEpumt7W0qI5rY/rbrNGF6J/OFL20JgCBL4jO1Zaf7AdNUx
 5ioA8jeIGyCbrRNRISAGiHm6z4NarWynAUtQznY4a6DALHcJ6eyu1XBYOGRVflM96zETdCV43hf
 r+FDsKzGjqYHAV7pr+DfdiwV6FaIEI9c=
X-Received: by 2002:a67:4c3:0:b0:324:ddd7:70d3 with SMTP id
 186-20020a6704c3000000b00324ddd770d3mr5314838vse.61.1648220778712; 
 Fri, 25 Mar 2022 08:06:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywRhQRIuEowQeW/5ztpYkcDNF6t8eIE29rNlurUXNyWiNaBFjZ5FCvGfDKtldqOL5WvZ8CkHRGHfGCk/mE6Ws=
X-Received: by 2002:a67:4c3:0:b0:324:ddd7:70d3 with SMTP id
 186-20020a6704c3000000b00324ddd770d3mr5314787vse.61.1648220778314; Fri, 25
 Mar 2022 08:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220324183018.2476551-1-jsnow@redhat.com>
 <20220324183018.2476551-6-jsnow@redhat.com>
 <4682fc7e-bfe5-1ab3-bc0f-650fd981ea2f@redhat.com>
In-Reply-To: <4682fc7e-bfe5-1ab3-bc0f-650fd981ea2f@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 25 Mar 2022 11:06:09 -0400
Message-ID: <CAFn=p-b_GmaT5Tx6ROU5tyFy7_yMATBUgF6EBsbiNugna=6OwA@mail.gmail.com>
Subject: Re: [PATCH v2 05/17] iotests/040: Fix TestCommitWithFilters test
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000000d04805db0c4ef3"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000000d04805db0c4ef3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 25, 2022, 9:40 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 24.03.22 19:30, John Snow wrote:
> > Without this change, asserting that qemu_io always returns 0 causes thi=
s
> > test to fail in a way we happened not to be catching previously:
> >
> >   qemu.utils.VerboseProcessError: Command
> >    '('/home/jsnow/src/qemu/bin/git/tests/qemu-iotests/../../qemu-io',
> >    '--cache', 'writeback', '--aio', 'threads', '-f', 'qcow2', '-c',
> >    'read -P 4 3M 1M',
> >    '/home/jsnow/src/qemu/bin/git/tests/qemu-iotests/scratch/3.img')'
> >    returned non-zero exit status 1.
> >    =E2=94=8F=E2=94=81 output =E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81
> >    =E2=94=83 qemu-io: can't open device
> >    =E2=94=83 /home/jsnow/src/qemu/bin/git/tests/qemu-iotests/scratch/3.=
img:
> >    =E2=94=83 Could not open backing file: Could not open backing file: =
Throttle
> >    =E2=94=83 group 'tg' does not exist
> >    =E2=94=97=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81
> >
> > Explicitly provide the backing file so that opening the file outside of
> > QEMU (Where we will not have throttle groups) will succeed.
> >
> > [Patch entirely written by Hanna but I don't have her S-o-B]
>
> Er, well, not sure if this even meets the necessary threshold of
> originality, so a Proposed-by would=E2=80=99ve been fine.
>

I have a dogmatic devotion to crediting others. You diagnosed and fixed the
problem, not me!

(I realize it's a small thing, but still. I can't bring myself to put my
name on something that isn't mine, even if it's tiny.)


> Anyway, here you go:
>
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>
> > [My commit message is probably also garbage, sorry]
>
> I don=E2=80=99t find it too bad, but a paragraph describing the actual pr=
oblem
> might improve it.  E.g. (below the exception output):
>
> The commit jobs changes the backing file string stored in the image file
> header belonging to the node above the commit=E2=80=99s top node to point=
 to the
> commit target (the base node).  QEMU tries to be as accurate as
> possible, and so in these test cases will include the filter that is
> part of the block graph in that backing file string (by virtue of making
> it a json:{} description of the post-commit subgraph).  This makes
> little sense outside of QEMU, though: Specifically, the throttle node in
> that subgraph will dearly miss its supposedly associated throttle group
> object.
>
> When starting the commit job, we can specify a custom backing file
> string to write into said image file, so let=E2=80=99s use that feature t=
o write
> the plain filename of the backing chain=E2=80=99s next actual image file =
there.
>

Thanks :3


> > [Feel free to suggest a better one]
> > [I hope your day is going well]
>
> Fridays tend to be on the better side of days.
>
> Hanna
>

Up there in my top three kinds of days.


> > Signed-off-by: John Snow <jsnow@redhat.com>
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   tests/qemu-iotests/040 | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/tests/qemu-iotests/040 b/tests/qemu-iotests/040
> > index c4a90937dc..30eb97829e 100755
> > --- a/tests/qemu-iotests/040
> > +++ b/tests/qemu-iotests/040
> > @@ -836,7 +836,8 @@ class TestCommitWithFilters(iotests.QMPTestCase):
> >                                job_id=3D'commit',
> >                                device=3D'top-filter',
> >                                top_node=3D'cow-2',
> > -                             base_node=3D'cow-1')
> > +                             base_node=3D'cow-1',
> > +                             backing_file=3Dself.img1)
> >           self.assert_qmp(result, 'return', {})
> >           self.wait_until_completed(drive=3D'commit')
> >
> > @@ -852,7 +853,8 @@ class TestCommitWithFilters(iotests.QMPTestCase):
> >                                job_id=3D'commit',
> >                                device=3D'top-filter',
> >                                top_node=3D'cow-1',
> > -                             base_node=3D'cow-0')
> > +                             base_node=3D'cow-0',
> > +                             backing_file=3Dself.img0)
> >           self.assert_qmp(result, 'return', {})
> >           self.wait_until_completed(drive=3D'commit')
> >
>
>

--00000000000000d04805db0c4ef3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Mar 25, 2022, 9:40 AM Hanna Reitz &lt;<a href=
=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On 24.03.22 19:30, John Snow wrote:<br>
&gt; Without this change, asserting that qemu_io always returns 0 causes th=
is<br>
&gt; test to fail in a way we happened not to be catching previously:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0qemu.utils.VerboseProcessError: Command<br>
&gt;=C2=A0 =C2=A0 &#39;(&#39;/home/jsnow/src/qemu/bin/git/tests/qemu-iotest=
s/../../qemu-io&#39;,<br>
&gt;=C2=A0 =C2=A0 &#39;--cache&#39;, &#39;writeback&#39;, &#39;--aio&#39;, =
&#39;threads&#39;, &#39;-f&#39;, &#39;qcow2&#39;, &#39;-c&#39;,<br>
&gt;=C2=A0 =C2=A0 &#39;read -P 4 3M 1M&#39;,<br>
&gt;=C2=A0 =C2=A0 &#39;/home/jsnow/src/qemu/bin/git/tests/qemu-iotests/scra=
tch/3.img&#39;)&#39;<br>
&gt;=C2=A0 =C2=A0 returned non-zero exit status 1.<br>
&gt;=C2=A0 =C2=A0 =E2=94=8F=E2=94=81 output =E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81<br>
&gt;=C2=A0 =C2=A0 =E2=94=83 qemu-io: can&#39;t open device<br>
&gt;=C2=A0 =C2=A0 =E2=94=83 /home/jsnow/src/qemu/bin/git/tests/qemu-iotests=
/scratch/3.img:<br>
&gt;=C2=A0 =C2=A0 =E2=94=83 Could not open backing file: Could not open bac=
king file: Throttle<br>
&gt;=C2=A0 =C2=A0 =E2=94=83 group &#39;tg&#39; does not exist<br>
&gt;=C2=A0 =C2=A0 =E2=94=97=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81<br>
&gt;<br>
&gt; Explicitly provide the backing file so that opening the file outside o=
f<br>
&gt; QEMU (Where we will not have throttle groups) will succeed.<br>
&gt;<br>
&gt; [Patch entirely written by Hanna but I don&#39;t have her S-o-B]<br>
<br>
Er, well, not sure if this even meets the necessary threshold of <br>
originality, so a Proposed-by would=E2=80=99ve been fine.<br></blockquote><=
/div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I have a dogmatic =
devotion to crediting others. You diagnosed and fixed the problem, not me!<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">(I realize it&#39;s a sm=
all thing, but still. I can&#39;t bring myself to put my name on something =
that isn&#39;t mine, even if it&#39;s tiny.)</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
<br>
Anyway, here you go:<br>
<br>
Signed-off-by: Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" target=
=3D"_blank" rel=3D"noreferrer">hreitz@redhat.com</a>&gt;<br>
<br>
&gt; [My commit message is probably also garbage, sorry]<br>
<br>
I don=E2=80=99t find it too bad, but a paragraph describing the actual prob=
lem <br>
might improve it.=C2=A0 E.g. (below the exception output):<br>
<br>
The commit jobs changes the backing file string stored in the image file <b=
r>
header belonging to the node above the commit=E2=80=99s top node to point t=
o the <br>
commit target (the base node).=C2=A0 QEMU tries to be as accurate as <br>
possible, and so in these test cases will include the filter that is <br>
part of the block graph in that backing file string (by virtue of making <b=
r>
it a json:{} description of the post-commit subgraph).=C2=A0 This makes <br=
>
little sense outside of QEMU, though: Specifically, the throttle node in <b=
r>
that subgraph will dearly miss its supposedly associated throttle group <br=
>
object.<br>
<br>
When starting the commit job, we can specify a custom backing file <br>
string to write into said image file, so let=E2=80=99s use that feature to =
write <br>
the plain filename of the backing chain=E2=80=99s next actual image file th=
ere.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"au=
to">Thanks :3</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><br>
&gt; [Feel free to suggest a better one]<br>
&gt; [I hope your day is going well]<br>
<br>
Fridays tend to be on the better side of days.<br>
<br>
Hanna<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Up there in my top three kinds of days.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/040 | 6 ++++--<br>
&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/tests/qemu-iotests/040 b/tests/qemu-iotests/040<br>
&gt; index c4a90937dc..30eb97829e 100755<br>
&gt; --- a/tests/qemu-iotests/040<br>
&gt; +++ b/tests/qemu-iotests/040<br>
&gt; @@ -836,7 +836,8 @@ class TestCommitWithFilters(iotests.QMPTestCase):<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 job_id=3D&#39;commit&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 device=3D&#39;top-filter&#39;,<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 top_node=3D&#39;cow-2&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base_node=3D&#39;cow-1&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base_node=3D&#39;cow-1&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0backing_file=3Dself.img1)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assert_qmp(result, &#39;r=
eturn&#39;, {})<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.wait_until_completed(driv=
e=3D&#39;commit&#39;)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -852,7 +853,8 @@ class TestCommitWithFilters(iotests.QMPTestCase):<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 job_id=3D&#39;commit&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 device=3D&#39;top-filter&#39;,<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 top_node=3D&#39;cow-1&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base_node=3D&#39;cow-0&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base_node=3D&#39;cow-0&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0backing_file=3Dself.img0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assert_qmp(result, &#39;r=
eturn&#39;, {})<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.wait_until_completed(driv=
e=3D&#39;commit&#39;)<br>
&gt;=C2=A0 =C2=A0<br>
<br>
</blockquote></div></div></div>

--00000000000000d04805db0c4ef3--


