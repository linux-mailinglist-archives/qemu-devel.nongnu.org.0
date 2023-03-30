Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1DB6D00F8
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 12:18:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phpLu-0007p8-94; Thu, 30 Mar 2023 06:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1phpLs-0007op-DJ
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:17:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1phpLq-00016E-Mk
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:17:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680171469;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=97Iv5ulEe/0RBo3YQzeC3woiD/L6JRyjDMlKmvAtPzc=;
 b=Y99PAqcgnrmUvPjuhhfdCDhWS+srgGpxWIM20G+fCeNxqQdl4lhFqSk3RCkuhNL5I76b67
 ZvDluW3RLoMZJRnUc2fe2MuwuTvwsL6jMgrhZx+MEhFI2xm6Xq35rw/U/qZVm6onAUnBtj
 OOOXmR+FneHAxV6cFZ4vGOyv6OtpNl4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-tqyU4dy5NGyyjrukYx-sfA-1; Thu, 30 Mar 2023 06:17:46 -0400
X-MC-Unique: tqyU4dy5NGyyjrukYx-sfA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10C41884342;
 Thu, 30 Mar 2023 10:17:46 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6AE3492C3E;
 Thu, 30 Mar 2023 10:17:43 +0000 (UTC)
Date: Thu, 30 Mar 2023 11:17:41 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Reinoud Zandijk <reinoud@netbsd.org>
Subject: Re: [PATCH 11/11] tests/gitlab: use kaniko to build images
Message-ID: <ZCVhxS6+tKIA9X66@redhat.com>
References: <20230330101141.30199-1-alex.bennee@linaro.org>
 <20230330101141.30199-12-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230330101141.30199-12-alex.bennee@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

On Thu, Mar 30, 2023 at 11:11:41AM +0100, Alex Bennée wrote:
> Apparently the docker-in-docker approach has some flaws including
> needing privileged mode to run and being quite slow. An alternative
> approach is to use Google's kaniko tool. It also works across
> different gitlab executors.
> 
> Following the gitlab example code we drop all the direct docker calls
> and usage of the script and make a direct call to kaniko and hope the
> images are cacheable by others.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20230224180857.1050220-8-alex.bennee@linaro.org>
> 
> ---
> v2
>   - add danpb's --cache suggestions
> ---
>  .gitlab-ci.d/container-template.yml | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/.gitlab-ci.d/container-template.yml b/.gitlab-ci.d/container-template.yml
> index 519b8a9482..cd8e0a1ff6 100644
> --- a/.gitlab-ci.d/container-template.yml
> +++ b/.gitlab-ci.d/container-template.yml
> @@ -1,21 +1,19 @@
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
>      - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/qemu/$NAME:latest"
> -    - apk add python3
> -    - docker info
> -    - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
>    script:
>      - echo "TAG:$TAG"
>      - echo "COMMON_TAG:$COMMON_TAG"
> -    - docker build --tag "$TAG" --cache-from "$TAG" --cache-from "$COMMON_TAG"
> -      --build-arg BUILDKIT_INLINE_CACHE=1
> -      -f "tests/docker/dockerfiles/$NAME.docker" "."
> -    - docker push "$TAG"
> -  after_script:
> -    - docker logout
> +    - /kaniko/executor
> +          --reproducible
> +          --context "${CI_PROJECT_DIR}"
> +          --cache=true
> +          --cache-repo "${COMMON_TAG}"

IIRC with docker if we told it to cache we would have to first have done
a  'docker pull $COMMON_TAG' as it wouldn't pull down the image if
it was not already local. I'm fuzzy on whether kaniko has the same
need or not ?  I guess we were broken already in that respect as
we already uses --cache-from with docker without a docker pull

> +          --dockerfile "${CI_PROJECT_DIR}/tests/docker/dockerfiles/$NAME.docker"
> +          --destination "${TAG}"


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


