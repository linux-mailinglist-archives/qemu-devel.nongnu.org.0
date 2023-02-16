Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6826991E4
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 11:41:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSbgw-0004j7-J1; Thu, 16 Feb 2023 05:40:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSbgu-0004ic-Bw
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 05:40:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSbgn-0003l1-Fu
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 05:40:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676544025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a6iWTlCAq4YMvEdixEPpfu1/r48AMMPWtW9NJ3RLA6E=;
 b=PZCLz2b5VrKrjbkjHI966WzvrcPMAT9kYyAEvE00SYxo4AWvXKMNCLyvH8FC5zQ8kXsBz5
 rYFrXupzl895yC1E7QmyzuG7cjY8hBmBv/V/oWBYPfPYN9w+tFFcf5bugGblJ2z7J0nSHl
 XkX4Vs823RVH82MJHGSXdwY5/UybzlE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-rKHAulvVMvm2HUt6JBBG_g-1; Thu, 16 Feb 2023 05:40:21 -0500
X-MC-Unique: rKHAulvVMvm2HUt6JBBG_g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12548886464;
 Thu, 16 Feb 2023 10:40:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BEB372166B30;
 Thu, 16 Feb 2023 10:40:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A858521E6A1F; Thu, 16 Feb 2023 11:40:19 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,  John Snow <jsnow@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,  Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Thomas Huth
 <thuth@redhat.com>,  Beraldo Leal <bleal@redhat.com>,  Michael Roth
 <michael.roth@amd.com>,  Wainer dos Santos Moschetta
 <wainersm@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Qemu-block
 <qemu-block@nongnu.org>,  Hanna Reitz <hreitz@redhat.com>,  Alex
 =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 6/7] CI: Stop building docs on centos8
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-7-jsnow@redhat.com>
 <CAFEAcA-c5y0TR8vYg_FYEmGv3mOOmBgeD0cyb+mVotsP=r-Dsw@mail.gmail.com>
 <CAFn=p-aDV9=vG6hjTWRE6c52TpYSjDBU22nthTuejDCv_XrYMQ@mail.gmail.com>
 <CAFEAcA_eGvz_BQVLhVWtedRh2mcBuMEhv0RKF+6DW4t+9FdPAw@mail.gmail.com>
 <Y+Z2Kcq17HGWuoTV@redhat.com> <87cz6cpue3.fsf@pond.sub.org>
 <Y+t1J72iMsLWXHne@redhat.com>
Date: Thu, 16 Feb 2023 11:40:19 +0100
In-Reply-To: <Y+t1J72iMsLWXHne@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Tue, 14 Feb 2023 11:48:55 +0000")
Message-ID: <874jrlsxkc.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Feb 14, 2023 at 08:40:20AM +0100, Markus Armbruster wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>=20
>> [...]
>>=20
>> > We don't have to drop python 3.6. It is a choice because
>> > of a desire to be able to use some shiny new python
>> > features without caring about back compat.
>>=20
>> I read this on Friday, and decided to let it sit until after the
>> weekend.  Well, it's now Tuesday, and to be frank, it's still as
>> offensively flippant as it was on Friday.  It shows either ignorance of
>> or cavalier disregard for the sheer amount of work some of us have had
>> to put into keeping old versions of Python viable.
>>=20
>> The latter would be quite unlike you, so it must be the former.
>
> I'm sorry, I don't mean it to be offensive. I'm genuinely not seeing
> from the descriptions in the series what the functional benefits are
> from dropping 3.6.

Apology accepted, and point well taken.

>> John has sunk *man-months* into keeping old versions of Python viable.
>> I've put in a lot less myself, but still enough to be painfully aware of
>> it.  I figure Cleber and Beraldo are somewhere in between
>>=20
>> Insinuating John's proposal is motivated by "a desire to be able to use
>> some shiny new python features without caring about back compat"
>> disrespects all this work.
>
> I'm writing my comments based on what is described in the cover letter
> as the motivations for the change:
>
> [quote]
> The motivation for this series is that Python 3.6 was EOL at the end of
> 2021; upstream tools are beginning to drop support for it, including
> setuptools, pylint, mypy, etc. As time goes by, it becomes more
> difficult to support and test against the full range of Python versions
> that QEMU supports. The closer we get to Python 3.12, the harder it will
> be to cover that full spread of versions.
> [/quote]
>
> this is all about new/eol versions of software upstream, and I don't
> think that's a justification. QEMU explicitly aims to use distro provided
> versions and upstream EOL status is not relevant in that context. Even
> if using "pip" to install it is possible to limit yourself to upstream
> releases which still support 3.6.
>
> There is the separate issue of Meson dropping python 3.6 which motivates
> Paolo's series. Again though, we don't have to increase our minimum meson
> version, because meson is working today. It is our choice to to increase
> it to use latest available meson features. At some point we can decide
> what we have is good enough and we don't have to keep chasing the latest
> features. Maybe we're not there yet, but we should think about when that
> would be.
>
> [quote]
> The qemu.qmp library and the avocado testing framework both have
> motivations for dropping 3.6 support, but are committed to not doing so
> until QEMU drops support.
> [/quote]
>
> I suspect that this is more of a driver for the drop of 3.6, but I
> don't see any details.
>
> IOW overall justification come across as wanting to use new features,
> and follow upstream EOL, without any real detail of what we're going
> to gain from a functional POV.

I think what we gain is there: "As time goes by, it becomes more
difficult to support and test against the full range of Python versions
that QEMU supports. The closer we get to Python 3.12, the harder it will
be to cover that full spread of versions."  In other words, the gain is
"we make something that's hard and getting harder easier".

What isn't in the cover letter, only in commit message 6+7/7, i.e. this
patch and the next one, is what we pay for it: basically nothing (next
patch's commit message) except for the issue of Sphinx in CentOS 8 (this
patch's commit message).  Putting at least a summary it in the cover
letter would have been better.

John did explain this again and in more detail in reply to Peter's "This
confuses me.  We work fine with Python 3.6 today."  Quote:

    That won't last - Many tools such as mypy, pylint and flake8 which I us=
e to
    manage our python codebase have been dropping support for 3.6 and I've =
had
    to implement an increasing number of workarounds to help keep it possib=
le
    to test 3.6 via CI while also ensuring our newest platforms work as dev
    environments.

    Our testing matrix for Python is novel and thorough enough that it's
    revealed  several bugs in other downstream Python distributions for Deb=
ian
    and Fedora, and dozens of bugs for the linters themselves.

    I'm concerned that when 3.7 is EOL'd in just a few months that the supp=
ort
    and testing gap is going to get even uglier.

    [...]

    The argument I'm making is:

    - CentOS 8 is a supported build platform
    - All platforms *do* have a Python modern enough to allow us to drop 3.6
    - CentOS's repo version of sphinx is hardcoded to use the older 3.6, th=
ough
    - You expressed a preference to me in the past to NOT use a pip install=
ed
    version of sphinx in preference to the system version in "configure"
    - It's still possible to build docs on CentOS 8 after this patchset, you
    just need a pip version.
    - We've used the justification that our build platform promise does not
    necessarily extend to docs and tests in the past.
    - So just skip docs building for CentOS 8, only in the CI.

    If you believe docs in CI for CentOS 8 is a hard deal breaker, then I w=
ant
    to go back to discussing the possibility of using sphinx versions from =
pip.

You even quoted most of it in your message :)

The second paragraph is evidence we've been doing something basically
nobody else does.

>> We should have a sober discussion on which versions of Python to work
>> with, and the tradeoffs involved.  But before I engage in that, I insist
>> on resetting the frame: no, this is not about shiny, new Python
>> features.  It is about stopping the bleeding.  It is about reducing what
>> feels more and more like bullshit work to me, so we can actually
>> accomplish stuff that matters.
>
> Every applications developer chooses an arbitrary cut off points for
> minimum software versions, depending on their particular needs. With
> our support policy we tried to express a reasonable tradeoff between
> keeping back compat, and being able to adopt new features.
>
> Obviously that tradeoff is not currently looking acceptable on the
> python side, but it is not clear why that is ?
>
> Can someone simply explain what we wil see as the benefit from dropping
> 3.6 / adopting 3.7 as the baseline ?=20

Let me start with the costs, then move on to the benefits.

Every single supported build platform already provides Python >=3D 3.7,
and all the Python tools we use continue to work with it, with one
exception: Sphinx on CentOS 8.

Solutions for this issue proposed so far:

1. Do nothing.  To build documentation on CentOS 8, you have to pip
   install a working version of Sphinx, which is easy enough.  As long
   as we don't in CI, we have to disable building docs there (this
   patch).

2. Have the build system pip install it for you.  A bit of a paradigm
   shift: so far our build system doesn't install anything.

3. Split the Python dependency for Sphinx off the general one.  On
   CentOS 8, we'd use 3.6 to run Sphinx, and 3.7+ for everything else.
   On all other systems, we'd use the same 3.7+ for everything.

So the cost is our choice of "you have to pip install Sphinx to build
docs on CentOS 8" / "build system pip installs Sphinx" / "special Python
dependency for Sphinx".  Feels quite modest to me.

The main benefit is we reduce the bleeding caused by trying to support
Python all the way back to 3.6 when basically nobody else does.  Linters
in particular.  How much of a benefit is this?  I'd like you all to
trust John it's plenty big enough to justify the (modest!) cost.  He's
been doing much of the bleeding, after all.

New features provided by 3.7 will be nice to have (especially for
typing), but that's not why we're doing this.


