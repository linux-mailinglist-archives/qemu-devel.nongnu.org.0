Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD220543725
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 17:20:42 +0200 (CEST)
Received: from localhost ([::1]:41820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyxU9-0002n5-BN
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 11:20:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nyxAK-0006DH-4R
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 11:00:13 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:36759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nyxAE-0007Ce-Or
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 11:00:11 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 h62-20020a1c2141000000b0039aa4d054e2so13533875wmh.1
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 08:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Iobf/xuIklDjBwSCoMpDZHzacKRiHtlXiMnfrshFh5c=;
 b=sjkVcS2EFmvDYcVbTb4asPsqVzIvq6QK9zkT1qhahrnsMOe/Bu5vhJgsjKOYkIcpOJ
 UFdXx6iirFeMj1/tURSGWC4hcMwRjJeXmXD/ICVIDuM3/c7PmnXa/F39o5aU0So87O7A
 Ar14NSraQFKtWGCwUgArG3XQZDW+agN8Xjck5UxjG2P64ZePd3XaHOEl6dVqGsMUKbI0
 CJtqctyA5MDfBqR7wXxFTSISsGV83M/PCC8zzz306c39yJ730K/L3zguqbou+B0f/KMI
 cflA+FFI4T5z3aD4QLBzCuwgtVs8jrBzD1G4CbRoFp2Vq+2DjXWbzoAucXbLzpqr78bs
 ckqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Iobf/xuIklDjBwSCoMpDZHzacKRiHtlXiMnfrshFh5c=;
 b=i8eOhcokiSzGLSs1ueoU9zz2wjbj3/M7ZDehjIR3FyW0PwQ5RYquPOFcYThL1jp07c
 XiIZuG6h7Bm5nF4FRRKHKy125cj0z4Y1NJ19BpKfZKEsapspGpU95YVKrSycSQw40l2Z
 it8pVuq+iIsil9PkDA5e0zaKpMPsuyAsRs2/NNQ+Vv1075lCOLFkzNWvVpeyFoVAxXz3
 vt/Nn2MDsZPeABpouVGjuygBCexNpkUiYKE11DuX+zY76wXdR/Cg8WZvNp6Qz7niTQg1
 rKi/gFZ/lA01bJbytpIsn1fjalZvGHVatAzI9o8RTPfGoROW5WNrWGyP9EuSoYwD6o3f
 K3Jw==
X-Gm-Message-State: AOAM531roXxtRFhv6g2HlaqUa/yDQtD3XsQ9vmyEvBVIYH2i5krfa3L7
 1XZjAGB3mh6TosQYClVymdP92Q==
X-Google-Smtp-Source: ABdhPJzg2orILEV+3qphrazBmNcxglTPxSs04eFJ7VDML+eMf4nrXvM8mrJU8gOIXbZgZkEoAlvTUQ==
X-Received: by 2002:a05:600c:1c10:b0:39c:4708:648d with SMTP id
 j16-20020a05600c1c1000b0039c4708648dmr24070172wms.85.1654700403987; 
 Wed, 08 Jun 2022 08:00:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a5d624b000000b0020ff3a2a925sm26808578wrv.63.2022.06.08.08.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 08:00:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 060711FFB7;
 Wed,  8 Jun 2022 16:00:02 +0100 (BST)
References: <20220603124809.70794-1-thuth@redhat.com>
User-agent: mu4e 1.7.26; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, "Daniel
 P . Berrange" <berrange@redhat.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH] gitlab-ci: Fix the build-cfi-aarch64 and
 build-cfi-ppc64-s390x jobs
Date: Wed, 08 Jun 2022 15:59:58 +0100
In-reply-to: <20220603124809.70794-1-thuth@redhat.com>
Message-ID: <87edzztd3i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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


Thomas Huth <thuth@redhat.com> writes:

> The job definitions recently got a second "variables:" section by
> accident and thus are failing now if one tries to run them. Merge
> the two sections into one again to fix the issue.
>
> And while we're at it, bump the timeout here (70 minutes are currently
> not enough for the aarch64 job). The jobs are marked as manual anyway,
> so if the user starts them, they want to see their result for sure and
> then it's annoying if the job timeouts too early.
>
> Fixes: e312d1fdbb ("gitlab: convert build/container jobs to .base_job_tem=
plate")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  I wonder whether we should remove the build-cfi-aarch64 job instead.
>  When I tried to run it during the past months, it was always failing
>  for me. This time, I tried to bump the timeout while I was at it,
>  and it takes longer than 80 minutes here to finish - so I asume
>  nobody ever ran this successfully in the last months... Is anybody
>  using this job at all? I think if we want to have CFI coverage here,
>  it should get replaced by a custom runner job that runs on a more
>  beefy machine... (the ppc64-s390x job is fine by the way, it often
>  only runs a little bit longer than 60 minutes - I still bumped the
>  timeout here, too, just to be on the safe side)
>
>  .gitlab-ci.d/buildtest.yml | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
>
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index ecac3ec50c..baaa0ebb87 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -355,16 +355,15 @@ build-cfi-aarch64:
>        --enable-safe-stack --enable-slirp=3Dgit
>      TARGETS: aarch64-softmmu
>      MAKE_CHECK_ARGS: check-build
> -  timeout: 70m
> -  artifacts:
> -    expire_in: 2 days
> -    paths:
> -      - build
> -  variables:
>      # FIXME: This job is often failing, likely due to out-of-memory prob=
lems in
>      # the constrained containers of the shared runners. Thus this is mar=
ked as
>      # skipped until the situation has been solved.
>      QEMU_JOB_SKIPPED: 1
> +  timeout: 90m
> +  artifacts:
> +    expire_in: 2 days
> +    paths:
> +      - build
>=20=20
>  check-cfi-aarch64:
>    extends: .native_test_job_template
> @@ -396,16 +395,15 @@ build-cfi-ppc64-s390x:
>        --enable-safe-stack --enable-slirp=3Dgit
>      TARGETS: ppc64-softmmu s390x-softmmu
>      MAKE_CHECK_ARGS: check-build
> -  timeout: 70m
> -  artifacts:
> -    expire_in: 2 days
> -    paths:
> -      - build
> -  variables:
>      # FIXME: This job is often failing, likely due to out-of-memory prob=
lems in
>      # the constrained containers of the shared runners. Thus this is mar=
ked as
>      # skipped until the situation has been solved.
>      QEMU_JOB_SKIPPED: 1
> +  timeout: 80m
> +  artifacts:
> +    expire_in: 2 days
> +    paths:
> +      - build
>=20=20
>  check-cfi-ppc64-s390x:
>    extends: .native_test_job_template

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

