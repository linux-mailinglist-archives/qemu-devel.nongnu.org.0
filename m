Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C252F2C80D7
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 10:22:27 +0100 (CET)
Received: from localhost ([::1]:53828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjfO6-0003W9-RQ
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 04:22:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kjfGn-0007Y0-Dr
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 04:14:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kjfGl-0004Vc-ED
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 04:14:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606727690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RnefxO4/NzY46xKo/+KpV6MPBcJ6b5Ny261B/vLXYLc=;
 b=CBqvHw6cuUOelaV6xYsNUME1OuEEltVmP1ULzskLlc9m/CE53idbUbTLwe+piTFN9aC3Hr
 dIzEBK0myI/ZQWO3Cy0ZpFuoH0K+E1OGer0R7+QmoZoje9/7AKRAVhtFwYZZ0fSu8swxDV
 aHjxJ5w/qYyou25xU85n/JYHR+X6D1A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-luUIs-TNOlOApPoj61i1TQ-1; Mon, 30 Nov 2020 04:14:46 -0500
X-MC-Unique: luUIs-TNOlOApPoj61i1TQ-1
Received: by mail-wm1-f70.google.com with SMTP id n18so779935wmk.0
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 01:14:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RnefxO4/NzY46xKo/+KpV6MPBcJ6b5Ny261B/vLXYLc=;
 b=XI+rRVE2r4Qah2ti/dMdEAv9rIVUvNMQMz8zq4fX1m4/YRKchdUyMQhc9wnR+B92EW
 3cs4Z0sd2owo2ItJNyN85OHoQcN+fvun8YpPxGvxmeraw3V33XIzPg8ioTdFRGkBlgVS
 7uxNX/01j38J0cykpiX4PZqaBjrfvEO7QLfJZaI3Aqpcp0LcEtoMIjdCVMuqCNlHBuGA
 rwBxd9LU2R4pgm3DT6jbuR7aYE78JI3dFbjXnLaZdlO+I00t/LJAeSdP8F5k+PSZDBNj
 JOUSA0qAvRWd3VXmtlDpIzwyZ8C6bOotCu1X4D2AGP9vaShO/QhGLomy8pF1zbjyH86W
 VQRQ==
X-Gm-Message-State: AOAM533UUqpOrBOQmJEwYXAmpc539oTI7LO/lH3DjJkcH+spCCM7wXG0
 M5SVOaklIajiBEyKYxnH2SFq/ZO5K/EHA01PH8UNmfGnYjCli/NJvF3xd5S2+DhmyEVO53tHSqL
 TYgcs+UTJCYEmqHI=
X-Received: by 2002:a1c:3cd5:: with SMTP id j204mr8379977wma.53.1606727685204; 
 Mon, 30 Nov 2020 01:14:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/tnBLeQH0ASyhnXjiiCPLIdyR4Qfux9k/NhU1lG2zfchWQftZplxRJ3/ri598AfYQpptZpw==
X-Received: by 2002:a1c:3cd5:: with SMTP id j204mr8379963wma.53.1606727685033; 
 Mon, 30 Nov 2020 01:14:45 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id h83sm24523256wmf.9.2020.11.30.01.14.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 01:14:44 -0800 (PST)
Subject: Re: [PATCH v2] gitlab-ci.yml: Add openSUSE Leap 15.2 for gitlab CI/CD
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org
References: <20201130042659.29333-1-acho@suse.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3a5f46b9-c83f-e85c-dfc4-7fcaa711356b@redhat.com>
Date: Mon, 30 Nov 2020 10:14:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201130042659.29333-1-acho@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, thuth@redhat.com, lyan@suse.co, wainersm@redhat.com,
 brogers@suse.com, cfontana@suse.de, Willian Rampazzo <wrampazz@redhat.com>,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/20 5:26 AM, Cho, Yu-Chen wrote:
> v2:
> Drop some package from dockerfile to make docker image more light.
> 
> v1:
> Add build-system-opensuse jobs and opensuse-leap.docker dockerfile.
> Use openSUSE Leap 15.2 container image in the gitlab-CI.
> 
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> ---
>  .gitlab-ci.d/containers.yml                   |  5 ++
>  .gitlab-ci.yml                                | 30 +++++++++++
>  tests/docker/dockerfiles/opensuse-leap.docker | 54 +++++++++++++++++++
>  3 files changed, 89 insertions(+)
>  create mode 100644 tests/docker/dockerfiles/opensuse-leap.docker
> 
> diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
> index 892ca8d838..910754a699 100644
> --- a/.gitlab-ci.d/containers.yml
> +++ b/.gitlab-ci.d/containers.yml
> @@ -246,3 +246,8 @@ amd64-ubuntu-container:
>    <<: *container_job_definition
>    variables:
>      NAME: ubuntu
> +
> +amd64-opensuse-leap-container:
> +  <<: *container_job_definition
> +  variables:
> +    NAME: opensuse-leap
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index d0173e82b1..6a256fe07b 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -195,6 +195,36 @@ acceptance-system-centos:
>      MAKE_CHECK_ARGS: check-acceptance
>    <<: *acceptance_definition
>  

What about adding in a comment who is the maintainer
of these jobs? Some sort of contact in case there is
a OpenSUSE specific issue for example.

See:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg758968.html

> +build-system-opensuse:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: opensuse-leap
> +    TARGETS: s390x-softmmu x86_64-softmmu aarch64-softmmu
> +    MAKE_CHECK_ARGS: check-build
> +  artifacts:
> +    expire_in: 2 days
> +    paths:
> +      - build
> +
> +check-system-opensuse:
> +  <<: *native_test_job_definition
> +  needs:
> +    - job: build-system-opensuse
> +      artifacts: true
> +  variables:
> +    IMAGE: opensuse-leap
> +    MAKE_CHECK_ARGS: check
> +
> +acceptance-system-opensuse:
> +  <<: *native_test_job_definition
> +  needs:
> +    - job: build-system-opensuse
> +      artifacts: true
> +  variables:
> +    IMAGE: opensuse-leap
> +    MAKE_CHECK_ARGS: check-acceptance
> +  <<: *acceptance_definition
> +
>  build-disabled:
>    <<: *native_build_job_definition
>    variables:


