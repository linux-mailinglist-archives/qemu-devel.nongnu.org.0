Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 937365A305A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 22:12:59 +0200 (CEST)
Received: from localhost ([::1]:39884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRfhK-0002xS-Cv
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 16:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRffM-0000ja-E5
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:10:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRffK-0004ti-2S
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:10:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661544653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p0eZ0aCvybjQ3UFTC6wlzW5OH/zqD+362HdHfb/A6CY=;
 b=OPDqkA1qnvHJifuEUtesVrtq2kv3ChDUq9r3XuB5lhSBNoh8GqERZz/30NH6D+5+6FWwcM
 J00kjq0AynE6KUxdvhjngUorRZMYA+uw3UCSvTKZ7PsfU7Njl2Juq+5TSLnznLG2+4n1lF
 pImMNC3N+bfCptMI8K/FmxsFS5uTH9E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-425-8cGESoRuNcKAo1RMUxaGzA-1; Fri, 26 Aug 2022 16:10:52 -0400
X-MC-Unique: 8cGESoRuNcKAo1RMUxaGzA-1
Received: by mail-wr1-f72.google.com with SMTP id
 v17-20020adfa1d1000000b0022574d4574aso329524wrv.22
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 13:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=p0eZ0aCvybjQ3UFTC6wlzW5OH/zqD+362HdHfb/A6CY=;
 b=JObE2QufbG7A8A1TBUooVPgo12Oeq9WuPism+5VUAyumeqs83cf6bplibCVMQol22j
 8q7i5u7O5BDZVfcAl1FHymbj0u++IiqSLsB6nOI2Ltke/GYMn4Rfxdo7TK1rN8PUdI0t
 P9JKRd3LXAIOT9jtIz8LPvpIdFApKiS76EroPoRAHdk2oEsjgru8+lNd3k2cNj/j9EMc
 1FicY1W5AsLHXZMbcGcipiK9dae9WVK/wKo6bAEze9SlMA1h14hA07Iu+65dRL4C1e7X
 LNZHDVzfO0H1u1EI0vIBjU7TYWt1GCFTpZcobKDkegHSouk4BIiI32NyH2yn+mzWRpQK
 64gQ==
X-Gm-Message-State: ACgBeo3nhikR6DBTzdL+D/XTGqPjjEjT46oZPJeQb6t0YxN/gMsXdTJq
 hstCTFyGOfV/NS79kd4v99KR2uV1oxfDh75/tu1r7eE+F0tmkFC/+DQ9URmfeltlSNnHcw0tnE+
 vhWQzJI0+cH1LKMs=
X-Received: by 2002:a5d:4649:0:b0:225:309d:1d51 with SMTP id
 j9-20020a5d4649000000b00225309d1d51mr705031wrs.450.1661544651294; 
 Fri, 26 Aug 2022 13:10:51 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5IwW9huEnhWS0BoGPB4WJKsmAyvmQIyb5s54tajHuRRedAri/D5240r7zrVcSj+mGdXDvioQ==
X-Received: by 2002:a5d:4649:0:b0:225:309d:1d51 with SMTP id
 j9-20020a5d4649000000b00225309d1d51mr705014wrs.450.1661544651044; 
 Fri, 26 Aug 2022 13:10:51 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-60.customers.d1-online.com.
 [80.187.98.60]) by smtp.gmail.com with ESMTPSA id
 a11-20020adfed0b000000b002206236ab3dsm638223wro.3.2022.08.26.13.10.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 13:10:50 -0700 (PDT)
Message-ID: <c6bb6c7d-dd69-0b6d-12ef-d458cbe85a4e@redhat.com>
Date: Fri, 26 Aug 2022 22:10:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 08/25] tests/docker: update and flatten
 debian-sparc64-cross
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
 <20220826172128.353798-9-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220826172128.353798-9-alex.bennee@linaro.org>
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
>   .gitlab-ci.d/container-cross.yml                     |  1 -
>   tests/docker/Makefile.include                        |  1 -
>   tests/docker/dockerfiles/debian-sparc64-cross.docker | 12 +++++++-----
>   3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
> index 8a611fc824..db0ea15d0d 100644
> --- a/.gitlab-ci.d/container-cross.yml
> +++ b/.gitlab-ci.d/container-cross.yml
> @@ -143,7 +143,6 @@ sh4-debian-cross-container:
>   sparc64-debian-cross-container:
>     extends: .container_job_template
>     stage: containers
> -  needs: ['amd64-debian10-container']
>     variables:
>       NAME: debian-sparc64-cross
>   
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index 37c4ea913f..8828b6b8fa 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -89,7 +89,6 @@ DOCKER_PARTIAL_IMAGES += fedora
>   endif
>   
>   docker-image-debian-mips-cross: docker-image-debian10
> -docker-image-debian-sparc64-cross: docker-image-debian10
>   
>   # The native build should never use the registry
>   docker-image-debian-native: DOCKER_REGISTRY=
> diff --git a/tests/docker/dockerfiles/debian-sparc64-cross.docker b/tests/docker/dockerfiles/debian-sparc64-cross.docker
> index f4bb9b561c..8d3d306bc1 100644
> --- a/tests/docker/dockerfiles/debian-sparc64-cross.docker
> +++ b/tests/docker/dockerfiles/debian-sparc64-cross.docker
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
>           gcc-sparc64-linux-gnu \
>           libc6-dev-sparc64-cross

Reviewed-by: Thomas Huth <thuth@redhat.com>


