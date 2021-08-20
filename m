Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C83AA3F3711
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 00:56:44 +0200 (CEST)
Received: from localhost ([::1]:47758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHDRL-0004Rj-U9
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 18:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mHDOy-0002nL-1L
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 18:54:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mHDOv-0003L4-4m
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 18:54:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629500051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vkcEDbLffDqW95dfpXzgx15qaXDwmWEYdR/iNJWbJx8=;
 b=IZPKknC9ayiN0zvDGD/lO8k+nNoHQFGw0fDQyJHTwZDYu4U7+TN2yiFN01vIBzuGN/1T3G
 2/XT0W7x9lhv0llGo9KtO7T3pKrSVB6nJVqteOxiAfZ+wDXL3qiwML6o9R12xO810ArAwS
 p+rsFj5IVxWmXq7f+Y6OOnN6pesHp3k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-21HQmU4LM5CLDvEmr4rs2g-1; Fri, 20 Aug 2021 18:54:08 -0400
X-MC-Unique: 21HQmU4LM5CLDvEmr4rs2g-1
Received: by mail-wm1-f72.google.com with SMTP id
 m20-20020a7bce14000000b002e6fd85b6dfso2066424wmc.7
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 15:54:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vkcEDbLffDqW95dfpXzgx15qaXDwmWEYdR/iNJWbJx8=;
 b=uObtevAV3VMCSI+V/haRjyN5X6iwpH4otkVfzqPUhP7KLeo0nUt+3i0ZaTYTAZz4aB
 R2Bk4btdkdfENX0Vhj5qFLXqxyNHinhc8A1JiGzHZP4+T+o7fwejPSVVb+YX71w/wFuS
 82gSQleKfNe0No+byzWt3ZQl5UHLkq0uvX50+mwsRKpJz2H9V5YaItph/juZQM8lMFsf
 s6TJOBhhhpGskZHi3SLLDI1Jp6cqX1Ax2dGL/0n7ze7GpW0wiUs7ZUCvb55U0smOyF63
 ZDQNlNABYQAgKv5buyXw+euj5EriZn50w5cV6FjCNoDeNXrbCe8L4kDQXEQ2zvBiWcIy
 w7tA==
X-Gm-Message-State: AOAM533ZBby66A/OkVgAI1U3ZCxZjmoTCI6E5CY7GribDYtTxy4y5ROg
 x0P/TB7yi0bFBk6b4QoOtpPnQMwPzwgtFzB9+qqGSTX64dBlPr4153iaBYANZPxyC18/LI7aLnx
 grkj6vDhSntSxbAo=
X-Received: by 2002:a5d:4c4e:: with SMTP id n14mr1047703wrt.226.1629500046522; 
 Fri, 20 Aug 2021 15:54:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjmuSxkQPgQeAgN0fLOK+oUHC6nORtK/Iu/ZKOZfP7Q6f20azhYisTEhupGyyAsKbs7OB5zA==
X-Received: by 2002:a5d:4c4e:: with SMTP id n14mr1047690wrt.226.1629500046332; 
 Fri, 20 Aug 2021 15:54:06 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id o14sm5787433wms.2.2021.08.20.15.54.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 15:54:05 -0700 (PDT)
Subject: Re: [PATCH 2/2] docs: add definitions of terms for CI/testing
To: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org
References: <20210820210946.291335-1-willianr@redhat.com>
 <20210820210946.291335-3-willianr@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6a258355-cd8b-f03b-1c43-5a377ed78b7c@redhat.com>
Date: Sat, 21 Aug 2021 00:54:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820210946.291335-3-willianr@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.49, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/20/21 11:09 PM, Willian Rampazzo wrote:
> To understand the current state of QEMU CI/testing and have a base to
> discuss the plans for the future, it is important to define some usual
> terms. This patch defines the terms for "Automated tests", "Unit
> testing", "Functional testing", "System testing", "Flaky tests",
> "Gating", and "Continuous Integration".
> 
> The first patch was borrowed from
> 20210812180403.4129067-1-berrange@redhat.com.
> 
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> ---
>  docs/devel/ci-definitions.rst | 121 ++++++++++++++++++++++++++++++++++
>  docs/devel/ci.rst             |   1 +
>  2 files changed, 122 insertions(+)
>  create mode 100644 docs/devel/ci-definitions.rst

Wow, super cool!

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> diff --git a/docs/devel/ci-definitions.rst b/docs/devel/ci-definitions.rst
> new file mode 100644
> index 0000000000..32e22ff468
> --- /dev/null
> +++ b/docs/devel/ci-definitions.rst
> @@ -0,0 +1,121 @@
> +Definition of terms
> +===================
> +
> +This section defines the terms used in this document and correlates them with
> +what is currently used on QEMU.
> +
> +Automated tests
> +---------------
> +
> +An automated test is written on a test framework using its generic test
> +functions/classes. The test framework can run the tests and report their
> +success or failure [1]_.
> +
> +An automated test has essentially three parts:
> +
> +1. The test initialization of the parameters, where the expected parameters,
> +   like inputs and expected results, are set up;
> +2. The call to the code that should be tested;
> +3. An assertion, comparing the result from the previous call with the expected
> +   result set during the initialization of the parameters. If the result
> +   matches the expected result, the test has been successful; otherwise, it has
> +   failed.
> +
> +Unit testing
> +------------
> +
> +A unit test is responsible for exercising individual software components as a
> +unit, like interfaces, data structures, and functionality, uncovering errors
> +within the boundaries of a component. The verification effort is in the
> +smallest software unit and focuses on the internal processing logic and data
> +structures. A test case of unit tests should be designed to uncover errors due
> +to erroneous computations, incorrect comparisons, or improper control flow [2]_.
> +
> +On QEMU, unit testing is represented by the 'check-unit' target from 'make'.
> +
> +Functional testing
> +------------------
> +
> +A functional test focuses on the functional requirement of the software.
> +Deriving sets of input conditions, the functional tests should fully exercise
> +all the functional requirements for a program. Functional testing is
> +complementary to other testing techniques, attempting to find errors like
> +incorrect or missing functions, interface errors, behavior errors, and
> +initialization and termination errors [3]_.
> +
> +On QEMU, functional testing is represented by the 'check-qtest' target from
> +'make'.
> +
> +System testing
> +--------------
> +
> +System tests ensure all application elements mesh properly while the overall
> +functionality and performance are achieved [4]_. Some or all system components
> +are integrated to create a complete system to be tested as a whole. System
> +testing ensures that components are compatible, interact correctly, and
> +transfer the right data at the right time across their interfaces. As system
> +testing focuses on interactions, use case-based testing is a practical approach
> +to system testing [5]_. Note that, in some cases, system testing may require
> +interaction with third-party software, like operating system images, databases,
> +networks, and so on.
> +
> +On QEMU, system testing is represented by the 'check-acceptance' target from
> +'make'.
> +
> +Flaky tests
> +-----------
> +
> +A flaky test is defined as a test that exhibits both a passing and a failing
> +result with the same code on different runs. Some usual reasons for an
> +intermittent/flaky test are async wait, concurrency, and test order dependency
> +[6]_.
> +
> +Gating
> +------
> +
> +A gate restricts the move of code from one stage to another on a
> +test/deployment pipeline. The step move is granted with approval. The approval
> +can be a manual intervention or a set of tests succeeding [7]_.
> +
> +On QEMU, the gating process happens during the pull request. The approval is
> +done by the project leader running its own set of tests. The pull request gets
> +merged when the tests succeed.
> +
> +Continuous Integration (CI)
> +---------------------------
> +
> +Continuous integration (CI) requires the builds of the entire application and
> +the execution of a comprehensive set of automated tests every time there is a
> +need to commit any set of changes [8]_. The automated tests can be composed of
> +the unit, functional, system, and other tests.
> +
> +Keynotes about continuous integration (CI) [9]_:
> +
> +1. System tests may depend on external software (operating system images,
> +   firmware, database, network).
> +2. It may take a long time to build and test. It may be impractical to build
> +   the system being developed several times per day.
> +3. If the development platform is different from the target platform, it may
> +   not be possible to run system tests in the developer’s private workspace.
> +   There may be differences in hardware, operating system, or installed
> +   software. Therefore, more time is required for testing the system.
> +
> +References
> +----------
> +
> +.. [1] Sommerville, Ian (2016). Software Engineering. p. 233.
> +.. [2] Pressman, Roger S. & Maxim, Bruce R. (2020). Software Engineering,
> +       A Practitioner’s Approach. p. 48, 376, 378, 381.
> +.. [3] Pressman, Roger S. & Maxim, Bruce R. (2020). Software Engineering,
> +       A Practitioner’s Approach. p. 388.
> +.. [4] Pressman, Roger S. & Maxim, Bruce R. (2020). Software Engineering,
> +       A Practitioner’s Approach. Software Engineering, p. 377.
> +.. [5] Sommerville, Ian (2016). Software Engineering. p. 59, 232, 240.
> +.. [6] Luo, Qingzhou, et al. An empirical analysis of flaky tests.
> +       Proceedings of the 22nd ACM SIGSOFT International Symposium on
> +       Foundations of Software Engineering. 2014.
> +.. [7] Humble, Jez & Farley, David (2010). Continuous Delivery:
> +       Reliable Software Releases Through Build, Test, and Deployment, p. 122.
> +.. [8] Humble, Jez & Farley, David (2010). Continuous Delivery:
> +       Reliable Software Releases Through Build, Test, and Deployment, p. 55.
> +.. [9] Sommerville, Ian (2016). Software Engineering. p. 743.
> diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
> index a6a650968b..8d95247188 100644
> --- a/docs/devel/ci.rst
> +++ b/docs/devel/ci.rst
> @@ -8,5 +8,6 @@ found at::
>  
>     https://wiki.qemu.org/Testing/CI
>  
> +.. include:: ci-definitions.rst
>  .. include:: ci-jobs.rst
>  .. include:: ci-runners.rst
> 


