Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 915266A5734
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 11:54:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWxc4-0008F4-Kl; Tue, 28 Feb 2023 05:53:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pWxc2-0008E2-48
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 05:53:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pWxc0-0005Jb-1R
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 05:53:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677581615;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4B0yCKa4hAbcRPlKdCpt5ZAwhMWkjGVG1SlP+iC3Y/o=;
 b=VxEKrY2+ecPbsC5EQhP59A/mYE/TsF+mK5K+WFE7WJnKZFs0l34ZB6NXZKteaKA3Jmt8QQ
 Npq5Fs0CZrDg61SsK9u2ecfRFKKLur6OWHrXsjINzPCL7mnodlmI+DJkpFZULFyyZ4uhpT
 0WQSyoud83kAzT4XWqJUDjT3UwXYBZo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-VfRp8SbjM7C4Yd0erLXa1g-1; Tue, 28 Feb 2023 05:53:32 -0500
X-MC-Unique: VfRp8SbjM7C4Yd0erLXa1g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6388F889047;
 Tue, 28 Feb 2023 10:53:31 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A82D2026D4B;
 Tue, 28 Feb 2023 10:53:27 +0000 (UTC)
Date: Tue, 28 Feb 2023 10:53:24 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Beraldo Leal <bleal@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, Ed Maste <emaste@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 John Snow <jsnow@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Hanna Reitz <hreitz@redhat.com>,
 Bandan Das <bsd@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Subject: Re: [PATCH 7/7] tests/gitlab: use kaniko to build images
Message-ID: <Y/3dJNGKgwByiR5U@redhat.com>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
 <20230224180857.1050220-8-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230224180857.1050220-8-alex.bennee@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Fri, Feb 24, 2023 at 06:08:57PM +0000, Alex Bennée wrote:
> Apparently the docker-in-docker approach has some flaws including
> needing privileged mode to run and being quite slow. An alternative
> approach is to use Google's kaniko tool. It also works across
> different gitlab executors.

Interesting, I've not come across this tool before.

> Following the gitlab example code we drop all the direct docker calls
> and usage of the script and make a direct call to kaniko and hope the
> images are cacheable by others.



> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.d/container-template.yml | 23 +++++++++--------------
>  1 file changed, 9 insertions(+), 14 deletions(-)
> 
> diff --git a/.gitlab-ci.d/container-template.yml b/.gitlab-ci.d/container-template.yml
> index c434b9c8f3..c2d7950df8 100644
> --- a/.gitlab-ci.d/container-template.yml
> +++ b/.gitlab-ci.d/container-template.yml
> @@ -1,22 +1,17 @@
>  .container_job_template:
>    extends: .base_job_template
> -  image: docker:stable
> +  image:
> +    name: gcr.io/kaniko-project/executor:v1.9.0-debug
> +    entrypoint: [""]
>    stage: containers
> -  services:
> -    - docker:dind
>    before_script:
>      - export TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
> -    - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/$NAME:latest"
> -    - apk add python3
> -    - docker info
> -    - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
> +    - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/qemu/$NAME:latest"
>    script:
>      - echo "TAG:$TAG"
>      - echo "COMMON_TAG:$COMMON_TAG"
> -    - ./tests/docker/docker.py --engine docker build
> -          -t "qemu/$NAME" -f "tests/docker/dockerfiles/$NAME.docker"
> -          -r $CI_REGISTRY/qemu-project/qemu
> -    - docker tag "qemu/$NAME" "$TAG"
> -    - docker push "$TAG"
> -  after_script:
> -    - docker logout
> +    - /kaniko/executor
> +          --reproducible
> +          --context "${CI_PROJECT_DIR}"
> +          --dockerfile "${CI_PROJECT_DIR}/tests/docker/dockerfiles/$NAME.docker"
> +          --destination "${TAG}"

AFAICT from reading the docs, this does not allow for caching of layers
from the previous built image, so will always do a from scratch build.
This feels like it would kill any performance benefits over docker.

https://github.com/GoogleContainerTools/kaniko#caching

  "Users can opt into caching by setting the --cache=true flag. A
   remote repository for storing cached layers can be provided via
   the --cache-repo flag. If this flag isn't provided, a cached
   repo will be inferred from the --destination provided."

So it would sound like we need --cache=true adding to this command,
and in theory it should prime its cache from ${TAG}, but i'm not
entirely confident in that without testing. Also does not seem
like its psosible to have the dual cache COMMON_TAG + TAG, which
is particularly important for forks, since COMMON_TAG is more
likely to be up2date.

We could live with the latter restriction if we *always* used
COMMON_TAG as the cache, because 99% of the time forks are
going to just be using dockerfiles that match upstream. Only
those few contributors who have a branch that's changing
the dockerfiles would benefit from pointing the cache at
their fork.

So we could achieve that I believe using

     - /kaniko/executor
           --reproducible
           --context "${CI_PROJECT_DIR}"
	   --cache=true
	   --cache-repo "${COMMON_TAG}"
           --dockerfile "${CI_PROJECT_DIR}/tests/docker/dockerfiles/$NAME.docker"
           --destination "${TAG}"

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


