Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6076D04E4
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 14:37:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phrVU-0002ce-CY; Thu, 30 Mar 2023 08:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phrVR-0002bz-Tx
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 08:35:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phrVP-0002XG-VY
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 08:35:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680179750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nzCiX6zNV/6cfBXnFNuKGK2g2DQJ8ZC4pBmmBhWi928=;
 b=IK/AnEXgzme14WtkeKVaIGveT9ZvN1b2nhcUyHdQdEQUJ88FuyRVwPzU5o+6BtYboBFaxk
 75OeLoQaLWWDIGfDSkYnPTJJgEV6e8DxxYR3M0oH4T66q8RDZWpxVA63lRKbktTk91gk5q
 j2hmmHvbOup6LB6Hs9vmPZfOkP2bfy4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-tSAE20rdPRGyxI1hV1D3dg-1; Thu, 30 Mar 2023 08:35:49 -0400
X-MC-Unique: tSAE20rdPRGyxI1hV1D3dg-1
Received: by mail-qt1-f200.google.com with SMTP id
 x5-20020a05622a000500b003e259c363f9so12306423qtw.22
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 05:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680179749;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nzCiX6zNV/6cfBXnFNuKGK2g2DQJ8ZC4pBmmBhWi928=;
 b=0PlpE5+TiQxebQdXzyBRsKT4pHC0JSVw2Df+lhZtl1w7sTBU3+r7zSasVahDIEPG4N
 GRJjV1TFgSUsSOYrL0TUgCKikRu7VNgKBEl95M373oTUMFCAve0Ol4bgnU4ySCTVsfef
 1Q+FHndMf1Vg7X1D5esvcYCEAY++QrhUnU4v7R0gLhKhCLHIurqOMQYlsfJOQULGXore
 zvy+wi8TyW+TGUkPI3pw6rmlRjTf8ypOSzVpxmggY2L+WzhZ9n/UYfGs0vE85nTljUR2
 5cKJ5kSwkEW5bHR8lvLRDR6hTo2+sanwIa20FwJK7hvPFe61AqRAl0c3kJBWtToeAThr
 O53w==
X-Gm-Message-State: AAQBX9cpx6cQr5m9Oe6w9PV3Boy62u9HWjF4ZV+aRqTIMOs6JL/scBSp
 A2NKlBB7pKGn08gv1ROokteyjEjW+TXuxd4P/gDUm625+WH4/+9R7rpvGSoK4spOvEFjNi/IrQq
 wYtuS1GodHt2iRlI=
X-Received: by 2002:a05:6214:21aa:b0:5c0:81f8:239b with SMTP id
 t10-20020a05621421aa00b005c081f8239bmr36720915qvc.1.1680179749144; 
 Thu, 30 Mar 2023 05:35:49 -0700 (PDT)
X-Google-Smtp-Source: AKy350bf7J6Jxt6IgervZWiab8lAK9/sMH6Owf7AMrvCEqOm4LFuV7YMvEuyJXyzSKuhKovnvahg6Q==
X-Received: by 2002:a05:6214:21aa:b0:5c0:81f8:239b with SMTP id
 t10-20020a05621421aa00b005c081f8239bmr36720890qvc.1.1680179748865; 
 Thu, 30 Mar 2023 05:35:48 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 d17-20020a0cc691000000b005dd8b9345absm2166763qvj.67.2023.03.30.05.35.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 05:35:48 -0700 (PDT)
Message-ID: <6dc0a351-6d11-92f9-79c7-640435539aca@redhat.com>
Date: Thu, 30 Mar 2023 14:35:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 11/11] tests/gitlab: use kaniko to build images
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Reinoud Zandijk <reinoud@netbsd.org>
References: <20230330101141.30199-1-alex.bennee@linaro.org>
 <20230330101141.30199-12-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230330101141.30199-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 30/03/2023 12.11, Alex Bennée wrote:
> Apparently the docker-in-docker approach has some flaws including
> needing privileged mode to run and being quite slow. An alternative
> approach is to use Google's kaniko tool. It also works across
> different gitlab executors.
> 
> Following the gitlab example code we drop all the direct docker calls
> and usage of the script and make a direct call to kaniko and hope the
> images are cacheable by others.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20230224180857.1050220-8-alex.bennee@linaro.org>
> 
> ---
> v2
>    - add danpb's --cache suggestions
> ---
>   .gitlab-ci.d/container-template.yml | 22 ++++++++++------------
>   1 file changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/.gitlab-ci.d/container-template.yml b/.gitlab-ci.d/container-template.yml
> index 519b8a9482..cd8e0a1ff6 100644
> --- a/.gitlab-ci.d/container-template.yml
> +++ b/.gitlab-ci.d/container-template.yml
> @@ -1,21 +1,19 @@
>   .container_job_template:
>     extends: .base_job_template
> -  image: docker:stable
> +  image:
> +    name: gcr.io/kaniko-project/executor:v1.9.0-debug
> +    entrypoint: [""]
>     stage: containers
> -  services:
> -    - docker:dind
>     before_script:
>       - export TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
>       - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/qemu/$NAME:latest"
> -    - apk add python3
> -    - docker info
> -    - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
>     script:
>       - echo "TAG:$TAG"
>       - echo "COMMON_TAG:$COMMON_TAG"
> -    - docker build --tag "$TAG" --cache-from "$TAG" --cache-from "$COMMON_TAG"
> -      --build-arg BUILDKIT_INLINE_CACHE=1
> -      -f "tests/docker/dockerfiles/$NAME.docker" "."
> -    - docker push "$TAG"
> -  after_script:
> -    - docker logout
> +    - /kaniko/executor
> +          --reproducible
> +          --context "${CI_PROJECT_DIR}"
> +          --cache=true
> +          --cache-repo "${COMMON_TAG}"
> +          --dockerfile "${CI_PROJECT_DIR}/tests/docker/dockerfiles/$NAME.docker"
> +          --destination "${TAG}"

Acked-by: Thomas Huth <thuth@redhat.com>


