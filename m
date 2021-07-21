Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2F83D095F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 09:07:26 +0200 (CEST)
Received: from localhost ([::1]:48500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m66KD-0004Kq-6C
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 03:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m66IA-0002gl-B3
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 03:05:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m66I4-0007Bf-To
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 03:05:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626851109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LBa2iwN1dBxUFnG/nZWj/tQ9fQvavQBlcGQPGits2GU=;
 b=Mco9pB0Ld+AAPeW1ro6NFjOaHZ6vlf5S7UbvHdEBlHmNplOmtPy0iDb8AlwpS5C/janV+T
 6hkT5pPRJDb+c9ZqcG25nIr2t7YyX6pZwaUEQB6RyfPopYrZPnYWvfDY9zJ2mmv4YKg4Gk
 sv6IGWEvrtVyf2YJHjo8limg8apkw/c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-O8W0LNodMf2KNDfD4p7sRw-1; Wed, 21 Jul 2021 03:05:06 -0400
X-MC-Unique: O8W0LNodMf2KNDfD4p7sRw-1
Received: by mail-wr1-f72.google.com with SMTP id
 g9-20020adff3c90000b0290140a25efc6dso561702wrp.5
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 00:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LBa2iwN1dBxUFnG/nZWj/tQ9fQvavQBlcGQPGits2GU=;
 b=CREKMy2t8WH4mQZQ7JQJqjAE5iJadi6A31OlxYGdmuV8but8bnn8OcHHkpuSx25m4x
 ezg3ZK0/N1DKmt1PRYuymAC34OS2H+27WwQX32xwxu37VHrMuYVL/a/YbtZiqFFXsbAr
 7wxAPraCDFrpXMpFYQ0NnUP2YkMypYHIknKI/0d7O6ybrDs6J8D00RhNYGWu12xDPDEL
 7enjcamVsthvl0vLNtk2dCOcBZFWgWHtWcm7T8FxFWKfgD4N8r0yHHAL3i8XFwjMSuIF
 kYUmCWrc/g5zf1z2jYX9JfUIcYqcWCtQvboaq7cEuEFTNkFGlZjJWamvwx+QBeXg74dq
 nVHA==
X-Gm-Message-State: AOAM532BdfVVdjxzOaRXU4isF7yCzhAVQw0ojkKAP8jL+Fc2GutYB0Ki
 6z+TkV7wDFv36T3Lfu2sfwUSZptV9Rz366qK0G0kk23jMRWtEFERm2VAcKnlzBm3vSn+oG+oDWm
 7B+9fNdobKJAx+HM=
X-Received: by 2002:a5d:6b06:: with SMTP id v6mr41966988wrw.146.1626851105737; 
 Wed, 21 Jul 2021 00:05:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeuDyuKHRWmB2ikr7TMhi8NxXNcKxZZdaa8fm9mbhnF8tOyXEWAV3cOTJAmSGyMPGr50ISyA==
X-Received: by 2002:a5d:6b06:: with SMTP id v6mr41966942wrw.146.1626851105460; 
 Wed, 21 Jul 2021 00:05:05 -0700 (PDT)
Received: from thuth.remote.csb (p5791d597.dip0.t-ipconnect.de.
 [87.145.213.151])
 by smtp.gmail.com with ESMTPSA id p8sm4398733wmc.24.2021.07.21.00.05.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 00:05:04 -0700 (PDT)
Subject: Re: [PATCH v1 27/29] gitlab: enable a very minimal build with the
 tricore container
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210720232703.10650-1-alex.bennee@linaro.org>
 <20210720232703.10650-28-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b186bd5b-8214-9074-ce03-bbe7b471c592@redhat.com>
Date: Wed, 21 Jul 2021 09:05:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210720232703.10650-28-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, berrange@redhat.com,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/07/2021 01.27, Alex Bennée wrote:
> Rather than base of the shared Debian 10 container which would require
> us to bring in even more dependencies just bring in what is needed for
> building tricore-softmmu in GitLab. We don't even remove the container
> from the DOCKER_PARTIAL_IMAGES lest we cause more confusion.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210720114057.32053-4-alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/buildtest.yml                    | 11 ++++++
>   .../dockerfiles/debian-tricore-cross.docker   | 34 ++++++++++++++++---
>   2 files changed, 40 insertions(+), 5 deletions(-)
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 89df51517c..48cb45a783 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -354,6 +354,17 @@ build-some-softmmu:
>       TARGETS: xtensa-softmmu arm-softmmu aarch64-softmmu alpha-softmmu
>       MAKE_CHECK_ARGS: check-tcg
>   
> +# We build tricore in a very minimal tricore only container
> +build-tricore-softmmu:
> +  extends: .native_build_job_template
> +  needs:
> +    job: tricore-debian-cross-container
> +  variables:
> +    IMAGE: debian-tricore-cross
> +    CONFIGURE_ARGS: --disable-tools --disable-fdt --enable-debug
> +    TARGETS: tricore-softmmu
> +    MAKE_CHECK_ARGS: check-tcg
> +
>   clang-system:
>     extends: .native_build_job_template
>     needs:
> diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/tests/docker/dockerfiles/debian-tricore-cross.docker
> index 985925134c..d8df2c6117 100644
> --- a/tests/docker/dockerfiles/debian-tricore-cross.docker
> +++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
> @@ -1,23 +1,47 @@
>   #
>   # Docker TriCore cross-compiler target
>   #
> -# This docker target builds on the debian Stretch base image.
> +# This docker target builds on the Debian Buster base image but
> +# doesn't inherit from the common one to avoid bringing in unneeded
> +# dependencies.
>   #
>   # Copyright (c) 2018 Philippe Mathieu-Daudé
>   #
>   # SPDX-License-Identifier: GPL-2.0-or-later
>   #
> -FROM qemu/debian10
> +FROM docker.io/library/debian:buster-slim
>   
>   MAINTAINER Philippe Mathieu-Daudé <f4bug@amsat.org>
>   
> +RUN apt update && \
> +    DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
> +    DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy \
> +       bzip2 \
> +       ca-certificates \
> +       ccache \
> +       g++ \
> +       gcc \
> +       git \
> +       libglib2.0-dev \
> +       libpixman-1-dev \
> +       libtest-harness-perl \
> +       locales \
> +       make \
> +       ninja-build \
> +       perl-base \
> +       pkgconf \
> +       python3-pip \
> +       python3-setuptools \
> +       python3-wheel
> +
>   RUN git clone --single-branch \
>           https://github.com/bkoppelmann/tricore-binutils.git \
>           /usr/src/binutils && \
>       cd /usr/src/binutils && chmod +x missing && \
> -    CFLAGS=-w ./configure --prefix=/usr --disable-nls --target=tricore && \
> +    CFLAGS=-w ./configure --prefix=/usr/local --disable-nls --target=tricore && \
>       make && make install && \
>       rm -rf /usr/src/binutils
>   
> -# This image isn't designed for building QEMU but building tests
> -ENV QEMU_CONFIGURE_OPTS --disable-system --disable-user
> +# This image can only build a very minimal QEMU as well as the tests
> +ENV DEF_TARGET_LIST tricore-softmmu
> +ENV QEMU_CONFIGURE_OPTS --disable-user --disable-tools --disable-fdt
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


