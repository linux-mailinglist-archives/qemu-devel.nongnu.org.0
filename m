Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA112AEDF1
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 10:38:59 +0100 (CET)
Received: from localhost ([::1]:58574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcmag-0005QL-Ep
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 04:38:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcmZj-0004vX-Gv
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 04:37:59 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:46390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcmZh-0003P7-Hs
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 04:37:59 -0500
Received: by mail-wr1-x441.google.com with SMTP id d12so1813215wrr.13
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 01:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=3ZiRUDWyjcG7thU1XQnc1HNvMx09UmC8rNVDG2yWg28=;
 b=DYbv56mtZxp0EhYAGD9IG+I9ZHIQ+dTIxHrjqRlRBi0Fhr25VdyrL7vatcmE2ws3kb
 qlvj5Fj8yJhoMIE3rjhPbXJU3PsXNrfwT1YjA5g4fv5j1GmJXjsCa3kN5CR0nUJWGDYE
 Btcmsq4scfY32+xAP34+1lsZVj4Z6d5yqa5qyedMvit/KZBOWUjrtV54szPTabJUOFRu
 RvNfcTK2wfoDPE4yBS6gnn/YJ9WQMtIq3oQiuS2Fv7l7EAg8L8GU4URTi3Dlkldw9G5V
 IDCwuEzBvzCWQAizaKZyP1cCQlI9iNTOO0eY/cNiPR/5Z9lKakqDHi4vygjrv6Ac568F
 xp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=3ZiRUDWyjcG7thU1XQnc1HNvMx09UmC8rNVDG2yWg28=;
 b=kCGDRT9poTRUZIXcHPipq47Uc3lPgTtPg+ZJJWpsuoxbiqMbooYGV/8luZxKHyiAMs
 nnmnpzUox6jbQ7tYNdxbJoV9rqhctIoykY7nsfWE7BVHwd8DX213OmhZkc8COkcFuzqL
 YhFjFdkkfOkYdzsRMAJc5gnc4p5GafnPJabYNDC1wrobtJ7oDV4R1RqhYOll1Zm09K9L
 p/r19cw4+RRD4/NJdfONJVrNKyuDQkxtE4beLtGeg8VXMz7Sj9V0Nwya6CUGS5x9HOnK
 hAeVGGrjYPAeEDLANmNPrTSA9lWNatU2Mhs5USLGpZ4x8+IY5CDQAc2sXbAEBpUwgHi4
 OOdw==
X-Gm-Message-State: AOAM5306O0TUn+OssIZml0rdH7tUnT8gpF4HL6xGrrNPeO5M2smm9VOP
 LiaDVY3TlOUMcrU3CupETQDuAw==
X-Google-Smtp-Source: ABdhPJzroisPiNHWk+ayxXXNAOKbrK1DVTOxM/QEv5wTuXgWGkws7z34iVBo0JP7486K7iTncREv/w==
X-Received: by 2002:adf:eeca:: with SMTP id a10mr24646606wrp.186.1605087475485; 
 Wed, 11 Nov 2020 01:37:55 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x1sm1768574wrl.41.2020.11.11.01.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 01:37:54 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A4F2D1FF7E;
 Wed, 11 Nov 2020 09:37:53 +0000 (GMT)
References: <20201110160140.2859904-1-philmd@redhat.com>
 <20201110160140.2859904-11-philmd@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 10/16] gitlab-ci: Introduce the CI "job maintainer"
 concept
In-reply-to: <20201110160140.2859904-11-philmd@redhat.com>
Date: Wed, 11 Nov 2020 09:37:53 +0000
Message-ID: <87o8k46xou.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>, "Daniel P .
 Berrange" <berrange@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Bin Meng <bin.meng@windriver.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 virt-ci-maint-team@redhat.com, Bin Meng <bmeng.cn@gmail.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> When a job fails, someone has to take care of it. As we can
> not wait indefinitively of volunteers good will, introduce the
> concept of "job maintainers". A job maintainer is reponsible
> of keeping it working, or contact the developers having broken
> it to fix it.
>
> When a job is added, it must have a maintainer. A job without
> maintainer is not run automatically. It can however be run
> manually from the WebUI.
>
> To declare a maintainer, it is as easy as defining the
> JOB_MAINTAINER_NAME / JOB_MAINTAINER_EMAIL environment variables.

So I think the problem here is the CI jobs are orthogonal to the actual
tests. And the tests should be associated via MAINTAINERS with the
relevant sub-systems.

That is not to say that the test environments don't need some care and
attention. So I'm quite happy to track updates needed to
tests/docker/dockerfiles for example but just because check-block failed
on an Ubuntu system doesn't mean I'm best placed to diagnose the
problem. In the first instance it shouldn't happen (not merging code
that regresses a test) and the second instance probably requires a block
maintainer to look at the output.

I think a better solution is to improve our test reporting so we can
quickly point the failing tests. I notice GitLab gets nice test output
from check-acceptance. What would we need to do to improve it from
check, check-block and check-tcg?


>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Ideally the runner will notify the maintainer by mail that
> a job fails. But we are not quite there yet.
>
> It would be nice if someone document this properly.
> ---
>  .gitlab-ci.d/containers.yml  | 4 ++++
>  .gitlab-ci.d/crossbuilds.yml | 6 ++++++
>  .gitlab-ci.yml               | 6 ++++++
>  3 files changed, 16 insertions(+)
>
> diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
> index 7e664878cab..bd2a05008d1 100644
> --- a/.gitlab-ci.d/containers.yml
> +++ b/.gitlab-ci.d/containers.yml
> @@ -21,6 +21,10 @@
>    after_script:
>      - docker logout
>    rules:
> +    # Skip unmaintained jobs
> +    - if: $JOB_MAINTAINER_NAME =3D=3D null || $JOB_MAINTAINER_EMAIL =3D=
=3D null
> +      when: manual
> +      allow_failure: true
>      - changes:
>        - .gitlab-ci.d/containers.yml
>        - tests/docker/*
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 701550f028c..aecdb2a38f1 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -1,6 +1,12 @@
>  .cross_common_job:
>    stage: build
>    image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
> +  rules:
> +    # Skip unmaintained jobs
> +    - if: $JOB_MAINTAINER_NAME =3D=3D null || $JOB_MAINTAINER_EMAIL =3D=
=3D null
> +      when: manual
> +      allow_failure: true
> +    - when: always
>=20=20
>  .cross_system_build_job:
>    extends: .cross_common_job
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 2e631d4f160..ded4f0bdd18 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -19,6 +19,12 @@ include:
>=20=20
>  .native_common_job:
>    image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
> +  rules:
> +    # Skip unmaintained jobs
> +    - if: $JOB_MAINTAINER_NAME =3D=3D null || $JOB_MAINTAINER_EMAIL =3D=
=3D null
> +      when: manual
> +      allow_failure: true
> +    - when: always
>=20=20
>  .native_build_job:
>    extends: .native_common_job


--=20
Alex Benn=C3=A9e

