Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB953D70AD
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 09:56:41 +0200 (CEST)
Received: from localhost ([::1]:38616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8HxA-0003BH-DC
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 03:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8Hw6-0002RQ-Hr
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 03:55:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8Hw2-0002ea-Q9
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 03:55:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627372529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YOqmrGplgp0aTKC8EcVN6UU3AC0mWdMqmzwd5MAY8HI=;
 b=VIEDQ6GMql60PUSuFDOo93BQ5LV/pisVy33Rfw0qAKZZJ96EGkx3JKgz+8gU8+5QC9/okY
 LBveicLHR0ZykqFL9nwO9mP4gmlmlye7JN0aeCe71lerIQsdlyJ+fAL/hZwpwQe1MnUXTq
 7bsHAjBbmCzrOiwEohg2JeM4v2g911I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-6T5T9xBKOASBbW4vZR3nFg-1; Tue, 27 Jul 2021 03:55:26 -0400
X-MC-Unique: 6T5T9xBKOASBbW4vZR3nFg-1
Received: by mail-wr1-f69.google.com with SMTP id
 n1-20020a5d59810000b029013cd60e9baaso5665147wri.7
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 00:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YOqmrGplgp0aTKC8EcVN6UU3AC0mWdMqmzwd5MAY8HI=;
 b=a/2ghakP3UE/fn+iPAoaxLXhJ1DQuujkYn+JZZOdPCsGT+/UMbeT/yp/wyfLAGq6bY
 0ru/4vHk6xbsFiUwtrP1YWK9TorlfjADA/ClYSdThVoSEsVJ9qIqhfxazNQoJoTPFOiT
 SQ1Jw4H/YXB46dEGz7OpmGRmro6r9ax4EleZZbEAD2naShUiD/WfyouYOR9Aj4UkOXJw
 aZ9aR4smL336P3G7nc2HmYS6Ac2tfMbbTkOWmaU0jcpVOTqVo0DB80LYhGdRxt9VdlKX
 cOp+qheON0sjnBV/F8oihuoFFWQiw4UEPxx0rpLZlXbLp4MN1WToIydE1pp0gyl7NzuS
 qzdQ==
X-Gm-Message-State: AOAM533883Je2ZXJuopt4bjn6Qpz5qr+EFTwwp8WvurFfgOw4AtskzLC
 ra8AIe26+XQnqyYwlBsoECp7hCjjZRQVVpemtgLcOPRwC0IgteiQDpAkBfQZUJ8mZTgSumrTLMC
 qdg0+EBm/bOQLBtA=
X-Received: by 2002:a05:600c:4401:: with SMTP id
 u1mr2817747wmn.49.1627372525040; 
 Tue, 27 Jul 2021 00:55:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXHDE9rnHxFekfmE210f0Fpboqdt8B+Qmz6zX771/MNYzD2kms7S+JSOmnKLAO6eH4Kqxmzg==
X-Received: by 2002:a05:600c:4401:: with SMTP id
 u1mr2817724wmn.49.1627372524798; 
 Tue, 27 Jul 2021 00:55:24 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id e6sm2736147wrg.18.2021.07.27.00.55.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 00:55:24 -0700 (PDT)
Subject: Re: [PATCH-for-6.1 v4 1/4] docs: Document GitLab custom CI/CD
 variables
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210726150429.1216251-1-philmd@redhat.com>
 <20210726150429.1216251-2-philmd@redhat.com>
 <09a71f22-2f9f-e8bd-148a-a8695af86f8f@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <efbe182f-710c-fa2e-abf7-9b2bf067ee2c@redhat.com>
Date: Tue, 27 Jul 2021 09:55:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <09a71f22-2f9f-e8bd-148a-a8695af86f8f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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

On 7/27/21 7:59 AM, Thomas Huth wrote:
> On 26/07/2021 17.04, Philippe Mathieu-Daudé wrote:
>> We introduced the QEMU_CI_AVOCADO_TESTING variable in commit f56bf4caf
>> ("gitlab: Run Avocado tests manually (except mainstream CI)"), but
>> forgot to document it properly. Do it now.
>>
>> Suggested-by: Thomas Huth <thuth@redhat.com>
>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   docs/devel/ci.rst | 40 ++++++++++++++++++++++++++++++++++++++++
>>   .gitlab-ci.yml    | 19 ++-----------------
>>   2 files changed, 42 insertions(+), 17 deletions(-)
>>
>> diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
>> index b3bf3ef615b..53df04afb7f 100644
>> --- a/docs/devel/ci.rst
>> +++ b/docs/devel/ci.rst
>> @@ -8,6 +8,46 @@ found at::
>>        https://wiki.qemu.org/Testing/CI
>>   +Custom CI/CD variables
>> +======================

[*]

>> +
>> +QEMU CI pipelines can be tuned setting some CI environment variables.
> 
> "tuned *by* setting" ?

OK.

> 
>> +
>> +Set variable globally in the user's CI namespace
>> +------------------------------------------------
>> +
>> +Variables can be set globally in the user's CI namespace setting.
>> +
>> +For further information about how to set these variables, please
>> refer to::
>> +
>> + 
>> https://docs.gitlab.com/ee/ci/variables/#create-a-custom-variable-in-the-ui
>>
> 
> The anchor does not seem to exist anymore?

It will exist once this patch get merged, see [*] ;)

> 
>> +Set variable manually when pushing a branch or tag to the user's
>> repository
>> +---------------------------------------------------------------------------
>>
>> +
>> +Variables can be set manually when pushing a branch or tag, using
>> +git-push command line arguments.
>> +
>> +Example setting the QEMU_CI_EXAMPLE_VAR variable:
>> +
>> +.. code::
>> +
>> +   git push -o ci.variable="QEMU_CI_EXAMPLE_VAR=value" myrepo mybranch
>> +
>> +For further information about how to set these variables, please
>> refer to::
>> +
>> + 
>> https://docs.gitlab.com/ee/user/project/push_options.html#push-options-for-gitlab-cicd
>>
>> +
>> +Here is a list of the most used variables:
>> +
>> +QEMU_CI_AVOCADO_TESTING
>> +~~~~~~~~~~~~~~~~~~~~~~~
>> +By default, tests using the Avocado framework are not run
>> automatically in
>> +the pipelines (because multiple artifacts have to be downloaded, and if
>> +these artifacts are not already cached, downloading them make the jobs
>> +reach the timeout limit). Set this variable to have the tests using the
>> +Avocado framework run automatically.
>> +
>>   Jobs on Custom Runners
>>   ======================
>>   diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index 6dc5385e697..9762dda2ee3 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -16,24 +16,9 @@
>>   # QEMU CI jobs are based on templates. Some templates provide
>>   # user-configurable options, modifiable via configuration variables.
>>   #
>> -# These variables can be set globally in the user's CI namespace
>> -# setting:
>> -#
>> https://docs.gitlab.com/ee/ci/variables/#create-a-custom-variable-in-the-ui
>>
>> -# or set manually each time a branch/tag is pushed, as a git-push
>> -# command line argument:
>> -#
>> https://docs.gitlab.com/ee/user/project/push_options.html#push-options-for-gitlab-cicd
>>
>> +# See
>> https://qemu-project.gitlab.io/qemu/devel/ci.html#custom-ci-cd-variables
>> +# for more information.
>>   #
>> -# Example setting the QEMU_CI_EXAMPLE_VAR variable:
>> -#
>> -#   git push -o ci.variable="QEMU_CI_EXAMPLE_VAR=value" myrepo mybranch
>> -#
>> -# ----------------------------------------------------------------------
>> -#
>> -# List of environment variables that can be use to modify the set
>> -# of jobs selected:
>> -#
>> -# - QEMU_CI_AVOCADO_TESTING
>> -#   If set, tests using the Avocado framework will be run
>>     include:
>>     - local: '/.gitlab-ci.d/qemu-project.yml'
>>
> 
> With the two issues above fixed:
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 


