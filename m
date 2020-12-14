Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D402D98EB
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 14:36:24 +0100 (CET)
Received: from localhost ([::1]:42546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koo1Y-0005Z9-0H
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 08:36:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kony5-0003EV-4X
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 08:32:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kony1-0008Le-Tl
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 08:32:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607952765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uxgf+9U5Z9UhrAhjn7q7Q+QYl+APhggjaEC9vB8UgWc=;
 b=Ofsvh5nGIhV3oTv/0YvrPfMgvV0914WXUbtWcS2fqYposN8Szzv0f0EfOcodeP+Sso6iPM
 cYt2RgZiPXcp4jbTqHug4Es17fbB8HGi+NTSW/mZ8DEFUMeDI43GEDgTEEwaysvgDOFbwO
 OED5dD00rNtd2vi7GyfXp46ekLX6/C8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-Sw1G0iURNLC8OmQgZ-PtWQ-1; Mon, 14 Dec 2020 08:32:41 -0500
X-MC-Unique: Sw1G0iURNLC8OmQgZ-PtWQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DAB2C73AD;
 Mon, 14 Dec 2020 13:32:40 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-49.ams2.redhat.com [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A3D75C1BB;
 Mon, 14 Dec 2020 13:32:30 +0000 (UTC)
Subject: Re: [RFC PATCH 2/2] gitlab-ci: Introduce allow_skipping_job_template
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>
References: <20201211171703.537546-1-philmd@redhat.com>
 <20201211171703.537546-3-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f8f902a9-026f-7059-2d61-5ae3051acf15@redhat.com>
Date: Mon, 14 Dec 2020 14:32:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201211171703.537546-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
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

On 11/12/2020 18.17, Philippe Mathieu-Daudé wrote:
> It might be overkill (and frustrating) to rerun all the jobs when
> iterating over a single code unit. As some users are interested
> in only rerunning a specific set of jobs, allow them to use a
> "manual" profile, when jobs are created in the pipeline but not
> started. It is up to the user to manually start the jobs of
> interest.
> 
> To switch a repository to manual, set QEMU_DEFAULT_WORKFLOW_MANUAL
> in the project UI, following [1].
> 
> Once a repository is using the manual workflow, the user can still
> automatically start the jobs by explicitly set the
> QEMU_IGNORE_DEFAULT_WORKFLOW which disable the manual mode.
> 
> Example while pushing a branch/tag from command line (see [2]):
> 
>   $ git push -o ci.variable="QEMU_IGNORE_DEFAULT_WORKFLOW=1" \
>       myrepo mybranch
> 
> [1] https://docs.gitlab.com/ee/ci/variables/#create-a-custom-variable-in-the-ui
> [2] https://docs.gitlab.com/ee/user/project/push_options.html#push-options-for-gitlab-cicd
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  .gitlab-ci.d/crossbuilds.yml |  4 ++++
>  .gitlab-ci.yml               | 18 ++++++++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 864cad7cec5..56b053cbb52 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -1,4 +1,5 @@
>  .cross_system_build_job:
> +  extends: .allow_skipping_job
>    stage: build
>    image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>    timeout: 80m
> @@ -18,6 +19,7 @@
>  # KVM), and set extra options (such disabling other accelerators) via the
>  # $ACCEL_CONFIGURE_OPTS variable.
>  .cross_accel_build_job:
> +  extends: .allow_skipping_job
>    stage: build
>    image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>    timeout: 30m
> @@ -30,6 +32,7 @@
>      - make -j$(expr $(nproc) + 1) all check-build
>  
>  .cross_user_build_job:
> +  extends: .allow_skipping_job
>    stage: build
>    image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>    script:
> @@ -40,6 +43,7 @@
>      - make -j$(expr $(nproc) + 1) all check-build
>  
>  .cross_sanity_check_job:
> +  extends: .allow_skipping_job

So "extends" is possible ....

>    stage: build
>    image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>    timeout: 3m
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 98bff03b47b..26b85f08f35 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -13,7 +13,21 @@ include:
>    - local: '/.gitlab-ci.d/containers.yml'
>    - local: '/.gitlab-ci.d/crossbuilds.yml'
>  
> +.allow_skipping_job_template: &allow_skipping_job_definition
> +  rules:
> +    # Skip if the user set the QEMU_DEFAULT_WORKFLOW_MANUAL variable for its
> +    # project. Can be overridden by setting the QEMU_IGNORE_DEFAULT_WORKFLOW
> +    # variable.
> +    - if: $CI_PIPELINE_SOURCE == "push" && $QEMU_DEFAULT_WORKFLOW_MANUAL && $QEMU_IGNORE_DEFAULT_WORKFLOW == null
> +      when: manual
> +      allow_failure: true
> +    - when: always
> +
> +.allow_skipping_job:
> +  <<: *allow_skipping_job_definition

... before the anchestor has been defined? That's nice!

I'm basically fine with this patch, but can you please also add some
sentence how to use this to docs/devel/testing.rst ?

 Thanks,
  Thomas


