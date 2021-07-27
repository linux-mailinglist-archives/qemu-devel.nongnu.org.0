Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A70A3D6E95
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 08:01:31 +0200 (CEST)
Received: from localhost ([::1]:34622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8G9i-0008K8-7p
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 02:01:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m8G8N-0007Y7-Kd
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 02:00:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m8G8H-0000iv-Cf
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 02:00:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627365600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RaKtBf3juklipxo3DVY6FsGF9/a/zQ8lgahZzHbU/W8=;
 b=Qap+4q/bo8TS3zsSBP3zkLZn1nVijaVCF4T6950dXDge6jV1frbNzxccG+o5ERJkYniquh
 YmXpFBJufkib7zdin8XYSTCR9DeJZ5O4RCWDEEooomI8C86tsWwc22syvtPz0uHCMx9fc0
 GtJC0pc8uBIcZMFQnT+hzx5ixRBPXJY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-0pLpjUgtPp6xeNT9iU9OSQ-1; Tue, 27 Jul 2021 01:59:57 -0400
X-MC-Unique: 0pLpjUgtPp6xeNT9iU9OSQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 u14-20020a7bcb0e0000b0290248831d46e4so913982wmj.6
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 22:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RaKtBf3juklipxo3DVY6FsGF9/a/zQ8lgahZzHbU/W8=;
 b=q+ORgiHnA/yppt+TqA5qBwa2rpoxjdX6QOgVbL/l/J8nkF1qeZHKlGx56ly95aEIs0
 ogX2WuyKTbKKFlVbuxSPa60qYfXUcbEAXuqLyAIUu1elFjlcnaNmQKEsEIcJHDY1eIrg
 nOlFRWuEY92TeYZKFuRo+UH6q0yYcF4dxNp8gmAKeJyDiw+sK0lQzrMnwJdWKzwoUOLe
 VZA7ZBHHmsq+ZoJ/VrmHDYvJapy2gynxmgmnt/9FhOF3DKRfcBw9HEaG0f1GZNL1LUyu
 NbCtXlatslSViOjZ0iCrnrchh/hgmj31NUxj8mFXhcHUXPeWR05VF+CVPUms64C6jMY+
 nvYQ==
X-Gm-Message-State: AOAM533jxLSxGHvsqhPAOLh2Ji2Op2GE9USZunaU8dHlG4lrsuPjXqt0
 yfEf9nVr4fSxw41lKrfGuqvBT0gSZkKiSLd62ALfoSV4lEKiOAcslwZGpTqNnSXXR8r+KMHjrNb
 tZi3ueRtp3OztGWc=
X-Received: by 2002:a5d:428d:: with SMTP id k13mr22919288wrq.269.1627365595870; 
 Mon, 26 Jul 2021 22:59:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFMlF7bEzyFf0t8oqZBDtf/B3hoDX5EFk1Iza/yc3ZomSGq5vVRjsAJiTUhj6olTK9ghhnTQ==
X-Received: by 2002:a5d:428d:: with SMTP id k13mr22919266wrq.269.1627365595619; 
 Mon, 26 Jul 2021 22:59:55 -0700 (PDT)
Received: from thuth.remote.csb (pd9575250.dip0.t-ipconnect.de. [217.87.82.80])
 by smtp.gmail.com with ESMTPSA id k6sm859317wrm.10.2021.07.26.22.59.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 22:59:55 -0700 (PDT)
Subject: Re: [PATCH-for-6.1 v4 1/4] docs: Document GitLab custom CI/CD
 variables
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210726150429.1216251-1-philmd@redhat.com>
 <20210726150429.1216251-2-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <09a71f22-2f9f-e8bd-148a-a8695af86f8f@redhat.com>
Date: Tue, 27 Jul 2021 07:59:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210726150429.1216251-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/07/2021 17.04, Philippe Mathieu-Daudé wrote:
> We introduced the QEMU_CI_AVOCADO_TESTING variable in commit f56bf4caf
> ("gitlab: Run Avocado tests manually (except mainstream CI)"), but
> forgot to document it properly. Do it now.
> 
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   docs/devel/ci.rst | 40 ++++++++++++++++++++++++++++++++++++++++
>   .gitlab-ci.yml    | 19 ++-----------------
>   2 files changed, 42 insertions(+), 17 deletions(-)
> 
> diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
> index b3bf3ef615b..53df04afb7f 100644
> --- a/docs/devel/ci.rst
> +++ b/docs/devel/ci.rst
> @@ -8,6 +8,46 @@ found at::
>   
>      https://wiki.qemu.org/Testing/CI
>   
> +Custom CI/CD variables
> +======================
> +
> +QEMU CI pipelines can be tuned setting some CI environment variables.

"tuned *by* setting" ?

> +
> +Set variable globally in the user's CI namespace
> +------------------------------------------------
> +
> +Variables can be set globally in the user's CI namespace setting.
> +
> +For further information about how to set these variables, please refer to::
> +
> +  https://docs.gitlab.com/ee/ci/variables/#create-a-custom-variable-in-the-ui

The anchor does not seem to exist anymore?

> +Set variable manually when pushing a branch or tag to the user's repository
> +---------------------------------------------------------------------------
> +
> +Variables can be set manually when pushing a branch or tag, using
> +git-push command line arguments.
> +
> +Example setting the QEMU_CI_EXAMPLE_VAR variable:
> +
> +.. code::
> +
> +   git push -o ci.variable="QEMU_CI_EXAMPLE_VAR=value" myrepo mybranch
> +
> +For further information about how to set these variables, please refer to::
> +
> +  https://docs.gitlab.com/ee/user/project/push_options.html#push-options-for-gitlab-cicd
> +
> +Here is a list of the most used variables:
> +
> +QEMU_CI_AVOCADO_TESTING
> +~~~~~~~~~~~~~~~~~~~~~~~
> +By default, tests using the Avocado framework are not run automatically in
> +the pipelines (because multiple artifacts have to be downloaded, and if
> +these artifacts are not already cached, downloading them make the jobs
> +reach the timeout limit). Set this variable to have the tests using the
> +Avocado framework run automatically.
> +
>   Jobs on Custom Runners
>   ======================
>   
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 6dc5385e697..9762dda2ee3 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -16,24 +16,9 @@
>   # QEMU CI jobs are based on templates. Some templates provide
>   # user-configurable options, modifiable via configuration variables.
>   #
> -# These variables can be set globally in the user's CI namespace
> -# setting:
> -# https://docs.gitlab.com/ee/ci/variables/#create-a-custom-variable-in-the-ui
> -# or set manually each time a branch/tag is pushed, as a git-push
> -# command line argument:
> -# https://docs.gitlab.com/ee/user/project/push_options.html#push-options-for-gitlab-cicd
> +# See https://qemu-project.gitlab.io/qemu/devel/ci.html#custom-ci-cd-variables
> +# for more information.
>   #
> -# Example setting the QEMU_CI_EXAMPLE_VAR variable:
> -#
> -#   git push -o ci.variable="QEMU_CI_EXAMPLE_VAR=value" myrepo mybranch
> -#
> -# ----------------------------------------------------------------------
> -#
> -# List of environment variables that can be use to modify the set
> -# of jobs selected:
> -#
> -# - QEMU_CI_AVOCADO_TESTING
> -#   If set, tests using the Avocado framework will be run
>   
>   include:
>     - local: '/.gitlab-ci.d/qemu-project.yml'
> 

With the two issues above fixed:
Reviewed-by: Thomas Huth <thuth@redhat.com>


