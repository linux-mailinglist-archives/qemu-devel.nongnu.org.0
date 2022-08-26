Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B02575A2E9D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 20:36:44 +0200 (CEST)
Received: from localhost ([::1]:60340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oReCB-00073V-Ap
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 14:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oReAV-0005ZA-5R
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 14:34:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oReAQ-0005gm-Dh
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 14:34:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661538893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6uaJ/cHzQrPE+Ku9wwj61ijWXbGgCnrVmT+NioplW1g=;
 b=RrNbiANzHrQOLwUODVaaN6oAudA6/96yRWvN7aB1Bs0A4ignVWz75q9EBSKpp8zLd0d6Ux
 O1Sy6n9aLToOXGjCTDi2IsScVrmZOrZyqOHE1HCXJm53mDmKeokyAyLqFYqHr9QGPKJ1OA
 5EdFLORvaO1ctXYb7DMwbs4VWUunH4Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-369-XwOuR_EgOrOsHYISqlDb5Q-1; Fri, 26 Aug 2022 14:34:52 -0400
X-MC-Unique: XwOuR_EgOrOsHYISqlDb5Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 f7-20020a1c6a07000000b003a60ede816cso739186wmc.0
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 11:34:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=6uaJ/cHzQrPE+Ku9wwj61ijWXbGgCnrVmT+NioplW1g=;
 b=DTPxI+hC0IFpPdWYOntu53d8XhEi9jqxpZYa6wao9KWZh9a5YiPlp0k7opqoWsBFk/
 C+JRdlVrOgzWiTnfffwxRz3cHO6i/lsarUHh1etrd2MLgmd62HalTnI19AD82sBh6dQJ
 Ee4P5HQIcXBilHWlGZbaXtUMEZRlLsuZAccGZjONoy6oR+ceWA8xLz2ximj+jQ4TD+yZ
 HoljLbpgcrW9numgVhntGcTaqytYmJpJ9g5NWsW7r9Ear5OBEX8vz+mZk1xYTV3aLFHB
 Nk5rR0apJscOD9hom3B931kR9rJji63WAlZldv4vxwEhvYAEddCtI7AIG/RXW4GIZvsc
 bF9w==
X-Gm-Message-State: ACgBeo2wVdMWVyIubW7akiXq5OZA67IAgfiI+oTLVFYfFBiPj8FNkENJ
 swJg9B5mRji1KWtYVIzYMJGE/TEt366RNH2KAPcVH7R1POtg3YPwuKFwUgzl2a70FcOGQzsg72O
 FtdjUVoMA6l7u+hE=
X-Received: by 2002:a05:600c:5114:b0:3a6:1ab9:5b3d with SMTP id
 o20-20020a05600c511400b003a61ab95b3dmr456964wms.93.1661538890910; 
 Fri, 26 Aug 2022 11:34:50 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6kPqgWs88OkYN0xF1GC9nECHCqrHa+mEixNinRkf/jmEzS2kyppIxcCHLXxSB+ZemYgk7ppQ==
X-Received: by 2002:a05:600c:5114:b0:3a6:1ab9:5b3d with SMTP id
 o20-20020a05600c511400b003a61ab95b3dmr456941wms.93.1661538890700; 
 Fri, 26 Aug 2022 11:34:50 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-60.customers.d1-online.com.
 [80.187.98.60]) by smtp.gmail.com with ESMTPSA id
 z18-20020adff752000000b0021e5adb92desm385755wrp.60.2022.08.26.11.34.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 11:34:50 -0700 (PDT)
Message-ID: <3ce44b08-4030-5174-0670-7bc893da70b2@redhat.com>
Date: Fri, 26 Aug 2022 20:34:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 17/25] tests/docker: update and flatten
 debian-all-test-cross
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
 <20220826172128.353798-18-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220826172128.353798-18-alex.bennee@linaro.org>
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
> single dockerfile. We also need to ensure we install clang as it is
> used for those builds as well.
> 
> It would be nice to port this to lcitool but for now this will do.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/container-cross.yml               |  1 -
>   tests/docker/Makefile.include                  |  1 -
>   .../dockerfiles/debian-all-test-cross.docker   | 18 ++++++++++++++----
>   3 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
> index 3a8bd75473..091c0d8fcb 100644
> --- a/.gitlab-ci.d/container-cross.yml
> +++ b/.gitlab-ci.d/container-cross.yml
> @@ -14,7 +14,6 @@ amd64-debian-cross-container:
>   amd64-debian-user-cross-container:
>     extends: .container_job_template
>     stage: containers
> -  needs: ['amd64-debian10-container']
>     variables:
>       NAME: debian-all-test-cross
>   
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index 24cd44e667..ddcc502049 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -129,7 +129,6 @@ docker-image-debian-nios2-cross: $(DOCKER_FILES_DIR)/debian-toolchain.docker \
>   	$(call debian-toolchain, $@)
>   
>   # Specialist build images, sometimes very limited tools
> -docker-image-debian-all-test-cross: docker-image-debian10
>   docker-image-debian-loongarch-cross: docker-image-debian11
>   docker-image-debian-microblaze-cross: docker-image-debian10
>   docker-image-debian-nios2-cross: docker-image-debian10
> diff --git a/tests/docker/dockerfiles/debian-all-test-cross.docker b/tests/docker/dockerfiles/debian-all-test-cross.docker
> index dedcea58b4..508a914c22 100644
> --- a/tests/docker/dockerfiles/debian-all-test-cross.docker
> +++ b/tests/docker/dockerfiles/debian-all-test-cross.docker
> @@ -6,11 +6,21 @@
>   # basic compilers for as many targets as possible. We shall use this
>   # to build and run linux-user tests on GitLab
>   #
> -FROM qemu/debian10
> +FROM docker.io/library/debian:11-slim
>   
> -# What we need to build QEMU itself
> -RUN apt update && \
> -    DEBIAN_FRONTEND=noninteractive eatmydata \
> +# Duplicate deb line as deb-src
> +RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
> +
> +RUN export DEBIAN_FRONTEND=noninteractive && \
> +    apt-get update && \
> +    apt-get install -y eatmydata && \
> +    eatmydata apt-get dist-upgrade -y && \
> +    apt install -y --no-install-recommends \
> +      ccache \
> +      clang  \
> +      git \
> +      ninja-build \

Would it make sense to add the above four lines to the "apt install" later 
in this file instead, to speed things up a little bit? (I did it in 
https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg03651.html at least 
and it worked fine there)

Apart from that:

Reviewed-by: Thomas Huth <thuth@redhat.com>


> +    && \
>       apt build-dep -yy qemu
>   
>   # Add the foreign architecture we want and install dependencies


