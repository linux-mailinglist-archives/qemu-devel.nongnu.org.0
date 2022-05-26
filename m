Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E8D535271
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 19:12:04 +0200 (CEST)
Received: from localhost ([::1]:55842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuH1n-0004o2-4S
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 13:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuGz0-0003CA-To
 for qemu-devel@nongnu.org; Thu, 26 May 2022 13:09:10 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuGyy-0006KL-Uc
 for qemu-devel@nongnu.org; Thu, 26 May 2022 13:09:10 -0400
Received: by mail-wr1-x42e.google.com with SMTP id l30so2896366wrb.8
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 10:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Ew1zAs+qEF5JEtazwb6ZNdiFcUl1uviSPCEPrYA5YyM=;
 b=y5cKRinriwdrQCnTJ+g3CLaGLOJxFQDyIsePuZ85jx2U4arPNCRw5G6NE0BYI8rRhP
 G3kdx44sIrtfBAuAEcXpsKU5nhGKI9olr+hmtzr2rhT0XfL9YBVLhxxiJuEZamWDKLSk
 +i6lOyJmVcH44S4Y5/sKMg2SZYtOiJ3rULF6Hd+smxcdtdaKmEVrUmyYpga4ZEUJWYw+
 IQwHe6poNJjc0p5VdR4WLyjOFs6/Rh65p2+wMRVlzZ/IbMMXlKfEswHDI/VH8zqHvZSY
 chDSXkidf3MmjRqumgF5a7Y+SXSiec2xsrHgDARI5iHZg39qrRfCMoByA/adnI5cA3ZK
 Ct9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Ew1zAs+qEF5JEtazwb6ZNdiFcUl1uviSPCEPrYA5YyM=;
 b=P4hQR7DMukoyhcOgweAPR1DM14asfjYNc9TYZRWoFg6BArW8tK9OD9mqd1ds0WKvD7
 ajrRUMY2hRyyq8V+PsXc7g2ymgPNURgGtnafXEln4CJRiOI1rgee0aK3+ef/ZzNsN9gs
 IW3Ac8IzZkEKJJaO6z5Bz1mbzYSypaGRjYogHxOgkQ4uN6Gza3/NojoVNC/tPNCidpVQ
 v5E+wtTJlpV1Yj4Y19oWMpd+niqUZB4hFUJxESDxSMqJjICU3TgDRV8KEpQgmDi6rCLC
 Ftk9UeJsB6bZj1OV3/33pIMiiemK0TGFiFdxGfcEKdaec+jGWhij5cLwvEEpR0IJLBiH
 S/0Q==
X-Gm-Message-State: AOAM532d+Bbwcju7IQOtsalWEW38ksemImARRbInjghHeaS5Bw/0M8Ms
 SEnHeV/iZeWoaaQOSf40QQqH3w==
X-Google-Smtp-Source: ABdhPJwzdbIiNnPZZipehNDdMwxAiEkuqQ8KKUiAErJa2T05uKOHcwhjg8c6HjUtoWMs+Pw1COwZ9Q==
X-Received: by 2002:a05:6000:1f99:b0:20e:61f4:91e4 with SMTP id
 bw25-20020a0560001f9900b0020e61f491e4mr31942604wrb.425.1653584947106; 
 Thu, 26 May 2022 10:09:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 b1-20020adfd1c1000000b0020d0a57af5esm2500640wrd.79.2022.05.26.10.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 10:09:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 785331FFB7;
 Thu, 26 May 2022 18:09:05 +0100 (BST)
References: <20220526110705.59952-6-berrange@redhat.com>
User-agent: mu4e 1.7.23; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH 5/5] gitlab: don't run CI jobs in forks by default
Date: Thu, 26 May 2022 18:08:28 +0100
In-reply-to: <20220526110705.59952-6-berrange@redhat.com>
Message-ID: <87r14gz0em.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> To preserve CI shared runner credits we don't want to run
> pipelines on every push.
>
> This sets up the config to that pipelines are never created
> for contributors by default. To override this the QEMU_CI
> variable can be set to a non-zero value. If set to 1, the
> pipeline will be created but all jobs will remain manually
> started. The contributor can selectively run jobs that they
> care about. If set to 2, the pipeline will be created and
> all jobs will immediately start.
>
> This behavior can be controlled using push variables
>
>   git push -o ci.variable=3DQEMU_CI=3D1
>
> To make this more convenient define an alias
>
>    git config --local alias.push-ci "push -o ci.variable=3DQEMU_CI=3D1"
>    git config --local alias.push-ci-now "push -o ci.variable=3DQEMU_CI=3D=
2"
>
> Which lets you run
>
>   git push-ci
>
> to create the pipeline, or
>
>   git push-ci-now
>
> to create and run the pipeline

I think these useful tips on running the pipelines should go in the rst
so you don't have to grep the commit log to find them.

>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  .gitlab-ci.d/base.yml      |  9 +++++++++
>  docs/devel/ci-jobs.rst.inc | 12 ++++++++++++
>  2 files changed, 21 insertions(+)
>
> diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml
> index 6a918abbda..62f2a850c3 100644
> --- a/.gitlab-ci.d/base.yml
> +++ b/.gitlab-ci.d/base.yml
> @@ -28,6 +28,10 @@
>      - if: '$QEMU_JOB_ONLY_FORKS =3D=3D "1" && $CI_PROJECT_NAMESPACE =3D=
=3D "qemu-project"'
>        when: never
>=20=20
> +    # Forks don't get pipelines unless QEMU_CI=3D1 or QEMU_CI=3D2 is set
> +    - if: '$QEMU_CI !=3D "1" && $QEMU_CI !=3D "2" && $CI_PROJECT_NAMESPA=
CE !=3D "qemu-project"'
> +      when: never
> +
>      # Avocado jobs don't run in forks unless $QEMU_CI_AVOCADO_TESTING is=
 set
>      - if: '$QEMU_JOB_AVOCADO && $QEMU_CI_AVOCADO_TESTING !=3D "1" && $CI=
_PROJECT_NAMESPACE !=3D "qemu-project"'
>        when: never
> @@ -59,5 +63,10 @@
>      # an earlier criteria
>      #############################################################
>=20=20
> +    # Forks pipeline jobs don't start automatically unless
> +    # QEMU_CI=3D2 is set
> +    - if: '$QEMU_CI !=3D "2" && $CI_PROJECT_NAMESPACE !=3D "qemu-project=
"'
> +      when: manual
> +
>      # Jobs can run if any jobs they depend on were successfull
>      - when: on_success
> diff --git a/docs/devel/ci-jobs.rst.inc b/docs/devel/ci-jobs.rst.inc
> index 0b4926e537..e36c8cc68d 100644
> --- a/docs/devel/ci-jobs.rst.inc
> +++ b/docs/devel/ci-jobs.rst.inc
> @@ -98,6 +98,18 @@ Contributor controlled runtime variables
>  The following variables may be set by contributors to control
>  job execution
>=20=20
> +QEMU_CI
> +~~~~~~~
> +
> +By default, no pipelines will be created on contributor forks
> +in order to preserve CI credits
> +
> +Set this variable to 1 to create the pipelines, but leave all
> +the jobs to be manually started from the UI
> +
> +Set this variable to 2 to create the pipelines and run all
> +the jobs immediately, as was historicaly behaviour
> +
>  QEMU_CI_AVOCADO_TESTING
>  ~~~~~~~~~~~~~~~~~~~~~~~
>  By default, tests using the Avocado framework are not run automatically =
in


--=20
Alex Benn=C3=A9e

