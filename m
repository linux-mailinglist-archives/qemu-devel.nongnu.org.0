Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6D469C702
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 09:53:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU1tz-00026w-6G; Mon, 20 Feb 2023 03:52:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pU1tw-00026d-4u
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 03:52:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pU1tt-0008Ap-LC
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 03:51:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676883116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WFbn8IElbs1MR2Kzb4s+hoEVJUa5oG+Or7AFPw2P4v4=;
 b=RMHjd5zaL1xJaTndwIA/tO40OFKnjwiZGb+GqAaeix892u357/65+3trM7us8Epxi5eI7W
 Vr2vN9nB1HiloedydTGdXqOxxKRhNbn6wWPXMMKsoHXgtsxAbLWExmaQB79aFHP5M5hjpn
 CBxd8pa3vNKg48q2DSOltaFePpCsUKg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-ZH0lo02PMHW58zdDTaJ4lw-1; Mon, 20 Feb 2023 03:51:52 -0500
X-MC-Unique: ZH0lo02PMHW58zdDTaJ4lw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF08A18E5345;
 Mon, 20 Feb 2023 08:51:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DC88C15BA0;
 Mon, 20 Feb 2023 08:51:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6D7F721E6A1F; Mon, 20 Feb 2023 09:51:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  qemu-devel <qemu-devel@nongnu.org>,  Cleber
 Rosa <crosa@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,  Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>,  Wainer dos Santos Moschetta
 <wainersm@redhat.com>,  Qemu-block <qemu-block@nongnu.org>,  Hanna Reitz
 <hreitz@redhat.com>,  Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v2 6/7] CI: Stop building docs on centos8
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-7-jsnow@redhat.com>
 <CAFEAcA-c5y0TR8vYg_FYEmGv3mOOmBgeD0cyb+mVotsP=r-Dsw@mail.gmail.com>
 <CAFn=p-aDV9=vG6hjTWRE6c52TpYSjDBU22nthTuejDCv_XrYMQ@mail.gmail.com>
 <CAFEAcA_eGvz_BQVLhVWtedRh2mcBuMEhv0RKF+6DW4t+9FdPAw@mail.gmail.com>
 <Y+Z2Kcq17HGWuoTV@redhat.com> <87cz6cpue3.fsf@pond.sub.org>
 <Y+t1J72iMsLWXHne@redhat.com>
 <CABgObfb-_upmc=36_bnxLMCB+0KqWoZNK62rnD5KpBKhW4N+hw@mail.gmail.com>
 <Y+vEKTgwoPtj86Z1@redhat.com>
 <CAFn=p-Zg-LsRxG3rc7W1tmXcEWjqQtYF4c8RiioWpHEoa-JT5Q@mail.gmail.com>
Date: Mon, 20 Feb 2023 09:51:50 +0100
In-Reply-To: <CAFn=p-Zg-LsRxG3rc7W1tmXcEWjqQtYF4c8RiioWpHEoa-JT5Q@mail.gmail.com>
 (John Snow's message of "Fri, 17 Feb 2023 17:49:36 -0500")
Message-ID: <87ttzgzpll.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

John Snow <jsnow@redhat.com> writes:

> On Tue, Feb 14, 2023 at 12:26 PM Kevin Wolf <kwolf@redhat.com> wrote:
>>
>> Am 14.02.2023 um 15:03 hat Paolo Bonzini geschrieben:
>> > In the case of Python the issue is not the interpreter per se, though
>> > there are a couple new feature in Python 3.7 that are quite nice (for
>> > example improved data classes[1] or context variables[2]). The main
>> > problem as far as I understood (and have seen in my experience) is
>> > linting tools. New versions fix bugs that caused false positives, but
>> > also become more strict at the same time. The newer versions at the
>> > same time are very quick at dropping support for old versions of
>> > Python; while older versions sometimes throw deprecation warnings on
>> > new versions of Python. This makes it very hard to support a single
>> > version of, say, mypy that works on all versions from RHEL8 and SLE15
>> > to Fedora 38 and Ubuntu 23.04.
>>
>> Why do we have to support a single version of mypy? What is wrong with
>> running an old mypy version with old Python version, and a newer mypy
>> with newer Python versions?
>
> Well, the problem is, ...
>
>>
>> Sure, they will complain about different things, but it doesn't feel
>> that different from supporting multiple C compilers in various versions.

Different C compilers often produce different, useful warnings, so
compiling with several of them can get you more useful warnings.

However, you get pretty much all the useful warnings just from the
latest versions, at least in my experience.  You keep the old ones
working not for getting additional useful warnings, but to compile on
additional hosts.  As the version range widens, warnings from old
versions might even become such an annoyance that switching them off
becomes sensible.

> ...well, it's this.
>
> The first dimension of the test matrix is the version of mypy itself.
> The second dimension of the test matrix is the version of Python mypy
> runs under. A given version of mypy can run under multiple versions of
> Python and may indeed have different behaviors under each.
> The third dimension of this test matrix is the version(s) of Python
> our code is targeting; for instance we configure mypy to understand
> that we require Python 3.6.
>
> Trying to cast the net wide on *all of these* gets tough; the very
> latest versions of mypy don't support 3.6 at all, so you'll have cases
> where the mypy that just so happens to come with your Fedora
> installation just won't work properly with our code anymore, which has
> to test under 3.6 appropriately.
>
> In general, the majority of python package upstreams I am aware of
> simply pin a python version and a mypy version and leave it at that.

When pretty much everybody else doesn't do something we're doing, there
are two obvious explanations: (1) we're so smart we discovered something
worth doing pretty much first, or (2) the thing we're doing is a bad
idea in general.

In this case, my money is on (2).  It may still be a good idea for us
(because "in general").  But that notion needs to be supported with
concrete reasons, such as ...

> Compatibility concerns for most of the upstreams just do not really
> ever consider that you'd be running *and* testing against a large
> spread of versions. I've gone the extra mile and I run mypy and pylint
> under all versions of python from 3.6 to 3.11 to ensure that developer
> workstations can run the same linting tests and feel assured that if
> it passes locally, it will pass on the CI and vice-versa. Our matrix
> is generally quite a bit larger than most upstreams, so I am playing a
> lot of whack-a-mole to keep things functioning consistently across the
> versions. I will probably even add support for Python 3.12 alpha
> *soon* because it's already available in the Fedora repo, and it will
> be good to find any compatibility issues before that version is
> officially released. (I'll need to do this for the qemu.qmp package,
> which should have support for 3.12 on the day 3.12 releases and not
> sometime afterwards.)
>
> I know the "check-tox" test was annoying upstream as it sometimes
> turned yellow because a new pylint version was released, but that's
> how I stay ahead of breaking changes before they're on local
> workstations.
>
> We could avoid at least one of the reasons for dropping 3.6 support by
> saying "Tough cookies, you'll use precisely this version of mypy and
> precisely this python interpreter, or you'll get nothing" and that
> does relieve a huge amount of pressure as-is.

... this one:

>                                               But, as a courtesy, I do
> go out of my way -- where possible -- to ensure that developers can
> use whichever versions of tools their distro is providing them so that
> they don't have to mess around with that stuff. Unfortunately, that
> means when upstreams start dropping support for older things, it gets
> hairier and quite a bit more painful.

I appreciate the courtesy.  But it feels like it's gotten rather costly,
and getting costlier.

> I think 3.6 being the first version that offers full-throated type
> hint support has unique pain in this circumstance because a lot of the
> details did not get hammered out until 3.7 or later; in general the
> amount of workarounds I have had to apply because something type
> checks only in 3.7+ but not 3.6 is fairly high compared to the number
> of times I've found that a different version was the odd one out. I
> don't expect this to become a recurring desire where I start to whine
> about old Python versions before our support window would otherwise
> let me drop them; I think this is actually just a unique pain point of
> this one version if we keep static typing.
>
> That's the tooling issue, anyway.

Perhaps dropping just 3.6 from the test matrix will get us back to a
reasonable cost / benefit ratio.  But I'd like to encourage you to have
a sober look at the test matrix, and not shy away from cutting more.


