Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7693B6A05
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 23:11:40 +0200 (CEST)
Received: from localhost ([::1]:51736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxyXb-0007vN-0s
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 17:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lxyWM-0007Bb-Vh
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 17:10:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lxyWL-00025g-1s
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 17:10:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624914620;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z4I0paWhSRXiURLGwqFnbiXl8ua6GCXB6hyoV4RDopU=;
 b=JFIecQ4CmC1q0or7MR0EWDzBixpRHUxCTc2HAB1+nCnQu/gEUs4vHoJxiIJl+AW3EkHxBQ
 v5sCDM9GQ0VUhpmE8XbaCwCor7RftbHix7Q9zdncX94HqoYrK5F/V2NnX/lTqf454uC5pu
 aT1fB+4vydDGi7QOJtjcS4zwfqt650I=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-GzdGOCECNDeYSjLwCgV06w-1; Mon, 28 Jun 2021 17:09:25 -0400
X-MC-Unique: GzdGOCECNDeYSjLwCgV06w-1
Received: by mail-pf1-f198.google.com with SMTP id
 s15-20020a056a0008cfb0290306b50a28ecso951813pfu.10
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 14:09:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=z4I0paWhSRXiURLGwqFnbiXl8ua6GCXB6hyoV4RDopU=;
 b=qRJVxpFIFZtub4al19drDY+tnGzg6ZqgNpw1q+qFoWXtnUj2AtetvZWQHL9HE1DFwr
 EluU8th5iuJp2z87spY85yq1CgCYLOetB/5s8ZjWSwyyuoXwcPDyZv3a3s0ompm83M4U
 Skw1wlRZDrgr/dDu13NgmgdeWIAChlL6X2emMGctS7cRIyAMPFaS1cP4wcSjf6ulVPg9
 U8mrmw7vJM2VWRRgtLmionWrnicSUbIJS2wFu0hEYO6/kKLlH73TAwZLGFyIjSogQ+gl
 72FCe67061U/C0My984iM5HOT/gkFd+3d979SmBKud6ukOVydv2ZlnP76qDJOFn5C2gL
 BlzQ==
X-Gm-Message-State: AOAM530k7HQTyy7r/rd03pGUgaR8KKFFY4nyISBXt8n0SdEznwrYn1gp
 +CoLwGAdYnzoSaJYvg1RrXtTt1Nl4H9fD4H1Y3fqRHZhFamLvp2ZPC+ZmNDHdjEPAnz9Q43jA8r
 ULJD3cK9r/7ifBEM=
X-Received: by 2002:a17:90a:a383:: with SMTP id
 x3mr34318313pjp.87.1624914564295; 
 Mon, 28 Jun 2021 14:09:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKkqADTgNLvX6dxJjp7Nxh+biLe3W0/I8ScOG+RC6wAzGcUqQFz2GUI+NlcXAi0p6aLbKx9g==
X-Received: by 2002:a17:90a:a383:: with SMTP id
 x3mr34318301pjp.87.1624914564068; 
 Mon, 28 Jun 2021 14:09:24 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id m4sm465177pjv.41.2021.06.28.14.09.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 14:09:23 -0700 (PDT)
Subject: Re: [PATCH 06/11] python: rename 'venv-check' target to 'check-pipenv'
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210625154540.783306-1-jsnow@redhat.com>
 <20210625154540.783306-7-jsnow@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <a8e96d57-b75c-5584-f175-aa2f9337207c@redhat.com>
Date: Mon, 28 Jun 2021 18:09:17 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210625154540.783306-7-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/25/21 12:45 PM, John Snow wrote:
> Well, Cleber was right, this is a better name.
>
> In preparation for adding a different kind of virtual environment check
> (One that simply uses whichever version of Python you happen to have),
> rename this test 'check-pipenv' so that it matches the CI job
> 'check-python-pipenv'.
>
> Remove the "If you don't know which test to run" hint, because it's not
> actually likely you have Python 3.6 installed to be able to run the
> test. It's still the test I'd most prefer you to run, but it's not the
> test you are most likely to be able to run.
>
> Rename the 'venv' target to 'pipenv' as well, and move the more
> pertinent help text under the 'check-pipenv' target.
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/README.rst              |  2 +-
>   .gitlab-ci.d/static_checks.yml |  2 +-
>   python/Makefile                | 21 +++++++++++----------
>   3 files changed, 13 insertions(+), 12 deletions(-)

I also agree pipenv/check-pipenvit is a better name.

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/python/README.rst b/python/README.rst
> index d4502fdb60..9c1fceaee7 100644
> --- a/python/README.rst
> +++ b/python/README.rst
> @@ -79,7 +79,7 @@ Files in this directory
>   - ``PACKAGE.rst`` is used as the README file that is visible on PyPI.org.
>   - ``Pipfile`` is used by Pipenv to generate ``Pipfile.lock``.
>   - ``Pipfile.lock`` is a set of pinned package dependencies that this package
> -  is tested under in our CI suite. It is used by ``make venv-check``.
> +  is tested under in our CI suite. It is used by ``make check-pipenv``.
>   - ``README.rst`` you are here!
>   - ``VERSION`` contains the PEP-440 compliant version used to describe
>     this package; it is referenced by ``setup.cfg``.
> diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_checks.yml
> index 7e685c6a65..8c7dc41abd 100644
> --- a/.gitlab-ci.d/static_checks.yml
> +++ b/.gitlab-ci.d/static_checks.yml
> @@ -33,7 +33,7 @@ check-python-pipenv:
>     stage: test
>     image: $CI_REGISTRY_IMAGE/qemu/python:latest
>     script:
> -    - make -C python venv-check
> +    - make -C python check-pipenv
>     variables:
>       GIT_DEPTH: 1
>     needs:
> diff --git a/python/Makefile b/python/Makefile
> index b5621b0d54..07ad73ccd0 100644
> --- a/python/Makefile
> +++ b/python/Makefile
> @@ -1,15 +1,13 @@
> -.PHONY: help venv venv-check check clean distclean develop
> +.PHONY: help pipenv check-pipenv check clean distclean develop
>   
>   help:
>   	@echo "python packaging help:"
>   	@echo ""
> -	@echo "make venv:       Create pipenv's virtual environment."
> -	@echo "    NOTE: Requires Python 3.6 and pipenv."
> -	@echo "          Will download packages from PyPI."
> -	@echo "    Hint: (On Fedora): 'sudo dnf install python36 pipenv'"
> -	@echo ""
> -	@echo "make venv-check: run linters using pipenv's virtual environment."
> -	@echo "    Hint: If you don't know which test to run, run this one!"
> +	@echo "make check-pipenv:"
> +	@echo "    Run tests in pipenv's virtual environment."
> +	@echo "    These tests use the oldest dependencies."
> +	@echo "    Requires: Python 3.6 and pipenv."
> +	@echo "    Hint (Fedora): 'sudo dnf install python3.6 pipenv'"
>   	@echo ""
>   	@echo "make develop:    Install deps for 'make check', and"
>   	@echo "                 the qemu libs in editable/development mode."
> @@ -18,18 +16,21 @@ help:
>   	@echo ""
>   	@echo "make check-tox:  run linters using multiple python versions."
>   	@echo ""
> +	@echo "make pipenv"
> +	@echo "    Creates pipenv's virtual environment (.venv)"
> +	@echo ""
>   	@echo "make clean:      remove package build output."
>   	@echo ""
>   	@echo "make distclean:  remove venv files, qemu package forwarder,"
>   	@echo "                 built distribution files, and everything"
>   	@echo "                 from 'make clean'."
>   
> -venv: .venv
> +pipenv: .venv
>   .venv: Pipfile.lock
>   	@PIPENV_VENV_IN_PROJECT=1 pipenv sync --dev --keep-outdated
>   	@touch .venv
>   
> -venv-check: venv
> +check-pipenv: pipenv
>   	@pipenv run make check
>   
>   develop:


