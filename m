Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4A853634F
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 15:29:19 +0200 (CEST)
Received: from localhost ([::1]:59610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nua1l-00067v-NL
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 09:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nua0Z-00051n-Us
 for qemu-devel@nongnu.org; Fri, 27 May 2022 09:28:03 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:44755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nua0Y-0003c9-0n
 for qemu-devel@nongnu.org; Fri, 27 May 2022 09:28:03 -0400
Received: by mail-ed1-x531.google.com with SMTP id q15so5388496edb.11
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 06:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=9wFOW9j/CmnSQ389rxHLHADiq9J7i062yJuEPHm1Vvw=;
 b=kYNGgxkOP4x4xiA0WAJAzpen0rnRt5qae5ARjJt1SVcibUy2Q7uD03XALsu5AnJbhD
 RFLx5Srliu+mibcZrNOfCa/AYwaZB7fp7GNG2miUzrwUQTw+Ycv1R9AID3glT+C1fehF
 VLIpoq+KvFqobXkDHYlfGl0TsnHCoSPCdhy6iF8ZC5Dq3wCoqgMrZPKEM3gEyg1pqg02
 BUuPMMlGmGYyFOeAqMjEHnLhefm9VpV1wQTdgTLqWkHqdYv+kyYqSl9WDglDrXu8yIg7
 hMrpXMZq2v3bWXo4h5/mwvBOjFOTyRbf8HV2KOLDLU/CX9BtYFZUqwk6X/1jKcPD5VtM
 DbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=9wFOW9j/CmnSQ389rxHLHADiq9J7i062yJuEPHm1Vvw=;
 b=lGyL+uaUIHSB/33smo5vxGs+q4s+/EvmCaEs0TfZ55xWwDifotyMzURAm6XPsapGpQ
 CBORIdIYN7SuebAMrbXI5cVgGhOBdaa0VVFfBtxt81+/TS5CKEXxky+NR2cBtBiUZYFs
 wksOiy2obuDn1KBvvP5awLj2if5q5R+2TFKBg+VHUIheu/gxBlThCExJUCkPm6FcJcyl
 itZHtcm4IFq4/pq4cKa+TUqbmds0BvKJz/Ysgm/RRdpj9Cd2fyxGHxegPwU9Pll3D/kn
 GbZkZ9dmxndN+drGfzrGlPEz5ynqR4wAnFfi6QHiEMKudiHtai4c7Ih72YelgH2iHxqB
 47nw==
X-Gm-Message-State: AOAM531c1hCF7HnnZvK6gc5SzOevl30J+qtxU3BWGaZXbAOASoqPL1cp
 GyrRdf2gNWDAX5UGHBttOIU3XA==
X-Google-Smtp-Source: ABdhPJzl6uDJqMWz34ruSw4Dtzwn2QcePD8IaCLJQO9VHwMoqc1XdO3BH9y2NR+WXfJ5WZW3QOztZg==
X-Received: by 2002:a05:6402:5190:b0:42b:777:8e3 with SMTP id
 q16-20020a056402519000b0042b077708e3mr42018678edd.7.1653658080261; 
 Fri, 27 May 2022 06:28:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 s20-20020a508d14000000b0042aba7ed532sm2093431eds.41.2022.05.27.06.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 06:27:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9C1DA1FFB7;
 Fri, 27 May 2022 14:27:57 +0100 (BST)
References: <20220526110705.59952-1-berrange@redhat.com>
User-agent: mu4e 1.7.23; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH 0/5] gitlab: restrict running jobs in forks and upstream
 master
Date: Fri, 27 May 2022 14:27:36 +0100
In-reply-to: <20220526110705.59952-1-berrange@redhat.com>
Message-ID: <87ee0fyujm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x531.google.com
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

> Currently on upstream most jobs will run in both staging
> and master. This is quite wasteful of CI credits. The only
> need to run in master is for the jobs related to publishing
> the website
>
> In forks we run jobs on every push. With restricted CI
> allowance this is quickly going to cause  problems.
>
> With this series jobs will no longer run on forks at all,
> without an opt-in with QEMU_CI=3D1 (pipeline with manual
> jobs) or QEMU_CI=3D2 (pipeline with immediate jobs)
>
> This is a rewrite of a previous proposal:
>
> https://lists.nongnu.org/archive/html/qemu-devel/2021-08/msg02104.html
>
> where I've kept it simpler and also split up the patches
> into more understandable chunks

Queued to testing/next, thanks.

I'll fix up the comment and move some stuff into the rst.

>
> Daniel P. Berrang=C3=A9 (5):
>   gitlab: introduce a common base job template
>   gitlab: convert Cirrus jobs to .base_job_template
>   gitlab: convert static checks to .base_job_template
>   gitlab: convert build/container jobs to .base_job_template
>   gitlab: don't run CI jobs in forks by default
>
>  .gitlab-ci.d/base.yml                | 72 +++++++++++++++++++++++
>  .gitlab-ci.d/buildtest-template.yml  | 16 ++---
>  .gitlab-ci.d/buildtest.yml           | 28 ++++-----
>  .gitlab-ci.d/cirrus.yml              | 16 ++---
>  .gitlab-ci.d/container-cross.yml     |  6 +-
>  .gitlab-ci.d/container-template.yml  |  1 +
>  .gitlab-ci.d/crossbuild-template.yml |  3 +
>  .gitlab-ci.d/qemu-project.yml        |  1 +
>  .gitlab-ci.d/static_checks.yml       | 19 +++---
>  .gitlab-ci.d/windows.yml             |  1 +
>  docs/devel/ci-jobs.rst.inc           | 88 +++++++++++++++++++++++++++-
>  11 files changed, 199 insertions(+), 52 deletions(-)
>  create mode 100644 .gitlab-ci.d/base.yml



--=20
Alex Benn=C3=A9e

