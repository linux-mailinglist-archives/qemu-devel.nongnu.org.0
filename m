Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 744EB6A4A90
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 20:06:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWio5-0007Px-Kh; Mon, 27 Feb 2023 14:05:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pWio4-0007Pl-09
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 14:05:04 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pWio2-0004FA-8d
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 14:05:03 -0500
Received: by mail-wm1-x32b.google.com with SMTP id k37so4947935wms.0
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 11:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mUUO3V4j4IfzPuXbkd9GP8e4YnrmWIlkPWOTg4NEhq8=;
 b=ouZvhFZIF+jLvtz4dDDPYLTPPlm07agiuTlV6N+KzFN1NkRrMFqzcx89oVJGrv1SjA
 W2HUp11r2n56ddLfh5yLjquDPxUzRhE4FnyOwf1P3pLE3lu+HtJlb8HoZyrYeTdHYCKh
 WTfMq+yh1tYgkCMGAGTTj9+j6UJQuFFZVQZ86Si9pRACELFUpkyyDKnUSi8mWAtloqZS
 1DyRAcQj5buvicmoGJImEMXblfBEY7lLyc0hPbuYAoRTUrFig+C7fyvvKsuXG0WIMcky
 lfe/caNHi+brdkUz/mKiCqakZt1yOqpmySB/26XUnSU07Ar0tTJvo7GT6IFy48QaQ7zn
 0KUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mUUO3V4j4IfzPuXbkd9GP8e4YnrmWIlkPWOTg4NEhq8=;
 b=AOtiVbHlVAxg3yZNOqdqdayBVUuLYTK7tgdK/nCOLrR36rDcxeg8DI/9pByXjvSSZE
 z4qaE3RsVI9rTtB9IfnRvKJWJ4QbjQEiGDL1+9mQziPF79GplFMnhY4o28fBjr0xYemX
 Hss5DieCbzM2PHcCVFjLlpspo/FcDUCNs99VyBbZboNomo6S0OoISQNx0yQ5osOvgOP6
 GrIBZ5Hywd8AdJ1R+z2fhTRkpuA9P+m2NBF7r1qlTn0jEGSHNr7l8Snmss+gA2jQ0O5e
 FHYQAXEUPgWNfRgk/ELwSuO/hzJvOvG8Ff/UaMHr/kyxIBbQgx101+GP24VEQezZXlhm
 bf7g==
X-Gm-Message-State: AO0yUKUwqoJxGay/CLcPLRUd0g1Du6KjvhsthYeHdUsuRgQQcto0pk9l
 gQRm86Dfz4YmSSHgZUgGIHKdog==
X-Google-Smtp-Source: AK7set84nUrbLpLOzmDUFuToYrLLUece18KD0PLW/sun+jJR+vZgtZQzNjUiLYeVoRxjRyk1cPf5YQ==
X-Received: by 2002:a05:600c:4f81:b0:3ea:dbdd:b59c with SMTP id
 n1-20020a05600c4f8100b003eadbddb59cmr155924wmq.15.1677524700289; 
 Mon, 27 Feb 2023 11:05:00 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003e2096da239sm13719882wmq.7.2023.02.27.11.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 11:04:59 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8FEF41FFB7;
 Mon, 27 Feb 2023 19:04:59 +0000 (GMT)
References: <20230227151110.31455-1-farosas@suse.de>
 <20230227151110.31455-2-farosas@suse.de>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Wainer dos Santos
 Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>, =?utf-8?Q?Daniel?=
 =?utf-8?Q?_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [RFC PATCH v3 1/1] gitlab: Use plain docker in
 container-template.yml
Date: Mon, 27 Feb 2023 19:00:03 +0000
In-reply-to: <20230227151110.31455-2-farosas@suse.de>
Message-ID: <87fsargc9w.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Fabiano Rosas <farosas@suse.de> writes:

> Our dockerfiles no longer reference layers from other qemu images so
> we can now use 'docker build' on them.
>
> Also reinstate the caching that was disabled due to bad interactions
> with certain runners. See commit 6ddc3dc7a8 ("tests/docker: don't use
> BUILDKIT in GitLab either"). We now believe those issues to be fixed.
>
> The COMMON_TAG needed to be fixed for the caching to work. The
> docker.py script was not using the variable, but constructing the
> correct URL directly.
>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>  .gitlab-ci.d/container-template.yml | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/.gitlab-ci.d/container-template.yml b/.gitlab-ci.d/container=
-template.yml
> index c434b9c8f3..519b8a9482 100644
> --- a/.gitlab-ci.d/container-template.yml
> +++ b/.gitlab-ci.d/container-template.yml
> @@ -6,17 +6,16 @@
>      - docker:dind
>    before_script:
>      - export TAG=3D"$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
> -    - export COMMON_TAG=3D"$CI_REGISTRY/qemu-project/qemu/$NAME:latest"
> +    - export COMMON_TAG=3D"$CI_REGISTRY/qemu-project/qemu/qemu/$NAME:lat=
est"
>      - apk add python3
>      - docker info
>      - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_=
PASSWORD"
>    script:
>      - echo "TAG:$TAG"
>      - echo "COMMON_TAG:$COMMON_TAG"
> -    - ./tests/docker/docker.py --engine docker build
> -          -t "qemu/$NAME" -f "tests/docker/dockerfiles/$NAME.docker"
> -          -r $CI_REGISTRY/qemu-project/qemu
> -    - docker tag "qemu/$NAME" "$TAG"
> +    - docker build --tag "$TAG" --cache-from "$TAG" --cache-from "$COMMO=
N_TAG"
> +      --build-arg BUILDKIT_INLINE_CACHE=3D1
> +      -f "tests/docker/dockerfiles/$NAME.docker" "."

I wonder why this doesn't injest a bunch of context. If I run:

  docker build --cache-from registry.gitlab.com/stsquad/qemu/qemu/debian-al=
pha-cross --build-arg BUILDKIT_INLINE_CACHE=3D1  --build-arg USER=3Dalex --=
build-arg UID=3D1000 -t qemu
  /debian-alpha-cross -f "/home/alex/lsrc/qemu.git/tests/docker/dockerfiles=
/debian-alpha-cross.docker" .

it attempts to bring my entire build directory in as build context. This
is why we use the - < docker form in the Makefile.

>      - docker push "$TAG"
>    after_script:
>      - docker logout

So what I don't understand is if I do:

  docker pull registry.gitlab.com/stsquad/qemu/qemu/debian-alpha-cross
  docker build --cache-from registry.gitlab.com/stsquad/qemu/qemu/debian-al=
pha-cross --build-arg
    BUILDKIT_INLINE_CACHE=3D1 -t qemu/debian-alpha-cross - <
    /home/alex/lsrc/qemu.git/tests/docker/dockerfiles/debian-alpha-cross.do=
cker

I still see pretty much a full rebuild of the image.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

