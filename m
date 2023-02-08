Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D1A68FAD6
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 00:03:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPtSA-0005T3-Nf; Wed, 08 Feb 2023 18:02:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pPtS4-0005Sk-99
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 18:02:09 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pPtS0-000053-Uk
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 18:02:08 -0500
Received: by mail-ed1-x531.google.com with SMTP id a10so511618edu.9
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 15:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/WxcOKPVmxxZLb+KPshRUMTBAoDCDYLU0ToYWsFp8wo=;
 b=miVD0rSDuPi1vq3cAHtddZFe7kMNZ15gVjlMe+pnxa/w66cDJHOpMXaoBbj+wxOHrb
 AtZA8nja+KHoRMvKQF82RLImPa40UssvbLjrAwJ5PPn9O+aidzQYuu37X42hI3c8iaMR
 pLZEPOEk/lN7IjXkAh+8kyvzVbZqL8e9AKaJJhrmFHA+Q/WHugdcXqGi3K/LfH4QSw6b
 K7tP3+8CZBhgcCqRmGHQRjGBeXaST1apvrR9RujFDujAkCvZ+IbpIiwtaCzA0zzQXl8b
 BbphLm3FEPqydDyvHC+a4EodWdUmjno7mGeHOW98mvCPc0moo/fukPmSEyDc/xSCuvFV
 rWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/WxcOKPVmxxZLb+KPshRUMTBAoDCDYLU0ToYWsFp8wo=;
 b=yT3YDTOj6c9vUN1cFLqNeHsrnecP1SytfyGyG0m3lZPZB4urNZHi5Nlgmhg883gxb7
 XOwIWMPPJfz31GoUydfmAcIY4yK9Or34fU5MHiK5c2Sycx97/wUYnwG3/wYI1NKvIzG4
 o7Qb184sjr6xCC6DoAGLp/D2HARHoxHkN94kICty/Ir4vCauP+wDNtPTcAQMCmDMN2e+
 z1CtJqvUeRkVj7t2NFxB26F8ZSuy6a3PViIkNXm7Cof6ocSjuG6/ut9czjCZEmuJXElk
 wYTS83kDrey7t0kf/Y9x7AHrlBMPI+neCVi+CYUyWsK7pzLJ7FCkb34DGuRjxi3M09AP
 STgg==
X-Gm-Message-State: AO0yUKUQRh53QlUV8KitoMajdHmb5FgJb5mimq4j6tQgAsEadbQxJZJY
 ZAGPYGxO82F0W3Gt2Pts9QmPZvHo4OU0Vluj/Z19qw==
X-Google-Smtp-Source: AK7set+NaaqphxMcJDECj8tRodKJSB+2FRGb2FQBpvukZkjz+VbNtQs6RCeVKPh2e7ps9jTGAMTxgAWayiul4JPWo8w=
X-Received: by 2002:a50:f687:0:b0:4ab:15c4:c417 with SMTP id
 d7-20020a50f687000000b004ab15c4c417mr765496edn.81.1675897322462; Wed, 08 Feb
 2023 15:02:02 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QUuuZLC0DJNEfZ7amyd3XnRhRNr1k+1OgLfDeF77X1ZDQ@mail.gmail.com>
 <CANCZdfo=Ay6ZYniYLYC=L2DCYKQ2-sS8zxwx+J_N5jZ3PO8XPQ@mail.gmail.com>
 <CAJSP0QXFcUq4XTA6_oQAzvhs_A-PGrjTRDqhQ8N-We0jtHnRNg@mail.gmail.com>
In-Reply-To: <CAJSP0QXFcUq4XTA6_oQAzvhs_A-PGrjTRDqhQ8N-We0jtHnRNg@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 8 Feb 2023 16:01:51 -0700
Message-ID: <CANCZdfp0LJTkG1cPF0W0Oc8cJ2wW_+mxeSW7YWWtkCNjdkx3Jg@mail.gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2023
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000095fd2405f4384078"
Received-SPF: none client-ip=2a00:1450:4864:20::531;
 envelope-from=wlosh@bsdimp.com; helo=mail-ed1-x531.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000095fd2405f4384078
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 27, 2023 at 3:02 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:

> On Fri, 27 Jan 2023 at 12:10, Warner Losh <imp@bsdimp.com> wrote:
> >
> > [[ cc list trimmed to just qemu-devel ]]
> >
> > On Fri, Jan 27, 2023 at 8:18 AM Stefan Hajnoczi <stefanha@gmail.com>
> wrote:
> >>
> >> Dear QEMU, KVM, and rust-vmm communities,
> >> QEMU will apply for Google Summer of Code 2023
> >> (https://summerofcode.withgoogle.com/) and has been accepted into
> >> Outreachy May 2023 (https://www.outreachy.org/). You can now
> >> submit internship project ideas for QEMU, KVM, and rust-vmm!
> >>
> >> Please reply to this email by February 6th with your project ideas.
> >>
> >> If you have experience contributing to QEMU, KVM, or rust-vmm you can
> >> be a mentor. Mentors support interns as they work on their project.
> It's a
> >> great way to give back and you get to work with people who are just
> >> starting out in open source.
> >>
> >> Good project ideas are suitable for remote work by a competent
> >> programmer who is not yet familiar with the codebase. In
> >> addition, they are:
> >> - Well-defined - the scope is clear
> >> - Self-contained - there are few dependencies
> >> - Uncontroversial - they are acceptable to the community
> >> - Incremental - they produce deliverables along the way
> >>
> >> Feel free to post ideas even if you are unable to mentor the project.
> >> It doesn't hurt to share the idea!
> >
> >
> > I've been a GSoC mentor for the FreeBSD project on and off for maybe
> > 10-15 years now. I thought I'd share this for feedback here.
> >
> > My project idea falls between the two projects. I've been trying
> > to get bsd-user reviewed and upstreamed for some time now and my
> > time available to do the upstreaming has been greatly diminished lately.
> > It got me thinking: upstreaming is more than just getting patches
> reviewed
> > often times. While there is a rather mechanical aspect to it (and I
> could likely
> > automate that aspect more), the real value of going through the review
> process
> > is that it points out things that had been done wrong, things that need
> to be
> > redone or refactored, etc. It's often these suggestions that lead to the
> biggest
> > investment of time on my part: Is this idea good? if I do it, does it
> break things?
> > Is the feedback right about what's wrong, but wrong about how to fix it?
> etc.
> > Plus the inevitable, I thought this was a good idea, implemented it only
> to find
> > it broke other things, and how do I explain that and provide feedback to
> the
> > reviewer about that breakage to see if it is worth pursuing further or
> not?
> >
> > So my idea for a project is two fold: First, to create scripts to
> automate the
> > upstreaming process: to break big files into bite-sized chunks for
> review on
> > this list. git publish does a great job from there. The current backlog
> to upstream
> > is approximately " 175 files changed, 30270 insertions(+), 640
> deletions(-)" which
> > is 300-600 patches at the 50-100 line patch guidance I've been given. So
> even
> > at .1hr (6 minutes) per patch (which is about 3x faster than I can do it
> by hand),
> > that's ~60 hours just to create the patches. Writing automation should
> take
> > much less time. Realistically, this is on the order of 10-20 hours to
> get done.
> >
> > Second, it's to take feedback from the reviews for refactoring
> > the bsd-user code base (which will eventually land in upstream). I often
> spend
> > a few hours creating my patches each quarter, then about 10 or so hours
> for the
> > 30ish patches that I do processing the review feedback by refactoring
> other things
> > (typically other architectures), checking details of other architectures
> (usually by
> > looking at the FreeBSD kernel), or looking for ways to refactor to share
> code with
> > linux-user  (though so far only the safe signals is upstream: elf could
> be too), or
> > chatting online about the feedback to better understand it, to see what
> I can mine
> > from linux-user (since the code is derived from that, but didn't pick up
> all the changes
> > linus-user has), etc. This would be on the order of 100 hours.
> >
> > Third, the testing infrastructure that exists for linux-user is not well
> leveraged to test
> > bsd-user. I've done some tests from time to time with it, but it's not
> in a state that it
> > can be used as, say, part of a CI pipeline. In addition, the FreeBSD
> project has some
> > very large jobs, a subset of which could be used to further ensure that
> critical bits of
> > infrastructure don't break (or are working if not in a CI pipeline).
> Things like building
> > and using go, rust and the like are constantly breaking for reasons too
> long to enumerate
> > here. This job could be as little as 50 hours to do a minimal but
> complete enough for CI job,
> > or as much as 200 hours to do a more complete jobs that could be used to
> bisect breakage
> > more quickly and give good assurance that at any given time bsd-user is
> useful and working.
> >
> > That's in addition to growing the number of people that can work on this
> code and
> > on the *-user code in general since they are quite similar.
> >
> > Some of these tasks are squarely in the qemu-realm, while others are in
> the FreeBSD realm,
> > but that's similar to linux-user which requires very heavy interfacing
> with the linux realm. It's
> > just that a lot of that work is already complete so the needs are
> substantially less there on an
> > ongoing basis. Since it does stratal the two projects, I'm unsure where
> to propose this project
> > be housed. But since this is a call for ideas, I thought I'd float it to
> see what the feedback is. I'm
> > happy to write this up in a more formal sense if it would be seriously
> considered, but want to get
> > feedback as to what areas I might want to emphasize in such a proposal.
> >
> > Comments?
>
> Hi Warner,
> Don't worry about it spanning FreeBSD and QEMU, you're welcome to list
> the project idea through QEMU. You can have co-mentors that are not
> part of the QEMU community in order to bring in additional FreeBSD
> expertise.
>
> My main thought is that getting all code upstream sounds like a
> sprawling project that likely won't be finished within one internship.
> Can you pick just a subset of what you described? It should be a
> well-defined project that depends minimally on other people finishing
> stuff or reaching agreement on something controversial? That way the
> intern will be able to come up with specific tasks for their project
> plan and there is little risk that they can't complete them due to
> outside factors.
>

I like this notion of limiting the  scope. There's three or maybe four main
areas
that I can call out. I got to thinking about all the details I have to do
for how
I've been upstreaming things, and realized that there's a lot due to the
complicated
history here...

One way to go about this might be for you to define a milestone that
> involves completing, testing, and upstreaming just a subset of the
> out-of-tree code. For example, it might implement a limited set of
> core syscall families. The intern will then focus on delivering that
> instead of worrying about the daunting task of getting everything
> merged. Finishing this subset would advance bsd-user FreeBSD support
> by a useful degree (e.g. ability to run certain applications).
>
> Does that sound good?
>

Yes. I like this, but it's hard to know what that might be because many
things are
hidden behind the scenes... But I'll try running a quick build to see if I
can gather
enough stats to come up with a good set of tests... But maybe I'll start
with building
'hello world' with clang on armv7 running on an amd64 host to see what's
missing
today. I also have an aarch64 set of patches I might try hard to get in
ASAP so that
might be the target instead (since it might be a bit more useful).

Warner


> Stefan
>

--00000000000095fd2405f4384078
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 27, 2023 at 3:02 PM Stefa=
n Hajnoczi &lt;<a href=3D"mailto:stefanha@gmail.com">stefanha@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On F=
ri, 27 Jan 2023 at 12:10, Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com"=
 target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;<br>
&gt; [[ cc list trimmed to just qemu-devel ]]<br>
&gt;<br>
&gt; On Fri, Jan 27, 2023 at 8:18 AM Stefan Hajnoczi &lt;<a href=3D"mailto:=
stefanha@gmail.com" target=3D"_blank">stefanha@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Dear QEMU, KVM, and rust-vmm communities,<br>
&gt;&gt; QEMU will apply for Google Summer of Code 2023<br>
&gt;&gt; (<a href=3D"https://summerofcode.withgoogle.com/" rel=3D"noreferre=
r" target=3D"_blank">https://summerofcode.withgoogle.com/</a>) and has been=
 accepted into<br>
&gt;&gt; Outreachy May 2023 (<a href=3D"https://www.outreachy.org/" rel=3D"=
noreferrer" target=3D"_blank">https://www.outreachy.org/</a>). You can now<=
br>
&gt;&gt; submit internship project ideas for QEMU, KVM, and rust-vmm!<br>
&gt;&gt;<br>
&gt;&gt; Please reply to this email by February 6th with your project ideas=
.<br>
&gt;&gt;<br>
&gt;&gt; If you have experience contributing to QEMU, KVM, or rust-vmm you =
can<br>
&gt;&gt; be a mentor. Mentors support interns as they work on their project=
. It&#39;s a<br>
&gt;&gt; great way to give back and you get to work with people who are jus=
t<br>
&gt;&gt; starting out in open source.<br>
&gt;&gt;<br>
&gt;&gt; Good project ideas are suitable for remote work by a competent<br>
&gt;&gt; programmer who is not yet familiar with the codebase. In<br>
&gt;&gt; addition, they are:<br>
&gt;&gt; - Well-defined - the scope is clear<br>
&gt;&gt; - Self-contained - there are few dependencies<br>
&gt;&gt; - Uncontroversial - they are acceptable to the community<br>
&gt;&gt; - Incremental - they produce deliverables along the way<br>
&gt;&gt;<br>
&gt;&gt; Feel free to post ideas even if you are unable to mentor the proje=
ct.<br>
&gt;&gt; It doesn&#39;t hurt to share the idea!<br>
&gt;<br>
&gt;<br>
&gt; I&#39;ve been a GSoC mentor for the FreeBSD project on and off for may=
be<br>
&gt; 10-15 years now. I thought I&#39;d share this for feedback here.<br>
&gt;<br>
&gt; My project idea falls between the two projects. I&#39;ve been trying<b=
r>
&gt; to get bsd-user reviewed and upstreamed for some time now and my<br>
&gt; time available to do the upstreaming has been greatly diminished latel=
y.<br>
&gt; It got me thinking: upstreaming is more than just getting patches revi=
ewed<br>
&gt; often times. While there is a rather mechanical aspect to it (and I co=
uld likely<br>
&gt; automate that aspect more), the real value of going through the review=
 process<br>
&gt; is that it points out things that had been done wrong, things that nee=
d to be<br>
&gt; redone or refactored, etc. It&#39;s often these suggestions that lead =
to the biggest<br>
&gt; investment of time on my part: Is this idea good? if I do it, does it =
break things?<br>
&gt; Is the feedback right about what&#39;s wrong, but wrong about how to f=
ix it? etc.<br>
&gt; Plus the inevitable, I thought this was a good idea, implemented it on=
ly to find<br>
&gt; it broke other things, and how do I explain that and provide feedback =
to the<br>
&gt; reviewer about that breakage to see if it is worth pursuing further or=
 not?<br>
&gt;<br>
&gt; So my idea for a project is two fold: First, to create scripts to auto=
mate the<br>
&gt; upstreaming process: to break big files into bite-sized chunks for rev=
iew on<br>
&gt; this list. git publish does a great job from there. The current backlo=
g to upstream<br>
&gt; is approximately &quot; 175 files changed, 30270 insertions(+), 640 de=
letions(-)&quot; which<br>
&gt; is 300-600 patches at the 50-100 line patch guidance I&#39;ve been giv=
en. So even<br>
&gt; at .1hr (6 minutes) per patch (which is about 3x faster than I can do =
it by hand),<br>
&gt; that&#39;s ~60 hours just to create the patches. Writing automation sh=
ould take<br>
&gt; much less time. Realistically, this is on the order of 10-20 hours to =
get done.<br>
&gt;<br>
&gt; Second, it&#39;s to take feedback from the reviews for refactoring<br>
&gt; the bsd-user code base (which will eventually land in upstream). I oft=
en spend<br>
&gt; a few hours creating my patches each quarter, then about 10 or so hour=
s for the<br>
&gt; 30ish patches that I do processing the review feedback by refactoring =
other things<br>
&gt; (typically other architectures), checking details of other architectur=
es (usually by<br>
&gt; looking at the FreeBSD kernel), or looking for ways to refactor to sha=
re code with<br>
&gt; linux-user=C2=A0 (though so far only the safe signals is upstream: elf=
 could be too), or<br>
&gt; chatting online about the feedback to better understand it, to see wha=
t I can mine<br>
&gt; from linux-user (since the code is derived from that, but didn&#39;t p=
ick up all the changes<br>
&gt; linus-user has), etc. This would be on the order of 100 hours.<br>
&gt;<br>
&gt; Third, the testing infrastructure that exists for linux-user is not we=
ll leveraged to test<br>
&gt; bsd-user. I&#39;ve done some tests from time to time with it, but it&#=
39;s not in a state that it<br>
&gt; can be used as, say, part of a CI pipeline. In addition, the FreeBSD p=
roject has some<br>
&gt; very large jobs, a subset of which could be used to further ensure tha=
t critical bits of<br>
&gt; infrastructure don&#39;t break (or are working if not in a CI pipeline=
). Things like building<br>
&gt; and using go, rust and the like are constantly breaking for reasons to=
o long to enumerate<br>
&gt; here. This job could be as little as 50 hours to do a minimal but comp=
lete enough for CI job,<br>
&gt; or as much as 200 hours to do a more complete jobs that could be used =
to bisect breakage<br>
&gt; more quickly and give good assurance that at any given time bsd-user i=
s useful and working.<br>
&gt;<br>
&gt; That&#39;s in addition to growing the number of people that can work o=
n this code and<br>
&gt; on the *-user code in general since they are quite similar.<br>
&gt;<br>
&gt; Some of these tasks are squarely in the qemu-realm, while others are i=
n the FreeBSD realm,<br>
&gt; but that&#39;s similar to linux-user which requires very heavy interfa=
cing with the linux realm. It&#39;s<br>
&gt; just that a lot of that work is already complete so the needs are subs=
tantially less there on an<br>
&gt; ongoing basis. Since it does stratal the two projects, I&#39;m unsure =
where to propose this project<br>
&gt; be housed. But since this is a call for ideas, I thought I&#39;d float=
 it to see what the feedback is. I&#39;m<br>
&gt; happy to write this up in a more formal sense if it would be seriously=
 considered, but want to get<br>
&gt; feedback as to what areas I might want to emphasize in such a proposal=
.<br>
&gt;<br>
&gt; Comments?<br>
<br>
Hi Warner,<br>
Don&#39;t worry about it spanning FreeBSD and QEMU, you&#39;re welcome to l=
ist<br>
the project idea through QEMU. You can have co-mentors that are not<br>
part of the QEMU community in order to bring in additional FreeBSD<br>
expertise.<br>
<br>
My main thought is that getting all code upstream sounds like a<br>
sprawling project that likely won&#39;t be finished within one internship.<=
br>
Can you pick just a subset of what you described? It should be a<br>
well-defined project that depends minimally on other people finishing<br>
stuff or reaching agreement on something controversial? That way the<br>
intern will be able to come up with specific tasks for their project<br>
plan and there is little risk that they can&#39;t complete them due to<br>
outside factors.<br></blockquote><div><br></div><div>I like this notion of =
limiting the=C2=A0 scope. There&#39;s three or maybe four main areas</div><=
div>that I can call out. I got to thinking about all the details I have to =
do for how</div><div>I&#39;ve been upstreaming things, and realized that th=
ere&#39;s a lot due to the complicated</div><div>history here...</div><div>=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
One way to go about this might be for you to define a milestone that<br>
involves completing, testing, and upstreaming just a subset of the<br>
out-of-tree code. For example, it might implement a limited set of<br>
core syscall families. The intern will then focus on delivering that<br>
instead of worrying about the daunting task of getting everything<br>
merged. Finishing this subset would advance bsd-user FreeBSD support<br>
by a useful degree (e.g. ability to run certain applications).<br>
<br>
Does that sound good?<br></blockquote><div><br></div><div>Yes. I like this,=
 but it&#39;s hard to know what that might be because many things are</div>=
<div>hidden behind the scenes... But I&#39;ll try running a quick build to =
see if I can gather</div><div>enough stats to come up with a good set of te=
sts... But maybe I&#39;ll start with building</div><div>&#39;hello world&#3=
9; with clang on armv7 running on an amd64 host to see what&#39;s missing</=
div><div>today. I also have an aarch64 set of patches I might try hard to g=
et in ASAP so that</div><div>might be the target instead (since it might be=
 a bit more useful).</div><div><br></div><div>Warner</div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
Stefan<br>
</blockquote></div></div>

--00000000000095fd2405f4384078--

