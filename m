Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D8D69B3BD
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 21:19:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT7Au-0005kV-BF; Fri, 17 Feb 2023 15:17:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pT7Ar-0005Qn-IN
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 15:17:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pT7Ao-0001b7-3P
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 15:17:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676665053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BaYQb5V52bgpbpiA7m/dHJIqkLTqJQ4o9AzRO7lfjcc=;
 b=faihtvIn1sGcq1+mYqgeQu8OuJvlNYmRQ67Oz7TAwvI3dfLClSaUkQ03jupAjBmFI0+Lox
 kRYljj0VyP0EdNY+cVcdtBvYQJR5NjjnMB0DadMrLOhwUdP5KyOU7mENGlMG1F2sOK06F3
 vJY/3xHwQuncF0OmtNdzIxELYMNhZpc=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-547-HCPYRny5MOmD4p8P9Kb9uA-1; Fri, 17 Feb 2023 15:17:32 -0500
X-MC-Unique: HCPYRny5MOmD4p8P9Kb9uA-1
Received: by mail-vk1-f200.google.com with SMTP id
 b17-20020ac5c751000000b0040119b043a4so597437vkn.22
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 12:17:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BaYQb5V52bgpbpiA7m/dHJIqkLTqJQ4o9AzRO7lfjcc=;
 b=yb9NdcaSWDtETdqscnI9ZyEYzIp2fMV/8adAp+NudhinsURh2bHVrjWrv4eOG4Wq6O
 bICuTk/oFOAYg0ELnbC+FS2tgop4BNG77iClPgx9qGYCWX9RLX8jyhB6XIgYlXkIVVwO
 +ZfYHzWdE5+Gqp2tFPZN467b3D+CrT4zz8avH3ORLWegEwbC0batgnkyiVx2dmSr02r7
 OSD3k68dqPajoANzLBaelGD0SHL5FmhAnZ5EpzYG/HNYtcwf7+p4WJXUfBvXYtN5Slga
 buW0jFQ0/4nnyQ4QE5evxYf/GjkySUMwr4qL3iAh6Qr+Xddj5jdijAJPh7nxs2yYo5Qc
 zJ9Q==
X-Gm-Message-State: AO0yUKUQm0M5hi0OAXJupmP0wBszd8lYMIisICSLf6j4BX/IG2PiNFr/
 EsoAA7/igoSAJCOScyYkgkTOgXHsQCV8D9w8+00kO+JDKfSOvSlBWd8kQHN+0KuXGPRY3obMeCS
 urNHPVjg/bwXg4r6tjv6HBTbYCOtS4KI=
X-Received: by 2002:a05:6102:5c15:b0:412:c97:4ac8 with SMTP id
 ds21-20020a0561025c1500b004120c974ac8mr328733vsb.53.1676665051813; 
 Fri, 17 Feb 2023 12:17:31 -0800 (PST)
X-Google-Smtp-Source: AK7set8XXfexwInzJtP3T9hFjWtQaLq3ITH8JM7y71+5wFnDAXBzzY1vFSFYr1ss0sVNF9guxN3huBT/F5DmVTQkuuQ=
X-Received: by 2002:a05:6102:5c15:b0:412:c97:4ac8 with SMTP id
 ds21-20020a0561025c1500b004120c974ac8mr328727vsb.53.1676665051521; Fri, 17
 Feb 2023 12:17:31 -0800 (PST)
MIME-Version: 1.0
References: <20230217132631.403112-1-thuth@redhat.com>
 <87sff470lj.fsf@pond.sub.org> <Y++ka8oPpHrNyonT@redhat.com>
 <fe0de452-86df-ca43-8294-eac3938f72df@redhat.com>
In-Reply-To: <fe0de452-86df-ca43-8294-eac3938f72df@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 17 Feb 2023 21:17:21 +0100
Message-ID: <CABgObfYetmCBVQcVv4vwJKjPmum5ZFJ0dr2HkN9yRtR_8NHSuw@mail.gmail.com>
Subject: Re: [RFC PATCH] docs/about/build-platforms: Refine the distro support
 policy
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Claudio Fontana <cfontana@suse.de>
Content-Type: multipart/alternative; boundary="000000000000cdbf4005f4eb00db"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

--000000000000cdbf4005f4eb00db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il ven 17 feb 2023, 19:47 Thomas Huth <thuth@redhat.com> ha scritto:

> On 17/02/2023 16.59, Daniel P. Berrang=C3=A9 wrote:
> > On Fri, Feb 17, 2023 at 04:55:49PM +0100, Markus Armbruster wrote:
> ....
> > The cost/benefit tradeoff of dropping the platforms entirely
> > is not obviously favourable when we don't have clear demand
> > to bump the min versions of native packages, and the cost to
> > users stuck on these platforms to build their own toolchain
> > or libraries is very high.
>
> There's another urgent point which I completely forget to mention in my
> patch description (not sure how I managed that, since it's bugging me
> quite
> badly in the past weeks): We're struggling heavily with CI minutes.


The only viable solution for CI minutes is going to be private runners,
it's not easy to cut 30% of the jobs.

We're using less than half of our Azure sponsorship budget, and could also
find other sources; either Azure Kubernetes or AWS Fargate are pretty cheap
for running CI because unlike VM instances you pay for just the time that
CI is running (at least with Azure you still have VMs but they scale out
dynamically).

The complicated part is setting up the kubernetes executor for
gitlab-runner, but we'll find someone. :)

Paolo


If we
> have to support multiple major releases for a long time in parallel, ther=
e
> will always be the desire to have all major releases also tested in the C=
I
> ... and honestly, we're really struggling quite badly there right now - a=
s
> you know, we've already run out of CI minutes in January in the main
> project, and also in my forked repo I'm struggling each month.
> Additionally,
> it's of course additional effort to keep everything in the "green" state
> the
> more you have to support.
>
> We're currently "lucky" in a sense that we're only testing one version of
> CentOS, Debian and Ubuntu right now, but there have been voices in the
> past
> weeks asking for more already (like we also did in the past already). I'd
> really appreciate if we could have a clearer policy here to support less
> at
> the same time. It would help with the pressure on the CI and the effort
> and
> time it takes to maintain all that stuff.
>
>   Thomas
>
>

--000000000000cdbf4005f4eb00db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il ven 17 feb 2023, 19:47 Thomas Huth &lt;<a href=3D"m=
ailto:thuth@redhat.com">thuth@redhat.com</a>&gt; ha scritto:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">On 17/02/2023 16.59, Daniel P. Berrang=C3=A9 wrot=
e:<br>
&gt; On Fri, Feb 17, 2023 at 04:55:49PM +0100, Markus Armbruster wrote:<br>
....<br>
&gt; The cost/benefit tradeoff of dropping the platforms entirely<br>
&gt; is not obviously favourable when we don&#39;t have clear demand<br>
&gt; to bump the min versions of native packages, and the cost to<br>
&gt; users stuck on these platforms to build their own toolchain<br>
&gt; or libraries is very high.<br>
<br>
There&#39;s another urgent point which I completely forget to mention in my=
 <br>
patch description (not sure how I managed that, since it&#39;s bugging me q=
uite <br>
badly in the past weeks): We&#39;re struggling heavily with CI minutes.</bl=
ockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">The only=
 viable solution for CI minutes is going to be private runners, it&#39;s no=
t easy to cut 30% of the jobs.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">We&#39;re using less than half of our Azure sponsorship budget, and =
could also find other sources; either Azure Kubernetes or AWS Fargate are p=
retty cheap for running CI because unlike VM instances you pay for just the=
 time that CI is running (at least with Azure you still have VMs but they s=
cale out dynamically).</div><div dir=3D"auto"><br></div><div dir=3D"auto">T=
he complicated part is setting up the kubernetes executor for gitlab-runner=
, but we&#39;ll find someone. :)</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"> If we <br>
have to support multiple major releases for a long time in parallel, there =
<br>
will always be the desire to have all major releases also tested in the CI =
<br>
... and honestly, we&#39;re really struggling quite badly there right now -=
 as <br>
you know, we&#39;ve already run out of CI minutes in January in the main <b=
r>
project, and also in my forked repo I&#39;m struggling each month. Addition=
ally, <br>
it&#39;s of course additional effort to keep everything in the &quot;green&=
quot; state the <br>
more you have to support.<br>
<br>
We&#39;re currently &quot;lucky&quot; in a sense that we&#39;re only testin=
g one version of <br>
CentOS, Debian and Ubuntu right now, but there have been voices in the past=
 <br>
weeks asking for more already (like we also did in the past already). I&#39=
;d <br>
really appreciate if we could have a clearer policy here to support less at=
 <br>
the same time. It would help with the pressure on the CI and the effort and=
 <br>
time it takes to maintain all that stuff.<br>
<br>
=C2=A0 Thomas<br>
<br>
</blockquote></div></div></div>

--000000000000cdbf4005f4eb00db--


