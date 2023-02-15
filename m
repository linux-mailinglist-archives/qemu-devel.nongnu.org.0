Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3ED769844B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:17:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSNHY-00070p-64; Wed, 15 Feb 2023 14:17:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSNHQ-0006sf-Bi
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:17:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSNHN-0002cE-9c
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:17:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676488640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3N08rsOzd1yLWfX0j+d9ik1YgPk3JOtwJVPtlu3kuPI=;
 b=i8ZS902YmtTib9zjkhQCN5ysR0Ayr9NrhvB+OnErzssk5x7h7DS4di2O5W7Qv50EyoPWnQ
 nuZN4mI5O5eVRKQGnd0QcAalS7l5ofAkzWFmN5mPt76ejZgcKlWL0H1+QXhu0h4+J/l8Zf
 xQt/o4NCXUXStG6wegvLkl7i8kBC9iY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-JzphqdyUOVagPPQpUpaMLQ-1; Wed, 15 Feb 2023 14:17:18 -0500
X-MC-Unique: JzphqdyUOVagPPQpUpaMLQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C03843C0F19E;
 Wed, 15 Feb 2023 19:17:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 71E89140EBF4;
 Wed, 15 Feb 2023 19:17:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 08FE521E6A1F; Wed, 15 Feb 2023 20:17:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  John Snow <jsnow@redhat.com>,  qemu-devel
 <qemu-devel@nongnu.org>,  Cleber Rosa <crosa@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Thomas Huth
 <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,  Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Qemu-block <qemu-block@nongnu.org>,  Hanna Reitz
 <hreitz@redhat.com>,  Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v2 6/7] CI: Stop building docs on centos8
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-7-jsnow@redhat.com>
 <CAFEAcA-c5y0TR8vYg_FYEmGv3mOOmBgeD0cyb+mVotsP=r-Dsw@mail.gmail.com>
 <CAFn=p-aDV9=vG6hjTWRE6c52TpYSjDBU22nthTuejDCv_XrYMQ@mail.gmail.com>
 <CAFEAcA_eGvz_BQVLhVWtedRh2mcBuMEhv0RKF+6DW4t+9FdPAw@mail.gmail.com>
 <Y+Z2Kcq17HGWuoTV@redhat.com> <87cz6cpue3.fsf@pond.sub.org>
 <Y+tqlwx0NptPn35n@redhat.com>
Date: Wed, 15 Feb 2023 20:17:15 +0100
In-Reply-To: <Y+tqlwx0NptPn35n@redhat.com> (Kevin Wolf's message of "Tue, 14
 Feb 2023 12:03:51 +0100")
Message-ID: <87fsb6yc04.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

Kevin Wolf <kwolf@redhat.com> writes:

> Am 14.02.2023 um 08:40 hat Markus Armbruster geschrieben:
>> I read this on Friday, and decided to let it sit until after the
>> weekend.  Well, it's now Tuesday, and to be frank, it's still as
>> offensively flippant as it was on Friday.  It shows either ignorance of
>> or cavalier disregard for the sheer amount of work some of us have had
>> to put into keeping old versions of Python viable.
>> 
>> The latter would be quite unlike you, so it must be the former.
>
> Honest question, Markus, because I haven't been following as much what
> is happening in Python recently: What are the biggest pain points in
> this context?
>
> Has Python started removing features from new versions more aggressively
> so that we have to update the code so it can run on newer versions, and
> still keep compatibility paths for older versions that don't have the
> replacement yet?

A caveat before I answer: I'm aware of four non-trivial uses of Python,
(QAPI generator, Avocado, the qemu/qmp package, meson), but my direct
experience is limited to just QAPI.

And another preliminary remark: I think there's confusion about the
actual impact of dropping 3.6.  But attempting to clarify that is a
topic for another message (Message-ID: <87v8k2ycjb.fsf@pond.sub.org>,
just sent).

I've personally observed roughly three kinds of pain.  In order of
(sharply) increasing intensity:

1. Python language and core libraries

   Python still evolves at a good pace.

   We can sidestep new features.  We can't sidestep bugs.  In either
   case, we need to become aware of the issue first.

   For features, diligent reading of documentation suffices, but for
   bugs, it's testing or bust.

   Things have exploded into John's face often enough to "motivate" him
   to spend a huge chunk of his time (man-months) on building and
   maintaining infrastructure for testing with all the Python versions.
   Naturally, the wider the version range, the bigger the test matrix,
   and the deeper the time sink.

   The range of versions we're trying to target is actually wider than
   Python's deprecation grace period.  This means we sometimes get to do
   things in both the old and the new way (because neither works across
   the whole range of versions), or look for ways to sidestep the mess
   somehow.

   Python programs are nicely portable between host systems.  Between
   more than a few Python versions, not so much.

2. Python tooling and non-core libraries

   Much of these don't give a rat's ass for anything but the latest few
   versions, let alone for EOLed ones like 3.6.  Likely because they
   decided it would be a fool's errand.

   For instance, Python packaging has changed beyond recognition since
   3.6.  There is no single way to package that spans the range of
   versions we try to target.  Bites the qemu/qmp package.

   Linters are also a moving target, and keeping lint tests pass for a
   wide range of linters version involves lots of largely pointless
   fiddling.  Another dimension in the test matrix.

3. Python typing is too immature in anything but latest versions

   This is kind of a special case of 2., but it's a big one for *me*, so
   I'm making it an item of its own.

   Type hints have been evolving substantially, and it doesn't look like
   this is going to stop any time soon.

   Trying to keep typing tests pass for a wide range of mypy versions is
   even less practical than for other linters.

   Can we simply skip type checking unless we have a sufficiently recent
   mypy?  After all, type hints are designed to be transparent at
   runtime, so code with new type hints should still run on old Python,
   shouldn't it?  Nope.  Doesn't.

   Kevin and others pointed out that the QAPI generator code is harder
   to work with than it should be, in good part because they have to
   spend too much time understanding possible types.  In response to
   this valid complaint, we embarked on the known non-trivial project to
   add type hints to the QAPI code generator.  This may have been a
   mistake.  We had no idea just how much trouble type hints would give
   us when combined with a range of Python versions this wide.  But here
   we are, 2+ years older and somewhat better informed, and our informed
   desire is to narrow the version range as much as practical.

   Ditching 3.6 feels eminently practical.  Let's do it.


