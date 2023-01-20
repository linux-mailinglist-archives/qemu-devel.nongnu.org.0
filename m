Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7220A674F6D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 09:26:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pImjG-0005TV-Fe; Fri, 20 Jan 2023 03:26:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pImjC-0005Gs-E4
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:26:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pImjA-0005Kw-F3
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:26:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674203183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1XYX5p/DdgH4ckLmvqJj0yalyWgUeoiBsdoIttOCdLc=;
 b=a3bCUVSMS2uss0YLWoKLYwQ/MS77o7XnNn2Ean+fjxWckdRkEudvJ8DTSfzzdJGoNXgl6c
 cW9vMPV4oI+pRpoh99EuRzUCCHQjhuWJ/G2H50ChDv6bUNrvM1YMjPqAX5ufNtN1Od0T+G
 sVHKCjiddeHgq5/c++WpPNKbwAozmgk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-661-brMlo9JaP4GE94i4AmVvig-1; Fri, 20 Jan 2023 03:26:21 -0500
X-MC-Unique: brMlo9JaP4GE94i4AmVvig-1
Received: by mail-qv1-f69.google.com with SMTP id
 gh14-20020a05621429ce00b005354cae6827so2179579qvb.19
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 00:26:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1XYX5p/DdgH4ckLmvqJj0yalyWgUeoiBsdoIttOCdLc=;
 b=BPLMeVcMi6XnAg5KzFkKXiXQwYT3yVKN6BzDja1snp4qX9z1fmRujiQIzZb3DRC9Ym
 rmUCHIr3toy7xLXcuGIGRek/0zMre0wJIviX6RsdTtlh1EfUl5RBAhSa/x0nPi794VT9
 J01hGs8/glTHuWQBdBe45lqcZJutHe8T2Jr4NgdOAgzPFX+5yQoO2P2gDgUi6HAMrn0m
 6LR+ft2yVUyxbAQrkmTI29quQq1ECHlgZbZARJ80JpRHN3BzqBwDV4N0kNJ8BTVrcdU9
 /YNoCjgL/XeKMIicIZOIEZVBI4zAkMa4qruLX5PvWQxShtz4eHTw5mKZJITd1KakMMaV
 /qag==
X-Gm-Message-State: AFqh2konCYaKBAoDWWdLWBdaDz5OP7uX1J/O3Ww2hIfMvpQaVFLleS5J
 wV1eNevngpDQDiDiYp86XX3kuYIIPasAhAJpdoaSjOn8WnGLig4RAgj3ACvOYycqbbMgjPAT01b
 9IHbAykk0q+hr7+A=
X-Received: by 2002:a05:6214:5d11:b0:520:f8fa:5ad8 with SMTP id
 me17-20020a0562145d1100b00520f8fa5ad8mr19902596qvb.17.1674203181293; 
 Fri, 20 Jan 2023 00:26:21 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsdSmAuCOtWO1atCYM71P6d75sjU1TwKvRRPa2Tbi40W94cgO05/urTgLdOb9gMb4R4QIKVXA==
X-Received: by 2002:a05:6214:5d11:b0:520:f8fa:5ad8 with SMTP id
 me17-20020a0562145d1100b00520f8fa5ad8mr19902562qvb.17.1674203181078; 
 Fri, 20 Jan 2023 00:26:21 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-118.web.vodafone.de.
 [109.43.177.118]) by smtp.gmail.com with ESMTPSA id
 bp37-20020a05620a45a500b006e99290e83fsm25798215qkb.107.2023.01.20.00.26.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 00:26:20 -0800 (PST)
Message-ID: <bf981e90-6f0a-b4bb-422a-e455fbf2ea84@redhat.com>
Date: Fri, 20 Jan 2023 09:26:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 17/18] gitlab: wrap up test results for custom runners
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Bandan Das <bsd@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Cleber Rosa <crosa@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230119180419.30304-1-alex.bennee@linaro.org>
 <20230119180419.30304-18-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230119180419.30304-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 19/01/2023 19.04, Alex Bennée wrote:
> Instead of spewing the whole log to stdout lets just define them as
> build artefacts so we can examine them later. Where we are running
> check-tcg run it first as those tests are yet to be integrated into
> meson.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/custom-runners.yml                     | 11 +++++++++++
>   .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml  | 13 ++++++-------
>   .../custom-runners/ubuntu-22.04-aarch32.yml         |  2 +-
>   .../custom-runners/ubuntu-22.04-aarch64.yml         | 13 ++++++-------
>   4 files changed, 24 insertions(+), 15 deletions(-)
> 
> diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
> index 97f99e29c2..9fdc476c48 100644
> --- a/.gitlab-ci.d/custom-runners.yml
> +++ b/.gitlab-ci.d/custom-runners.yml
> @@ -13,6 +13,17 @@
>   variables:
>     GIT_STRATEGY: clone
>   
> +# All custom runners can extend this template to upload the testlog
> +# data as an artifact and also feed the junit report
> +.custom_artifacts_template:
> +  artifacts:
> +    name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
> +    expire_in: 7 days
> +    paths:
> +      - build/meson-logs/testlog.txt
> +    reports:
> +      junit: build/meson-logs/testlog.junit.xml
> +
>   include:
>     - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml'
>     - local: '/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml'
> diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
> index fcaef9e5ef..f512eaeaa3 100644
> --- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
> +++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
> @@ -3,6 +3,7 @@
>   # "Install basic packages to build QEMU on Ubuntu 20.04/20.04"
>   
>   ubuntu-20.04-s390x-all-linux-static:
> + extends: .custom_artifacts_template
>    needs: []
>    stage: build
>    tags:
> @@ -19,12 +20,11 @@ ubuntu-20.04-s390x-all-linux-static:
>    - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
>      || { cat config.log meson-logs/meson-log.txt; exit 1; }
>    - make --output-sync -j`nproc`
> + - make --output-sync check-tcg
>    - make --output-sync -j`nproc` check
> -   || { cat meson-logs/testlog.txt; exit 1; } ;
> - - make --output-sync -j`nproc` check-tcg
> -   || { cat meson-logs/testlog.txt; exit 1; } ;

No more -j`nproc` for check-tcg? Maybe mention the reason in the commit message?

Anyway,
Reviewed-by: Thomas Huth <thuth@redhat.com>


