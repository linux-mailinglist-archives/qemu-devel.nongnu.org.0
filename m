Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9AF32072C
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 22:12:45 +0100 (CET)
Received: from localhost ([::1]:54442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDZYS-0003ML-Ee
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 16:12:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lDZXX-0002gS-2Y
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 16:11:47 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:51916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lDZXV-0004wu-7W
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 16:11:46 -0500
Received: by mail-wm1-x32b.google.com with SMTP id o82so10075044wme.1
 for <qemu-devel@nongnu.org>; Sat, 20 Feb 2021 13:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ZvFZJJvHaXHRtd1AOgAtHd/qz7BXvfuxxpNsLOpIp2s=;
 b=F7lmLIGmHM/CsYLnY7zwZOI8jGyf4aTfz2sIm2ymSFfdQvvicnKN23aBw9OIjJKf0G
 3WHdr0pxQQi2tP29CZFcGWf1COtODjUjKGW1MnaOJNkG4X9POXZ2H2sKbI7dcIIOi4ZY
 HBvE4Q6SOwP8rwv9wlaVgQ5AyguUul8GA4SKKSjOHow6Lwo2uTiLQij5emRhEt5PIPlh
 B1elNJbM4+yRlykgXd8Wqb2+cFmFUaChRYRX3JDOjDJRZFhd5jtL/AB5zkmHSVNpG51/
 WTcWWeJdqLeIxyCzclJjQXC8urwwRXx3brZRRC6eJijGUdQvvsim5FOmoDj0TzSe2VBR
 FoSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ZvFZJJvHaXHRtd1AOgAtHd/qz7BXvfuxxpNsLOpIp2s=;
 b=rwdBSkVDegrua58euozu7czNG7R1SIxLgkcC83WW1LLZTar3EhOAuT9LcOgdH0tiT3
 QVaA3YX0r3ulLQTujbCCrK/vuYIMGsv1nVK9F/HwNfytBSqbGfc6OC7Htyef8oOMIYDY
 NjUiegUTtkXIJEr2Y9eeyRmoaZIVs6upmFgXaTY7+DrSY5MSvXZ9zSyU3h53INxS0ux1
 lLoGkQz8yFsyfktHP0COcgLNETZ1uinyw6mRrec8d9/4V2nZuP/oXWxyxUW2awZv4i11
 fl4DghcILwcMpZRyx6GfzxhH4bJ8FE+4544OqwZyShl11bw4mw2Chol6vttrv7HH46+a
 g06A==
X-Gm-Message-State: AOAM531WZUq0x+H0/Aq15/IpWKwsTJz8yExVXmYPyDAFt7QipDIPvRXV
 09fB1GVdvrrlRGq/TLlnTGRnYxcNBug7NA==
X-Google-Smtp-Source: ABdhPJwQhi8EI5FPqBK2B7AiT8CiSJWxMLm3/rmQREdFrlSXmNhoe2b0vGWWzayxpySm7Zd4mLV27Q==
X-Received: by 2002:a1c:4b16:: with SMTP id y22mr1608064wma.99.1613855502218; 
 Sat, 20 Feb 2021 13:11:42 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 4sm19027356wma.0.2021.02.20.13.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Feb 2021 13:11:41 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 48A281FF7E;
 Sat, 20 Feb 2021 21:11:40 +0000 (GMT)
References: <20210219110950.2308025-1-thuth@redhat.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] gitlab-ci: Remove unused container images
Date: Sat, 20 Feb 2021 21:10:52 +0000
In-reply-to: <20210219110950.2308025-1-thuth@redhat.com>
Message-ID: <87wnv2jvg3.fsf@linaro.org>
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> We're building a lot of containers in the gitlab-CI that we never use.
> This takes away network bandwidth and CPU time from other jobs for no
> use, so let's remove them for now. The individual containers could be
> re-added later when we really need them.

They are used - when people run check-tcg their builds are cached via
gitlab.

>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.d/containers.yml | 92 -------------------------------------
>  1 file changed, 92 deletions(-)
>
> diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
> index 90fac85ce4..233d34c59b 100644
> --- a/.gitlab-ci.d/containers.yml
> +++ b/.gitlab-ci.d/containers.yml
> @@ -53,13 +53,6 @@ amd64-debian11-container:
>    variables:
>      NAME: debian11
>=20=20
> -alpha-debian-cross-container:
> -  <<: *container_job_definition
> -  stage: containers-layer2
> -  needs: ['amd64-debian10-container']
> -  variables:
> -    NAME: debian-alpha-cross
> -
>  amd64-debian-cross-container:
>    <<: *container_job_definition
>    stage: containers-layer2
> @@ -88,13 +81,6 @@ arm64-debian-cross-container:
>    variables:
>      NAME: debian-arm64-cross
>=20=20
> -arm64-test-debian-cross-container:
> -  <<: *container_job_definition
> -  stage: containers-layer2
> -  needs: ['amd64-debian11-container']
> -  variables:
> -    NAME: debian-arm64-test-cross
> -
>  armel-debian-cross-container:
>    <<: *container_job_definition
>    stage: containers-layer2
> @@ -109,27 +95,6 @@ armhf-debian-cross-container:
>    variables:
>      NAME: debian-armhf-cross
>=20=20
> -hppa-debian-cross-container:
> -  <<: *container_job_definition
> -  stage: containers-layer2
> -  needs: ['amd64-debian10-container']
> -  variables:
> -    NAME: debian-hppa-cross
> -
> -m68k-debian-cross-container:
> -  <<: *container_job_definition
> -  stage: containers-layer2
> -  needs: ['amd64-debian10-container']
> -  variables:
> -    NAME: debian-m68k-cross
> -
> -mips64-debian-cross-container:
> -  <<: *container_job_definition
> -  stage: containers-layer2
> -  needs: ['amd64-debian10-container']
> -  variables:
> -    NAME: debian-mips64-cross
> -
>  mips64el-debian-cross-container:
>    <<: *container_job_definition
>    stage: containers-layer2
> @@ -151,20 +116,6 @@ mipsel-debian-cross-container:
>    variables:
>      NAME: debian-mipsel-cross
>=20=20
> -powerpc-debian-cross-container:
> -  <<: *container_job_definition
> -  stage: containers-layer2
> -  needs: ['amd64-debian10-container']
> -  variables:
> -    NAME: debian-powerpc-cross
> -
> -ppc64-debian-cross-container:
> -  <<: *container_job_definition
> -  stage: containers-layer2
> -  needs: ['amd64-debian10-container']
> -  variables:
> -    NAME: debian-ppc64-cross
> -
>  ppc64el-debian-cross-container:
>    <<: *container_job_definition
>    stage: containers-layer2
> @@ -172,13 +123,6 @@ ppc64el-debian-cross-container:
>    variables:
>      NAME: debian-ppc64el-cross
>=20=20
> -riscv64-debian-cross-container:
> -  <<: *container_job_definition
> -  stage: containers-layer2
> -  needs: ['amd64-debian10-container']
> -  variables:
> -    NAME: debian-riscv64-cross
> -
>  s390x-debian-cross-container:
>    <<: *container_job_definition
>    stage: containers-layer2
> @@ -186,37 +130,6 @@ s390x-debian-cross-container:
>    variables:
>      NAME: debian-s390x-cross
>=20=20
> -sh4-debian-cross-container:
> -  <<: *container_job_definition
> -  stage: containers-layer2
> -  needs: ['amd64-debian10-container']
> -  variables:
> -    NAME: debian-sh4-cross
> -
> -sparc64-debian-cross-container:
> -  <<: *container_job_definition
> -  stage: containers-layer2
> -  needs: ['amd64-debian10-container']
> -  variables:
> -    NAME: debian-sparc64-cross
> -
> -tricore-debian-cross-container:
> -  <<: *container_job_definition
> -  stage: containers-layer2
> -  needs: ['amd64-debian10-container']
> -  variables:
> -    NAME: debian-tricore-cross
> -
> -xtensa-debian-cross-container:
> -  <<: *container_job_definition
> -  variables:
> -    NAME: debian-xtensa-cross
> -
> -cris-fedora-cross-container:
> -  <<: *container_job_definition
> -  variables:
> -    NAME: fedora-cris-cross
> -
>  amd64-fedora-container:
>    <<: *container_job_definition
>    variables:
> @@ -237,11 +150,6 @@ win64-fedora-cross-container:
>    variables:
>      NAME: fedora-win64-cross
>=20=20
> -amd64-ubuntu1804-container:
> -  <<: *container_job_definition
> -  variables:
> -    NAME: ubuntu1804
> -
>  amd64-ubuntu2004-container:
>    <<: *container_job_definition
>    variables:


--=20
Alex Benn=C3=A9e

