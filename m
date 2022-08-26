Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3555A3056
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 22:10:53 +0200 (CEST)
Received: from localhost ([::1]:35732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRffH-0000QV-8i
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 16:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRfbT-0002aS-UW
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:06:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRfbS-000443-2r
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:06:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661544413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FaTohC9wnLHGh287YQADyB2346Ij7HmdH8EFjzotVSA=;
 b=eRlOvhGgrsA3aNCn25RTdc27OUtrNwms5GvNzdxjv+RSt2uScCUR9ii/6260hZRFQPnfn4
 8WWNmx9KUlM8YVET62diPKeiInkqldzsSCCrxnz4HEkualusXStmJPkqIB0JYulIMWNczc
 x7BHc2auAStBZ1k34JP2M9gfa3u42X4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-cT7lDkPoONO2Nvv-VWSpow-1; Fri, 26 Aug 2022 16:06:52 -0400
X-MC-Unique: cT7lDkPoONO2Nvv-VWSpow-1
Received: by mail-wr1-f69.google.com with SMTP id
 e13-20020adfa44d000000b002260797ca0cso307112wra.20
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 13:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=FaTohC9wnLHGh287YQADyB2346Ij7HmdH8EFjzotVSA=;
 b=2pAyZvRCmUuv+6ncRyhcru6qDEwjWsjJ6lgNMft7XQhjgW4A/AkCDhGW4oUD/QGlFR
 97PUJB6FtKs7ZQnOFbpC4aHiH6MNx1zuodXdjtjlZHYizskIMOlxGW9pHLsX5mLY6Tid
 19qBgqCG2hlytJJo+m66o9AeBSwqmGUEurxxLIp5AES1qkQfdlw+83ffKa40h0JkgS8S
 B4fq6n/kGqfhKYzv75tmZ/vFwPZ85HmnQpYixK8J+cADTjD524LpAUk0OSRiJctXKVeh
 ika2dZm+ZkgTfk4d80m9uE1uyxcT/370u/1+fB1axUPSARJXl8qrEb/XRfQmRuvYBz8H
 NM3A==
X-Gm-Message-State: ACgBeo3KKnlb9iaq2Cz2W+yohhtUBEVrEC4imPXt8eEXvQaNOvaRDIFT
 uKcyWsxcsWeQrGAIl1A1GHHaBWUgyBrYpuFwFg27yXpT8YuIaLcicj/wfXZk0dfan4bHf37ZhDU
 pHjDU9r6yQQkrIPU=
X-Received: by 2002:a05:6000:1f94:b0:225:3afc:936f with SMTP id
 bw20-20020a0560001f9400b002253afc936fmr618847wrb.109.1661544410962; 
 Fri, 26 Aug 2022 13:06:50 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6PSLwcYg0e6mlLFjhp2u/LSSQ/9hOZyNbN45LvZWpO5nKjDgyW4QmtWxdx7O8NP6R7UdmDzQ==
X-Received: by 2002:a05:6000:1f94:b0:225:3afc:936f with SMTP id
 bw20-20020a0560001f9400b002253afc936fmr618833wrb.109.1661544410796; 
 Fri, 26 Aug 2022 13:06:50 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-60.customers.d1-online.com.
 [80.187.98.60]) by smtp.gmail.com with ESMTPSA id
 j18-20020adfea52000000b002206203ed3dsm550082wrn.29.2022.08.26.13.06.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 13:06:50 -0700 (PDT)
Message-ID: <d4d16e2b-0325-8a88-7717-ddcaddfebb27@redhat.com>
Date: Fri, 26 Aug 2022 22:06:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 07/25] tests/docker: update and flatten debian-sh4-cross
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
 <20220826172128.353798-8-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220826172128.353798-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 26/08/2022 19.21, Alex Bennée wrote:
> Update to the latest stable Debian. While we are at it flatten into a
> single dockerfile. We really don't need the rest of the stuff from
> the QEMU base image just to compile test images.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/container-cross.yml                 |  1 -
>   tests/docker/Makefile.include                    |  1 -
>   tests/docker/dockerfiles/debian-sh4-cross.docker | 12 +++++++-----
>   3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
> index a3bfa483bf..8a611fc824 100644
> --- a/.gitlab-ci.d/container-cross.yml
> +++ b/.gitlab-ci.d/container-cross.yml
> @@ -137,7 +137,6 @@ s390x-debian-cross-container:
>   sh4-debian-cross-container:
>     extends: .container_job_template
>     stage: containers
> -  needs: ['amd64-debian10-container']
>     variables:
>       NAME: debian-sh4-cross
>   
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index 6c2ee3b175..37c4ea913f 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -89,7 +89,6 @@ DOCKER_PARTIAL_IMAGES += fedora
>   endif
>   
>   docker-image-debian-mips-cross: docker-image-debian10
> -docker-image-debian-sh4-cross: docker-image-debian10
>   docker-image-debian-sparc64-cross: docker-image-debian10
>   
>   # The native build should never use the registry
> diff --git a/tests/docker/dockerfiles/debian-sh4-cross.docker b/tests/docker/dockerfiles/debian-sh4-cross.docker
> index fd3af89575..d48ed9065f 100644
> --- a/tests/docker/dockerfiles/debian-sh4-cross.docker
> +++ b/tests/docker/dockerfiles/debian-sh4-cross.docker
> @@ -1,12 +1,14 @@
>   #
>   # Docker cross-compiler target
>   #
> -# This docker target builds on the debian Buster base image.
> +# This docker target builds on the Debian Bullseye base image.
>   #
> -FROM qemu/debian10
> +FROM docker.io/library/debian:11-slim
>   
> -RUN apt update && \
> -    DEBIAN_FRONTEND=noninteractive eatmydata \
> -    apt install -y --no-install-recommends \
> +RUN export DEBIAN_FRONTEND=noninteractive && \
> +    apt-get update && \
> +    apt-get install -y eatmydata && \
> +    eatmydata apt-get dist-upgrade -y && \
> +    eatmydata apt-get install --no-install-recommends -y \
>           gcc-sh4-linux-gnu \
>           libc6-dev-sh4-cross

Reviewed-by: Thomas Huth <thuth@redhat.com>


