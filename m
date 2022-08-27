Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E58135A34EA
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 07:52:25 +0200 (CEST)
Received: from localhost ([::1]:35378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRok4-0005KK-Mj
	for lists+qemu-devel@lfdr.de; Sat, 27 Aug 2022 01:52:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRodp-0002lP-2W
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 01:45:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRodl-0004QI-LC
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 01:45:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661579152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WSwhyQ0NmaQr/LAyc3xOKdtz4PRcdxCY8ugQdzAoOJ8=;
 b=H9c3/WsYDAbQmW0NdYzYNZpvCwTgnLlV1wz9bfLGMPe6wC4/HvqkHEGtkI+GbZ069w5iKr
 QpYCoO3CFBUTynNtc3voZ6TaRAVM9eAa31cteECOalv6ODn5dHpCSwp8l8L56jdzQErMnG
 TDg8OwvNNvN14WtjUKHWj4QdCJkjqds=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-532-J20viIQBNTCkh9d1iy9RMg-1; Sat, 27 Aug 2022 01:45:51 -0400
X-MC-Unique: J20viIQBNTCkh9d1iy9RMg-1
Received: by mail-wm1-f69.google.com with SMTP id
 203-20020a1c02d4000000b003a5f5bce876so5079113wmc.2
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 22:45:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=WSwhyQ0NmaQr/LAyc3xOKdtz4PRcdxCY8ugQdzAoOJ8=;
 b=WctfhFv/DrdHm/vxJRDDZoqyao21uO3C69QwM3hiLiMFqVKfOxEuHu58cBR7uqv6NO
 XxoUlXtaCzVnd0wJUK8BLpEkYsOH2qQ6VXf4jLoSlKLzHhNlzPA/TUILDpHXFj0Yl9GI
 JNHLBsZvYt3vAbspd4a6KZS5Uet8+EC1LePFIol8fUeASDmaRVq/mDORrzFzsgrP0faM
 SjfXBVUzGajWdlNwatoVBMGDxQwYsipPRNHctK87u+0GpycY7IDZeepz70jdmAAzYWYn
 Os7lSWA27fZnM3CruNCH4mVJoWx6C9RAwZVT0OUD3abM/p/2JMDFGz4Tm75KKI89dCUV
 CQOQ==
X-Gm-Message-State: ACgBeo0oGsVXFAzahKsobzD15+iFElU5YSPVL4IgvyvmGPX5jiJRvxhf
 jVvWv0z85t+HhyfvPrNP0Ll71vTCAqi37CH3dooMpDD0StWxve8VVUmUiC2oL32FzI09Xm20DxV
 3q1DqU+CmI3t33xk=
X-Received: by 2002:a05:600c:4889:b0:3a8:3e1f:52a1 with SMTP id
 j9-20020a05600c488900b003a83e1f52a1mr176166wmp.95.1661579149934; 
 Fri, 26 Aug 2022 22:45:49 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5ZaLOzjbDadvdwNvU/QbVqGG0VfphFXZI4sTvSN7RXqqsw2v5ujUCOubvAO9jdHThADhDYow==
X-Received: by 2002:a05:600c:4889:b0:3a8:3e1f:52a1 with SMTP id
 j9-20020a05600c488900b003a83e1f52a1mr176155wmp.95.1661579149767; 
 Fri, 26 Aug 2022 22:45:49 -0700 (PDT)
Received: from [192.168.8.101] (tmo-097-69.customers.d1-online.com.
 [80.187.97.69]) by smtp.gmail.com with ESMTPSA id
 b17-20020adff251000000b0022571d43d32sm1446509wrp.21.2022.08.26.22.45.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 22:45:49 -0700 (PDT)
Message-ID: <ee29375a-39eb-173c-77ae-b798c06e6920@redhat.com>
Date: Sat, 27 Aug 2022 07:45:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 21/25] tests/docker: update and flatten
 debian-hexagon-cross
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
 <20220826172128.353798-22-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220826172128.353798-22-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
> single dockerfile as we do not need anything from the base image to
> build the toolchain.

You apparently need some stuff from the base image since you're adding gcc, 
make and some other stuff here?

> diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.docker b/tests/docker/dockerfiles/debian-hexagon-cross.docker
> index d5dc299dc1..822c108953 100644
> --- a/tests/docker/dockerfiles/debian-hexagon-cross.docker
> +++ b/tests/docker/dockerfiles/debian-hexagon-cross.docker
> @@ -7,7 +7,7 @@
>   # triggered by re-builds on other base images given it takes a long
>   # time to build.
>   #
> -FROM qemu/debian10
> +FROM docker.io/library/debian:bullseye-slim

debian:11-slim ?

...
> @@ -32,7 +39,7 @@ ADD build-toolchain.sh /root/hexagon-toolchain/build-toolchain.sh
>   
>   RUN cd /root/hexagon-toolchain && ./build-toolchain.sh
>   
> -FROM debian:buster-slim
> +FROM docker.io/library/debian:bullseye-slim

dito

>   # Duplicate deb line as deb-src
>   RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
>   # Install QEMU build deps for use in CI
> diff --git a/tests/docker/dockerfiles/debian-loongarch-cross.docker b/tests/docker/dockerfiles/debian-loongarch-cross.docker
> index 48fe64c51b..ff6a5505be 100644
> --- a/tests/docker/dockerfiles/debian-loongarch-cross.docker
> +++ b/tests/docker/dockerfiles/debian-loongarch-cross.docker
> @@ -1,8 +1,7 @@
>   #
>   # Docker cross-compiler target
>   #
> -# This docker target builds on the debian11 base image,
> -# using a prebuilt toolchains for LoongArch64 from:
> +# This docker target uses prebuilt toolchains for LoongArch64 from:
>   # https://github.com/loongson/build-tools/releases
>   #
>   FROM docker.io/library/debian:bullseye-slim

The update to the comment looks unnecessary?

  Thomas


