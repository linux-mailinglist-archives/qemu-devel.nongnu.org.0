Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E55322D9A8B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 16:05:04 +0100 (CET)
Received: from localhost ([::1]:33750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kopPL-0001jR-Ug
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 10:05:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kopN4-00080Z-Kh
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:02:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kopN1-0002Xm-P6
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:02:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607958158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=51bnO84bjW36kzT8Ht39JI3JwlkPuwCQolSFjTDbQ/s=;
 b=Q2MukdhmpNzG+rfYB5SRO6Nv8Gi8SbRZkARc06zmdYYyP7HYd6XbX5zOSa3SyHGxCA90fF
 XcllOCCRgB/tGDaVJcw2ISbSrqnFbpNl5diCFrvNKuXXBmgcEm1j8zq5ha0j+vCOFJzbgm
 M2atScoS/R9QBevQrJ7lsger1C+wU/8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-PTzmMPWDN92Lifz4lLXF6g-1; Mon, 14 Dec 2020 10:02:35 -0500
X-MC-Unique: PTzmMPWDN92Lifz4lLXF6g-1
Received: by mail-wr1-f71.google.com with SMTP id g16so5433569wrv.1
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 07:02:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=51bnO84bjW36kzT8Ht39JI3JwlkPuwCQolSFjTDbQ/s=;
 b=hbpiTAATwOgnMP8bgn/LG+XzMCjDPFkB4Y9+9vCK4X0aApR4Ieo6XgZ6NqXA2Ee6ll
 9KdrcdWthjODTT4hjSH9WhpIRwyMDTKa1ae9eQFd0InYA1xPFQtT+UGpX5g1pYXmcDit
 CFDNEb7w8AM13K+Hg/FZQzyqm3S6sxZ0sWkADHGWo5Atc5DoVQXJYAEVGnHlKIcuAjIz
 yh73PL0BOXi/9Dqoz3pHGLABAYpxrZJdjXukmGTowin5y2OWfy8vJzYmzVV4Op3JOPfP
 83bEYPeFBV3qQTy+L9FnygQ3biLbf5YJullDZwTyPYSJTcqHreDFkSZyNCUhyf2yJVc0
 FJaA==
X-Gm-Message-State: AOAM533XqKxeSyN/VQPWkGgivN7wl6hAq/ix6kfiht4XSu1oaVLxQHR0
 HE7CZ54C4ju5eF5CVdEXTd5qwPScikeMkqMzTsx7xOsqIKEEk3XugvJgg9uGU8/PNn1diXNvHm2
 vnAt/fwOl03xCq54=
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr27945954wmb.112.1607958154191; 
 Mon, 14 Dec 2020 07:02:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxAXUf7e9PmQx9MXml9CLoyGbZ4RKCWJ6U6wxm7gZjdC+4CtQSlU/olCIjrho9p7X7J/X1VTA==
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr27945915wmb.112.1607958153887; 
 Mon, 14 Dec 2020 07:02:33 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id b73sm37272068wmb.0.2020.12.14.07.02.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 07:02:33 -0800 (PST)
Subject: Re: [RFC PATCH 2/2] gitlab-ci: Introduce allow_skipping_job_template
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>
References: <20201211171703.537546-1-philmd@redhat.com>
 <20201211171703.537546-3-philmd@redhat.com>
 <f8f902a9-026f-7059-2d61-5ae3051acf15@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <eb55215d-2826-71f2-6c29-1c8d59635049@redhat.com>
Date: Mon, 14 Dec 2020 16:02:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <f8f902a9-026f-7059-2d61-5ae3051acf15@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 virt-ci-maint-team@redhat.com,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/20 2:32 PM, Thomas Huth wrote:
> On 11/12/2020 18.17, Philippe Mathieu-Daudé wrote:
>> It might be overkill (and frustrating) to rerun all the jobs when
>> iterating over a single code unit. As some users are interested
>> in only rerunning a specific set of jobs, allow them to use a
>> "manual" profile, when jobs are created in the pipeline but not
>> started. It is up to the user to manually start the jobs of
>> interest.
>>
>> To switch a repository to manual, set QEMU_DEFAULT_WORKFLOW_MANUAL
>> in the project UI, following [1].
>>
>> Once a repository is using the manual workflow, the user can still
>> automatically start the jobs by explicitly set the
>> QEMU_IGNORE_DEFAULT_WORKFLOW which disable the manual mode.
>>
>> Example while pushing a branch/tag from command line (see [2]):
>>
>>   $ git push -o ci.variable="QEMU_IGNORE_DEFAULT_WORKFLOW=1" \
>>       myrepo mybranch
>>
>> [1] https://docs.gitlab.com/ee/ci/variables/#create-a-custom-variable-in-the-ui
>> [2] https://docs.gitlab.com/ee/user/project/push_options.html#push-options-for-gitlab-cicd
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  .gitlab-ci.d/crossbuilds.yml |  4 ++++
>>  .gitlab-ci.yml               | 18 ++++++++++++++++++
>>  2 files changed, 22 insertions(+)
>>
>> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
>> index 864cad7cec5..56b053cbb52 100644
>> --- a/.gitlab-ci.d/crossbuilds.yml
>> +++ b/.gitlab-ci.d/crossbuilds.yml
>> @@ -1,4 +1,5 @@
>>  .cross_system_build_job:
>> +  extends: .allow_skipping_job
>>    stage: build
>>    image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>>    timeout: 80m
>> @@ -18,6 +19,7 @@
>>  # KVM), and set extra options (such disabling other accelerators) via the
>>  # $ACCEL_CONFIGURE_OPTS variable.
>>  .cross_accel_build_job:
>> +  extends: .allow_skipping_job
>>    stage: build
>>    image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>>    timeout: 30m
>> @@ -30,6 +32,7 @@
>>      - make -j$(expr $(nproc) + 1) all check-build
>>  
>>  .cross_user_build_job:
>> +  extends: .allow_skipping_job
>>    stage: build
>>    image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>>    script:
>> @@ -40,6 +43,7 @@
>>      - make -j$(expr $(nproc) + 1) all check-build
>>  
>>  .cross_sanity_check_job:
>> +  extends: .allow_skipping_job
> 
> So "extends" is possible ....
> 
>>    stage: build
>>    image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>>    timeout: 3m
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index 98bff03b47b..26b85f08f35 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -13,7 +13,21 @@ include:
>>    - local: '/.gitlab-ci.d/containers.yml'
>>    - local: '/.gitlab-ci.d/crossbuilds.yml'
>>  
>> +.allow_skipping_job_template: &allow_skipping_job_definition
>> +  rules:
>> +    # Skip if the user set the QEMU_DEFAULT_WORKFLOW_MANUAL variable for its
>> +    # project. Can be overridden by setting the QEMU_IGNORE_DEFAULT_WORKFLOW
>> +    # variable.
>> +    - if: $CI_PIPELINE_SOURCE == "push" && $QEMU_DEFAULT_WORKFLOW_MANUAL && $QEMU_IGNORE_DEFAULT_WORKFLOW == null
>> +      when: manual
>> +      allow_failure: true
>> +    - when: always
>> +
>> +.allow_skipping_job:
>> +  <<: *allow_skipping_job_definition
> 
> ... before the anchestor has been defined? That's nice!

'extends' is indeed more powerful and less hackish.

> I'm basically fine with this patch, but can you please also add some
> sentence how to use this to docs/devel/testing.rst ?

Thanks, I later discovered this isn't complete, because if a children
job is in automatic state and a parent (dependency) is in manual, there
is some "dead lock": the pipeline waits until manual job is started.

To be complete, I have to ensure if a job is in manual state, all its
dependencies also are.

Then we are back to 'extends' VS 'anchors', as this doesn't work with
anchors, I have to convert all jobs to 'extends'. Good news is I already
did it, I simply need to rebase this series:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg758331.html

Thanks for reviewing,

Phil.


