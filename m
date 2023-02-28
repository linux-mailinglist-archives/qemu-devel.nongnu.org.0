Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FB36A563D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 11:04:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWwqH-0000UP-FJ; Tue, 28 Feb 2023 05:04:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pWwqA-0000TX-Eb
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 05:04:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pWwq6-0001cl-Ja
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 05:04:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677578645;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ED9DZdMSWiE+HvPqkvC8YX2xJGifBu7LT+qUU6dYc8=;
 b=gvsIz5IYkOddoIoO3CLsH+qh/A8Bqkr/bJX8chxhVTT9Lft/ICKL6M0aSJvljZAU0irARS
 aQQR9LyC6A0RzJO4fuKwZP5QttYy/nLIQTWrnB/w5rRTOXXjmuOKwH8YnZFBxUmouc4Chu
 +s5JVVoRqrMXJR1G6JEohy6xdq4lP2E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-Hv-Jvcs8MYGphS1srgeqZg-1; Tue, 28 Feb 2023 05:04:01 -0500
X-MC-Unique: Hv-Jvcs8MYGphS1srgeqZg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48EEB1869B6D;
 Tue, 28 Feb 2023 10:04:01 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B777404BEC5;
 Tue, 28 Feb 2023 10:03:59 +0000 (UTC)
Date: Tue, 28 Feb 2023 10:03:57 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH v3 1/1] gitlab: Use plain docker in
 container-template.yml
Message-ID: <Y/3RjeKCbA0u/FMq@redhat.com>
References: <20230227151110.31455-1-farosas@suse.de>
 <20230227151110.31455-2-farosas@suse.de>
 <87fsargc9w.fsf@linaro.org> <87lekiyfr5.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87lekiyfr5.fsf@suse.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Mon, Feb 27, 2023 at 06:12:30PM -0300, Fabiano Rosas wrote:
> Alex Bennée <alex.bennee@linaro.org> writes:
> 
> > Fabiano Rosas <farosas@suse.de> writes:
> >
> >> Our dockerfiles no longer reference layers from other qemu images so
> >> we can now use 'docker build' on them.
> >>
> >> Also reinstate the caching that was disabled due to bad interactions
> >> with certain runners. See commit 6ddc3dc7a8 ("tests/docker: don't use
> >> BUILDKIT in GitLab either"). We now believe those issues to be fixed.
> >>
> >> The COMMON_TAG needed to be fixed for the caching to work. The
> >> docker.py script was not using the variable, but constructing the
> >> correct URL directly.
> >>
> >> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> >> ---
> >>  .gitlab-ci.d/container-template.yml | 9 ++++-----
> >>  1 file changed, 4 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/.gitlab-ci.d/container-template.yml b/.gitlab-ci.d/container-template.yml
> >> index c434b9c8f3..519b8a9482 100644
> >> --- a/.gitlab-ci.d/container-template.yml
> >> +++ b/.gitlab-ci.d/container-template.yml
> >> @@ -6,17 +6,16 @@
> >>      - docker:dind
> >>    before_script:
> >>      - export TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
> >> -    - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/$NAME:latest"
> >> +    - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/qemu/$NAME:latest"
> >>      - apk add python3
> >>      - docker info
> >>      - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
> >>    script:
> >>      - echo "TAG:$TAG"
> >>      - echo "COMMON_TAG:$COMMON_TAG"
> >> -    - ./tests/docker/docker.py --engine docker build
> >> -          -t "qemu/$NAME" -f "tests/docker/dockerfiles/$NAME.docker"
> >> -          -r $CI_REGISTRY/qemu-project/qemu
> >> -    - docker tag "qemu/$NAME" "$TAG"
> >> +    - docker build --tag "$TAG" --cache-from "$TAG" --cache-from "$COMMON_TAG"
> >> +      --build-arg BUILDKIT_INLINE_CACHE=1
> >> +      -f "tests/docker/dockerfiles/$NAME.docker" "."
> >
> > I wonder why this doesn't injest a bunch of context. If I run:
> >
> >   docker build --cache-from registry.gitlab.com/stsquad/qemu/qemu/debian-alpha-cross --build-arg BUILDKIT_INLINE_CACHE=1  --build-arg USER=alex --build-arg UID=1000 -t qemu
> >   /debian-alpha-cross -f "/home/alex/lsrc/qemu.git/tests/docker/dockerfiles/debian-alpha-cross.docker" .
> >
> > it attempts to bring my entire build directory in as build context. This
> > is why we use the - < docker form in the Makefile.
> >
> 
> I only see that without DOCKER_BUILDKIT=1. With the variable set it does
> like in the CI jobs. I presume it is being set automatically by gitlab,
> but we could add it to the script to be explicit.
> 
> >>      - docker push "$TAG"
> >>    after_script:
> >>      - docker logout
> >
> > So what I don't understand is if I do:
> >
> >   docker pull registry.gitlab.com/stsquad/qemu/qemu/debian-alpha-cross
> >   docker build --cache-from registry.gitlab.com/stsquad/qemu/qemu/debian-alpha-cross --build-arg
> >     BUILDKIT_INLINE_CACHE=1 -t qemu/debian-alpha-cross - <
> >     /home/alex/lsrc/qemu.git/tests/docker/dockerfiles/debian-alpha-cross.docker
> >
> > I still see pretty much a full rebuild of the image.
> 
> I don't use docker and podman does not support caching. I have
> fresh-installed docker today and indeed it seems to not use the cache at
> every build. We're missing something.

Empirically in gitlab I see it working as desired after applying this
patch. My first job building alpine container does all commands:

  https://gitlab.com/berrange/qemu/-/jobs/3845066410

My second job building alpine container uses the cache:

  https://gitlab.com/berrange/qemu/-/jobs/3845340414

IME of using this in libvirt the caching almost always did its job as
expected in gitlab.

IOW I wouldn't worry too much about local behaviour possibly differing.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


