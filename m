Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 973D76A184E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 09:54:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVTpt-0004Jr-1j; Fri, 24 Feb 2023 03:53:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pVTpr-0004JP-IK
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:53:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pVTpp-0002BD-Lb
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:53:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677228825;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0F/lWvc5ZACgiXEYcXQPEApvOhmYnCyrJmR2YKAXrsM=;
 b=LVPqUIZKUMVhpE2UCxqsJyutNW0cDfpcePRAbMf4R3iFf9r3Hqp5dNWLJe3Vkso7Y+GF7F
 nH+jyvSVl/r0h+tT921t1+eh6Y78rupVrLCX7TG/lX/4OnS15LgLGrIJbRHL5PujVC6qQz
 D4Yr8TOxtZHfFSNbvOrF8M20kfwoFP0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-8j-X33F8OR6lbjICGJR56g-1; Fri, 24 Feb 2023 03:53:41 -0500
X-MC-Unique: 8j-X33F8OR6lbjICGJR56g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A69985CCE0;
 Fri, 24 Feb 2023 08:53:41 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF164492B07;
 Fri, 24 Feb 2023 08:53:39 +0000 (UTC)
Date: Fri, 24 Feb 2023 08:53:37 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH 0/1] ci: Speed up container stage
Message-ID: <Y/h7EcuCLXOg7eXF@redhat.com>
References: <20230223142154.31975-1-farosas@suse.de>
 <Y/d+9jsvwF5tySlv@redhat.com> <877cw8pep0.fsf@linaro.org>
 <87wn48jf99.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87wn48jf99.fsf@suse.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Feb 23, 2023 at 05:30:58PM -0300, Fabiano Rosas wrote:
> 
> Hi Alex,
> 
> > Daniel P. Berrangé <berrange@redhat.com> writes:
> >
> >> On Thu, Feb 23, 2023 at 11:21:53AM -0300, Fabiano Rosas wrote:
> >>> I'm not sure if this was discussed previously, but I noticed we're not
> >>> pulling the images we push to the registry at every pipeline run.
> >>> 
> >>> I would expect we don't actually need to rebuild container images at
> >>> _every_ pipeline run, so I propose we add a "docker pull" to the
> >>> container templates. We already have that for the docker-edk2|opensbi
> >>> images.
> >>> 
> >>> Some containers can take a long time to build (14 mins) and pulling
> >>> the image first without building can cut the time to about 3
> >>> mins. With this we can save almost 2h of cumulative CI time per
> >>> pipeline run:
> >>
> >> The docker.py script that we're invoking is already pulling the
> >> image itself eg to pick a random recent job:
> >>
> >>   https://gitlab.com/qemu-project/qemu/-/jobs/3806090058
> >>
> >> We can see
> >>
> >>   $ ./tests/docker/docker.py --engine docker build -t "qemu/$NAME" -f
> >> "tests/docker/dockerfiles/$NAME.docker" -r
> >> $CI_REGISTRY/qemu-project/qemu 03:54
> >>   Using default tag: latest
> >>   latest: Pulling from qemu-project/qemu/qemu/debian-arm64-cross
> >>   bb263680fed1: Pulling fs layer
> >>   ...snip...
> >>
> >> none the less it still went ahead and rebuilt the image from scratch
> >> so something is going wrong here. I don't know why your change adding
> >> an extra 'docker pull' would have any effect, given we're already
> >> pulling, so I wonder if that's just coincidental apparent change
> >> due to the initial state of your fork's container registery.
> >>
> >> Whenever I look at this I end up wishing out docker.py didn't exist
> >> and that we could just directly do
> >>
> >>   - docker pull "$TAG"
> >>   - docker build --cache-from "$TAG" --tag "$TAG" -f "tests/docker/$NAME.docker"
> >>
> >> as that sould be sufficient to build the image with caching.
> >
> > I think we should be ready to do that now as we have flattened all our
> > dockerfiles. The only other thing that docker.py does is nicely add a
> > final step for the current user so you can ensure all files generated in
> > docker cross compile images are still readable on the host.
> >
> 
> Just so you know this command line worked:
> 
> docker build --cache-from $TAG --tag $TAG --build-arg BUILDKIT_INLINE_CACHE=1 \
>   -f "tests/docker/dockerfiles/$NAME.docker" "."
> 
> building the cache: https://gitlab.com/farosas/qemu/-/jobs/3825838177
> using the cache:    https://gitlab.com/farosas/qemu/-/jobs/3825926944
> 
> But we might still have this issue:
> 
> commit 6ddc3dc7a882f2e7200fa7fecf505a8d0d8bbea9
> Author: Daniel P. Berrangé <berrange@redhat.com>
> Date:   Fri Jul 9 15:29:35 2021 +0100
> 
>     tests/docker: don't use BUILDKIT in GitLab either
>     
>     Using BUILDKIT breaks with certain container registries such as CentOS,
>     with docker build reporting an error such as
>     
>       failed to solve with frontend dockerfile.v0:
>       failed to build LLB: failed to load cache key:
>       unexpected status code
>       https://registry.centos.org/v2/centos/manifests/7:
>       403 Forbidden
> 
> We might need to go the route of skipping the docker build when the
> docker pull succeeds.

I don't recall what made QEMU special in that respect, but we never
set this variable in any libvirt project and didn't see any obvious
problems. So I'm inclined to say it was something the docker.py
does that's caused the problem

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


