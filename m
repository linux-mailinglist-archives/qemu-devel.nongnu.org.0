Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CA469B1B2
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 18:21:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT4Pc-0002Qz-6W; Fri, 17 Feb 2023 12:20:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pT4PP-0002ON-Dk
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:20:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pT4PK-0005oK-HY
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:20:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676654422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rrNBA+lSALqNi/As7CgzIcbUDVGfEvNNfH3TuToQ+pM=;
 b=VM9YuPzhov2PINHQSILGiUrvpvB+O0iMYc1UDOil3IKqU755qR1ggQ2/EZ4PszEe4bNak9
 +OwSFBPUOO2/6yNsCCjo8rgXJOiwh+LTVrE5oaop28xDsKkgHr3ZAbac2kw3/hcj2FSo4Q
 4z1m5W3NB7Nlkdt+zWtCzmWjmU8Xq0A=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-161-oLw4BXQhOvSgVs_mRK5yDg-1; Fri, 17 Feb 2023 12:20:20 -0500
X-MC-Unique: oLw4BXQhOvSgVs_mRK5yDg-1
Received: by mail-pj1-f71.google.com with SMTP id
 h88-20020a17090a29e100b00233fbf2cc15so1009138pjd.3
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 09:20:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rrNBA+lSALqNi/As7CgzIcbUDVGfEvNNfH3TuToQ+pM=;
 b=0Cs2YmmUELSlXa7hDuCLfR2efbQ2PQogmLbZ9++kf/tthT230lgNc+1YW/N+V2oOTL
 p7kklWfvQdMYYb91aGC6hLgcBfON1DA9081ySUq4Yw/rPHBcKH/EXmguS5KgSIIXbZOV
 jq9WqLY9majzDHCPb8gzBSNjSSXmzCokYa9FaxprLxJ4wm+5z4iKGbjx5fzPMutdYvte
 yj448nnhvUJ/YJ5RrRzby1bx3CmbeKSenrRWTm1GisUnJiLEy8WkfLQle+1dlzad24E3
 89jJnY+bv5T5hClBI2FnnwxIMwQMVr5GzbiHsddVFYeFoSXUug7m80EIljv1x4vf5dEu
 iPqg==
X-Gm-Message-State: AO0yUKVHXb3EUAOoDxPN+IPU+kNRDiveOsTH7+5kDwT+1eHanNN0qJUc
 fORXRm4qiwqPlsJUYXMc0dNx6Dze6LxDNiQVkC9bU/toRL6IyXaQd/GWbclkx2kBFjUUESs1ffA
 Filk2ujk9Ke7tOXt0YUjnMrrkhct3uPA=
X-Received: by 2002:a17:902:d489:b0:19a:9b8c:279f with SMTP id
 c9-20020a170902d48900b0019a9b8c279fmr172783plg.26.1676654419928; 
 Fri, 17 Feb 2023 09:20:19 -0800 (PST)
X-Google-Smtp-Source: AK7set/XcIJ5i4QC+hhluOcFq9GVvcnh0tLfEH0e8VL+uWrkB4dOQ28zpD9JAt7ztiEPWd4jJAtzvXD9BKSVv0lnXhg=
X-Received: by 2002:a17:902:d489:b0:19a:9b8c:279f with SMTP id
 c9-20020a170902d48900b0019a9b8c279fmr172760plg.26.1676654419639; Fri, 17 Feb
 2023 09:20:19 -0800 (PST)
MIME-Version: 1.0
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-8-alex.bennee@linaro.org>
 <CAFn=p-b18P0oOhiYPkoQvVzQfqVu4XLprp4-JMbPRF4y72-svQ@mail.gmail.com>
 <Y+6HjEUG2fpalQWv@redhat.com>
 <CAFn=p-b8nK8pNWk3WZgVqjUMx27E4ekeypjGpyk2nrRz=UmNJg@mail.gmail.com>
 <Y++2AK5cDgCGkpVN@redhat.com>
In-Reply-To: <Y++2AK5cDgCGkpVN@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 17 Feb 2023 12:20:08 -0500
Message-ID: <CAFn=p-ZhChwa-y8JCNRLyyVGZZWvtqFcUpcJB3a3DPgiPLME=Q@mail.gmail.com>
Subject: Re: [PATCH 07/12] testing: update ubuntu2004 to ubuntu2204
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>, 
 Alexander Bulekov <alxndr@bu.edu>, Qiuhao Li <Qiuhao.Li@outlook.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, 
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, 
 Li-Wen Hsu <lwhsu@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000018209605f4e887ab"
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

--00000000000018209605f4e887ab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 17, 2023, 12:14 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
>
wrote:

> On Fri, Feb 17, 2023 at 11:35:44AM -0500, John Snow wrote:
> > On Thu, Feb 16, 2023, 2:44 PM Daniel P. Berrang=C3=A9 <berrange@redhat.=
com>
> > wrote:
> >
> > > On Thu, Feb 16, 2023 at 01:15:30PM -0500, John Snow wrote:
> > > > On Wed, Feb 15, 2023 at 2:25 PM Alex Benn=C3=A9e <alex.bennee@linar=
o.org>
> > > wrote:
> > > > >
> > > > > The 22.04 LTS release has been out for almost a year now so its
> time
> > > > > to update all the remaining images to the current LTS. We can als=
o
> > > > > drop some hacks we need for older clang TSAN support.
> > > >
> > > > We still support Ubuntu 20.04 until 2024 though, don't we? Is it sa=
fe
> > > > to not test this platform?
> > > >
> > > > I've long been uncertain about what our policy actually is for dock=
er
> > > > tests, if we want to test every platform we support or only some of
> > > > them; and if it's only some of them, when do we choose the older an=
d
> > > > when do we choose the newer?
> > >
> > > Ideally we would test both the oldest & newest versions of each
> > > distro we support. Practically though, we're compromised by the
> > > limited CI resources available.
> > >
> >
> > Yes, understood.
> >
> >
> > > Dropping older Ubuntu images is a reasonable tradeoff, since we
> > > still have Debian images covered in CI. Debian can be thought
> > > of as an older version of Ubuntu to some extent, giving coverage
> > > that will mitigate the risks of dropping 20.04.
> > >
> >
> > Okay, I'll take your word for that. I am not personally familiar with h=
ow
> > much those distros diverge; I know Ubuntu is debian-based but that's th=
e
> > extent of my knowledge as I don't daily-drive either.
> >
> > So, firstly:
> >
> > Reviewed-by: John Snow <jsnow@redhat.com>
> >
> > because I suspect we all have our reasons and I also agree testing newe=
r
> is
> > generally of higher value than testing older.
> >
> > However, would it be possible to keep the older Ubuntu test as a manual
> > execution that we could invoke at will, only during RC testing phase? I=
f
> > it's not a lot of work, I could even check that in myself as a follow-u=
p
> if
> > it isn't unwanted.
> >
> > I find that "oldest version of x" is quite useful to me for testing
> Python
> > stuff in particular, as that ecosystem moves pretty fast. It'd be might=
y
> > convenient to me in particular to keep an old Ubuntu test around to run
> > manually as needed.
> >
> > (Heck, even if it wasn't on CI at all but was just a container I could
> run
> > locally, that would still be quite useful.)
> >
> > Whaddaya think?
>
> It would be pretty trivial to have tests/docker/dockerfiles contain
> Dockerfiles for *every* supported distro version we have, and then
> only build & test a subset in CI. It would merely suggest that we
> change our naming convention so the dockerfiles in that dir include
> the version. Basically adopting the standard libvirt-ci naming
> convention for targets of $OSNAME-$OSVERSION:
>
> $ lcitool targets
> almalinux-8
> almalinux-9
> alpine-315
> alpine-316
> alpine-edge
> centos-stream-8
> centos-stream-9
> debian-10
> debian-11
> debian-sid
> fedora-36
> fedora-37
> fedora-rawhide
> freebsd-12
> freebsd-13
> freebsd-current
> macos-12
> macos-13
>

Wait, what? How does this work??

opensuse-leap-153
> opensuse-leap-154
> opensuse-tumbleweed
> ubuntu-1804
> ubuntu-2004
> ubuntu-2204
>
> Contributors can then use 'make docker-XXXX' to run build tests
> locally on specific distros when they need to test something
> that isn't covered by default in out gating CI
>

OK, I might follow up on this, then. I would find this useful for proving
certain python build system changes are not disruptive.

In contrast to C world, I find modern Pythonisms sneak in with quite an
increased frequency, so having manual testing for the oldest platforms has
some value there, but only every once in a while. Not worth our CI minutes.

Carry on as normal for this series, please and thank you!


>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>

--00000000000018209605f4e887ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Feb 17, 2023, 12:14 PM Daniel P. Berrang=C3=A9=
 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">On Fri, Feb 17, 2023 at 11:35:4=
4AM -0500, John Snow wrote:<br>
&gt; On Thu, Feb 16, 2023, 2:44 PM Daniel P. Berrang=C3=A9 &lt;<a href=3D"m=
ailto:berrange@redhat.com" target=3D"_blank" rel=3D"noreferrer">berrange@re=
dhat.com</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Thu, Feb 16, 2023 at 01:15:30PM -0500, John Snow wrote:<br>
&gt; &gt; &gt; On Wed, Feb 15, 2023 at 2:25 PM Alex Benn=C3=A9e &lt;<a href=
=3D"mailto:alex.bennee@linaro.org" target=3D"_blank" rel=3D"noreferrer">ale=
x.bennee@linaro.org</a>&gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; The 22.04 LTS release has been out for almost a year no=
w so its time<br>
&gt; &gt; &gt; &gt; to update all the remaining images to the current LTS. =
We can also<br>
&gt; &gt; &gt; &gt; drop some hacks we need for older clang TSAN support.<b=
r>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; We still support Ubuntu 20.04 until 2024 though, don&#39;t w=
e? Is it safe<br>
&gt; &gt; &gt; to not test this platform?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I&#39;ve long been uncertain about what our policy actually =
is for docker<br>
&gt; &gt; &gt; tests, if we want to test every platform we support or only =
some of<br>
&gt; &gt; &gt; them; and if it&#39;s only some of them, when do we choose t=
he older and<br>
&gt; &gt; &gt; when do we choose the newer?<br>
&gt; &gt;<br>
&gt; &gt; Ideally we would test both the oldest &amp; newest versions of ea=
ch<br>
&gt; &gt; distro we support. Practically though, we&#39;re compromised by t=
he<br>
&gt; &gt; limited CI resources available.<br>
&gt; &gt;<br>
&gt; <br>
&gt; Yes, understood.<br>
&gt; <br>
&gt; <br>
&gt; &gt; Dropping older Ubuntu images is a reasonable tradeoff, since we<b=
r>
&gt; &gt; still have Debian images covered in CI. Debian can be thought<br>
&gt; &gt; of as an older version of Ubuntu to some extent, giving coverage<=
br>
&gt; &gt; that will mitigate the risks of dropping 20.04.<br>
&gt; &gt;<br>
&gt; <br>
&gt; Okay, I&#39;ll take your word for that. I am not personally familiar w=
ith how<br>
&gt; much those distros diverge; I know Ubuntu is debian-based but that&#39=
;s the<br>
&gt; extent of my knowledge as I don&#39;t daily-drive either.<br>
&gt; <br>
&gt; So, firstly:<br>
&gt; <br>
&gt; Reviewed-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=
=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; <br>
&gt; because I suspect we all have our reasons and I also agree testing new=
er is<br>
&gt; generally of higher value than testing older.<br>
&gt; <br>
&gt; However, would it be possible to keep the older Ubuntu test as a manua=
l<br>
&gt; execution that we could invoke at will, only during RC testing phase? =
If<br>
&gt; it&#39;s not a lot of work, I could even check that in myself as a fol=
low-up if<br>
&gt; it isn&#39;t unwanted.<br>
&gt; <br>
&gt; I find that &quot;oldest version of x&quot; is quite useful to me for =
testing Python<br>
&gt; stuff in particular, as that ecosystem moves pretty fast. It&#39;d be =
mighty<br>
&gt; convenient to me in particular to keep an old Ubuntu test around to ru=
n<br>
&gt; manually as needed.<br>
&gt; <br>
&gt; (Heck, even if it wasn&#39;t on CI at all but was just a container I c=
ould run<br>
&gt; locally, that would still be quite useful.)<br>
&gt; <br>
&gt; Whaddaya think?<br>
<br>
It would be pretty trivial to have tests/docker/dockerfiles contain<br>
Dockerfiles for *every* supported distro version we have, and then<br>
only build &amp; test a subset in CI. It would merely suggest that we<br>
change our naming convention so the dockerfiles in that dir include<br>
the version. Basically adopting the standard libvirt-ci naming<br>
convention for targets of $OSNAME-$OSVERSION:<br>
<br>
$ lcitool targets<br>
almalinux-8<br>
almalinux-9<br>
alpine-315<br>
alpine-316<br>
alpine-edge<br>
centos-stream-8<br>
centos-stream-9<br>
debian-10<br>
debian-11<br>
debian-sid<br>
fedora-36<br>
fedora-37<br>
fedora-rawhide<br>
freebsd-12<br>
freebsd-13<br>
freebsd-current<br>
macos-12<br>
macos-13<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Wait, what? How does this work??</div><div dir=3D"auto"><br></div=
><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
opensuse-leap-153<br>
opensuse-leap-154<br>
opensuse-tumbleweed<br>
ubuntu-1804<br>
ubuntu-2004<br>
ubuntu-2204<br>
<br>
Contributors can then use &#39;make docker-XXXX&#39; to run build tests<br>
locally on specific distros when they need to test something<br>
that isn&#39;t covered by default in out gating CI<br></blockquote></div></=
div><div dir=3D"auto"><br></div><div dir=3D"auto">OK, I might follow up on =
this, then. I would find this useful for proving certain python build syste=
m changes are not disruptive.</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">In contrast to C world, I find modern Pythonisms sneak in with quite =
an increased frequency, so having manual testing for the oldest platforms h=
as some value there, but only every once in a while. Not worth our CI minut=
es.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Carry on as normal f=
or this series, please and thank you!</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a h=
ref=3D"https://www.flickr.com/photos/dberrange" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://fstop138.berrange=
.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0=
 <a href=3D"https://www.instagram.com/dberrange" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div></div>

--00000000000018209605f4e887ab--


