Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D57322D4D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 16:19:34 +0100 (CET)
Received: from localhost ([::1]:56504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEZTJ-0006We-OT
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 10:19:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEZRb-0005Up-8v
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:17:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEZRQ-00070k-9M
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:17:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614093453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BX0Lb9afA/izKxitKlRmmHwYc/6+3EJbiWoDjYQFJAw=;
 b=R/qoxvysXKTrj3Sklx7HKXx5iDRoS/egUNk0AFcslwuZJ8GkDbpn5J1U4OF+X/4tZ0uJc4
 kXCk6uoKMwFt7+89a7OEzHX8lZ13ngkF+2GnsQDSCHWrrkKEL6QLPxPkRY/t/HrfYhloyL
 uxv68IXfTApOoZwKFR9CXXJWZ+XY6q4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-qLHNUqfuOOGIPcfO963d6w-1; Tue, 23 Feb 2021 10:17:27 -0500
X-MC-Unique: qLHNUqfuOOGIPcfO963d6w-1
Received: by mail-ed1-f71.google.com with SMTP id w9so8643951edi.15
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 07:17:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BX0Lb9afA/izKxitKlRmmHwYc/6+3EJbiWoDjYQFJAw=;
 b=oeuvSfty+uS8n08F57KJme9g9kKV13OYL12yIH5ABQ6P6LXqwbp+o0vGZcLIDM1VC2
 XY8Ne0kAuXlGg2mEw6NGutfIuQm+i5bRf608pgBvvRuK9AsuzWuhFVPf0Y+FlSKFgVHm
 XdBl4zKIU81Va4ZCXDKHkLSobRZfqyfaaXsgnFj/SnHq97/FSwjfPQXHp//WW143dDQZ
 Q9QUWKIzZF3qgFzV1RmacFM8LGsa3o3uswv1U2fIx3blBxi92RL5jsnDaE23nXSQ1Pw4
 oL9dDyXGlhdghao5IKURO1UJJwT7wukf6vGzcdDMdPGf4IeYpEXT26ffAWn/ol4NwQKq
 FAKA==
X-Gm-Message-State: AOAM533881fNG0PylEU6kiXLZTTCe7TTfLbt2mQ4UrtzpkK3khXmjOI0
 otALgYVKixUuS1SXJLv37cM19i9y+C7YAqOhEQ6SoXk6ZGTYfOoBWZphmStJtB/yw3tUkDTWbGi
 Z9iwzZcUY0exCh7o=
X-Received: by 2002:a17:906:30da:: with SMTP id
 b26mr26139192ejb.376.1614093446344; 
 Tue, 23 Feb 2021 07:17:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhK9zhEHdxcXNl1Qp1PdRpSbUWSdPscqYBk/8RSqzexbRG8EdZOJvFi0pfnWxlggImhZgXDw==
X-Received: by 2002:a17:906:30da:: with SMTP id
 b26mr26139160ejb.376.1614093446101; 
 Tue, 23 Feb 2021 07:17:26 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y29sm15535389edl.91.2021.02.23.07.17.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 07:17:25 -0800 (PST)
Subject: Re: [PATCH v5 4/4] Jobs based on custom runners: add job definitions
 for QEMU's machines
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-5-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <21f882ba-21db-2d45-0e74-be27e1119355@redhat.com>
Date: Tue, 23 Feb 2021 16:17:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210219215838.752547-5-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Erik Skultety <eskultet@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 10:58 PM, Cleber Rosa wrote:
> The QEMU project has two machines (aarch64 and s390x) that can be used
> for jobs that do build and run tests.  This introduces those jobs,
> which are a mapping of custom scripts used for the same purpose.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  .gitlab-ci.d/custom-runners.yml | 204 ++++++++++++++++++++++++++++++++
>  1 file changed, 204 insertions(+)
> 
> diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
> index 3004da2bda..a9166c82a2 100644
> --- a/.gitlab-ci.d/custom-runners.yml
> +++ b/.gitlab-ci.d/custom-runners.yml
> @@ -12,3 +12,207 @@
>  # strategy.
>  variables:
>    GIT_SUBMODULE_STRATEGY: recursive
> +
> +# All ubuntu-18.04 jobs should run successfully in an environment
> +# setup by the scripts/ci/setup/build-environment.yml task
> +# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
> +ubuntu-18.04-s390x-all-linux-static:
> + allow_failure: true
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_18.04
> + - s390x

Where is this tag list filled upon registration?

> + rules:
> + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
> + script:
> + # --disable-libssh is needed because of https://bugs.launchpad.net/qemu/+bug/1838763
> + # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
> + - mkdir build
> + - cd build
> + - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=1
> + - make --output-sync -j`nproc` check-tcg V=1

Also this break the rest of the tests...

The first containers job (amd64-alpine-container) got
added to the custom runner and failed (because docker-dind
isn't there?):

$ export TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
$ export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/$NAME:latest"
$ apk add python3
bash: line 110: apk: command not found
Running after_script 00:01
Running after script...
$ docker logout
Removing login credentials for https://index.docker.io/v1/
ERROR: Job failed: exit status 1

Do we need to restrict the other jobs to the Gitlab public
(x86) runners? Maybe as:

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
@@ -1,6 +1,6 @@
 .container_job_template: &container_job_definition
+  tags:
+    - gitlab-org-docker
   image: docker:stable
   stage: containers
   services:

Daniel, you didn't hit this problem on the previous version
of this series?

Thanks,

Phil.


