Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4616817E5
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 18:44:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMYCA-0000L5-Q0; Mon, 30 Jan 2023 12:43:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMYC5-0000Ho-TB
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 12:43:49 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMYC4-0002ea-7A
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 12:43:49 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso8762503wmq.5
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 09:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9UK/14jWg2UoueRtKcZ/az4ZivMTs+rfcV65Ptp6y98=;
 b=Hc3kNsW5VoqdPrvRmNqAiGjUW7Z4oJXjO7qDBNgrEOqncclDmGKvkkcyHj2ra3p+aH
 XD61jvPIrK/oJ/WSKChpZwzprjtFFOmPP9l+37b7VI+QHDdScGKXRvJi/q+ZO9BhDAqg
 bwW/dNV50Dw9H8GqqiPJ7w50ADEjwqvmHvE6nLQUjlgaQRifOEbwImlwsYgK37BJtRTV
 vMQov/2dGiB+y7t7y6bYkbPDBR104nirUibZ3d5EJ/foe/vw/VXZ2bTrMRe1qPp6wCRC
 0HKXgnM9xJ9B63ShQtU7ysi4tZBtcUwNKuXO8k714rs0oVXeo9Wu9um5lAFSOl88/VvQ
 WVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9UK/14jWg2UoueRtKcZ/az4ZivMTs+rfcV65Ptp6y98=;
 b=EtD2qux96wiY839iqaimeLDdWQaoHRqFWvR61AIIT6D6njQemnJyxYCnQlkXiM08TZ
 sPujCN9yix0x+hdHZgCrBNvpx3XakZq8kS/qCUjeGzlGXdethOLwunry2T+6pmv/lyd7
 aEw6/qLjzc8NXWQWiyyKpi0yRY3mpuq5f7uuDuFl9opneiBY8dbGro4io+RGMIShXVf1
 g8LaGA2klNKBR/fWBd9eDOBrUGdky4/bwexp86t5hgjIa7/2h42yfT0nQXgNJZkjL2Ql
 PpCSCQdKkGS6Sz1USLWW6/uDns5/WpNomuRneM9enC9OVj9gO82x2gyciO3GjGmV05HE
 4ylA==
X-Gm-Message-State: AFqh2kr9uiOAZC3eO6uVckmBqTbHygy8XINIC2QIB93lYMjYIZp4prrR
 FZ2GpkAvGr0WDSgWXF6mpOEmBA==
X-Google-Smtp-Source: AMrXdXue7RnQnyq7TP4Qo8BwZGdyo58q+bufP+OrXnYrOjh4hIoCUfgi6D4BSpdyLGEdd6mehBSTqA==
X-Received: by 2002:a05:600c:1c1f:b0:3db:2d7e:1204 with SMTP id
 j31-20020a05600c1c1f00b003db2d7e1204mr41113573wms.27.1675100626379; 
 Mon, 30 Jan 2023 09:43:46 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 az10-20020a05600c600a00b003a3442f1229sm515335wmb.29.2023.01.30.09.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 09:43:45 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4C2A71FFB7;
 Mon, 30 Jan 2023 17:43:45 +0000 (GMT)
References: <20230130104446.1286773-1-thuth@redhat.com>
 <20230130104446.1286773-6-thuth@redhat.com>
User-agent: mu4e 1.9.18; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Stefan
 Hajnoczi
 <stefanha@redhat.com>, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 5/6] gitlab-ci.d/buildtest: Merge the two gprof-gcov jobs
Date: Mon, 30 Jan 2023 17:42:32 +0000
In-reply-to: <20230130104446.1286773-6-thuth@redhat.com>
Message-ID: <87tu076hpq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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


Thomas Huth <thuth@redhat.com> writes:

> There is only one job depending on the build-gprof-gcov job, so
> there is no real need for keeping this separate. It likely only
> has been split since the complete runtime is more than 60 minutes,
> but that can be better handled with a proper timeout setting instead.
> By merging the two jobs, we safe some precious CI minutes for starting
> a new container for the second job each time.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.d/buildtest.yml | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
>
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 86f9c37a07..91c7467a66 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -468,26 +468,15 @@ tsan-build:
>      MAKE_CHECK_ARGS: bench V=3D1
>=20=20
>  # gprof/gcov are GCC features
> -build-gprof-gcov:
> +gprof-gcov:
>    extends: .native_build_job_template
>    needs:
>      job: amd64-ubuntu2004-container
> +  timeout: 80m
>    variables:
>      IMAGE: ubuntu2004
>      CONFIGURE_ARGS: --enable-gprof --enable-gcov
>      TARGETS: aarch64-softmmu ppc64-softmmu s390x-softmmu x86_64-softmmu
> -  artifacts:
> -    expire_in: 1 days
> -    paths:
> -      - build
> -
> -check-gprof-gcov:
> -  extends: .native_test_job_template
> -  needs:
> -    - job: build-gprof-gcov
> -      artifacts: true
> -  variables:
> -    IMAGE: ubuntu2004
>      MAKE_CHECK_ARGS: check
>    after_script:
>      - cd build

I'm tempted to deprecate gprof altogether as I find it hard to believe
anyone uses it when perf tools give you a much clearer indication of
where the bottlenecks are in "real world" environments.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

