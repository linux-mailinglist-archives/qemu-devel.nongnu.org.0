Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B7F361939
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 07:24:43 +0200 (CEST)
Received: from localhost ([::1]:34278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXGyA-000553-M8
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 01:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lXGwu-0004Rk-8u
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 01:23:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lXGws-00069a-8v
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 01:23:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618550601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WOSfVC7il4gc1ewBCJ9FmNOjadXgDLIJwPUXWtiBz7w=;
 b=FQvPePemDaxTzo7dLeQbTVroNzPQ0MLSkjnmdJR9kMto0T3cSwEc6JekVzzEhvyGLE+7wv
 nNEy00ARGIAQIq4lHpXYOJwXhpAaKaewwrSHglj3fYWTiQEK20EfUggaTfuk4kgYPeehGr
 9RKALp0H9e0IVQZ8iGmieyaBQZH0pRo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-Xv0twBnDPzmvSEsX6q_55A-1; Fri, 16 Apr 2021 01:23:17 -0400
X-MC-Unique: Xv0twBnDPzmvSEsX6q_55A-1
Received: by mail-wr1-f70.google.com with SMTP id
 y13-20020adfdf0d0000b02901029a3bf796so3873836wrl.15
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 22:23:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WOSfVC7il4gc1ewBCJ9FmNOjadXgDLIJwPUXWtiBz7w=;
 b=lFYe7NKccU7vTfmkNHDyUAxEjN5KBtgowUQjuMGQFbIFpAC4HKGvZROA7YfQSN+WJP
 LWE/GjoytMWQio1dm+dkbPre8FS2vPOg4p0aeSsL//lZ6MY8l64DBYjqW9Dg7dpPx0Uq
 PB7KqKYQ/qUQEeYikzcAj1zsIkIKkiT4V5Ui2JhJxBeN/LBgR8/SOV4UjxmCosw7ELcl
 ENyg/oUgFugnAsBsBfqQ1LJRgS6zknTcY2KWlQzWgEyva62dsnK7eKOULLvcRJ5uv/17
 M6RmbWMGofVIXuuAnI2chTfpTEi0UUnmAsejv1hawxqJ8p+lLm8NtDBh58EeTBCLbGn6
 qeEg==
X-Gm-Message-State: AOAM531MX2VMuwiXlckXAVCC5QOrmF/V1axd7q/X7asmrkJy0ZxZloAb
 pba8sh57tdyuRW2jVUCBwW3U5+7KEJyRWIvKlDtgjat+Ucet4NsGsKOEyDKRVUyEnfNR8mEt4Um
 KdPs76WCc1x16QXc=
X-Received: by 2002:adf:bc09:: with SMTP id s9mr6824837wrg.329.1618550596171; 
 Thu, 15 Apr 2021 22:23:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAKMRCsf6Q4yOQ5O/BmPee/fdSt+RGyE0ccJKa+61/msOuWH/2s6xk4v7GC5G4KPiCpHpLzQ==
X-Received: by 2002:adf:bc09:: with SMTP id s9mr6824805wrg.329.1618550595932; 
 Thu, 15 Apr 2021 22:23:15 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id c18sm8119163wrn.92.2021.04.15.22.23.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 22:23:15 -0700 (PDT)
Subject: Re: [PATCH 8/8] Tests: add custom test jobs
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210415215141.1865467-1-crosa@redhat.com>
 <20210415215141.1865467-9-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e71737f7-4717-06ce-54c8-fbb82167dd8d@redhat.com>
Date: Fri, 16 Apr 2021 07:23:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210415215141.1865467-9-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cleber,

On 4/15/21 11:51 PM, Cleber Rosa wrote:
> Different users (or even companies) have different interests, and
> may want to run a reduced set of tests during development, or a
> larger set of tests during QE.
> 
> To cover these use cases, some example (but functional) jobs are
> introduced here:
> 
> 1) acceptance-all-targets.py: runs all arch agnostic tests on all
>    built targets, unless there are conditions that make them not work
>    out of the box ATM, then run all tests that are specific to
>    predefined targets.
> 
> 2) acceptance-kvm-only.py: runs only tests that require KVM and are
>    specific to the host architecture.
> 
> 3) qtest-unit.py: runs a combination of qtest and unit tests (in
>    parallel).
> 
> 4) qtest-unit-acceptance.py: runs a combineation of qtest, unit tests

Typo "combination".

>    and acceptance tests (all of them in parallel)
> 
> To run the first two manually, follow the example bellow:
> 
>  $ cd build
>  $ make check-venv
>  $ ./tests/venv/bin/python3 tests/jobs/acceptance-all-targets.py
>  $ ./tests/venv/bin/python3 tests/jobs/acceptance-kvm-only.py
> 
> The third and fouth example depends on information coming from Meson,
> so the easiest way to run it is:
> 
>  $ cd build
>  $ make check-qtest-unit
>  $ make check-qtest-unit-acceptance
> 
> These are based on Avocado's Job API, a way to customize an Avocado
> job execution beyond the possibilities of command line arguments.
> For more Job API resources, please refer to:
> 
> a) Job API Examples:
>  - https://github.com/avocado-framework/avocado/tree/master/examples/jobs
> 
> b) Documentation about configurable features at the Job Level:
>  - https://avocado-framework.readthedocs.io/en/87.0/config/index.html
> 
> c) Documentation about the TestSuite class
>  - https://avocado-framework.readthedocs.io/en/87.0/api/core/avocado.core.html#avocado.core.suite.TestSuite
> 
> d) Documentation about the Job class
>  - https://avocado-framework.readthedocs.io/en/87.0/api/core/avocado.core.html#avocado.core.job.Job
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  configure                            |  2 +-
>  tests/Makefile.include               |  8 ++++
>  tests/jobs/acceptance-all-targets.py | 67 ++++++++++++++++++++++++++++
>  tests/jobs/acceptance-kvm-only.py    | 35 +++++++++++++++
>  tests/jobs/qtest-unit-acceptance.py  | 31 +++++++++++++
>  tests/jobs/qtest-unit.py             | 24 ++++++++++
>  tests/jobs/utils.py                  | 22 +++++++++
>  7 files changed, 188 insertions(+), 1 deletion(-)
>  create mode 100644 tests/jobs/acceptance-all-targets.py
>  create mode 100644 tests/jobs/acceptance-kvm-only.py
>  create mode 100644 tests/jobs/qtest-unit-acceptance.py
>  create mode 100644 tests/jobs/qtest-unit.py
>  create mode 100644 tests/jobs/utils.py

> +if __name__ == '__main__':
> +    sys.exit(main())
> diff --git a/tests/jobs/acceptance-kvm-only.py b/tests/jobs/acceptance-kvm-only.py
> new file mode 100644
> index 0000000000..acdcbbe087
> --- /dev/null
> +++ b/tests/jobs/acceptance-kvm-only.py
> @@ -0,0 +1,35 @@
> +#!/usr/bin/env python3
> +
> +import os
> +import sys
> +
> +# This comes from tests/acceptance/avocado_qemu/__init__.py and should
> +# not be duplicated here.  The solution is to have the "avocado_qemu"
> +# code and "python/qemu" available during build
> +BUILD_DIR = os.path.dirname(os.path.dirname(os.path.dirname(__file__)))
> +if os.path.islink(os.path.dirname(os.path.dirname(__file__))):
> +    # The link to the acceptance tests dir in the source code directory
> +    lnk = os.path.dirname(os.path.dirname(__file__))
> +    #: The QEMU root source directory
> +    SOURCE_DIR = os.path.dirname(os.path.dirname(os.readlink(lnk)))
> +else:
> +    SOURCE_DIR = BUILD_DIR
> +sys.path.append(os.path.join(SOURCE_DIR, 'python'))
> +
> +from avocado.core.job import Job
> +
> +from qemu.accel import kvm_available
> +
> +
> +def main():
> +    if not kvm_available():
> +        sys.exit(0)
> +
> +    config = {'run.references': ['tests/acceptance/'],
> +              'filter.by_tags.tags': ['accel:kvm,arch:%s' % os.uname()[4]]}

If we want forks to use their own set of tags, it would be better to
provide an uniform way, not adding new test entry point for each set
of fork tags. Could we consume a YAML config file instead? And provide
templates so forks could adapt to their needs?

Thanks,

Phil.


