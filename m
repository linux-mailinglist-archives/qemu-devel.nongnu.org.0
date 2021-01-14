Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CEC2F69DA
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 19:49:32 +0100 (CET)
Received: from localhost ([::1]:42710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l07gZ-0003Ki-7l
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 13:49:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l06sc-0001xV-OO
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:57:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l06sa-0001ka-IQ
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:57:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610647071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r6WAe3K+pBQUE5tsO5pZYPjluNyb2B8xmhj5pNgdhdk=;
 b=O/r2/3BSrzp5fROrDNCXQHwybFHsLzcjMJ6dxtWWrj2gizgEq0IOi9Dle13EW3hvtTEPW8
 /GTJ08pb3+JwJ4Q3Fh8XMm6oRwePequZ20ayXk8rkd0m0YgMZ24UrMd4gs1+ULVDJJhG4f
 14fC3Dqb88mfKYsx8pfMxb/f2aMQXZ0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-JbluTevuMK6UWJAXdMNW_Q-1; Thu, 14 Jan 2021 12:57:50 -0500
X-MC-Unique: JbluTevuMK6UWJAXdMNW_Q-1
Received: by mail-wm1-f71.google.com with SMTP id z12so2162152wmf.9
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 09:57:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r6WAe3K+pBQUE5tsO5pZYPjluNyb2B8xmhj5pNgdhdk=;
 b=ExWiYmVtPb5D7Vc0EOgxsvmRxnZBfQ0bPMS3Icay5HjzDG/U2PTc369UokaNs//ejW
 cRi+8aUQDb+MCB8FJBhtH6laIIbabtH0TqAb3tQe5S2m/fxcy3pDIAQFv3X7s/hCdt0t
 JdYoyl/J/LUyWRD1gpwl0rQfE0Lso/2L59dmsLJThVjG6dgcLJmOhYCyf8ufrAGcl4Fg
 eRRuUd6dSCN6XXPdF4U4cYcEkghFMVdPM2tAIcrPMLkPJcbTQAVYDeHgD9ZRVNg+xZJB
 UcwsqeKMoolBIR8msL07CDmHg0Wz5fnUniib31aS2W24Xc9czSMs+sr1GYgnYkytJv7U
 y2LA==
X-Gm-Message-State: AOAM530nSQUQyp8pErUaEYbSLFiAuD3ZKF3KGv62f/RZOLg+akejE1We
 AANpOllLUiccbqmhOf6yJ8CdaR7SGRT+27sPJiDkXFS1t9IZRFUv5mkqNZD9JfS2UX4KBaiZ0lN
 iFRAcE/nyS3jftvs=
X-Received: by 2002:a7b:cb09:: with SMTP id u9mr5084180wmj.61.1610647069183;
 Thu, 14 Jan 2021 09:57:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYKQKUEJZHc1ophHzBntcwNT41a17hOo/kLqxM9F7rc76vGFVx1531YHFPdlwuqrj4tuc4Ag==
X-Received: by 2002:a7b:cb09:: with SMTP id u9mr5084165wmj.61.1610647069017;
 Thu, 14 Jan 2021 09:57:49 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id q6sm9607505wmj.32.2021.01.14.09.57.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 09:57:48 -0800 (PST)
Subject: Re: [PATCH v2 11/12] gitlab: migrate the minimal tools and unit tests
 from Travis
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210114165730.31607-1-alex.bennee@linaro.org>
 <20210114165730.31607-12-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a7b5cd2d-392d-4b83-f68a-4af60b694a0f@redhat.com>
Date: Thu, 14 Jan 2021 18:57:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114165730.31607-12-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/21 5:57 PM, Alex Bennée wrote:
> These tests are good at shaking out missing stubs which otherwise work
> if we have built targets. Rather than create a new job just add the
> checks to the existing tools-and-docs build.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.yml | 4 +++-
>  .travis.yml    | 9 ---------
>  2 files changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index bd60f3e741..a686bc40cf 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -124,11 +124,13 @@ check-system-debian:
>      IMAGE: debian-amd64
>      MAKE_CHECK_ARGS: check
>  
> +# No targets are built here, just tools and docs. This also feeds into
> +# the eventual documentation deployment steps later

Correcting with "just tools, docs [and softfloat checks]":
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>  build-tools-and-docs-debian:
>    <<: *native_build_job_definition
>    variables:
>      IMAGE: debian-amd64
> -    MAKE_CHECK_ARGS: ctags TAGS cscope
> +    MAKE_CHECK_ARGS: check-unit check-softfloat ctags TAGS cscope
>      CONFIGURE_ARGS: --disable-system --disable-user --enable-docs --enable-tools
>    artifacts:
>      expire_in: 2 days
> diff --git a/.travis.yml b/.travis.yml
> index 3b574a5968..5f1dea873e 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -119,15 +119,6 @@ after_script:
>  
>  jobs:
>    include:
> -    # Just build tools and run minimal unit and softfloat checks
> -    - name: "GCC check-unit and check-softfloat"
> -      env:
> -        - BASE_CONFIG="--enable-tools"
> -        - CONFIG="--disable-user --disable-system"
> -        - TEST_CMD="make check-unit check-softfloat -j${JOBS}"
> -        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
> -
> -
>      # --enable-debug implies --enable-debug-tcg, also runs quite a bit slower
>      - name: "GCC debug (main-softmmu)"
>        env:
> 


