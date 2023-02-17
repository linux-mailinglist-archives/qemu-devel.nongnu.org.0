Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A6269A8CC
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 11:02:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSxYm-0001s4-El; Fri, 17 Feb 2023 05:01:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSxYk-0001rk-7b
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 05:01:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSxYi-0000Of-EY
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 05:01:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676628099;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=nmNUQU566hFm6n1qHrDJHLP/L1IRnSRHsjn0mYTTtjc=;
 b=RkhfcDK4ECtPNpIE8Y6iklCP2g1Erh4k2ttwSRfuHVR3RlwSkUFq824cA9KeaXvJ1Asi+M
 xE/RV4OAYBUyuzWgt1K+3tg29dEMql8ERZjpfOpltkKII5LJGgE5dmOjWd86qbdHDf5NQ4
 wEMq4Fx6z0j+n9PpWLJs5cnw95g1vWo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-Kvloaia1NEimAT4PauKCug-1; Fri, 17 Feb 2023 05:01:34 -0500
X-MC-Unique: Kvloaia1NEimAT4PauKCug-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D68080D0E9;
 Fri, 17 Feb 2023 10:01:34 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3428C1121314;
 Fri, 17 Feb 2023 10:01:31 +0000 (UTC)
Date: Fri, 17 Feb 2023 10:01:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 0/7] Python: Drop support for Python 3.6
Message-ID: <Y+9QeFzvdG4j9aMO@redhat.com>
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <87v8k2ycjb.fsf@pond.sub.org>
 <a2783906-cad2-2d47-5bbb-66d799b2a4b8@redhat.com>
 <87zg9cirti.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87zg9cirti.fsf@pond.sub.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Feb 17, 2023 at 10:06:49AM +0100, Markus Armbruster wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
> > On 15/02/2023 20.05, Markus Armbruster wrote:
> >> The discussion under PATCH 6 makes me think there's a bit of confusion
> >> about the actual impact of dropping support for Python 3.6.  Possibly
> >> because it's spelled out in the commit message of PATCH 7.  Let me
> >> summarize it in one sentence:
> >> 
> >>      *** All supported host systems continue to work ***
> >> 
> >> Evidence: CI remains green.
> >
> > The CI remains green since one of the patches disabled the building of the 
> > docs on CentOS 8. That's not how I'd describe "continue to work", at least 
> > not in the same extend as before.
> 
> Thus the exception ...
> 
> >> On some supported host systems, different packages need to be installed.
> >> On CentOS 8, for instance, we need to install Python 3.8.13 or 3.9.16
> >> instead of 3.6.8.  Let me stress again: same repository, different
> >> package.  No downsides I can see.
> 
> ... right here:
> 
> >> The *one* exception is Sphinx on CentOS 8.  CentOS 8 does not ship a
> >> version of Sphinx that works with Python 3.7 or newer.  This series
> >> proposes to simply stop building the docs there, unless the user
> >> provides a suitable version of Sphinx (which is easy enough with pip).
> >
> > I think we've all understood that. The thing that you obviously did not 
> > understood: This breaks our support statement.
> > I'm pretty sure that you could also build the whole QEMU suite successfully 
> > on an ancient CentOS 7 or Ubuntu 18.04 system if you manually install a 
> > newer version of GCC and some of the required libraries first. But that's 
> > not how we understand our support statement.
> >
> > Sure, you can argue that you can use "pip install" to get a newer version of 
> > Sphinx on RHEL 8 / CentOS 8 to continue building the docs there - but is 
> > that really that much different from installing a newer version of GCC and 
> > libraries on an ancient distro that we do not officially support anymore? 
> > I'd say no. You also have to consider that not every build host has access 
> > to the internet, maybe some companies only have an internal mirror of the 
> > distro packages in their intranet (I remember some discussion about such a 
> > case in the past) - so while you were perfectly fine to build the whole of 
> > QEMU on a CentOS 8 there before this change, you could now not build parts 
> > of QEMU anymore there due to the missing possibility to run "pip install" 
> > without full internet connection.
> >
> > And sure, you can argue that it's "just" the documentation. But IMHO that's 
> > still an essential part of the QEMU build, and it used to work before, so it 
> > feels wrong to cut that now out. And also, if we start with the 
> > documentation now, what's next? If for example scripts/shaderinclude.py 
> > stops working with Python 3.6, do we then simply say: "Oh, it's fine, you 
> > can still build all the other targets that work without this script, just 
> > not the ones anymore that need it"?
> 
> My view on all this is a bit more pragmatic.
> 
> For a human developer, the difference between "dnf install
> python-sphinx" and "pip install sphinx" is, in my opinion, close to
> negligible.  Really no comparison to "git-clone GCC and bootstap it".
> You seem to disagree with that.

The command for installing the package is certainly not
significantly different.

What I think is lacking with pip is what happens after that
point - the ongoing management of the installed packages, or
rather than lack thereof.

If doing user installs, my $HOME/.local/lib ends up with multiple
orphaned previously installed versions. After each python version
upgrade, pip ceases to report about existance previously installed
bits at all, alone ever upgrade them.

Then there is the issue that pip will refuse to install a package,
if it already exists either from pip or the distro install, even
if the version that already exists doesn't satisfy the version
required. This would impact if the user has 'flake8'  N installed,
and QEMU wanted version N+1 installed, both using the same python
runtime version.

This is not the situation we're in with centos8/docutils, but
it is plausible in future once we decide we'll no longer rely
on exclusively on distro provided python packages, and instead
use pip if we ever want a newer version of something.


The python answer to this IIUC, is to use virtualenvs to isolate
everything. If we use keep the virtualenv under the QEMU build
root, then any time you clean your build root the virtualenv
content needs re-populating. At least pip has the sense to use
a cache, so $HOME/.cache/pip keeps a copy of everything you've
previously downloaded (presumably they age out the cache at
some time/size?), to avoid spending time re-loading all the
time. 


NB, I'm not saying the above is a blocker against use of pip.
Just that there are real differences between use of pip and
the distro packaging tools, beyond the initial install command.


If we're going to use pip, then using virtualenvs looks likely
to be very desirable to avoid conflicts between versions of
pkgs QEMU wants vs what the user might already have installed,
as well as to avoid leaving cruft behind in $HOME/.local/lib.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


