Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 876EF698A3B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 02:48:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSTM8-0000qx-JX; Wed, 15 Feb 2023 20:46:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSTLu-0000p4-Q6
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 20:46:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSTLt-0002c3-1U
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 20:46:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676511984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P4X+B1+fuY1hc8ThRiCFTS/paanWD3OtHRa1Ji2+meA=;
 b=cRLe5Zp+t5TOJwwLlCxEtpG2FGujr8pqplROezDsbg0Ry8rqA2GCAHQFUI+RCdZA0veI4l
 EJnSi3KF5d7VD6RXU1JWIqGe4SOk9akqXvAFt6o2stmU/Vhtina1yW7cASuWR9fuerp5DI
 v4+OzRY4xYiJUUVnMNuRUHxVJp+7JAw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-m_mHmCJINEqq4b79NK4EMQ-1; Wed, 15 Feb 2023 20:46:20 -0500
X-MC-Unique: m_mHmCJINEqq4b79NK4EMQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D92680D0E3;
 Thu, 16 Feb 2023 01:46:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E79CF140EBF4;
 Thu, 16 Feb 2023 01:46:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C5BDF21E6A1F; Thu, 16 Feb 2023 02:46:18 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,  John Snow <jsnow@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,  Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Thomas Huth
 <thuth@redhat.com>,  Beraldo Leal <bleal@redhat.com>,  Michael Roth
 <michael.roth@amd.com>,  Wainer dos Santos Moschetta
 <wainersm@redhat.com>,  Qemu-block <qemu-block@nongnu.org>,  Hanna Reitz
 <hreitz@redhat.com>,  Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v2 6/7] CI: Stop building docs on centos8
References: <20230210003147.1309376-7-jsnow@redhat.com>
 <CAFEAcA-c5y0TR8vYg_FYEmGv3mOOmBgeD0cyb+mVotsP=r-Dsw@mail.gmail.com>
 <CAFn=p-aDV9=vG6hjTWRE6c52TpYSjDBU22nthTuejDCv_XrYMQ@mail.gmail.com>
 <CAFEAcA_eGvz_BQVLhVWtedRh2mcBuMEhv0RKF+6DW4t+9FdPAw@mail.gmail.com>
 <Y+Z2Kcq17HGWuoTV@redhat.com> <87cz6cpue3.fsf@pond.sub.org>
 <Y+t1J72iMsLWXHne@redhat.com>
 <CABgObfb-_upmc=36_bnxLMCB+0KqWoZNK62rnD5KpBKhW4N+hw@mail.gmail.com>
 <Y+vEKTgwoPtj86Z1@redhat.com>
 <CABgObfbsoOGU5v-xw3LzsnknS_TFJWZBA3LGCAmOOF-uBcXziQ@mail.gmail.com>
 <Y+zDd93lnPeteQxk@redhat.com>
Date: Thu, 16 Feb 2023 02:46:18 +0100
In-Reply-To: <Y+zDd93lnPeteQxk@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Wed, 15 Feb 2023 11:35:19 +0000")
Message-ID: <87k00iv0ut.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

> On Tue, Feb 14, 2023 at 09:52:44PM +0100, Paolo Bonzini wrote:
>> Il mar 14 feb 2023, 18:26 Kevin Wolf <kwolf@redhat.com> ha scritto:
>>=20
>> > Am 14.02.2023 um 15:03 hat Paolo Bonzini geschrieben:
>> > > In the case of Python the issue is not the interpreter per se, though
>> > > there are a couple new feature in Python 3.7 that are quite nice (for
>> > > example improved data classes[1] or context variables[2]). The main
>> > > problem as far as I understood (and have seen in my experience) is
>> > > linting tools. New versions fix bugs that caused false positives, but
>> > > also become more strict at the same time. The newer versions at the
>> > > same time are very quick at dropping support for old versions of
>> > > Python; while older versions sometimes throw deprecation warnings on
>> > > new versions of Python. This makes it very hard to support a single
>> > > version of, say, mypy that works on all versions from RHEL8 and SLE15
>> > > to Fedora 38 and Ubuntu 23.04.
>> >
>> > Why do we have to support a single version of mypy? What is wrong with
>> > running an old mypy version with old Python version, and a newer mypy
>> > with newer Python versions?
>> >
>> > Sure, they will complain about different things, but it doesn't feel
>> > that different from supporting multiple C compilers in various version=
s.
>> >
>>=20
>> It's more like having to support only C++03 on RHEL 8 and only C++20 in
>> Fedora 37, without even being able to use a preprocessor.
>>=20
>> For example old versions might not understand some type annotations and
>> will fail mypy altogether, therefore even with newer versions you can't
>> annotate the whole source and have to fall back to non-strict mode.
>
> In terms of back compatibility, is there a distinction to be
> made between mypy compat and the python runtime compat ?
>
> If we add annotations wanted by new mypy, and old mypy doesn't
> understand them, that's not a huge problem. We can simply declare
> that we don't support old mypy, and skip the validation tests if
> old mypy is installed.

In theory, type hints are transparent at run time.  In practice, use of
modern type hints is known to break 3.6 at run time.  I don't remember
the details offhand, but John should be able to dig them up if you're
interested.

So, it should not be a problem, but it is.

Checking types only with sufficiently new mypy still makes sense
regardless.

>                        The mypy results are targetted at upstream
> maintainers primarily, not people consuming QEMU, unless they are
> backporting huge amounts of code and need to validate it. IOW it
> should be sufficient to test once with an arbitrary version of
> mypy of our choosing.
>
> If we add annotations wanted by new mypy, and old python runtime
> barfs, then that's a significant problem, which would require us
> to either bump the min python or avoid the new mypy annotations.

Yup.

Avoiding new mypy leaves us with underpowered type checking.

If dropping 3.6 had serious drawbacks, then we'd have to weigh type
checking improvements against them.  However, the only drawback we can
see is "CentOS 8 provides no suitable Sphinx", which we can either
accept or mitigate, I think.

> The same could be asked for the other linting tools we use like
> pylint / flake8. Is it sufficient to declare a min versions for
> those tools and skip the tests if not satisfied, while still
> retaining ability to execute the code on 3.6 ?

Yes, let's try to narrow the version range for linting tools.

> Or are there some core python runtime features we also want to
> take advantage of at the same time ?

Those are gravy.


