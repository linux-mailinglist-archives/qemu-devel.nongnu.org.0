Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C256E525FAE
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 12:31:17 +0200 (CEST)
Received: from localhost ([::1]:40044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npSZo-0005B9-Hq
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 06:31:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1npSXz-0004Jd-Bs
 for qemu-devel@nongnu.org; Fri, 13 May 2022 06:29:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1npSXx-0003Me-9y
 for qemu-devel@nongnu.org; Fri, 13 May 2022 06:29:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652437756;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ShYvYUQLYW3a4sZYj/gvHXBZribXoatfvpIR2ULONY=;
 b=F5BA1IoC8JnoED7ESh7sLxYhpl9GF5hwRkZuvcdmfb11Daz8kQWsvlDVbkCvz5++J+fZR0
 vscXXCzj0Cb7az2wkTRFhZdJRn72+LXf8672q6PWcQbM9rSDrH3bDY5B0ICJwrX/Ig/GfY
 SQ6d6TdOyiLd6tCK53pf4Ex0zA/H+1M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-rd1gRJ4pNuOeNQclorG6IA-1; Fri, 13 May 2022 06:29:13 -0400
X-MC-Unique: rd1gRJ4pNuOeNQclorG6IA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C78823C8ACE5;
 Fri, 13 May 2022 10:29:12 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E66492166B4E;
 Fri, 13 May 2022 10:29:10 +0000 (UTC)
Date: Fri, 13 May 2022 11:29:08 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH 0/9] tests: run python tests under the
 build/tests/venv environment
Message-ID: <Yn4y9BorEDzOLhFH@redhat.com>
References: <20220513000609.197906-1-jsnow@redhat.com>
 <Yn4YS1FpgtCZMMx6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yn4YS1FpgtCZMMx6@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Fri, May 13, 2022 at 09:35:23AM +0100, Daniel P. Berrangé wrote:
> On Thu, May 12, 2022 at 08:06:00PM -0400, John Snow wrote:
> > RFC: This is a very early, crude attempt at switching over to an
> > external Python package dependency for QMP. This series does not
> > actually make the switch in and of itself, but instead just switches to
> > the paradigm of using a venv in general to install the QEMU python
> > packages instead of using PYTHONPATH to load them from the source tree.
> > 
> > (By installing the package, we can process dependencies.)
> > 
> > I'm sending it to the list so I can show you some of what's ugly so far
> > and my notes on how I might make it less ugly.
> > 
> > (1) This doesn't trigger venv creation *from* iotests, it merely prints
> > a friendly error message if "make check-venv" has not been run
> > first. Not the greatest.
> 
> So if we run the sequence
> 
>   mkdir build
>   cd build
>   ../configure
>   make
>   ./tests/qemu-iotests/check 001
> 
> It won't work anymore, until we 'make check-venv' (or simply
> 'make check') ?
> 
> I'm somewhat inclined to say that venv should be created
> unconditionally by default. ie a plain 'make' should always
> everything needed to be able to invoke the tests directly.
> 
> > (2) This isn't acceptable for SRPM builds, because it uses PyPI to fetch
> > packages just-in-time. My thought is to use an environment variable like
> > QEMU_CHECK_NO_INTERNET that changes the behavior of the venv setup
> > process. We can use "--system-site-packages" as an argument to venv
> > creation and "--no-index" as an argument to pip installation to achieve
> > good behavior in SRPM building scenarios. It'd be up to the spec-writer
> > to opt into that behavior.
> 
> I think I'd expect --system-site-packages to be the default behaviour.
> We expect QEMU to be compatible with the packages available in the
> distros that we're targetting. So if the dev has the python packages
> installed from their distro, we should be using them preferentially.
> 
> This is similar to how we bundle slirp/capstone/etc, but will
> preferentially use the distro version if it is available.

AFAICT from testing it, when '--system-site-packages' is set
for the venv, then 'pip install' appears to end up being a
no-op if the package is already present in the host, but
installs it if missing.

IOW, if we default to --system-site-packages, but still
also run 'pip install', we should "do the right thing".
It'll use any  distro packages that are available, and
augment with stuff from pip. In the no-op case, pip will
still try to consult the pipy servers to fetch version
info IIUC, so we need to be able to stop that. So I'd
suggest a  --python-env arg taking three values

 * "auto" (the default) - add --system-site-packages, but
   also run 'pip install'. Good for developers day-to-day

 * "system" - add --system-site-packages but never run
   'pip install'.  Good for formal package builds.

 * "pip"  - don't add --system-site-packages, always run
   'pip install'. Good for testing compatibility with
   bleeding edge python versions, or if explicit full
   independance from host python install is desired.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


