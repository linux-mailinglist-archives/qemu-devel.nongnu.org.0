Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB9D5EDEE5
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 16:36:56 +0200 (CEST)
Received: from localhost ([::1]:47528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odYBD-00005F-6z
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 10:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1odWv8-0003XY-CZ
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 09:16:14 -0400
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36]:34556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1odWv4-0006gy-0n
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 09:16:14 -0400
Received: by mail-vk1-xa36.google.com with SMTP id b81so6421757vkf.1
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 06:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=qd2FnCRJflZK3DyqoewQK9GkEU8TaYMPllV4NMSuRBk=;
 b=zjcMD9gllxzLpMzdAZmpWihAQiTHL+Whp0p9E0tD6VYSMKegAw5noN6RybL7GofwNa
 uXcTQaF0T6nT3Qqf+HEP8sN0EG1Idm+HXTZN+NC1qPKyZmQSU25QjidreqGbvwO+Fgcp
 AeKKVrIEHknF0Z/euixDjykTodl31fpX0kRHV+q+lQuxK949ztDAVsDF30LoGXwkGIsM
 r4BkXE4TiSPWycwmlkXKHcA8GOihcPKFDHmeyi/iMt/EP7vTqs6sg9leiKESWkdqGwxh
 bMOF/2HTWBkLUx/j0J7EqiNjGKuxzE0UmwUOf7IrMyG36TINfQLwS8sH4162CP+XYIqy
 JxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=qd2FnCRJflZK3DyqoewQK9GkEU8TaYMPllV4NMSuRBk=;
 b=Yw43gqVebFPWwTKifuGqpahhzxp0DZsRXBQlWHir79tqnrFdqeQywB15WZGus5tkvg
 6bX/kXy6r8q9SuSX4boPHIzp0/4AyDq3yrXWnwXKyZcME+rh/oIkp92u4VXpjabf4xTt
 bIhMYXS1cKa4ixhGKqRfckIVOiYbffekmrez1IyDO0HkFnIaLyYve7nTRR9RxP05P7+8
 IzWTOkmIqzcRx9CzoFanQo6D/d1yzqqNCqcXGfj7dJbepyUc+lWueZIQxxKZrM4duEgz
 D3ahCwAMLHZ2oLySMYGcG7p+phXA8N1fzHn+JBfwbjyVZsCRm7WNK7sYjMzRgpoJtWdv
 JYkw==
X-Gm-Message-State: ACrzQf0RoQxevw42r4JVpciHD9ewyfUV1jL49C9LaVIaKISG3Bat0zbU
 bYNQmXSxQn1/ygzOp/V4GWunROq55SzglrFv+bZEOQ==
X-Google-Smtp-Source: AMsMyM4O7Q4H75kdbCSp0hbraN5DnETLLWoupErjRDSfDnPgp4TuNmJMBhQrbJHsPFBQkxQ2HF78CCTJy9IwzLcIwPg=
X-Received: by 2002:a1f:7384:0:b0:3a3:f1b1:986f with SMTP id
 o126-20020a1f7384000000b003a3f1b1986fmr14237313vkc.13.1664370964580; Wed, 28
 Sep 2022 06:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
 <20220628060210-mutt-send-email-mst@kernel.org>
 <d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com>
 <20220928052352-mutt-send-email-mst@kernel.org> <YzQVyj5ouhGshZ2+@redhat.com>
 <20220928054803-mutt-send-email-mst@kernel.org> <YzQam+F1HEu5g52A@redhat.com>
In-Reply-To: <YzQam+F1HEu5g52A@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 28 Sep 2022 07:15:53 -0600
Message-ID: <CANCZdfo0iyw3TGOmp=UHgV7dY8ZVX1DVs58Cdj_GufL-QN48zQ@mail.gmail.com>
Subject: Re: Why we should avoid new submodules if possible
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, 
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000020401e05e9bc90d7"
Received-SPF: none client-ip=2607:f8b0:4864:20::a36;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000020401e05e9bc90d7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 28, 2022 at 7:09 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Wed, Sep 28, 2022 at 05:53:17AM -0400, Michael S. Tsirkin wrote:
> > On Wed, Sep 28, 2022 at 10:37:14AM +0100, Daniel P. Berrang=C3=A9 wrote=
:
> > > On Wed, Sep 28, 2022 at 05:26:42AM -0400, Michael S. Tsirkin wrote:
> > > > On Tue, Jun 28, 2022 at 12:21:39PM +0200, Thomas Huth wrote:
> > > > > On 28/06/2022 12.03, Michael S. Tsirkin wrote:
> > > > > [...]
> > > > > > For biosbits if we are going this route then I feel a submodule
> is much
> > > > > > better.  It records which version exactly each qemu version
> wants.
> > > > >
> > > > > As far as I know, you can also specify the version when using pip=
,
> can't
> > > > > you? So that's not really an advantage here.
> > > > >
> > > > > On the contrary, submodules have a couple of disadvantages that I
> really
> > > > > dislike:
> > > > >
> > > > > - submodules do not get updated automatically when doing a "git
> checkout",
> > > > > we have to update them via a script instead. This causes e.g.
> trouble if you
> > > > > rsync your source tree to a machine that has no access to the
> internet and
> > > > > you forgot to update the submodule before the sync
> > > > >
> > > > > - the content of submodules is not added to the tarballs that get
> created on
> > > > > the git forges automatically. There were lots of requests from
> users in the
> > > > > past that tried to download a tarball from github and then
> wondered why they
> > > > > couldn't compile QEMU.
> > > > >
> > > > > - we include the submodule content in our release tarballs, so
> people get
> > > > > the impression that hte submodule content is part of the QEMU
> sources. This
> > > > > has two disadvantages:
> > > > >  * We already got bug reports for the code in the submodule,
> > > > >    where people did not understand that they should report that
> > > > >    rather to the original project instead (i.e. you ship it - you
> > > > >    own it)
> > > > >  * People get the impression that QEMU is a huge monster
> > > > >    application if they count the number of code lines, run
> > > > >    their code scanner tools on the tarball contents, etc.
> > > > >    Remember "nemu", for example, where one of the main complaints
> > > > >    was that QEMU has too many lines of code?
> > > > >
> > > > > - If programs includes code via submodules, this gets a higher
> > > > >   burder for distro maintainers, since they have to patch each
> > > > >   and every package when there is a bug, instead of being able to
> > > > >   fix it in one central place.
> > > > >
> > > > > So in my opinion we should avoid new submodules if there is an
> alternative.
> > > > >
> > > > >  Thomas
> > > >
> > > > So looking at the latest proposals downloading files from CI,
> > > > checksumming them etc etc. No auto checkout, not added automaticall=
y
> > > > either, right?
> > > >
> > > > This seems to be the only difference:
> > > > - we include the submodule content in our release tarballs
> > >
> > > That's just one of the issues with submodules. Working with them in
> general
> > > is not a pleasant experiance.
> >
> > This is what I asked about at the maintainers summit.
> > I'd like to map the issues and see if there's anything
> > we can do to solve them. In particular we will likely
> > keep using submodules where we historically did
> > so it's time well spent.
> >
> > I agree generally but the big question is what to replace these with.
> > Below I assume the replacement is a script such as avocado or pytest
> > with its own hashing, calling wget internally etc etc.
> >
> >
> > > Thomas pointed out some of the issues, such
> > > as 'git checkout' ignoring submodules, requiring extra steps to sync
> them.
> >
> >
> > Not different from a home grown SCM as part of test script, right?
>
> We're not building a home grown SCM as part of a test script, so
> this answer is irrelevant.
>
> > > There's also the perenial problem that developers frequently send
> > > patches that mistakenly include submodule changes,
> >
> > OK, so the thing to do would be to look for ways to exclude submodule
> changes
> > from git commits.
>
> If someone wants to make git suck less with submodules great, but needs
> someone to actually do the work.
>

A big part of the problem is knowing which of the following commands I have
to
do to undo the uncommitted changes, the committed changes, the staged
changes,
etc:

git submodule update --init --recursive
git submodule update --init
git submodule foreach --recursive git reset --hard
git submodule foreach --recursive git clean -xfd
git submodule foreach --recursive git clean -xfg

(all of these are in my history, I honestly don't know the difference
between the last two).
And each 'oops' takes time away from upstreaming bsd-user I don't really
have that
much of. I've wasted hours on this over the past year between all the
different ways
it can screw up.

To be fair, it is a relatively small fraction of the time, but as you can
tell from the
animation in my email it inspires much passion.

Warner


> > > I'd really like to see us doing more to eliminate as much use of
> submodules
> > > as is possible over time.p
> >
> > Or try to fix the problems, right?
>
> Again needs someone to actually make it happen.
>
> Meanwhile  QEMU already has an integrated test harness in the form
> of Avocado that does everything needed. If Avocado had just been
> used for this biosbits test in the first place, the test would
> likely have already been merged to QEMU, instead of us having this
> never ending debate on how to re-invent an alternative to what
> already avocado does.
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
>

--00000000000020401e05e9bc90d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 28, 2022 at 7:09 AM Danie=
l P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Wed, Sep 28, 2022 at 05:53:17AM -0400, Michael S. Tsirkin wrote:<b=
r>
&gt; On Wed, Sep 28, 2022 at 10:37:14AM +0100, Daniel P. Berrang=C3=A9 wrot=
e:<br>
&gt; &gt; On Wed, Sep 28, 2022 at 05:26:42AM -0400, Michael S. Tsirkin wrot=
e:<br>
&gt; &gt; &gt; On Tue, Jun 28, 2022 at 12:21:39PM +0200, Thomas Huth wrote:=
<br>
&gt; &gt; &gt; &gt; On 28/06/2022 12.03, Michael S. Tsirkin wrote:<br>
&gt; &gt; &gt; &gt; [...]<br>
&gt; &gt; &gt; &gt; &gt; For biosbits if we are going this route then I fee=
l a submodule is much<br>
&gt; &gt; &gt; &gt; &gt; better.=C2=A0 It records which version exactly eac=
h qemu version wants.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; As far as I know, you can also specify the version when=
 using pip, can&#39;t<br>
&gt; &gt; &gt; &gt; you? So that&#39;s not really an advantage here.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; On the contrary, submodules have a couple of disadvanta=
ges that I really<br>
&gt; &gt; &gt; &gt; dislike:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; - submodules do not get updated automatically when doin=
g a &quot;git checkout&quot;,<br>
&gt; &gt; &gt; &gt; we have to update them via a script instead. This cause=
s e.g. trouble if you<br>
&gt; &gt; &gt; &gt; rsync your source tree to a machine that has no access =
to the internet and<br>
&gt; &gt; &gt; &gt; you forgot to update the submodule before the sync<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; - the content of submodules is not added to the tarball=
s that get created on<br>
&gt; &gt; &gt; &gt; the git forges automatically. There were lots of reques=
ts from users in the<br>
&gt; &gt; &gt; &gt; past that tried to download a tarball from github and t=
hen wondered why they<br>
&gt; &gt; &gt; &gt; couldn&#39;t compile QEMU.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; - we include the submodule content in our release tarba=
lls, so people get<br>
&gt; &gt; &gt; &gt; the impression that hte submodule content is part of th=
e QEMU sources. This<br>
&gt; &gt; &gt; &gt; has two disadvantages:<br>
&gt; &gt; &gt; &gt;=C2=A0 * We already got bug reports for the code in the =
submodule,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 where people did not understand that they =
should report that<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 rather to the original project instead (i.=
e. you ship it - you<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 own it)<br>
&gt; &gt; &gt; &gt;=C2=A0 * People get the impression that QEMU is a huge m=
onster<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 application if they count the number of co=
de lines, run<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 their code scanner tools on the tarball co=
ntents, etc.<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 Remember &quot;nemu&quot;, for example, wh=
ere one of the main complaints<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 was that QEMU has too many lines of code?<=
br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; - If programs includes code via submodules, this gets a=
 higher<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0burder for distro maintainers, since they h=
ave to patch each<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0and every package when there is a bug, inst=
ead of being able to<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0fix it in one central place.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; So in my opinion we should avoid new submodules if ther=
e is an alternative.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt;=C2=A0 Thomas<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; So looking at the latest proposals downloading files from CI=
,<br>
&gt; &gt; &gt; checksumming them etc etc. No auto checkout, not added autom=
atically<br>
&gt; &gt; &gt; either, right?<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; This seems to be the only difference:<br>
&gt; &gt; &gt; - we include the submodule content in our release tarballs<b=
r>
&gt; &gt; <br>
&gt; &gt; That&#39;s just one of the issues with submodules. Working with t=
hem in general<br>
&gt; &gt; is not a pleasant experiance.<br>
&gt; <br>
&gt; This is what I asked about at the maintainers summit.<br>
&gt; I&#39;d like to map the issues and see if there&#39;s anything<br>
&gt; we can do to solve them. In particular we will likely<br>
&gt; keep using submodules where we historically did<br>
&gt; so it&#39;s time well spent.<br>
&gt; <br>
&gt; I agree generally but the big question is what to replace these with.<=
br>
&gt; Below I assume the replacement is a script such as avocado or pytest<b=
r>
&gt; with its own hashing, calling wget internally etc etc.<br>
&gt; <br>
&gt; <br>
&gt; &gt; Thomas pointed out some of the issues, such<br>
&gt; &gt; as &#39;git checkout&#39; ignoring submodules, requiring extra st=
eps to sync them.<br>
&gt; <br>
&gt; <br>
&gt; Not different from a home grown SCM as part of test script, right?<br>
<br>
We&#39;re not building a home grown SCM as part of a test script, so<br>
this answer is irrelevant.<br>
<br>
&gt; &gt; There&#39;s also the perenial problem that developers frequently =
send<br>
&gt; &gt; patches that mistakenly include submodule changes,<br>
&gt; <br>
&gt; OK, so the thing to do would be to look for ways to exclude submodule =
changes<br>
&gt; from git commits.<br>
<br>
If someone wants to make git suck less with submodules great, but needs<br>
someone to actually do the work.<br></blockquote><div><br></div><div>A big =
part of the problem is knowing which of the following commands I have to</d=
iv><div>do to undo the uncommitted changes, the committed changes, the stag=
ed changes,</div><div>etc:</div><div><br></div><div>git submodule update --=
init --recursive<br></div><div>git submodule update --init<br></div><div>gi=
t submodule foreach --recursive git reset --hard<br></div><div>git submodul=
e foreach --recursive git clean -xfd<br></div><div>git submodule foreach --=
recursive git clean -xfg<br></div><div><br></div><div>(all of these are in =
my history, I honestly don&#39;t know the difference between the last two).=
</div><div>And each &#39;oops&#39; takes time away from upstreaming bsd-use=
r I don&#39;t really have that</div><div>much of. I&#39;ve wasted hours on =
this over the past year between all the different ways</div><div>it can scr=
ew up.</div><div><br></div><div>To be fair, it is a relatively small fracti=
on of the time, but as you can tell from the</div><div>animation in my emai=
l it inspires much passion.</div><div><br></div><div>Warner</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; &gt; I&#39;d really like to see us doing more to eliminate as much use=
 of submodules<br>
&gt; &gt; as is possible over time.p<br>
&gt; <br>
&gt; Or try to fix the problems, right?<br>
<br>
Again needs someone to actually make it happen.<br>
<br>
Meanwhile=C2=A0 QEMU already has an integrated test harness in the form<br>
of Avocado that does everything needed. If Avocado had just been<br>
used for this biosbits test in the first place, the test would<br>
likely have already been merged to QEMU, instead of us having this<br>
never ending debate on how to re-invent an alternative to what<br>
already avocado does.<br>
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
<br>
</blockquote></div></div>

--00000000000020401e05e9bc90d7--

