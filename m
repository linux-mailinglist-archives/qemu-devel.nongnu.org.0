Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AEA322E1E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 16:57:51 +0100 (CET)
Received: from localhost ([::1]:43730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEa4M-0000vg-NY
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 10:57:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEa3I-0000F6-KN
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:56:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEa3G-0008TL-Cy
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:56:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614095801;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2y+towubJk6ikCc2qW1VLruXyQQj/6WuWYS53FR6Yn4=;
 b=d0PD/lcZbOc035HiTyB6aU87Ly4PJ6fncUh2dVhFv7rKUDFYE+ByxYt+226rzuumGvvEtl
 zVE0ipI+gZG/PS/91tIFcuaVJ0VrgBNkRFNmVX+BM+cGqpr6fL9bhky/0eQZV7SBz5az76
 899WtMUOcLAEmHd0JTl+Bpua1jhwbHw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-2doBy7zqOhqDy45d3ft98g-1; Tue, 23 Feb 2021 10:56:30 -0500
X-MC-Unique: 2doBy7zqOhqDy45d3ft98g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 789A76D4E6;
 Tue, 23 Feb 2021 15:56:29 +0000 (UTC)
Received: from redhat.com (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 81E605D6AB;
 Tue, 23 Feb 2021 15:56:22 +0000 (UTC)
Date: Tue, 23 Feb 2021 15:56:19 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v5 4/4] Jobs based on custom runners: add job definitions
 for QEMU's machines
Message-ID: <YDUlozcbgzWfQetX@redhat.com>
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-5-crosa@redhat.com>
 <21f882ba-21db-2d45-0e74-be27e1119355@redhat.com>
MIME-Version: 1.0
In-Reply-To: <21f882ba-21db-2d45-0e74-be27e1119355@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Erik Skultety <eskultet@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 23, 2021 at 04:17:23PM +0100, Philippe Mathieu-Daudé wrote:
> On 2/19/21 10:58 PM, Cleber Rosa wrote:
> > The QEMU project has two machines (aarch64 and s390x) that can be used
> > for jobs that do build and run tests.  This introduces those jobs,
> > which are a mapping of custom scripts used for the same purpose.
> > 
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  .gitlab-ci.d/custom-runners.yml | 204 ++++++++++++++++++++++++++++++++
> >  1 file changed, 204 insertions(+)
> > 
> > diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
> > index 3004da2bda..a9166c82a2 100644
> > --- a/.gitlab-ci.d/custom-runners.yml
> > +++ b/.gitlab-ci.d/custom-runners.yml
> > @@ -12,3 +12,207 @@
> >  # strategy.
> >  variables:
> >    GIT_SUBMODULE_STRATEGY: recursive
> > +
> > +# All ubuntu-18.04 jobs should run successfully in an environment
> > +# setup by the scripts/ci/setup/build-environment.yml task
> > +# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
> > +ubuntu-18.04-s390x-all-linux-static:
> > + allow_failure: true
> > + needs: []
> > + stage: build
> > + tags:
> > + - ubuntu_18.04
> > + - s390x
> 
> Where is this tag list filled upon registration?
> 
> > + rules:
> > + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
> > + script:
> > + # --disable-libssh is needed because of https://bugs.launchpad.net/qemu/+bug/1838763
> > + # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
> > + - mkdir build
> > + - cd build
> > + - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
> > + - make --output-sync -j`nproc`
> > + - make --output-sync -j`nproc` check V=1
> > + - make --output-sync -j`nproc` check-tcg V=1
> 
> Also this break the rest of the tests...
> 
> The first containers job (amd64-alpine-container) got
> added to the custom runner and failed (because docker-dind
> isn't there?):

Urgh, well that's a big problem. We certainly don't want *anything* being
placed on the custom runners without explicit opt-in, otherwise jobs run
in the main repo have a different environment from when users run on their
personal forks.

IOW, we need anti-affinity against our custom runners really.

> $ export TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
> $ export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/$NAME:latest"
> $ apk add python3
> bash: line 110: apk: command not found
> Running after_script 00:01
> Running after script...
> $ docker logout
> Removing login credentials for https://index.docker.io/v1/
> ERROR: Job failed: exit status 1
> 
> Do we need to restrict the other jobs to the Gitlab public
> (x86) runners? Maybe as:
> 
> diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
> @@ -1,6 +1,6 @@
>  .container_job_template: &container_job_definition
> +  tags:
> +    - gitlab-org-docker

Is that a real tag that exists on gitlab's shared runners, or something
you just invented ?

>    image: docker:stable
>    stage: containers
>    services:
> 
> Daniel, you didn't hit this problem on the previous version
> of this series?

I didn't try actually executing previous postings of this series.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


