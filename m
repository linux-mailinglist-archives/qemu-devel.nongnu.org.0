Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B604C3BBDCB
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 15:49:55 +0200 (CEST)
Received: from localhost ([::1]:56840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Oyw-0006HT-PS
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 09:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0Oxq-0005VP-7s
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:48:46 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:33507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0Oxl-0006Zc-RF
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:48:44 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 g8-20020a1c9d080000b02901f13dd1672aso9113916wme.0
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 06:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=9/R9tp72ivBiQ7p6dfMBWpRuVv5IPuBBRdqIMwHldJY=;
 b=jof+g1drhnogwxzA7LCPFsCWVcUY90+PKYO0ldkWLeKzUlBVc+iqDRwCLLxCgU4ol4
 IJFzyoaPx0NF2l0isrnFIsgoxi3yHHi/dvTSLWqFEsEp8cTH9A7X4PnY+atNPF3RXDlZ
 VNrqbn/cxufhqifrtiC8rBIHa26cbw7gOx3epalZTYZV5NZG5W7JwujgpV70mK3/suKR
 pLYwvBDi3hQ2xOezLjudtGEAX6g0aMQrmhydA/gYpwSYvuQxlK0OwSRv1Du8UZGIx2Qg
 XjZHQXzaodqSo7v6bz8TuLx4C4pXy6HXyfBDI3A4W8tJOoGDbPVJ/fVyI2auikr27M+V
 Ry6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=9/R9tp72ivBiQ7p6dfMBWpRuVv5IPuBBRdqIMwHldJY=;
 b=VKt97UG/jc0EiTNSUDZd/hgs1oBDnSg2Y3mJFIxhwNzDhovZe7GopKEcSOLah0I2EO
 +7Je3mVC3rB49tXPU2/vIpiDP8ClBjZr1tRZDCvJm8Kb6o4xPbaq/ByfIz159glUBN12
 UfeVPNcKl0YliFwtrXL/to5tDEXYAyZ7FqIYe0JHRr7N1nezVMkqIlkVDXn+fDG/35N8
 w5qYt1gAA+7CJ+jM7ztcmqR2k13JsKrb4HXqGE0GskqeYtQkOsmJQaQmr8xMswC7lGyo
 N+USZrhISeBT5IRNYAr0SxiKGyht3Vdh8kzaQacEsnOHh/a6d5RE5E+TCkaFvEbspyKn
 ZwVw==
X-Gm-Message-State: AOAM530RXMdQGZBJ72jOTkSHtOduYZh8xWx6l1ekwnktbsdMDgVqCY4m
 IkzPanKAfsaOFPsvPyhvDwCyAg==
X-Google-Smtp-Source: ABdhPJxhzIO4joCVJ68qryZWcvQKNWRnqrrSOV+lJJzQH1a2hUklEfYL4eFUIBT4KJgsl86NhKvpEA==
X-Received: by 2002:a1c:3505:: with SMTP id c5mr15031747wma.53.1625492919661; 
 Mon, 05 Jul 2021 06:48:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 12sm23793254wme.28.2021.07.05.06.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 06:48:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 54F991FF7E;
 Mon,  5 Jul 2021 14:48:38 +0100 (BST)
References: <20210623142245.307776-1-berrange@redhat.com>
 <20210623142245.307776-17-berrange@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v4 16/22] tests/docker: add script for automating
 container refresh
Date: Mon, 05 Jul 2021 14:44:34 +0100
In-reply-to: <20210623142245.307776-17-berrange@redhat.com>
Message-ID: <87wnq43m89.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> This introduces
>
>   https://gitlab.com/libvirt/libvirt-ci
>
> as a git submodule at tests/docker/libvirt-ci
>
> This submodule only needs to be checked out when needing to re-generate
> the files in tests/docker/dockerfiles.
>
> When a new build pre-requisite is needed for QEMU, it should be added to
> the libvirt-ci project 'qemu.yml' file, and the submodule updated to the
> new commit.

It seems a bit weird to have the canonical description of QEMU
dependencies live in another project does it not?

> The 'make docker-refresh' target will then re-create all the
> dockerfiles with updated package lists. This ensures that all the
> containers get exactly the same build pre-requisite packages installed.
>
> It also facilitates the addition of containers targetting new distros
> or updating existing containers to new versions of the same distro,
> where packages might have been renamed.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  docs/devel/testing.rst              | 34 ++++++++++++++++--
>  tests/docker/Makefile.include       | 12 +++++++
>  tests/docker/dockerfiles-refresh.py | 56 +++++++++++++++++++++++++++++
>  3 files changed, 100 insertions(+), 2 deletions(-)
>  create mode 100755 tests/docker/dockerfiles-refresh.py
>
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index 4e42392810..7882db85d4 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -372,8 +372,38 @@ Along with many other images, the ``centos8`` image =
is defined in a Dockerfile
>  in ``tests/docker/dockerfiles/``, called ``centos8.docker``. ``make dock=
er-help``
>  command will list all the available images.
>=20=20
> -To add a new image, simply create a new ``.docker`` file under the
> -``tests/docker/dockerfiles/`` directory.
> +Most of the existing Dockerfiles were written by hand, simply by creatin=
g a
> +a new ``.docker`` file under the ``tests/docker/dockerfiles/`` directory.
> +This has led to an inconsistent set of packages being present across the
> +different containers.
> +
> +Thus going forward, QEMU is aiming to automatically generate the Dockerf=
iles
> +using the ``lcitool`` program provided by the ``libvirt-ci`` project:
> +
> +  https://gitlab.com/libvirt/libvirt-ci
> +
> +In that project, there is a ``qemu.yml`` file defining the list of build
> +pre-requisites needed by QEMU. This is processed together with the
> +``mappings.yml`` file to compute the distro specific list of package nam=
es.
> +The package names are then fed into a generator which emits a well struc=
tured
> +dockerfile. The set of dockerfiles which are auto-generated is defined in
> +the ``tests/docker/dockerfiles-refresh.py`` script.
> +
> +When preparing a patch series that changes dockerfiles managed by ``libv=
irt-ci``
> +tools, the following steps should be takenL
> +
> + * Fork the ``libvirt-ci`` project on gitlab
> +
> + * Prepare changes to its ``qemu.yml`` file and optionally ``mappings.ym=
l``
> +   to define the packages to be added to QEMU's dockerfiles.
> +
> + * In QEMU run ``make docker-refresh LCITOOL=3D/path/to/libvirt-ci/lcito=
ol``
> +   to re-create the dockerfiles in ``tests/docker/dockerfiles``

If lcitool could be a pre-requisite (even as a developer only one)
should we consider having a submodule and QEMU mirror of it?

> +
> + * Submit your changes to QEMU in the normal manner
> +
> + * Submit ``libvirt-ci`` changes as a merge request, linking to the
> +   QEMU patch series that uses them.

This just seems clunky and likely to therefor not get used. I would
prefer keeping the meta-data within the project, maybe with a check that
ensures the dockerfiles have not gone out of sync with their "idealised"
form.

>=20=20
>  A ``.pre`` script can be added beside the ``.docker`` file, which will be
>  executed before building the image under the build context directory. Th=
is is
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index ff5d732889..e8e5f497cc 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -27,6 +27,9 @@ DOCKER_TESTS :=3D $(notdir $(shell \
>  ENGINE :=3D auto
>=20=20
>  DOCKER_SCRIPT=3D$(SRC_PATH)/tests/docker/docker.py --engine $(ENGINE)
> +REFRESH_SCRIPT=3D$(SRC_PATH)/tests/docker/dockerfiles-refresh.py
> +# To be set to /path/to/checkout/of/libvirt-ci.git/lcitool
> +LCITOOL=3D

Another argument for a sub-module?

--=20
Alex Benn=C3=A9e

