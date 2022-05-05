Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C24B51BCAF
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 12:01:28 +0200 (CEST)
Received: from localhost ([::1]:45980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmYIZ-0000XR-Jv
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 06:01:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmXCl-0008OY-Ae
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:51:23 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:28059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmXCi-0006ui-Mz
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:51:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651740679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rs5VBfMFmDAwLvEBVxiDhVg1HtRqfOD9AbERhGlB1mI=;
 b=LJvuL3YWTn3w0u/3yr4lkSN6eJqwen/IJYvN+9VoTuXuwHNVCSCTH2k+r8Yiyf8VTh2X76
 /WmBVz0TCAiJlk+QlUK/UxHpJzFKswmCe5PUONrVRZEjTMcW+mNlRmdU9B+3kf/AITPN2W
 LM65Iq1tJ7hUnhmLc1lI7sHHmqHK+9Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-lnXcpvWAMCKVubhjtAguZQ-1; Thu, 05 May 2022 04:51:16 -0400
X-MC-Unique: lnXcpvWAMCKVubhjtAguZQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C220A1800762;
 Thu,  5 May 2022 08:51:14 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8350840C1247;
 Thu,  5 May 2022 08:51:13 +0000 (UTC)
Date: Thu, 5 May 2022 10:51:12 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>
Subject: Re: iotests and python dependencies
Message-ID: <YnOQAP1J94zH1pEK@redhat.com>
References: <CAFn=p-ZCF0VU=xrcbCnqmVvEndsMgiFSZOZv_Orm2EdX-Yk--A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFn=p-ZCF0VU=xrcbCnqmVvEndsMgiFSZOZv_Orm2EdX-Yk--A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.74; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Am 04.05.2022 um 21:38 hat John Snow geschrieben:
> Howdy!
> 
> So, I want to finally delete python/qemu/qmp from qemu.git, and this
> creates a small problem -- namely, iotests needs access to it in order
> to run the python-based tests.
> 
> What I think needs to happen is that we create a virtual environment
> that installs python/qemu/. The reason this cannot be done with
> PYTHONPATH alone anymore is because the qmp package itself won't be
> there anymore, we need an installer like `pip` to actually fetch it
> for us and put it somewhere. (i.e., we need to process the
> dependencies of python/qemu now and can't treat it as a pre-installed
> location.)
> 
> Avocado tests are already creating a venv for the purposes of
> installing and running Avocado. We can amend e.g. "../../python" to
> tests/requirements.txt and the Avocado environment is A-OK good-to-go.
> The Makefile magic for avocado tests creates a venv-per-build.

"per build" sounded pretty bad, because I thought it meant building a
new venv every time I run either 'make' or the tests. This would
obviously be very noticable for short-running tests like some iotests.
But fortunately this is not what it does, it keeps the venv around in
the build directory. So it's only per build directory really, which I
guess is fine.

> It seems to work well enough. One thing to note here is that the
> supported invocation for avocado tests is only through the Makefile,
> which handles creating and entering the venv to make the command
> seamless.
> 
> iotests, however, manages its own execution environment with
> testenv.py, and we support running iotests from outside of the
> Makefile, for example by going to $build/tests/qemu-iotests and
> running ./check.

Yes, and I agree that this is important.

> Now ... I could update testenv.py to be smart enough to create and
> enter a python venv, and have even prototyped this. It seems to work
> pretty well! This approach seemed like the least invasive to how
> iotests are expected to be run and used. But a downside with this
> approach is that now avocado tests and iotests are each managing their
> own python venv. Worse, vm-tests and device-crash-test are still
> unhandled entirely.

Is there a reason why testenv.py couldn't enter just the shared venv in
build/tests/venv?

If not, I guess it would be enough if iotests just checks that the venv
exists and all of the dependencies are there in the right version and
error out if not, telling the user to run 'make check-venv'.

Or actually, it could just unconditionally run 'make check-venv' by
itself, which is probably easier to implement than checking the
dependencies and more convenient for the user, too.

(One more detail: 'make check-venv GIT_SUBMODULES_ACTION=ignore' seems
to make it pretty much instantaneous if the venv is current, but leaving
the submodule mechanism enabled adds a noticable delay.)

> I'd like to find a solution where I create a unified python testing
> venv tied to the build shared by avocado, iotests, vm-tests and
> device-crash-test. I'm not completely sure how exactly I'll manage
> that right now, but I wanted to throw this out there in case there are
> some requirements I might be overlooking.
> 
> I think vm-tests and avocado-tests can both have a venv created for
> them and activated before the test runs. device-crash-test I believe
> will need a script change in the gitlab ci yaml. iotests is somewhat
> unique in that it needs to run both by manual invocation and from
> makefile invocations. If I want a shared VM between all of these, I'll
> need to isolate the create-and-enter-venv logic somewhere where it can
> be shared both inside and outside of a Makefile.

If just calling 'make' isn't an option, then moving that part out into a
separate script probably wouldn't be too hard either. But 'make' has the
advantage that it already contains the check if the venv is already
there and requirements.txt hasn't changed, which you would have to
replicate otherwise.

Kevin


