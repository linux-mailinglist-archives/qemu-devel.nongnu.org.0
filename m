Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B21795A3052
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 22:09:27 +0200 (CEST)
Received: from localhost ([::1]:39912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRfdu-0007CJ-Ia
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 16:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRfao-0001fF-Lc
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:06:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRfaj-0003sd-Ha
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:06:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661544367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2aKZqQi11cXkmBkmp/xMCO2SrUzHWEHC+UjHIjBzyKc=;
 b=QHtNKkffTDeoTUobb9+J/8menOOZr+GVjTzgvziP++i2Ucdh4TBjQXPZ7gbF5IKMG4mUy7
 N+MGxDIQ3iAj6Ah5vNpGSaqUWGg0izziTxBUEAAx3gI2sTg7v29SxfWmDJydpNCTh+SMLB
 fN7zgEeoHQHqECg8o6gorjsOOEnfK2w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-503-4y8OICuKNAasmi_zXKt2mA-1; Fri, 26 Aug 2022 16:06:06 -0400
X-MC-Unique: 4y8OICuKNAasmi_zXKt2mA-1
Received: by mail-wr1-f72.google.com with SMTP id
 j22-20020adfb316000000b00226cf7eddeeso200548wrd.23
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 13:06:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=2aKZqQi11cXkmBkmp/xMCO2SrUzHWEHC+UjHIjBzyKc=;
 b=6fDQjTGAMVbYigQUQX3SQ8JTt+R2I56pcm7KqKHaqBC+D9KaAXe57KtsTOv0MDLPzB
 cPvqbxFf6KHsIoJ+bFL8e1yHRKXs1HSYfcwHkfaIonYug6as1L5Rd/bFd6QNRD/TkPy1
 t1hZuS5iz2xKPBtWTDUmEpQzecM/cusICPIurLgv1AJQwqZD1ixJNbpOuDBV8qYtxQR2
 Xw0MljiELInwUQV94bzDyDXoDQCqtSw5nM+muhlxTOSXQX/YtyBfvhOlh1QUVg5n1KhP
 T2FsJO6A1Oik0Q8RB2KBgzWtCiioUiXwUe/PW8tqs0wqf1ek4ypxdAVF88c3t3HCYCjL
 oRvg==
X-Gm-Message-State: ACgBeo3FQniAMIkJEq2U8LQ8pqpgxo1iYUOMd68Q8Sg86145qoT8Blh4
 in018ECog3PDdGncEVJshS3n9Ddc7Qx8ttSnepPRRcPdkjInijiEbFa49U1AitPOpt83ib3pqI7
 9oEimdxfgFHx4qfc=
X-Received: by 2002:a5d:6483:0:b0:225:7fb7:f163 with SMTP id
 o3-20020a5d6483000000b002257fb7f163mr650706wri.391.1661544365322; 
 Fri, 26 Aug 2022 13:06:05 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5VrMknW/lk79SmrybCaWLgLMTy0uAO57rmLkcVi/h1QR18qTVitT+HgMdSikjOYO+2nVGkDw==
X-Received: by 2002:a5d:6483:0:b0:225:7fb7:f163 with SMTP id
 o3-20020a5d6483000000b002257fb7f163mr650693wri.391.1661544365146; 
 Fri, 26 Aug 2022 13:06:05 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-60.customers.d1-online.com.
 [80.187.98.60]) by smtp.gmail.com with ESMTPSA id
 j15-20020a5d464f000000b0022526db2363sm564481wrs.30.2022.08.26.13.06.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 13:06:04 -0700 (PDT)
Message-ID: <88e43d1f-800d-63ea-de7a-ae8fee929f1f@redhat.com>
Date: Fri, 26 Aug 2022 22:06:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 06/25] tests/docker: update and flatten
 debian-mips64-cross
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
 <20220826172128.353798-7-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220826172128.353798-7-alex.bennee@linaro.org>
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
>   .gitlab-ci.d/container-cross.yml                    |  1 -
>   tests/docker/Makefile.include                       |  1 -
>   tests/docker/dockerfiles/debian-mips64-cross.docker | 12 +++++++-----
>   3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
> index 15a5270f6d..a3bfa483bf 100644
> --- a/.gitlab-ci.d/container-cross.yml
> +++ b/.gitlab-ci.d/container-cross.yml
> @@ -77,7 +77,6 @@ m68k-debian-cross-container:
>   mips64-debian-cross-container:
>     extends: .container_job_template
>     stage: containers
> -  needs: ['amd64-debian10-container']
>     variables:
>       NAME: debian-mips64-cross
>   
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index 95790e974e..6c2ee3b175 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -89,7 +89,6 @@ DOCKER_PARTIAL_IMAGES += fedora
>   endif
>   
>   docker-image-debian-mips-cross: docker-image-debian10
> -docker-image-debian-mips64-cross: docker-image-debian10
>   docker-image-debian-sh4-cross: docker-image-debian10
>   docker-image-debian-sparc64-cross: docker-image-debian10
>   
> diff --git a/tests/docker/dockerfiles/debian-mips64-cross.docker b/tests/docker/dockerfiles/debian-mips64-cross.docker
> index 09c2ba584e..afcff9726f 100644
> --- a/tests/docker/dockerfiles/debian-mips64-cross.docker
> +++ b/tests/docker/dockerfiles/debian-mips64-cross.docker
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
>           gcc-mips64-linux-gnuabi64 \
>           libc6-dev-mips64-cross

Reviewed-by: Thomas Huth <thuth@redhat.com>


