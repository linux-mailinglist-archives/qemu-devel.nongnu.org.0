Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DDC39FF4E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 20:31:16 +0200 (CEST)
Received: from localhost ([::1]:36476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqgVO-0002d4-Sd
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 14:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lqgTT-0001fG-Vi
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 14:29:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lqgTR-00028X-H1
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 14:29:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623176952;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H+42jvHgeX/DL3Z3UUraE8lOEF2hf3OsADNqK597gLI=;
 b=b4pNi53UYd6nj+OuMVCmxfHh2AokZf3fktgrluUWxpdslCyMYRG/8krDhIx4iHAF5sba+h
 WaMpzdaDkVUNFODF6uDY1FX9RI7otX9aAifA+c3BRs9B0C6/RFB9aG70I/DEJf5/spJNeP
 t2jNdRjiDc37odWa0SyRrYYpGjIBXyI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-ntm1LVlgOSewXcKbjY3oQA-1; Tue, 08 Jun 2021 14:29:08 -0400
X-MC-Unique: ntm1LVlgOSewXcKbjY3oQA-1
Received: by mail-qk1-f197.google.com with SMTP id
 k15-20020a05620a138fb02903aadd467ff1so3238760qki.7
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 11:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=H+42jvHgeX/DL3Z3UUraE8lOEF2hf3OsADNqK597gLI=;
 b=DR7eAcjUFzRgjoNCU4qfI3SBaY5tUxCgbW4B8sAb44NbFEWKnhJizaWJhbEwdZexVe
 m8S97GNci5wPTztjxa/j9kRpPjzZm4L/4huk5ETjMpLnJ6aQjIK7kS5vgr+cDXYvL4Gt
 9d6IYq7FyCr2WMbRdMx2NOXJ9cDHwBeriSdZtCwhL0j7oKL160yvln+vgF/wH7TSxOhL
 qIPU4basI2hoPbPSV+qVG4N4gTJlnikXTxUR2aU7uC+a0Wc6KMk1QBYduSuZ5D6bS9c+
 i7LJCtmcZBJv93E1WtmSKzsd2zGfLWlVh2z7ZZp580luVMCVLWbghcoX63K58xZQUEMA
 LhUQ==
X-Gm-Message-State: AOAM532t4b5Q3qCCRsJ5g22GtcK7nCR9HApLAf3jhnGSYruH7tnE5Cuz
 gEiwJluNm2Mt4r92h3F7oWF9vJlQeqSarkqPDJthGPTrMHVKOkuJxmp35dh9YvTO7dgjMdQyf7z
 X5AKIP/YLCW0xKgc=
X-Received: by 2002:a05:620a:9d2:: with SMTP id
 y18mr14149520qky.172.1623176948164; 
 Tue, 08 Jun 2021 11:29:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFCN394iltIPJkTN+K8RzwRpFUnOZR0pQXUXwP1lmAPSc33En7bp6Zdc8/sy/c0yrI1jVHqA==
X-Received: by 2002:a05:620a:9d2:: with SMTP id
 y18mr14149509qky.172.1623176947947; 
 Tue, 08 Jun 2021 11:29:07 -0700 (PDT)
Received: from wainer-laptop.localdomain ([201.90.138.4])
 by smtp.gmail.com with ESMTPSA id f8sm12722759qko.131.2021.06.08.11.29.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 11:29:07 -0700 (PDT)
Subject: Re: [PATCH v6 1/4] Jobs based on custom runners: documentation and
 configuration placeholder
To: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-2-crosa@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <334140a9-05fa-d938-048c-c85d7ecf662c@redhat.com>
Date: Tue, 8 Jun 2021 15:29:00 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210608031425.833536-2-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Reply-To: wainersm@redhat.com
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/8/21 12:14 AM, Cleber Rosa wrote:
> As described in the included documentation, the "custom runner" jobs
> extend the GitLab CI jobs already in place.  One of their primary
> goals of catching and preventing regressions on a wider number of host
> systems than the ones provided by GitLab's shared runners.
>
> This sets the stage in which other community members can add their own
> machine configuration documentation/scripts, and accompanying job
> definitions.  As a general rule, those newly added contributed jobs
> should run as "non-gating", until their reliability is verified (AKA
> "allow_failure: true").
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   .gitlab-ci.d/custom-runners.yml | 14 ++++++++++++++
>   .gitlab-ci.d/qemu-project.yml   |  1 +
>   docs/devel/ci.rst               | 28 ++++++++++++++++++++++++++++
>   docs/devel/index.rst            |  1 +
>   4 files changed, 44 insertions(+)
>   create mode 100644 .gitlab-ci.d/custom-runners.yml
>   create mode 100644 docs/devel/ci.rst


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
> new file mode 100644
> index 0000000000..a07b27384c
> --- /dev/null
> +++ b/.gitlab-ci.d/custom-runners.yml
> @@ -0,0 +1,14 @@
> +# The CI jobs defined here require GitLab runners installed and
> +# registered on machines that match their operating system names,
> +# versions and architectures.  This is in contrast to the other CI
> +# jobs that are intended to run on GitLab's "shared" runners.
> +
> +# Different than the default approach on "shared" runners, based on
> +# containers, the custom runners have no such *requirement*, as those
> +# jobs should be capable of running on operating systems with no
> +# compatible container implementation, or no support from
> +# gitlab-runner.  To avoid problems that gitlab-runner can cause while
> +# reusing the GIT repository, let's enable the clone strategy, which
> +# guarantees a fresh repository on each job run.
> +variables:
> +  GIT_STRATEGY: clone
> diff --git a/.gitlab-ci.d/qemu-project.yml b/.gitlab-ci.d/qemu-project.yml
> index 64cb2ba1da..dde8270301 100644
> --- a/.gitlab-ci.d/qemu-project.yml
> +++ b/.gitlab-ci.d/qemu-project.yml
> @@ -9,3 +9,4 @@ include:
>     - local: '/.gitlab-ci.d/crossbuilds.yml'
>     - local: '/.gitlab-ci.d/buildtest.yml'
>     - local: '/.gitlab-ci.d/static_checks.yml'
> +  - local: '/.gitlab-ci.d/custom-runners.yml'
> diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
> new file mode 100644
> index 0000000000..585b7bf4b8
> --- /dev/null
> +++ b/docs/devel/ci.rst
> @@ -0,0 +1,28 @@
> +==
> +CI
> +==
> +
> +QEMU has configurations enabled for a number of different CI services.
> +The most up to date information about them and their status can be
> +found at::
> +
> +   https://wiki.qemu.org/Testing/CI
> +
> +Jobs on Custom Runners
> +======================
> +
> +Besides the jobs run under the various CI systems listed before, there
> +are a number additional jobs that will run before an actual merge.
> +These use the same GitLab CI's service/framework already used for all
> +other GitLab based CI jobs, but rely on additional systems, not the
> +ones provided by GitLab as "shared runners".
> +
> +The architecture of GitLab's CI service allows different machines to
> +be set up with GitLab's "agent", called gitlab-runner, which will take
> +care of running jobs created by events such as a push to a branch.
> +Here, the combination of a machine, properly configured with GitLab's
> +gitlab-runner, is called a "custom runner".
> +
> +The GitLab CI jobs definition for the custom runners are located under::
> +
> +  .gitlab-ci.d/custom-runners.yml
> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> index 791925dcda..c9a02e786e 100644
> --- a/docs/devel/index.rst
> +++ b/docs/devel/index.rst
> @@ -27,6 +27,7 @@ Contents:
>      migration
>      atomics
>      stable-process
> +   ci
>      qtest
>      decodetree
>      secure-coding-practices


