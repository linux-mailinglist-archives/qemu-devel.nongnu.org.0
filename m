Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8BE3DBB6D
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 16:54:22 +0200 (CEST)
Received: from localhost ([::1]:44410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Tu1-0000Ff-A8
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 10:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m9Tsd-0007LQ-Mc
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 10:52:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m9Tsb-0000o0-NV
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 10:52:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627656772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZouxU2a4VL0/1S2Xz4xgMW8Lrik0RiXfSYER6nA18t8=;
 b=XwQyEKDWYurAXgjnN2FXFmV1AnyplP3sOu6iJ8MJOhnRZN+6To917ELNPvh0WQZ0MVzf3g
 TBVPb+KBCa3m0p+3g5YrZlZpKuLi2UL9aCyuTqfxCDFwaraTdFjiHc8N5o5NNzmr05jcQc
 LW62+43Oz/KJQtRdG6h8+59+75WsZpE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-OdfSF-bHNGyw2F_YTeh8wg-1; Fri, 30 Jul 2021 10:52:49 -0400
X-MC-Unique: OdfSF-bHNGyw2F_YTeh8wg-1
Received: by mail-wr1-f71.google.com with SMTP id
 l12-20020a5d6d8c0000b029011a3b249b10so3272641wrs.3
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 07:52:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZouxU2a4VL0/1S2Xz4xgMW8Lrik0RiXfSYER6nA18t8=;
 b=Yl100X6OAtXqPbXZukXjJUAgf5ga/nxLzJBUwDzyoPu1Unsh0bFkVmRmugqOMdkE5w
 KCakNBINjOwO/X+qyfOsOuctLJaQhQeTB7qhZoMuCuae/HEd5iVfAPdPlOY5z/cDC/EK
 lonlYmsm69i3Q5vHV9fzV8ykV6QeyhLqlZQeifCLgqt/7vm9cQhSvQiU2HOfoP4PlajF
 13ui47EPekEJgyDsXozmgBYJtLwdpIN0HYUCJH0h1ycf0BbcyvdDDCXOo6F8FwxouQc8
 +BYLP6RtdC/JToBLwLWg0jrv50zhJnHcWflQBlYnAJuUJlbaViZ2NCjsEi2gdpCkp+aC
 DNGA==
X-Gm-Message-State: AOAM531r0vBh2ULpG/UA104Of5Y61VIl9BrPalIqK0iSrTT2/baSCXSr
 nWS+dflFM8+tlzOkPQ+G/cshH/FXFd01fjPhGeFo0S6bGL3oNW/I+9Z+uLjVYb7/1a/LUAlEpCp
 AsHj7rKGadNBuJHo=
X-Received: by 2002:a1c:1d81:: with SMTP id d123mr3336172wmd.72.1627656768725; 
 Fri, 30 Jul 2021 07:52:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzn0elD/GsYOvTNZz7rLAj9rqtgYPLClYAQvFtf/8dXrKU2r6gqia20pW4/ClIXrJZ4sziD3w==
X-Received: by 2002:a1c:1d81:: with SMTP id d123mr3336152wmd.72.1627656768500; 
 Fri, 30 Jul 2021 07:52:48 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id a2sm1914253wrn.95.2021.07.30.07.52.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 07:52:48 -0700 (PDT)
Subject: Re: [PATCH 3/3] gitlab-ci: Fix ..._RUNNER_AVAILABLE variables and
 document them
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210730143809.717079-1-thuth@redhat.com>
 <20210730143809.717079-4-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <acf78e95-8e90-4a6e-18e8-0d1707431604@redhat.com>
Date: Fri, 30 Jul 2021 16:52:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730143809.717079-4-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.125, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/30/21 4:38 PM, Thomas Huth wrote:
> The patch that recently introduced the S390X_RUNNER_AVAILABLE variable
> in custom-runners.yml missed that the bottom half of the file is rather
> about aarch64 than s390x. Thus rename the S390X_RUNNER_AVAILABLE to
> AARCH64_RUNNER_AVAILABLE in those jobs.

Oops.

> Finally mention both variables in our CI documentation, too.

Thanks.

Maybe "Fix ${arch}_RUNNER_AVAILABLE" as subject.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Fixes: c5dd0f0342 ("Improve rules for the staging branch")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.d/custom-runners.yml | 12 ++++++------
>  docs/devel/ci.rst               | 13 +++++++++++++
>  2 files changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
> index 564b94565d..0d3e4a7b4b 100644
> --- a/.gitlab-ci.d/custom-runners.yml
> +++ b/.gitlab-ci.d/custom-runners.yml
> @@ -137,7 +137,7 @@ ubuntu-20.04-aarch64-all-linux-static:
>   - aarch64
>   rules:
>   - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
> - - if: "$S390X_RUNNER_AVAILABLE"
> + - if: "$AARCH64_RUNNER_AVAILABLE"
>   script:
>   # --disable-libssh is needed because of https://bugs.launchpad.net/qemu/+bug/1838763
>   # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
> @@ -157,7 +157,7 @@ ubuntu-20.04-aarch64-all:
>   - aarch64
>   rules:
>   - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
> - - if: "$S390X_RUNNER_AVAILABLE"
> + - if: "$AARCH64_RUNNER_AVAILABLE"
>   script:
>   - mkdir build
>   - cd build
> @@ -174,7 +174,7 @@ ubuntu-20.04-aarch64-alldbg:
>   - aarch64
>   rules:
>   - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
> - - if: "$S390X_RUNNER_AVAILABLE"
> + - if: "$AARCH64_RUNNER_AVAILABLE"
>   script:
>   - mkdir build
>   - cd build
> @@ -193,7 +193,7 @@ ubuntu-20.04-aarch64-clang:
>   rules:
>   - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
>     when: manual
> - - if: "$S390X_RUNNER_AVAILABLE"
> + - if: "$AARCH64_RUNNER_AVAILABLE"
>     when: manual
>   script:
>   - mkdir build
> @@ -211,7 +211,7 @@ ubuntu-20.04-aarch64-tci:
>   - aarch64
>   rules:
>   - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
> - - if: "$S390X_RUNNER_AVAILABLE"
> + - if: "$AARCH64_RUNNER_AVAILABLE"
>   script:
>   - mkdir build
>   - cd build
> @@ -228,7 +228,7 @@ ubuntu-20.04-aarch64-notcg:
>   rules:
>   - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
>     when: manual
> - - if: "$S390X_RUNNER_AVAILABLE"
> + - if: "$AARCH64_RUNNER_AVAILABLE"
>     when: manual
>   script:
>   - mkdir build
> diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
> index 205572510c..558327457c 100644
> --- a/docs/devel/ci.rst
> +++ b/docs/devel/ci.rst
> @@ -48,6 +48,19 @@ these artifacts are not already cached, downloading them make the jobs
>  reach the timeout limit). Set this variable to have the tests using the
>  Avocado framework run automatically.
>  
> +AARCH64_RUNNER_AVAILABLE
> +~~~~~~~~~~~~~~~~~~~~~~~~
> +If you've got access to an aarch64 host that can be used as a gitlab-CI
> +runner, you can set this variable to enable the tests that require this
> +kind of host. The runner should be tagged with "aarch64".
> +
> +S390X_RUNNER_AVAILABLE
> +~~~~~~~~~~~~~~~~~~~~~~
> +If you've got access to an IBM Z host that can be used as a gitlab-CI
> +runner, you can set this variable to enable the tests that require this
> +kind of host. The runner should be tagged with "s390x".
> +
> +
>  Jobs on Custom Runners
>  ======================
>  
> 


