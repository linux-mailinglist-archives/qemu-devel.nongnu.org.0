Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 481EB3BBE93
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 16:59:34 +0200 (CEST)
Received: from localhost ([::1]:41496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Q4L-0005Kd-Af
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 10:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0Q1F-0001XN-89
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 10:56:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0Q1B-0005Bg-S1
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 10:56:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625496977;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/4CXkGMm1IKffSLK1484UGtCdvvVutrY/RlTAAx5QxU=;
 b=W2zMv+y73NRfiLmYQ80Qw7iVk0KZFsce6WPr37+33g4bnsY7jEdZhMpAhLDZABi9wp45bb
 SAqCjg/1zuynXY7nEdUEmQOq6cpPMFdfAtN1fcKb5sJ1rG3wy3CTSOXMgbIQm3m+tmqWXU
 AtbLl3rtPV7QXthXXEVNSWcyIEHhyvQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-fibHI8kPODO5SiowuwksCg-1; Mon, 05 Jul 2021 10:56:15 -0400
X-MC-Unique: fibHI8kPODO5SiowuwksCg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6D412B6;
 Mon,  5 Jul 2021 14:56:14 +0000 (UTC)
Received: from redhat.com (ovpn-114-184.ams2.redhat.com [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87A6960240;
 Mon,  5 Jul 2021 14:56:04 +0000 (UTC)
Date: Mon, 5 Jul 2021 15:56:01 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v4 16/22] tests/docker: add script for automating
 container refresh
Message-ID: <YOMdgZzikE82O290@redhat.com>
References: <20210623142245.307776-1-berrange@redhat.com>
 <20210623142245.307776-17-berrange@redhat.com>
 <87wnq43m89.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87wnq43m89.fsf@linaro.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 05, 2021 at 02:44:34PM +0100, Alex Bennée wrote:
> 
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > This introduces
> >
> >   https://gitlab.com/libvirt/libvirt-ci
> >
> > as a git submodule at tests/docker/libvirt-ci
> >
> > This submodule only needs to be checked out when needing to re-generate
> > the files in tests/docker/dockerfiles.
> >
> > When a new build pre-requisite is needed for QEMU, it should be added to
> > the libvirt-ci project 'qemu.yml' file, and the submodule updated to the
> > new commit.
> 
> It seems a bit weird to have the canonical description of QEMU
> dependencies live in another project does it not?

Yes, this is something I've been struggling with, since there
are varying use cases here.

The "lcitool" command was originally written to automate the
provisioning of virtual machines, suitable to act as runners
for a CI tool.

The VMs would be suitable for building a variety of projects,
so would need to be installed with the dependancies of all
projects. It makes sense to have the list of dependancies
in one central place. If you have them kept in each respective
project's git repo, then you have to checkout 20 git repos to
get their dependancies, before you can provision the VM.

It still supports VM provisioning, but now also supports
the Dockerfile generation too in parallel. With the
dockerfiles, you still have a need to access the dependancy
information from outside the main project. For example,
when building libvirt-perl.git, it wants to know the
dependancies needed by libvirt.git, so that it can do
a chained build of the two.

Potentially libvirt would also want to build qemu.git
first, so it can then test libvirt with latest QEMU.

So these things all end up driving towards the idea of
storing the build dependancies separate from the project.

It is definitely sub-optimal though, in that it introduces
a synchronization problem between the 2 respective git
repos for changes.

For libvirt we've mostly just accepted that pain of needing
to merge stuff in lock-step, but I think it is worse when
dealing with QEMU becasue the subsystem maintainer model
means stuff merges in 2 phases, so there's not a ideal
synchronization point.

> > The 'make docker-refresh' target will then re-create all the
> > dockerfiles with updated package lists. This ensures that all the
> > containers get exactly the same build pre-requisite packages installed.
> >
> > It also facilitates the addition of containers targetting new distros
> > or updating existing containers to new versions of the same distro,
> > where packages might have been renamed.
> >
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  docs/devel/testing.rst              | 34 ++++++++++++++++--
> >  tests/docker/Makefile.include       | 12 +++++++
> >  tests/docker/dockerfiles-refresh.py | 56 +++++++++++++++++++++++++++++
> >  3 files changed, 100 insertions(+), 2 deletions(-)
> >  create mode 100755 tests/docker/dockerfiles-refresh.py
> >
> > diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> > index 4e42392810..7882db85d4 100644
> > --- a/docs/devel/testing.rst
> > +++ b/docs/devel/testing.rst
> > @@ -372,8 +372,38 @@ Along with many other images, the ``centos8`` image is defined in a Dockerfile
> >  in ``tests/docker/dockerfiles/``, called ``centos8.docker``. ``make docker-help``
> >  command will list all the available images.
> >  
> > -To add a new image, simply create a new ``.docker`` file under the
> > -``tests/docker/dockerfiles/`` directory.
> > +Most of the existing Dockerfiles were written by hand, simply by creating a
> > +a new ``.docker`` file under the ``tests/docker/dockerfiles/`` directory.
> > +This has led to an inconsistent set of packages being present across the
> > +different containers.
> > +
> > +Thus going forward, QEMU is aiming to automatically generate the Dockerfiles
> > +using the ``lcitool`` program provided by the ``libvirt-ci`` project:
> > +
> > +  https://gitlab.com/libvirt/libvirt-ci
> > +
> > +In that project, there is a ``qemu.yml`` file defining the list of build
> > +pre-requisites needed by QEMU. This is processed together with the
> > +``mappings.yml`` file to compute the distro specific list of package names.
> > +The package names are then fed into a generator which emits a well structured
> > +dockerfile. The set of dockerfiles which are auto-generated is defined in
> > +the ``tests/docker/dockerfiles-refresh.py`` script.
> > +
> > +When preparing a patch series that changes dockerfiles managed by ``libvirt-ci``
> > +tools, the following steps should be takenL
> > +
> > + * Fork the ``libvirt-ci`` project on gitlab
> > +
> > + * Prepare changes to its ``qemu.yml`` file and optionally ``mappings.yml``
> > +   to define the packages to be added to QEMU's dockerfiles.
> > +
> > + * In QEMU run ``make docker-refresh LCITOOL=/path/to/libvirt-ci/lcitool``
> > +   to re-create the dockerfiles in ``tests/docker/dockerfiles``
> 
> If lcitool could be a pre-requisite (even as a developer only one)
> should we consider having a submodule and QEMU mirror of it?

I did have a submodule in the previous posting, but that creates its
own pain, because there's a chicken and egg problem to updates. Stuff
won't want to be merged into libvirt-ci.git until it is accepted by
a QEMU maintainer, but we need the submodule update ready before
it can be accepted by the QEMU maintainer. There's no nice way to
break that cycle without introducing a bit of manual work and
synchoronization at time of merge to master, which is not desirable
for QEMU IMHO

> > + * Submit your changes to QEMU in the normal manner
> > +
> > + * Submit ``libvirt-ci`` changes as a merge request, linking to the
> > +   QEMU patch series that uses them.
> 
> This just seems clunky and likely to therefor not get used. I would
> prefer keeping the meta-data within the project, maybe with a check that
> ensures the dockerfiles have not gone out of sync with their "idealised"
> form.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


