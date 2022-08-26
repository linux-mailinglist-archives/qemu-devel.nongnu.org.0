Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1745A3048
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 22:03:20 +0200 (CEST)
Received: from localhost ([::1]:46160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRfXz-0008KC-Hi
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 16:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRfWm-0006HE-28
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:02:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRfWi-0002bG-Ry
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:02:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661544120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SKZ2lNwF9n02yKHr1oM50Zhw98kt2KW1oPuesuVz4is=;
 b=aQHUHi33KS6uhXahCV1jFaQu7TM0Kuk7PEHmO++TtUGtISvhRhGriEuPnlxdu/E1Llk4BG
 p6a9o98/K11INo7zceW+KAwjpkJ7xfHL10uDAaeQvkBEZcvGIq+Bb1gKuPwTsf5TqRF2I6
 4776CYg/4LwAIhZphtFI44jEyLWN0HM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615-vINb6lBONJ2hJYGMGqdZuw-1; Fri, 26 Aug 2022 16:01:58 -0400
X-MC-Unique: vINb6lBONJ2hJYGMGqdZuw-1
Received: by mail-wm1-f70.google.com with SMTP id
 a17-20020a05600c349100b003a545125f6eso4519835wmq.4
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 13:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=SKZ2lNwF9n02yKHr1oM50Zhw98kt2KW1oPuesuVz4is=;
 b=1n+3Rws0+4WeNg/if+VuaCititr/dvoBA3hDxGKGP3ii944bNW17mPhxOnyJO3P+x5
 Kev/Pv3W8p2y2tvFJxyD+8NqlujY4bqTtS/BBtrt6fkW8YGl9/qFU83DpTA0zTnmyp/v
 0paJxtM/PpO9CRKBn8qHIUje8h1WLc2XBL6YUbZ0OUi722F8pPZwqvxinZOhvtheN+ts
 tqR1/gZcBnf+fjYDKKNQVFtAvW1vFvbfnjFENqpsfvUwYz+vLxqym9xj73GH/y8EgDLV
 aJ8fTzmeycl65YrpKgN2zHk8Mj4uuvsEsZuidyC9KDwHDQWT5I5CxPOhluiVbILjHfja
 e2hA==
X-Gm-Message-State: ACgBeo3tEH0E0w2Hve+/xJWSnOSQNcDFF8RFbuATO9tuVW3uoPbG+XLP
 Poz7rMudDq9HZHMqaAsBAWWCeSIHG3nYRihAntBU57iZXCgsm+DzSNMs0OgbtWB+a7+NIrE4uwE
 U/AI9QlNPfEwMLFo=
X-Received: by 2002:a1c:3842:0:b0:3a6:8c16:e239 with SMTP id
 f63-20020a1c3842000000b003a68c16e239mr644980wma.80.1661544117672; 
 Fri, 26 Aug 2022 13:01:57 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7AE2a0rR20t0qdNKsJpKuwjITCdOaE9AcfjalA+qLsnVLXIu1L9o3zXLlEWw/9Ml3XrmqoSQ==
X-Received: by 2002:a1c:3842:0:b0:3a6:8c16:e239 with SMTP id
 f63-20020a1c3842000000b003a68c16e239mr644963wma.80.1661544117467; 
 Fri, 26 Aug 2022 13:01:57 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-60.customers.d1-online.com.
 [80.187.98.60]) by smtp.gmail.com with ESMTPSA id
 q3-20020adff943000000b0021efc75914esm534518wrr.79.2022.08.26.13.01.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 13:01:57 -0700 (PDT)
Message-ID: <79e4ca12-27db-bc44-4836-a956212f9f07@redhat.com>
Date: Fri, 26 Aug 2022 22:01:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 04/25] tests/docker: update and flatten
 debian-hppa-cross
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
 <20220826172128.353798-5-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220826172128.353798-5-alex.bennee@linaro.org>
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
>   .gitlab-ci.d/container-cross.yml                  |  1 -
>   tests/docker/Makefile.include                     |  1 -
>   tests/docker/dockerfiles/debian-hppa-cross.docker | 12 +++++++-----
>   3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
> index 802e332205..6c1d765463 100644
> --- a/.gitlab-ci.d/container-cross.yml
> +++ b/.gitlab-ci.d/container-cross.yml
> @@ -65,7 +65,6 @@ hexagon-cross-container:
>   hppa-debian-cross-container:
>     extends: .container_job_template
>     stage: containers
> -  needs: ['amd64-debian10-container']
>     variables:
>       NAME: debian-hppa-cross
>   
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index c565aa5e7b..e39597d35c 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -88,7 +88,6 @@ DOCKER_PARTIAL_IMAGES += debian-s390x-cross
>   DOCKER_PARTIAL_IMAGES += fedora
>   endif
>   
> -docker-image-debian-hppa-cross: docker-image-debian10
>   docker-image-debian-m68k-cross: docker-image-debian10
>   docker-image-debian-mips-cross: docker-image-debian10
>   docker-image-debian-mips64-cross: docker-image-debian10
> diff --git a/tests/docker/dockerfiles/debian-hppa-cross.docker b/tests/docker/dockerfiles/debian-hppa-cross.docker
> index 3d6c65a3ef..af1c8403d8 100644
> --- a/tests/docker/dockerfiles/debian-hppa-cross.docker
> +++ b/tests/docker/dockerfiles/debian-hppa-cross.docker
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
>           gcc-hppa-linux-gnu \
>           libc6-dev-hppa-cross

Reviewed-by: Thomas Huth <thuth@redhat.com>


