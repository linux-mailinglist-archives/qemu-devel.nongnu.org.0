Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0CB525DC2
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 10:42:46 +0200 (CEST)
Received: from localhost ([::1]:43706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npQso-0008KC-05
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 04:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1npQls-0003uT-6r
 for qemu-devel@nongnu.org; Fri, 13 May 2022 04:35:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1npQlo-0002g9-Nj
 for qemu-devel@nongnu.org; Fri, 13 May 2022 04:35:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652430931;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=KIBGjqWiXy7vpOFF0TurFSAWij8BWOafaUqFfuieKFc=;
 b=Y3F//RcehTZnHTCJUrNsMLmSuvx2X7+pM1/KRCNLnfYEznSjgeXRemjbuDhxDEtoOqGaB8
 iXjKnTbzgk7f1rQBVszbAl5tRJlONVy4y3h+Q92y8b1Ce1oG3PJv60FZveIGek8MJIWRqi
 08jbQ4eMiT5bid7kJQq+DlG3lvqUii0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-4pjqch-RNlqqJlV_OKTCUg-1; Fri, 13 May 2022 04:35:27 -0400
X-MC-Unique: 4pjqch-RNlqqJlV_OKTCUg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D765811E78;
 Fri, 13 May 2022 08:35:27 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 861EB15146E3;
 Fri, 13 May 2022 08:35:25 +0000 (UTC)
Date: Fri, 13 May 2022 09:35:23 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH 0/9] tests: run python tests under the
 build/tests/venv environment
Message-ID: <Yn4YS1FpgtCZMMx6@redhat.com>
References: <20220513000609.197906-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220513000609.197906-1-jsnow@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 12, 2022 at 08:06:00PM -0400, John Snow wrote:
> RFC: This is a very early, crude attempt at switching over to an
> external Python package dependency for QMP. This series does not
> actually make the switch in and of itself, but instead just switches to
> the paradigm of using a venv in general to install the QEMU python
> packages instead of using PYTHONPATH to load them from the source tree.
> 
> (By installing the package, we can process dependencies.)
> 
> I'm sending it to the list so I can show you some of what's ugly so far
> and my notes on how I might make it less ugly.
> 
> (1) This doesn't trigger venv creation *from* iotests, it merely prints
> a friendly error message if "make check-venv" has not been run
> first. Not the greatest.

So if we run the sequence

  mkdir build
  cd build
  ../configure
  make
  ./tests/qemu-iotests/check 001

It won't work anymore, until we 'make check-venv' (or simply
'make check') ?

I'm somewhat inclined to say that venv should be created
unconditionally by default. ie a plain 'make' should always
everything needed to be able to invoke the tests directly.

> (2) This isn't acceptable for SRPM builds, because it uses PyPI to fetch
> packages just-in-time. My thought is to use an environment variable like
> QEMU_CHECK_NO_INTERNET that changes the behavior of the venv setup
> process. We can use "--system-site-packages" as an argument to venv
> creation and "--no-index" as an argument to pip installation to achieve
> good behavior in SRPM building scenarios. It'd be up to the spec-writer
> to opt into that behavior.

I think I'd expect --system-site-packages to be the default behaviour.
We expect QEMU to be compatible with the packages available in the
distros that we're targetting. So if the dev has the python packages
installed from their distro, we should be using them preferentially.

This is similar to how we bundle slirp/capstone/etc, but will
preferentially use the distro version if it is available.

> (3) Using one venv for *all* tests means that avocado comes as a pre-req
> for iotests -- which adds avocado as a BuildRequires for the Fedora
> SRPM. That's probably not ideal. It may be better to model the test venv
> as something that can be created in stages: the "core" venv first, and
> the avocado packages only when needed.
> 
> You can see in these patches that I wasn't really sure how to tie the
> check-venv step as a dependency of 'check' or 'check-block', and it
> winds up feeling kind of hacky and fragile as a result.

See above, I'm inclined to say the venv should be created unconditionally

> (Patches 6 and 7 feel particularly fishy.)
> 
> What I think I would like to do is replace the makefile logic with a
> Python bootstrapping script. This will allow me to add in environment
> variable logic to accommodate #2 pretty easily. It will also allow
> iotests to call into the bootstrap script whenever it detects the venv
> isn't set up, which it needed to do anyway in order to print a
> user-friendly error message. Lastly, it will make it easier to create a
> "tiered" venv that layers in the avocado dependencies only as-needed,
> which avoids us having to bloat the SRPM build dependencies.

The tests is an area where we still have too much taking place in
Makefiles, as opposed to meson. Can we put a rule in
tests/meson.build to trigger the ven creation ? Gets us closer to
being able to run ninja without using make as a wrapper.

> In the end, I think that approach will:
> 
> - Allow us to run iotests without having to run a manual prep step
> - Keep additional SRPM deps to a minimum
> - Keep makefile hacks to a minimum
> 
> The only downside I am really frowning at is that I will have to
> replicate some "update the venv if it's outdated" logic that is usually
> handled by the Make system in the venv bootstrapper. Still, I think it's
> probably the only way to hit all of the requirements here without trying
> to concoct a fairly complex Makefile.

The only reason we need to update the venv is if a python dependancy
changes right ? If we're using system packages by default that's
a non-issue. If we're using the python-qemu.qmp as a git submodule,
we presumably only need to re-create the venv if we see that the
git submodule hash has changed. IOW, we don't need to worry about
tracking whether individual python deps are outdated.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


