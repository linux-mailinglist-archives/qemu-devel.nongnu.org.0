Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C58746D0D90
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 20:16:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phwo3-00057c-JT; Thu, 30 Mar 2023 14:15:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phwo2-00056j-1t
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:15:26 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phwo0-0004SZ-0n
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:15:25 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 j18-20020a05600c1c1200b003ee5157346cso13929113wms.1
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 11:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680200121;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kJvhX3LippTRvdR7PvMJfA3h6Yl33F0vcJeyJ7QLAg0=;
 b=wsoqowKNRuuTDKiABwxpIZL/oikvwjOeRgYbC1SJU3LkaFSDSxLqVB1d+LwCMFBAdj
 t3mysqtIFrKiH/ITJhYQGHcuHOk+h9kgEvFrx8TPVPG0hSCu5cPSbZxVSM1HDSpDKPsE
 OuD+Gk0YEAE9K3PmcZOvFgnFcTo3CQfasy2D4ZQFP02GEmfU70fnxDo955tQwbeN6k6G
 UbyOJrXSBWBe8huppkRscfsJpzQjqFGy4Vl2sGhzxM0QEB6mQKES3RZvmDSsxH3J5d2Y
 DIAAVUwV9F9QhO1cKtaTWI/JBtTrn/KzMFZD1ckNO/ZfwjDtMFWfwzUs48o6e2xZjLoa
 ZFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680200121;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kJvhX3LippTRvdR7PvMJfA3h6Yl33F0vcJeyJ7QLAg0=;
 b=8GiuByOdOqU5XispPX5N0WsEZe7rYg+lwNZiaRg/QGmRsU0DUZSemqqhoY83zETZUK
 nEOkZhfzVrsi6ICeBmpckfKbZiie06dTvbhPFXan9p1tp7meQZR867B2vf3Zfiand0wG
 nXmY559Xz+ri8kgLyqvkuSARrkKLX7DgkKABSjl5qg1Zmnbsg0ywg7pvgZFlqhI3Bmn5
 oa24K8KjostP0/PMevenXkF5EcLGB6AEanwOGycfEtHOLdcJ0CrzkG5L1sw+KD+5pUl7
 nDkaCSFIM8CT5RgXmnpaep3lrD/DocIhGbOgDpeO36YHTNm/UM/tphj9IQYJKvhUDZZb
 pB6Q==
X-Gm-Message-State: AO0yUKXD8QKA2z6F3c9NJp8QRviQPEK3a+wqV9t/S4S/8/7hrIUimlKX
 ttFAOWQmd1YMs5L2zxLdMN9GQw==
X-Google-Smtp-Source: AK7set+Nvj7WObpZXadnLWNFl0sN4IVsksONxP84n4kfgUDmkKVH+QxxQ1MdnboyZjJqMt5J8oYLkQ==
X-Received: by 2002:a7b:c5c1:0:b0:3ee:5bd8:d537 with SMTP id
 n1-20020a7bc5c1000000b003ee5bd8d537mr18857224wmk.5.1680200090956; 
 Thu, 30 Mar 2023 11:14:50 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a05600c3b9700b003ede04deb14sm6841862wms.48.2023.03.30.11.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 11:14:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 307561FFB7;
 Thu, 30 Mar 2023 19:14:50 +0100 (BST)
References: <20230330101141.30199-1-alex.bennee@linaro.org>
 <20230330101141.30199-12-alex.bennee@linaro.org>
 <ZCVhxS6+tKIA9X66@redhat.com> <ZCVpMDLPJcdnkAJz@redhat.com>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, Warner Losh
 <imp@bsdimp.com>, Ryo ONODERA <ryoon@netbsd.org>, Kevin Wolf
 <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Kyle
 Evans <kevans@freebsd.org>, Reinoud Zandijk <reinoud@netbsd.org>
Subject: Re: [PATCH 11/11] tests/gitlab: use kaniko to build images
Date: Thu, 30 Mar 2023 19:14:03 +0100
In-reply-to: <ZCVpMDLPJcdnkAJz@redhat.com>
Message-ID: <871ql6nm1x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Mar 30, 2023 at 11:17:41AM +0100, Daniel P. Berrang=C3=A9 wrote:
>> On Thu, Mar 30, 2023 at 11:11:41AM +0100, Alex Benn=C3=A9e wrote:
>> > Apparently the docker-in-docker approach has some flaws including
>> > needing privileged mode to run and being quite slow. An alternative
>> > approach is to use Google's kaniko tool. It also works across
>> > different gitlab executors.
>> >=20
>> > Following the gitlab example code we drop all the direct docker calls
>> > and usage of the script and make a direct call to kaniko and hope the
>> > images are cacheable by others.
>> >=20
>> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> > Message-Id: <20230224180857.1050220-8-alex.bennee@linaro.org>
>> >=20
>> > ---
>> > v2
>> >   - add danpb's --cache suggestions
>> > ---
>> >  .gitlab-ci.d/container-template.yml | 22 ++++++++++------------
>> >  1 file changed, 10 insertions(+), 12 deletions(-)
>> >=20
>> > diff --git a/.gitlab-ci.d/container-template.yml b/.gitlab-ci.d/contai=
ner-template.yml
>> > index 519b8a9482..cd8e0a1ff6 100644
>> > --- a/.gitlab-ci.d/container-template.yml
>> > +++ b/.gitlab-ci.d/container-template.yml
>> > @@ -1,21 +1,19 @@
>> >  .container_job_template:
>> >    extends: .base_job_template
>> > -  image: docker:stable
>> > +  image:
>> > +    name: gcr.io/kaniko-project/executor:v1.9.0-debug
>> > +    entrypoint: [""]
>> >    stage: containers
>> > -  services:
>> > -    - docker:dind
>> >    before_script:
>> >      - export TAG=3D"$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
>> >      - export COMMON_TAG=3D"$CI_REGISTRY/qemu-project/qemu/qemu/$NAME:=
latest"
>> > -    - apk add python3
>> > -    - docker info
>> > -    - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGIST=
RY_PASSWORD"
>> >    script:
>> >      - echo "TAG:$TAG"
>> >      - echo "COMMON_TAG:$COMMON_TAG"
>> > -    - docker build --tag "$TAG" --cache-from "$TAG" --cache-from "$CO=
MMON_TAG"
>> > -      --build-arg BUILDKIT_INLINE_CACHE=3D1
>> > -      -f "tests/docker/dockerfiles/$NAME.docker" "."
>> > -    - docker push "$TAG"
>> > -  after_script:
>> > -    - docker logout
>> > +    - /kaniko/executor
>> > +          --reproducible
>> > +          --context "${CI_PROJECT_DIR}"
>> > +          --cache=3Dtrue
>> > +          --cache-repo "${COMMON_TAG}"
>>=20
>> IIRC with docker if we told it to cache we would have to first have done
>> a  'docker pull $COMMON_TAG' as it wouldn't pull down the image if
>> it was not already local. I'm fuzzy on whether kaniko has the same
>> need or not ?  I guess we were broken already in that respect as
>> we already uses --cache-from with docker without a docker pull
>
> Oh never mind, because we're not docker-in-docker, we can't pull the
> image tag down locally, and as discussed on IRC, caching works in a
> very different way. kaniko wants to be able to push & pull in the
> cache-repo itself.
>
> I'm inclined to think we're better off ignoring layer caching and instead
> focus on entirely skipping execution of kaniko if we know the dockerfile
> has not changed eg something along the lines of:
>
>    manifest=3D$(curl ....some registry URL to fetch image metadata)
>    oldchecksum=3D$(...extract a LABEL from metadata container dockerfile =
sha256)
>    newchecksum=3D$(sha256sum tests/docker/dockerfiles/$NAME.docker)
>
>    if test $oldchecksum !=3D $newchecksum -o -n $QEMU_FORCE_REBUILD"
>    then
>       - /kaniko/executor
>             --reproducible
>             --context "${CI_PROJECT_DIR}"
>             --dockerfile "${CI_PROJECT_DIR}/tests/docker/dockerfiles/$NAM=
E.docker"
> 	    --label DKR_CHECKSUM=3D$newchecksum
>             --destination "${TAG}"
>    fi
>
>
> And then have a weekly pipeline on sundays that sets QEMU_FORCE_REBUILD=
=3D1
> so that we pick up changes from the distro base images, and/or package
> repes regularly.

Hmm this appears to be a dead end. I got to this:

--8<---------------cut here---------------start------------->8---
tests/gitlab: use kaniko to build images

Apparently the docker-in-docker approach has some flaws including
needing privileged mode to run and being quite slow. An alternative
approach is to use Google's kaniko tool. It also works across
different gitlab executors.

Following the gitlab example code we drop all the direct docker calls
and usage of the script and make a direct call to kaniko and hope the
images are cacheable by others.

Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Message-Id: <20230224180857.1050220-8-alex.bennee@linaro.org>

---
v2
  - add danpb's --cache suggestions
v3
  - don't include :latest in tag
  - allow kaniko to infer local registry location, drop COMMON_TAG
  - add registry login details
  - version bump
  - don't push cache layers

1 file changed, 13 insertions(+), 14 deletions(-)
.gitlab-ci.d/container-template.yml | 27 +++++++++++++--------------

modified   .gitlab-ci.d/container-template.yml
@@ -1,21 +1,20 @@
 .container_job_template:
   extends: .base_job_template
-  image: docker:stable
+  image:
+    name: gcr.io/kaniko-project/executor:v1.9.2-debug
+    entrypoint: [""]
   stage: containers
-  services:
-    - docker:dind
   before_script:
-    - export TAG=3D"$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
-    - export COMMON_TAG=3D"$CI_REGISTRY/qemu-project/qemu/qemu/$NAME:lates=
t"
-    - apk add python3
-    - docker info
-    - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PA=
SSWORD"
+    - export TAG=3D"$CI_REGISTRY_IMAGE/qemu/$NAME"
   script:
     - echo "TAG:$TAG"
     - echo "COMMON_TAG:$COMMON_TAG"
-    - docker build --tag "$TAG" --cache-from "$TAG" --cache-from "$COMMON_=
TAG"
-      --build-arg BUILDKIT_INLINE_CACHE=3D1
-      -f "tests/docker/dockerfiles/$NAME.docker" "."
-    - docker push "$TAG"
-  after_script:
-    - docker logout
+    - echo "{\"auths\":{\"${CI_REGISTRY}\":{\"auth\":\"$(echo -n ${CI_REGI=
STRY_USER}:${CI_REGISTRY_PASSWORD} | base64)\"}}}" > /kaniko/.docker/config=
.json
+    - /kaniko/executor
+          --reproducible
+          --context "${CI_PROJECT_DIR}"
+          --cache=3Dtrue
+          --reproducible
+          --no-push-cache
+          --dockerfile "${CI_PROJECT_DIR}/tests/docker/dockerfiles/$NAME.d=
ocker"
+          --destination "${TAG}"
--8<---------------cut here---------------end--------------->8---

However the builds are failing so I think I just need to drop this and
move on.

>
> With regards,
> Daniel


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

